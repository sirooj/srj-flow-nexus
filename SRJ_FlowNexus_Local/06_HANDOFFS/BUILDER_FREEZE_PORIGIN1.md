# P-ORIGIN-1 FREEZE (pre-execution record — frozen before the diagnostic run)

Packet: Astra-1 issuance (`06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md`), print-only,
`InpAdoptExt1=false` throughout. Base: dormant Rev075 EA
`4FCAF215…` (426922 B). E49 restoration DONE (18b, not re-spent); Sep-8
entry condition MET (Addendum 4); run-B delta suspended untouched.

## 1. Declared executable rule (the documented second-swing rule)

`SrjSecondSwing`: walk BACK in time from the entry bar over the FRACTAL
swing buffer only (SWING_HIGH for SHORT, SWING_LOW for LONG — triangle
markers per the standing swing-definition correction), nearest first.
Skip swings failing the ladder's own protective test
(`SlimbProtectiveSideOk` vs the candidate entry px — same idiom as the
ladder/SrjResolveExt1, no new predicate). Count protective swings in
time order: 1st = skip-witness (printed, never the stop — his stated
"first swing (skip)"), 2nd = candidate stop (px/slot/barTime + imb read
at its slot). No imbalance term anywhere in the count (his rule states
none; adoption carries none). Walk cap = `SRJ_LAD_ABS_SLOT_CAP` (same as
SrjResolveExt1). Fewer than 2 protective swings in cap = UNDEFINED =
gate failure for that example (missing is failure, never zero).

Deliberately NOT equated to `rungExt 1` (Astra §5): this is a
time-ordered count, a different walk from the extremity walk. Same
origin, different rule — the regression gate tests rule-vs-rule.

## 2. Residual and identity conventions (existing, unchanged)

residPts = round((observedPx − expectedPx) / _Point), NO side
normalization (same as SLEXT1 eResid). Full identity =
slot+barTime+px+imbCode, all four must match. barDiff informational only.
GATE = retain: diagnostic must reproduce the CURRENT reproducing identity
exactly (including R5's standing −1 vs filed — retained, not improved).
Both resids print (vs-expected gated, vs-filed reference).

## 3. Regression freeze (expected = current reproducing identity, RECON18 SLEXT1)

| ID | S5 bar | dir | HAND entry px | entry barT | expPx | expSlot | expBarT | expImb | filedPx | filedProv | feed | prior evidence |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| R1 | 2026.08.28 10:00 | SHORT | 1.16466 | 2026.08.28 10:05 open | 1.16508 | 42 | 2026.08.28 06:30 | 0 | 1.16508 | HAND-conf | Dukascopy | R18 PROVISIONAL_MATCH r0 (INFERRED token; HAND-confirmed post-build) |
| R2 | 2026.09.04 10:35 | SHORT | 1.16265 | 2026.09.04 10:40 open | 1.16299 | 13 | 2026.09.04 09:30 | 2 | 1.16299 | HAND | Dukascopy | R18 ext1 = his SL (recovery; NOLEVEL row) |
| R3 | 2026.09.04 15:55 | LONG | 1.16018 | 2026.09.04 16:00 open | 1.15847 | 5 | 2026.09.04 15:30 | 0 | 1.15847 | HAND | Dukascopy | R18 MATCH r0 |
| R4 | 2026.09.07 09:15 | LONG | 1.16135 | 2026.09.07 09:20 open | 1.16098 | 7 | 2026.09.07 08:40 | 0 | 1.16098 | HAND | Dukascopy | R18 MATCH r0 |
| R5 | 2026.09.07 16:40 | LONG | 1.16261 | 2026.09.07 16:45 | 1.16238 | 7 | 2026.09.07 16:05 | 0 | 1.16239 | HAND | Dukascopy | R18 ABSORBED r−1 (RETAINED as-is) |

Entry sources: R1/R3/R4 opens + R4 09:20 open (`BUILDER_FINDING_SEP7_CHARTREAD.md`
Agreed/§Aug28/§Sep4/§Sep7AM); R5 1.16261@16:45 (chartread Agreed: SIGNAL
bid = SLIMBR entry, "perfect"); R2 1.16265 (Addendum 2 + recovery record).
All five entries are signal-bar opens = the S5 strict next-open by
construction (open of a bar is single-valued) — the candidate binding is
mechanical, no guessing. Missing/ambiguous mapping blocks execution: none
— all seven bindings below resolve from the frozen record.

Pre-declared gate: PASS iff regN=5 and regFail=0 (5/5 full-identity +
resid-vs-expected 0). Else candidate dies, Sep-8 NOT REACHED (graded, not
scored; in-run Sep-8 rows print SKIPPED).

## 4. Forward freeze (targets from frozen evidence, scored ONLY on regression PASS)

| ID | eval bar (S2POLL) | HAND entry px | entry barT | targetPx | targetSlot | targetBarT | targetImb | feed |
|---|---|---|---|---|---|---|---|---|
| T1 | 2026.09.08 10:10 | 1.16205 | 2026.09.08 10:10 open | 1.16258 | 83 | 2026.09.08 09:40 | 0 | Dukascopy |
| T2 | 2026.09.08 17:00 | 1.16220 | 2026.09.08 17:00 open | 1.16274 | 3 | 2026.09.08 16:20 | 1 | Dukascopy |

Target identity source: code's 16:40 SHORT ladder rows (RECON18 archive:
rung 4 slot 83 ext −1 barTime 09:40 px 1.16258 imb 0; rung 0 slot 3 ext 0
barTime 16:20 px 1.16274 imb 1) — same ReadFlow frame assumed; a
systematic slot-frame offset would fail the gate honestly and visibly.
Entries per Addendum 2. New forward gate: both resid 0 + frozen full
target identity, each independently. E46 (−7/+85) stays the closed record.

## 5. Site-origin manifest (frozen)

| Site | Role | Existing binding | Candidate binding | Memo relationship |
|---|---|---|---|---|
| S5-direct (`ComputeSlReference` site=S5) | compute (firing path) | stamped strict next-open `iOpen(barShift−1)` | frozen HAND entry px of the evaluated example bar (§3); UNBOUND all other bars (no fallback; diagnostic rows only at example bars) | none (never touches memo) |
| S2POLL (`SlRefMemo`→COMPUTE) | compute + memo write | eval-bar close `iClose(barShift)` | same rule (T1/T2 entries at their bars; UNBOUND else) | writes gen-stamped entries |
| S3ARM (`SlRefMemo` COMPUTE/HIT) | compute + memo write/read | eval-bar close | same rule (no example bars at S3ARM — candidate never resolves here; stated, not assumed) | writes on COMPUTE, reads on HIT |
| memo-write (COMPUTE stamp) | write | — | — | carries computing site + origin name + resolved px + genID; keys/lookup/replacement untouched |
| memo-read (HIT, S5-probe) | read | — | — | HIT reports requesting site + requested origin vs stored site + stored origin + supplying genID + key + returned identity + AGREE/DISAGREE |
| reporting (SLEXT481/43/47, new ORIGIN* classes) | report | — | — | read-only |

Reconciliation to print (ORIGINPROV_FINAL): SLEXT481 by site (expect
S5=10/S2POLL=432/S3ARM=39) + memo COMPUTEs by site + HITs by site with
the statement 471 computes + 10 S5-directs = 481 invocations, 118 HITs
non-invoking; every HIT traceable off-run via supplying genID.
