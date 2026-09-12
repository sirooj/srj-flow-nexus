# PACKET P-SLDEF-1 — issued (council verdict session 2026-09-12: P-SWINGIMB-3 ACCEPTED, correct-under-conservative)

RECON10 is the new frozen baseline. Local commit cleared. Do not hold on
the origin push — backup tag plus verified local custody is sufficient,
and credential refresh is operator-latency.

Both open items are closed by the operator owning the mis-input, and I want
the closure recorded in the right shape: the conservative walk was never in
question mechanically, it was in question against a hand record that turned
out to be wrong. The code's answer at 1.16112 / R 0.36 is correct **under
the creation-side imbalance definition**. That is a statement about the
definition, not a vindication of the definition.

## The R table reads as a structural property, not a surprise

Every firing row lost R: 2.43→2.17, 2.56→1.53, 1.76→1.07, 1.25→0.36. That
direction is forced. Under E8 the walk seeds at the chosen swing and only
ever moves to strictly more extreme price, so `slBase` is never tighter
than `slToday` and `R_base ≤ R_today` by construction. `slNuance` is
either `slBase` or the retained inward reference, so it is bounded the
same way. The R table can therefore only ever show cost. Magnitude and
threshold crossings are the whole content.

Two things I want reported off the existing logs, no rerun:

- `count(deltaBasePts < 0)` and `count(deltaNuancePts < 0)`, both expected
  0. RECON9 carried 152 tighter-direction cases and RECON10 says they were
  absorbed or re-resolved, but the sign was never printed as its own
  count. If either is nonzero the extremity filter leaked and the
  accounting in gate 6 is hiding it.
- The live minimum-R value from the pilot ini, and which of the four
  firing rows cross it under `slBase` and under `slNuance`. Today's four
  fired at R ≥ 1.25, so the threshold is at most 1.25; I will not infer it
  further. "The Sep 7 signal dies" needs to be a comparison against a
  quoted number, not a narrative.

## Governance ruling — the manual journal is no longer an oracle

The Sep-7 redirect was driven by a hand record that proved to be a
mis-input. Standing rule from here: an operator hand journal may motivate
an investigation, never adjudicate one, and may not be used as a baseline
oracle without a second independent source (a chart level plus a log line,
or two log lines from different directions — the same standard already
applied to the 432+39 reconciliation). This costs nothing and it is the
second time an instrument was nearly redirected by a frame or entry error
rather than a defect.

---

# Ruling — the binary definition: DO NOT CHOOSE YET. MEASURE BOTH.

The decision is the operator's. My ruling is on the work, and the work is
not a definition packet — it is one more column.

**Why not decide now.** The only evidence for fractal-only was the Sep-7
hand record, and that evidence has been withdrawn by its author. Deciding
a definition on an instance whose supporting measurement just evaporated
is exactly the failure this method exists to prevent. There is no cost to
measuring: the builder says the walk machinery is definition-agnostic and
only the anchor changes, and the fractal anchor is **already exported and
already printed** — `latest*` in SLIMB is the freshest confirmed
protective-side swing from `FindNearestSwing`, with its flag and its apex
check both at 481/481. So the fractal-anchored reference costs zero
FlowLogic edits, zero new buffers, and no change to the positional
`iCustom` surface. A definition that can be measured for the price of one
token set does not get ruled on argument.

**Council reading of the operator's own rulings, offered as input to his
decision.** Ruling (a) is verbatim about swings: "one swing or two swings
away … more extreme price level to place the SL." Ruling (b) is about
walking to "the next swing that has an imbalance." Ruling (c) introduces
the OB only as a *validity condition* — "if there is an OB with imbalance
but it has not been invalidated" — and then still places the stop at "the
one swing away." In all three rulings the OB gates and the swing anchors.

The census now shows that gating role is already fully consumed
elsewhere: branch ⟺ `obValid` is deterministic in-window, 441 valid →
1-swing, 40 dead → 2-swing, off-diagonal zero. So OB validity already
decides the branch. Using the OB's own swing extreme (buffer 27) as the
*price* anchor spends the OB a second time, on a job the operator's
rulings give to a swing. That is the strongest argument for the fractal
anchor, and it is an argument from measured structure rather than from
one instance.

