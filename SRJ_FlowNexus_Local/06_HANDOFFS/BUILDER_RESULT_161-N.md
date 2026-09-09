# BUILDER RESULT — 161-N (P-XOBMID AMENDMENT 2: the direction correction; T161M's zero-signal regression REVERSED)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-N.md
Session: 2026-09-09. Authorization: the operator's direction clarification, verbatim:
"please clarify your understanding of OB. bullish OB is a bearish closing candlestick so
it dies if body close below the mid level, and vice versa." + "the zero signal outcome is
a major regression." + "the bias counter or engine is perfect as currently is"; issuance:
"P-XOBMID AMENDMENT 2 issued — execute now (A-Stages 1-7)". Basis: packet
01_TASKS\PACKET_P-XOBMID.md AMENDMENT 2; BUILDER_DECISION_MEMO_XOB-VALIDITY.md §10.
Canonical file modified: exactly ONE — Include\SRJ\SRJ_OrderblockMgr.mqh (compiled into
Indicators\SRJ_FlowLogic.mq5). EA, CQD, FlowLogic.mq5, the other thirteen includes
UNTOUCHED (post-run re-hashes below). Nothing under 02_TASK_CHECKPOINTS. No git token.

## WHAT THE AMENDMENT DID
Reverted E2/E3/E4/E5 of the original edit set (the Direction-A kill-direction flip and
the same-bar guard relaxations) back to the Task-160 originals; KEPT E1 (the invalidation
level = the pure midline); truthed the E1 comment. Net: the file = the Task-160 original
EXCEPT the level hunk. THE CLARIFIED RULE: bullish OB (bearish origin candle) dies on a
body close BELOW the pure mid; bearish OB (bullish origin candle) dies on a body close
ABOVE it — the code's original directions; the activation gate stays (before its
traversal price sits on the origin-candle side of the mid, so an activation-independent
test would kill every OB at creation — the memo §10 records the supersession).

## STAGES (all measured)
1. A-Stage 1 pre-hash PASS: 16AA5A0AC7DF00AB99C9EAFD66F0CB398CB537977AC6544639007A3537
   FF31BE (47,934 B, CRLF=1139) = the post-E1-E5 state.
2. R0-R4 applied (first attempt each; diffs in the tool record).
3. A-Stage 3 post-hash (measured after the write):
   D286621CD8E2AB92B67FBA2BE0FD60BC861FF277C7516A2CFF6F79564E220B7B, 48,050 B,
   CRLF=1139 LONELF=0 — the Task-160 original plus exactly the level hunk.
4. Compile T161N (target SRJ_FlowLogic.mq5): "Result: 0 errors, 0 warnings, 4336 ms
   elapsed, cpu='X64 Regular'" (T161N_FLOWCOMPILE.log, gitignored per R-220).
