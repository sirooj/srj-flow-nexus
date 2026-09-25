import pathlib

def lines(path):
    return pathlib.Path(path).read_bytes().decode('utf-8').splitlines()

LUNA = 'SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_VERDICTS_LUNA.md'
SONNET = 'SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_VERDICTS_SONNET.md'
GLM = 'SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_VERDICTS_GLM.md'
RELAY = 'SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RELAY_COUNCIL_v284-USDJPY-GUARDS4.md'

VL = lines(LUNA)
VS = lines(SONNET)
VG = lines(GLM)


def span(arr, a, b):
    assert 0 <= a < b <= len(arr), 'bad span'
    chunk = arr[a:b]
    assert any(x.strip() for x in chunk), 'empty span'
    while chunk and not chunk[-1].strip():
        chunk.pop()
    while chunk and not chunk[0].strip():
        chunk.pop(0)
    return chunk


demands = []
# (seat, tag, arr, start0, end0exclusive, ruling)
spec = [
    ('LUNA', 'Q1', VL, 9768, 9800, 'RULED - proof narrowed in v11 to block/no-block truth value; shared helper DEFERRED for scope; re-asked as v284 Q1.'),
    ('LUNA', 'Q2', VL, 9800, 9842, 'RULED ADOPTED as explicit both-bounds tripwire (equal falls silent).'),
    ('LUNA', 'A1', VL, 9844, 9854, 'RULED - proof narrowed in v11.'),
    ('LUNA', 'A2', VL, 9854, 9876, 'RULED ADOPTED as explicit tripwire.'),
    ('LUNA', 'A3', VL, 9876, 9899, 'RULED ADOPTED as walked/skipped counters plus HTF SKIP print.'),
    ('LUNA', 'A4', VL, 9899, 9917, 'RULED ADOPTED as epoch-sentinel clause.'),
    ('LUNA', 'A5', VL, 9917, 9935, 'RULED ADOPTED as positive field predicate plus mismatch rule.'),
    ('LUNA', 'A6', VL, 9935, 9955, 'RULED - renamed opposition-kill / POI-break.'),
    ('LUNA', 'A7', VL, 9955, 9973, 'RULED - S1 print census carries SKIP reasons and S54 define.'),
    ('LUNA', 'A8', VL, 9973, 9990, 'RULED - noted gap, no action (single anti counter suffices for the gate).'),
    ('LUNA', 'A9', VL, 9990, 10006, 'RULED - noted (walked/skipped plus raw fields mitigate; no per-class split in refinement).'),
    ('LUNA', 'A10', VL, 10006, 10016, 'RULED - STAGE-1 disk diff proves the v9 to v10 drop on record.'),
    ('LUNA', 'A11', VL, 10016, 10026, 'RULED - noted (ruled by paraphrase plus finding, per verification split).'),
    ('LUNA', 'A12', VL, 10026, 10040, 'RULED - ABORT-row state separation plus B8 post-kill silence window.'),
    ('LUNA', 'A13', VL, 10040, 10050, 'RULED - GUARD-pairing procedure documented (abort rows never read alone).'),
    ('LUNA', 'A14', VL, 10050, 10070, 'RULED - run-grade property tested by B8 window.'),
    ('LUNA', 'A15', VL, 10070, 10084, 'RULED - proof narrowed as stated.'),
    ('LUNA', 'B1', VL, 10087, 10112, 'RULED DEFERRED (new function surface, needs scope word).'),
    ('LUNA', 'B2', VL, 10112, 10133, 'RULED ADOPTED as explicit tripwire.'),
    ('LUNA', 'B3', VL, 10133, 10151, 'RULED ADOPTED as counters plus SKIP prints.'),
    ('LUNA', 'B4', VL, 10151, 10164, 'RULED ADOPTED as epoch-sentinel clause.'),
    ('LUNA', 'B5', VL, 10164, 10184, 'RULED - renamed opposition-kill / POI-break.'),
    ('LUNA', 'Bottom', VL, 10184, 10191, 'RULED - tally reference (halted on Q1-structural + Q2-tripwire; fold v11).'),
    ('SONNET', 'Q1', VS, 1940, 1952, 'RULED - proof narrowed in v11; helper deferred; re-asked as v284 Q1.'),
    ('SONNET', 'Q2', VS, 1952, 1974, 'RULED ADOPTED as explicit tripwire.'),
    ('SONNET', 'A1', VS, 1976, 1977, 'RULED ADOPTED as explicit tripwire (same defect as Q2/Gap1).'),
    ('SONNET', 'A2', VS, 1977, 1978, 'RULED - proof narrowed in v11.'),
    ('SONNET', 'A3', VS, 1978, 1979, 'RULED ADOPTED as asymmetric open/close clause in v11.'),
    ('SONNET', 'A4', VS, 1979, 1980, 'RULED ADOPTED as tripwire (same as Gap-1).'),
    ('SONNET', 'A5', VS, 1980, 1981, 'RULED - GUARD-pairing procedure documented.'),
    ('SONNET', 'A6', VS, 1981, 1983, 'RULED - noted correct (v10 header 83/+56 verified; no action).'),
    ('SONNET', 'B-Q2fix', VS, 1985, 1986, 'RULED ADOPTED as explicit tripwire.'),
    ('SONNET', 'B-Q1wording', VS, 1986, 1987, 'RULED ADOPTED as narrowed proof.'),
    ('SONNET', 'B-durable', VS, 1987, 1988, 'RULED DEFERRED (new function surface, needs scope word).'),
    ('GLM', 'Q1', VG, 4477, 4493, 'RULED - carried (YES stands; proof narrowed alongside).'),
    ('GLM', 'Q2', VG, 4493, 4504, 'RULED ADOPTED as explicit tripwire.'),
    ('GLM', 'A1', VG, 4506, 4507, 'RULED - proof narrowed in v11.'),
    ('GLM', 'A2', VG, 4507, 4508, 'RULED - pairs corrected to bias/opposed with flip stated.'),
    ('GLM', 'A3', VG, 4508, 4509, 'RULED - renamed opposition kill with two emitters.'),
    ('GLM', 'A4', VG, 4509, 4510, 'RULED ADOPTED as explicit tripwire.'),
    ('GLM', 'A5', VG, 4510, 4511, 'RULED - S1 states trailing-space boundaries with SKIP subtracted.'),
    ('GLM', 'A6', VG, 4511, 4512, 'RULED ADOPTED as raw fields (-1s adjudicable).'),
    ('GLM', 'A7', VG, 4512, 4513, 'RULED ADOPTED as global mismatch clause (halt with attribution).'),
    ('GLM', 'A8', VG, 4513, 4514, 'RULED - B2 notes E6a-primary with pobreak adjudicated.'),
    ('GLM', 'A9', VG, 4514, 4515, 'RULED - noted as grade-tested assumption with B8 window.'),
    ('GLM', 'A10', VG, 4515, 4516, 'RULED ADOPTED as epoch-sentinel clause.'),
    ('GLM', 'A11', VG, 4516, 4517, 'RULED - scope names EA 7119-7130 (no edit this round).'),
    ('GLM', 'A12', VG, 4517, 4518, 'RULED - MTEXIT row pasted in v284 rows fence (1x verified).'),
    ('GLM', 'A13', VG, 4518, 4519, 'RULED - WAIVED pair pasted in v284 rows fence (count 2).'),
    ('GLM', 'A14', VG, 4519, 4520, 'RULED - noted (ruled by paraphrase plus finding).'),
    ('GLM', 'A15', VG, 4520, 4521, 'RULED ADOPTED as dynamic-anchor clause.'),
    ('GLM', 'A16', VG, 4521, 4522, 'RULED - noted pre-existing outside all anchors.'),
    ('GLM', 'Deferrals', VG, 4522, 4525, 'RULED - recorded consistent with parked scope (no shared helper/latch/side/retain-print).'),
    ('GLM', 'B1', VG, 4527, 4528, 'RULED ADOPTED as raw fields (plus skipped count).'),
    ('GLM', 'B2', VG, 4528, 4529, 'RULED ADOPTED as explicit tripwire.'),
    ('GLM', 'B3', VG, 4529, 4531, 'RULED - GUARD-row seedbar cross-reference covers adjudication (no new fields in refinement).'),
    ('GLM', 'Standing', VG, 4531, 4532, 'RULED - noted (verification split respected; probe/print-only stands).'),
]

