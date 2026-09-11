# NEW SESSION PROMPT — paste this whole file's contents into a fresh Cline session
Continue the SRJ Flow Nexus project in this workspace. The last session (2026-09-11)
EXECUTED build 2.5 (P-CONFIRM-ANYSTATE) end to end with ALL GATES PASSING — the 8/28
trade recovered with the operator's EXACT entry — and recorded the operator's NEXT-TASK
ruling: the SL-swing selection by protective side, not by recency.

FIRST ACTION: read MQL5\.clinerules FULLY — it is the project's workflow, invariants,
file map, and standing state. Its section 7.1 final session-stage blocks are the newest
truth; its section 8 is the first-action protocol.

TWO THINGS THE FRESH AGENT MUST KNOW UP FRONT (verified 2026-09-10/11):
1. THERE IS EXACTLY ONE .clinerules FILE. The MQL5 folder IS the Dukascopy terminal's
   data tree. Any note claiming a second "standing/mirror" rules tree is FALSE fiction
   (a recorded 2026-09-10 confabulation; the standing state carries the record).
2. MEASURE BEFORE YOU BELIEVE OR DOUBT — in BOTH directions. Never accept a claim
   without the literal hash/byte/line output; and an ACCUSATION (including doubting
   your own prior work, or "this looks fabricated") is itself a claim: measure the
   artifacts on disk before concluding anything. Do not probe paths you invented; only
   verified, literal, absolute paths. An unmeasured figure must never be written into
   a record (the recorded 2026-09-11 CONFIRMPOLL 618->611 correction).

## WHERE THE PROJECT STANDS (all measured; re-hash the four baselines at session start)
- BUILD 2.5 (P-CONFIRM-ANYSTATE) IS EXECUTED AND VERIFIED: the confirmation candle is
  now evaluated at ANY waiting-or-armed ladder state (S3_ZONE_WAIT..S5), one-bar
  validity kept, the ruled "if all my conditions are met, the trade is ON" implemented.
  Run RECON2-ANYSTATE: "Test passed in 0:47:12.150", 563,338 ticks, 3,168 bars,
  RESULT=PASSED. ALL GATES PASS. See 06_HANDOFFS\BUILDER_RESULT_RECON2-ANYSTATE.md and
  RECON2-ANYSTATE_TABULATION.txt (read both, plus the packet record
  01_TASKS\PACKET_P-CONFIRM-ANYSTATE.md = EXECUTED AND VERIFIED).
- BASELINES (re-hash at session start; digests are the instrument):
  - EA:  Experts\SRJ_FlowNexus_EA.mq5 =
         2B11CB1295B2905AC3317A483BD6DB7042A81BDA6F68826EC694580E4FB95DC0
         (247,301 B, 4,939 CRLFs, LONELF=0; the T162_ANYSTATE state; the T162_GATE
         state CA79B064... is SUPERSEDED).
  - CQD: Indicators\SRJ_CQD_TickBased_MT5.mq5 =
         BE6FD84FB970B255F7809EF81CDDE829644DCC8B859166E8B2CEB9BF1D8A421F (50,555 B)
  - OB MGR: Include\SRJ\SRJ_OrderblockMgr.mqh =
         D286621CD8E2AB92B67FBA2BE0FD60BC861FF277C7516A2CFF6F79564E220B7B (48,050 B)
  - FlowLogic: Indicators\SRJ_FlowLogic.mq5 =
         1EA7858F9B1A8F4F42D90D58A0BB8873063D874E40E32A6A4E69DD8099F73B08 (58,657 B)
