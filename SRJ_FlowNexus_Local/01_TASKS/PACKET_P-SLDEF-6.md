# BUILD PACKET P-SLDEF-6 — ISSUED (RESCOPE-2 verdict 2026-09-13, transcribed)

Transcribed by builder from the council verdict 2026-09-13 (RECON16b
ACCEPTED). STATUS: ISSUED — NOT BUILT. Build starts post-compact (never
mid-packet). First packet that edits inside `ComputeSlReference`: the
instrument must be strictly additive there and the join is the proof.

Print-only. **`slToday` must not move. No existing reference definition
may change. No selection may change. MTEXIT stays 4.**

## E41 — `slExt1` at all 481 invocations

1. Computation moves inside `ComputeSlReference`, both branches, every
   invocation. Additive only — no existing local, return path, or memo
   interaction altered.
2. **Ladder origin ruled and printed.** At S5 the origin is the entry bar,
   unchanged. At S2POLL and S3ARM the origin is the evaluated bar's
   prospective entry — whatever price origin the live R computation at
   that site already uses. Emit `ladOrigin`, `ladOriginBarTime`,
   `ladOriginSite` on every invocation. **Halt condition:** if no origin
   is available at a site, halt and report — do not substitute the
   evaluated bar.
3. `ext1Defined=0` named with the deepest available ext where ext-1 does
   not exist. Never a fallback price, never silent.

## E42 — relocation falsifier

The ten S5 `slExt1` values reproduce RECON16b **bit-identical**, keyed
`bar|site`. A miss means the relocation changed the computation and halts
with operands. Same standard as the OB-limb join.

## E43 — memo propagation

`ext1MemoAgree`: where an S5 evaluation takes a memo hit, compare the
memoised `slExt1` against a freshly computed one at S5 on the same row.
Report agreement count over the 118 hits. Disagreement is not a halt —
it sizes adoption's blast radius.

## E44 — Sep-8 targeted probe

Ladder plus `slExt1` at the two named bar times (10:10 → 1.16258,
17:00 → 1.16274), hardcoded, print-only, provenance `HAND`. Residual and
barDiff per row, or `NO_LADDER` with cause. If the 481-site shadow already
covers those bars, report redundant rather than emitting twice.

## E45 — token splits and naming

1. `OFF_LADDER` and `EXT_NONE` as distinct statuses; `noneAge` only on
   `OFF_LADDER` rows with slot and barTime.
2. `ladObligN` and `ladCovers` populations named in `FRAME_NOTE`; 9/08
   reports `VACUOUS_COVER` + `EXT1_UNCOVERED`.
3. `carveFired` from the predicate authoritative; consequence-difference
   count reported separately, labelled proxy.
4. `filedT` printed per filed level (Aug-28 now 06:30 HAND — barDiff stops
   resting on inspection).

## Gates

Full window, pilot ini unchanged, 3168 / 563338. Gates 1–4 and 12–15 as
in P-SLDEF-5 verbatim, FlowLogic `3606BFB4…` unchanged, gate 2 in full
(four-signal set verbatim).

5. Tenth inert join (LOAD-BEARING): `SLIMB`/`SLIMBWALK`/`SLIMBWALKF`
   481/481, `SLIMBR` 10/10 vs 11b, deltas+classes. Any movement halts.
6. `slExt1` on all 481 invocations or `ext1Defined=0` named. `ladOrigin`
   every invocation, `ladOriginSite` histogram 432/39/10.
7. E42: ten S5 rows bit-identical to RECON16b.
8. `ext1MemoAgree` over 118 hits, ungated, disagreers named.
9. E44 per row with residual, barDiff, provenance.
10. Gate 8 restated: predicate authoritative. `OB 4 / fractal 3` record.
11. `OFF_LADDER`/`EXT_NONE` split; RECON16b `NONE=4` is the record.
12. `LINEWIDTH truncated = 0` all classes. Data `BADFMT = 0`.

Halt rather than substitute on E41.2, gate 5, gate 7.

## Off-log, no rerun (builder-owed, carried)

- 16b purity/boundaries ✓ stated in AGENTS §11.23 (purity 1/4/481, SHA
  4740FA3B, 17954 lines, bounds [80330..98283]).
- Gate 8 restated from 16b ✓ (OB predicate 4 / fractal 3; companions 0/3).
- Opposed×PASS cross-tab ✓ (opp1/PASS = 1 row: 15:55 — concentration
  unique; full table in result file).
- 9/08 VACUOUS == covers=0 row ✓ (same bar; covers over seven incl ext1,
  obligN over six walk refs).
