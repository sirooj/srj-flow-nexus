import csv
import re

BASE = 'C:/Users/winar/AppData/Roaming/MetaQuotes/Terminal/3CA1B4AB7DFED5C81B1C7F1007926D06/MQL5'
CUT = BASE + '/SRJ_FlowNexus_Local/00_CURRENT_WORKING/CUT_EU0525TD-B248D.log'

rx_bar = re.compile(r'B196BAR bar=(\S+ \S+) o=(\S+) h=(\S+) l=(\S+) c=(\S+)')
rx_div = re.compile(r'B196DIV bar=(\S+ \S+) dir=(\S+) kind=(\S+) side=(\S+) dbar=(\S+ \S+)?\s*latch=(\S+)?')
rx_latch = re.compile(r'(D130|latch|CQDRECHECK|LATCH)[^\r\n]*')
rx_swing = re.compile(r'(SWING|swing)[^\r\n]{0,140}')
rx_f1 = re.compile(r'B215F1 date=(\S+) bar=(\S+ \S+) state=(\S+) ob=(\S+) fvg=(\S+) opp=(\S+) adverse=(\S+) action=(\S+)')
rx_zg = re.compile(r'\[B245ZG\] bar=(\S+ \S+) dir=(\S+) v=(\S+) out=(\S+)')
rx_sig = re.compile(r'SIGNAL dir=(\S+) poi=(\S+) regime=(\S+) div=(\S+)')
rx_fire = re.compile(r'out=FIRE|action=KILL_S[34]|ENTRY|entry=')

div_rows = []
with open(CUT, encoding='utf-8', errors='replace') as f:
    for i, line in enumerate(f):
        if '2026.06.19 14:' in line or '2026.06.19 15:' in line or '2026.06.19 16:00' in line:
            m = rx_bar.search(line)
            if m:
                div_rows.append(('B196BAR', m.group(1), 'o%s/h%s/l%s/c%s' % (m.group(2), m.group(3), m.group(4), m.group(5)), i))
                continue
            m2 = rx_div.search(line)
            if m2:
                div_rows.append(('B196DIV', m2.group(1), 'dir%s/kind%s/side%s/dbar%s/latch%s'
                                   % (m2.group(2), m2.group(3), m2.group(4), m2.group(5), m2.group(6)), i))
                continue
            if 'B215F1' in line:
                m3 = rx_f1.search(line)
                if m3:
                    div_rows.append(('B215F1', m3.group(2), 'state%s/ob%s/fvg%s/opp%s/adv%s/%s'
                                       % (m3.group(3), m3.group(4), m3.group(5), m3.group(6), m3.group(7), m3.group(8)), i))
                continue
            if 'B245ZG' in line:
                m4 = rx_zg.search(line)
                if m4:
                    div_rows.append(('B245ZG', m4.group(1), 'dir%s/v%s/%s' % (m4.group(2), m4.group(3), m4.group(4)), i))
                continue
            if 'SIGNAL dir=LONG' in line:
                m5 = rx_sig.search(line)
                if m5:
                    div_rows.append(('SIGNAL', '', 'dir%s/poi%s/reg%s/div%s' % (m5.group(1), m5.group(2), m5.group(3), m5.group(4)), i))
                continue
            if 'CQDRECHECK' in line or ('latch=' in line and 'div' in line.lower()):
                div_rows.append(('LATCH', '', line[line.find('Core 04') + 8:line.find('Core 04') + 200].strip(), i))
                continue
            if re.search(r'SWING', line):
                div_rows.append(('SWING', '', line[line.find('Core 04') + 8:line.find('Core 04') + 200].strip(), i))

with open(BASE + '/SRJ_FlowNexus_Local/06_HANDOFFS/REPORT/DIV19JUN_B248A.csv', 'w', newline='', encoding='utf-8') as f:
    w = csv.writer(f, lineterminator='\r\n')
    w.writerow(['tag', 'bar', 'fields', 'cut_line'])
    for r in div_rows:
        w.writerow(r)
print('DIV19JUN rows:', len(div_rows))
