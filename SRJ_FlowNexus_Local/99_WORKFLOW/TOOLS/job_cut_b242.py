"""job_cut_b242.py - B-242 kept re-proof cut (TOOLS-committed, rerunnable offline; reuses job_cut_b241.py).
Streams the day log once per call; cuts one run segment (lines > PRE) into
00_CURRENT_WORKING/CUT_<run>.log, writes ROWPACK/DEALS_<run>.csv plus the
[B215F1]/[B216H1]/[B234EQ]/[B237TD] rows for that run. Run with PRE=<run PRE_JOURNAL_LINES>:
  job_cut_b242.py RECON62-B242K <PRE>
Register tagging mirrors the kept-file convention (A1-A4, A6, A7; A5 is NEVER).
Day-log lines carry no per-line numbers; jl below is the 1-based log line count.
"""
import csv
import os
import re
import sys

BASE = os.path.dirname(os.path.abspath(__file__))
MQL5 = os.path.join(BASE, '..', '..', '..')
WORK = os.path.join(MQL5, 'SRJ_FlowNexus_Local', '00_CURRENT_WORKING')
HAND = os.path.join(MQL5, 'SRJ_FlowNexus_Local', '06_HANDOFFS')
RP = os.path.join(HAND, 'ROWPACK')
DAYLOG = os.path.join(MQL5, '..', 'Tester', 'logs', '20261016.log')

RUN = sys.argv[1]
PRE = int(sys.argv[2])

rx_deal = re.compile(r'\bdeal #(\d+) (buy|sell) ([\d.]+) EURUSD at ([\d.]+)')
rx_dt = re.compile(r'(20\d\d)\.(\d\d)\.(\d\d) (\d\d):(\d\d)')
rx_f1 = re.compile(r'B215F1 date=(\S+) bar=(\S+ \S+) state=(\S+) ob=(\S+) fvg=(\S+) opp=(\S+) adverse=(\S+) action=(\S+)')
rx_h1 = re.compile(r'B216H1 date=(\S+ \S+) bar=(\d+) id=(\S+) close=(\S+) lvl=(\S+)')
rx_td = re.compile(r'\[B237TD\] bar=(\S+ \S+) dir=(\S+) raw=(\S+) val=(\S+) hi=(\S+) lo=(\S+) o=(\S+) touch=(\S+)')
rx_eq = re.compile(r'\[B234EQ\] bar=(\S+ \S+) dir=(\S+) line=(\S+) val=(\S+) o=(\S+) out=(\S+)')
REGMAP = {('2026-08-28', 'sell', '10:05'): 'A1', ('2026-09-01', 'buy', '17:35'): 'A2',
          ('2026-09-04', 'buy', '16:00'): 'A3', ('2026-09-07', 'buy', '09:20'): 'A4',
          ('2026-09-08', 'sell', '10:10'): 'A6', ('2026-09-08', 'sell', '17:00'): 'A7'}

cut = open(os.path.join(WORK, 'CUT_%s.log' % RUN), 'w', encoding='utf-8', newline='')
deals, kills, tds = [], [], []
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
            deals.append({'deal': m.group(1), 'side': m.group(2),
                          'date': '%s-%s-%s' % (dm.group(1), dm.group(2), dm.group(3)),
                          'time': '%s:%s' % (dm.group(4), dm.group(5)),
                          'price': m.group(4), 'volume': m.group(3)})
            continue
        m2 = rx_f1.search(raw)
        if m2:
            b = m2.group(2)
            kills.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                          'side': '-', 'code': 'ob%s/fvg%s/opp%s/adv%s/%s' % (
                              m2.group(4), m2.group(5), m2.group(6), m2.group(7), m2.group(8)),
                          'kind': 'B215F1', 'jl': n})
            continue
        m3 = rx_h1.search(raw)
        if m3:
            b = m3.group(1)
            bd = b[:10].replace('.', '-')
            bt = b[11:16] if len(b) > 10 else '-'
            kills.append({'run': RUN, 'date': bd, 'time': bt,
                          'side': '-',
                          'code': 'id%s/close%s/lvl%s/bar%s' % (
                              m3.group(3), m3.group(4), m3.group(5), m3.group(2)),
                          'kind': 'B216H1', 'jl': n})
            continue
        m4 = rx_td.search(raw)
        if m4:
            b = m4.group(1)
            tds.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                        'tag': 'B237TD', 'raw': raw, 'jl': n})
            continue
        m5 = rx_eq.search(raw)
        if m5:
            b = m5.group(1)
            tds.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                        'tag': 'B234EQ', 'raw': raw, 'jl': n})
cut.close()
print('scanned %d; deals %d; KILL rows %d; TD/EQ rows %d' % (n, len(deals), len(kills), len(tds)))

with open(os.path.join(RP, 'DEALS_%s.csv' % RUN), 'w', encoding='utf-8', newline='') as f:
    w = csv.writer(f, lineterminator='\r\n')
    w.writerow(['deal', 'side', 'date', 'time', 'price', 'volume', 'register_row'])
    for d in deals:
        w.writerow([d['deal'], d['side'], d['date'], d['time'], d['price'], d['volume'],
                    REGMAP.get((d['date'], d['side'], d['time']), 'NONE')])

os.makedirs(os.path.join(WORK, 'kill_b241'), exist_ok=True)
with open(os.path.join(WORK, 'kill_b241', 'KILL_%s.csv' % RUN), 'w', encoding='utf-8', newline='') as f:
    w = csv.DictWriter(f, fieldnames=['run', 'date', 'time', 'side', 'code', 'kind', 'jl'],
                       lineterminator='\r\n')
    w.writeheader()
    w.writerows(kills)
os.makedirs(os.path.join(WORK, 'td_b242'), exist_ok=True)
with open(os.path.join(WORK, 'td_b242', 'TD_%s.csv' % RUN), 'w', encoding='utf-8', newline='') as f:
    w = csv.DictWriter(f, fieldnames=['run', 'date', 'time', 'tag', 'raw', 'jl'],
                       lineterminator='\r\n')
    w.writeheader()
    w.writerows(tds)
print('DEALS + KILL + TD rows written')
