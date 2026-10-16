"""job_k0_b249.py - B-249 K0 maps from committed cuts + trial keeps (read-only, rerunnable offline).
K0a: 8 Oct 10:00-11:40 kept (EU0525TD-B241D) vs B248D cuts: flips, renewals w/ codes, kill-mark reads, FRESHCOUNT, S3 verdict; first differing bar.
K0b: 25 Jun 10:00-10:50 both cuts: any 5m flip / code-8 row between the 10:05 kill and the 10:45 entry (FOUND/ABSENT).
K0c: source map on .B248DK keeps: every kill-mark read/write line (markers B245KM/B246KS/B248D/B244RV), typed FRESHNESS-COUNT, REVIVAL (2/4/5/6/7), FLIP/RENEWAL (8, scans, 5m bias), OTHER.
K0d: static citations only (CQD maxX2, verdict write, EA latch read, swing needs i+1).
Usage: python TOOLS/job_k0_b249.py
"""
import os
import re

BASE = os.path.dirname(os.path.abspath(__file__))
MQL5 = os.path.join(BASE, '..', '..', '..')
WORK = os.path.join(MQL5, 'SRJ_FlowNexus_Local', '00_CURRENT_WORKING')

KEPT = os.path.join(WORK, 'CUT_EU0525TD-B241D.log')
TRIAL = os.path.join(WORK, 'CUT_EU0525TD-B248D.log')

rx_dt = re.compile(r'(20\d\d)\.(\d\d)\.(\d\d) (\d\d):(\d\d)')
rx_flip = re.compile(r'LTFFLIP bar=(\S+ \S+) dir=(\S+)')
rx_code = re.compile(r'OBPROV\] code=([0-9]+) id=(\d+) bar=(\d+) flag=([^\s\\]+)')
rx_h1 = re.compile(r'B216H1 date=(\S+ \S+) bar=(\d+) id=(\S+) close=(\S+) lvl=(\S+)')
rx_rv = re.compile(r'\[B244RV\] bar=(\S+ \S+) dir=(\S+) id=(\S+) dead=(\S+)')
rx_ks = re.compile(r'\[B246KS\] bar=(\S+ \S+) id=(\S+) site=(\S+)')
rx_fc = re.compile(r'FRESHCOUNT #\d+ bar=(\S+ \S+) state=(\S+) obDead=(\d+) fvgDead=(\d+) oppFvg=(\d+) adverse=(\d+) verdict=(\S+)')
rx_s3 = re.compile(r'B215F1 date=(\S+) bar=(\S+ \S+) state=(\S+) ob=(\S+) fvg=(\S+) opp=(\S+) adverse=(\S+) action=(\S+)')


def dash(b):
    return b[:10].replace('.', '-') + ' ' + b[11:16]


def scan(path, d0, t0, t1):
    rows = []
    with open(path, encoding='utf-8', errors='replace') as f:
        for i, line in enumerate(f):
            m = rx_dt.search(line)
            if not m:
                continue
            d = '%s-%s-%s' % (m.group(1), m.group(2), m.group(3))
            t = '%s:%s' % (m.group(4), m.group(5))
            if d != d0 or not (t0 <= t <= t1):
                continue
            for rx, tag, fmt in ((rx_flip, 'FLIP', lambda g: g[0] + '/' + g[1]),
                                 (rx_code, 'CODE', lambda g: 'code%s/id%s/bar%s/%s' % (g[0], g[1], g[2], g[3])),
                                 (rx_h1, 'H1B', lambda g: 'id%s/%s/%s' % (g[2], g[3], g[4])),
                                 (rx_rv, 'RV', lambda g: '%s/%s/dead%s' % (g[1], g[2], g[3])),
                                 (rx_ks, 'KS', lambda g: 'id%s' % g[1]),
                                 (rx_fc, 'FC', lambda g: '%s/ob%s/fvg%s/adv%s/%s' % (g[1], g[2], g[3], g[5], g[6])),
                                 (rx_s3, 'S3', lambda g: '%s/ob%s/fvg%s/adv%s/%s' % (g[2], g[3], g[4], g[6], g[7]))):
                mm = rx.search(line)
                if mm:
                    rows.append((d, t, tag, fmt(mm.groups()), i))
                    break
    return rows


print('### K0a 8 Oct 10:00-11:40 (kept vs B248D)')
for name, path in (('kept', KEPT), ('B248D', TRIAL)):
    print('---', name)
    for r in scan(path, '2026-10-08', '10:00', '11:40'):
        if r[2] in ('FLIP', 'CODE', 'H1B', 'RV', 'KS', 'S3') or (r[2] == 'FC' and ('ABORT' in r[3] or '11:2' in r[1])):
            print(r[1], r[2], r[3])

print('### K0b 25 Jun 10:00-10:50 flips/code-8')
found = False
for name, path in (('kept', KEPT), ('B248D', TRIAL)):
    for r in scan(path, '2026-06-25', '10:00', '10:50'):
        if r[2] == 'FLIP' or (r[2] == 'CODE' and r[3].startswith('code8')):
            print(name, r[1], r[2], r[3])
            found = True
print('K0b:', 'FOUND' if found else 'ABSENT')

print('### K0c kill-mark map on .B248DK (Types/OB/Imb markers)')
for f in ['Include/SRJ/SRJ_Types.mqh.B248DK', 'Include/SRJ/SRJ_OrderblockMgr.mqh.B248DK',
          'Include/SRJ/SRJ_ImbalanceMgr.mqh.B248DK']:
    lines = open(os.path.join(MQL5, f), encoding='utf-8', errors='replace').read().splitlines()
    for i, l in enumerate(lines, 1):
        s = l.strip()
        if 'B245KM' in s or 'B246KS' in s or 'B248D' in s or 'b246KmDead' in s or 'B244RV' in s:
            kind = 'OTHER'
            if 'isValid = false' in s or 'invalidationBar' in s:
                kind = 'FRESHNESS-COUNT'
            if 'tickOBIsValid' in s or 'KeepDead' in s or 'code=' in s:
                kind = 'REVIVAL'
            if 'structLegBoundary' in s or 'Bias' in s or 'flip' in s.lower() or 'renewalOB' in s:
                kind = 'FLIP/RENEWAL'
            print('%s:%d [%s] %s' % (f.split('/')[-1], i, kind, s[:150]))

print('### K0d CQD publish vs EA read (static)')
print('CQD maxX2 = rates_total-3 (SRJ_CQD_TickBased_MT5.mq5:856); verdict written at anchor x2 (CQD:755); swing needs i+1 to exist (CQD:515 IsPriceSwingLow).')
print('EA UpdateDivergenceLatch (EA:7024-7049) reads s=barShift downward, first nonzero verdict wins; no next-close wait in EA.')
print('K0d: INDICATOR-SIDE (15:35 verdict published once the 15:45 bar exists; his 15:40-close confirm needs maxX2 = rates_total-2).')