5. Run T161N: harness v2.3 (its FIRST validated use), T161N_P1.ini (the T161K/T161M
   shape). Launched 09:46:46; "Test passed in 0:29:51.573", 321,404 ticks, 1,728 bars;
   final balance 10,000 JPY; RESULT=PASSED, DONE=10:17:20; archive T161N_JOURNAL.log
   (6,253-line segment). HARNESS VALIDATION: the dedicated DONE marker worked and the
   STATUS GATE block was segment-clean (only T161N's own lines — no day-log pollution).
   DECLARED (R-180 class): several sub-second shell POLL probes were aborted by the IDE
   shell ("Command execution aborted") even under the v2.3 poll law; completion was then
   confirmed by READING the DONE marker with the IDE file-read tool (shell-independent) —
   recorded as the poll fallback. Leftover terminal PID 21644 (this run's own instance)
   closed gracefully (verified gone by probe; the first close's result line had failed to
   print — R-180, probed, not assumed).

## GATES — ALL PASS
G1 compile 0/0.
G2 WS161: WS161_LOAD NOSTORE present (loads=1); census "fields=15 loads=1728 stores=1728
   changes=79 mismatch=0" (changes=79 = the T161K value exactly); zero FIELD rows, zero
   mismatch rows.
G3 CQD verdict stream IDENTICAL: 254 reads; +1=43 +2=84 -1=88 -2=39.
G4-INVERTED (the T161K XOB-2159 lifecycle MUST REPRODUCE — it did, verbatim):
   the 05:05 census line "SRJ XOB-PROMOCENSUS t=2026.08.18 05:05 bar=121383 mode=all
   bias=bearish objId=2159 isValid=1 isActivated=1 obStart=121380 obStartT=2026.08.18
   04:50 obVal=121381 obInval=-2147483648 boundary=-2147483648 promoBar=121383
   promoT=2026.08.18 05:05" is verbatim-identical to T161K's; the ONE kill of id=2159 is
   "2026.08.18 16:40:00 [SRJ][T155][OBPROV] code=4 id=2159 bar=121521 flag=true" —
   present in T161K verbatim identically (2159 survived through 14:10 in BOTH runs —
   correct under the clarified reclaim doctrine; the operator's "NO VALID XOB" verdict at
   14:10 is therefore NOT the midline rule and returns to operator-reserved status as a
   separate suitability standard); the 08.18 14:xx S3INPLAY lines are verbatim-identical
   to T161K's (14:05 and 14:40, inPlay=0 via=none, zone 1.15794-1.15813).
G5 SIGNALS: THE T161K PAIR IS BACK, VERBATIM — "2026.08.17 16:35:02 ALERT SRJ SIGNAL
   LONG EURUSD M5 | Weekly-VWAP | NYAM | R=1.42 SL 1.15870 TP 1.16141 spr=4" and
   "2026.08.20 09:35:04 ALERT SRJ SIGNAL LONG EURUSD M5 | Daily-VWAP | LONDON | R=1.60
   SL 1.16733 TP 1.16837 spr=3" (SIGNAL_COUNT=2). THE ZERO-SIGNAL REGRESSION IS REVERSED.
G6 BIASCENSUS shards returned to the identity with a +2 neg residual per shard: T161N
   "sh1 neg=701 pos=1027 fail=0 | sh2 neg=702 pos=1026 fail=0" vs the T161H/I/J/K
   699/1029 + 700/1028. ZONECENSUS_FINAL back at the EXACT identity (bars=1728 both=0
   xobOnly=1616 fvgOnly=0 neither=112 | inWindow=576 xobInWin=548). The residual = the
   pure-midline level's selective consequence (the old deeper level had spared two
   OBs per shard-window that the pure mid now kills) — the engine itself untouched,
   per the operator's "the bias counter or engine is perfect as currently is".
G7 hygiene: re-hashes byte-identical — OrderblockMgr D286621C...20B7B (the A-Stage 3
   value, unchanged by the run); EA E5B0E2E4...AFEECA; CQD 92F3A62B...2969F; FlowLogic.mq5
   1EA7858F...73B08. Leftover terminal closed and verified gone. NOTHING under
   02_TASK_CHECKPOINTS.

## TABULATED OBSERVABLES (the level fix's selective effect — the ONLY designed delta)
- OBPROV invalidation-event totals vs T161K: code=3 760 -> 769 (+9), code=4 894 -> 887
  (-7) — the pure midline kills OBs the old deeper level had spared (and the code
  attribution shifts accordingly); the aggregate signature matches the +2 neg bias
  residual and the XOB-PROMOCENSUS 372 -> 369 (-3 promotions whose OBs died earlier).
- FRESHCOUNT 1 (T161M era) -> back; S5_WAIT back; FRESHSKIP/SUPPRESSED/ABORT in
  T161N_TABULATION.txt; WS161 changes 79 (T161K's value).
- EVERYTHING ELSE IS THE T161K IDENTITY: signals, zone census, XOB 2159's full lifecycle,
  the CQD stream, the WS161 arithmetic.

## ARTIFACTS
06_HANDOFFS: BUILDER_RESULT_161-N.md (this file), T161N_TABULATION.txt, T161N_JOURNAL.log
(gitignored), T161N_FLOWCOMPILE.log (gitignored). 00_CURRENT_WORKING: T161N_P1.ini,
tabulate_161n.ps1, T161N_STATUS.txt + T161N_DONE.txt (the v2.3 validation artifacts).
01_TASKS: PACKET_P-XOBMID.md (ISSUED — EXECUTED; AMENDMENT 2 executed).
06_HANDOFFS: BUILDER_DECISION_MEMO_XOB-VALIDITY.md (§10 = the clarification of record).

## VERDICT (mechanical)
P-XOBMID AMENDMENT 2 EXECUTED AND VERIFIED — ALL GATES PASS. NEW BASELINE:
Include\SRJ\SRJ_OrderblockMgr.mqh =
D286621CD8E2AB92B67FBA2BE0FD60BC861FF277C7516A2CFF6F79564E220B7B (48,050 B, 1,139 CRLFs)
— the Task-160 original plus exactly the pure-midline level hunk; T161N-verified.
EA E5B0E2E4...AFEECA / CQD 92F3A62B...2969F / FlowLogic.mq5 1EA7858F...73B08 unchanged.
THE TIER-1 AGREEMENT PICTURE IS RESTORED: signals 08.17 16:35:02 LONG R=1.42 +
08.20 09:35:04 LONG R=1.60 (Agreement Sample 4) reproduce the T161K state, with the
single designed delta = the pure-midline level's selective kills (OBPROV +9/-7,
PROMOCENSUS -3, bias +2 neg per shard). HARNESS v2.3 VALIDATED (DONE marker +
segment-only gates); the poll fallback recorded (shell-independent DONE read). OPEN
ITEMS: the operator-reserved XOB-suitability standard (what made XOB 2159 unsuitable at
14:10 — NOT the midline rule); the memo §6 secondary questions (EXIT-POCVWAP a/b/c, the
2-of-3 general standard); the STEP-4 exit model; a git snapshot on token; recertification
on request. NO git token used this session.