I am not converting that into a ruling. It goes to the operator with a
four-column R table beside it.

**What the operator will be choosing between, stated plainly so the
choice is informed:** `slToday` (OB-anchored, no imbalance term — what
ships today), `slBase` (OB-anchored, imbalance-qualified walk — his rule
as literally ruled), `slNuance` (base plus the wick carve-out),
`slFractal` (fractal-anchored, same imbalance-qualified walk, same
carve-out). Four references, one run, one table, four firing rows.

## The 15:15 / 14:55 footnote is upgraded: non-blocking for RECON10, BLOCKING before adoption

Prices agreeing at 1.16218 while the bar labels disagree by four M5 bars
is not a footnote. It is an unverified price-to-bar mapping on the exact
bar a candidate stop would come from, in a file where a frame error has
already produced one false negative (RECON7's `iHigh(s)`) and one wrong
classifier (the `W|B` body extreme). The level may well be right; the
*provenance* is not established, and provenance is what a definition
ruling rests on.

Resolve it to a named frame, do not reconcile it in prose. Requirement is
in E13. No definition may be adopted as selection while that discrepancy
is open.

---

# Ruling — N1: CONFIRMED as correct-as-coded, with one boundary

"A candle equal to VWAP/POI does not invalidate" is the correct semantic
and the code already implements it if the invalidation comparisons are
strict. No packet. Two constraints on how it may be quoted:

- **It is a code-read, not a measurement.** Ground it in operators: name
  the comparison expression at each invalidation site (POI body break,
  VWAP break, POC break) in the confirming note. "Equality survives" is a
  property of `>` versus `>=`, and that is checkable in one line each.
- **Separate the discrete levels from the continuous ones.** Equality
  against a POI level derived from a bar extreme is reachable and must be
  counted. Equality against a computed VWAP is effectively unreachable in
  float, so the ruling there is vacuous today and must be recorded as
  "unexercised in window," never as "verified." If the in-window equality
  count is 0 at every site, N1 is confirmed in intent and unexercised in
  fact, and that is the honest wording.

"Sep 7 fired and won" is not evidence for N1 — that signal firing is
consistent with equality never having occurred. Counters in E14 settle it.

---

# BUILD PACKET P-SLDEF-1

Four edits. Print-only, shadow-first. **No selection may change.** No
FlowLogic edit. Expected result is an in-window no-op on every measured
identity, plus one widened line class and one rider tally.

## E11 — `slFractal`, fourth reference

1. **Parameterize the anchor; do not fork the walk.** One walk
   implementation taking the anchor swing (shift + flag) as arguments,
   called twice per invocation: once with the chosen swing, once with the
   latest confirmed protective-side swing. **Halt condition:** if the walk
   cannot be parameterized without duplicating its body, halt and report.
   Two copies of a walk is two rules.
2. Anchor for `slFractal` is the `latest*` swing already printed in
   SLIMB — same eval shift, same `ReadFlow` frame, same `ApexShift` for
   every price read of that bar.
3. Identical semantics to `slBase`: extremity filter via the `SL_STRUCT`
   `exceeds` idiom, code 0 and code 2 walked past and both updating the
   running extreme, code 3 terminating, zero-step explicit when the anchor
   itself carries code 1.
4. Carve-out applies to the fractal limb too, producing
   `slFractalNuance`. The carve-out is part of the operator's rule, not
   part of the anchor choice, and dropping it on one limb would make the
   two columns incomparable.
5. New tokens on the SLIMBWALK line, appended after the existing set so
   RECON10 stays diffable on its own tokens: `fracAnchorShift`,
   `fracAnchorFlag`, `slFractal`, `slFractalNuance`, `deltaFracPts`,
   `deltaFracNuancePts`, `fracWalkSteps`, `fracCode3Seen`,
   `fracExtUpdatedByNonQual`.
6. `sideViolations` extends to cover both new references against
   `slCurPx`. Gate stays 0.
7. Class totality holds. The three-boolean mapping becomes a documented
   mapping over the relations that now exist; every cell believed
   unreachable is `UNCLASSIFIED`, never a neighbour's name.

## E12 — SLIMBR: the four-column decision table

At `site=S5` only, extend the existing row to carry `sl` / `R` /
`deltaPts` for all four references plus the two nuance variants, and the
class token. Ten rows, four of them the firing set. Same instrument-owned
file-scope shadows, same staleness refusal, same hard boundary: not in
`ResetSequence`, not in the working set, no gate reads them, **`WS161
fields` stays 21**. A `fields=22` is a packet failure, not a finding.

Emit the four firing rows a second time as a standalone
`SLIMBR_DECISION` block at the end of the run, one row per signal,
columns `today | base | nuance | fractal | fractalNuance`. That block is
the artifact the operator reads; it is not a new measurement, it is the
same numbers formatted for a decision.

## E13 — frame and label reconciliation

1. Print server-time `barTime` beside every shift token already emitted
   by SLIMB, SLIMBWALK and SLIMBR. Shifts keep their names and stay in
   `ReadFlow` frame — **do not renumber them.**
2. One `FRAME_NOTE` line, once per run, stating `FLOW_SHIFT_OFFSET`, the
   `ApexShift` relation, and the log's label convention against server
   time.
3. Resolve the Sep-7 anchor to a single bar with its `barTime` printed.
   **Halt and report** if the 15:15 / 14:55 discrepancy does not resolve
   to one bar under one named convention. Do not adjust a price to make a
   label fit.

## E14 — N1 equality counters, rider

At each invalidation comparison site, count equality encounters without
branching on them: `poiEqBody`, `poiEqWick`, `vwapEq`, `pocEq`. Print in
the existing deinit/progress tally, and record the comparison operator at
each site in the adjacent comment so the claim is grounded in source. No
comparison changes. If every counter is 0, that is the finding, and N1 is
recorded as unexercised in window.

## Gates

Full window, pilot ini unchanged, 3168 / 563338.

1. Both compile clean under `#property strict`. FlowLogic digest
   **unchanged** from RECON10 — this packet touches no indicator file,
   and a changed FlowLogic digest halts.
2. All RECON10 identities verbatim: CQD 906; WS161 **21**/205/0; SLMEMO
   471/118/589; SL_REF 432/39/10; INPLAYCOMMIT 157/46; MTEXIT 4; aborts
   18/37/13/11/2/0/12; PROMO 469; CONFIRMPOLL 555; SUPPRESSED 156.
   Four-signal set verbatim.
3. SLIMB 481, 432+39=471, S5 10, avail 481/481, apex 481/481, chosen
   exposure 481/481.
4. SLIMBWALK 481. `UNRESOLVED = 0`, `UNCLASSIFIED = 0`, `sideViolations =
   0` across all four references. Any nonzero halts with its operands.
5. `slFractal` resolved 481/481, or a named residual with its cause.
   `fracAnchorFlag` histogram reported.
6. Sign gates, reported as counts: `count(deltaBasePts < 0) = 0`,
   `count(deltaNuancePts < 0) = 0`. `deltaFracPts` is **unconstrained in
   sign** — the fractal anchor may be tighter than today, that is the
   point of measuring it — but its sign distribution is reported.
7. `chosenFlag × class` cross-tab in full, plus `fracAnchorFlag ×
   class`. Falsifier `count(anchorFlag==1 AND class==BASE_MOVED) = 0` on
   both limbs.
8. Hand cross-check: the Sep-7 16:45 row reproduces the operator's
   arithmetic — `slFractal` at the 16:15 low with `R ≈ 2.45` — within a
   stated tolerance, with `barTime` printed. A miss here halts and is
   reported with operands; it does not get absorbed.
9. `FRAME_NOTE` present, Sep-7 anchor resolved to one bar.
10. Sampled-day spot check: `INPLAYCOMMIT`, `XOBPROMO`, `SWEPTMASK`
    identical to RECON10.
11. New SHA256 + byte size for the EA, FlowLogic digest re-stated
    unchanged. No commit until 2 through 10 pass.

Halt rather than substitute on E11.1, E13.3, gate 4, gate 8.

## What closes after this run

The operator gets one table: four signals, five references, R and point
deltas, with the live minimum-R threshold quoted beside it so the
survival consequence of each definition is visible rather than inferred.
He picks a definition. The next packet after that is a **selection**
packet — a single anchor flip with its R consequences already measured —
not another instrument. If he picks conservative, the imbalance line
closes with an export and no selection change, exactly as scoped at
P-SWINGIMB. Either way the imbalance work has one run left in it.

---

# NEWS

Sequencing unchanged: BLACKOUT membership census, then exit side with
MTEXIT re-frozen after it, then entry side against the four-signal set,
all after imbalance. Three flats stay three verdicts. The window stays
derived from `{eventTimeET, kind}` and `PeriodSeconds`, never stored.

The static event table is now the critical-path item, not a parallel
one. The imbalance line has exactly one run left, and the table needs
human review latency that will otherwise land after RECON11 finishes. Put
it in front of the operator now: CPI, NFP, FOMC rate decision only,
`{eventTimeET, kind}` per row, pilot window plus whatever forward span he
wants, its own SHA256 recorded alongside the file digests, derived from
the same timestamp anchor he uses for the FOMC VWAP/POC. One note that
E13 makes newly relevant: the table's timestamps and the log's labels
must be reconciled under the same named convention `FRAME_NOTE`
establishes, or the blackout census will inherit the label ambiguity we
are closing this run.

---

STATUS: ISSUED (council verdict session 2026-09-12: P-SWINGIMB-3 ACCEPTED
correct-under-conservative, RECON10 frozen baseline, local commit cleared;
P-SLDEF-1 four edits E11-E14, print-only, no FlowLogic edit).
Filed by builder to `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-SLDEF-1.md`.

---

# AMENDMENT (council session 2026-09-12: gate-6 restatement + reports)

## Gate 6 — council's error, restated (builder's flag accepted)

Gate 6 as issued assumed a normalized sign the SLIMBWALK line does not
print. Raw `deltaBasePts < 0` on LONG is a wider protective stop — the
intended outcome. RECON10's gate 6 is discharged as measured (direction-
aware leak 0 both sides). Replacement for P-SLDEF-1: print the normalized
quantity as its own token, `outwardPts = (dir == LONG) ? -deltaPts :
+deltaPts`, emitted as `outwardBasePts`, `outwardNuancePts`,
`outwardFracPts`, `outwardFracNuancePts` alongside the existing raw
`delta*Pts` tokens (raw keep names and signs — no renumber, no re-sign).
Gate: `count(outwardBasePts < 0) = 0` and `count(outwardNuancePts < 0) =
0`, halts on nonzero with operands. `outwardFrac*` unconstrained in sign,
distributions reported. `dir` histogram reported, summing to 481.
FRAME_NOTE states all three conventions (slot frame, apex frame,
protective sign) next to FLOW_SHIFT_OFFSET and ApexShift.

