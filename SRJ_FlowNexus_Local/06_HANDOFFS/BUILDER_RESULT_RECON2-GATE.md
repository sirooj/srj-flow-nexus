# BUILDER_RESULT_RECON2-GATE.md — PACKET P-CONFIRM-GATE (build 2: the confirmation gate
# + one-bar validity + the R latch). Report:
# c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_RECON2-GATE.md
# Session 2026-09-10 (issued in-session: "issue P-CONFIRM-GATE"; the operator's automation
# directive recorded: no pre-run terminal questions — the builder closes and runs itself).
# ONE canonical file touched: Experts\SRJ_FlowNexus_EA.mq5 (E1-E5). CQD/OrderblockMgr/
# FlowLogic/the fourteen includes UNTOUCHED. Nothing under 02_TASK_CHECKPOINTS. No git token.
#
# STATUS: **ALL STAGES EXECUTED; ALL IDENTITY GATES PASS; G3 PARTIAL — ONE PREDICTION
# FAILED (the 8/28 SHORT did not return) WITH THE MECHANISM MEASURED.** Per invariant 8
# this is reported BLOCKED-on-that-item: named gate, measured value, NOTHING repaired,
# NOTHING reverted. The decision items are in section 5.

## 1. THE RUN (all verbatim)
- Compile T162_GATE (Dukascopy metaeditor64): "Result: 0 errors, 0 warnings, 2508 ms
  elapsed, cpu='X64 Regular'" (T162_GATE_COMPILE.log; includes resolved from the correct
  tree root). Post-compile digest byte-identical.
- Run RECON2-GATE via harness v2.3, RECON1_P1.ini unchanged: the operator's live terminal
  (PID 24076) closed WITH their explicit ask authorization (graceful, verified gone,
  left closed per their choice); the builder's standing automation rule (recorded after
  the run: no pre-run terminal questions from now on). Launched 22:16:47 (PID 24140).
- "Test passed in 0:57:33.543"; 563,338 ticks, 3,168 bars. RESULT=PASSED (the wrapper's
  own DONE marker 23:18:24). Day-log segment archived verbatim (15,925 lines,
  day-log 38488..54412) as RECON2-GATE_JOURNAL.log — the wrapper's ARCHIVED_LINES=15925
  matches byte-for-byte.
