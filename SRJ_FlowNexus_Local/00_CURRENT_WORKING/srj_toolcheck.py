"""srj_toolcheck.py - lane helper for the SRJ tool-stack (AGENTS.md 6.37).

Two jobs, stdlib only, ASCII only:
  next  -> ledger stats for SRJ_FLOW_NEXUS_LEDGER.md (LINES, NUMBERED, MAX,
             NEXT = MAX+1, DUPES, BYTES). NEXT is computed, never remembered.
  hash  -> SHA256 + BYTES for each given file, one per line.

Paths must be ABSOLUTE (invariant 6.2). Relative paths fail closed.
Run by full literal python path; Temp staging not needed - this file IS staged.
"""
import hashlib
import os
import re
import sys

LEDGER = (r"C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal"
          r"\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5"
          r"\SRJ_FlowNexus_Local\06_HANDOFFS\SRJ_FLOW_NEXUS_LEDGER.md")

ITEM = re.compile(r"^(\d+)\.\s")


def cmd_next():
    with open(LEDGER, "r", encoding="utf-8") as f:
        lines = f.read().split("\n")
    numbers = []
    for ln in lines:
        m = ITEM.match(ln)
        if m:
            numbers.append(int(m.group(1)))
    seen = {}
    for n in numbers:
        seen[n] = seen.get(n, 0) + 1
    dupes = sorted(k for k, v in seen.items() if v > 1)
    maximum = max(numbers) if numbers else -1
    print("LINES=" + str(len(lines)))
    print("NUMBERED=" + str(len(numbers)))
    print("MAX=" + str(maximum))
    print("NEXT=" + str(maximum + 1))
    print("DUPES=" + str(dupes))
    print("BYTES=" + str(os.path.getsize(LEDGER)))


def cmd_hash(paths):
    for p in paths:
        if not os.path.isabs(p):
            print("REFUSED-RELATIVE=" + p)
            sys.exit(2)
        h = hashlib.sha256()
        with open(p, "rb") as f:
            for chunk in iter(lambda: f.read(65536), b""):
                h.update(chunk)
        print("SHA256=" + h.hexdigest() + " BYTES=" + str(os.path.getsize(p))
              + " FILE=" + p)


def main(argv):
    if len(argv) < 2 or argv[1] not in ("next", "hash"):
        print("USE: srj_toolcheck.py next | srj_toolcheck.py hash <abs-path> [...]")
        return 2
    if argv[1] == "next":
        cmd_next()
        return 0
    if len(argv) < 3:
        print("USE: srj_toolcheck.py hash <abs-path> [...]")
        return 2
    cmd_hash(argv[2:])
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
