# BUILDER RESULT — 161-J (P-CQD-FLAGGATE + the UNIFY ruling: strict swing everywhere)
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_161-J.md
Session: 2026-09-09 (~02:35-05:15). Authorization: the operator selected UNIFY and issued
"P-CQD-FLAGGATE issued" in one answer; packet AMENDMENT 1 recorded the combined edit set E1-E8.
Canonical file modified: exactly ONE — Indicators\SRJ_CQD_TickBased_MT5.mq5 (8 edit sites).
The EA is UNTOUCHED (baseline AB102C0A...3A24EAC stands, T161I-verified).
Artifacts: T161J_P1.ini + tabulate_161j.ps1 (00_CURRENT_WORKING); T161J_CQDCOMPILE.log +
T161J_JOURNAL.log + T161J_TABULATION.txt (06_HANDOFFS; logs gitignored per R-220).
Nothing under 02_TASK_CHECKPOINTS. No git add/commit/push.

## THE EDITS (all measured, per the packet amendment)
E1-E6: the three swing predicate pairs made STRICT on both sides — IsPriceSwingHigh/Low,
IsCqdSwingHigh/Low, IsCqdFractalHigh/Low (the triangles) — one unified definition: the swing
candle must be THE most extreme of its immediate neighbors (no ties; 3-bar window kept; the
CqdReady/SameEpoch guards unchanged). IsCqdSwingHigh is now body-identical to IsCqdFractalHigh.
E7/E8: the per-anchor minimum inserted at BOTH divergence gates (confirmed TryDivergence +
preview ScanUnconfirmedDivergence): at least one swing flag from EACH anchor, 2-of-4 kept.
Consumers verified pre-edit: the predicates are used ONLY at TryDivergence/ScanUnconfirmed/
MarkFractals. The EA reads buffer 6 only.

## STAGES
1. Pre-edit CQD re-hash: 4B2D688C6A29B1A8CA0E2F894526A63C82DAACE6846B5A339A473D03140D96C2
   (50,557 B) — matched the packet's expected value.
2. E1-E8 applied (editor tool; all eight diffs confirmed in the tool record).
3. Post-edit: SHA256 92F3A62BE11E7343D2E9E05AD5B6FE7FCF565B69737E53A48628E6990792969F,
   51,701 B (+1,144 = the comment markers + the two gate insertions), CRLF=1471 LONELF=0.
5. Run T161J: headless /config (T161J_P1.ini = the T161H/T161I harness shape, 2026.08.14-08.22,
   InpDebugLog=true as tester input). This session's own T161I leftover instance (PID 25816) was
   closed first (stage hygiene, documented); T161J instance PID 24516 launched 02:43:09.
   "Test passed in 0:27:40.455 (including ticks preprocessing 0:00:00.031)"; 321,404 ticks,
   1,728 bars; final balance 10,000 JPY (alert-only).
   DECLARED INCIDENT (R-180 class): the first journal-archive attempt failed —
   "The process cannot access the file ... because it is used by another process" (the live T161J
   instance held the log). The first tabulation (23 lines) was therefore INVALID and was
   regenerated after the leftover instance was closed (same hygiene rationale). The archive is
   the T161J segment (journal lines 6505-end, 6,406 lines).
6. Post-run re-hashes: CQD 92F3A62B... byte-identical; EA AB102C0A... byte-identical.

## GATES (all PASSED, measured)
1. WS161_CENSUS fields=15 loads=1728 stores=1728 changes=85 mismatch=0 (mismatch=0; loads==stores
   ==1728; changes 78 (T161I) -> 85 — latch transitions shifted with the thinned verdict stream).
2. WS161_LOAD_COUNT=1; WS161_MISMATCH_COUNT=0.
3. BIASCENSUS_FINAL bars=1728 fail=0; shards sh1 neg=699 pos=1029 / sh2 neg=700 pos=1028 —
   IDENTICAL to T161H and T161I.
4. XOB-PROMOCENSUS 372 = 372 = 372 (H/I/J); ZONECENSUS_FINAL line-identical across all three
   (bars=1728 both=0 xobOnly=1616 fvgOnly=0 neither=112 | inWindow=576 xobInWin=548 fvgInWin=0).
5. Candidate-gated EA censuses shifted, DECLARED mechanism: the thinned verdict stream lengthens
   candidate lifetimes (sequences wait longer), so per-candidate-bar prints move: XOBINPLAY capped
   47->51, XOBINPLAY2 47->51 (CLS2 BOTH 7->9, NEITHER 9->11, REACHED2_1 45->49), S3INPLAY 47->51
   (inPlay_1 32->34), XOBPROMO 47->51, S5_WAIT 10->14. FlowLogic-side per-bar/per-promotion
   censuses (the identity gates) did NOT move. No gate rests on the candidate-gated counts.

## THE VERDICT-STREAM DELTA (the core measurement — T161I control vs T161J)
- CQD DIV census reads: 493 -> 254 (-48.5%). Per verdict: +1 68->43, +2 195->84, -1 146->88,
  -2 84->39. The bearish-hidden over-firing population (the CQD-DA-1 shape) collapsed.
- 08.18: 80 -> 42 verdict lines. THE PHANTOM CODE-4s ARE GONE: no verdict at bar 14:20 and none
  at bar 14:40 (T161I had -2 on both — the exact left-both-flags shape the operator's defect
  ruling named). The real divergences survived: +1@14:30, -2@15:00, +2@15:35, -1@16:00.

## SIGNALS (T161I control -> T161J)
- 08.17 16:35:02 LONG R=1.46 Weekly-VWAP NYAM SL 1.15870 TP 1.16141 — IDENTICAL to T161I (the
  matched latest that re-latched under the strict rule survived the strict predicate).
- 08.18 14:50:01 SHORT R=1.06 — ELIMINATED. The candidate sat at S5 with divLatch=0 through
  14:15/14:20/14:25/14:45/14:50:01/14:55 (the journal's own lines): with the phantom -2s gone,
  the newest confirmed verdict in its window was +1@14:30 (opposing — the strict hold), and the
  next confirmed divergence (-2@15:00) only became confirmable at 15:10:01, after the window.
  T161J SIGNAL_COUNT=1 for the whole Tier-1 window.
- STRUCTURAL-AGREEMENT READING: AGREEMENT SAMPLE 2 (GOAL_STATEMENT.md) — the operator did NOT
  take the 08.18 NY short ("invalid CQD divergence") — is now MATCHED: the EA no longer signals
  it. The known false positive is closed by this change. Remaining disagreement layers: the
  08.14 0.18R miss and the anchor-tier/POI-selection rule (operator-reserved, open item a).

## VERDICT (mechanical)
P-CQD-FLAGGATE + UNIFY EXECUTED AND VERIFIED per the amended packet. New CQD baseline:
92F3A62BE11E7343D2E9E05AD5B6FE7FCF565B69737E53A48628E6990792969F (51,701 B, 1,471 CRLFs).
The triangles now mark only strict extremes (the operator's tie-defect report is fixed), the
divergence qualification requires both anchors to be real (strict) swings on at least one series,
and the 08.18 false positive is gone from the EA's signal set. EA baseline unchanged:
AB102C0A2966B1BF9C62A8B79276A19563E936E9675980C95A0B8453E3A24EAC.
Record-only: .ex5 sizes/mtimes inadmissible as identity evidence (R-236/R-233). The T161J state
is run-verified per this packet; recertification (a T161J-CERT run) available on request.

