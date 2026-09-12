# NEW SESSION PROMPT — paste this whole file's contents into a fresh Cline session
# (the session runs on MUSE SPARK 1.3 CONTRIBUTOR per the operator's 2026-09-11 ruling — journaled in
# .clinerules section 7.1; the Contributor tier trains on prompts/completions and the operator explicitly
# accepted that: "i would choose muse spark 1.3 contributor, i do not mind for it". Do not re-litigate.)
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

## WHERE THE PROJECT STANDS (all measured; re-hash the four baselines at session start)
- BASELINES (re-hash at session start; digests are the instrument):
  - EA:  Experts\SRJ_FlowNexus_EA.mq5 =
         693B37290717871D152C46E73AEB15B719D57964738E0162D623BFC0BC4D946E
         (252,632 B, 5,025 lines, CRLF=5025, LONELF=0; the T162_SLREF2 state — P-SLREFSIDE executed
         and verified 2026-09-11; the 2B11CB12 T162_ANYSTATE state SUPERSEDED).
  - CQD: Indicators\SRJ_CQD_TickBased_MT5.mq5 =
         BE6FD84FB970B255F7809EF81CDDE829644DCC8B859166E8B2CEB9BF1D8A421F (50,555 B)
  - OB MGR: Include\SRJ\SRJ_OrderblockMgr.mqh =
         D286621CD8E2AB92B67FBA2BE0FD60BC861FF277C7516A2CFF6F79564E220B7B (48,050 B)
  - FlowLogic: Indicators\SRJ_FlowLogic.mq5 =
         1EA7858F9B1A8F4F42D90D58A0BB8873063D874E40E32A6A4E69DD8099F73B08 (58,657 B)
- GIT: HEAD 8371669 (the Task162 snapshot, pushed to BOTH remotes). UNCOMMITTED (the working tree is
  the only copy — fragile; a git snapshot awaits an explicit operator token): the T162_SLREF2 EA
  state + this session's records (BUILDER_RESULT_T162-SLREF.md, RECON2-SLREF2_TABULATION.txt, the
  packet status, .clinerules, this prompt).
- THE SIGNAL SET UNDER THE RULED MODEL (3 signals, all measured in RECON2-SLREF2):
  8/28 10:05 SHORT Daily-VWAP LONDON R=2.43 SL 1.16508 TP 1.16364 (the operator's trade; entry
  1.16466 EXACT; the stop is now the ruled structure-top = their 6:30 high) + the 9/7 pair (09:20
  LONG Weekly-POC LONDON R=1.76; 16:45 LONG Weekly-POC NYAM R=1.25). The four fakes (8/31, 9/1, 9/2,
  9/8) silent. The 9/4 Yearly-POC retest is still BUILD 3's job.
## THE NEXT TASK (the operator-ordered work — BUILD 3, packet TO BE DRAFTED)
BUILD 3 = the LINE SUPERSESSION (council design C1 in
SRJ_FlowNexus_Local\06_HANDOFFS\COUNCIL_RESPONSE_POI-R.md — READ IT FIRST, with the builder's
verification addendum): one ElectAnchor() elected at seed AND per-bar pre-fire; RetestBook polls all
12 lines every bar; suppression becomes don't-promote; strictly-better-rank same-direction in-window
supersession; ladder progress stays line-agnostic, recomputed anchor-relative. This recovers the 9/4
Yearly-POC retest that a lower-rank Monthly-POC candidate blocked (the operator's taken trade).
ALREADY DONE in earlier builds (do NOT re-implement): the confirmation gate + one-bar validity + the
R latch (builds 1-2.5, P-CONFIRM-*); the TP selector stays the closest-line selector as built (the
operator ruled the AVP-class selector OFF; build 4 is CLOSED). NOT identity-safe — full gates.
Phase 1 = read-only mapping (the ElectAnchor sites: seed + per-bar pre-fire; RetestBook; the
singleton hold), then draft PACKET_P-BUILD3.md, then the operator's ISSUANCE before any canonical
edit.

## THE QUEUE (in order)
1. BUILD 3 (above).
2. THE FVG-VALIDITY PACKET (the operator's ruled rule in BUILDER_FINDING_0828-FVG.md: dead when
   price traded its ENTIRE range with wicks OR a body closes through; a partial fill leaves the
   remaining untested range valid; ImbalanceMgr lacks the wick-range rule; NOT identity-safe).
3. THE IMBALANCE CRITERION FOR THE SL SWING (operator datum 2026-09-11, recorded verbatim in
   BUILDER_RESULT_T162-SLREF.md section 5: a swing without an imbalance behind it cannot be the
   one-swing stop — the 8/28 09:55 high had none, so the stop = the 6:30 high = two swings away).
   This build lands the same pick by turn-absorption; the explicit test is operator-reserved — ask
   before encoding.
4. THE RECON-PILOT Phase-2 reconciliation re-runs on this build; the window gate re-evaluates
   (4/4 MUST-MATCH + 0 false + the EA-only adjudications).
5. DEBRIS (awaiting the operator's deletion word): SRJ_FlowNexus_Local\EA_STATE_REG.md and
   SRJ_FlowNexus_Local\recovery_compile.ps1.
6. A GIT SNAPSHOT: this session's records + the new canonical state — ONLY on an explicit operator
   token.

## WORKFLOW (operator standing directives — learn these before touching anything)
- THE AUTOMATION RULE: the builder closes any open MT5 terminal ITSELF (graceful first, forced
  fallback, declare it) and launches; NO pre-run ask_question. The run-completion signal is the
  operator's — UNLESS they are away, when the COUNTDOWN-TIMER rule applies (see below).
- THE COUNTDOWN-TIMER RULE (operator directive 2026-09-11): when the operator says they will be
  away, run a countdown timer — sleep chunks of at most 240s per tool call, ONE DONE-marker probe
  per chunk; when the estimated time is up, check the progress and continue the work autonomously
  (archive/gates/tabulation/result), interleaving read-only research during waits.
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
  includes from this data tree (no /inc flag). Compile logs and tester journals are gitignored.
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

## COMMUNICATION RULE (operator directive): plain language to the operator — dates, times,
sessions (London/NY), directions, line names (tier + POC/VWAP); NEVER bare journal row numbers (one
parenthetical cite for the record only); short sentences; gloss every EA journal code (TP_RR_FAIL =
"not worth 1R"; CONFIRM_PREBIND = "the confirmation candle taken while the EA's own preparation was
unfinished"; CONFIRM_DIV_WAIT = "the newest CQD verdict was opposing — the candidate keeps
waiting").