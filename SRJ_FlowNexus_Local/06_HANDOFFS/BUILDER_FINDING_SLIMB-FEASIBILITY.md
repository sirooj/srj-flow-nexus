# BUILDER_FINDING_SLIMB-FEASIBILITY — P-SL-IMBALANCE-A E1 derivability (2026-09-12)

Packet question (§3.1): does FlowLogic know, at swing-confirmation time,
which leg created the swing and whether a `CImbalance` sits on it?
Answer: YES, by construction. Evidence below, all on `F58E57A5` (59,714 B)
and `F830AE5A`. The export predicate itself (§3.3 value 1 vs 0) is
SEMANTIC and is NOT specified in the packet — relayed to council with a
recommendation (§6). No canonical file touched; read-only investigation.

## 1. Swing site and fresh-fractal semantics

- Export site: `Indicators\SRJ_FlowLogic.mq5` L968-976. Slot `target=i-1`
  preset to `EMPTY_VALUE`, then set from `high[target]`/`low[target]` iff
  `SRJ_isStrictFractalHigh(high,i,1)` / `...Low(low,i,1)` with `i>=2`.
- `SRJ_isStrictFractalHigh(h,i,1)` =
  `h[i-1] > h[i-2] && h[i-1] > h[i]` (`Include\SRJ\SRJ_Fractals.mqh` L23-35;
  low mirror L37-49). The swing apex is ALWAYS the just-closed bar
  (`target=i-1`), confirmed at processing bar `i`. The creating leg is bars
  `(..., target]` — all with index `<= i`, all already processed.
- Each slot is written exactly once (loop index `i` visits `target=i-1`
  once; no revisit path in `OnCalculate` L739-1234). A write-once slot
  carries its final flag at first write, so the §3.3 "both passes carry
  the settled flag" requirement is satisfied trivially — council to
  confirm this reading.
- Discipline note: fractals are not objects, so there is NO object pointer
  at the swing site. The mappable discipline is "same branch, same bar
  data": the HIGH flag is written inside the high-fractal `if`, the LOW
  flag inside the low-fractal `if` (L972-975), from `high[]/low[]` at the
  same `target`. Council to confirm this satisfies §3.3.

## 2. Free indices

- `indicator_buffers 37`, indices 0..36 all bound (L569-623). Next free:
  **37 (HIGH_IMB), 38 (LOW_IMB)**; raise to `#property indicator_buffers 39`.
- EA side (`Experts\SRJ_FlowNexus_EA.mq5`): defines exist for 2..27, 29..33
  (L158-182, L1552-1593); 28/34/35/36 unread by EA. E2 adds
  `FL_BUF_SWING_HIGH_IMB 37` / `FL_BUF_SWING_LOW_IMB 38`. No collision.

## 3. Association material in scope at the export block

- `g_imbalances` (`CImbalance` list) is iterated in the SAME export block
  (L1062) — in scope at the swing site (L968).
- `g_s.structLegBoundary` (current structural leg start) is in scope;
  set at initial bias (`SRJ_BiasEngine.mqh` L135 `=i`), on flips (L286
  `=i`), on fvgRenewal (`SRJ_ImbalanceMgr.mqh` L202/L327 `=i-2`, "anchor
  to opener startBar").
- `CImbalance` carries `startBar/endBar/detectionBar/isBullish/isFilled/
  fillBar/isWickFilled/remTop/remBottom/objId` (`SRJ_Types.mqh` L97-141).
- Creation is synchronous, backdated by exactly 2 bars, both directions:
  bull `startBar=i-2, top=low[i], bottom=high[i-2], detectedAt=i`
  (L115-119); bear `startBar=i-2, top=low[i-2], bottom=high[i],
  detectedAt=i` (L240-244); ctor `SRJ_createImbalance` L18-20.
- Bar-loop order per `i`: creation (FlowLogic L881) → fill/shrink
  (L884, `SRJ_FVG_FillDetectionPass`) → tick recompute (L886) →
  pruning (L901-902) → export block (L909+). At the swing site every
  record detectable on bar `i` exists and fill state is current thru `i`.

## 4. No-lag proof (startBar window)

A record detected at bar `k` has `startBar=k-2`. Export for swing
`target` runs at `i=target+1`. Record present ⟺ `k<=i` ⟺
`startBar<=target-1`. Hence any record with `startBar` strictly below
the apex is present — detection lag cannot hide creating-leg
imbalances. A window `startBar ∈ [legStart, target]` is observationally
IDENTICAL to `[legStart, target-1]` (a `startBar==target` gap is only
detectable at `i+1`, after the write-once export). No semantic choice
hides in the upper bound.

## 5. Remainder-alive test (refined rule, single test)

`SRJ_FVG_FillDetectionPass` L381-385 backfills `remTop/remBottom` to
`top/bottom` when NA, so unfilled records carry `remTop>remBottom`
(full range; creation guarantees `top>bottom` both directions).
Wick coverage shrinks (L390-408), death is body-close-over-midline only
(P-FVGVALIDITY). So `remTop>remBottom` ⟺ alive under the operator's
refined rule — one test covers unfilled + partial, excludes dead.
Recommended as the §3.3 value-1 life term.

## 6. Predicate: specified vs open (RELAYED, not assumed)

Mechanism proved; meaning of "qualifying" NOT in packet. Recommendation:
`1` ⟺ ∃ `CImbalance` with `startBar ∈ [structLegBoundary, target]`
AND direction matching the creating push (bullish→HIGH, bearish→LOW)
AND `remTop>remBottom` as-of bar `i`. Alternatives for council:
(A) drop direction match (either polarity qualifies);
(B) life term `!isFilled` instead of remainder (stricter; kills partials
the operator ruled valid — NOT recommended);
(C) leg anchor other than `structLegBoundary` (none other exists in
`SState`; would be new machinery).
Builder executes on council's word; default if confirmed is the
recommendation.

## 7. Declared edge cases (no ruling needed unless council disagrees)

- `structLegBoundary > target` (flip/initial opened a leg ON bar `i`,
  boundary `=i`): swing belongs to the just-closed leg; scan is empty →
  write `0` (slot IS a swing; `EMPTY_VALUE` forbidden by contract).
  Renewal anchors `i-2 < target` always — unaffected.
- Apex-straddling gaps (`startBar==target`, detectable only at `i+1`):
  invisible to a write-once export (§4). Declared limitation; the census
  cross-checks (`agreeWb`) will show whether it ever matters.
- Optional `objId` pair (§3.3): skipped — the scan, not one pointer,
  qualifies the flag, so no single id is honest. Costs nothing to skip.

## 8. E2 readiness

Blocked on E1 spec (census consumes the export; `avail=0` run answers
nothing). Placement pre-mapped: `ComputeSlReference` return sites in the
EA (emission per invocation, both branches + false exits); walk idiom
follows `FindNearestSwing`/t133 (500-slot safety bound). No edit made.

## 9. TRIM model double-proof (same session, read-only)

RECON6 journal, `SL_REF`-anchored patterns: `site=S2POLL` = **432** (P),
`site=S3ARM` = **39** (M) — council's two independent checks land
exactly (471+118=589; 157-39=118). Method note: unanchored `site=`
counts (1794/275) include memo lines — future tabulations must anchor
`SL_REF`.
