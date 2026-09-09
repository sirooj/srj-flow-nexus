# NEW SESSION PROMPT - paste this whole file's contents into a fresh Cline session
Continue the SRJ Flow Nexus project in this workspace.

FIRST ACTION: read the MQL5\.clinerules file FULLY - it is the project's workflow,
invariants, file map, and standing state. Its section 7.1 final session-stage blocks are
the newest truth; its section 8 is the first-action protocol.

THEN READ, IN ORDER:
1. SRJ_FlowNexus_Local\00_CURRENT_WORKING\GOAL_STATEMENT.md (the goal + AGREEMENT SAMPLES
   2/3/4 + Amendments 1-2)
2. SRJ_FlowNexus_Local\00_CURRENT_WORKING\CHARTER.md (the strategy + §9 rulings + §9.1)
3. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-R.md (the LATEST certified state:
   P-CQDRESTORE executed and run-verified)
4. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-P.md (the T161P identity base:
   P-EXITMODEL + P-SCOPE34)
5. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_HTFAUDIT-1.md (the §5.6 HTF mechanism
   measured end-to-end + the operator's §5.6 ruling)
6. Context: 01_TASKS\PACKET_P-CQDRESTORE.md, 01_TASKS\PACKET_P-HTFLOG.md,
   06_HANDOFFS\BUILDER_DECISION_MEMO_XOB-VALIDITY.md (§10 governs),
   BUILDER_FINDING_XOBSUIT-1.md (§6 - CLOSED, never re-ask),
   BUILDER_FINDING_ANCHORTIER-1.md (§10 - CLOSED, never re-ask),
   BUILDER_FINDING_EXITMODEL-1.md (§6 - the exit rulings of record),
   BUILDER_DECISION_MEMO_HTFSTACK-1.md (§8 - the HTF-stack / 1R-gate /
   divergence-classification rulings; CLOSED, never re-ask)

BASELINES (re-hash at session start per .clinerules section 8; digests are the instrument):
- EA:   Experts\SRJ_FlowNexus_EA.mq5 =
        A0701893299B82370BC62AA19CA280E7064A1C46D6830D82EB7C3E65DC3FD57E
        (228,604 bytes, 4,610 CRLFs; T161R-verified) = the T161P state + the P-HTFLOG
        diagnostic (the EXITVERDICT print carries htfH/htfM/htfL/want/anti; MT_EXIT_SCOPE
        = MT_SCOPE_FAMILY_POC; MT_HTF_EXIT=true)
- CQD:  Indicators\SRJ_CQD_TickBased_MT5.mq5 =
        BE6FD84FB970B255F7809EF81CDDE829644DCC8B859166E8B2CEB9BF1D8A421F
        (50,555 bytes, 1,454 CRLFs; T161R-verified) = the pre-UNIFY source restored from
        git commit f6f7e53 + EXACTLY the strict IsCqdFractalHigh/Low pair (the classic
        strict-3 fractal; -2 bytes). THE 92F3A62B UNIFY STATE IS SUPERSEDED - the UNIFY
        change (P-CQD-FLAGGATE E1-E8) was ruled a REGRESSION by the operator (it blocked
        valid divergences) and REVERTED; never re-propose it.
- OB MGR: Include\SRJ\SRJ_OrderblockMgr.mqh =
        D286621CD8E2AB92B67FBA2BE0FD60BC861FF277C7516A2CFF6F79564E220B7B
        (48,050 bytes; T161N-verified; unchanged since) = the Task-160 original + exactly
        the pure-midline level hunk
- FlowLogic: Indicators\SRJ_FlowLogic.mq5 =
        1EA7858F9B1A8F4F42D90D58A0BB8873063D874E40E32A6A4E69DD8099F73B08 (unchanged)
- The fourteen Include\SRJ\*.mqh: untouched (Task-160 reference digests)

GIT: HEAD 9861414 (main). Committed: 52a41d9 = the T161I/J/K-era canonical sources (EA
E5B0E2E4 + CQD 92F3A62B + tag Task161-T161K); d1a5eae = the T161I/J/K records; 9861414 =
the stage-3 records. UNCOMMITTED (treat as fragile - the working tree is their ONLY copy):
the T161M/N/O/P/R canonical changes (EA at A0701893; OrderblockMgr at D286621C; CQD at
BE6FD84F) + all T161M-R-era records + harness v2.3. NO PUSH; no add/commit without an
explicit operator token.

T161R STATE (the current run-verified behavior, 2026-09-09, Tier-1 window 08.14-08.22):
- "Test passed in 0:31:07.688", 321,404 ticks, 1,728 bars. ALL GATES PASS.
- THE CQD VERDICT STREAM RESTORED to the exact pre-change identity: 493 verdicts
  (+1=68 +2=195 -1=146 -2=84); the 08.18 -2 verdicts at bars 14:20/14:40 PRESENT again.
- SIGNALS (2, verbatim): 08.17 16:35:02 LONG Weekly-VWAP R=1.42 SL 1.15870 TP 1.16141;
  08.20 09:35:04 LONG Daily-VWAP R=1.60 SL 1.16733 TP 1.16837 (= AGREEMENT SAMPLE 4).
- THE 08.18 14:50 SHORT DID NOT RETURN - MEASURED, NOT SUPPRESSED: the restored -2
  verdicts latched but the candidate died at the gate-check with TP_RR_FAIL (the 1R
  admission gate; T161P carried the IDENTICAL aborts - latch-independent). MECHANISM:
  P-NEXTOPEN's next-open entry reference recomputes R below 1.00 where T161I's
  confirming-close reference gave 1.06. STRATEGY-RULE ITEM (operator-reserved).
- THE EXIT PHASE + HTFLOG: MTSNAP pair (1.15982/1.16773); both trades exited via
  HTF_FLIP (08.17 16:45 exit 1.15921; 08.20 14:05 exit 1.16955); EXITCENSUS_ROWS=684;
  all 57 EXITVERDICT rows carry htfH/htfM/htfL/want/anti. THE LEG ANSWERS: 08.17 - H4
  against on EVERY managed bar (frozen since its 16:00 open-instant replay), the M15
  leg flipped AT 16:45 (anti 1->2); 08.20 - M15 against from 13:40, the H1 leg flipped
  AT 14:00 (anti 1->2). The HTFAUDIT-1 open-instant-replay mechanism CONFIRMED per-leg.
- Identity censuses (all = T161P verbatim): WS161 changes=90 mismatch=0 loads=stores=
  1728 (LOAD NOSTORE present); BIASCENSUS sh1 701/1027 sh2 702/1026; ZONECENSUS exact;
  XOB-PROMOCENSUS 369; OBPROV 769/887; FRESHCOUNT 19 (pre 4 ABORT + 10 HOLD; post 0 + 5,
  post_ABORT=0); FRESHSKIP=110 SUPPRESSED=40 ABORT=23; REGIMECENSUS=62; the XOB 2159
  lifecycle verbatim.

THE HTF-STACK DISCOVERY (HTFSTACK-1 - THE FIRST WORK ITEM OF THE NEW SESSION):
The operator, in visual mode, photographed the FlowLogic panel showing legs
"1H: Bear / 15m: Bull / 5m: Bull". MEASURED (source-verified): (a) the FlowLogic code
defaults are H4/H1/M15 (FL L146-148); (b) the EA binds FlowLogic positionally and
EXPLICITLY passes H4/H1/M15 (EA L4280-4282); (c) inEnableAutoTimeframeLimit=true +
inAutoTFMode=BALANCED (FL L238-239) is a LOOKBACK LIMITER ONLY (FL L494) - it does NOT
touch the HTF TFs; (d) the panel labels are DYNAMIC (Panels L326-328) - a panel labeled
1H/15m/5m is an instance genuinely running those TFs; (e) the photographed panel + CQD
subwindow on the visual chart are the OPERATOR'S OWN manually added/template instances
(the EA's iCustom instances never appear in a chart's indicator list) - THE OPERATOR'S
MANUAL FLOWLOGIC STACK = 1H/15m/5m. THE STRATEGY-RULE DECISION (operator-reserved, the
next session's first item): which HTF stack is the operator's discretionary standard -
the spec's 4H/1H/15m (as-built) or 1H/15m/5m (what their panel reads)? If a stack change
is ruled: P-HTFSTACK = change the EA's three binding args (EA L4281-4282); NOT
identity-safe (the regime admissions + the §5.6 exit re-measure; full gates vs T161R).
THE GOVERNING RULINGS (verbatim in the records - do not re-propose, never re-ask):
- THE EA FOLLOWS THE INDICATOR (divergence-validity = the indicator's verdict stream).
- STRICT LATEST-AT-CONFIRMATION with clearing; waiting-without-abort.
- THE CQD RESTORATION (2026-09-09): the UNIFY change ruled a REGRESSION; the CQD = the
  pre-change source + ONLY the strict fractal marking; the 2-of-4 gate and the flag
  predicates are back BYTE-EXACT to the pre-change behavior.
- NEXT-CANDLE-OPEN at the retest + entry + exit sites (T161K / P-EXITMODEL).
- ANCHOR-TIER/POI-SELECTION: KEEP AS MAPPED (closed 2026-09-09).
- POC/VWAP EARLY-EXIT RULE (charter 9.1): the body-close exit binds through the ruled
  hierarchy (EXIT_SCOPE=FAMILY_POC default; a one-constant flip).
- THE XOB MIDLINE RULE: bullish OB dies on a body close BELOW the pure midline; bearish
  ABOVE; the activation gate is structurally required (T161M Direction-A REVERSED).
- THE BIAS ENGINE IS PERFECT AS CURRENTLY IS - never modify without an explicit directive.
- THE XOB-SUITABILITY STANDARD (closed 2026-09-09): touch never consumes; in-play = the
  SL swing-leg walk from the XOB projection.
- THE EXIT RULINGS (EXITMODEL-1 §6): Q1 hierarchy-scoped body-close exits; Q2 exact
  mirror; Q3 a line's own gap/move never exits; Q4 2-of-3 + §5.4 PRE-CONFIRMATION ONLY;
  Q5 SL = trade-through; Q6 the TP re-computed per bar.
- THE §5.6 HTF EXPERIMENT: parked as an open backtest item (the operator verbatim);
  MT_HTF_EXIT=true stands.
- THE HTF STACK (HTFSTACK-1 §8, 2026-09-09): KEEP 4H/1H/15m AS-BUILT - the spec of
  record's stack (§3.2/§5.6); the EA binding L4281-4282 IS the ruled stack; the
  photographed 1H/15m/5m panel was the manual instance's remembered inputs, NOT the
  standard; P-HTFSTACK never drafted.
- THE 1R ADMISSION GATE (HTFSTACK-1 §8, 2026-09-09): STANDS AS IMPLEMENTED - the R
  computation's entry leg = the NEXT candle's open (the P-NEXTOPEN directive applied
  consistently); the 08.18 TP_RR_FAIL death is ruled behavior and its no-signal agrees
  with the operator's manual rejection.
- THE DIVERGENCE-VALIDITY CLASSIFICATION (HTFSTACK-1 §8, 2026-09-09): CLOSED - the EA
  consumes the indicator's verdict stream; nothing more to encode.
- THE WORKFLOW (2026-09-09, operator verbatim): "keep working on until you need my input
  regarding the descrationary trading strategy rules or relay to the flagship model!" -
  NO stop-at-input-boundary pauses; input ONLY for (a) strategy-rule decisions and
  (b) flagship-model relays; the run-completion signal stays the operator's.

THE TESTER HARNESS v2.3 + THE POLLING RULE:
- run_tester_v2.ps1: STATUS at launch, 10s heartbeats, journal-based completion, a
  <RunName>_DONE.txt at every terminal state; the wrapper NEVER kills a terminal.
- THE BUILDER DOES NOT POLL: stage everything, launch detached, then STOP. The OPERATOR
  signals run completion; the builder then completes the archive/gates step MANUALLY if
  the wrapper died (read PRE_JOURNAL_LINES from STATUS -> segment archive -> tabulate).
- The compiler: C:\Program Files\Dukascopy MetaTrader 5\metaeditor64.exe (via origin.txt).

THE PENDING WORK, IN ORDER (after the HTFSTACK-1 rulings 2026-09-09: the former items
1-3 - the HTF stack, the 1R gate's reference, the divergence-validity classification -
are RULED/CLOSED with ZERO source changes; never re-ask them):
1. THE §5.6 BACKTEST ITEM (parked by the operator; MT_HTF_EXIT=true stands).
2. THE OLDER OPEN ITEMS: 155-RT-A reissue; 161-REG acceptance (the fifteen-file re-hash
   pre-measured 15/15 MATCH); a recertification on request.
3. ON REQUEST ONLY: a git snapshot (the T161M-R canonical changes + records are
   UNCOMMITTED - fragile) and git push - each a separate explicit operator token.
4. ANY NEW OPERATOR DIRECTIVE (the builder executes packets continuously; input only
   for strategy rules and flagship-model relays).

THE ROLES: the operator (final authority) rules directly as council of record in-session;
the council relay is DEFERRED (flagship-model relays only when the operator orders). YOU
are the builder and the operator's primary interface: no invented strategy, no executive
directions, no canonical-file edits without a packet the operator issues in-session. READ
THE SPECIFICATION (Part A v4.2) BEFORE FRAMING OPERATOR QUESTIONS. FOLLOW .clinerules
SECTION 5 - digests are the instrument, literal absolute paths only, nothing under
02_TASK_CHECKPOINTS, no git add/commit/push without an explicit token, raw-output-
verbatim reporting, and on any gate failure: report BLOCKED, name the gate and its
measured value, write nothing further, revert nothing.


