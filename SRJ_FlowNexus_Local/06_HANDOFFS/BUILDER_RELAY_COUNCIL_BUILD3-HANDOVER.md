# BUILDER_RELAY_COUNCIL_BUILD3-HANDOVER.md - T162 code to the council
Date: 2026-09-11. Self-contained relay; paste whole to Opus 5.
STATUS: P-BUILD3 EXECUTED AND VERIFIED (RECON3-BUILD3 PASSED). No edit follows
from this relay until a council packet / operator token.

## 1. WHAT IS HANDED OVER (digests are the instrument - re-hash before use)
- Experts\SRJ_FlowNexus_EA.mq5 =
  7BB1E9B6F70F924AF540572E9760E2BD848D7B907648304C258CAAFE79C3CB3C
  (257968 B; T162_BUILD3 run-verified; 693B3729 SUPERSEDED).
- Indicators\SRJ_CQD_TickBased_MT5.mq5 =
  BE6FD84FB970B255F7809EF81CDDE829644DCC8B859166E8B2CEB9BF1D8A421F (50555 B).
- Include\SRJ\SRJ_OrderblockMgr.mqh =
  D286621CD8E2AB92B67FBA2BE0FD60BC861FF277C7516A2CFF6F79564E220B7B (48050 B).
- Indicators\SRJ_FlowLogic.mq5 =
  1EA7858F9B1A8F4F42D90D58A0BB8873063D874E40E32A6A4E69DD8099F73B08 (58657 B).
- Fourteen Include\SRJ\*.mqh: UNCHANGED since Task-160 refs (15/15 MATCH 2026-09-09).
- Compile T162_BUILD3: Result 0 errors 0 warnings 1996 ms (log line 93; exit code 1
  is the known quirk - the LOG LINE is the instrument).
- Run RECON3-BUILD3 (RECON1_P1.ini unchanged; 8/26->9/10 terminal.ini [Tester]
  1787702400/1788998400; 563338 ticks; 3168 bars; Test passed in 1:03:47.543;
  RESULT=PASSED; DONE 2026-09-11 14:24:32).
- Git HEAD c50b737 (tag Task162-T162SLREF, pushed BOTH remotes). UNCOMMITTED: the
  T162_BUILD3 EA + P-BUILD3 + RECON3 records + prompt + standing state (working
  tree only copy - snapshot awaits explicit token).

## 2. WHAT THE CODE DOES (the ruled model - the council reviews THIS)
- Seed: DetectPoiRetest (wick + next-open body) elects anchor; ANCHOR_ELECT seed
  census (55 seeds in-window).
- Supersession (BUILD 3, council C1): same-direction strictly-better FAMILY TIER
  touch upgrades anchor in SAME candidate (B3 helpers after DetectPoiRetest; E3
  pre-fire poll S1/S2/S3/S4; ANCHOR_SUPERSEDE print; 8 in-window, zero inversions,
  zero cross-direction re-binds).
- Confirmation gate (BUILD 2): spec 3.6 candle + ruled VWAP/POC term (wick in,
  close on setup side) + one-bar validity + unbounded newest-first CQD walk
  (CONFIRM_DIV_WAIT = newest opposing, keeps waiting; no abort). CONFIRM_PREBIND =
  same predicate while prep unfinished (S3). CONFIRMPOLL shadow every bar.
- 1R gate: R LATCHED ONCE at confirmation (TP_ELECT shadow), never recomputed;
  closest-line TP as-built (AVP-class-only RULED OFF); TP_RR_FAIL = not worth 1R.
- SL: 1-swing branch (buffer-27 OB swing, Task-75 rescue) UNTOUCHED; 2-swing =
  ruled structure-top walk (SL_STRUCT census; 60/60 in-window).
- Singleton: arrival order ACROSS TIME (opp=1 suppression intact: 83);
  same-direction higher-tier now re-binds (opp=0 higher=1: 18->2, declared blast
  radius). POIREPLACE stays counterfactual.
- Managed phase (STEP 4, additive): MTSNAP at signal; per-bar EXITVERDICT over all
  twelve POI lines + EXITCENSUS; TP re-computed per bar (nearest valid, even <1R);
  TP_TOUCH / SL trade-through / body-close BREAK / HTF_FLIP (MT_HTF_EXIT=true,
  parked 5.6 backtest) evaluated; MTEXIT prints outcome. WS161 fields=21.

## 3. MEASURED AGREEMENT (pilot window 8/26->9/10, RECON3-BUILD3)
- 8/28 10:05 SHORT Daily-VWAP LONDON R=2.43 SL 1.16508 TP 1.16364 (entry 1.16466 =
  operator journal EXACT) - AGREEMENT.
- 9/7 09:20 LONG Weekly-POC LONDON R=1.76 + 16:45 LONG Weekly-POC NYAM R=1.25 -
  AGREEMENT (ruled next-open entries, operator-confirmed).
