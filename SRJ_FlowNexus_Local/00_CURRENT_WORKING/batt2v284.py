import pathlib
import re
R = pathlib.Path('SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RELAY_COUNCIL_v284-USDJPY-GUARDS4.md').read_bytes().decode('utf-8').splitlines()
E = pathlib.Path('Experts/SRJ_FlowNexus_EA.mq5').read_text(encoding='utf-8', errors='replace').split(chr(10))
out = []
cd = [(k, x) for k, x in enumerate(R) if re.match(r'^C\d+: ', x)]
out.append('code-lines=' + str(len(cd)))
regions = [(8086, 8112), (5117, 5146), (7119, 7130), (302, 324), (7099, 7102), (1728, 1733)]
bad = []
for k, x in cd:
    n = int(x[1:x.index(':')])
    if not any(a <= n <= b for a, b in regions):
        bad.append((k + 1, n))
    elif x.split(': ', 1)[1] != E[n - 1].rstrip(chr(13)):
        bad.append((k + 1, n))
out.append('code-bad=' + str(bad))
rows = [(k + 1) for k, x in enumerate(R) if x.startswith('hits=1:') or x.startswith('hits=2 ')]
out.append('rows=' + str(len(rows)) + ' first=' + str(rows[0]) + ' last=' + str(rows[-1]))
dots = [(k + 1) for k, x in enumerate(R) if '...' in x]
out.append('ellipsis-lines=' + str(dots))
pathlib.Path('SRJ_FlowNexus_Local/00_CURRENT_WORKING/batt2.txt').write_text(chr(10).join(out), encoding='utf-8')
print('wrote')
