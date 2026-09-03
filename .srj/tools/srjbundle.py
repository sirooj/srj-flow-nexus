import pathlib, sys

NAMES = ["W1","W2","W3","W4",
         "F1","F2","F3","F4","F5","F6","F7","F8",
         "T1","T2","T3","T4","T5","T6","T7","T8",
         "STASIS","RECEIPT"]

d = pathlib.Path(sys.argv[1])
out = d / "BUNDLE_R2.txt"
parts = []
missing = []
for n in NAMES:
    f = d / (n + ".txt")
    if not f.exists():
        missing.append(n)
        continue
    body = f.read_text(encoding="utf-8", errors="replace")
    parts.append("===== BEGIN " + n + ".txt =====")
    parts.append(body.rstrip("\n"))
    parts.append("===== END " + n + ".txt =====")
    parts.append("")
out.write_text("\n".join(parts), encoding="utf-8")
text = out.read_text(encoding="utf-8")
print("BUNDLE PATH:", out)
print("BUNDLE BYTES:", out.stat().st_size)
print("BUNDLE LINES:", len(text.splitlines()))
print("FILES BUNDLED:", len(NAMES) - len(missing), "of", len(NAMES))
print("MISSING:", ", ".join(missing) if missing else "none")
