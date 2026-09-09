# BUILDER FINDING — CQD-FRAC-1: the swing-fractal TRIANGLE marking audit
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_CQD-FRAC-1.md
Date: 2026-09-09. Audit only — ZERO source changes. Trigger: OPERATOR BUG REPORT (verbatim):
"i have this bug on the CQD panel that the swing fractal markings could be wrong, in the sense of
that candle is not the most extreme point out of the candle left and right of it but it got
mistakenly marked as the swing candle with the triangle marker. the calculation might be different
than a normal price candle, but the swing fractal pattern are the same with the CQD candle chart."
CQD digest of record: 4B2D688C6A29B1A8CA0E2F894526A63C82DAACE6846B5A339A473D03140D96C2 (untouched).

## 1. THE MARKING PIPELINE (measured)
- MarkFractals (L810-850) runs each FinalizePass; marks bars i <= rates_total-3:
  CQD_FractalUp[i] = IsCqdFractalHigh(i) ? CQD_High[i] + gap : EMPTY_VALUE  (gap = CqdATR[i]*0.5)
  CQD_FractalDown[i] = IsCqdFractalLow(i) ? CQD_Low[i] - gap : EMPTY_VALUE
- Buffers 4/5 -> plots 1/2, arrows 217/218 (PLOT_ARROW L1108/L1112), the "CQD Swing High/Low"
  triangles the operator reads. Offset is display-only.
- THE PREDICATE (L541-557), verbatim:
  High:  CQD_High[i] >= CQD_High[i-1]  &&  CQD_High[i] > CQD_High[i+1]
  Low:   CQD_Low[i]  <= CQD_Low[i-1]  &&  CQD_Low[i]  < CQD_Low[i+1]
  Guards: CqdReady on all three bars + SameEpoch pairs (no cross-day marks).
- ASYMMETRY: the LEFT neighbor test allows a TIE (>=/<=); the RIGHT test is STRICT (>/<).
  This is a 3-BAR window (one candle each side), not the classic 5-bar fractal.

## 2. WHAT CAN PRODUCE A "WRONG" TRIANGLE (vs the operator's standard)
FRAC-1 THE TIE RULE: a candle that merely TIES its left neighbor takes the triangle
  (e.g. two candles with the same CQD high -> the RIGHT one is marked). A tied candle is not
  "THE most extreme point out of the candle left and right of it" under a strict reading.
  Ties are STRUCTURAL in this series: the tick-carry fill (L486-490) gives a tickless bar
  CQD_Open=High=Low=Close = the PRIOR bar's close EXACTLY — carried bars form flat plateaus whose
  last bar automatically satisfies >=left && >right. Natural (non-carry) equal highs do the same.
FRAC-2 THE 3-BAR WINDOW: the test sees ONE candle each side. A candle can be the 3-bar local max
  while a HIGHER candle sits TWO bars away — visually "not the most extreme out of the candles
  around it" if the operator's mental pattern is the wider classic fractal.
## 3. WHAT CANNOT HAPPEN (refuted hypotheses)
- A marked candle STRICTLY below an immediate CQD neighbor is impossible at mark time (the
  predicate guarantees >=left && >right on the same series the chart draws).
- NO STALE MARKS: a full recalc (chart refresh, the OnTimer retry via ChartSetSymbolPeriod,
  history reload) resets BOTH scan cursors (L1221-1222) AND wipes/rebuilds every buffer
  (L1231-1237); incremental passes only append cleared tail bars (L1239-1262). Marks are written
  once, from final closed-bar data, and never revised — but also never NEED revision.
  If the operator HAS seen a hard violation (a triangle below an immediate neighbor), that would
  contradict this audit — ONE timestamped chart example is requested to hunt it specifically.
## 4. EA IMPACT: NONE
The EA consumes ONLY buffer 6 (CQD_BUF_DIVVERDICT) from the CQD handle — verified across every
g_hCqd read site (EA L1959, L2321, L2340, L2989-2990, L3921). Buffers 4/5 are not read by the EA.
A marking fix is operator-facing only (the panel + the operator's manual read) and changes no
EA behavior. The divergence DETECTION uses DIFFERENT predicates (see §5).
## 5. THREE SWING DEFINITIONS LIVE IN ONE INDICATOR (the decision this audit forces)
1. Price micro-swing (the flag gate's price flags): IsPriceSwingHigh/Low L506-518 — 3-bar,
   ties allowed BOTH sides if distinct on at least one side.
2. CQD micro-swing (the flag gate's CQD flags): IsCqdSwingHigh/Low L520-538 — same shape on CQD.
3. CQD fractal (the triangles the operator reads): IsCqdFractalHigh/Low L541-557 — 3-bar,
   left-tie / right-strict + ATR offset.
The operator's "swing" standard (their words: the classic fractal pattern on the CQD chart) is
closest to #3 made strict. The pending P-CQD-FLAGGATE per-anchor requirement (as drafted) uses
#1/#2. If the operator wants ONE swing notion, the predicate must be unified (that touches the
DETECTION side -> buffer 6 -> EA behavior — a larger blast radius, operator's call).
## 6. FIX SHAPES (drafted, none applied — canonical edits await the operator's packet)
(a) STRICT-3: IsCqdFractalHigh: CQD_High[i] > CQD_High[i-1] && CQD_High[i] > CQD_High[i+1];
    Low mirrored strict. The marked candle is then strictly THE extreme of its immediate
    neighbors — the operator's stated standard, minimal change, display-only.
(b) STRICT-5: (a) + the classic 2-candles-each-side window (thins the triangles; matches the
    Bill-Williams pattern if that is the operator's mental model).
(c) UNIFY: one strict swing predicate serving triangles AND flag gate (detection changes; must
    be sequenced with/instead of P-CQD-FLAGGATE).
(d) MEASURE ONLY: instrument + tabulate tie/window violations on the operator's chart window.
## 7. OPEN FOR THE OPERATOR
Q-A which fix shape (a/b/c/d). Q-B whether their "swing" for the 2-of-4 flag gate is the triangle
series (then P-CQD-FLAGGATE must be re-based on the unified predicate — option c) or the
micro-swing flags as drafted. Q-C one timestamped example of a wrong triangle (decisive evidence;
a hard violation would reopen §3).
