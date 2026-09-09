# NEW SESSION PROMPT - paste this whole file's contents into a fresh Cline session
Continue the SRJ Flow Nexus project in this workspace.

FIRST ACTION: read the MQL5\.clinerules file FULLY - it is the project's workflow, invariants,
file map, and standing state. Its section 7.1 (CURRENT STATE - CONSOLIDATED) governs; its
final session-stage blocks are the newest truth.

THEN READ, IN ORDER:
1. SRJ_FlowNexus_Local\00_CURRENT_WORKING\GOAL_STATEMENT.md (the goal + AGREEMENT SAMPLES
   2/3/4 + Amendments 1-2: NO validity disagreement remains in the Tier-1 window)
2. SRJ_FlowNexus_Local\00_CURRENT_WORKING\CHARTER.md (the strategy + §9 rulings + §9.1 the
   POC/VWAP early-exit rule)
3. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-K.md (the LATEST certified run: T161K)
4. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_ANCHORTIER-1.md (the POI-selection map;
   section 10 = the operator ruling that CLOSED open item (a))
5. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_MIDLINE-1.md ((a) answered; (b) ANSWERED:
   the activation-gated invalidation measurement)
6. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_0814-MISS.md (08.14 = the operator-
   documented INVALID setup -> agreement; section 6 = the operator's correction)
7. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_EXIT-POCVWAP.md (the POC/VWAP rule for STEP 4)
8. Context: BUILDER_RESULT_161-J.md, _I.md, BUILDER_FINDING_EXIT-0817.md

BASELINES (re-hash at session start per .clinerules section 8; digests are the instrument):
- EA:   Experts\SRJ_FlowNexus_EA.mq5 =
        E5B0E2E4830BEFD24F18EC712A7806C17305F8BDDF30EEC8AF291412F5AFEECA
        (207,854 bytes, 4,204 CRLFs; T161K-verified 2026-09-09)
- CQD:  Indicators\SRJ_CQD_TickBased_MT5.mq5 =
        92F3A62BE11E7343D2E9E05AD5B6FE7FCF565B69737E53A48628E6990792969F
        (51,701 bytes, 1,471 CRLFs; T161J-verified)
- FlowLogic + the fourteen Include\SRJ\*.mqh: untouched (Task-160 reference digests).
- GIT: the Task-161 work IS COMMITTED (no longer fragile-only): commit 52a41d9 = the two
  canonical sources (digests in the message) + annotated tag Task161-T161K; commit d1a5eae
  = the T161I/J/K records + harness; the following commit = this stage's records. NO PUSH
  (a separate explicit token if ever wanted).

T161K SIGNALS (the Tier-1 window): 08.17 16:35:02 LONG R=1.42 Weekly-VWAP NYAM SL 1.15870
TP 1.16141 + 08.20 09:35:04 LONG R=1.60 Daily-VWAP LONDON SL 1.16733 TP 1.16837.
TIER-1 VALIDITY PICTURE: FULL AGREEMENT - 08.14 (invalid setup, no EA signal), 08.17
(candidate agreement; entry/exit layers = the unbuilt section 5), 08.18 (no false positive;
the 18:20 suppression ruled correct), 08.19/21 (absence), 08.20 (AGREEMENT SAMPLE 4).

THE GOVERNING RULINGS (verbatim in the records - do not re-propose):
- THE EA FOLLOWS THE INDICATOR: the divergence-validity criteria are the indicator's own
  verdict stream; the EA consumes, never overrides. Confirmed lines ONLY.
- STRICT LATEST-AT-CONFIRMATION: the latch re-evaluates every bar; an opposing latest
  CLEARS it; the setup keeps waiting (no abort) until a matched divergence re-latches.
- THE CQD SWING IS UNIFIED AND STRICT (T161J).
- NEXT-CANDLE-OPEN EVALUATION at the retest + entry sites (T161K); the EXIT site arrives
  with the section-5 exit model (charter STEP 4).
- ANCHOR-TIER/POI-SELECTION: KEEP AS MAPPED (open item (a) CLOSED 2026-09-09): rank order
  FOMC > Yearly > Quarterly > Monthly > Weekly > Daily with AVP-POC over VWAP inside each
  family; the most-authoritative line wins a same-bar tie; the while-alive singleton holds
  with NO replacement and NO release for stuck candidates (the 08.18 18:20 suppression is
  correct behavior). "AVP" in the operator's journal = the *-POC lines (AVP-POC).
- POC/VWAP EARLY-EXIT RULE (charter 9.1): AVP/POC sits SLIGHTLY higher than VWAP (matters
  only for early exits); the section-5 body-close exit binds to the ENTRY-ANCHOR POI - a
  candle-close VWAP flip does NOT exit a POC-anchored trade; the POC's own break (including
  after a gap-jump relocation) DOES exit (the 8/17 shape).

