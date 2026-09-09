# NEW SESSION PROMPT - paste this whole file's contents into a fresh Cline session
Continue the SRJ Flow Nexus project in this workspace.

FIRST ACTION: read the MQL5\.clinerules file FULLY - it is the project's workflow, invariants,
file map, and standing state. Its section 7.1 (CURRENT STATE - CONSOLIDATED) governs.

THEN READ, IN ORDER:
1. SRJ_FlowNexus_Local\00_CURRENT_WORKING\GOAL_STATEMENT.md (the goal + AGREEMENT SAMPLES 2/3)
2. SRJ_FlowNexus_Local\00_CURRENT_WORKING\CHARTER.md (the strategy + operator rulings)
3. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-K.md (the LATEST - T161K: P-NEXTOPEN,
   the next-candle-open evaluation at the retest + entry sites, run-verified)
4. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-J.md (T161J: the CQD strict-swing unify)
5. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-I.md (T161I: P-DIVCON-B, the strict latch)
6. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_EXIT-0817.md (the 08.17 trade correction,
   the break-POI-bias search answer, the 16:20 erratum)
7. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_ANCHORTIER-1.md (the POI-selection map +
   the BATCHED operator questions - THE OPEN RULING)
8. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_0814-MISS.md (the 08.14 miss audit)
9. SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_MIDLINE-1.md (midline (a) answered,
   (b) blocked on OHLC)

BASELINES (re-hash at session start per .clinerules section 8; digests are the instrument):
- EA:   Experts\SRJ_FlowNexus_EA.mq5 =
        E5B0E2E4830BEFD24F18EC712A7806C17305F8BDDF30EEC8AF291412F5AFEECA
        (207,854 bytes, 4,204 CRLFs; T161K-verified 2026-09-09)
- CQD:  Indicators\SRJ_CQD_TickBased_MT5.mq5 =
        92F3A62BE11E7343D2E9E05AD5B6FE7FCF565B69737E53A48628E6990792969F
        (51,701 bytes; T161J-verified; untouched by T161K)
- FlowLogic + the fourteen Include\SRJ\*.mqh: untouched (Task-160 reference digests).
- T161K = TWO signals in the Tier-1 window: 08.17 16:35:02 LONG R=1.42 Weekly-VWAP NYAM
  SL 1.15870 TP 1.16141 (same bar/SL/TP as T161J; R 1.46->1.42 because the entry is now the
  next open) + 08.20 09:35:04 LONG R=1.60 Daily-VWAP LONDON SL 1.16733 TP 1.16837 (NEW -
  E1's direct product). RESOLVED 2026-09-09 by operator correction: row #233 EXISTS
  (8/20/26 LDN TF Bull, D VWAP, CVD=3, S LQ, 1.61 TAKEN) - the "no 08.20 LDN row" claim
  was a builder mis-read; 08.20 = AGREEMENT SAMPLE 4 (GOAL_STATEMENT.md amendment).

THE GOVERNING RULINGS (verbatim in .clinerules 7.1 / the named handoffs):
- THE EA FOLLOWS THE INDICATOR: the divergence-validity criteria are the indicator's own
  verdict stream; the EA consumes, never overrides. Confirmed lines ONLY.
- STRICT LATEST-AT-CONFIRMATION: the latch re-evaluates every bar; an opposing latest CLEARS
  it; the setup keeps waiting (no abort) until a new direction-matched divergence re-latches.
- THE CQD SWING IS UNIFIED AND STRICT (one predicate, strict both sides, 3-bar window; the
  2-of-4 requires at least one swing flag from EACH anchor). Do not re-propose it.
- NEXT-CANDLE-OPEN EVALUATION (operator directive 2026-09-09, Proceed): the EA considers the
  NEXT candle's open, not the current candle's close - for ENTRY and for the POI RETEST.
  Implemented in T161K (E1 the retest predicate, E2 the S5 entry reference). The EXIT site
  arrives with the unbuilt section 5 exit model (charter STEP 4). Declared boundary: the S4
  confirm-VALIDITY test, the S2POLL advisory, the historical walks, the POI snapshot timing.

THE TESTER HARNESS (operator-directed 2026-09-09 - USE THIS; never long sleep loops again):
- SRJ_FlowNexus_Local\00_CURRENT_WORKING\run_tester.ps1 launches the headless run DETACHED,
  waits on the real process handle, archives the journal segment to 06_HANDOFFS, and writes
  00_CURRENT_WORKING\<RunName>_STATUS.txt when the run ENDS (exit state, archived line count,
  and the gate lines verbatim). The STATUS file is THE completion instrument.
- Protocol: (1) closing a live terminal64 needs the operator's explicit authorization (the
  wrapper NEVER kills a terminal - with one running it exits at once, TERMINAL_BUSY=true);
  (2) delete any stale <RunName>_STATUS.txt; (3) launch detached:
  Start-Process powershell -WindowStyle Hidden -ArgumentList '-NoProfile','-ExecutionPolicy',
  'Bypass','-File','<path to run_tester.ps1>','-RunName','T161X','-IniPath','<abs ini path>';
  (4) poll ONLY with cheap sub-second commands (Test-Path the STATUS file; sleeps <=240 s
  per tool call; STOP the moment it exists); (5) read STATUS for the gates, then run the
  <RunName> tabulation script (copy tabulate_161k.ps1 with the new names).
