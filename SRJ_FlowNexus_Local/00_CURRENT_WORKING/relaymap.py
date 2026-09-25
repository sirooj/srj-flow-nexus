import pathlib
import re
t = pathlib.Path('SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RELAY_COUNCIL_v284-USDJPY-GUARDS4.md').read_bytes().decode('utf-8').splitlines()
out = []
for k in range(len(t)):
    if t[k].startswith('Verification split') or t[k].startswith('Nothing else'):
        out.append(str(k + 1) + ' PROSE ' + t[k][:50])
    m = re.match(r'^P(\d{3}):', t[k])
    if m and int(m.group(1)) in (1, 100, 182, 191, 194):
        out.append(str(k + 1) + ' TWINP' + m.group(1))
    m2 = re.match(r'^C(\d+): ', t[k])
    if m2 and int(m2.group(1)) in (8086, 1728):
        out.append(str(k + 1) + ' CODE' + m2.group(1))
    if t[k].startswith('hits='):
        out.append(str(k + 1) + ' ROW')
pathlib.Path('SRJ_FlowNexus_Local/00_CURRENT_WORKING/relaymap.txt').write_text(chr(10).join(out), encoding='utf-8')
print('wrote', len(out))
