#!/usr/bin/env python3
"""Repair the try/finally damage left by jadx.

jadx loses the `finally` block and leaves the resource close call as the last
statement of the try body:

    try {
        out.write(...);
        out.close();      <- only runs on the success path
    } finally {
    }

That is both wrong (no close when the body throws) and the reason jadx then
fabricates `throws IOException` on the enclosing method. This script moves the
trailing close into the empty finally.
"""
import glob
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FAB = os.path.join(ROOT, "app", "src", "main", "java", "org", "wiiucoop", "bo2android")

EMPTY_FINALLY = re.compile(r"\} finally \{\s*\}")
CLOSE_STMT = re.compile(
    r"\n(?P<indent>[ \t]*)"
    r"(?:(?:if \((?P<var>[\w.$]+) != null\) \{)\s*\n[ \t]*(?P=var)\.close\(\);\s*\n[ \t]*\}"
    r"|(?P<var2>[\w.$]+)\.close\(\);)\s*$"
)


def match_open_brace(text, close_index):
    depth = 0
    i = close_index
    while i >= 0:
        c = text[i]
        if c == "}":
            depth += 1
        elif c == "{":
            depth -= 1
            if depth == 0:
                return i
        i -= 1
    return -1


def line_indent(text, index):
    start = text.rfind("\n", 0, index) + 1
    return re.match(r"[ \t]*", text[start:]).group(0)


def repair(text):
    changed = 0
    pos = 0
    while True:
        m = EMPTY_FINALLY.search(text, pos)
        if not m:
            break
        body_close = m.start()
        brace = match_open_brace(text, body_close)
        if brace < 0 or not re.search(r"try\s*$", text[:brace]):
            pos = m.end()
            continue
        body = text[brace + 1:body_close]
        cm = CLOSE_STMT.search(body)
        if not cm:
            pos = m.end()
            continue
        close_call = (cm.group("var") or cm.group("var2")) + ".close();"
        indent = line_indent(text, brace) + "    "
        new_body = body[:cm.start()] + "\n"
        replacement = (
            new_body
            + line_indent(text, body_close) + "} finally {\n"
            + indent + close_call + "\n"
            + line_indent(text, brace) + "}"
        )
        text = text[:brace + 1] + replacement + text[m.end():]
        changed += 1
        pos = brace + 1
    return text, changed


def main():
    total = 0
    for path in sorted(glob.glob(os.path.join(FAB, "*.java"))):
        src = open(path, encoding="utf-8").read()
        if "finally {" not in src:
            continue
        out, n = repair(src)
        if n:
            open(path, "w", encoding="utf-8").write(out)
            total += n
            print(f"{os.path.basename(path)}: {n} finally block(s) repaired")
    print(f"\n{total} repaired")
    return 0 if total else 1


if __name__ == "__main__":
    sys.exit(main())
