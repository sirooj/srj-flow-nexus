# BUILD PACKET P-SLDEF-1b

Five edits. Print-only. **Selection code identical to RECON11 — no selection may change, and no reference definition may change.** Expected result: RECON11's OB limb reproduces bit-identical on the `bar|site` join, plus repaired fractal limb, plus previously-truncated tokens present.

Issued on council verdict session 2026-09-12: RECON11-SLDEF BLOCKED stands (gate-4 sideViolations=26 all fractal-side; walk-line truncation ~537 chars). RECON10 remains the frozen baseline. Nothing reverted, nothing commits on RECON11.

## E15 — line split and width audit

1. `SLIMBWALK` = OB limb, `class=` retained. `SLIMBWALKF` = fractal limb, `fracClass=`. Each carries its own `fields=` token and its own `barTime` tokens. Both under cap.
2. `LINEWIDTH` per class per the form above, measured pre-write. `truncated` nonzero halts.
3. Token-collision audit reported once.

## E16 — fractal anchor side guard

1. Task-75 side-guard expression reused verbatim. **Halt condition:** if the guard cannot be applied without duplicating the expression, halt and report.
2. `fracAnchorRawShift`, `fracAnchorRawSide`, `fracAnchorGuardApplied` retained as tokens. The pre-guard anchor is never overwritten in the log.
3. `sideFracViolations` post-guard, reported and gated.

## E17 — gate-6 tokens restored

All four `outward*Pts` tokens present on their respective limb lines, raw `delta*Pts` retained beside them with unchanged names and signs. `FRAME_NOTE` states all three conventions: slot frame, apex frame, protective sign.

## E18 — carve-out operand print

On every `SLIMBR` row with a fired carve-out, both limbs: retained reference, newer swing, its apex `barTime`, wick extreme, body extreme through `ApexShift`, both comparison results.

## E19 — N1 verdict pairing

Each equality counter paired with its resulting verdict. No comparison changes.

## Gates

Full window, pilot ini unchanged, 3168 / 563338.

1. Both compile clean under `#property strict`. FlowLogic digest unchanged — a change halts.
2. All RECON10 identities verbatim, including PROMO 469 full-segment, `WS161` fields **21**.
3. SLIMB 481, 432+39=471, S5 10, avail / apex / chosen 481/481.
4. **OB limb reproduces RECON11 on the `bar|site` join, 481/481 identical** including deltas and classes. This is the no-fork invariant re-proven after the split; a miss means the split moved the OB limb and halts.
5. `sideViolations = 0` OB. `sideFracViolations = 0` post-guard. `fracAnchorGuardApplied = 26` exactly — any other value halts with the row list.
6. `count(outwardBasePts < 0) = 0`, `count(outwardNuancePts < 0) = 0`, both with nonzero row counts present. `outwardFrac*` sign distributions reported, unconstrained.
7. `LINEWIDTH truncated = 0` all classes.
8. `fracClass` agreement between `SLIMBWALKF` and `SLIMBR` on every shared `bar|site`.
9. `UNRESOLVED = 0`, `UNCLASSIFIED = 0` both limbs. Cross-tabs in full, falsifier zero both limbs.
10. Sep-7 S5 row prints `entry` / `tp` / `sl` / both R terms and the full carve-out operand set.
11. `SLIMBR` 10 rows, DECISION block five columns, S5 carve-out counts per limb.
12. Sampled-day spot check identical to RECON10.
13. New EA SHA256 + byte size, FlowLogic digest re-stated unchanged, archive method recorded. No commit until 2 through 12 pass.

Halt rather than substitute on E16.1, gate 4, gate 5, gate 7.

## What closes after this run

The decision block, with the framing corrected: the operator is choosing whether ruling (c) holds the stop, and the anchor is the mechanism that makes a reference available to be held. Five columns, four signals, R and outward points, threshold 1.00 quoted beside them, and the carve-out operands for the one row where his own arithmetic lives. Then he rules, and the next packet is a single selection change with its consequences already on paper.

---

# Council rulings recorded with this packet (verdict session 2026-09-12)

- BLOCKED stands; no-fork proven by the 481/481 join (two-directions standard); gate 6 unverifiable this run (carried forward untested); gate 1/2/3, OB gate 7, gate 10, DIR, FRAME_NOTE+THRESHOLD, N1 counters, SLIMBR/DECISION discharged.
- Gate 4 restated per limb (OB `sideViolations` 0; fractal `sideFracViolations` 0 post-guard; `fracAnchorGuardApplied` expected exactly 26); Q2 overturned on the fractal limb only; guard = Task-75 expression verbatim with raw tokens retained; decision surface unaffected (all 26 S2POLL).
- Split approved (`SLIMBWALK` OB / `SLIMBWALKF` fractal, own `fields=`/`barTime`/counters); `class=` stays OB (join key + RECON10 diffability); `fracClass` on both fractal line and SLIMBR with agreement gate; LINEWIDTH pre-write per class, nonzero halts; token-collision audit (class/fracClass grandfathered, leading-space scoping mandatory).
- Binary re-framed: anchor reproduces nothing (slFractal == slBase == 1.16112 on Sep-7); the carve-out is the whole difference (slFractalNuance 1.16240, fracClass=CARVEOUT_FIRED). Operator chooses whether ruling (c) holds.
- Gate 8: literal MISS stands, spirit confirmed (stop 1.16240 vs 1.16239 = rounding); R gap NOT on tolerance (2.45 vs 2.56 ≈ 2.5pts in one operand) — operands to operator, no code moves. E13.3 "one zone each" rejected (opposite signs, unequal magnitudes); single bars stand, labels his to confirm; stays blocking-before-adoption + news-relevant.
- N1 counters accepted (28/26/0/3); N1 = "equality encountered 57 times, strictness read in source," NOT "confirmed non-invalidating," until verdicts paired.
- Manual-archive TIMEOUT path: record archive method with digests.
- NEWS: table pinned (5FFF5C76…EF1F134); rows stay `{eventTimeET, kind}`, conversion at read, per-row resolved bar emission required before exit side moves.

---

STATUS: ISSUED (P-SLDEF-1b: E15 line split + width audit, E16 fractal guard, E17 gate-6 restore, E18 carve operands, E19 N1 pairing; print-only; selection code frozen at RECON11).
Filed by builder to `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-SLDEF-1b.md`.
