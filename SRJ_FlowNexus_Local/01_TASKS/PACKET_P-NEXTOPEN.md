# PACKET P-NEXTOPEN — spec §4 next-candle-open evaluation: the retest + entry sites
Created 2026-09-09 by the builder. AUTHORIZATION: the operator's directive of 2026-09-09
(verbatim at the bottom) ending "Proceed." — issued in-session; the operator rules directly as
council of record (the council relay is deferred). Canonical file modified: exactly ONE —
Experts\SRJ_FlowNexus_EA.mq5. Pre-edit baseline:
AB102C0A2966B1BF9C62A8B79276A19563E936E9675980C95A0B8453E3A24EAC (206,837 B, 4,190 CRLFs);
the Stage-1 re-hash is the gate.

## RULE IMPLEMENTED
Part A v4.2 §4 (L222-230): "Default: evaluate at the next candle's open, at three sites — the
POI retest that seeds a candidate, the confirmation candle, and the exit." The §8 table marks
§4 "not built". This packet implements the two sites that exist in the EA today (the exit site
is born with the unbuilt §5 exit model, charter STEP 4). The spec's "recommended mitigation"
(diagnostics first, no control-flow change) is SUPERSEDED by the operator's explicit
directive; baseline comparability is knowingly broken (charter §5: behavior-changing steps
diverge by design). INTERPRETATION NOTE (declared): "the next candle open" = the open of the
bar FOLLOWING the just-closed evaluation bar = the forming bar's open at the EA's evaluation
instant = iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) with barShift = 1.

## EDIT SET (all in Experts\SRJ_FlowNexus_EA.mq5)
E1 — DetectPoiRetest (L1446ff): the retest's body-side test uses the NEXT candle's OPEN in
     place of the retest candle's CLOSE inside bodyLo/bodyHi. The wick test (h/l) and the POI
     line snapshot (ReadBuf1 at barShift) are UNCHANGED. Fail-soft: if the next open cannot be
     read (<= 0.0), fall back to the retest candle's close. The two diagnostic call sites
     (t78/t73) mirror the live predicate automatically (same function).
E2 — the S5 gate (L3871): the entry reference currentPrice = the NEXT candle's open (the
     forming bar's open at the evaluation instant) instead of the evaluated bar's close. It
     feeds ComputeNearestTpTarget, the 1R gate and the printed signal line. Fail-soft fallback
     to the evaluated bar's close if the next open cannot be read.
E3 — the L2950 comment truthed: "the close IS the entry" -> "the entry IS the next candle's
     open (P-NEXTOPEN 2026-09-09)" (comment-only; keeps the source honest).

## DECLARED BOUNDARY (unchanged, by scope)
- The S2POLL advisory block (L2886-2953): diagnostic-only (S2POLL_RR_SHORTFALL log; the abort
  is commented out). Its TP-existence abort is tick-insensitive. UNCHANGED.
- The S4 confirm-direction test (the confirming close vs the zone): the confirmation-VALIDITY
  test — NOT named by the directive. One word from the operator extends §4's confirmation site
  to it. UNCHANGED.
- Historical bar walks (e.g. L2233): for a historical bar the next open IS that bar's close in
  continuous data; no change.
- POI buffer snapshot timing (ReadBuf1 at barShift): the directive changes the PRICE, not the
  line-value snapshot. UNCHANGED.

## STAGES
1. Pre-edit EA re-hash = AB102C0A...3A24EAC, else STOP and diagnose (R-236 — never assume
   drift, never revert on assumption).
2. E1-E3 applied (editor tool; the diffs live in the tool record).
3. Post-edit re-hash + byte delta + CRLF/LONELF counts, recorded AFTER the write (R-141).
4. Compile T161K (metaeditor64 /compile per R-52): gate "0 errors, 0 warnings" —
   T161K_COMPILE.log (gitignored per R-220).
5. Headless run T161K via /config T161K_P1.ini (= the T161J harness shape: EURUSD M5, the
   Tier-1 superset 2026.08.14-08.22, InpDebugLog=true as tester input). Gates vs the T161J
   control: WS161_CENSUS mismatch=0 loads==stores==1728; WS161_LOAD_COUNT=1;
   BIASCENSUS_FINAL shard-identical (the CQD is untouched); XOB-PROMOCENSUS 372;
   ZONECENSUS_FINAL line-identical; signals tabulated beside T161J's (08.17 16:35:02 LONG
   R=1.46 SL 1.15870 TP 1.16141) — an R delta is EXPECTED only where the next open differs
   from the prior close (gap boundaries; a signal-count delta must be traced bar-by-bar to a
   boundary gap or declared BLOCKED). Post-run re-hash: EA byte-identical to Stage 3.
6. Return: 06_HANDOFFS\BUILDER_RESULT_161-K.md + T161K_TABULATION.txt; journal archived whole
   to 06_HANDOFFS (gitignored). Nothing under 02_TASK_CHECKPOINTS (P18). No git add/commit/
   push without an explicit token.

## THE OPERATOR'S DIRECTIVE (verbatim, 2026-09-09)
"also for the record, i want you or make the EA consider the next candle open not the current
candle close. so for entry, consider the next candle open price not the confirmation candle
close. for the POI retest, consider the next candle open not the retest candle close price.
because these matter a lot such as this trade example, the 17:05 was a valid retest as it
marked with the circles by the POI indicator, but for the EA, consider the next candle open
because at 17:10 candle open it actually close lower then the POI level making it break and
flip the W POC bias. Proceed."
