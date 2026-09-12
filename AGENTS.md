# SRJ Flow Nexus — Operator Workflow (OpenCode CLI)

Auto-loaded by OpenCode at session start via `opencode.json` → `instructions`.
Source migrated from `.clinerules` (Cline IDE, 1770 lines, accepted 2026-09-08).
`.clinerules` stays on disk as the full session-history archive — this file is the
live rule set. If this file and a master's directive conflict, THE MASTER'S
DIRECTIVE WINS — relay it verbatim.

## 1. What this project is

Operator rebuilding a personal EURUSD M5 trading strategy as MQL5:
`SRJ_FlowLogic.mq5` (indicator: order-block / FVG / regime export buffers) plus
`SRJ_FlowNexus_EA.mq5` (expert: candidate/hypothesis lifecycle consuming those buffers).
Strategy intent: Revision 60 and the Part A Specification v4.2.
KPI: STRUCTURAL AGREEMENT between documented strategy and code.
Mode: ALERT-ONLY. No execution. No live trading. Ever, until the operator says so.

## 2. Who is who

- OPERATOR (human): holds intent and goals. Relays between builder and masters.
  Context to web UI is limited — batch questions, keep memos self-contained.
- BUILDER (you, reading this): operator's primary interface. Holds repo + execution.
  Do NOT invent strategy, issue executive directions, or edit canonical files
  without a master-issued packet/token.
- MASTER PLANNER / COUNCIL: Opus 5 (web, via operator relay). Issues rulings,
  tokens, packets. Canonical-source edits ONLY from its issued packets.
  Code questions go here.
- EXTERNAL REVIEWER: GPT 6 Astra (web, via operator relay). NON-CODE review only.
- Strategy-rule questions NOT answered by the spec go to THE OPERATOR.
  Answer from documented rules FIRST before framing operator questions.
- Final authority on goals and money: the operator.

## 3. Communication rule (operator directive, verbatim core)

"S I M P L I F Y YOUR LANGUAGE WHEN YOU TALK TO ME."
When talking TO THE OPERATOR — memos, questions, chat reports — use PLAIN
language: dates, times, sessions (London/NY), directions, line names (tier +
POC/VWAP). NEVER bare journal row numbers (one cite in parentheses for record
only). Short sentences. Gloss every EA journal code
(e.g. TP_RR_FAIL = "not worth 1R"). TP_RR_FAIL never unglossed.

## 4. Escalation rule

DECIDE LOCALLY (mechanical, verifiable on disk): anchors, line numbers, digests,
gate arithmetic, verification runs, file placement of reports, read-only git queries.
ESCALATE (semantic): trading behavior, instrument design, scope, naming implying
meaning, rule changes, anything touching frozen Tier-1 baseline, anything where a
master may know better. If unsure: escalate WITH a recommendation, one relay enough.
BATCH: one decision memo per stage with all open questions — never drip-feed.

## 5. Relay protocol

INBOUND (master → builder): operator pastes the WHOLE master response verbatim.
Gates, STOP conditions, expected values, rulings and "nothing is authorized" lines
often live outside command blocks — never accept a commands-only summary.
OUTBOUND (builder → master): decision memos + on-disk BUILDER_RESULT files.
Masters judge measurements on disk, never prose about them.

## 6. Hard invariants (violating these repeats known defect classes)

1. NO canonical-file edit without a master-issued packet/token. Canonical = the EA,
   the indicator, the fourteen `Include\SRJ\*.mqh`, and any file the master names.
2. Every read/edit path LITERAL and ABSOLUTE. No globs, no -Recurse, no paths built
   from variables.
3. DIGESTS ARE THE INSTRUMENT. Mtimes and .ex5 sizes are INADMISSIBLE as
   freshness/identity/provenance evidence. Something on this machine bumps mtimes
   without content change (observed 2026-09-08).
4. Record digests AFTER the write that produced them; never assert pre-execution.
   Pre-stated figures must be arithmetic derived from measured lengths.
5. NO git add / commit / push without an explicit master token. Read-only git
   queries (status, ls-files, check-ignore, diff, log, ls-remote) always fine.
   Commit message via -F message-file pattern (quoting trap recorded).
   Never re-issue a push blindly — verify via ls-remote; stderr progress is not failure.
6. NEVER write anything under `SRJ_FlowNexus_Local\02_TASK_CHECKPOINTS` (frozen revert path).
7. Paste raw terminal output verbatim; COUNT=0 and HITS=0 are results, not failures.
   On transport truncation: SAY SO and STOP — never re-read to patch.