- Rationale: the builder could not previously tell when a run finished (the operator had to
  nudge, and continuous polling kept the machine busy). If a run crosses midnight the journal
  file name changes - STATUS records what was archived; handle the split explicitly.

THE NEXT WORK, IN ORDER (statuses 2026-09-09 ~08:00):
1. THE ANCHOR-TIER/POI-SELECTION MAP (builder, mechanical): map exactly how the EA seeds
   candidates from POI retests - DetectPoiRetest, the 12 POI buffers, g_authorityRank tiering,
   the same-bar tie rule - and lay the mechanism out for the operator's ruling. THE OPERATOR
   RESERVED THIS RULE (open item a): the 08.18 EA candidate anchored Daily-POC while the
   operator's setup referenced W POC. DELIVERED: BUILDER_FINDING_ANCHORTIER-1.md. RECORD
   CORRECTION (measured, T161K journal): the EA was NOT idle at 18:20 - a Weekly-POC LONG
   seeded 17:35:02 sat at S2 LTF-unaligned through 18:35 and SUPPRESSED the operator's
   W-POC SHORT retests (bars 18:20/18:25, opp=1 higher=0); the operator rejected that
   short themselves (invalid CQD). Section 9 holds the batched ruling questions - ASK;
   do not invent the rule.
2. THE 08.14 MISS AUDIT (builder, mechanical): the operator TOOK a 0.18R LDN TF trade (journal
   #217, W VWAP, CVD=x) and the EA signaled nothing. Re-trace on T161K_JOURNAL.log (the seed
   predicate changed in T161K): T161J's journal showed the EA seeding 08.14 09:15 LONG
   Weekly-VWAP (S1->S2) - find where that sequence died and why. DELIVERED:
   BUILDER_FINDING_0814-MISS.md - the sequence ARMED S4 at 09:15:00 (the operator's entry
   bar) and died 09:25:02: the 2-of-3 poll hit adverse=2 (obDead - XOB 1811->1795,
   fvgDead) -> ABORT FRESH_OB_DEAD; independently the divergence latch was CLEAR (-1
   opposing confirmed at 09:00). The operator TAKEN it with CVD=❌ 0.18R - two operator
   questions pending (the finding's section 5).
3. THE MIDLINE-AUDIT MECHANICAL STEPS (builder, mechanical): (a) which export buffer, if any,
   carries the XOB invalidationLevel (the journals show obInval=-2147483648 on every promoted
   XOB with isValid=1); (b) whether a body close crossed XOB 2159's midline (1.158035) between
   05:05 (promotion) and 14:10 on 08.18 - needs M5 OHLC (tester instrument run or OHLC export).
   Context: SRJ_OrderblockMgr.mqh L37-39 computes invLevel = min/max(mid, obOpen) - NOT the
   operator's pure midline (charter section 9 XOB VALIDATION RULE). DELIVERED:
   BUILDER_FINDING_MIDLINE-1.md - (a) ANSWERED: NO export buffer carries invalidationLevel
   or the invalidation bar; obInval in the PROMOCENSUS = COrderblock.invalidationBar
   (SRJ_OrderblockMgr L909-917/L955-963; assigned only at invalidation L132/L514); INT_MIN
   with isValid=1 is a faithful NA; the EA has NO access to either figure. (b) BLOCKED ON
   DATA: no 08.18 M5 OHLC on disk - a throwaway dump-EA tester run OR operator-supplied
   OHLC; AUTHORIZATION PENDING (batched question Q4).
4. ON REQUEST ONLY: a T161K recertification run (a CERT-style pass); the git snapshot of the
   Task-161 work (needs an explicit token - the working tree is the only copy; treat as fragile).

THE OPERATOR'S PENDING INPUTS:
- THE ANCHORTIER-1 RULING: RESOLVED 2026-09-09 (in-session) - "Keep as mapped: the rank
  order AND the while-alive suppression both stand - close open item (a) as 'the EA matches
  my rule' (the 08.18 18:20 short stays suppressed)." Q1/Q2/Q3 CONFIRMED AS THE OPERATOR'S
  RULE (ANCHORTIER-1 section 10). STILL OPEN from the memo: Q4 the OHLC-dump authorization
  (MIDLINE-1 (b)) and Q5 the 08.14 items (the 2-of-3 kill; CVD=❌ taken).
- RESOLVED 2026-09-09: the 08.20 LDN long = TAKEN by the operator (row #233, 1.61) -
  agreement sample 4; the EA's T161K signal matches on session/direction/POI/CVD-code/R.
- RESOLVED 2026-09-09: the 08.17 comparison - the operator addressed it; charts received
  with the declared caveat that the TradingView CQD chart is unreliable (TV aggregates/
  approximates CVD/CQD; no dukascopy broker data; CFD contract differences between
  brokers). The MT5 dukascopy chart is the authoritative visual.

THE ROLES: the operator (present) holds intent and is the final authority - the council relay
is DEFERRED, the operator rules directly as council of record in-session. YOU are the builder
and the operator's primary interface: no invented strategy, no executive directions, no
canonical-file edits without a packet the operator issues in-session.
FOLLOW .clinerules SECTION 5 - digests are the instrument (never mtimes or .ex5 sizes), literal
absolute paths only, nothing under 02_TASK_CHECKPOINTS, no git add/commit/push without an
explicit token, raw-output-verbatim reporting, and on any gate failure: report BLOCKED, name
the gate, write nothing further, revert nothing.
