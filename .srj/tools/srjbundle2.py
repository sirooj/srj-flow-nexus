import pathlib, sys

d = pathlib.Path(sys.argv[1])
tag = sys.argv[2]
out = d / ("BUNDLE_" + tag + ".txt")
files = sorted([p for p in d.glob("*.txt") if not p.name.startswith("BUNDLE_")])
order  = [p for p in files if p.stem not in ("STASIS", "RECEIPT")]
order += [p for p in files if p.stem == "STASIS"]
order += [p for p in files if p.stem == "RECEIPT"]
parts = []
for p in order:
    body = p.read_text(encoding="utf-8", errors="replace")
    parts.append("===== BEGIN " + p.name + " =====")
    parts.append(body.rstrip("\n"))
    parts.append("===== END " + p.name + " =====")
    parts.append("")
out.write_text("\n".join(parts), encoding="utf-8")
text = out.read_text(encoding="utf-8")
print("BUNDLE PATH:", out)
print("BUNDLE BYTES:", out.stat().st_size)
print("BUNDLE LINES:", len(text.splitlines()))
print("FILES BUNDLED:", len(order))
print("NAMES:", ", ".join(p.name for p in order))
