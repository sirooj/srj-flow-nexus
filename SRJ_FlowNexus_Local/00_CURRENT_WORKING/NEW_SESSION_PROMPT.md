# NEW SESSION PROMPT (updated 2026-09-11 ~19:10 UTC — P-FIX-S2POLL COMPLETE)
# P-FIX-S2POLL ISSUED + EXECUTED AND VERIFIED. NEW EA BASELINE:
# 1478ADCF9DC2DC57C73A53002E7690723841A9E06E3DA161EB32526669CBBA74 (261040 B).
# Result: 06_HANDOFFS\BUILDER_RESULT_RECON4-FIXS2POLL.md. See the STATE UPDATE block at the
# end of this file — it is the newest truth; read it before the sections below.
Continue the SRJ Flow Nexus project in this workspace.

FIRST ACTION: read MQL5\.clinerules FULLY — it is the project's workflow, invariants, file map, and
standing state. Its section 7.1 final session-stage blocks are the newest truth; section 8 is the
first-action protocol.

TWO THINGS THE FRESH AGENT MUST KNOW UP FRONT (this project has recorded hallucination incidents —
2026-09-10 and 2026-09-11; the operator terminated an agent turn for fabricated "analysis"):
1. THERE IS EXACTLY ONE .clinerules FILE. The MQL5 folder IS the Dukascopy terminal's data tree. Any
   note claiming a second "standing/mirror" rules tree is FALSE fiction.
2. MEASURE BEFORE YOU BELIEVE OR DOUBT — in BOTH directions. Never accept a claim (yours included)
   without the literal hash/byte/line tool output pasted verbatim. An ACCUSATION is also a claim:
   measure the artifacts on disk first. Do not probe paths you invented; only verified, literal,
   absolute paths. An unmeasured figure must never be written into a record. If you cannot produce a
   real measurement on request, STOP and say so.

## WHERE THE PROJECT STANDS (all measured 2026-09-11; re-hash the four baselines at session start)
- BASELINES (re-hash at session start; digests are the instrument):
  - EA: Experts\SRJ_FlowNexus_EA.mq5 = 1478ADCF9DC2DC57C73A53002E7690723841A9E06E3DA161EB32526669CBBA74
    (261,040 B; the T162_FIXS2POLL state — RUN-VERIFIED by RECON4-FIXS2POLL 2026-09-11:
    PASSED, 3168 bars, all gates; the 7BB1E9B6 T162_BUILD3 state SUPERSEDED).
  - CQD: Indicators\SRJ_CQD_TickBased_MT5.mq5 =
         BE6FD84FB970B255F7809EF81CDDE829644DCC8B859166E8B2CEB9BF1D8A421F (50,555 B)
  - OB MGR: Include\SRJ\SRJ_OrderblockMgr.mqh =
         D286621CD8E2AB92B67FBA2BE0FD60BC861FF277C7516A2CFF6F79564E220B7B (48,050 B)
  - FlowLogic: Indicators\SRJ_FlowLogic.mq5 =
         1EA7858F9B1A8F4F42D90D58A0BB8873063D874E40E32A6A4E69DD8099F73B08 (58,657 B)
