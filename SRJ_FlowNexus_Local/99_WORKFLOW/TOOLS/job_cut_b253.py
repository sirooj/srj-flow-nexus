"""job_cut_b247.py - B-247 diagnostic cuts (TOOLS-committed, rerunnable offline; job_cut_b246.py + leg-source column).
Streams the day log once per call; cuts one run segment (lines > PRE) into
00_CURRENT_WORKING/CUT_<run>.log, writes ROWPACK/DEALS_<run>.csv plus the
[B244S4]/[B244RV]/[B215F1]/[B216H1]/[B245ZG]/[B246KS]/[B246ZS] rows for that run. Run with PRE=<run PRE_JOURNAL_LINES>:
  job_cut_b247.py RECON62-B247A <PRE> etc.
Leg-source (ZS rows only): FLIP if a structural-flip row (OBPROV code=8) carries the
legStart bar, RENEWAL if a kind=fvgRenewal EVT row with the matching side carries it,
else INITIAL. Single forward pass: a ZS row first cites its legStart strictly after
the event bar, so the event set is complete when cited.
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
DAYLOG = sys.argv[3]  # explicit day log path (B-253: never hard-code the day file)

RUN = sys.argv[1]
PRE = int(sys.argv[2])

rx_deal = re.compile(r'\bdeal #(\d+) (buy|sell) ([\d.]+) EURUSD at ([\d.]+)')
rx_dt = re.compile(r'(20\d\d)\.(\d\d)\.(\d\d) (\d\d):(\d\d)')
rx_f1 = re.compile(r'B215F1 date=(\S+) bar=(\S+ \S+) state=(\S+) ob=(\S+) fvg=(\S+) opp=(\S+) adverse=(\S+) action=(\S+)')
rx_h1 = re.compile(r'B216H1 date=(\S+ \S+) bar=(\d+) id=(\S+) close=(\S+) lvl=(\S+)')
rx_s4 = re.compile(r'\[B244S4\] date=(\S+) bar=(\S+ \S+) state=(\S+) ob=(\S+) fvg=(\S+) opp=(\S+) adverse=(\S+) action=(\S+)')
rx_rv = re.compile(r'\[B244RV\] bar=(\S+ \S+) dir=(\S+) id=(\S+) dead=(\S+)')
rx_zg = re.compile(r'\[B245ZG\] bar=(\S+ \S+) dir=(\S+) v=(\S+) out=(\S+)')
rx_ks = re.compile(r'\[(B246KS|B249E|B250G|B250H)\] bar=(\S+ \S+) id=(\S+) site=(\S+)')
rx_zs = re.compile(r'\[B246ZS\] bar=(\S+ \S+) side=(\S+) legStart=(\S+(?: \S+)?) count=(\S+) newest=(.*)$')
rx_48c = re.compile(r'\[B248C\] bar=(\S+ \S+) side=(\S+) cfvg=(\S+) cxob=(\S+) first=(.*)$')
rx_flip = re.compile(r'OBPROV\] code=8 id=\d+ bar=(\d+)')
rx_ren = re.compile(r'kind=fvgRenewal.*?\bbias=(\S+?)[,\s]')
rx_ren2 = re.compile(r'kind=fvgRenewal')
REGMAP = {('2026-08-28', 'sell', '10:05'): 'A1', ('2026-09-01', 'buy', '17:35'): 'A2',
          ('2026-09-04', 'buy', '16:00'): 'A3', ('2026-09-07', 'buy', '09:20'): 'A4',
          ('2026-09-08', 'sell', '10:10'): 'A6', ('2026-09-08', 'sell', '17:00'): 'A7'}

flip_bars = set()
ren_bars = set()
cut = open(os.path.join(WORK, 'CUT_%s.log' % RUN), 'w', encoding='utf-8', newline='')
deals, kills, s4s = [], [], []
n = 0
with open(DAYLOG, encoding='utf-16', errors='replace') as f:
    for line in f:
        n += 1
        if n <= PRE:
            continue
        cut.write(line)
        raw = line.rstrip('\r\n')
        mf = rx_flip.search(raw)
        if mf:
            flip_bars.add(int(mf.group(1)))
        if rx_ren2.search(raw):
            mr = rx_dt.search(raw)
            md = rx_ren.search(raw)
            if mr and md:
                ren_bars.add(('%s-%s-%s %s:%s' % (mr.group(1), mr.group(2), mr.group(3), mr.group(4), mr.group(5)),
                              md.group(1)))
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
        m4 = rx_s4.search(raw)
        if m4:
            b = m4.group(2)
            s4s.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                        'code': 'ob%s/fvg%s/opp%s/adv%s/%s' % (
                            m4.group(4), m4.group(5), m4.group(6), m4.group(7), m4.group(8)),
                        'kind': 'B244S4', 'jl': n})
            continue
        m5 = rx_rv.search(raw)
        if m5:
            b = m5.group(1)
            s4s.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                        'code': 'dir%s/id%s/dead%s' % (m5.group(2), m5.group(3), m5.group(4)),
                        'kind': 'B244RV', 'jl': n})
            continue
        m7 = rx_zg.search(raw)
        if m7:
            b = m7.group(1)
            s4s.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                        'code': 'dir%s/v%s/%s' % (m7.group(2), m7.group(3), m7.group(4)),
                        'kind': 'B245ZG', 'jl': n})
            continue
        m8 = rx_ks.search(raw)
        if m8:
            b = m8.group(2)
            s4s.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                        'code': 'id%s/%s' % (m8.group(3), m8.group(4)),
                        'kind': m8.group(1), 'jl': n})
            continue
        m9 = rx_zs.search(raw)
        if m9:
            b = m9.group(1)
            s4s.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                        'code': 'side%s/leg%s/count%s' % (m9.group(2), m9.group(3), m9.group(4)),
                        'kind': 'B246ZS', 'jl': n})
            continue
        m10 = rx_48c.search(raw)
        if m10:
            b = m10.group(1)
            s4s.append({'run': RUN, 'date': b[:10].replace('.', '-'), 'time': b[11:16],
                        'code': 'side%s/cfvg%s/cxob%s' % (m10.group(2), m10.group(3), m10.group(4)),
                        'kind': 'B248C', 'jl': n})
cut.close()
print('scanned %d; deals %d; KILL rows %d; S4/RV/ZG/KS/ZS rows %d' % (n, len(deals), len(kills), len(s4s)))
print('flip bars %d; renewal bars %d' % (len(flip_bars), len(ren_bars)))

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
os.makedirs(os.path.join(WORK, 's4_b247'), exist_ok=True)
with open(os.path.join(WORK, 's4_b247', 'S4RV_%s.csv' % RUN), 'w', encoding='utf-8', newline='') as f:
    w = csv.DictWriter(f, fieldnames=['run', 'date', 'time', 'code', 'kind', 'jl'],
                       lineterminator='\r\n')
    w.writeheader()
    w.writerows(s4s)
print('DEALS + KILL + S4RV rows written')
