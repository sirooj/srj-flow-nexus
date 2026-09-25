import pathlib
import re
rel = pathlib.Path('SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RELAY_COUNCIL_v284-USDJPY-GUARDS4.md').read_text(encoding='utf-8').splitlines()
s = next(k for k in range(len(rel)) if rel[k].startswith('Reviewer demands'))
e = next(k for k in range(len(rel)) if rel[k].startswith('Verification split'))
F = {}
for sn in ['LUNA', 'SONNET', 'GLM']:
    F[sn] = pathlib.Path('SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_VERDICTS_' + sn + '.md').read_bytes().decode('utf-8')
cur = None
total = 0
bad = []
for k in range(s, e):
    m = re.match(r'^- (Luna|Sonnet|GLM|Blocking)\b', rel[k])
    if m:
        cur = m.group(1).upper()
        if cur == 'BLOCKING':
            cur = None
    if cur is None:
        continue
    for q in re.finditer(r'"([^"]{20,})"', rel[k]):
        total += 1
        if q.group(1) not in F[cur]:
            bad.append((k + 1, cur, q.group(1)[:80]))
print('quoted-spans=', total)
print('mismatches=', len(bad))
with open('SRJ_FlowNexus_Local/00_CURRENT_WORKING/quote_mismatch.txt', 'w', encoding='utf-8') as f:
    for ln, seat, span in bad:
        f.write('L' + str(ln) + ' [' + seat + '] ' + span + '\n')
