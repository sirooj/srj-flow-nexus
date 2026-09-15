# FINDING — CONFIRMATION-GATE CALL SITES (on-disk measurement, read-only)

**Question (Sonnet Track-1 fork, v60 relay):** does chain-98's retest-seed-producer call the existing `IsConfirmationCandle` gate?

**Answer: NEVER CALLED at the seed/write point.** Track 1 resolves to the NARROW branch (integration fix); the shared gate is exonerated.

## Inventory (EA `E68E0AE3…`, 10550 lines, file-wide, case-sensitive)

- `IsConfirmationCandle`: defined EA:2075; referenced EA:2029 (comment only), EA:8163, EA:8300. Four hits total — the complete set.
- EA:8163 = CONFIRM_PREBIND (S3-zone-wait pre-binding promotion to `ST_S5_GATE_CHECK`).
- EA:8300 = CONFIRM-GATE E2 (S4→S5 edge promotion).
- Seed path = `ST_IDLE` block EA:7503+, direction write EA:7529 (`g_dir = S2ResolveLive(...)` from `DetectPoiRetest`, def EA:1889). Zero `IsConfirmationCandle` tokens between EA:7503–EA:7560 (the whole seed sequence incl. anchor/price/session writes).

## Consequences (measurements only, no design)

- Both gate call sites sit ~600+ lines DOWNSTREAM of the seed, in S3/S4 promotion stages. A vote seeded at 09:15 lives through regime/LTF/zone/arm stages before any confirmation predicate runs on it — and the S1 candidate never reached those stages (no S5 rows at Sep-8 bars), so the gate never saw it. This matches his London review (bearish-close bar seeded LONG, never rejected).
- Shared-gate logic defect is OFF the table on this evidence: the gate's two call sites are untouched by any seed-path wiring. No R1/R3/R4/R5 regression-watch expansion is owed by Track 1 beyond the standard watch already carried.
- The fix surface for S1 is the seed path (EA:7503–7529 region): consult the existing gate there. Blast radius = one write point + its promotion consequences (standard isolation join decides).

(End — measured 2026-09-15 on the current digest; builder asserts facts, council authors design)
