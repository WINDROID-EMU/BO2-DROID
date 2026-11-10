#!/usr/bin/env python3
"""Reconstrói as classes de lambda que o R8/D8 desugou no APK original.

O APK foi compilado com desugaring de lambdas: cada expressão lambda virou uma
classe sintética `X$$ExternalSyntheticLambdaN`. O jadx não gera código para
essas classes (marca como DONT_GENERATE), então as referências ficam pendentes
e o projeto não compila.

Este script lê o smali produzido pelo apktool e recria, para cada classe
sintética, uma classe Java equivalente (campo capturado + construtor + método
da interface delegando ao método sintético do código-fonte original).

Uso:  python3 tools/regen_lambdas.py
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SMALI_GLOB = os.path.join(ROOT, "work/apktool/smali*/org/wiiucoop/bo2android/*ExternalSyntheticLambda*.smali")
JAVA_ROOT = os.path.join(ROOT, "app/src/main/java")
OUT_DIR = os.path.join(JAVA_ROOT, "org/wiiucoop/bo2android")

PRIM = {
    "V": "void", "Z": "boolean", "B": "byte", "S": "short", "C": "char",
    "I": "int", "J": "long", "F": "float", "D": "double",
}


def jtype(desc):
    if desc in PRIM:
        return PRIM[desc]
    if desc.startswith("["):
        return jtype(desc[1:]) + "[]"
    if desc.startswith("L") and desc.endswith(";"):
        return desc[1:-1].replace("/", ".").replace("$", ".")
    raise ValueError("descritor desconhecido: " + desc)


def split_params(desc):
    out, i = [], 0
    while i < len(desc):
        start = i
        while desc[i] == "[":
            i += 1
        if desc[i] == "L":
            i = desc.index(";", i)
        i += 1
        out.append(desc[start:i])
    return out


def split_params_str(params):
    """'Landroid/view/View;IIIIIIII' -> lista de descritores."""
    return split_params(params)


def java_ident(name):
    """Nome de método/classe válido em Java; jadx já renomeou os inválidos."""
    return name.replace("-", "_")


class JavaNames:
    """Mapeia nomes smali renomeados pelo jadx para os nomes no Java gerado."""

    def __init__(self):
        self.map = {}
        pat = re.compile(r"/\* renamed from: ([\w$.\-]+), reason:[^*]*\*/\s*(?:/\*[^*]*\*/\s*)*[\w$<>\[\].]+\s+([\w$]+)\s*\(")
        for path in glob.glob(os.path.join(JAVA_ROOT, "**/*.java"), recursive=True):
            pkg = re.search(r"^package ([\w.]+);", open(path, encoding="utf-8").read(), re.M)
            if not pkg:
                continue
            cls = os.path.basename(path)[:-5]
            # nome interno: T6Logs$Buffer para classes aninhadas
            simple = path[len(os.path.join(JAVA_ROOT, pkg.group(1).replace(".", "/"))) + 1:-5].replace("/", "$")
            text = open(path, encoding="utf-8").read()
            for old, new in pat.findall(text):
                self.map[(simple, old)] = new
                self.map[(cls, old)] = new

    def method(self, internal_class, smali_name):
        key = internal_class.replace("/", ".")
        simple = internal_class.split("/")[-1]
        for k in (simple, simple.replace("$", "."), key):
            if (k, smali_name) in self.map:
                return self.map[(k, smali_name)]
        if "-" in smali_name:
            raise KeyError("método renomeado não encontrado: %s.%s" % (internal_class, smali_name))
        return smali_name


NAMES = None


def parse_registers(text):
    body = text.strip()
    if ".." in body:
        a, b = body.strip("{} ").split("..")
        return [r.strip() for r in range_regs(a.strip(), b.strip())]
    return [r.strip() for r in body.strip("{} ").split(",") if r.strip()]


def range_regs(a, b):
    prefix = a[0]
    n1, n2 = int(a[1:]), int(b[1:])
    return ["%s%d" % (prefix, i) for i in range(n1, n2 + 1)]


class Translator:
    def __init__(self, fields, params, parent):
        self.fields = fields          # nome -> tipo java
        self.expr = {"p0": "this"}
        for p in params:              # nomes de registradores dos parâmetros (p1, p2, p4...)
            self.expr[p] = p
        self.stmts = []
        self.pending = None           # expressão de invoke aguardando move-result
        self.news = {}                # registro -> tipo alocado por new-instance
        self.ret = "void"

    def val(self, reg):
        if reg not in self.expr:
            raise KeyError("registro sem valor: " + reg)
        return self.expr[reg]

    def flush(self):
        if self.pending:
            self.stmts.append(self.pending + ";")
            self.pending = None

    def args(self, regs, descs):
        out, i = [], 0
        for d in descs:
            if i >= len(regs):
                break
            out.append(self.val(regs[i]))
            i += 2 if d in ("J", "D") else 1
        return out

    def call(self, target, name, descs, regs, is_static):
        rparams, rret = split_params(descs.rsplit(")", 1)[0].lstrip("(")), descs.rsplit(")", 1)[1]
        if "<init>" in name:
            new_type = jtype(target)
            args = ", ".join(self.args(regs[1:], rparams))
            self.flush()
            self.pending = "new %s(%s)" % (new_type, args)
            return None
        jname = NAMES.method(target[1:-1], name) if target.startswith("L") and target.endswith(";") else name
        jt = jtype(target)
        if is_static:
            args = self.args(regs, rparams)
            expr = "%s.%s(%s)" % (jt, jname, ", ".join(args))
        else:
            recv = self.val(regs[0])
            recv_type = self.field_type_of(recv)
            if recv_type and recv_type != jt:
                recv = "((%s) %s)" % (jt, recv)
            args = self.args(regs[1:], rparams)
            expr = "%s.%s(%s)" % (recv, jname, ", ".join(args))
        self.flush()
        if rret == "V":
            self.stmts.append(expr + ";")
            return None
        self.pending = expr
        return rret

    def field_type_of(self, expr):
        m = re.fullmatch(r"(?:this\.)(f\$\d+)", expr)
        if m and m.group(1) in self.fields:
            return self.fields[m.group(1)]
        m = re.fullmatch(r"this\.([\w$]+)", expr)
        return None

    def translate(self, lines):
        for raw in lines:
            s = raw.split("#")[0].strip()
            if not s or s.startswith((".", ":", '"')):
                continue
            op = s.split()[0]
            rest = s[len(op):].strip()
            if op in ("move", "move-object", "move-wide", "move/from16", "move-object/from16", "move-wide/from16", "move/16"):
                a, b = [x.strip() for x in rest.split(",")]
                self.expr[a] = self.val(b)
            elif op in ("iget-object", "iget", "iget-boolean", "iget-wide", "iget-short", "iget-byte", "iget-char"):
                a, obj, fld = [x.strip() for x in rest.split(",")]
                self.expr[a] = "%s.%s" % (self.val(obj), fld.split("->")[-1].split(":")[0])
            elif op == "check-cast":
                a, t = [x.strip() for x in rest.split(",")]
                self.expr[a] = "((%s) %s)" % (jtype(t), self.val(a))
            elif op == "new-instance":
                a, t = [x.strip() for x in rest.split(",")]
                self.news[a] = jtype(t)
            elif op.startswith("invoke-"):
                m = re.match(r"(.+?)\},?\s*(L[^;]+;)->(.+)$", rest)
                if not m:
                    m = re.match(r"(.+?)\}\s*,?\s*(L[^;]+;)->(.+)$", rest, re.S)
                regs = parse_registers(m.group(1))
                target, sig = m.group(2).strip(), m.group(3).strip()
                name, dsig = sig.split("(", 1)
                self.call(target, name, "(" + dsig, regs, op.startswith("invoke-static"))
            elif op in ("move-result", "move-result-object", "move-result-wide"):
                a = rest.strip()
                if self.pending is None:
                    raise ValueError("move-result sem invoke em " + " ".join(lines))
                self.expr[a] = self.pending
                self.pending = None
            elif op in ("const-string", "const-string/jumbo"):
                a, _, lit = rest.partition(",")
                self.expr[a.strip()] = lit.strip()
            elif op.startswith("const"):
                a, _, lit = rest.partition(",")
                lit = lit.strip()
                self.expr[a.strip()] = lit.replace("0x", "0x") if lit.startswith("0x") else lit
            elif op == "sget-object" or op == "sget":
                a, _, fld = [x.strip() for x in rest.split(",")]
                t, n = fld.split("->")
                self.expr[a] = "%s.%s" % (jtype(t), n.split(":")[0])
            elif op == "return-void":
                self.flush()
                self.stmts.append("return;")
            elif op in ("return", "return-object", "return-wide"):
                self.flush()
                self.stmts.append("return %s;" % self.val(rest.strip()))
            elif op == "nop":
                pass
            else:
                raise ValueError("instrução não suportada: " + s)
        self.flush()
        return "\n".join("        " + s for s in self.stmts)


def convert(path):
    text = open(path, encoding="utf-8").read()
    cls = re.search(r"^\.class [^\n]* (L[^;]+;)", text, re.M).group(1)
    internal = cls[1:-1]
    simple = internal.split("/")[-1]
    pkg = internal.split("/")[:-1]
    ifaces = [jtype(m) for m in re.findall(r"^\.implements (L[^;]+;)", text, re.M)]
    fields = []
    for name, desc in re.findall(r"^\.field [^\n]*?([\w$]+):(\S+)", text, re.M):
        fields.append((name, jtype(desc)))
    ctor = None
    sam = None
    for block in re.findall(r"\.method ([^\n]*)\n(.*?)\.end method", text, re.S):
        sig, body = block
        if "<init>" in sig:
            ctor = (sig, body)
        else:
            sam = (sig, body)
    if ctor is None or sam is None:
        raise ValueError("estrutura inesperada em " + path)
    # parâmetros do construtor
    csig = ctor[0]
    cparams = split_params_str(re.search(r"\(([^)]*)\)", csig).group(1))
    samsig = sam[0]
    ret = re.search(r"\)(\S+)$", samsig).group(1)
    pstr = re.search(r"\(([^)]*)\)", samsig).group(1)
    sp = split_params_str(pstr)
    # registradores dos parâmetros: J/D ocupam dois registradores no smali
    preg, sam_names, sam_decls = 1, [], []
    for d in sp:
        sam_names.append("p%d" % preg)
        sam_decls.append("%s p%d" % (jtype(d), preg))
        preg += 2 if d in ("J", "D") else 1
    samname = samsig.split("(")[0].split()[-1]
    # corpo do construtor: iput pN -> f$M
    assigns = []
    for ins in ctor[1].splitlines():
        m = re.match(r"\s*(iput\S*)\s+(p\d+),\s*p0,\s*L[^;]+;->([\w$]+):(\S+)", ins)
        if m:
            assigns.append((m.group(3), m.group(2)))
    fdecl = "\n".join("    public final %s %s;" % (t, n) for n, t in fields)
    ctor_args = ", ".join("%s a%d" % (jtype(d), i) for i, d in enumerate(cparams))
    # registradores dos parâmetros do construtor -> nomes Java (a0, a1, ...)
    cmap, creg = {}, 1
    for i, d in enumerate(cparams):
        cmap["p%d" % creg] = "a%d" % i
        creg += 2 if d in ("J", "D") else 1
    ctor_body = "\n".join("        this.%s = %s;" % (f, cmap.get(p, p)) for f, p in assigns)
    tr = Translator(dict(fields), sam_names, simple)
    tr.ret = ret
    body = tr.translate(sam[1].splitlines())
    method_args = ", ".join(sam_decls)
    out = """package %s;

/* Reconstruída a partir do smali: classe de lambda gerada pelo R8/D8
 * (%s). Corresponde à expressão lambda original no código-fonte. */
public final class %s implements %s {
%s

    public %s(%s) {
%s
    }

    @Override
    public %s %s(%s) {
%s
    }
}
""" % (
        ".".join(pkg), path.replace(ROOT + os.sep, ""), simple, ", ".join(ifaces),
        fdecl, simple, ctor_args, ctor_body, jtype(ret), samname, method_args, body,
    )
    dest = os.path.join(OUT_DIR, simple + ".java")
    open(dest, "w", encoding="utf-8").write(out)
    return dest


def main():
    global NAMES
    NAMES = JavaNames()
    ok, fail = 0, []
    for path in sorted(glob.glob(SMALI_GLOB)):
        try:
            convert(path)
            ok += 1
        except Exception as e:  # noqa: BLE001
            fail.append((os.path.basename(path), str(e)))
    print("geradas: %d" % ok)
    for name, err in fail:
        print("FALHOU %s: %s" % (name, err))
    return 1 if fail else 0


if __name__ == "__main__":
    sys.exit(main())