- GIT: HEAD c50b737 (pushed to BOTH remotes; tag Task162-T162SLREF). UNCOMMITTED (the working
  tree is the only copy — fragile; a git snapshot awaits an explicit operator token): the
  T162_BUILD3 EA state (M Experts/SRJ_FlowNexus_EA.mq5) + PACKET_P-BUILD3.md + RECON3-BUILD3
  STATUS/DONE/ini markers (untracked) + the run journal/compile log (gitignored) + this prompt.
  Debris (awaiting the operator's deletion word, untracked): EA_STATE_REG.md, recovery_compile.ps1,
  NEW_SESSION_PROMPT.md.pre-b3run (backup of this prompt, delete any time).
- THE SIGNAL SET UNDER THE RULED MODEL (4 signals, all measured in RECON3-BUILD3):
  8/28 10:05 SHORT Daily-VWAP LONDON R=2.43 SL 1.16508 TP 1.16364 (the operator's trade;
  entry 1.16466 EXACT) + the 9/7 pair (09:20 LONG Weekly-POC LONDON R=1.76; 16:45 LONG
  Weekly-POC NYAM R=1.25) + the 9/4 Yearly deliverable (16:00 LONG Yearly-POC NYAM R=2.56
  SL 1.15907 TP 1.16302; supersede Monthly->Yearly on the 15:45 bar EXACT; exits 16:05
  on the parked HTF flip — for the operator's adjudication). The four fakes (8/31, 9/1,
  9/2, 9/8) silent.
## THE COMPLETED WORK (P-BUILD3 S6/S7 done this session)
RUN RECON3-BUILD3 VERIFIED 2026-09-11: PASSED, 3168 bars, 1:03:47. G1 PASS. G2 PASS with
declared move (WS161 changes 206->208; fields/loads/stores/mismatch unchanged).
G3: 8/28 + 9/7 pair verbatim, fakes silent, 9/4 supersede EXACT + Yearly signal delivered.
G4 post-run digests byte-identical. G5 FlowLogic identities verbatim (BIAS 1554/1614 x2;
ZONE 3168/1056; PROMO 469; CQD 906 identical); EA counts with named moves (ABORT 54->51;
CONFIRMPOLL 611->590; STRUCTFAIL 191->176; SUPP opp0higher1 18->2, opp1 85->83).
Result: 06_HANDOFFS\BUILDER_RESULT_RECON3-BUILD3.md + RECON3-BUILD3_TABULATION.txt (181
lines). Packet marked EXECUTED AND VERIFIED. Standing state + this prompt updated.3
detached (RECON1_P1.ini unchanged; window 8/26->9/10, 3,168 bars). Launch STATUS clean
(INI_EXISTS=True TERM_EXISTS=True TERMINAL_BUSY=False). DONE marker ABSENT at handoff — the run
takes ~50-60 min. STANDBY: do NOT poll, do NOT sleep-loop (the countdown-timer experiment is
DITCHED per the operator 2026-09-11 — it drains credit). Wait for the operator's "run completed"
nudge. THEN: read RECON3-BUILD3_DONE.txt (need RESULT=PASSED), complete S6/S7 per
PACKET_P-BUILD3.md sections 4-5 (archive the segment — manual protocol if the wrapper died —
tabulate, run gates G1-G5). A-priori G3: 8/28 10:05 SHORT Daily-VWAP R=2.43 SL 1.16508 TP 1.16364
verbatim; 9/7 pair verbatim; four fakes silent; 9/4 ANCHOR_SUPERSEDE Monthly-POC rank6 tier3 ->
Yearly-POC rank2 tier1 LONG on the 15:45 bar EXACT; the Yearly outcome (signal or named abort) is
the deliverable for adjudication, NOT pre-declared; SUPPRESSED opp=0 higher=1 FALLS from 18;
opp=1 UNCHANGED. Then write BUILDER_RESULT_RECON3-BUILD3.md + tabulation, mark the packet
EXECUTED AND VERIFIED, update standing state. S3/S4 measured: post-edit EA 7BB1E9B6...C3CB3C
(+5,336 B, +112 CRLF); T162_BUILD3 compile "Result: 0 errors, 0 warnings, 1996 ms elapsed"
(T162_BUILD3_COMPILE.log). First compile attempt FAILED 2 errors on the builder's forward
declaration (MQL5 rejects it, error 116/155) — fixed by defining B3_AnchorTier/B3_ElectAnchor
AFTER DetectPoiRetest. New symbols: B3 helpers (L97-101 note + L1663+ defs), E3 poll
(b3_superseded + ANCHOR_SUPERSEDE), E4 SUPPRESSED action= tail field, E2 ANCHOR_ELECT seed
census, E5 ResetSequence comment (no new working-set field; WS161 stays 21).

## THE QUEUE (in order, after RECON4-FIXS2POLL gates — all detailed in the STATE UPDATE block)
1. PACKET_P-FVGVALIDITY.md DRAFT (the operator's ruled FVG rule in BUILDER_FINDING_0828-FVG.md
   section 5; all measured anchors in the STATE UPDATE block). Await the operator's issuance, then
   S1-S7 (compile + full run + gates; a-priori zero in-window movement because fvgOnly=0).
2. THE IMBALANCE CRITERION FOR THE SL SWING (operator datum, recorded verbatim in
   BUILDER_RESULT_T162-SLREF.md section 5) — operator-reserved; ask before encoding.
3. P-TRIM-S2POLL (council-sequenced in PACKET_P-FIX-S2POLL section 5; the identity baseline is
   now established and tabulated).
4. THE RECON-PILOT Phase-2 reconciliation re-runs on this build; the window gate re-evaluates
   (4/4 MUST-MATCH + 0 false + the EA-only adjudications).
5. DEBRIS (awaiting the operator's deletion word): SRJ_FlowNexus_Local\EA_STATE_REG.md and
   SRJ_FlowNexus_Local\recovery_compile.ps1.
6. A GIT SNAPSHOT: this session's records + the new canonical state — ONLY on an explicit operator
   token.

## WORKFLOW (operator standing directives — learn these before touching anything)
- THE AUTOMATION RULE: the builder closes any open Dukascopy MT5 terminal ITSELF (graceful first,
  forced fallback, declare it; NEVER touch the Five Percent terminal) and launches; NO pre-run
  ask_question. The run-completion signal is the operator's — the operator nudges when the tester
  is done. THE COUNTDOWN-TIMER EXPERIMENT IS DITCHED (operator directive 2026-09-11: it drains
  credit). Do NOT poll, do NOT sleep-loop; stage everything, launch, STOP, wait for the nudge.
- KEEP WORKING continuously through mechanical stages (edits/compile/run/gates/report); stop ONLY
  for (a) discretionary-strategy-rule decisions or (b) flagship-model relays. The spec of record
  first — ask nothing it already answers.
- TESTER HARNESS v2.3: launch DETACHED via
  SRJ_FlowNexus_Local\00_CURRENT_WORKING\run_tester_v2.ps1, then STOP. The wrapper writes
  <RunName>_STATUS.txt at launch and <RunName>_DONE.txt at completion. The DONE marker's RESULT
  line is the completion instrument. The wrapper CAN die before DONE (recorded): the manual
  completion protocol is PRE_JOURNAL_LINES -> segment archive -> gates.
- THE COMPILE: C:\Program Files\Dukascopy MetaTrader 5\metaeditor64.exe (exit code 1 with "Result:
  0 errors, 0 warnings" is a known quirk — the LOG LINE is the instrument). It auto-resolves
  includes from this data tree (no /inc flag). MQL5 REJECTS forward declarations of user functions (measured 2026-09-11: error 116/155) -- define helpers AFTER their dependencies. Compile logs and tester journals are gitignored.
- THE TEST WINDOW: the tester's real range comes from config\terminal.ini [Tester] DateFrom/DateTo
  (unix seconds; currently 1787702400/1788998400 = 8/26->9/10 exclusive-end, 3,168 bars). The ini's
  FromDate/ToDate keys are IGNORED by this build. A SECOND DateFrom/DateTo pair may appear in
  [TickLoad] — it is NOT the tester range. To change the window: edit terminal.ini [Tester] only,
  with a backup + digest.
- THE EDITOR DISCIPLINE: exact-match misses happen on the leading-space class (the IDE display
  shows one extra space vs the raw file) — probe the RAW lines with a byte-level lead count and
  re-issue; never guess. Probe files DO NOT carry trailing pipes — the pipe characters in probe
  output are delimiters, not content (a recorded miss from 2026-09-11).

## HARD INVARIANTS (.clinerules section 5): digests are the instrument (mtimes and .ex5 sizes are
inadmissible); every path LITERAL and ABSOLUTE (no globs, no invented paths); record digests AFTER
the write; NO git add/commit/push without an explicit operator token; NEVER write anything under
SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS; paste raw terminal output verbatim (COUNT=0 and HITS=0 are
results, not failures); on any gate failure: report BLOCKED, name the gate and its measured value,
revert nothing.

## STATE UPDATE 2026-09-11 (session close) — THE NEWEST TRUTH; read before the sections above
- RECON4-FIXS2POLL (P-FIX-S2POLL) EXECUTED AND VERIFIED: Test passed in 0:48:57.099, 563338 ticks, 3168 bars, RESULT=PASSED 17:03:44. Journal archived manually (the wrapper died before DONE; SEG=15319). Result: 06_HANDOFFS\BUILDER_RESULT_RECON4-FIXS2POLL.md. Packet STATUS updated in place (01_TASKS). DONE marker written by the builder.
- ALL GATES PASS. Signals = the RECON3-BUILD3 four-signal set VERBATIM (8/28 10:05 SHORT D-VWAP R=2.43 SL 1.16508 TP 1.16364 bid 1.16466; 9/4 16:00 LONG Y-POC R=2.56 SL 1.15907; 9/7 09:20 LONG W-POC R=1.76 + 16:45 R=1.25). WS161 mismatch=0 loads=stores=3168 changes=205 (was 208). BIASCENSUS 1554/1614 x2 fail=0; ZONECENSUS 3168/1056; XOB-PROMO 469; all verbatim. Post-run four digests byte-identical.
- NEW EA BASELINE: 1478ADCF9DC2DC57C73A53002E7690723841A9E06E3DA161EB32526669CBBA74 (261040 B) — the 7BB1E9B6 T162_BUILD3 state SUPERSEDED. CQD BE6FD84F / OBMGR D286621C / FlowLogic 1EA7858F unchanged.
- FIXS2POLL deltas (declared, mechanism named): aborts 51->52 (LTF_MISALIGN 24->21, FRESH_OB_DEAD 7->9, FRESH_OPP_FVG 5->6, TP_RR_FAIL 5->6, SESSION_CLOSED 9=9, NO_TP_TARGET 1=1); TP_RR_FAIL_LATCH 5->6 (BUILD3's five values verbatim, ONE NEW 8/27 17:00 SHORT entry=1.16524 sl=1.16652 tp=1.16498 R=0.20 -> died at the 1R gate, no signal); INPLAYCOMMIT applied=1 213->157, committed=1 42->46 (+4, the E2 stop-swing-witness admission gain); CONFIRMPOLL 590->555; CONFIRM_PREBIND passes 4->3 (8/27 17:00 D-POC NEW; 9/1 16:55 + 9/4 09:30 passes gone — candidate lineages moved); CONFIRM_STRUCT_FAIL 198; CONFIRM_DIV_WAIT 6=6; FRESHSKIP 293->237; SUPPRESSED 156=156 (opp=0 higher=1 =2 identical); SL_REF 2-swing 60->51; SL_STRUCT 50; ANCHOR_SUPERSEDE=8 identical; MTSNAP=4 MTEXIT=4 verbatim. E1 inert (S2POLL_NO_SL_REF=0); E3 haveStop=1 on all 157 INPLAYCOMMIT lines; the defect cell closed.
- NEXT TASK (queued #1): PACKET_P-FVGVALIDITY.md DRAFT. Ruled rule: BUILDER_FINDING_0828-FVG.md section 5 — an FVG is DEAD for a new-entry POI when (1) price has traded its ENTIRE range with wicks, or (2) a candle BODY closes through it; otherwise a partial fill leaves the REMAINING UNTESTED range valid as the POI.
- MEASURED ANCHORS (FVG packet): fill pass SRJ_ImbalanceMgr.mqh L364-392 (body midpoint tests L382 bullish / L384 bearish); tickvalid L394-430 (L429 tickFVGIsValid = !latestBiasFVGIsFilled); CImbalance SRJ_Types.mqh L97-137 already carries isWickFilled/wickFillBar (dead state, only passed through the NewImbalance factory — reusable, zero vocabulary growth); the call site is FlowLogic L871 SRJ_FVG_FillDetectionPass(open,close,i,withinLookbackWindow,barClosed) — the signature must gain high[]/low[] (second canonical file, declared); FVG zone export = buffers 24/25 g_bufFvgLegZoneHigh/Low (EMPTY write FL L1053-1054, freshFvg.objId ~L1028) = the remaining-range shrink site; BiasEngine L382 consumes tickFVGIsValid in a composite flag ((!tickOBIsValid)&&(!tickFVGIsValid)&&hasPersistedOpposingFVG) — BIASCENSUS may move, declare; pass order creation(868)->fill(871)->tickvalid(873); no detectionBar guard exists today — the wick guard i > fvg.detectionBar is a design decision to declare (correctable); FVG selection gate FL L1070 if(fvg.isFilled) continue — reuses the isFilled pipeline for both kill conditions. In-window a-priori: fvgOnly=0 and haveFvg=0 across the whole RECON window -> zero signal/zone movement expected; full gates still run.
- DRAFT THE PACKET then await the operator's explicit issuance (invariant-1 gate; the P-DIVCON-B "answers are not issuance" precedent).
- QUEUE AFTER: 2 P-SL-IMBALANCE (operator-reserved); 3 P-TRIM-S2POLL (council-sequenced in PACKET_P-FIX-S2POLL section 5; the identity baseline is now established); 4 RECON Phase-2 re-run on the fixed build; 5 debris deletion word (EA_STATE_REG.md, recovery_compile.ps1); 6 git snapshot on explicit token.
- UNCOMMITTED FRAGILE: the T162_FIXS2POLL EA state + every record since 8371669 (the working tree is the only copy).
## COMMUNICATION RULE (operator directive): plain language to the operator — dates, times,
sessions (London/NY), directions, line names (tier + POC/VWAP); NEVER bare journal row numbers (one
parenthetical cite for the record only); short sentences; gloss every EA journal code (TP_RR_FAIL =
"not worth 1R"; CONFIRM_PREBIND = "the confirmation candle taken while the EA's own preparation was
unfinished"; CONFIRM_DIV_WAIT = "the newest CQD verdict was opposing — the candidate keeps
waiting)"; ANCHOR_SUPERSEDE = "a better line took over the live idea"; ANCHOR_ELECT = "seed
census, which line was picked").