# BUILDER FINDING — P-ORIGIN-1 desk measurements D1 + D2 (Opus-declared, dual-key compliant)

No build, no run, no token. Pure reads of frozen material (FREEZE file,
RECON19 tabulation/rows, HAND findings). Compliant with Astra-2 ("no
further build or run authorization") and ordered by Opus ("D1 and D2 are
reads of material you already hold"). Wording correction adopted:
regression reads "matches 2/5; fails 3/5" (Astra-2 §1).

## D1 — filedResid column (diagnostic-observed vs HAND-filed) + HAND carriage

| ID | observed (diagnostic 2nd-back) | HAND filed | filedResidPts |
|---|---|---|---|
| R1 | 1.16481/s3/09:45/i0 | 1.16508 | −27 |
| R2 | 1.16299/s13/09:30/i2 | 1.16299 | 0 |
| R3 | 1.15847/s5/15:30/i0 | 1.15847 | 0 |
| R4 | 1.16103/s3/09:00/i0 | 1.16098 | +5 |
| R5 | 1.16239/s5/16:15/i0 | 1.16239 | 0 |

Observed values: RECON19 ORIGINREG rows (tabulation verbatim). Filed
values: frozen HAND record (Addendum 2–4 + chartread).

Whether HAND filed stops carry barTime/slot (Opus's unknown): px ALWAYS
(all seven); barTime SOMETIMES — filedT present for R1 (06:30) and R5
(16:15) only, absent ("-") for R2/R3/R4; slot NEVER (code-frame indices,
not a human observable); imbCode OCCASIONALLY as words (R2's "imbalance"
↔ imb 2 corroborated; Sep-8 10:35 same; no imb words on R1/R3/R4/R5).
So R5's filed hit CAN be promoted past price-only on barTime (16:15
matches at 1-point... at full identity minus slot: px+barTime agree,
slot 5-vs-unstated, imb 0-vs-unstated) — but both models already ruled
retain stands for this test; filed here as the answered unknown, NOT as
a reopening (no regrade per both verdicts).

## D2 — entry-to-retained-origin distance, full HAND set

Convention stated: minutes/bars from the FROZEN entry event (entry barT)
to the retained stop barT (current reproducing identity); slot = retained
ext1Slot. (Opus's figures 210/65/25/35/35 measure from the eval bar —
same data, 5-minute shift; both stated so either is reproducible.)

| example | entry → retained | minutes | M5 bars | slot |
|---|---|---|---|---|
| R1 Aug-28 | 10:05 → 06:30 | 215 | 43 | s42 |
| R2 Sep-4 10:35 | 10:40 → 09:30 | 70 | 14 | s13 |
| R3 Sep-4 15:55 | 16:00 → 15:30 | 30 | 6 | s5 |
| R4 Sep-7 09:15 | 09:20 → 08:40 | 40 | 8 | s7 |
| R5 Sep-7 16:40 | 16:45 → 16:05 | 40 | 8 | s7 |
| Sep-8 London (entry→filed; NO retained — unmapped) | 10:10 → 09:40 | 30 | 6 | — |
| Sep-8 NY (entry→filed; NO retained — unmapped) | 17:00 → 16:20 | 40 | 8 | — |

Outlier test: R1 (215 min / 43 bars) vs the rest (30–70 min / 6–14
bars) — 3× the next-deepest (R2), 5–7× the 30–40/6–8 cluster that
contains R3/R4/R5 AND both Sep-8 filed placements. R1 is a depth outlier
on any threshold separating 43 bars from ≤14. Criterion-writing is
council's alone (D2 constraint noted: exclusion must derive from HAND +
retained data, written down before any diagnostic is consulted) —
builder supplies numbers only, no exclusion proposed.

## Filed per Opus Ask-2 (both items)

- Weak-evidence caution LOGGED: HAND stops cluster inside ~40 points;
  1-point price coincidence is not rare enough to carry weight alone —
  standing 4-tuple identity rule re-affirmed by this episode.
- Incumbent defect note FILED (open item on the baseline, owed
  bookkeeping): retained R5 = 1.16238 vs filed 1.16239 — the baseline is
  itself 1 point off the human record at R5. "Retain" and "be faithful
  to HAND" differ here. Does not resurrect the candidate (fails 3/5
  retain; unmeasured on filed for R1–R4 — and D1 now measures filed for
  all five: 0/0/+5/−27/0, which still fails any filed-based gate at
  R1/R4).

## Dual-key agreement log (relay v11 verdicts)

BOTH: kill accepted (matches 2/5); Sep-8 NOT REACHED gated-unscored; E46
closed; retain stands, no reopening/regrade/waiver; provenance +
inertness accepted as reported; per-trade rules refused (Astra: no
exceptions; Opus: lookup-table ruling); HALT stands; run-B delta
suspended; origin unresolved. ASTRA-ONLY: no further build/run incl.
print-only. OPUS-ONLY: D1+D2 (executed here), weak-evidence caution +
incumbent defect (filed here). NO CONFLICT: D1/D2 are reads, compliant
with both.
