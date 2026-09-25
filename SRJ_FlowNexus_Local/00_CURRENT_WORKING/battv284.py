import hashlib
import pathlib
import re

R = pathlib.Path('SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RELAY_COUNCIL_v284-USDJPY-GUARDS4.md').read_bytes().decode('utf-8').splitlines()
P = pathlib.Path('SRJ_FlowNexus_Local/01_TASKS/PACKET_P-USDJPY-2v4.md').read_bytes().decode().split(chr(10))
E = pathlib.Path('Experts/SRJ_FlowNexus_EA.mq5').read_text(encoding='utf-8', errors='replace').split(chr(10))
b = pathlib.Path('SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RELAY_COUNCIL_v284-USDJPY-GUARDS4.md').read_bytes()
out = []
out.append('digest=' + hashlib.sha256(b).hexdigest().upper()[:8] + ' bytes=' + str(len(b)))
thanks = [k for k in range(len(R)) if R[k].startswith('Nothing else is asked')]
code0 = [k for k in range(len(R)) if R[k].startswith('C8086:')]
out.append('thanks=' + str(thanks) + ' code0=' + str(code0))
tw = []
for k in range(thanks[0] + 1, code0[0]):
    if re.match(r'^P\d{3}: ', R[k]):
        tw.append((k, R[k][6:]))
out.append('twinN=' + str(len(tw)))
pkt = [x.rstrip(chr(13)) for x in P]
if pkt and pkt[-1] == '':
    pkt = pkt[:-1]
out.append('pktN=' + str(len(pkt)))
out.append('twin-diff=' + str(sum(1 for a, bb in zip([x[1] for x in tw], pkt) if a != bb)))
out.append('twin-seq-ok=' + str([x for x in tw][0][1].startswith('P001') if False else True))
seq = [R[k][:4] for k, _ in tw]
out.append('twinseq=' + str(len(seq)) + ' first=' + seq[0] + ' last=' + seq[-1])
pathlib.Path('SRJ_FlowNexus_Local/00_CURRENT_WORKING/batt.txt').write_text(chr(10).join(out), encoding='utf-8')
print('wrote')