- THE SIGNAL SET UNDER BUILD 2.5 (the ruled model, all measured):
  1. 2026.08.28 10:05:00 SHORT Daily-VWAP LONDON R=6.80 SL 1.16481 TP 1.16364 —
     THE OPERATOR'S TRADE RECOVERED; ENTRY 1.16466 = THEIR EXACT JOURNAL ENTRY.
  2. 2026.09.07 09:20:00 LONG Weekly-POC LONDON R=1.76 — verbatim (protected).
  3. 2026.09.07 16:45:00 LONG Weekly-POC NYAM R=1.25 — verbatim (protected).
  The four EA-only fakes (8/31, 9/1, 9/2, 9/8) stay SILENT; no new signals from the
  pre-bind cascade. The 9/4 Yearly-POC retest recovery is still BUILD 3's supersession.
- THE OPERATOR'S RULINGS RECORDED THIS SESSION (all verbatim on disk):
  - The 8/28 SHORT was TAKEN (not killed): entry 1.16466 = the next open after the
    confirmation candle; early exit 1.16464 at the 11:35 open = the ruled EXIT-POCVWAP
    standard (the D-POC gap-jump + body close through it; the STEP-4 exit layer).
  - THE FVG-VALIDITY RULE (BUILDER_FINDING_0828-FVG.md sections 2+5): an FVG is dead
    for a new-entry POI when price has traded its ENTIRE range with wicks OR a candle
    BODY closes through it; a partial fill leaves the remaining untested range valid
    as the POI. The EA already kills on body close (ImbalanceMgr L382/384) but lacks
    the wick-range rule and the remaining-range concept.
  - THE SL-SWING RULE (BUILDER_FINDING_0828-SLREF.md section 1, verbatim): "what i
    define as one swing or two swings away for the SL is higher or lower from the
    entry price, not the most recent swing high or low. it might be from an older
    structure" — the operator ordered this DRAFTED AS THE NEXT TASK.
  - The P-CONFIRM-GATE "8/18" packet item DROPPED (unreachable in-window; builder-
    decided; the 8/18 no-signal was already ruled behavior at T161R).

