"""job_k0_b251.py - B-251 D3 ROWS-AHEAD count + B251I proof rows (TOOLS-committed).
Mode rows-ahead: count SWINGPROOF rows in a cut where newestClosed == the swing bar
(the marked swing's confirming next candle had not closed at writePass).
  python job_k0_b251.py rows-ahead <CUT_path>
Mode b251i: print every [B251I] row of a cut (build I's own pass/verdict/gate/order proof).
  python job_k0_b251.py b251i <CUT_path>
"""
import re, sys

rx_row = re.compile(r'\[B250H\] bar=(\S+ \S+) id=SWINGPROOF site=(\S+) x1=(\S+(?: \S+)?) writePass=(\S+ \S+) newestClosed=(\S+ \S+)')
rx_i = re.compile(r'\[B251I\].*$')

mode, path = sys.argv[1], sys.argv[2]
total, ahead = 0, 0
samples = []
june_ahead = []
with open(path, encoding='utf-8', errors='replace') as f:
    for line in f:
        m = rx_row.search(line)
        if not m:
            continue
        total += 1
        if m.group(1) == m.group(5):
            ahead += 1
            if len(samples) < 3:
                samples.append((m.group(1), m.group(2), m.group(4)))
            if m.group(1).startswith('2026.06.19 15:'):
                june_ahead.append((m.group(1), m.group(2), m.group(4)))
if mode == 'rows-ahead':
    print('SWINGPROOF rows %d; ROWS-AHEAD (newestClosed==swing bar) %d; share %.3f' % (total, ahead, ahead / max(total, 1)))
    for s in samples:
        print('sample bar=%s site=%s writePass=%s' % s)
    print('19-June-window rows-ahead count: %d' % len(june_ahead))
    for s in june_ahead[:8]:
        print('09:19 rowAhead bar=%s site=%s writePass=%s' % s)
else:
    n = 0
    with open(path, encoding='utf-8', errors='replace') as f2:
        for line in f2:
            m = rx_i.search(line)
            if m:
                n += 1
                if n <= 400:
                    print(m.group(0).strip()[:400])
    print('B251I rows printed %d (all if <= 400)' % n)
