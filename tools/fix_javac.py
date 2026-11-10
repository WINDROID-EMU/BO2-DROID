#!/usr/bin/env python3
"""Reparos mecânicos nos fontes descompilados.

O jadx adiciona `throws` em métodos que sobrescrevem a API do Android (ilegal
em Java) e marca como `final` variáveis locais que o bytecode reatribui.
Este script lê os erros do javac (arquivo de log) e corrige os dois casos.

Uso: python3 tools/fix_javac.py /caminho/javac.log
"""
import re
import sys

THROWS = re.compile(r"\s+throws\s+[\w.$,\s]+?(?=\s*\{)")
OVERRIDE = re.compile(r"error: .* (?:cannot override|cannot implement) ")
FINAL_ASSIGN = re.compile(r"error: cannot assign a value to final variable (\w+)")


def strip_throws(path, line_no):
    lines = open(path, encoding="utf-8").read().splitlines(keepends=True)
    i = line_no - 1
    if i >= len(lines):
        return False
    new = THROWS.sub("", lines[i])
    if new == lines[i]:
        return False
    lines[i] = new
    open(path, "w", encoding="utf-8").write("".join(lines))
    return True


def drop_final(path, line_no, name):
    lines = open(path, encoding="utf-8").read().splitlines(keepends=True)
    decl = re.compile(r"\bfinal\s+([\w.$<>\[\]]+)\s+" + re.escape(name) + r"\b")
    for i in range(line_no - 1, -1, -1):
        if decl.search(lines[i]):
            lines[i] = decl.sub(r"\1 " + name, lines[i], count=1)
            open(path, "w", encoding="utf-8").write("".join(lines))
            return True
    return False


def main(log):
    fixes = 0
    seen = set()
    for line in open(log, encoding="utf-8", errors="replace"):
        m = re.match(r"^(/.+?\.java):(\d+): error: (.*)$", line)
        if not m:
            continue
        path, no, msg = m.group(1), int(m.group(2)), m.group(3)
        key = (path, no, msg)
        if key in seen:
            continue
        seen.add(key)
        if OVERRIDE.search("error: " + msg):
            fixes += strip_throws(path, no)
        else:
            fm = FINAL_ASSIGN.search("error: " + msg)
            if fm:
                fixes += drop_final(path, no, fm.group(1))
    print("correções aplicadas:", fixes)


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "/tmp/javac.log")
