# BUILDER RESULT — RECON2-SHADOW (P-CONFIRM-SHADOW build 1 executed: the calibration surface delivered)
Report: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_RECON2-SHADOW.md
Session: 2026-09-10. Authorization: the operator ISSUED the packet ("please issue the shadow
packet") after confirming no council relay was needed. ONE canonical file touched:
Experts\SRJ_FlowNexus_EA.mq5 (additive log-only edits, E1-E5). CQD/OrderblockMgr/FlowLogic/
the fourteen includes UNTOUCHED. Nothing under 02_TASK_CHECKPOINTS. No git token.

## STAGES (all measured)
S1 pre-hash PASS: A0701893...3FD57E (228,604 B, CRLF=4610, LONELF=0). S2 applied E1-E5
(declared: one builder typo — a comment line missing its // prefix at the call site — caught
and fixed pre-compile; declared placement deviation: TP_ELECT prints AFTER the existing R
computation using the already-computed values, not a duplicate ComputeNearestTpTarget call —
byte-safe, cheaper). S3 post-hash:
12FB2EB02763D0D648447F6DE02DE4BF2C57D71249EDBCE9583C083331CEFD7E (235,201 B, 4,731 lines
= +121, every added line CRLF, LONELF=0). S4 compile "Result: 0 errors, 0 warnings, 1987 ms"
(T162_SHADOW_COMPILE.log); post-compile hash byte-identical. S5 run RECON2-SHADOW: the
operator's terminal PID 11252 closed WITH authorization (graceful -> forced; left closed);
launched 13:40:07; "Test passed in 0:58:22.949", 563,338 ticks, 3,168 bars, RESULT=PASSED
14:40:46. DECLARED WINDOW GROWTH: 3,168 bars vs RECON1B's 2,880 — 09.09's ticks synced since
the RECON1B run, so this window covers 8/26 -> 09.09 COMPLETE (10.5 trading days); every
bar-proportional census grew accordingly (mechanism named, not drift). DECLARED R-180: one
shell command hit a shell-integration capture failure during the completion step (plus one
malformed re-issue — the builder's own, caught immediately); both re-issued clean.

## GATES
G1 "Test passed" ✓. G2 WS161 loads=stores=3168 changes=180 mismatch=0 ✓ (N = the window's
bars; LOAD NOSTORE x1; FIELD=0). G3 THE SIGNAL IDENTITY — ALL SIX REPRODUCE VERBATIM
(zero behavior change PROVEN): 8/31 11:40:07 SHORT Monthly-VWAP R=2.24; 9/1 15:50:00 LONG
Monthly-POC R=1.36; 9/2 15:55:00 SHORT Daily-VWAP R=1.05; 9/7 09:20:00 LONG Weekly-POC
R=1.76; 9/7 16:40:15 LONG Weekly-POC R=2.12; 9/8 15:55:07 LONG Yearly-POC R=1.12.
BIASCENSUS bars=3168 sh1 1554/1614 sh2 1554/1614 fail=0; ZONECENSUS 3168/1056; XOB-PROMO 469.
G4 post-run digests byte-identical: EA 12FB2EB0... (the post-edit state), CQD BE6FD84F...,
OrderblockMgr D286621C..., FlowLogic 1EA7858F....

## THE CALIBRATION VERDICT — THE SPEC §3.6 TEST DISCRIMINATES
RETESTBOOK 1,032 lines; CONFIRMPOLL 552; TP_ELECT 76; confirm=1 on 49 bars.

### The good candles (the operator's confirmation candles — confirm=1 REQUIRED)
- 9/7 09:15 (the first taken trade's confirmation candle): bar=09:15 anchor=Weekly-POC
  dir=LONG oppCandle=1 bodyDir=1 body=21pts touchAttr=1 -> CONFIRM=1 ✓ — AND THE EA'S OWN
  SIGNAL FIRED AT 09:20:00, EXACTLY THE OPERATOR'S RULED NEXT-OPEN. The test and the
  operator's trade agree bar-for-bar.
- 9/7 16:40 (the second taken trade's confirmation candle): the poll at bar=16:30 shows
  confirm=1 (oppCandle=1 bodyDir=1 body=12pts touchAttr=1), and bar=16:35 (judged at the
  16:40:15 signal instant) shows oppCandle=0 confirm=0. The signal fired AT the operator's
  confirmation candle 16:40. The test reads the retracement/confirmation PAIR one bar
  earlier than the operator's candle-time attribution — a ONE-BAR attribution question for
  build 2 (the poll's "bar" = the just-closed candle; the operator's confirmation candle =
  16:40 itself). Not a discriminator failure — a bar-index convention to settle.

### The bad candles (the four EA-only signals — confirm=0 REQUIRED)
- 8/31 11:35 (the 11:40 signal bar): confirm=0 ✓ (bodyDir=0, touchAttr=0).
- 9/1 15:45 (the 15:50 signal bar): confirm=0 ✓ (oppCandle=0, touchAttr=0).
- 9/2 15:50 (the 15:55 signal bar): confirm=1 ✗ — THE ONE FAILURE. bar=15:50 anchor=
  Daily-VWAP dir=SHORT oppCandle=1 bodyDir=1 body=9pts touchAttr=1 -> confirm=1. The §3.6
  terms ALONE pass on this candle; the signal must still be suppressed. NOT A TERM FAILURE:
  the §3.6 letter is necessary but not sufficient here. The measured strengthening
  candidates in the data: (a) the body-dominance ratio (body/range), (b) the close position
  within the candle range (the operator's screenshots show strong closes at the extreme on
  the good candles), (c) minimum touch depth. COMES BACK TO THE OPERATOR WITH DATA before
  build 2 gates.
- 9/8 15:50 (the 15:55 signal bar): confirm=0 ✓ (oppCandle=0, touchAttr=0).
VERDICT: 4 of 5 discriminate exactly; 9/2 needs one measured strengthening term. The
direction is sound.

### The 8/28 window (the killed trade)
- CONFIRMPOLL bar=10:00: oppCandle=1 bodyDir=1 body=15pts touchAttr=1 -> CONFIRM=1 at the
  10:00 candle — the confirmation candle presented, and the EA's candidate was ALREADY
  ARMED (S4 by 10:20). Under build 2's one-bar-validity rule the entry = the 10:05 open —
  the council's predicted bar.
- TP_ELECT trail: 10:20 entry=1.16426 sl=1.16481 tp=1.16364(NYL) R=1.13; 10:25 R=1.13;
  10:30 R=0.95 — the decay REPRODUCED in shadow at the identical values the real gate
  computed (the shadow matches the live path exactly). At the confirmation bar the same
  closest-line TP with the 10:05 entry latches R=1.13 — the trade SURVIVES at the correct
  bar with the UNCHANGED selector (the operator's ruled "closest"). The operator's
  early-exit datum (the D AVP gap-body-close at 11:35) is the STEP-4 exit model
  (record-only, unbuilt).

### The 9/4 window (the supersession inputs)
RETESTBOOK bar=15:30 hits=2 (Weekly-POC r8:dL, Monthly-POC r6:dL); bar=15:35 hits=3 (adds
Yearly-POC r2:dS); bar=15:40 hits=2 (Weekly/Monthly). The Yearly-POC entries ARE visible
to the book — build 3's supersession will see them (the 15:35 hit is dS = the
opposing-direction retest that guard 1 keeps suppressed; the LONG entries at 15:30/15:40
are the same-direction class the council's strictly-better-rank re-bind promotes).

## ARTIFACTS + BASELINES
06_HANDOFFS: BUILDER_RESULT_RECON2-SHADOW.md (this file), RECON2-SHADOW_JOURNAL.log
(15,556-line segment; gitignored per R-220), T162_SHADOW_COMPILE.log (gitignored).
00_CURRENT_WORKING: RECON1_P1.ini (unchanged), RECON2-SHADOW_STATUS/DONE markers.
NEW EA BASELINE: 12FB2EB02763D0D648447F6DE02DE4BF2C57D71249EDBCE9583C083331CEFD7E
(235,201 B, 4,731 lines; run-verified; the A0701893 T161R-verified state is SUPERSEDED by
this additive shadow state). CQD BE6FD84F... / OrderblockMgr D286621C... / FlowLogic
1EA7858F... unchanged.

## OPEN FOR BUILD 2 (operator-gated, with data)
The 9/2 false candle passed the §3.6 terms alone. The builder will measure the three
strengthening candidates — (a) body-dominance (body/range), (b) close-position-in-range,
(c) minimum touch depth — on this run's data for the five calibration candles, and put ONE
memo with the numbers; the operator rules the term; then build 2 (the confirmation gate +
one-bar validity) is packetted with the discriminating set. The bar-index convention (the
poll's bar vs the operator's candle attribution) settles in the same memo. NO packet drafted
beyond this result; no behavior change shipped beyond the logs.

