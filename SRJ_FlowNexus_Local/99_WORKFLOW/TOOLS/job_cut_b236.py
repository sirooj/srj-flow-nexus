"""job_cut_b236.py - B-236 diagnostic cuts (TOOLS-committed, rerunnable offline).
Streams the day log once per call; cuts one run segment (lines > PRE) into
00_CURRENT_WORKING/CUT_<run>.log, writes ROWPACK/DEALS_<run>.csv plus the
[B236NO]/[B236NOD] rows for that run. Run with PRE=<run PRE_JOURNAL_LINES>:
  job_cut_b236.py RECON62-B236D <PRE>   or   job_cut_b236.py EU0525TD-B236D <PRE>
Register tagging mirrors the kept-file convention (A1-A4, A6, A7; A5 is NEVER).
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
REPORT = os.path.join(HAND, 'REPORT')
DAYLOG = os.path.join(MQL5, '..', 'Tester', 'logs', '20261015.log')

RUN = sys.argv[1]
PRE = int(sys.argv[2])

rx_deal = re.compile(r'\bdeal #(\d+) (buy|sell) ([\d.]+) EURUSD at ([\d.]+)')
rx_dt = re.compile(r'(20\d\d)\.(\d\d)\.(\d\d) (\d\d):(\d\d)')
rx_no = re.compile(r'\[B236NO\] bar=(\S+ \S+) dir=(\S+) val=(\S+) o=(\S+) eq=(\S+) bs=(\S+)')
rx_nod = re.compile(r'\[B236NOD\] bar=(\S+ \S+) bs=(\S+) hit=(\S+) val=(\S+) out=(\S+)')
REGMAP = {('2026-08-28', 'sell', '10:05'): 'A1', ('2026-09-01', 'buy', '17:35'): 'A2',
          ('2026-09-04', 'buy', '16:00'): 'A3', ('2026-09-07', 'buy', '09:20'): 'A4',
          ('2026-09-08', 'sell', '10:10'): 'A6', ('2026-09-08', 'sell', '17:00'): 'A7'}

cut = open(os.path.join(WORK, 'CUT_%s.log' % RUN), 'w', encoding='utf-8', newline='')
deals, nos, nods = [], [], []
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
        m2 = rx_no.search(raw)
        if m2:
            b = m2.group(1)
            nos.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                        'dir': m2.group(2), 'val': m2.group(3), 'o': m2.group(4),
                        'eq': m2.group(5), 'bs': m2.group(6), 'jl': n})
            continue
        m3 = rx_nod.search(raw)
        if m3:
            b = m3.group(1)
            nods.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                         'bs': m3.group(2), 'hit': m3.group(3), 'val': m3.group(4),
                         'out': m3.group(5), 'jl': n})
cut.close()
print('scanned %d; deals %d; B236NO %d; B236NOD %d' % (n, len(deals), len(nos), len(nods)))

with open(os.path.join(RP, 'DEALS_%s.csv' % RUN), 'w', encoding='utf-8', newline='') as f:
    w = csv.writer(f, lineterminator='\r\n')
    w.writerow(['deal', 'side', 'date', 'time', 'price', 'volume', 'register_row'])
    for d in deals:
        w.writerow([d['deal'], d['side'], d['date'], d['time'], d['price'], d['volume'],
                    REGMAP.get((d['date'], d['side'], d['time']), 'NONE')])

os.makedirs(os.path.join(WORK, 'no_b236'), exist_ok=True)
with open(os.path.join(WORK, 'no_b236', 'NO_%s.csv' % RUN), 'w', encoding='utf-8', newline='') as f:
    w = csv.DictWriter(f, fieldnames=['run', 'date', 'time', 'dir', 'val', 'o', 'eq', 'bs', 'jl'],
                       lineterminator='\r\n')
    w.writeheader()
    w.writerows(nos)
with open(os.path.join(WORK, 'no_b236', 'NOD_%s.csv' % RUN), 'w', encoding='utf-8', newline='') as f:
    w = csv.DictWriter(f, fieldnames=['run', 'date', 'time', 'bs', 'hit', 'val', 'out', 'jl'],
                       lineterminator='\r\n')
    w.writeheader()
    w.writerows(nods)
print('DEALS + NO/NOD rows written')
