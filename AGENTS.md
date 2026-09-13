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

Lesson 2026-09-13 (operator correction, standing): the operator cannot
see the builder's file tree and does not know file names. Every memo
that references a deliverable MUST name its exact file
(`06_HANDOFFS\NAME.md` form at minimum) and say what to do with it
(read vs paste-whole-to-council). Never write "beside it", "the relay",
"the brief" or any other bare pointer. A memo with an unnamed file is
a defective memo — reissue it named.

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
- LAUNCHER DETACH LAW (lesson 2026-09-12): the launch script must start the
  wrapper via Start-Process with stdout/stderr redirected to files. The old
  ProcessStartInfo form let the wrapper inherit the builder shell's pipe and
  hung the launch call until the run ended (~1h). Launch prints one line and
  returns in <1s; completion is detected later via the DONE file only.
- Wrapper journal reads must stay O(n) (List.Add, never `+=`): the 54 MB day
  log cost 15 silent pre-flight minutes on RECON13 (a full CPU core, no STATUS
  update). Fixed in-script 2026-09-12; affects launches after RECON13 only.

## 9. File map (current baselines 2026-09-11)

- EA: `Experts\SRJ_FlowNexus_EA.mq5` =
  `EDAA089A7A7A98A3B9FAFCBAE0C76694CA253B92109CDAC252ECC4BEF3CBE7D1`
  (328520 B, RECON12c-NEWS FROZEN baseline, council-ACCEPTED;
  supersedes 75FEBFDE state, which stays frozen for the imbalance
  instrument only as a carried-token reference).
