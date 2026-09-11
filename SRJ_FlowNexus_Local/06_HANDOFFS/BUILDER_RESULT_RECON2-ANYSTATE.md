# BUILDER_RESULT_RECON2-ANYSTATE.md — PACKET P-CONFIRM-ANYSTATE (build 2.5: the confirmation
# evaluated at ANY waiting-or-armed ladder state). Report:
# c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_RECON2-ANYSTATE.md
# Session 2026-09-11 (issued in-session: "Issue it — execute all stages now").
# ONE canonical file touched: Experts\SRJ_FlowNexus_EA.mq5 (E1-E4). CQD/OrderblockMgr/
# FlowLogic/the fourteen includes UNTOUCHED. Nothing under 02_TASK_CHECKPOINTS. No git token.
#
# STATUS: **ALL STAGES EXECUTED; ALL GATES PASS; THE 8/28 TRADE RETURNED WITH THE
# OPERATOR'S EXACT ENTRY PRICE.**

## 1. THE RUN (all verbatim)
- Compile T162_ANYSTATE (Dukascopy metaeditor64): "Result: 0 errors, 0 warnings, 2040 ms
  elapsed, cpu='X64 Regular'" (T162_ANYSTATE_COMPILE.log; exit code 1 = the recorded
  quirk; post-compile source digest byte-identical).
- Run RECON2-ANYSTATE via harness v2.3, RECON1_P1.ini unchanged: no terminal was open at
  launch (nothing closed); launched 05:50:16 (wrapper PID 28792, terminal PID 26352);
  launch STATUS clean (TERMINAL_BUSY=False, no REFUSED gates).
- "Test passed in 0:47:12.150"; 563,338 ticks, 3,168 bars. RESULT=PASSED (DONE marker
  06:37:56). Segment archived by the wrapper itself (16,095 lines / 2,577,383 B) as
  RECON2-ANYSTATE_JOURNAL.log. No leftover terminal after the run.
- terminal.ini note: a SECOND DateFrom/DateTo pair was found at pre-flight and MEASURED
  to belong to the [TickLoad] section (a different dialog); [Tester] carried the staged
  8/26->9/10 window unchanged. No ini edit made.

## 2. THE STAGES (S1-S7)
- S1 pre-hash PASS: CA79B064...F59C9, 244,174 B, CRLF=4888, LONELF=0 (the T162_GATE
  baseline, measured verbatim at session open).
- S2 applied E1-E4 (19 edit sites): E1 the S3 else's pre-bind confirmation block
  (CONFIRM_PREBIND / CONFIRM_PREBIND_FAIL, fall-through promotion); E2 the S4-edge
  promotion records g_confirmFromState; E3 the CONFIRM_DIV_WAIT rollback returns to the
  promotion origin (S3 pre-bind / S4 armed — the armed path byte-identical); E4 the new
  global + ResetSequence reset + working-set field 21 (struct member, case-20 name,
  d[20] compare, both formatters, the store copy, the census fields=21, all loops 21).
  THREE editor exact-match misses on the recorded leading-space class (the switch-case
  sites: display +1 space vs raw 6) — raw leads probed, all re-issued clean.
- S3 post-edit: EA = 2B11CB1295B2905AC3317A483BD6DB7042A81BDA6F68826EC694580E4FB95DC0,
  247,301 B, CRLF=4939, LONELF=0, 4,939 lines (+51 lines; every added line CRLF); zero
  leftover "20" sites; all 13 new-symbol sites verified.
- S4 compile PASS (above). S5 run PASS (above).
- S6 the gates (section 3). S7 this document + the tabulation + the standing state.

## 3. THE GATES — ALL PASS
- G1 PASS: "Test passed in 0:47:12.150", 3,168 bars.
- G2 PASS: WS161_CENSUS fields=21 loads=3168 stores=3168 changes=206 mismatch=0;
  WS161_LOAD NOSTORE x1; zero mismatch/FIELD rows. (changes 206->206 — did not move;
  declared observable.)
