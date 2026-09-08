# BUILDER FINDING — CQD-DA: divergence-DETECTION audit of SRJ_CQD_TickBased_MT5
Report: C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_FINDING_CQD-DA.md
Date: 2026-09-08/09. Audit only — ZERO source changes (CQD, EA, includes all untouched).
Scope: the DETECTION side of the 08.18 disagreement (CQD exported code-4 verdicts at 14:20/14:40
that the operator rejects; the code-1 at 18:10 the operator accepts). Inputs: the CQD source
(Indicators\SRJ_CQD_TickBased_MT5.mq5, v2.05), spec Part A v4.2 §3.8 + §0, the operator's taxonomy
(codes 1/3 bull normal/hidden, 2/4 bear normal/hidden), charter §9 rulings.

## THE MEASURED DETECTION MECHANISM (line anchors from the CQD source)
- Buffer 6 CQD_DivVerdict (L15-19, L110): per-bar verdict 0 / +1 / +2 / -1 / -2;
  EMPTY_VALUE=not yet scanned; written ONLY in TryDivergence's confirmed-pair branch
  (L746-755), at bar x2 (the right anchor), LAST-WRITE-WINS across qualifying pairs (L749).
- Swing flags (the "of-4"): IsPriceSwingHigh/Low (L506-518) and IsCqdSwingHigh/Low (L520-538)
  are ONE-BAR fractals: h[i]>=h[i-1] && h[i]>=h[i+1], distinct on at least one side; the CQD
  variants are epoch-guarded. No strength, no ATR offset, no HTF context.
- TryDivergence (L662-765): for x2 and a direction, walk x1 from (x2-InpMinAnchorGap=3) back to
  (x2-InpDivergenceLookback=100), max InpMaxAnchorsPerBar=3 qualifying anchors per x2 per
  direction (L676, L763); hole/epoch guards (L686-702); classification (L704-722): bearish
  regular = price HH + CQD LH, bearish hidden = price LH + CQD HH (strict inequalities;
  equality = no divergence).
- FLAG GATE (L732-735): flagSum = x1Price + x1Cqd + x2Price + x2Cqd must be >= 2 ("2-of-4").
- PiercingClean (L560-596): line-of-sight — EVERY intervening bar's price extreme AND CQD
  extreme must stay on the connector's side of the straight x1->x2 line; a single poke rejects;
  tested on BOTH series.
- ScanDivergences cadence (L853-885): incremental; maxX2 = rates_total-3 — a pivot x2's verdict
  appears only once TWO more bars exist to its right.
- ScanUnconfirmedDivergence (L893-1036): the LIVE forming bar serves as the right anchor; the
  preview line picks the HIGHEST-flagSum x1 (L989-994); dotted preview drawn by default (L94);
  NEVER writes buffer 6 (L18-19, L890-891).
- Verdict encoding (L750-754): +1 bull regular, +2 bull hidden, -1 bear regular, -2 bear hidden
  = operator codes 1 / 3 / 2 / 4. ENCODING RE-VERIFIED — the disagreement is detection.

## FINDINGS
- CQD-DA-1 (PRIME SUSPECT for the 08.18 phantom code-4s): the 2-of-4 gate lets x2 be a
  NON-SWING. With both x1 flags set (x1 = a real prior swing top), ANY bar x2 >= 3 bars later
  whose price high is lower and CQD high is higher than x1's classifies as bearish-hidden —
  regardless of whether x2 is a swing at all. Micro-pullback tops inside a down-leg therefore
  continuously produce code-4 verdicts. The operator's manual read requires both anchors to be
  real swing points. Most probable mechanism for 14:20/14:40 (both are minor pullback tops;
  x1 = the morning swing).
- CQD-DA-2 (two pivot notions in one indicator): the divergence engine connects 1-BAR
  micro-fractals, while the triangles the operator actually reads on the CQD panel are a
  DIFFERENT, smoother series — IsCqdFractalHigh/Low with an ATR(14)x0.5 offset (L541-557,
  MarkFractals L810-850). The detection never consults the fractal series. The operator reads
  triangle-to-triangle divergence; the export is built from extremes that often carry no triangle.