- CQD: `Indicators\SRJ_CQD_TickBased_MT5.mq5` = `BE6FD84F...A421F` (50555 B).
- OrderblockMgr: `Include\SRJ\SRJ_OrderblockMgr.mqh` = `D286621C...20B7B` (48050 B).
- FlowLogic: `Indicators\SRJ_FlowLogic.mq5` = `3606BFB4...25911` (67515 B,
  RECON10-SWINGIMB3 FROZEN baseline, council-ACCEPTED, UNCHANGED since
  RECON9; buffer 39 OB swing time + SWINGIMB_PROGRESS, naAlive=0).
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
   1.25->0.36; VERDICT 2026-09-12: ACCEPTED correct-under-conservative,
   RECON10 frozen (committed f07e4b1/8da1ad2 + tag Task162-T162SWINGIMB3,
   backup verified; origin still pending). P-SLDEF-1 ISSUED (E11 fractal
   limb + E12 four-column SLIMBR + E13 frame reconcile + E14 N1 counters;
   no FlowLogic edit) + AMENDMENT (gate-6 outwardPts restated, THRESHOLD
   in FRAME_NOTE, S5 carve gate, margin flag, news conversion-at-read).
   P-SLDEF-1 EXECUTING 2026-09-12 (E11 parameterized core, no fork;
   fracClass token added per E11.7; EA A58BCB4B...7283AB 301971 B
   UNCOMMITTED, FlowLogic 3606BFB4 unchanged; both compile 0/0).
   RECON11-SLDEF RUNNING (launched 14:33:03, PID 13128,
   PRE_JOURNAL_LINES=70440). RECON11 DONE 15:43:45 (Test passed 1:07:02;
   wrapper TIMEOUT_60MIN, manual archive 16633 lines) — BLOCKED:
   gate-4 sideViolations=26 (all fractal-side, OB limb proven 0 via
   481/481 OB-identity) + walk-line truncation (~537 chars lost
   fracClass/outward/walk-barTime). OB partition identical (no-fork
   proven); SLIMBR 4-col + N1EQUALS + DECISION intact; Sep-7 fractal
   nuance = 1.16240 / R 2.56 = operator's arithmetic (ruling-c live).
   NO commit (BLOCKED). Council verdict 2026-09-12: BLOCKED STANDS,
   RECON10 stays frozen; no-fork proven by the join; Q2 overturned on
   fractal limb only; gate-6 carried untested; R gap is 1.16239 vs
   1.16240 stop (operator's call, no code moves); E13.3 zone language
   rejected; N1 = encountered-57 (pairing owed). P-SLDEF-1b ISSUED
   (E15 split+LINEWIDTH, E16 Task-75 guard, E17 outward restore,
   E18 carve operands, E19 N1 pairing rider — off-log pairing
   impossible, counters are tallies). EA A58BCB4B verified unchanged
   post-verdict; FlowLogic 3606BFB4. P-SLDEF-1b EXECUTED 2026-09-12
   (EA 75FEBFDE... 314461 B UNCOMMITTED; both compile 0/0; E16 via
   single-expression extraction, E18 as SLIMBRCARVE companions).
   RECON11b DONE (Test passed 1:07:31, archive 17137 lines) — BLOCKED
   gate-5 only: guardApplied=60 vs expected 26 (input-side 60 ⊋
   result-side 26; the 26 exactly contained; 34 extra all non-S5;
   S5 surface bit-identical 10/10). Result filed; NO commit; RECON10
   frozen. Council ruling owed: accept-60 vs post-walk-26. R handoff:
   whole gap = 1.16239 vs 1.16240 stop (54/22 vs 54/21), operator's call.
   Build 11c (if any) on verdict word. Off-log reports owed with relay-back: sign counts
   + live min-R + crossings. Governance ruling filed: hand journal may
   motivate, never adjudicate (two-source standard). N1 CONFIRMED as
   code-read (counters in E14). News table PINNED
   (11 rows, SHA256 5FFF5C76...EF1F134; span through 2026-12-31;
   VWAP anchor = 21:00 broker bar confirmed) — now critical-path per
   council (frame convention must cover table timestamps).
   VERDICT 2026-09-12: P-SLDEF-1b ACCEPTED (RECON11b frozen; local commit
   cleared, NO push — origin operator-latency, backup not authorized). Code-1 quoting
   restriction LIFTED (naAlive=0). Q1 exceeds idiom YES, Q2 side test NO +
   sideViolations falsifier, Q3 BASE_MOVED approved + boolean-totality
   mapping + UNCLASSIFIED. Code-3 terminates walk (WALK_UNEVALUABLE).
   Gate-5 ACCEPT-60 (input-side population + containment POS_NOT_GUARDED=0);
   ff1xBASE_MOVED definitional (restated falsifier ff1xsteps!=0 = 0 off-log
   over 56 rows; fracAnchorPx owed). Gate-8 CLOSED on operands (single
   0.1-pip gap). N1: CONFIRMED body+POC, CONTRADICTED wick (10/16),
   UNEXERCISED vwap+exit — operator ruling owed. Labels: three pairs
   (+20/-15/-10), resolve by content (16:15=1.16239 resolved by his
   status bar; TP drift closed: code picked Yearly-VWAP 1.16315, his
   1.16318 = same line later). Journal numbers all four filed
   (Sep-7AM exact; Aug-28 exit 1.16464 vs 1.16451 same bar; Sep-4 SL
   1.15847 vs 1.15907 + flat 1.16129@23:55; day close = 00:00 broker =
   17:00 ET, 23:05 was a typo). SL rule generalized by operator: EXACTLY
   two swings away, both cases; 1.16112 a "ghost". P-NEWS-1 ISSUED
   (E20-E22 blackout census; print-only; MTEXIT stays 4).
   RECON12 DONE (passed, rowsInWindow=0 — range-from-history defect, owned).
   RECON12b DONE (passed; false gap-halt + sticky-flag flats 12/2, owned).
   RECON12c DONE 22:53:41 (Test passed 1:06:41; manual archive 17155 lines;
   journal E73A5E8C; EA EDAA089A 328520 B UNCOMMITTED) — gates 1-8 PASS
   (gate-6 note: ROW/CENSUS audit lines unemitted, off-log maxes 236/294;
   1-line move owed): census rows=11, in-window=1 (NFP 9/04 15:25-15:40),
   memberBars=3/3, overlaps=0, flats 0/0/0 TRUE-open, Oct-28 offset 360
   correct, DST unexercised; imbalance side 481x3+10/10 zero-mismatch.
   NO commit (no verdict). Standing rules: gates name their
   population; repaired inputs stay distinguishable; collision scoping
   (class/fracClass/nuanceClass); audit lines non-self-matching (DONE via
   quoting + head-anchored patterns); wrapper = standing archive method
   (stalled pre-DONE on 12c — manual protocol used, defect noted).
5. VERDICT 2026-09-12: RECON12c ACCEPTED (new frozen baseline EDAA089A;
   local commit cleared, NO push). Gate-3 across 3 builds = custody
   proven. G6: 236/294 labelled arithmetic, move in P-SLDEF-2.
   Archive = purity triple (1/4/481), stall logged. Artifact +1:
   sticky-flag (state-defined counts). DST demonstrated (Oct-28 360);
   Sep/Dec 21:00 = operator anchor from table. Probe requirement for
   future sides (off-canonical, reverted, never committed). Sep-4 flat
   via MTLIFE; "two-away" NOT packetized (blast 441, chain, granularity);
    next = ladder + his mark-up (both levels must be rungs). P-SLDEF-2
    ISSUED (E23 ladder, E24 match, E25 MTLIFE, E26 audit move; print-only).
    P-SLDEF-2 EXECUTED 2026-09-13 (EA 13560ABF… 341466 B UNCOMMITTED, both
    compile 0/0, FlowLogic 3606BFB4 unchanged). RECON13 DONE 00:32:17
    (Test passed 0:49:19; midnight split → wrapper UNDETERMINED, manual
    archive 17256 lines journal B79C5971…; purity 1/4/481) — BLOCKED on
    gate 8 (packet's own halt): 16:40 row's 8 rungs span slots 1–29
    (px ≥1.16209), no 1.16112 rung, while the walk runs 20 steps to
    1.16112 — absence is cap-adjacent, not ghost evidence. All other
    gates PASS (gate-3 fifth build 481x3+10/10 zero-mismatch; decisive
    gate met: his 1.16240 MATCH rung 0 slot 1 ext 0; his 1.15907 NOMATCH
    ×3, nearest +5 on the 15:55 row whose slToday EQUALS 1.15907;
    MTLIFE 4/4 all-zero → dayFlat=0 with operands vs his 23:55 flat;
    width 14/14 incl. ROW/CENSUS). 16:45 = SIGNAL bar, 16:40 = S5 eval
    row (mapping disclosed). NO commit; RECON12c stays frozen.     Council
    ruling owed: Q1 extend-ladder vs rule-absence, Q2 label mapping,
    Q3 E26 loop-relocation approval. Harness repaired (launcher detach
    + O(n) journal read; future runs only).
6. VERDICT 2026-09-13: RECON13 11/12 ACCEPTED (gate-8 halt CORRECT +
   INCONCLUSIVE; EA 13560ABF uncommitted; RECON12c frozen). Q2 mapping
   CONFIRMED (signal=S5+Period; 5th FRAME_NOTE convention; SIGMAP 4/4).
   Q3 E26 APPROVED. Q1: EXTEND by COVERAGE (ladCovers/ladCapHit; count
   becomes output). Findings: Sep-4 +5 = probable frame #4 (slot
   identity; FRAC_OFF halts / TODAY_OFF stays finding); Sep-4 zero-length
   record = evaluation-order question (MTFLIP); flats PROVISIONAL; −15
   pair resolved by content; archive = purity segment+SHA+count+bounds
   (no more wrapper repairs in canonical packets). Zero-step falsifier
   off-log 0/0/0 (11b/12c/13). E29 count corrected: vHTF=1 fires ONCE
   (Sep-4 16:00 anti=2). P-SLDEF-3 ISSUED (E27 coverage, E28 slots,
   E29 flip, E30 conventions; print-only).
7. P-SLDEF-3 EXECUTED 2026-09-13 (EA 2702B7F2… 357192 B UNCOMMITTED, both
   compile 0/0, FlowLogic 3606BFB4 unchanged). RECON14 DONE=PASSED
   06:51:02 (Test passed 0:57:54; wrapper archived itself 17516 lines
   journal F0D7AC70…, boundaries [9705..27220]; purity 1/4/481) —
   BLOCKED on gate 5 (halt-gated): 8/10 cover; 15:55 target = OB base
   slot 524 (walk window vs ladder window differ), 9/08 refs at slot
   817. All else PASS: gate-8 GHOST RETIRED (1.16112 = rung 19, slot
   77, ext 6, imbCode 1, 10:10 bar); 52/52 slot residuals zero (+5 was
   frame defect); 15:55 MATCH (predicted); MTFLIP ×1 pre-flipped
   (barsHeld 0, biasBefore 2); SIGMAP 4/4; 19/19 width; sixth inert
   join zero-mismatch. Zero-step falsifier 0 on-run (56 anchors).
   NO commit; RECON12c frozen. Council ruling owed: cap raise vs
   walk-window anchoring vs accept-uncovered. Launch call still hangs
   builder-side despite redirection (launch itself proven reliable;
   try `cmd /c start` next).
8. VERDICT 2026-09-13: RECON14 ACCEPTED (new frozen baseline 2702B7F2;
   local commit cleared, NO push). Gate-5 = packet over-specification;
   coverage RESCOPED to rung-obligated (walkSteps>0); REF_OB_DEEP for
   zero-step OB extremes; rung index derived, never key (slot,barTime,
   px,imbCode); 6th FRAME_NOTE convention. 9/08 discharged off-log
   (walkSteps=0); 15:55 = named 31-slot shortfall (E31). "Two-away"
   REFUTED (rung 0 vs 16); mark-up by barTime+price only. Same-bar race
   = entry-side (E33 for exit/news-guard design). 1.15847 open.
    P-SLDEF-4 ISSUED (E31 rescope+window, E32 decision, E33 order,
    E34 conventions; print-only).
 9. P-SLDEF-4 EXECUTED 2026-09-13 (build 1 EE8DCC1F… 383578 B UNCOMMITTED,
    both compile 0/0, FlowLogic 3606BFB4 unchanged). RECON15 DONE=PASSED
    10:32:41 (Test passed 0:55:12; wrapper archived itself 17548 lines
    journal 9A9AE93B…, boundaries [27221..44768]; purity 1/4/481) —
    SUPERSEDED, defect owned: beyond-check missed the wCoverN>0 guard,
    9/08 (only SHORT empty-obligation row) broke after rung 0 on
    coverT=0.0. Build 2 (1EE6FC62… 383844 B, one-line guard) ran
    RECON15b DONE=PASSED 11:34:09 (Test passed 0:54:46; wrapper archived
    itself 17598 lines journal 1BB162E5…, boundaries [44769..62366];
    purity 1/4/481): all 15 gates gradeable, 15/15 PASS — 15:55 covers=1
    (window 574, deepest 571, base 524 matched resid 0; shortfall CLOSED);
    10:35 change explained (frac-only obligation → covers at 29 rungs,
    zero-step OB extreme at 168 take REF_OB_DEEP; pairs 52→50 = −3/+1);
    ghost rung 19 slot 77 imb 1; MATCH slots 1/407 resid 0; ORDER 16/16
    bars (6/6/4/0/0, flip&&PASS=0, 15:55 seqBias 279 seqS5 280 anti 2);
    DECISION 10/4/24 threshold quoted; SIGMAP 4/4; FRAME_NOTE six
    conventions; 22 width classes clean; eighth inert join zero-mismatch;
    spot 157/157/443. NO commit; RECON14 stays frozen. Council verdict
    owed: ACCEPT + baseline advance to 1EE6FC62, or BLOCK. If ACCEPTED,
    next: HANDOFF BRIEF, then operator mark-up (barTime+price). Harness:
    `cmd /c start` with splatted argv launches reliably (two quoting
    traps logged in launch script); builder-side call still hangs after
    printing (launches proven via STATUS); terminals closed gracefully
    post-run (3576, 21200).
10. VERDICT 2026-09-13: RECON15b ACCEPTED (new frozen baseline 1EE6FC62;
    local commit cleared, NO push). Ask2 CONFIRMED (10:35 frac-only shape
    = rescope working; TODAY_OFF=2 is the second pure-count refutation).
    Ask3 row-HALT CONFIRMED with constraints + RIDER status VACUOUS_COVER
    with ladObligN (P-SLDEF-5-RIDER, no own run). ORDER recount R1: 16
    rows / 16 bars / 12 stamped / 4 unstamped (verdict's 13 miscounted;
    guard held). Flip disagreement R2 by code-read: same HTF buffers +
    want idiom; predicate (newness vs level) + eval bar differ;
    relocation not owed; orderFlipPass scope-annotated in brief. R3 9/08
    walkSteps=0 closed. R4 matched-R 2.56/2.56. R5 RECON15 9/08 exhibit
    (covers=1 on 1 rung) sizes VACUOUS_COVER. HANDOFF BRIEF filed (6
    items + scope note); operator asks: file 1.15847, mark-up by
    barTime+price, wick ruling, flats read. No build packet issued.
    Next: operator mark-up; snapshot below.
11. VERDICT 2026-09-13: HANDOFF BRIEF v1 BLOCKED, do not send (C1 factual
    error on 16:40 today + C2–C7 evaluability gaps + structural purpose
    collision on steps 0/1/2). RECON15b stays frozen; no packet; no rerun.
    Corrected brief v2 filed (five-ref 16:40 table; both indices on all
    four levels; REF slots 168/817 = one persisting Sep-3 20:35 extreme;
    1.15847 resid 0 reshapes pair question to rung 16 vs rung 1; both
    times per row; carve scoped 0/3×rows + 09:15 second row; survival
    table + 1.07 margin flag; N1 site names fixed) + MARK-UP TABLE
    companion (113 rungs, all fields, 4 firing rows) + relay v2 quoting
    R1 (16/16/12/4, 13 miscounted) / R2 (same buffers, predicate+bar
    differ, relocation not owed) / R3 (walkSteps 0) / R5 (covers=1 on 1
    rung exhibit). Nothing else moves until mark-up lands; no counting
    definition packetised. UNCOMMITTED (no token).
12. VERDICT 2026-09-13: BRIEF v2 BLOCKED (ext-1 candidate: his stops read
    1/1/1/0-1 on rungExt — position-counting dead; both filed levels were
    CODE-derived → HAND/CODE provenance ruling; S5_CARVE_OB=0 retracted
    with exact cross-tabs; labels restated; brief corrections 1-8 +
    structural split ordered). Brief v3 + MARK-UP TABLE (113 rungs,
    rungSlot/rungExt/shift restored, 0-mismatch verified) + relay v3
    filed (A confirmed incl. imb-0; B tags with quotes; C cross-tabs
    71/92; D precision 53.8; E ext-1 10/10 + todayRef ext per row).
    P-SLDEF-5 CONDITIONAL (E35 slExt1, E36 carveFired, E37 provenance,
    E38 rider; gate-6 falsifier) — NOT built: needs A–E (landed, no
    contradiction) + his four confirmations (owed). Nothing moves until
    mark-up lands. UNCOMMITTED (no token).
13. VERDICT 2026-09-13: BRIEF v3 BLOCKED (ext-1 candidate CONFIRMED with
    absorption residual: his stops 1/1/1/0-1, three exact + one 1pt/16:05
    vs 16:15; count ruled over rungExt; both filed levels were CODE →
    HAND/CODE tags; S5_CARVE_OB=0 retracted with 71/92 cross-tabs; labels
    restated; corrections 1-8 + E39/E40/gate-6/gate-11 amendments ordered;
    P-SLDEF-5 stays conditional-unbuilt). Addendum filed (absorbed row
    named; cost both directions with F=1: Sep-4 10:35 SHORT RR_FAIL-only
    ext1 R 1.21; carve OB 3 + fractal 3; flip-pass NARROW; state/event
    conflation = 5th taxonomy entry) + relay v4 (F table; bias-opposed
    bar not on-log → E40). Table lesson: scratch transcription outvoted
    2:1 by raw+Tok (filed table verified 0-mismatch). File-visibility
    lesson recorded in §3 (name every deliverable). Nothing moves until
    mark-up + his four confirmations. UNCOMMITTED (no token).
14. VERDICT 2026-09-13: BRIEF v3 BLOCKED (ext-1 candidate CONFIRMED with
    absorption residual: his stops 1/1/1/0-1, three exact + one 1pt/16:05
    vs 16:15; count ruled over rungExt; both filed levels were CODE →
    HAND/CODE tags; S5_CARVE_OB=0 retracted with 71/92 cross-tabs; labels
    restated; corrections 1-8 + E39/E40/gate-6/gate-11 amendments ordered;
    P-SLDEF-5 stays conditional-unbuilt). Addendum filed (absorbed row
    named; cost both directions with F=1: Sep-4 10:35 SHORT RR_FAIL-only
    ext1 R 1.21; carve OB 3 + fractal 3; flip-pass NARROW; state/event
    conflation = 5th taxonomy entry) + relay v4 (F table; bias-opposed
    bar not on-log → E40). VERBATIM verdicts ×3 filed
    (BUILDER_VERDICTS_SLDEF4-5.md); P-SLDEF-5 packet filed
    conditional-unbuilt (01_TASKS\PACKET_P-SLDEF-5.md). Correctness
    assessed claim-by-claim off frozen run: VERDICT CORRECT (all operands
    verify; absorption + framing are council judgment). One relay owed
    (relay v4). NOTHING COMMITTED (no token). Compact-safe once filed.
15. VERDICT 2026-09-13: RELAY DUPLICATE (v3 received twice; ruling stands
    unchanged). Cause confirmed: stale operator-side re-paste AFTER v4
    already filed — the verdict WAS received and fully worked (no lost
    verdict). Standing relay discipline adopted (version + ruling-ID ack
    on every relay; §13). Ledger restated: A–E accepted, candidate 3+1
    absorbed, retractions (instruments, carve), INFERRED kept, F owed →
    LANDED (=1: 10:35 SHORT) in relay v4, bias date → E40. Relay v5 sent
    (ack + v4 verbatim; paste FRESH from disk). Checkpoint declared
    best-compact (§13). UNCOMMITTED (no token).
16. OPERATOR REFUSAL 2026-09-13: hand mark-up REFUSED (resume-memo point
    2) — rung-table verification by hand is beyond human capability; his
    five traded examples (filed in
    06_HANDOFFS\BUILDER_FINDING_SEP7_CHARTREAD.md) stand as his evidence.
    Measured: the quoted "v3 first paragraph" exists nowhere in the current
    59-line relay file (opens v5 line 1, v4 title line 11; v3 paragraph
    superseded at v4 filing) — stale copy; FRESH-from-disk rule re-stated.
    Rescoped path filed as relay v6: council asked to VACATE the mark-up
    gate (hand motivates, never adjudicates — standing rule) and let
    P-SLDEF-5 BUILD as specified with ADOPTION (not build) gated on
    council ruling; his judgments reduce to yes/no only if council still
    wants them. Only operator job left: paste v6. UNCOMMITTED (no token).
17. VERDICT 2026-09-13: RESCOPE APPROVED (mark-up VACATED on three grounds:
    governance violation, fallback unneeded — rungExt==1 reproduces levels,
    hand would redo code's 0/113-verified work). Granularity ANSWERED:
    extremity filter IS the coarsening (Aug-28 ext1 skips 09:45/09:35/09:25
    → 06:30 = ruling (a)). Confirmations 4→1: Sep-4 1.15847 + Sep-7 PM
    1.16239 already HAND-confirmed, Sep-7 AM 1.16098 corroborated→HAND;
    only Aug-28 1.16508 INFERRED stays owed (yes/no, adoption-gating).
    Ruling 3: fifth example must be identified (Sep-4 10:35 SHORT → recovery,
    fifth confirmation). F=1 thin (R 1.21, +0.21, reward sub-pip → E40
    rewardPts). Stale-extreme: 1.16379 pins two rows (10:35 R0.36, 9/08
    R0.60). Gate-2 correction: shadow → verbatim four-signal, slToday move
    halts. P-SLDEF-5 CLEARED print-only (E37 3-value provenance +
    PROVISIONAL_MATCH; E39 rewardPts/riskPts; E40 NONE-row OB slot/barTime/
    age; gate 6 four tokens; gate 11 1/0 named). Adoption gated: Aug-28
    yes/no + fifth-example map + 20 pair + N1 wick. Exit side unblocked
    after imbalance decision. Stale-paste closed + standing rule (never ask
    confirmation of prose — measured value + digest only). P-SLDEF-5
    EXECUTING (EA pre-hash 1EE6FC62 verified post-compact). UNCOMMITTED
    (no token).
18. P-SLDEF-5 build 1 EXECUTED 2026-09-13 (EA 5B4F7E06… 399165 B, both
    compile 0/0). RECON16 DONE=PASSED 14:24:05 (Test passed 0:54:19; wrapper
    archived itself 17955 lines journal A32F0E85…; purity 1/4/481) —
    SUPERSEDED, defect owned: cover target missed ext1 + ladObligN/
    VACUOUS_COVER unbuilt + noneAgeBars sign inverted (all gate-9 letter;
    all other gates gradeable: gate-6 three+provisional with operands,
    gate-7 4/10 reproduced, ninth join 481×3+10/10 zero-mismatch, gate-11
    1/0, gate-10 25 classes trunc 0). Build 2 (EA 893B26DF… 399946 B,
    0/0) adds ext1-in-cover + ladObligN + VACUOUS_COVER + age-sign fix.
    RECON16b RUNNING (launched 14:28:47, PID 15956, PRE=80329; first
    launch REFUSED_TERMINAL_BUSY, leftover 14992 closed graceful).
    UNCOMMITTED (no token).
19. OPERATOR ANSWERS 2026-09-13 (mid-16b-run): Q1 YES — Aug-28 stop
    1.16508 CONFIRMED + bar 06:30 high (INFERRED→HAND; filedT now 06:30;
    code's ext-1 rung barTime is also 06:30 at resid 0, so barDiff is 0 by
    inspection — carried into the adoption packet, NO rebuild: 16b grades
    PROVISIONAL_MATCH as specified at build). Q2 REFRAMED by him: "5
    trades" may be miscounted — window + four code trades listed in memo;
    rejected Sep-4 10:35 SHORT offered as candidate fifth; his correction
    owed. UNCOMMITTED (no token).
20. OPERATOR EVIDENCE 2026-09-13 (mid-16b-run): FIFTH CONFIRMED as Sep-4
    10:35 SHORT (considered, NOT taken — journal defect: 0.92R on OANDA
    feed vs true 1.21; his SL = ext1 1.16299 — written "1.16224" read as
    typo with reason (below entry, impossible SHORT stop; "same as your
    SL" disambiguates); his "one swing away + imbalance" matches measured
    imbCode=2; digit confirmation owed). F converts cost→recovery (fifth
    independent confirmation). PLUS two Sep-8 SHORTs (London 10:10
    @1.16205 SL 1.16258 TP 1.16102; NYAM 17:00 @1.16220 SL 1.16274 TP
    Y-POC, LOSS) — both HAND, both UNMAPPED (no S5 rows at those bars).
    Count now 7 (4 code + 1 considered + 2 Sep-8). 16b unaffected;
    adoption packet carries all. UNCOMMITTED (no token).
21. OPERATOR CONFIRM 2026-09-13 (mid-16b-run): Sep-4 10:35 SL digit YES —
    1.16299 HAND (typo closed). Fifth-example record COMPLETE: 4 fired
    HAND + 1 considered HAND (feed-error rejection, F=recovery) + 2 Sep-8
    HAND unmapped. Adoption inputs from him COMPLETE (Aug-28 HAND 06:30,
    fifth mapped, SL digit). Still owed (council/operator): Sep-8
    instrumentation scope, +20 pair, N1 wick, flats read. UNCOMMITTED
    (no token).
22. RECON16b DONE=PASSED 15:25:32 (Test passed 0:56:30; EA 893B26DF…
    399946 B; archive 17954 lines 4740FA3B…; ninth join 481×3+10/10).
    P-SLDEF-5 EXECUTED: 10/11 PASS + gate-8 FINDING (OB predicate 4 vs
    C-3, all TODAY_EQ_NUANCE), zero halts; gate-9 letter closed
    (covers 1=9/0=1, 0 is VACUOUS 9/08; ladObligN; noneAge +). Result
    filed (`06_HANDOFFS\BUILDER_RESULT_RECON16b-SLDEF5.md`); relay v7
    stub FILLED, ready to paste whole. Council ruling owed: ACCEPT +
    adoption packet, Sep-8 scope. RECON15b stays frozen. UNCOMMITTED
    (no token).
5. SWING-DEFINITION CORRECTION (operator 2026-09-12, terminology +
   journal correction): journal "swings" = FRACTAL swings (triangle
   markers = FlowLogic SWING_HIGH/LOW buffers); code's SL used
   conservative OB+Swing (1SWING branch, buffer 27 + obValid). Operator
   confirms: his manual Sep-7 NYAM journal (R 1.25, SL 15:15 low) was a
   MIS-INPUT — the leg truly has no imbalance, so the code's conservative
   answer (SL 1.16112, R 0.36, signal dies) is CORRECT under that
   definition. Under fractal-only two-away, SL ~= 16:15 low (~1.16239,
   R~2.45, signal lives). Price agreed (1.16218); bar label 15:15 vs
   slot 14:55 is a non-blocking footnote. The decision is now binary and
   the operator's: conservative (code stands as-is) vs fractal-only
   (new definition packet needed; walk machinery is definition-agnostic,
   R table recomputed on a fresh run). NO canonical edit until a council
   definition packet issues. P-SWINGIMB-3 verdict UNPAUSED (measurements
   stand as correct-under-conservative) + definition ruling requested.
   N1 candidate: candle equal to VWAP/POI does not invalidate (code
   inequalities confirm; Sep-7 fired and won).
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

## 13. Best-compact checkpoint 2026-09-13 (operator-declared rule)

This checkpoint is the best compact point of the session. Declared so the
next session resumes with zero reconstruction. Quiescent: no run active,
no open gates, harness idle, both tester terminals closed gracefully,
frozen baseline RECON15b (EA 1EE6FC62) committed + tagged (Rev072, NO
push — origin operator-latency). Uncommitted working state (no token):
brief v2/v3/addendum evolution, mark-up table + fixes, relay v2→v5,
VERDICTS file (×4 verbatim), PACKET_P-SLDEF-5 conditional-unbuilt,
AGENTS items 11–15 + §3 file-visibility lesson, packet verdict appends —
all ON DISK and indexed in §11. Resume anchors: this §11 (items 13–15)
+ `06_HANDOFFS\BUILDER_RELAY_COUNCIL_RECON15b-SLDEF4.md` (v5 current)
+ `06_HANDOFFS\BUILDER_HANDOFF_BRIEF_SLDEF.md` (v3 + addendum).
Owed after resume (in order): ONE operator relay (paste the v5 file
FRESH from disk — a stale copy caused the 2026-09-13 duplicate
incident); operator mark-up + four confirmations; P-SLDEF-5 build only
on his confirmations (council go already conditionally cleared);
snapshot on explicit token only; debris deletion word.
Relay discipline (council standing note 2026-09-13): every relay opens
with version + the ruling ID it answers; every operator memo names the
relay file + version. Two identical relays with no acknowledgement
between = indistinguishable from a lost verdict — never resend a relay
without bumping its ack header.
