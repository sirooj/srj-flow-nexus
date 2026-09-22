# BUILDER_RESULT_RECON49-EXT1LIVE-V35 - v35 goal-layer probe run (2026-09-20)

Run: RECON49-EXT1LIVE-V35. DONE=PASSED 2026-09-20 18:36:24 (wall 60m39s;
launch 17:35:45, ceiling 90; tester Test passed, connection closed 18:36:09).
Wall includes his unplugged span - no gate reads wall clock; the tester range
completed the full window.
Build: EA 7C247F459A983F6BD3D234D84DE366C6F3F9B78DC6CDDDB3A0415AA4D295E8A3 /
614043 B (v35: D1 LOTDIAG v2 plus D2a/D2b/D2c SEEDDIAG, tag -v32,
uncommitted). Compile: 0 errors, 0 warnings
(06_HANDOFFS\EXT1LIVE-V1_EACOMPILE.log, per BUILDER_BUILD_RECORD_V35.md).
Packet: v35 (22475D22971B87A0040942F3D7B09C482CE33E7023A7BB3E9D9CB2FAC0CA5E0F /
165814 B / 58 lines). Relay: v198
(2BCDBA8F1622AEEFE7E18511619A2C5C6476B07D329FFDD8B62DB1C2E47C7198 / 52026 B /
42 lines, twin 5/5, morning rows 9/9, T2 rows 4/4).
Auth: triple-key spent (Luna-V198-001 ACCEPT key-1 plus Sonnet/GLM ACCEPT
advisory plus his verbatim Astra-waiver plus run word). No new build, run, or
commit here.
Segment: 06_HANDOFFS\RECON49-EXT1LIVE-V35_JOURNAL.log =
48E3F4145F123838FD895A801A2BF185D7F6D9C485A23196BF7AB0F1D4152C1A /
7244639 B / 37361 lines = STATUS ARCHIVED_LINES 37361 exactly.
Tabulate: 00_CURRENT_WORKING\tabulate pattern plus probe scripts (ASCII,
read-only, segment-only; gates re-derived from the SEGMENT, never the day log).

## DONE-gate (segment-derived, STATUS cross-checked only)

- DONE RESULT=PASSED; no REFUSED_* gate, no TIMEOUT_60MIN. Wall 60m39s
  inside the 90-min ceiling.
- Single run: testing-of count 2 (announcement plus core-start pair, standard
  MT5 pair) from 2026.08.26 00:00 to 2026.09.10 00:00; one Test-passed, one
  connection-closed, one final balance 10183 JPY (identical to RECON48 -
  deterministic replay of the base path).
- Range/inputs match the cleared envelope (RECON44_DEMO_P1, InpMode 1,
  08-26 to 09-09, InpDebugLog=true): same window as RECON48.
- No-drift proof vs v30 segment: SIGNAL-dir 12/12, A6REFUSED 57/57, ABORT
  57/57, TP_ELECT 11/11 with identical fire rows (3.43/1.48/1.74/4.86/2.34/
  2.52/1.62 plus non-fire 0.35/0.18/0.34/0.63), SCHEMA 1, NORMAL 39
  (13 records x 3, emitSeq 1..13 contiguous), STOPRESOLVE 40 with max 525,
  BSAVE_FAIL 0, type-CAP 0, file-wide ? 0. The v30 transport baseline
  reproduces exactly; only the two new families are added.

## Realized delta (promise vocabulary of the v198 NOVEL-EVIDENCE paragraph)

IMPROVED (no prior run had any of this):
- LOTDIAG on every lot-calc bar (7 lines): 5 takes with belowMin=0
  (rawLots 0.0149/0.0159/0.0254/0.0127/0.0110, floored 0.01/0.01/0.02/
  0.01/0.01) plus the 2 floor-refused signals with belowMin=1:
  8/28 16:20-bar evaluation (16:25:00 tick) rawLots=0.0086 flooredLots=0.00
  volMin=0.01 volStep=0.01 slPts=73; 9/4 15:55-bar evaluation (16:00:00 tick)
  rawLots=0.0037 flooredLots=0.00 volMin=0.01 volStep=0.01 slPts=172.
  Bar tokens read the evaluated bar (16:20/15:55), never the ABORT tick bars
  (16:25/16:00) - the predicted convention held exactly.
- volMin=0.01 and volStep=0.01 on all 7 LOTDIAG lines: broker floor actuals
  filed from the wire before grading, closing the A5 premise.