THE TESTER HARNESS v2 (USE THIS; v1 is superseded — never long sleep loops, never wait on
process exit):
- SRJ_FlowNexus_Local\00_CURRENT_WORKING\run_tester_v2.ps1: STATUS WRITTEN AT LAUNCH
  (pre-flight facts + REFUSED_* gates), 10-second HEARTBEATS (terminal alive + journal
  growth + last line), JOURNAL-BASED COMPLETION (Test passed / test stopped /
  log-file-written / connection-closed — scanned in the NEW lines), LOCK-TOLERANT archive
  of the journal segment to 06_HANDOFFS, gates + RESULT (PASSED / TERMINAL_EXITED_EARLY /
  TIMEOUT_60MIN / UNDETERMINED) in STATUS at DONE. Validated end-to-end by T161L4
  (T161L4_STATUS.txt kept as the artifact; T161L/L2/L3 were the fix iterations).
- Protocol: (1) the wrapper NEVER kills a terminal; with one running it exits
  TERMINAL_BUSY=true — closing a live terminal64 needs the operator's explicit
  authorization; closing the builder's OWN leftover instance is documented stage hygiene;
  (2) launch detached: Start-Process powershell -WindowStyle Hidden -ArgumentList
  '-NoProfile','-ExecutionPolicy','Bypass','-File','<v2 path>','-RunName','T161X',
  '-IniPath','<abs ini path>'; (3) poll Test-Path <RunName>_STATUS.txt with cheap
  sub-second commands, sleeps <=60s per tool call, STOP at first hit; (4) read RESULT and
  the GATE lines from STATUS.

THE NEXT WORK, IN ORDER:
1. THE XOB-VALIDITY DECISION (operator choice -> packet; the biggest open semantic item):
   MIDLINE-1 measured that FlowLogic's OB invalidation is ACTIVATION-GATED
   (SRJ_OrderblockMgr.mqh L497-505) with a deeper-or-equal level (L39), so an OB that price
   never revisits NEVER dies — measured on XOB 2159: ALL 109 bars in [05:05,14:10) on 08.18
   closed below its midline 1.158035 (first = the promotion bar itself), never invalidated.
   THE OPERATOR MUST CHOOSE THE FIX SHAPE: (1) FlowLogic adopts the midline body-close rule
   (activation-independent); or (2) FlowLogic exports the missing state (activation flag /
   invalidationLevel / invalidationBar) and the EA applies the operator's rule.
   NO canonical edit without a packet.
2. THE EXIT MODEL (section 5, charter STEP 4): the next-open EXIT site (spec section 4) +
   three pending confirmations from EXIT-POCVWAP section 4 (generalize the anchor-line
   binding? the short side? the TP-vs-exit asymmetry).
3. THE OLDER OPEN ITEMS (standing state): 155-RT-A reissue; 161-REG acceptance; the
   structural-agreement tally continuation; a T161K recertification run on request.
4. ON REQUEST ONLY: git push (a separate token).

THE ROLES: the operator (final authority) rules directly as council of record in-session;
the council relay is DEFERRED. YOU are the builder and the operator's primary interface:
no invented strategy, no executive directions, no canonical-file edits without a packet
the operator issues in-session.
FOLLOW .clinerules SECTION 5 - digests are the instrument (never mtimes or .ex5 sizes),
literal absolute paths only, nothing under 02_TASK_CHECKPOINTS, no git add/commit/push
without an explicit token, raw-output-verbatim reporting, and on any gate failure: report
BLOCKED, name the gate, write nothing further, revert nothing.