- CQD-DA-3 (verdict collision = oldest-anchor wins): at one x2, up to 3 qualifying pairs per
  direction each overwrite buffer[x2]; x1 iterates newest->oldest, so the EXPORTED verdict is
  the OLDEST qualifying anchor's pair — while the PREVIEW the operator watches forming picks
  the HIGHEST-flagSum pair. Exported verdict can differ from the previewed line at the same bar.
- CQD-DA-4 (preview/export timing gap): the operator's chart shows preview divergences whose
  right anchor is the LIVE bar, immediately; buffer 6 records only confirmed pairs, and only
  once x2 has two right-side bars (up to ~2 M5 bars = ~10 min later; the live-bar anchor may
  never confirm). The operator's superseding rule ("the latest divergence present at the
  confirmation entry candle") is evaluated on a chart that includes previews; the EA's walk
  sees confirmed verdicts only. Structural EA-vs-operator surface, independent of permissiveness.
- CQD-DA-5 (piercing strictness, both series): the connector must be un-pierced by every
  intervening bar on price AND on CQD. Restrictive — not the false-positive cause — but part
  of the qualification the operator should ratify explicitly (their manual read almost
  certainly never tests CQD line-of-sight).
- CQD-DA-6 (mapping verified, defect shape-specific): the 08.18 18:10 +1 the operator accepts
  as latest comes from the SAME detector — agreement. The defect is over-firing in one shape
  (hidden-bearish on micro-pullbacks), not a wholesale encoding error.
- CQD-DA-7 (spec gap + §0 tension): §3.8 defines the CONSUMPTION rule only — "qualifying" is
  never defined, and its permanence clause is superseded by the operator's
  latest-at-confirmation ruling (already implemented EA-side at STEP 2). The qualification
  definition lives ONLY in the CQD code, and it carries NUMBERS: lookback 100, min anchor
  gap 3, max 3 anchors — in direct tension with the §0 standing prohibition ("if a proposed
  rule needs a number, the rule is wrong"). The operator's divergence-validity ruling (open
  semantic item b) is the missing definition; these findings hand the operator the exact
  criteria set to rule on.

## ADDENDUM — OPERATOR RULING 2026-09-08/09 (recorded after this report was written)
The operator rules: THE CQD INDICATOR IS CORRECT BY DESIGN. Every rule and behavior —
including the 2-of-4 anchor gate (CQD-DA-1's subject) and the micro-fractal pivots
(CQD-DA-2's subject) — is deliberate and the operator's own creation. The findings
above therefore STAND AS MEASUREMENTS of deliberate behavior, not as defects; the
"prime suspect" framing in CQD-DA-1 is VOID as a defect claim. Do not propose
indicator changes.
The disagreement resolution moves to the EA side: how the EA CONSUMES the CQD verdict
stream (the implemented latest-at-confirmation walk latched -2 at bar 14:40 and fired
the 08.18 14:50 signal the operator judges invalid).
The proposed confirmation run (CQD InpDebugLog=true) remains AUTHORIZED but is NOT
achievable without a canonical edit: the EA's iCustom binding passes only
InpCqd_NoReset / InpCqd_MaxCarryBars / InpCqd_MaxBackfillDays (EA L45-48) and the
CQD's InpDebugLog cannot be set from the tester ini; a one-line EA pass-through (or a
CQD default flip) is a packet item.
EA-side verdict-stream evidence already in hand (T161H_JOURNAL.log, 08.18 afternoon):
-2@14:20 (read 14:30:01, latched S5 dir=SHORT), +1@14:30 (14:40:00, IDLE), -2@14:40
(read 14:50:01, latched -> the signal), +2@14:50, -2@15:00, -1@15:20,
+2@15:25/15:30/15:35. The EA reads shift=2 only (EA-78).