- SEEDDIAG branch names on 17:00 bars (4 lines): 9/3 RETEST, 9/7 SESSION,
  9/8 SESSION, 9/9 RETEST. The 9/8 miss cause is SESSION (session already
  used, NYAM), not RETEST - deeper than the v30 proximate death (S2POLL
  IDLE/NODIR plus CQD EMPTY plus zero S5 evals), which stands as context.
- EXITVERDICT curTp column joined bar-for-bar to his +0.10 row (row 257):
  T1 morning 9 (curTp 1.16364 on 10:05-10:40 plus 1.16459 at 10:45) with
  MTEXIT/MTLIFE TP_TOUCH pair (entry 1.16466 exit 1.16459); T2 16:25 row
  (entry 1.16430 curTp 1.16416) with its TP_TOUCH pair (exit 1.16416).
  Exit-bar curTp equals MTEXIT exit on both instances. No filed artifact
  performed this join before.
- D3 spends no run time by design (carried v30 proof; A3 rows identical on
  this segment: rExt1=0.6780821917805907, SIGNAL 16:45:01 present).

CONFIRMED (re-proven on new output, not new):
- v30 transport closure intact (counts above); A3/SIGNAL/TP_ELECT chains
  identical; T1/T2 MTEXIT/MTLIFE pairs match filed values exactly.

WITHHELD: nothing withheld in the gradeable region this run.

## Acceptance grades

- G1 PASS: both refused bars print LOTDIAG with belowMin=1 (exact witness
  from unrounded in-memory lots) and rawLots below volMin immediately before
  the same-tick ABORT/A6REFUSED pair (same-tick adjacency plus direction
  plus POI-on-ABORT-side); takes join 4/4 at signal level over the named
  membership (8/28 1.16466, 9/4 1.16018 his-entry-equal, 9/7 two TP-hit
  takes; 9/8 takes excluded with reasons); flooredLots %.2f lossless for the
  filed 0.01 environment with rawLots as rounded context.
- G2 PASS: given the filed IDLE precondition (SEL54STAGE 9/8 17:00
  stage=S2POLL state=IDLE on this segment), the 9/8 17:00-bar evaluation
  prints exactly one SEEDDIAG (branch=SESSION, enumerated 1 of 4 with
  distinct bars 9/3, 9/7, 9/8, 9/9); 8/27 prints zero (proved by substring
  and regex patterns); retestFound trustworthy by L1918 init (not graded).
- G3 CARRIED (council counterfactual, no run proof spent): A3 rows on this
  segment match the ruled rows; the Luna/GLM counterfactual ruling stands
  unchanged (guard passes 146 pts A3 / 78 pts A1; N-2 condition recorded).
- G4 PASS: T1 9 rows plus MTEXIT/MTLIFE pair re-printed with filed values;
  per-bar curTp joined to T1 (entry TP 1.16322) with divergences +42 pts
  (10:05-10:40) and +137 pts exit; T2 row plus pair re-printed, classified
  separately (no journal counterpart, expected finding, +94 pts); missing or
  multiple on graded joins: none; out-of-envelope curTp: none. Completeness
  grade only - curTp correctness not graded.

## Grade

EXECUTION=PASSED. GOAL-LAYER ACCEPTANCE=PROVEN (G1/G2/G4 pass on the
segment; G3 carried counterfactual confirmed on identical rows). No
falsifier tripped in the gradeable region.

## Adversarial disclosures (observations, never findings against the run)

- LOTDIAG log lines run to 172 chars: the under-160 construction estimate
  excluded the tester log prefix (the EA-side line is ~110). The graded
  525 rule passes with margin 353 on every new line (LOTDIAG max 172,
  SEEDDIAG max 134). The estimate, not the gate, was wrong.
- 9/8 seed cause is SESSION (already-used NYAM), with CQD EMPTY as context:
  a mechanism refinement over the v30 proximate death, never a miss.
- T2 paper-traded his declined A1 signal to a same-bar TP_TOUCH win
  (+14 pts, entry 1.16430 exit 1.16416). His decline vs the model win is a
  strategy divergence for a future packet, never a probe finding.
- Final balance 10183 JPY identical to RECON48: the base path replays
  deterministically under the added print-only lines.

## Owed forward

- Triple-key spent here (Luna key-1 plus advisories plus his Astra-waiver
  plus run word). EA stands 7C247F45 uncommitted. No build, no second run,
  no commit on this turn.
- This result is the terminal artifact of the RECON49 block. Next moves need
  his word (transport of this result is not a council matter) or a fresh
  council packet (goal road steps 2-7: 17:00 seed mechanism, 16:45
  live-activation relay, 8/28 exit model, full-journal recall).
