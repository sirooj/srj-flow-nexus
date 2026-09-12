# BUILDER_RESULT_RECON9-SWINGIMB2 — P-SWINGIMB-2 EXECUTED (gates 1-7 PASS with two owned instrument defects, relayed)

Run RECON9-SWINGIMB2: "Test passed in 1:01:41.477", 563338 ticks, 3168 bars,
RESULT=PASSED by wrapper DONE 2026-09-12 11:18:59. Ini unchanged; window
untouched. Journal RECON9-SWINGIMB2_JOURNAL.log (2789841 B, gitignored) +
TABULATION (39 lines) in 06_HANDOFFS.

## S1–S5
- S1 pre-hash PASS (EA 57B2F9D3-lineage superseded by RECON8 build; no writes
  since RECON8 verification). E5.3 halt check: slOb exposes swingBar
  (FlowLogic buffer-27 site) — same branch, same pointer, no halt, no search.
- E5 FlowLogic: buffer 39 (`g_bufObSwingTime`, 28/30/33 encoding, 0.0 unset),
  indicators 39→40, plots unchanged, EMPTY forbidden noted, init 0.0,
  SWINGIMB_PROGRESS every 500 full-pass writes + naAlive counter, OnDeinit
  line kept and extended. NO new input; positional iCustom frozen.
- E6 EA: ApexShift helper; SlimbTuple body reads + apex audit routed through
  it; ReadFlow-frame note in token comment (shifts NOT renumbered);
  FL_BUF_OB_SWING_TIME 39 via ReadFlow; OB-source chosen resolved by bar
  time (iBarShift − FLOW_SHIFT_OFFSET, value-verified, cause-channel
  NOOBSLOT:/NOOBTIME: in cands, never absorbed).
- E7 EA: SHADOW_SLIMBWALK, SlimbWalkEmit 17 tokens + fields=17, 9 call sites
  (4 true with walk, 5 false → UNRESOLVED), own counters only, no memo
  contact. No side test on walk candidates (packet-literal; §6 open item).
  No extremity filter on walk (packet-literal; §6 open item).
- S3 digests: EA 34BD7D82147CEABD365271790365AC87BBF7297BAC74DFF93A37017BEBAA4FF0
  (283725 B); FlowLogic 3606BFB480A34B5ED4357588DDAFDFE8F7DF2224DA34C6A220EA49F506725911
  (67515 B). Post-run re-hash byte-identical.
- S4: both compile 0/0 (Flow 5142 ms, EA 2012 ms).

## S6 — gates
1. 0/0 both ✓ (strict not set in sources; log lines are the instrument).
2. Four-signal set verbatim (R 2.43/2.56/1.76/1.25) ✓.
3. All RECON8 identities verbatim: CQD 906=170/308/263/165; WS161 21/205/0;
   BIAS 1554/1614 ×2; ZONE 3168/1056/0; PROMO 469; CONFIRMPOLL 555;
   SUPPRESSED 156; MTEXIT 4 (TP/FLIP/TP/TP); MTSNAP 4; aborts
   18/37/13/11/2/0/12; SLMEMO 471/118/589; SL_REF 432/39/10;
   S2POLL_NO_SL_REF=0; S5_NO_SL_REF=0; INPLAYCOMMIT 157 (COMMITTED1 46);
   fields=21 ✓. SLIMB 481 (432+39=471, S5 10, PRE 0, BADFMT 0); avail
   481/481; exposed-chosen 140/140; apex 481/481; **chosen exposure 481/481
   (CHOSEN_NEG=0, NOOB=0)** — E6 resolution complete, zero residuals ✓.
4. SLIMBWALK 481 = SLIMB 481, BADFMT 0, S5 10; UNRESOLVED 0 ✓ (zero false
   exits in-window: all 481 invocations returned a reference).
5. Progress present (102 lines; last: writes=51000 highs=25551 lows=25449
   code0=583 code1=292 code2=178 code3=49947 **naAlive=0**). Reconciliation:
   EA_avail 481 ≤ FL_writes 51000 ✓; code sets subset-agree (EA {0,1,2} ⊆
   FL {0,1,2,3}; FL code3 = pre-first-bias history, never on evaluated bars
   — f3=0/481 consistent). **naAlive=0 discharges the fail-open**: all 292
   code-1 writes were positively observed alive (remTop>remBottom), none
   NA-decided. SWINGIMB_CENSUS OnDeinit still absent (tester drops it, twice
   proved) — progress replaces it per the granted capture method.
6. Acceptance: 29/29 pre-existing classes d=0 R8→R9; deltas only +481
   SLIMBWALK +102 PROGRESS. Full body-diff: no INPLAYCOMMIT/XOBPROMO/
   SWEPTMASK bodies differ (gate-8 content, whole window) ✓.
7. Digests §S3. No commit. No 02_TASK_CHECKPOINTS write. ALERT-ONLY kept.

## §6 — TRUE walk data + two owned defects (read-only recount, n=481)
Printed class TEQN=481 is overstated: the else-branch mislabels
"walk moved, nuance followed, today equals neither" (no packet class fits).
True partition from operands: **carve-held (nuance==today, base≠today) 106;
BASEMOVED (base==nuance≠today) 375** (of which same-turn ≤1pt 16, wider-
protective 207, tighter-direction 152); ALL3/TEQB/EXH/UNRES 0. skipSeen 302.
Defect 1 (mine): missing BASE_MOVED class — fix + recount, no rerun needed
for the recount (operands on disk), rerun needed for corrected labels.
Defect 2 (spec gap, relayed not assumed): walk takes first code-1 outward
with NO extremity filter — 16 same-turn + 152 tighter-direction slBase
values contradict ruling (a) ("more extreme price level"); the 2-swing
branch's 1-pt exceeds idiom exists for exactly this. Side test likewise
absent (packet-literal). QUESTIONS FOR COUNCIL: adopt the exceeds idiom?
per-candidate side test vs slCurPx? Proposed class name BASE_MOVED.
No walk-definition change until ruled. W|B operands this run ARE frame-
correct (ApexShift) — prior-run marginals stay disclaimed per Finding 3a.

## State
- Candidate baselines (uncommitted): EA 34BD7D82 / FlowLogic 3606BFB4.
- Artifacts: packet 01_TASKS\PACKET_P-SWINGIMB-2.md (footer updated);
  scripts launch_swingimb9run/tabulate_swingimb9run/analyze_walk9 in
  00_CURRENT_WORKING; STATUS/DONE RECON9. Terminal closed graceful.
- Queue: council verdict (gates + §6 questions + naAlive discharge note);
  origin push retry on operator's credential word; news table draft;
  RECON Phase-2; debris word.
