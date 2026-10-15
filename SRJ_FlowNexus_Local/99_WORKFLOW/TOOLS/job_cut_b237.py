"""job_cut_b237.py - B-237 diagnostic cuts (TOOLS-committed, rerunnable offline).
Streams the day log once per call; cuts one run segment (lines > PRE) into
00_CURRENT_WORKING/CUT_<run>.log, writes ROWPACK/DEALS_<run>.csv plus the
[B237TD]/[B234EQ] rows for that run. Run with PRE=<run PRE_JOURNAL_LINES>:
  job_cut_b237.py RECON62-B237D <PRE>   or   job_cut_b237.py EU0525TD-B237D <PRE>
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
DAYLOG = os.path.join(MQL5, '..', 'Tester', 'logs', '20261015.log')

RUN = sys.argv[1]
PRE = int(sys.argv[2])

rx_deal = re.compile(r'\bdeal #(\d+) (buy|sell) ([\d.]+) EURUSD at ([\d.]+)')
rx_dt = re.compile(r'(20\d\d)\.(\d\d)\.(\d\d) (\d\d):(\d\d)')
rx_td = re.compile(r'\[B237TD\] bar=(\S+ \S+) dir=(\S+) raw=(\S+) val=(\S+) hi=(\S+) lo=(\S+) o=(\S+) touch=(\S+)')
rx_eq = re.compile(r'\[B234EQ\] bar=(\S+ \S+) dir=(\S+) line=(\S+) val=(\S+) o=(\S+) out=(\S+)')
REGMAP = {('2026-08-28', 'sell', '10:05'): 'A1', ('2026-09-01', 'buy', '17:35'): 'A2',
          ('2026-09-04', 'buy', '16:00'): 'A3', ('2026-09-07', 'buy', '09:20'): 'A4',
          ('2026-09-08', 'sell', '10:10'): 'A6', ('2026-09-08', 'sell', '17:00'): 'A7'}

cut = open(os.path.join(WORK, 'CUT_%s.log' % RUN), 'w', encoding='utf-8', newline='')
deals, tds = [], []
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
        m2 = rx_td.search(raw)
        if m2:
            b = m2.group(1)
            tds.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                        'bar': b, 'raw': m2.group(3), 'val': m2.group(4), 'hi': m2.group(5),
                        'lo': m2.group(6), 'o': m2.group(7), 'touch': m2.group(8),
                        'kind': 'TD', 'jl': n})
            continue
        m3 = rx_eq.search(raw)
        if m3:
            b = m3.group(1)
            tds.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                        'bar': b, 'raw': '-', 'val': m3.group(4), 'hi': '-', 'lo': '-',
                        'o': m3.group(5), 'touch': m3.group(6),
                        'kind': 'EQ-%s' % m3.group(3), 'jl': n})
cut.close()
print('scanned %d; deals %d; TD/EQ rows %d' % (n, len(deals), len(tds)))

with open(os.path.join(RP, 'DEALS_%s.csv' % RUN), 'w', encoding='utf-8', newline='') as f:
    w = csv.writer(f, lineterminator='\r\n')
    w.writerow(['deal', 'side', 'date', 'time', 'price', 'volume', 'register_row'])
    for d in deals:
        w.writerow([d['deal'], d['side'], d['date'], d['time'], d['price'], d['volume'],
                    REGMAP.get((d['date'], d['side'], d['time']), 'NONE')])

os.makedirs(os.path.join(WORK, 'td_b237'), exist_ok=True)
with open(os.path.join(WORK, 'td_b237', 'TD_%s.csv' % RUN), 'w', encoding='utf-8', newline='') as f:
    w = csv.DictWriter(f, fieldnames=['run', 'date', 'time', 'bar', 'raw', 'val', 'hi', 'lo',
                                      'o', 'touch', 'kind', 'jl'], lineterminator='\r\n')
    w.writeheader()
    w.writerows(tds)
print('DEALS + TD rows written')
