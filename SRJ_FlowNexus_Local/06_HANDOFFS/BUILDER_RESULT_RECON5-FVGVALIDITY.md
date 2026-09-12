# BUILDER_RESULT_RECON5-FVGVALIDITY.md — P-FVGVALIDITY EXECUTED AND VERIFIED

Run RECON5-FVGVALIDITY: "Test passed in 1:05:28.971", 563338 ticks, 3168 bars,
RESULT=PASSED by journal marker 21:33:04 + operator completion nudge.
Wrapper died before DONE (no DONE file); manual completion protocol executed
(PRE_JOURNAL_LINES=79911, SEG=15317 lines / 2431304 B =
RECON5-FVGVALIDITY_JOURNAL.log). Ini RECON1_P1.ini unchanged (6D25C609…);
terminal.ini [Tester] window untouched (8/26–9/10).

## S1–S5

- S1 PASS: EA 1478ADCF…BA74 (261040 B), ImbalanceMgr 64CF3275…02AE (23323 B),
  FlowLogic 1EA7858F…73B08 (58657 B) — all expected.
- S2: E0 (Types remTop/remBottom + ctor init), E1 (fill-pass shrink, shrink-only),
  E2 (export remainder, no minimum-size gate, remainder-distance), E3 (call-site
  high/low). All applied first attempt, only the three packet-named files.
- S3: Types D542B458…F03 (13835 B); ImbalanceMgr F830AE5A…196 (25478 B);
  FlowLogic F58E57A5…43D7 (59714 B).
- S4 PASS: FlowLogic compile "Result: 0 errors, 0 warnings, 13067 ms elapsed";
  EA compile "Result: 0 errors, 0 warnings, 3426 ms elapsed"
  (T162_FVG_FLOWCOMPILE.log / T162_FVG_EACOMPILE.log, gitignored).
- S5: launched 20:27:15 (PID 10204; operator terminal PID 9968 closed graceful
  per automation rule, left closed). STATUS clean at launch (TERMINAL_BUSY=False).

## G1–G5: ALL PASS

- G1: 3168 bars / 563338 ticks, Test passed marker verbatim.
- G2: WS161 fields=21 loads=stores=3168 changes=205 mismatch=0, LOAD NOSTORE x1,
  zero FIELD/MISMATCH rows — verbatim vs RECON4.
- G3: four-signal set VERBATIM (8/28 10:05 SHORT Daily-VWAP LONDON R=2.43
  SL 1.16508 TP 1.16364 entry 1.16466; 9/4 16:00 LONG Yearly-POC NYAM R=2.56;
  9/7 09:20 LONG R=1.76 + 16:45 LONG R=1.25). Zero FVG-attributed movement:
  FVGSHRINK=0, WICKCOVER=0, BODYKILL=0 in-segment.
- G4: post-run digests byte-identical (Types D542B458 / ImbalanceMgr F830AE5A /
  FlowLogic F58E57A5 / EA 1478ADCF / CQD BE6FD84F / OBMGR D286621C).
- G5: BIASCENSUS 1554/1614 x2 fail=0; ZONECENSUS 3168/1056 fvgOnly=0 fvgInWin=0;
  XOB-PROMO 469; CQD 170/308/266/166 (=910, identical); CONFIRMPOLL 555;
  [ANNOTATION 2026-09-12, council-confirmed carry-forward: the CQD 4-tuple
  above is a TABULATION-PARSER artifact, not an EA move. Loose pattern
  counting `verdict=-1/-2` also catches 4 `CONFIRM_DIV_WAIT` lines
  (8/31 16:35, 9/1 10:10 + 16:50, 9/4 09:40), landing +3/+1 for 906 -> 910.
  Record of identity is the DIV-first method: count `CQD DIV verdict=` lines
  only = 170/308/263/165 = 906 on RECON3, RECON5 and RECON6. Later packets
  compare against 170/308/263/165 DIV-first, never against 170/308/266/166.];
  SUPPRESSED 156; aborts 18/37/13/11/2/0/12; MTEXIT 4 (8/28 TP_TOUCH 1.16451,
  9/4 HTF_FLIP, 9/7 TP_TOUCH x2); MTSNAP 4; SL 2-swing 51 — ALL identical
  to RECON4-FIXS2POLL like-for-like.

## Declared findings

1. IN-WINDOW NO-OP (stronger than the a-priori near-zero): the remainder
   machinery executed every bar but produced zero observable delta anywhere.
   Consistent with fvgOnly=0/fvgInWin=0 — the EA never selects FVG zones here,
   so shrunken remainders are written but unconsumed. Activation awaits wider
   windows (RECON Phase-2 / monthly segments).
2. E4 print visibility UNPROVEN in this config: FlowLogic inHtfDebugLog=false
   (default; EA binds only 7 positional args) forces SRJ_InDebugWindow()=false
   in the headless instance, so SHRINK/WICKCOVER/BODYKILL cannot fire here
   (FVGREN-SCAN/OPPFVG are 0 in RECON4 identically). Proving E4 needs a debug-on
   run (EA binding change = separate packet). Functional code (E1–E3) is
   verified; E4 lines are compiled but unfired.
3. Wall time 1:05:28 at ~2.0 GHz vs RECON4 0:48:57 at ~4.0 GHz: pace ratio
   matches clock ratio; code measured not-guilty (zero print volume, O(FVG)
   compares per bar). 3h ETA was early-estimate inflation.

## New baselines (T162_FVG state; 1478ADCF EA state SUPERSEDED only as a set)

- Types D542B458690B1E1BA3A7969601BAC23EADB111979BEEDBDBDCEFF948BAA15F03
- ImbalanceMgr F830AE5A8E7B9FBBD0DD9FAB3A4D9CE26BF8B7E14A5B85F2A6004F692101196
- FlowLogic F58E57A5C3D3212C88540EB737132F1C452C7ED12F1A1D23D587F7FDA19B43D7
- EA 1478ADCF… (untouched), CQD BE6FD84F… / OBMGR D286621C… (untouched).

Artifacts: RECON5-FVGVALIDITY_JOURNAL.log (gitignored) + TABULATION.txt (19 lines)
in 06_HANDOFFS; STATUS + launch/tabulate/archive/compile scripts in
00_CURRENT_WORKING; T162_FVG_*COMPILE.log gitignored. No git token; nothing
under 02_TASK_CHECKPOINTS. Queue: SL-IMBALANCE (reserved), P-TRIM-S2POLL
(council-sequenced), RECON Phase-2, debris word, snapshot on token.