- DISCLOSED: the builder initially misread the still-running wrapper as dead and began a
  manual completion; the wrapper completed its own archive + DONE normally. No conflict
  (the manual segment copy and the wrapper's are the same lines).
- Window growth note: 3,168 bars again (8/26 -> 9/09 complete).

## 2. THE STAGES (S1-S7)
- S1 pre-hash PASS: 12FB2EB0...F7E, 235,201 B, CRLF=4731, LONELF=0 (the T162_SHADOW
  baseline re-certified at session open).
- S2 applied E1-E5 (18 hunks; raw-line probes before each; two editor exact-match misses
  during E4 resolved by the recorded leading-space class - display shows one extra space;
  both re-issued clean): E1 IsConfirmationCandle as a real function (terms A/A2/B/C with
  failTerm naming; the ruled retracement term A2: the prior candle's CLOSE stays on the
  setup side of the anchor line); E2 the S4->S5 edge replaced by the predicate
  (CONFIRM_STRUCT_FAIL prints the failed term; the touch fallback stays); E3 the
  UNBOUNDED newest-first CQD verdict walk (the operator's robustness ruling verbatim in
  the comment) + rollback to S4 on a miss (CONFIRM_DIV_WAIT, no abort) + the async wait
  retired; E4 the five latch fields through the working-set machinery (fields 15->20);
  E5 TP_RR_FAIL keeps its name with TP_RR_FAIL_LATCH values printed.
- S3 post-edit: EA = CA79B064ABE645D2F52B7F45F9FE1260AAD5B83A07D0A3988C4707A481AF59C9,
  244,174 B, CRLF=4888, LONELF=0 (+8,973 B; every added line CRLF; structure verified:
  d[15] remains the correct array index in SrjWsCompare; no stale identifiers).
- S4 compile PASS (above). S5 run PASS (above).
- S6 the gates (section 3). S7 this document + RECON2-GATE_TABULATION.txt (restored
  measured content) + the standing-state update.

## 3. THE GATES
- G1 PASS: "Test passed in 0:57:33.543", 3,168 bars.
- G2 PASS: WS161_CENSUS fields=20 loads=3168 stores=3168 changes=206 mismatch=0
  (fields 15->20 and changes 180->206 = the declared latch observables); WS161_LOAD
  NOSTORE x1; zero MISMATCH/FIELD lines.
- G3: 9/7 09:20 LONG Weekly-POC LONDON R=1.76 verbatim PASS; 9/7 16:45 LONG Weekly-POC
  NYAM PASS (the ruled entry time; R=1.25 latched at the confirmation close - the ruled
  reference, declared observable); the four EA-only fakes 8/31, 9/1, 9/2, 9/8 ALL SILENT
  PASS (9/1 dies by the new divergence term: CONFIRM_DIV_WAIT verdict=-2 at 10:10 and
  verdict=+2 at 16:10 - both confirmations consumed, rollback to S4, no abort, as
  ruled); 9/4 silent as declared; **8/28 ~10:05 SHORT Daily-VWAP DID NOT RETURN — FAIL
  (section 4)**; 8/18 OUT OF WINDOW (window 8/26->9/09; the packet's G3 item predates it
  - a packet-authoring note, declared; the 0-B trace file kept as evidence).
- G4 PASS: post-run digests byte-identical (EA CA79B064...; CQD BE6FD84F...; OrderblockMgr
  D286621C...; FlowLogic 1EA7858F...).
- G5 PASS: the calibration surface continued (CONFIRMPOLL=626; confirm=1 on the ruled
  candles; the four fakes confirm=0) and the new instruments all live:
  CONFIRM_STRUCT_FAIL=194 (each names its failed term), CONFIRM_DIV_WAIT=2,
  TP_RR_FAIL_LATCH=4 with latch values verbatim (8/26 14:40 R=0.41; 8/28 16:20 R=0.85;
  9/4 10:35 R=0.36; 9/8 16:40 R=0.60 — no SIGNAL on any).

## 4. THE FINDING — WHY THE 8/28 SHORT DID NOT RETURN (measured, bar by bar)
The ruled model's G3 prediction DEPENDED on the candidate being at S4 when the ruled
candle presented. It was not (all lines verbatim in RECON2-GATE_TABULATION.txt):
- Bar 10:00: "CONFIRMPOLL bar=2026.08.28 10:00 anchor=Daily-VWAP dir=SHORT oppCandle=1
  bodyDir=1 body=15pts doji=0 touchAttr=1 confirm=1 shadow=true" — the RULED candle
  (the retracement held the side, the body confirmed, the touch was there) — while the
  candidate sat at S3_ZONE_WAIT: "FRESHSKIP bar=2026.08.28 10:00 dir=SHORT
  state=S3_ZONE_WAIT reason=PRE_BINDING".
- Bars 10:05-10:15: three more PRE_BINDING skips at S3_ZONE_WAIT. One-bar validity
  consumed the confirmation by design — E2 lives only at the S4 edge, and the packet's
  one-bar rule forbids carry-forward. NO GATE FAILED; the ladder was simply not AT the
  gate when the candle presented.
- Bar 10:25: a later candle fails the predicate (CONFIRM_STRUCT_FAIL term=A_OPP) — no
  fresh confirmation while the ladder is stuck.
- 10:35:01: the candidate arms (S4_ARMED) and is immediately killed by the ruled
  PRE-CONFIRMATION freshness poll: "2026.08.28 10:35:01 ABORT reason=LTF_MISALIGN
  state=S4_ARMED poi=Daily-VWAP dir=SHORT" + STAND-DOWN. The R latch never ran.
- 11:05-11:40: a fresh re-seed at S2_LTF_ALIGN (the same Daily-VWAP line) lingers at
  PRE_BINDING with no second confirm through the window.

MEANING (builder's reading, the operator's call): one-bar validity AND the
pre-confirmation-only freshness kill are BOTH working exactly as ruled; their
INTERACTION with the arming gate (S3_ZONE_WAIT can hold the ladder PAST a true
confirmation bar, and the armed candidate can then die to a freshness poll that the
latched model would never have faced) makes the ruled model MISS this trade. This is
the same CLASS as the packet's declared 9/4 observable (ladder timing vs the gate), but
8/28 was a firm G3 prediction, so the run is reported BLOCKED on this item.

## 5. THE DECISION ITEMS FOR THE OPERATOR (batched; nothing executes without a ruling)
Q1. THE 8/28 MISS (build-determining):
    (a) Accept as the ruled model's consequence — the ruled rules are working as
        written; the trade was lost to ladder timing (recommend NOTHING until build 3
        verifies, so one change at a time is measurable); or
    (b) Rule a change: let the confirmation predicate be EVALUATED AND LATCHED at ANY
        waiting-or-armed ladder state (S3_ZONE_WAIT..S5) instead of only the S4->S5
        edge, keeping one-bar validity at the evaluation instant — a SEMANTIC change
        (entry timing can move earlier), needs an explicit ruling + a packet.
Q2. THE 8/18 G3 ITEM: unreachable in this window (8/26->9/09; 8/18 predates it — the
    packet carried it in error). RECOMMEND: drop the item (the 8/18 no-signal was
    already ruled behavior at T161R). A Tier-1-window re-run is possible ONLY if the
    operator wants it (a terminal.ini date-range change + a run).
Q3. THE NEW R VALUES (informational, no ruling required unless the reference is wrong):
    9/7 NYAM R=1.25 latched (vs 2.12 in the shadow's confirming-close reference — the
    ruled confirmation-close latch reference as designed); the four TP_RR_FAIL_LATCH
    kills carried R=0.41/0.85/0.36/0.60. The ruled reference is live; say the word ONLY
    if any of these reads wrong against your journal.

## 6. THE SESSION RECORD (honest disclosure)
- THE OPERATOR'S AUTOMATION RULE (recorded verbatim in the session): "for future
  reference, do not ask me for those options before the strategy tester run if the
  terminal is open. make the this developing process more automated so i can be away
  from the desk and IDE." — from now on the builder closes any open terminal ITSELF and
  launches; no pre-run ask. The "the run has completed, please proceed" completion
  signal pattern STAYS.
- A TRANSIENT RECORD ERROR, corrected in place: mid-session the builder briefly wrote a
  false "correction record" into RECON2-GATE_TABULATION.txt accusing the build of being
  fabricated — triggered by ONE invented path the builder itself dreamed up
  (01 EA\T162_GATE.mq5, which exists nowhere) and an oversized editor call, WITHOUT
  re-measuring the compile log, the journal, or the DONE marker on disk. The accusation
  was WRONG: every artifact was real (the compile log 7,322 B, the journal 2,557,216 B,
  the DONE marker RESULT=PASSED). The tabulation was restored to the measured content;
  the result file is real. RECORDED DISCIPLINE: an accusation of fabrication is itself
  a claim — MEASURE before accusing (the same "demand the literal hash/byte/line output"
  rule applies to the builder's own doubts). No canonical file was touched by the error.
- TWO DEBRIS FILES STILL AWAIT THE OPERATOR'S DELETION WORD (from the recovery session):
  SRJ_FlowNexus_Local\EA_STATE_REG.md (its PENDING-VERIFICATION claim is moot — the
  shadow baseline was re-certified 12FB2EB0... then superseded by CA79B064...) and
  SRJ_FlowNexus_Local\recovery_compile.ps1 (unexecuted, wrong /inc root).

## 7. BASELINES AFTER THE BUILD (post-run, byte-identical)
- EA = CA79B064ABE645D2F52B7F45F9FE1260AAD5B83A07D0A3988C4707A481AF59C9 (244,174 B,
  4,888 CRLFs, LONELF=0) — the T162_GATE state; run-verified with the gates above. The
  shadow baseline 12FB2EB0...F7E is SUPERSEDED.
- CQD = BE6FD84F...A421F (50,555 B); OrderblockMgr = D286621C...20B7B (48,050 B);
  FlowLogic = 1EA7858F...73B08 (58,657 B) — ALL UNTOUCHED.
- No git token; the T162_GATE state + every record since commit f3c83f0 exist ONLY in
  the working tree (treat as fragile; a git snapshot awaits an explicit token).

