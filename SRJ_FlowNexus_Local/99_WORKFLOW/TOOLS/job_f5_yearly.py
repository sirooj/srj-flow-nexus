# TOOLS/job_f5_yearly.py (B-228, reused B-229): Yearly census, one streamed pass per cut.
# Scans kept CUTs (R2/R3 + YEARLY_B228.csv); if probe cuts exist, scans them for R4.
import re, csv, pathlib
base = pathlib.Path(r'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5')
W = base / 'SRJ_FlowNexus_Local/00_CURRENT_WORKING'
RPT = base / 'SRJ_FlowNexus_Local/06_HANDOFFS/REPORT'
EA = '61829f05'
rx_dt = re.compile(r'(20\d\d\.\d\d\.\d\d) (\d\d:\d\d)')
rx_tag = re.compile(r'\[(SRJ-[A-Z]+|POI)\]\[?([A-Z0-9_]+)?\]?')
def scan(path, run, out_rows, dayc, misc):
    n_yrl = 0
    with open(path, encoding='utf-8', errors='replace') as f:
        for line in f:
            if '\t' not in line:
                continue
            jl, _, raw = line.partition('\t')
            raw = raw.rstrip('\r\n')
            if 'Yearly' in raw:
                n_yrl += 1
            m = rx_dt.search(raw)
            dd, tm = (m.group(1), m.group(2)) if m else ('', '')
            if ('[POI][SEED_SLOT]' in raw or '[POI][FLOOR_SLOT]' in raw or '[POI][DEPTH]' in raw) and ('slot=Y' in raw or 'slot Y' in raw or 'SEED_SLOT' in raw and ' Y ' in raw or raw.count('slot=Y') > 0 or 'Y kind' in raw):
                sm = re.search(r'slot=(\w+)', raw)
                slot = sm.group(1) if sm else ('Y' if 'slot=Y' in raw else '?')
                if slot == 'Y' or '[POI][DEPTH]' in raw:
                    tag = 'SEED_SLOT' if 'SEED_SLOT' in raw else ('FLOOR_SLOT' if 'FLOOR_SLOT' in raw else 'DEPTH')
                    out_rows.append([run, EA, jl.strip(), dd, tm, tag, slot, '', '', raw.strip()[:400]])
                    misc.setdefault(run, {}).setdefault(tag, []).append((jl.strip(), raw.strip()[:300]))
            if 'Yearly-POC' in raw or 'Yearly-VWAP' in raw:
                ln = 'Yearly-POC' if 'Yearly-POC' in raw else 'Yearly-VWAP'
                vm = re.search(r'(?:val|lineVal)=(-?[\d.]+|-|EMPTY_VALUE)', raw)
                val = vm.group(1) if vm else 'NOT PRINTED'
                tm2 = re.search(r'\[(B\d+[A-Z]*|EXITCENSUS|MTEXIT|UJDTTERMS|WINLINE|BORN|TP_ELECT)[^\]]*\]', raw)
                tag2 = tm2.group(0) if tm2 else raw.strip()[60:110]
                out_rows.append([run, EA, jl.strip(), dd, tm, tag2, '', ln, val, raw.strip()[:400]])
                dayc.setdefault(run, {}).setdefault(dd, []).append((jl.strip(), ln, val))
            if 'slot=Y' in raw and ('CKPT_SLOT_META' in raw or 'CKPT_SLOT_RESULT' in raw or 'CKPT_RETIRED' in raw):
                misc.setdefault(run, {}).setdefault('CKPT-Y', []).append((jl.strip(), raw.strip()[:300]))
    return n_yrl
rows, dayc, misc = [], {}, {}
kept = [('RECON62-B222K', W / 'CUT_RECON62-B222K.log'), ('EU0525TD-B222K', W / 'CUT_EU0525TD-B222K.log')]
for run, cut in kept:
    n = scan(cut, run, rows, dayc, misc)
    print(f'R2|YRLY-count {run}: {n} (B-226: RECON62 2835 / EU0525TD 0)', flush=True)
for run in ['RECON62-B222K', 'EU0525TD-B222K']:
    for tag in ['SEED_SLOT', 'FLOOR_SLOT', 'DEPTH']:
        got = misc.get(run, {}).get(tag, [])
        print(f'R2|{run} slot-Y {tag}: {len(got)} rows; first={got[0] if got else None}; last={got[-1] if got else None}', flush=True)
    ck = misc.get(run, {}).get('CKPT-Y', [])
    print(f'R2|{run} CKPT-Y: {len(ck)} rows; first={ck[0] if ck else None}; last={ck[-1] if ck else None}', flush=True)
    dd = dayc.get(run, {})
    print(f'R2|{run} Yearly days: {len(dd)}; per-day counts: {sorted((d, len(v)) for d, v in dd.items())[:8]}', flush=True)
    for d in sorted(dd):
        if d in ('2026.09.01', '2026.09.07', '2026.09.08'):
            v = dd[d]
            print(f'R2|{run} {d}: n={len(v)} first={v[0]} last={v[-1]}', flush=True)
with open(RPT / 'YEARLY_B228.csv', 'w', encoding='utf-8', newline='') as f:
    w = csv.writer(f)
    w.writerow(['run', 'ea_sha', 'journal_line', 'date', 'time', 'tag', 'slot', 'line', 'value', 'raw'])
    w.writerows(rows)
print('YEARLY rows', len(rows), flush=True)
# R3: his values beside machine at the candles
def near(run, date, t0, t1):
    return [r for r in rows if r[0] == run and r[3] == date and t0 <= r[4] <= t1 and r[8] not in ('', 'NOT PRINTED')]
for date, t0, t1, his, what in [('2026.09.08', '16:55', '17:05', '1.16114', 'Yearly-POC target A7'), ('2026.09.07', '16:40', '16:50', '1.16315', 'A5 target'), ('2026.09.01', '17:40', '17:50', '1.15987', 'Yearly-POC break A2')]:
    for run in ['RECON62-B222K', 'EU0525TD-B222K']:
        got = near(run, date, t0, t1)
        print(f'R3|{run} {date} {t0}-{t1} ({what}, his {his}): {[(g[5], g[7], g[8], g[2]) for g in got] if got else "NOT PRINTED / ABSENT"}', flush=True)
# R4 probe cuts when present
import os
probes = [('RECON62-B228P', W / 'CUT_RECON62-B228P.log'), ('EU0525TD-B228P', W / 'CUT_EU0525TD-B228P.log')]
if all(os.path.exists(p[1]) for p in probes):
    for run, cut in probes:
        yd = []
        sy = []
        with open(cut, encoding='utf-8', errors='replace') as f:
            for line in f:
                if '\t' not in line:
                    continue
                jl, _, raw = line.partition('\t')
                raw = raw.rstrip('\r\n')
                if '[B228YD]' in raw:
                    yd.append((jl.strip(), raw.strip()[:500]))
                if 'slot=Y' in raw and ('SEED_SLOT' in raw or 'FLOOR_SLOT' in raw or 'DEPTH]' in raw):
                    sy.append((jl.strip(), raw.strip()[:250]))
        print(f'R4|{run} [B228YD]: {yd if yd else "ABSENT"}', flush=True)
        print(f'R4|{run} slot-Y rows beside: {sy[:4] if sy else "ABSENT"}', flush=True)
else:
    print('R4|probe cuts absent (pre-T run)', flush=True)