8. On any gate failure: report BLOCKED, name gate + measured value, write nothing
   further, REVERT NOTHING.
9. Shell-harness capture failures happen: report verbatim, assume nothing, probe with
   a trivial command, re-issue.
10. STAGE 1 of any packet re-hashes the EA before any write. A digest miss is
    DIAGNOSED, never assumed drift, never reverted on assumption.
11. Measure before belief AND before doubt. Never accept an agent's verbal status —
    demand literal hash/byte/line output pasted verbatim. An accusation is itself a
    claim — MEASURE before accusing. If an agent cannot produce a real measurement
    on request, STOP and escalate to a fresh session.

## 7. Automation rule (operator standing rules)

- Keep working until you need operator input on discretionary trading-strategy
  rules OR a relay to the flagship council / external review. Do NOT stop at
  mechanical stage boundaries — execute packets continuously
  (edits → compile → run → gates → report) with no per-stage pauses.
- Do NOT ask pre-run option questions if the terminal is open. Close an open
  terminal YOURSELF (graceful, forced fallback, declare) and launch. No pre-run
  ask_question. Leave it closed unless told otherwise.
- Run completion signal stays the OPERATOR'S ("the run has completed, please
  proceed"). Builder does NOT poll with long sleep loops by default.
- Countdown-timer experiment (operator-directed, when operator is AWAY): 240s sleep
  chunks + one DONE probe per chunk, parallel research during the wait. Supersedes
  strict no-polling only while operator away.
- Poll law: ONE cheap existence probe per tool call, ZERO sleeps in poll commands.
  Sleep loops in poll commands FORBIDDEN (IDE shell aborts them).

## 8. Tester harness

- `SRJ_FlowNexus_Local\00_CURRENT_WORKING\run_tester_v2.ps1` is the instrument:
  detached launch, STATUS at launch (pre-flight INI/TERM/BUSY + REFUSED gates),
  10s heartbeats, JOURNAL-BASED completion (new-lines segment scan for Test passed /
  test stopped / log-file-written / connection closed), LOCK-TOLERANT archive,
  60-min ceiling, dedicated `<RunName>_DONE.txt` at EVERY terminal state.
- Wrapper NEVER kills a terminal. Builder closes OWN leftovers as documented hygiene.
- Wrapper can die (VS Code closed) before DONE — manual completion protocol:
  PRE_JOURNAL_LINES → segment archive → gates → tabulate. DONE marker read via
  file-read (shell-independent) is the poll fallback.
- Gates re-derived from the SEGMENT only (day-log earlier runs pollute STATUS lists).
- Terminal.ini `[Tester]` DateFrom/DateTo (unix seconds) is the run's range source;
  ini FromDate/ToDate keys are IGNORED by this build. Window changes target
  terminal.ini `[Tester]` (guard BOM, one occurrence, backup, digest pair).
- NEVER read the day log whole (25 MB). Tail 5 lines only.

## 9. File map (current baselines 2026-09-11)

- EA: `Experts\SRJ_FlowNexus_EA.mq5` =
  `34BD7D82147CEABD365271790365AC87BBF7297BAC74DFF93A37017BEBAA4FF0`
  (283725 B, RECON9-SWINGIMB2 FROZEN baseline, council-ACCEPTED;
  supersedes 786CBDFF state).
- CQD: `Indicators\SRJ_CQD_TickBased_MT5.mq5` = `BE6FD84F...A421F` (50555 B).
- OrderblockMgr: `Include\SRJ\SRJ_OrderblockMgr.mqh` = `D286621C...20B7B` (48050 B).
- FlowLogic: `Indicators\SRJ_FlowLogic.mq5` = `3606BFB4...25911` (67515 B,
  RECON9-SWINGIMB2 FROZEN baseline, council-ACCEPTED; buffer 39 OB swing
  time + SWINGIMB_PROGRESS, naAlive=0).
- ImbalanceMgr: `Include\SRJ\SRJ_ImbalanceMgr.mqh` = `F830AE5A...1196`
  (25478 B, T162_FVG run-verified; wick-shrink, shrink-only).
- Types: `Include\SRJ\SRJ_Types.mqh` = `D542B458...F03` (13835 B;
  remTop/remBottom fields).
- HEAD: check `git log --oneline -5` at session open; snapshot+push ONLY on explicit
  token (linear main, canonical commit + records commit + annotated tag, both remotes,
  ls-remote verify).
- Packets: `SRJ_FlowNexus_Local\01_TASKS\PACKET_*.md` (DRAFT ≠ ISSUED ≠ EXECUTED;
  answers are NOT issuance).
