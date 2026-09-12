# PACKET P-FVGVALIDITY — DRAFT, NOT ISSUED, NOT EXECUTED

STATUS: DRAFT AMENDED 2026-09-11 per the operator's refinement (§0 amendment).
ISSUANCE: the operator's "proceed until you need my input or relay" (2026-09-11,
with the refinement as the needed input) is taken as the execution token —
declared, correctable (prior "please proceed" precedent treated as token).
On this token execute S1–S7 continuously per the automation rule.
STATUS: ISSUED + EXECUTED AND VERIFIED 2026-09-11 (operator "proceed until you
need my input or relay" taken as token, declared). S1 pre-hash PASS
(ImbalanceMgr 64CF3275 / FlowLogic 1EA7858F / EA 1478ADCF). S2 E0–E3 applied
first attempt. S3 post-hash Types D542B458 / ImbalanceMgr F830AE5A / FlowLogic
F58E57A5. S4 FlowLogic + EA compile 0/0. S5 RECON5-FVGVALIDITY PASSED
("Test passed in 1:05:28.971", 563338 ticks, 3168 bars; wrapper died before
DONE, manual archive SEG=15317). S6/S7 ALL GATES PASS — see
06_HANDOFFS\BUILDER_RESULT_RECON5-FVGVALIDITY.md (in-window no-op; E4 print
visibility unproven under inHtfDebugLog=false, needs a debug-on run). Canonical files named: `Include\SRJ\SRJ_ImbalanceMgr.mqh` (logic) +
`Include\SRJ\SRJ_Types.mqh` (two `double` remainder fields + ctor init only) +
`Indicators\SRJ_FlowLogic.mq5` (call-site args + zone-export block only). No other
canonical file touched.

## 0. Ruled rule (BUILDER_FINDING_0828-FVG.md §5, operator verbatim confirmed)

For a new-entry POI, an FVG is:
1. DEAD when price has traded its ENTIRE range with wicks (nothing untested
   remains) — even without a body closure.
2. DEAD when a candle BODY closes through the FVG — even if not fully wick-tested.
3. Otherwise ALIVE: partial fill leaves the FVG valid; the REMAINING UNTESTED
   range is the entry POI.
Supplements Part A v4.2 L135 ("not been filled or invalidated" — undefined there).

## 0A. REFINEMENT (operator, 2026-09-11, verbatim core)

"The FVG is not dead, but the level of the imbalance has been covered or filled.
so it is not valid as the LTF POI. The FVG is still not dead if there is no body
candle closure over the midline. for example in extreme case, the FVG zone is
filled but left with one point of unfilled price, that one point is still valid
as the LTF confirmation as long as it is not invalidated with a candle body
closure over the midline."
RESTATED RULE: wick coverage NEVER kills the FVG — it only shrinks what the FVG
can offer. Death (`isFilled`) comes ONLY from a body close over the midline
(the existing L382/384 test). A covered level offers no POI; any untested
remainder, down to one point, still exports as the LTF confirmation.
CONSEQUENCE FOR THIS PACKET: E1 is shrink-only (no wick kill); E2 skips
empty-remainder FVGs without marking them dead; the `isFilled` stream is
byte-identical to today, so `tickFVGIsValid` and BIASCENSUS are expected
IDENTICAL — movement is confined to buffers 24/25 values and the EA's reads
of them.

## 1. Measured delta vs the EA today (all read 2026-09-11)

- Body rule PRESENT: `SRJ_FVG_FillDetectionPass` (ImbalanceMgr L364–392) sets
  `isFilled` on body close through the midpoint with the closing direction
  (bullish L382, bearish L384). Partial wick-only touches never fill.
- Wick rule ABSENT: no wick-extent tracking anywhere; a fully wick-traversed FVG
  without a qualifying body close stays `isFilled=false` forever.
- Remaining-range ABSENT: the FVG is binary (`isFilled` true/false); zone edges
  fixed at formation; no partial-fill state.
- Dead-state fields EXIST but unwired: `CImbalance.isWickFilled` / `wickFillBar`
  (Types L111–112, ctor defaults L129–130) are only written by the `NewImbalance`
  factory (Types L285–300) — the fill pass never sets them. Only other matches
  are the commented-out factory signature (L279–280). Verified by tree grep 2026-09-11.
- No `detectionBar` guard exists in the fill pass today (L364–392 has no
  `detectionBar` reference) — the wick guard below is a packet design decision.
- Call site: FlowLogic L884
  `SRJ_FVG_FillDetectionPass(open,close,i,withinLookbackWindow,barClosed)` —
  signature must gain `high[]`/`low[]`.
- Pass order: creation L881 → fill L884 → tickvalid L886 → structure/decisions
  L888–891. Fill results are visible to tickvalid the same bar.
- Zone export: FlowLogic L1053–1054 writes EMPTY (buffers 24/25
  `g_bufFvgLegZoneHigh/Low`); L1070 skips `isFilled`; L1075 leg-boundary filter;
  L1088–1089 exports `freshFvg.top/bottom` + objId L1090. This is the
  remaining-range shrink site.
- Bias consumption: `tickFVGIsValid = !latestBiasFVGIsFilled` (ImbalanceMgr L429)
  feeds the BiasEngine composite flag (`checklistActivated` L154,
  weak-flip union L171). Under §0A the `isFilled` stream is UNCHANGED, so no
  bias-side movement is expected — G5 still records it verbatim to prove it.
- EA window footprint (RECON4-FIXS2POLL tabulation, measured 2026-09-11):
  `fvgOnly=0`, `fvgInWin=0` (ZONECENSUS_FINAL, 3168 bars). A-priori: ZERO
  EA-zone-side movement in-window. Bias-side movement possible via the composite
  above — full gates decide, not this prediction.

## 2. E1 — remaining-range shrink on wick coverage (ImbalanceMgr, shrink-only)

In `SRJ_FVG_FillDetectionPass`:
- Signature gains `const double &high[], const double &low[]`.
- Add per-FVG remaining-range state: two new `double` fields on `CImbalance`
  (e.g. `remTop`/`remBottom`, init `top`/`bottom` at the factory + a one-time
  backfill for live instances at first pass).
- Each bar with `i > fvg.detectionBar`: intersect the bar's wick `[low[i],high[i]]`
  with `[remBottom,remTop]` and shrink the remainder from whichever side(s) the
  wick covers. Wick coverage NEVER sets `isFilled` (§0A).
- When `remTop <= remBottom` → the FVG offers nothing further: set
  `isWickFilled=true`, `wickFillBar=i` (coverage marker, reuses the existing
  dead-state fields with corrected meaning) — `isFilled` stays false,
  `fillBar` stays unset. The FVG is covered, not dead.
- Keep the existing body-midpoint test (L380–389) verbatim as the SOLE death
  rule (sets `isFilled`/`fillBar`, `isWickFilled` stays false).
- The `i > fvg.detectionBar` guard is new (no guard exists today) — declared.

## 3. E2 — export the remaining range (FlowLogic, L1088–1089 site only)

At the `freshFvgIdx >= 0` export block: skip candidates with an empty remainder
(`remTop <= remBottom` — covered, offers nothing) WITHOUT marking them dead;
write `freshFvg.remTop/remBottom` when the remainder is valid (initialized and
`remTop > remBottom`), else fall back to `top/bottom` verbatim. NO minimum-size
gate: a one-point remainder still exports (§0A). objId line L1090 untouched.
The L1070 `isFilled` skip and L1075 leg filter stay verbatim.

## 4. E3 — call-site args (FlowLogic L884)

`SRJ_FVG_FillDetectionPass(open,close,i,...)` → add `high,low` in the same
positional order as creation pass L881. One line. No other FlowLogic logic touched.

## 5. E4 — additive census print (ImbalanceMgr, InpDebugLog-guarded)

On each body kill print one BODY-KILLED line (objId, bar); on each bar a wick
fully covers a remainder print one WICK-COVERED line (objId, bar, the remainder
before death — covered, not dead); optionally a SHRINK line per partial cover
(guard volume: only on bars where the remainder actually moves). Follows the
TP_ELECT / SL_STRUCT precedent. Needed to tabulate the blast radius.

## 6. Stages S1–S7

- S1: re-hash EA (`1478ADCF...BA74`, 261040 B — EA untouched by this packet) +
  ImbalanceMgr (`64CF3275...02AE`, 23323 B, measured 2026-09-11) + FlowLogic
  (`1EA7858F...73B08`) + CQD/OBMGR. Any miss: DIAGNOSE, never revert on assumption.
- S2: apply E1–E4 (only the two named files).
- S3: post-write digest pair for both files (record bytes + CRLF/LONELF).
- S4: compile the FlowLogic indicator (0 errors / 0 warnings) + the EA
  (0/0 — EA source untouched but recompile proves the binding).
- S5: headless full-window run on `RECON1_P1.ini` unchanged (8/26–9/10,
  3168 bars) via `run_tester_v2.ps1`; terminal.ini `[Tester]` window untouched.
  Launch + STOP; operator signals completion.
- S6: gates G1–G5 below. S7: write `BUILDER_RESULT_RECON5-FVGVALIDITY.md` +
  tabulation; mark this packet EXECUTED AND VERIFIED in place.

## 7. Gates

- G1: S4 compiles 0/0, post-compile digests byte-identical.
- G2: WS161 fields/loads/stores/mismatch — record verbatim (movement ALLOWED and
  expected on bias-side; mismatch must stay 0).
- G3: signal set vs RECON4-FIXS2POLL (8/28 10:05 SHORT R=2.43 SL 1.16508;
  9/4 16:00 LONG R=2.56; 9/7 09:20 R=1.76 + 16:45 R=1.25). A-priori: the
  `isFilled` stream is UNCHANGED (sole death rule untouched) so `tickFVGIsValid`
  and BIASCENSUS are expected IDENTICAL; EA-zone-side a-priori near-zero
  (fvgOnly=0/fvgInWin=0 measured); any signal change must trace to a named
  SHRINK/WICK-COVERED line (E4) or it is a defect.
- G4: post-run four digests byte-identical (EA/CQD/OBMGR/FlowLogic).
- G5: FlowLogic identities recorded verbatim (BIASCENSUS 1554/1614 x2,
  ZONECENSUS 3168/1056, PROMO 469) with movement mechanism-named per kill line;
  CONFIRMPOLL / SUPPRESSED / abort census tabulated like-for-like.
- On ANY gate failure: BLOCKED, name gate + measured value, write nothing
  further, REVERT NOTHING.
