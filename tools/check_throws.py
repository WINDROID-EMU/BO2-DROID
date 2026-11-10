#!/usr/bin/env python3
"""Cross-check `throws` clauses in the decompiled Java against the smali
`dalvik/annotation/Throws` metadata.

jadx fabricates `throws IOException` whenever its try/finally reconstruction
leaves an uncovered rethrow, which produces declarations the original code did
not have. Anything reported here as `NOT IN SMALI` is a fabrication and must be
repaired by restoring the try/catch structure instead of declaring the throw.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
JAVA = os.path.join(ROOT, "app", "src", "main", "java")
SMALI_DIRS = glob.glob(os.path.join(ROOT, "work", "apktool", "smali*"))


def smali_throws():
    """class name -> set(names of methods with a Throws annotation)"""
    out = {}
    for d in SMALI_DIRS:
        for path in glob.glob(os.path.join(d, "**", "*.smali"), recursive=True):
            cls = re.sub(r"\.smali$", "", os.path.basename(path)).replace("$", "$")
            names = set()
            cur = None
            for line in open(path, encoding="utf-8", errors="replace"):
                m = re.match(r"\.method .*? ([\w$<>]+)\(", line)
                if m:
                    cur = m.group(1)
                elif "annotation system Ldalvik/annotation/Throws" in line and cur:
                    names.add(cur)
            out.setdefault(cls, set()).update(names)
    return out


METHOD = re.compile(
    r"^\s*(?:public |private |protected |static |final |abstract |synchronized |native |"
    r"default |strictfp )*[\w$<>\[\], .?]+\s+([\w$<>]+)\s*\([^;{]*?\)\s*throws ([^{;]+)\{",
    re.M,
)


def main():
    smali = smali_throws()
    problems = []
    for path in glob.glob(os.path.join(JAVA, "**", "*.java"), recursive=True):
        cls = os.path.basename(path)[:-5]
        if cls not in smali:
            continue
        src = open(path, encoding="utf-8").read()
        for m in METHOD.finditer(src):
            method, thrown = m.group(1), m.group(2).strip()
            checked = [t for t in re.split(r"\s*,\s*", thrown)
                       if not t.endswith(("RuntimeException", "Error", "NumberFormatException"))]
            if not checked:
                continue
            if method not in smali[cls]:
                line = src.count("\n", 0, m.start()) + 1
                problems.append((os.path.relpath(path, ROOT), line, method, thrown))
    for path, line, method, thrown in problems:
        print(f"{path}:{line}: {method} throws {thrown}  [NOT IN SMALI]")
    print(f"\n{len(problems)} fabricated throws clause(s)")
    return 1 if problems else 0


if __name__ == "__main__":
    sys.exit(main())
