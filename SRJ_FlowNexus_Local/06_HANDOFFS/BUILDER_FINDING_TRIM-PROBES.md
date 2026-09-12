# BUILDER_FINDING_TRIM-PROBES.md — P-FIX-S2POLL §6 probes A/B/C on the current baseline

Date 2026-09-11. READ-ONLY exercise: no canonical edit, no compile, no run, no
git action. Input `06_HANDOFFS\RECON5-FVGVALIDITY_JOURNAL.log` (SEG=15317, the
T162_FVG baseline of record; behaviorally identical to RECON4-FIXS2POLL).
Method: `00_CURRENT_WORKING\probe_trimcells.ps1` (parser, kept on disk).
Joins: INPLAYCOMMIT `bar=` ↔ XOBINPLAY2 `bar=`; S3ARM stop lines ↔ INPLAYCOMMIT
by market-time (SL_REF/SL_STRUCT carry no `bar=`; zone comes from the
INPLAYCOMMIT line because SL_REF prints zoneLo/zoneHi as 0.00000).

## Probe A — E3 cell census over INPLAYCOMMIT applied=1 (n=157)

- Literal (bounded x S3ARM-line presence): (1,1)=157, (0,1)=0, (1,0)=0, (0,0)=0.
- Direct (bounded x haveStop, applied=1): 1/1 =157. haveStop=1 on every arming
  evaluation, bounded=1 on every arming evaluation.
- Reading: E3's opened cell (0,1) has zero in-window instances; E3's narrowed
  cell (1,0) has zero instances — no admission loss from the narrowing, nothing
  unquantified. Council STOP condition ("if cell (1,0) is material, relay back
  before executing"): count is 0, NOT material, no relay-back required.

## Probe B — E2 blast radius over applied=1 committed=0 (n=111)

- 1 predicted flip on printed values: bar 9/3 17:20 LONG zone [1.16114,1.16153],
  SLREF stop=1.16114 == zoneLo exactly (boundary-inclusive).
- The bar's own lines: INPLAYCOMMIT scanned=23 swings=6 hits=0 commitVia=none
  committed=0; the live t133 walk saw 6 distinct swings and counted ZERO inside
  the zone — the stop value itself not counted. Mechanism below print precision:
  either the stop sits sub-point below zoneLo (both print 1.16114) or the
  distinctness filter skipped it as within one point of its predecessor.
- E2 is already live in this build, so a genuinely-inside stop would already
  have flipped this bar; hits=0 says on true values it is outside-or-filtered.

## Probe C — cross-check on the flip bar

- XOBINPLAY2 bar=9/3 17:20: unc_scanned=8 unc_swings=2 unc_hits=0 (capped walk
  likewise 0). Two independent walks agree with the live walk: no swing inside
  the zone. Cross-check NEGATIVE — the Probe-B prediction is a print-precision
  boundary artifact, not a real flip. E2's confirmed new-arming population
  in-window: 0.

## Conclusion for sequencing

- Baseline is clean for TRIM: no hidden (1,0) population, no unconfirmed E2
  flips, haveStop live everywhere (157/157). The memoisation identity argument
  (per-bar cache keyed on barTime+dir) rests on measured ground.
- P-TRIM-S2POLL itself is NOT issued (no packet file exists); NO canonical edit
  executed here. Council must issue; builder executes on token per §7.
- Still reserved/awaiting, untouched: P-SL-IMBALANCE (no packet; operator datum
  recorded in BUILDER_RESULT_T162-SLREF §5), RECON scale-out window choice
  (operator's word moves it), debris deletion word, snapshot token.