- 9/4 16:00 LONG Yearly-POC NYAM R=2.56 SL 1.15907 TP 1.16302 (entry 1.16018) -
  CONFIRMED VALID by operator ("yes, sept 4 was a valid trade on the NY at 16:00").
  Supersede Monthly->Yearly on 15:45 bar EXACT.
- Four EA-only dates (8/31, 9/1, 9/2, 9/8): SILENT - false-alarm verdict stands.
- Identities: WS161 21/3168/3168/208 mismatch=0; BIASCENSUS 1554/1614 x2 fail=0;
  ZONECENSUS 3168/1056; XOB-PROMO 469; CQD 906 (170/308/263/165) identical SLREF2.
  Full gates: BUILDER_RESULT_RECON3-BUILD3.md + RECON3-BUILD3_TABULATION.txt.

## 4. OPERATOR EXIT CONFIRMATIONS (ruled behaviour - council does NOT redesign)
- 9/4: original TP = London High (EA latched 1.16302); operator session TP chain =
  London High, revised to NY High, then NY PM High; NY PM session high = 1.16158
  at 22:40 (operator datum this session). EA managed exit = next bar 1.15990 on
  HTF flip (vHTF=1 anti=2; vTP=0 vSL=0 vBREAK=none) - RULED CORRECT ("the current
  EA behaviour is correct as what i officially ruled").
- TP selector stays closest-line (operator ruled off AVP-class-only); session-level
  TP revision mid-trade is discretionary (NOT encoded).
- NEW RULE (operator, QUEUED, NOT built, NO packet): close any running/floating
  setup 5 min before day close (spread + swap experiment). Build slot: the
  managed-trade evaluator; needs operator confirmations (close reference; priority
  vs TP/SL/HTF; ALERT-ONLY flat notice). Council may SHAPE, must NOT issue unasked.

## 5. PERFORMANCE QUESTION (operator datum - the main review item)
- Operator: "the original code is faster than the current one when i backtest."
- Measured wall-times, same window 8/26->9/10 (563338 ticks, 3168 bars):
  SHADOW 0:58:22.949 | GATE 0:57:33.543 | ANYSTATE 0:47:12.150 | SLREF 0:51:07.944
  | SLREF2 0:59:54.699 | BUILD3 1:03:47.543.
- "Original" UNPINNED (no digest named) - best reading: pre-T162 lineage vs current
  T162_BUILD3. Known additive load: RetestBook 12-line poll + shadow prints,
  CONFIRMPOLL, TP_ELECT, EXITVERDICT/EXITCENSUS (12 lines/bar), ANCHOR prints,
  SL_STRUCT, managed-trade evaluator. All prints InpDebugLog-gated already.
- COUNCIL ASK C1: profile-then-trim with numbers (per-call cost x call count);
  gate every print behind debug flag where not already; hoist loop-invariant
  buffer reads out of per-bar path; return digest pair + same-window timing.
  Identity constraint: section 3 signal/exit set + G5 censuses must reproduce
  RECON3-BUILD3 verbatim.

## 6. WHAT THE COUNCIL IS ASKED (code ONLY - strategy goes to the operator)
- C1 (performance): see section 5. Shape optimisation; do NOT issue edit packet
  unasked - the operator issues packets.
- C2 (day-close flat experiment): SHAPE ONLY - where in EvaluateManagedTrade the
  flat check belongs, close-reference choice, priority vs TP/SL/HTF_FLIP, census
  print. Strategy questions come back THROUGH relay (operator answers strategy).
- C3 (anything else): findings with line numbers + measured effect; no silent
  redesign of ruled behaviour (sections 2/4).

## 7. SOURCES FOR REVIEW (literal paths)
- Experts\SRJ_FlowNexus_EA.mq5 (only file the review may propose to change).
- Indicators\SRJ_CQD_TickBased_MT5.mq5; Include\SRJ\SRJ_OrderblockMgr.mqh;
  Indicators\SRJ_FlowLogic.mq5 (context; unchanged).
- 06_HANDOFFS\BUILDER_RESULT_RECON3-BUILD3.md + RECON3-BUILD3_TABULATION.txt +
  RECON3-BUILD3_JOURNAL.log (gitignored) + T162_BUILD3_COMPILE.log (gitignored).
- 01_TASKS\PACKET_P-BUILD3.md (EXECUTED AND VERIFIED); 00_CURRENT_WORKING\RECON1_P1.ini.
- Spec of record: 00_CURRENT_WORKING\SRJ Flow Nexus - Part A Specification v4.2.
- Standing rules: .clinerules (ALERT-ONLY; digests are the instrument; no
  02_TASK_CHECKPOINTS writes; no git without explicit token).