- G3 PASS — THE SIGNAL SET (3 signals, verbatim):
  a. THE 8/28 TRADE RETURNED: 2026.08.28 10:05:00 ALERT SRJ SIGNAL SHORT EURUSD M5 |
     Daily-VWAP | LONDON | R=6.80 SL 1.16481 TP 1.16364 spr=4. ENTRY = 1.16466 —
     EXACTLY the operator's journal entry (tpDist 102 pts / slDist 15 pts = 6.80).
     Full trace: seeded 10:00, zone not in play, CONFIRM_PREBIND bar=10:00, S3->S5,
     div matched, R latched 6.80 >= 1, fired at the 10:05 open. The ruled model worked
     end to end.
  b. 9/7 09:20:00 LONG Weekly-POC LONDON R=1.76 — VERBATIM.
  c. 9/7 16:45:00 LONG Weekly-POC NYAM R=1.25 — VERBATIM.
  d. NO NEW SIGNALS (the declared cascade risk did not materialize).
- G4 PASS: post-run digests byte-identical (EA 2B11CB12...95DC0; CQD BE6FD84F...;
  OrderblockMgr D286621C...; FlowLogic 1EA7858F...).
- G5 PASS: the FlowLogic-side identities verbatim (BIASCENSUS 1554/1614 x2 fail=0;
  ZONECENSUS 3168/1056 exact; XOB-PROMOCENSUS 469; CQD verdict stream 906 = 906); the
  EA-side counts moved as declared (full delta table in
  RECON2-ANYSTATE_TABULATION.txt).

## 4. THE PRE-BIND MECHANICS AS MEASURED (plain language)
- Five waiting candidates passed the pre-bind confirmation: the 8/28 target (FIRED),
  8/27 17:15 Weekly-VWAP SHORT (the newest CQD verdict was opposing -> the confirmation
  consumed, the candidate kept waiting), 9/1 16:55 Yearly-POC LONG (opposing verdict ->
  consumed — the potential new fake died by the operator's own "the latest is the
  latest" rule), 9/4 09:30 Daily-POC LONG (latched R=0.63 < 1 -> killed, "not worth
  1R"), 9/4 09:45 Daily-POC LONG (opposing verdict -> consumed).
- 166 pre-bind closes failed the candle terms (each names its failed term).
- DECLARED OBSERVABLE (not a gate failure): the 8/28 EA signal's SL = 1.16481 (the
  nearest-swing reference, 15 pts) vs the operator's journal SL ~1.16568 ("6:30 high");
  R=6.80 vs the operator's ~0.84 by their own stop/target. The built SL_REF machinery
  working as built — a strategy-rule item ONLY if the operator wants the stop reference
  changed (the EA currently has no input carrying the operator's discretionary stop
  choice; that would be a new packet item).

## 5. BASELINES AFTER THE BUILD (post-run, byte-identical)
- EA = 2B11CB1295B2905AC3317A483BD6DB7042A81BDA6F68826EC694580E4FB95DC0 (247,301 B,
  4,939 CRLFs, LONELF=0) — the T162_ANYSTATE state; run-verified with the gates above.
  The T162_GATE state (CA79B064...) is SUPERSEDED.
- CQD = BE6FD84F...A421F (50,555 B); OrderblockMgr = D286621C...20B7B (48,050 B);
  FlowLogic = 1EA7858F...73B08 (58,657 B) — ALL UNTOUCHED.
- No git token; the T162_ANYSTATE state + every record since commit f3c83f0 exist ONLY
  in the working tree (fragile; a git snapshot awaits an explicit token).
- QUEUE: build 3 (the line supersession, council C1) next; then the FVG-validity packet
  (the operator's ruled rule, BUILDER_FINDING_0828-FVG.md section 5); the SL-reference
  question (4) is a NEW operator-reserved strategy-rule item, non-blocking.