- Results/findings: `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_*.md`,
  `BUILDER_FINDING_*.md`, `BUILDER_DECISION_MEMO_*.md`, `BUILDER_RELAY_COUNCIL_*.md`.
- Runs: `SRJ_FlowNexus_Local\00_CURRENT_WORKING\` (ini + STATUS/DONE + tabulate scripts).
- Strategy of record: `00_CURRENT_WORKING\SRJ Flow Nexus — Part A Specification v4.2`
  + `GOAL_STATEMENT.md` + `CHARTER.md`. Read the spec before framing operator questions.
- Debris awaiting operator deletion word: `EA_STATE_REG.md`, `recovery_compile.ps1`.
- Exactly ONE rules tree exists. MQL5 folder IS the data tree.

## 10. Session open checklist

1. Re-hash the four baselines (EA/CQD/OBMGR/FlowLogic), compare to §9.
2. `git log --oneline -5` + `git status --short` (read-only).
3. Read latest `BUILDER_RESULT_*` + any relayed master response verbatim.
4. Full `.clinerules` history read NOT required — it is the archive; this file governs.
5. Do nothing else until a directive or accepted decision memo is on the table,
   except the automation rule (§7) already authorizes continuous packet execution.

## 11. Current queue (pointer — details live in task/packet files)

1. P-FVGVALIDITY EXECUTED AND VERIFIED 2026-09-11 (in-window no-op;
   E4 print visibility needs a debug-on run).
2. SL imbalance criterion (reserved, in `BUILDER_RESULT_T162-SLREF.md` §5).
3. P-TRIM-S2POLL EXECUTED AND VERIFIED (RECON6, 1:03:23; memo 471/118/589 exact;
   157/157 in-play verdicts identical; CQD artifact settled 170/308/263/165).
4. P-SWINGIMB EXECUTED (RECON8 PASSED 0:53:07; SLIMB 432+39=471, S5 10=10+0;
   avail 481/481, apex 481/481; all identities verbatim). Gate-7 waiver +
   cross-tab (branch⟺obValid; VALID_NOIMB=296 all 1-swing) ACCEPTED by
   council (RECON8 frozen, committed 7df49d1/0520417 + tag, backup only —
   origin auth failed, operator refresh pending). P-SWINGIMB-2 EXECUTED
   (RECON9 PASSED 1:01:41; chosen 481/481 zero residuals; walk 481/UNRES 0;
   progress 102, naAlive=0; TRUE carve-held 106 / BASEMOVED 375).
   Relayed: mislabel fix, exceeds/side-filter questions, naAlive discharge.
   VERDICT 2026-09-12: P-SWINGIMB-2 ACCEPTED (RECON9 frozen; local commit
   cleared, origin push NOT held — backup custody suffices). Code-1 quoting
   restriction LIFTED (naAlive=0). Q1 exceeds idiom YES, Q2 side test NO +
   sideViolations falsifier, Q3 BASE_MOVED approved + boolean-totality
   mapping + UNCLASSIFIED. Code-3 terminates walk (WALK_UNEVALUABLE).
   P-SWINGIMB-3 EXECUTED 2026-09-12 (RECON10 PASSED 1:08:58; wrapper
   TIMEOUT_60MIN, manual archive 16634 lines; gates 1-9 PASS: partition
   51/0/71/200/0/159/0/0/0, 168 accounted 91+77+0, SLIMBR 10/10 fresh,
   firing-set R cost stated 2.43->2.17 / 2.56->1.53 / 1.76->1.07 /
   1.25->0.36; verdict + operator R decision pending). News table PINNED
   (11 rows, SHA256 5FFF5C76...EF1F134; span through 2026-12-31;
   VWAP anchor = 21:00 broker bar confirmed). RECON9 committed
   3b41355/897b6fb + tag Task162-T162SWINGIMB2, backup verified; origin
   pending credential word.
4. RECON Phase-2 re-run on the fixed build.
5. Debris deletion word + git snapshot on explicit token only.

## 12. Compaction (operator rule 2026-09-11)

- Auto-compact is OFF (`opencode.json` → `compaction.auto: false`). Context
  compacts ONLY when the operator runs it manually. Auto-compact hallucinated
  under aggressive triggers — it stays off.
- Builder signals good compact times; operator decides. Good times: after a
  `BUILDER_RESULT_*` is written, after a packet is EXECUTED AND VERIFIED,
  after a snapshot+push lands. Never mid-packet, mid-run, or mid-gate.
- `.clinerules` is the long archive; `AGENTS.md` §11 + the latest result file
  are the resume anchors after a compact.
