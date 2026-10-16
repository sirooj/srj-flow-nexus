"""grade_register.py - grade one run's deals against REGISTER_TRUTH.csv. Exact match only, no tolerance.
Usage: python grade_register.py <DEALS_csv> <REGISTER_TRUTH_csv> <run_name> <from YYYY-MM-DD> <to YYYY-MM-DD>
Exit code 0 = every KEEP entry exact and no NEVER fires; 1 otherwise."""
import csv, sys

def hm(t):
    h, m = t.split(":"); return int(h) * 60 + int(m)

def session(t):
    m = hm(t)
    if 9 * 60 <= m < 12 * 60: return "LONDON"
    if 14 * 60 <= m < 19 * 60: return "NY"
    return "OUT"

def pts(a, b):
    return round((float(a) - float(b)) * 100000)

def main():
    deals_p, truth_p, run, d0, d1 = sys.argv[1:6]
    deals = list(csv.DictReader(open(deals_p, newline="")))
    truth = [r for r in csv.DictReader(open(truth_p, newline="")) if d0 <= r["date"] <= d1]
    trades, i = [], 0
    while i < len(deals):
        e = deals[i]; x = deals[i + 1] if i + 1 < len(deals) else None
        trades.append({"side": e["side"], "date": e["date"], "time": e["time"], "price": e["price"],
                       "xdate": x["date"] if x else "", "xtime": x["time"] if x else "OPEN", "xprice": x["price"] if x else "",
                       "deal": e["deal"], "used": False})
        i += 2
    out, keep_n, keep_ok, exit_ok, never_fire = [], 0, 0, 0, 0
    for r in truth:
        if r["class"] == "KEEP":
            keep_n += 1
            m = [t for t in trades if t["date"] == r["date"] and t["side"] == r["side"] and t["time"] == r["entry_time"]]
            if not m:
                out.append(f"{r['id']},KEEP,MISSING,{r['date']} {r['side']} {r['entry_time']} {r['entry_price']},-,{r['source']}"); continue
            t = m[0]; t["used"] = True
            ent = "EXACT" if (not r["entry_price"]) or float(t["price"]) == float(r["entry_price"]) else f"DIFF {pts(t['price'], r['entry_price']):+d}pt"
            if ent == "EXACT": keep_ok += 1
            xt_ok = (not r["exit_time"]) or t["xtime"] == r["exit_time"]
            xp_ok = (not r["exit_price"]) or (t["xprice"] != "" and float(t["xprice"]) == float(r["exit_price"]))
            if xt_ok and xp_ok: exitv = "EXIT EXACT"; exit_ok += 1
            else:
                d = f"{pts(t['xprice'], r['exit_price']):+d}pt" if t["xprice"] else "n/a"
                exitv = f"EXIT DIFF machine {t['xtime']} {t['xprice']} vs owed {r['exit_time'] or '-'} {r['exit_price']} ({d})"
            out.append(f"{r['id']},KEEP,ENTRY {ent},{t['date']} {t['side']} {t['time']} {t['price']},{exitv},{r['source']}")
        else:
            def hit(t):
                if t["date"] != r["date"]: return False
                if r["side"] and t["side"] != r["side"]: return False
                if r["entry_time"]: return t["time"] == r["entry_time"]
                return session(t["time"]) == r["session"]
            m = [t for t in trades if hit(t)]
            for t in m: t["used"] = True
            v = "FIRES" if m else "SILENT"
            if m and r["class"] == "NEVER": never_fire += 1
            desc = ";".join(f"{t['date']} {t['side']} {t['time']} {t['price']}" for t in m) or "-"
            out.append(f"{r['id']},{r['class']},{v},{desc},-,{r['source']}")
    machine = [t for t in trades if not t["used"]]
    for t in machine:
        out.append(f"M{t['deal']},MACHINE,UNGRADED BY HIM,{t['date']} {t['side']} {t['time']} {t['price']},exit {t['xtime']} {t['xprice']},-")
    print(f"GRADE {run}: KEEP entries exact {keep_ok}/{keep_n}; KEEP exits exact {exit_ok}/{keep_n}; "
          f"NEVER fires {never_fire}; MACHINE-ONLY ungraded {len(machine)}; trades {len(trades)}")
    print("id,class,verdict,trade,exit,source")
    for l in out: print(l)
    sys.exit(0 if keep_ok == keep_n and never_fire == 0 else 1)

if __name__ == "__main__":
    main()
