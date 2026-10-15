"""job_r0_b235.py - B-235 pre-check from committed rows (no run).
R0.1 B196BAR o/h/l/c for the decided candles from the B-234 day packs.
R0.2 line values from EQOPEN_B234.csv decision rows.
R0.3 EQ-X prediction per candle (touch + xEq at _Digits).
TOOLS-committed; rerunnable offline.
"""
import csv
import os

BASE = os.path.dirname(os.path.abspath(__file__))
HAND = os.path.join(BASE, '..', '..', '06_HANDOFFS')
RP = os.path.join(HAND, 'ROWPACK')
REPORT = os.path.join(HAND, 'REPORT')


def load_pack(run, day):
    path = os.path.join(RP, run, day + '.csv')
    return list(csv.DictReader(open(path, encoding='utf-8-sig')))


def b196bar(rows, candle):
    out = [r for r in rows if r['tag'] == 'B196BAR' and ('bar=%s ' % candle) in r['raw']]
    return out


def show(run, day, candle):
    rows = load_pack(run, day)
    for r in b196bar(rows, candle):
        print(run, day, candle, 'pack_line=%s jl=%s' % (r['pack_line'], r['journal_line']))
        print('  ' + r['raw'][:220])


if __name__ == '__main__':
    show('EU0525TD-B234D', '20260817', '2026.08.17 15:45')
    show('EU0525TD-B234D', '20260817', '2026.08.17 15:50')
    show('EU0525TD-B234D', '20260907', '2026.09.07 16:35')
    show('EU0525TD-B234D', '20260907', '2026.09.07 16:40')
    show('RECON62-B234D', '20260907', '2026.09.07 16:35')
    show('RECON62-B234D', '20260907', '2026.09.07 16:40')
    show('EU0525TD-B234D', '20260922', '2026.09.22 18:45')
    show('EU0525TD-B234D', '20260922', '2026.09.22 18:50')
    show('EU0525TD-B234D', '20260922', '2026.09.22 18:55')
    print('--- EQOPEN decision rows ---')
    for r in csv.DictReader(open(os.path.join(REPORT, 'EQOPEN_B234.csv'), encoding='utf-8-sig')):
        if (r['date'], r['time']) in [('2026-08-17', '15:50'), ('2026-09-07', '16:40'), ('2026-09-22', '18:50')]:
            print('%s %s %s %s %s val=%s o=%s out=%s jl=%s' % (
                r['run'], r['date'], r['time'], r['dir'], r['line'],
                r['value'], r['open'], r['out'], r['cut line']))