## Minimum-R — quoted 1.0 + THRESHOLD line + margin flag

`InpMinRewardRisk = 1.0` compiled default, no ini override; crossings at
1.0 (base 2.17/1.53/1.07 survive, 0.36 dies) accepted as quoted. Hazard:
unpinned compiled default governs the decision — do NOT touch the pilot
ini; print the effective value at runtime once per run in FRAME_NOTE as
`THRESHOLD minRewardRisk=<value> source=<ini|compiled_default>`. Flag the
1.07 row in the decision block (closest survivor, most sensitive to
reference/rounding change).

## Nuance unexercised at the decision surface — added gate

`nuance == base` on all four firing rows; carve-out fires in-population
(106/481) but changes no fired signal. Choice is today vs base vs
fractal. Added report: `CARVEOUT_FIRED` count restricted to the 10
`site=S5` rows on BOTH limbs (fractal carve-out may fire where OB does
not — first evidence ruling (c) has live content, or record unexercised).

## News table — accepted as pinned + conversion ruling

11 rows / 5FFF5C76…EF1F134 / 21:00 anchor accepted. Rows stay
`{eventTimeET, kind}`; conversion at read; blackout census emits per-row
ET timestamp + resolved server-time `newsBar` open + window bounds (DST
boundary rows individually auditable). Table digest changes are revisions
with new SHA256, never in-place fixes. FRAME_NOTE covering table
timestamps is a stated requirement.

## PROCEED

P-SLDEF-1 cleared to build with gate 6 restated + three added reports
(`dir` histogram, THRESHOLD line, S5 CARVEOUT_FIRED both limbs). All else
stands, halts on E11.1, E13.3, gate 4, gate 8. One run left; output is a
table; next packet is a decision.
