import pathlib
import re
rel = pathlib.Path('SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RELAY_COUNCIL_v284-USDJPY-GUARDS4.md').read_bytes().decode('utf-8').splitlines()
s = next(k for k in range(len(rel)) if rel[k].startswith('Reviewer demands'))
e = next(k for k in range(len(rel)) if rel[k].startswith('Verification split'))
F = {}
for sn in ['LUNA', 'SONNET', 'GLM']:
    F[sn] = pathlib.Path('SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_VERDICTS_' + sn + '.md').read_bytes().decode('utf-8')
cur = None
matched = []
nomatch = []
for k in range(s, e):
    m = re.match(r'^- (Luna|Sonnet|GLM|Blocking)\b', rel[k])
    if m:
        cur = m.group(1).upper()
        if cur == 'BLOCKING':
            cur = None
    if cur is None:
        continue
    for q in re.finditer(r'"([^"]{20,})"', rel[k]):
        span = q.group(1)
        idx = F[cur].find(span)
        if idx < 0:
            nomatch.append((k + 1, cur, span[:70]))
            continue
        heads = [mm.start() for mm in re.finditer(r'## V28\d-USDJPY-[A-Z0-9]+ (OPEN|END) ' + cur, F[cur]) if mm.start() < idx]
        tag = 'UNKNOWN'
        if heads:
            tail = F[cur][heads[-1]:heads[-1] + 60]
            tag = tail.split(' ')[1] if len(tail.split(' ')) > 1 else tail[:20]
        matched.append((k + 1, cur, tag, span[:70]))
with open('SRJ_FlowNexus_Local/00_CURRENT_WORKING/round_map.txt', 'w', encoding='utf-8') as f:
    f.write('MATCHED ' + str(len(matched)) + '\n')
    for m in matched:
        f.write(str(m) + '\n')
    f.write('NOMATCH ' + str(len(nomatch)) + '\n')
    for m in nomatch:
        f.write(str(m) + '\n')
print('done')