## THE NEXT TASK (the operator-ordered first work item)
PLAN_SLREF-SIDE.md (01_TASKS) — the SL-swing selection by protective SIDE, not by
recency. Phases:
- PHASE 1 (read-only measurement, do this FIRST): read the spec of record's SL section
  (the XOBSUIT-1 discipline — the spec answers first); map ComputeSlReference's two
  branches and every selection site (S2POLL/S3ARM/S5); locate the 6:30-high swing in
  the FlowLogic buffers at the 8/28 bars (does the export carry it?); derive the
  8/28/9/7 examples under the ruled rule by hand from T162DUMP_JOURNAL.log (the OHLC
  dump) + the swing buffers; derive the TRUE 6:30-high level from the dump (the
  journal's "1.65068" is an apparent typo). KEY JUDGMENT ITEM to surface BEFORE any
  packet: under the ruled stop the 8/28 R moves from 6.80 to ~1.00 (slDist = tpDist =
  102 pts with the ruled TP = the Daily-VWAP line) — exactly AT the gate; if the true
  6:30 high lands below 1.0, the trade DIES at the ruled 1R gate — put the measured
  number to the operator and let them rule BEFORE implementing.
- PHASE 2: the packet draft (EA expected; FlowLogic joins only if the export lacks
  the swing data), full S1-S7 stages, gates with the protected identities (the two
  9/7 trades verbatim; the 8/28 signal at the same bar with the same entry 1.16466;
  the fakes silent).
- If a genuine ambiguity survives the spec + measurement, put ONE batched plain-
  language question to the operator; otherwise proceed mechanically.

## THE QUEUE (in order)
1. SLREF-SIDE (the next task — above).
2. BUILD 3: the line supersession (ElectAnchor + RetestBook promotion, council design
   C1) — recovers the 9/4 Yearly-POC retest that a lower-rank line blocks.
3. THE FVG-VALIDITY PACKET (the operator's ruled rule above; NOT identity-safe;
   ImbalanceMgr — zone edges and bias-FVG validity move; full gates).
4. Then the RECON-PILOT Phase-2 reconciliation re-runs on the fixed EA; the pilot
   window gate re-evaluates (4/4 MUST-MATCH + 0 false + the EA-only adjudications).
5. DEBRIS (awaiting the operator's deletion word — NOT a builder decision):
   SRJ_FlowNexus_Local\EA_STATE_REG.md and SRJ_FlowNexus_Local\recovery_compile.ps1.
6. A GIT SNAPSHOT: the T162_ANYSTATE canonical state + every record since commit
   f3c83f0 exist ONLY in the working tree — fragile. A snapshot (and any push) awaits
   an explicit operator token.

## WORKFLOW (operator standing directives - learn these before touching anything)
- THE AUTOMATION RULE (operator verbatim, 2026-09-10): "for future reference, do not
  ask me for those options before the strategy tester run if the terminal is open.
  make the this developing process more automated so i can be away from the desk and
  IDE." MEANING: the builder closes any open MT5 terminal ITSELF (graceful first,
  forced fallback, declare it) and launches; NO pre-run ask_question. The
  run-completion signal stays the operator's ("the run has completed, please
  proceed") - the builder then completes archive/gates/tabulation/result manually if
  the wrapper died.
- KEEP WORKING continuously through mechanical stages (edits/compile/run/gates/
  report); stop ONLY for (a) discretionary-strategy-rule decisions or (b) flagship-
  model relays. Code questions go to Opus 5 via the operator; the spec of record
  first - ask nothing it already answers.
- TESTER HARNESS v2.3: launch DETACHED via
  SRJ_FlowNexus_Local\00_CURRENT_WORKING\run_tester_v2.ps1, then STOP - no polling,
  no sleep loops. The wrapper writes <RunName>_STATUS.txt at launch and
  <RunName>_DONE.txt at completion; poll later with ONE Test-Path per tool call. The
  DONE marker's RESULT line is the completion instrument. The wrapper CAN die before
  DONE (recorded): the manual completion protocol is PRE_JOURNAL_LINES -> segment
  archive -> gates.
- THE COMPILE: C:\Program Files\Dukascopy MetaTrader 5\metaeditor64.exe (its exit
  code 1 with "Result: 0 errors, 0 warnings" is a known quirk - the LOG LINE is the
  instrument, not the exit code). It auto-resolves includes from this data tree (no
  /inc flag needed). Compile logs and tester journals are gitignored per R-220.
- THE TEST WINDOW: the tester's real range comes from config\terminal.ini [Tester]
  DateFrom/DateTo (unix seconds; currently 1787702400/1788998400 = 8/26->9/10
  exclusive-end, 3,168 bars). The ini's FromDate/ToDate keys are IGNORED by this
  build (a measured permanent property). A SECOND DateFrom/DateTo pair may appear in
  [TickLoad] - it is NOT the tester range (measured 2026-09-11). To change the
  window: edit config\terminal.ini [Tester] only, with a backup + digest.
- The recorded editor discipline: exact-match misses happen on the leading-space
  class (the IDE display shows one extra space vs the raw file) - probe the RAW lines
  with a byte-level lead count and re-issue; never guess.

## HARD INVARIANTS (.clinerules section 5): digests are the instrument (mtimes and
.ex5 sizes are inadmissible); every path LITERAL and ABSOLUTE (no globs, no invented
paths); record digests AFTER the write; NO git add/commit/push without an explicit
operator token; NEVER write anything under
SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS; paste raw terminal output verbatim (COUNT=0
and HITS=0 are results, not failures); on any gate failure: report BLOCKED, name the
gate and its measured value, write nothing further, revert nothing (invariant 8).

## COMMUNICATION RULE (operator directive): plain language to the operator - dates,
times, sessions (London/NY), directions, line names (tier + POC/VWAP); NEVER bare
journal row numbers (one parenthetical cite for the record only); short sentences;
gloss every EA journal code (TP_RR_FAIL = "not worth 1R"; CONFIRM_PREBIND = "the
confirmation candle taken while the EA's own preparation was unfinished";
CONFIRM_DIV_WAIT = "the newest CQD verdict was opposing - the candidate keeps
waiting").
