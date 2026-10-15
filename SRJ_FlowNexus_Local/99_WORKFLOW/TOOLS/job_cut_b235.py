"""job_cut_b235.py - B-235 kept-build cuts (TOOLS-committed, rerunnable offline).
1. Streams the day log once; cuts the RECON62-B235K segment (lines > PRE)
   -> 00_CURRENT_WORKING/CUT_RECON62-B235K.log + ROWPACK/DEALS_RECON62-B235K.csv
   + ROWPACK/RECON62-B235K/<yyyymmdd>.csv day packs (DEAL + B234EQ rows).
2. Re-reads the committed CUT_EU0525TD-B234D.log (no day-log rescan)
   -> ROWPACK/EU0525TD-B234D/<yyyymmdd>.csv day packs (DEAL + B234EQ rows).
3. Writes ROWPACK/INDEX_B235.md (register row -> day-pack lines, INDEX_B230 shape).
Day packs carry DEAL rows always and B234EQ rows of that date; ea_sha = kept ex5.
"""
import csv
import glob
import os
import re

BASE = os.path.dirname(os.path.abspath(__file__))
MQL5 = os.path.join(BASE, '..', '..', '..')
WORK = os.path.join(MQL5, 'SRJ_FlowNexus_Local', '00_CURRENT_WORKING')
HAND = os.path.join(MQL5, 'SRJ_FlowNexus_Local', '06_HANDOFFS')
RP = os.path.join(HAND, 'ROWPACK')
DAYLOG = os.path.join(MQL5, '..', 'Tester', 'logs', '20261015.log')
PRE = 24774106
EA_SHA = 'a6d765f0'
JFILE = '20261015.log'

rx_deal = re.compile(r'\bdeal #(\d+) (buy|sell) ([\d.]+) EURUSD at ([\d.]+)')
rx_dt = re.compile(r'(20\d\d)\.(\d\d)\.(\d\d) (\d\d):(\d\d)')
rx_eq = re.compile(r'\[B234EQ\] bar=(\S+ \S+) dir=(\S+) line=(\S+) val=(\S+) o=(\S+) out=(\S+)')

RECON_MAP = {('2026-08-28', 'sell', '10:05'): 'A1', ('2026-09-01', 'buy', '17:35'): 'A2',
             ('2026-09-04', 'buy', '16:00'): 'A3', ('2026-09-07', 'buy', '09:20'): 'A4',
             ('2026-09-08', 'sell', '10:10'): 'A6', ('2026-09-08', 'sell', '17:00'): 'A7'}


def packrow(run, raw, jl, want_eq):
    m = rx_deal.search(raw)
    if m and 'Core' in raw:
        dm = rx_dt.search(raw)
        if not dm:
            return None
        return ('%s-%s-%s' % (dm.group(1), dm.group(2), dm.group(3)),
                '%s:%s' % (dm.group(4), dm.group(5)), 'DEAL', raw, jl)
    if want_eq:
        m2 = rx_eq.search(raw)
        if m2:
            b = m2.group(1)
            return (b[:10].replace('.', '-'), b[11:16], 'B234EQ', raw, jl)
    return None


def write_deals(path, deals, regmap):
    with open(path, 'w', encoding='utf-8', newline='') as f:
        w = csv.writer(f, lineterminator='\r\n')
        w.writerow(['deal', 'side', 'date', 'time', 'price', 'volume', 'register_row'])
        for d in deals:
            w.writerow([d['deal'], d['side'], d['date'], d['time'], d['price'], d['volume'],
                        regmap.get((d['date'], d['side'], d['time']), 'NONE')])


def write_daypacks(run, rows):
    byday = {}
    for (d, t, tag, raw, jl) in rows:
        byday.setdefault(d, []).append((t, tag, raw, jl))
    sub = os.path.join(RP, run)
    os.makedirs(sub, exist_ok=True)
    for day in sorted(byday):
        fn = os.path.join(sub, day.replace('-', '') + '.csv')
        with open(fn, 'w', encoding='utf-8', newline='') as f:
            w = csv.writer(f, quoting=csv.QUOTE_MINIMAL, lineterminator='\r\n')
            w.writerow(['pack_line', 'run', 'ea_sha', 'journal_file', 'journal_line',
                        'server_date', 'server_time', 'tag', 'raw'])
            for i, (t, tag, raw, jl) in enumerate(sorted(byday[day]), 1):
                w.writerow([i, run, EA_SHA, JFILE, jl, day, t, tag, raw])
        print('pack %s: %d rows' % (fn, len(byday[day])))
    return byday