arr = {'LUNA': VL, 'SONNET': VS, 'GLM': VG}
assert len(spec) == 23 + 11 + 23, 'spec count wrong'
blocks = []
badspans = []
for seat, tag, arrname, a, b, ruling in spec:
    arr = {'LUNA': VL, 'SONNET': VS, 'GLM': VG}[seat]
    chunk = arr[a:b]
    if not any(x.strip() for x in chunk):
        badspans.append((seat, tag, a, b))
        continue
    while chunk and not chunk[-1].strip():
        chunk.pop()
    while chunk and not chunk[0].strip():
        chunk.pop(0)
    blocks.append('- ' + seat + '-' + tag + ' (filed V283 ' + seat + ' verdict):\n' + '\n'.join(chunk) + '\n' + ruling)
if badspans:
    pathlib.Path('SRJ_FlowNexus_Local/00_CURRENT_WORKING/badspans.txt').write_text(chr(10).join(str(x) for x in badspans), encoding='utf-8')
    print('BADSPANS=' + str(len(badspans)))
    raise SystemExit(1)

newblock = 'Reviewer demands from v283, quoted complete with rulings (nothing built on unruled demands; sources: BUILDER_VERDICTS_LUNA.md, BUILDER_VERDICTS_SONNET.md, BUILDER_VERDICTS_GLM.md under V283 headers):\n' + '\n'.join(blocks)

R = pathlib.Path(RELAY).read_bytes().decode('utf-8')
startmark = 'Reviewer demands from v283'
assert R.count(startmark) == 1, 'start anchor wrong'
start = R.index(startmark)
endmark = 'Verification split:'
assert R.count(endmark) == 1, 'end anchor wrong'
end = R.index(endmark)
assert start < end, 'anchor order wrong'
new_text = R[:start] + newblock + '\n\n' + R[end:]
new_text = new_text.replace('\n', '\r\n')
pathlib.Path(RELAY).write_bytes(new_text.encode('utf-8'))
print('bullets=', len(blocks))
print('bytes=', len(new_text.encode('utf-8')))