# --- 1. B235K segment ---
cut = open(os.path.join(WORK, 'CUT_RECON62-B235K.log'), 'w', encoding='utf-8', newline='')
deals, rows = [], []
n = 0
with open(DAYLOG, encoding='utf-16', errors='replace') as f:
    for line in f:
        n += 1
        if n <= PRE:
            continue
        cut.write(line)
        raw = line.rstrip('\r\n')
        m = rx_deal.search(raw)
        if m and 'Core' in raw:
            dm = rx_dt.search(raw)
            date = '%s-%s-%s' % (dm.group(1), dm.group(2), dm.group(3))
            time = '%s:%s' % (dm.group(4), dm.group(5))
            deals.append({'deal': m.group(1), 'side': m.group(2), 'date': date,
                          'time': time, 'price': m.group(4), 'volume': m.group(3)})
            rows.append((date, time, 'DEAL', raw, n))
            continue
        pr = packrow('RECON62-B235K', raw, n, True)
        if pr and pr[2] == 'B234EQ':
            rows.append((pr[0], pr[1], pr[2], pr[3], pr[4]))
cut.close()
print('scanned %d; B235K deals %d' % (n, len(deals)))
write_deals(os.path.join(RP, 'DEALS_RECON62-B235K.csv'), deals, RECON_MAP)
byday_k = write_daypacks('RECON62-B235K', rows)

# --- 2. EU B234D packs from its committed cut (dates already packed full-tag in B-234 are kept) ---
# The cut holds verbatim segment lines starting at journal EU_PRE+1, so cut-relative
# line i maps to journal EU_PRE+i (the day log carries no per-line numbers).
EU_PRE = 21446649
eu_have = set()
eudir = os.path.join(RP, 'EU0525TD-B234D')
for f in glob.glob(os.path.join(eudir, '*.csv')):
    d = os.path.basename(f)[:8]
    eu_have.add('%s-%s-%s' % (d[:4], d[4:6], d[6:8]))
print('EU dates already packed (kept as-is): %s' % sorted(eu_have))
eu_rows = []
with open(os.path.join(WORK, 'CUT_EU0525TD-B234D.log'), encoding='utf-8', errors='replace') as f:
    for i, line in enumerate(f, 1):
        raw = line.rstrip('\r\n')
        pr = packrow('EU0525TD-B234D', raw, EU_PRE + i, True)
        if pr and pr[0] not in eu_have:
            eu_rows.append((pr[0], pr[1], pr[2], pr[3], pr[4]))
byday_e = write_daypacks('EU0525TD-B234D', eu_rows)

# --- 3. INDEX_B235 (pack_lines read back from the actual day-pack files) ---
def file_deal_lines(run, day):
    fn = os.path.join(RP, run, day.replace('-', '') + '.csv')
    out = []
    for r in csv.DictReader(open(fn, encoding='utf-8-sig')):
        if r['tag'] == 'DEAL':
            out.append((r['pack_line'], r['server_time']))
    return fn, out


truth = {(r['date'], r['side'], r['entry_time']): r['id']
         for r in csv.DictReader(open(os.path.join(HAND, 'REGISTER_TRUTH.csv'), encoding='utf-8-sig'))
         if r['class'] == 'KEEP'}
lines = ['# INDEX_B235 - KEEP rows to day-pack lines (B235K/B234D cuts, new truth)', '',
         'register_row | run | date | side | entry | day_pack | pack_lines']
eu_days = set(byday_e) | eu_have
k_days = set(byday_k)
for (date, side, entry), rid in sorted(truth.items()):
    if date in k_days:
        fn, dl = file_deal_lines('RECON62-B235K', date)
        hits = [pl for (pl, t) in dl if t == entry]
        if hits:
            lines.append('%s | RECON62-B235K | %s | %s | %s | %s | %s' % (
                rid, date, side, entry, os.path.relpath(fn, HAND).replace(os.sep, '/'), ';'.join(hits)))
    if date in eu_days:
        fn, dl = file_deal_lines('EU0525TD-B234D', date)
        hits = [pl for (pl, t) in dl if t == entry]
        if hits:
            lines.append('%s | EU0525TD-B234D | %s | %s | %s | %s | %s' % (
                rid, date, side, entry, os.path.relpath(fn, HAND).replace(os.sep, '/'), ';'.join(hits)))
lines.append('')
lines.append('A5 (7 Sep NY long 16:45) is NEVER on the new truth: no pack lines (silent both kept runs).')
open(os.path.join(RP, 'INDEX_B235.md'), 'w', encoding='utf-8', newline='').write('\n'.join(lines))
print('INDEX_B235: %d rows' % (len(lines) - 4))
