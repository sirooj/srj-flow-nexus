# BUILDER_RESULT_RECON11-SLDEF — BLOCKED (gate 4 + instrument line-width defect)

## Run facts

- Packet P-SLDEF-1 + amendment. STAGE-1 EA re-hash before any write:
  `4B2FA10EA263420ED12C83D58B128AA53278A0E78611841B71AA55C4E9E97C8F`
  = frozen RECON10 baseline. No drift.
- Edits (EA only): E11 parameterized core (no fork) + dual-limb emitter
  (+fracShift param, default -1; 3 evaluated call sites pass
  slimb_latShift); fracClass token added per E11.7 (documented);
  outwardBase/Nuance/Frac/FracNuance + skipShiftT/fracAnchorShiftT;
  E13 SLIMB fields=19 with slShiftT/latestShiftT/chosenShiftT +
  FRAME_NOTE + THRESHOLD; E12 SLIMBR 4 references + 2 nuances +
  DECISION accumulator (MARGIN_ROW = min surviving R within 0.10 above
  threshold); E14 four counters at three sites with operator comments.
- Post-write: EA `A58BCB4B18C37D1CEF58B148199C29713D013A2434E587D11122523C9F7283AB`
  (301971 B); FlowLogic `3606BFB4...` UNCHANGED (67515 B).
- Compiles: EA 0/0 (2403 ms), FlowLogic 0/0 (4964 ms). Gate 1 PASS.
- RECON11-SLDEF: launched 14:33:03 (PID 13128, PRE_JOURNAL_LINES=70440).
  Wrapper TIMEOUT_60MIN 15:41:29; terminal continued; `Test passed in
  1:07:01.937` 15:43:45, 563338/3168, `connection closed` — all verified
  in the manually archived segment (lines 70440-87072, SEG=16633; line
  70440 is RECON10's closing line, one-line boundary overlap disclosed).
- Journal: `06_HANDOFFS\RECON11-SLDEF_JOURNAL.log`, LEN=2938760,
  SHA256=`88D90D3AAD544EAB4B7AD77178EF7DA53A5A61489DAA5796A8534DA31FAAA3F3`.
- Tabulation: `06_HANDOFFS\RECON11-SLDEF_TABULATION.txt` (script
  `00_CURRENT_WORKING\tabulate_sldef11run.ps1`, parse-checked).
- Terminal leftover closed forced after archive (hygiene).

## BLOCKED 1 — gate 4: sideViolations = 26, expected 0

Measured on SLIMBWALK fields=39 rows (early token, intact):
`SLIMBWALK_SIDEV_GT0=26`. Gate 4 requires 0 across all four references.
Per §6.8: BLOCKED, no commit, nothing reverted.

Attribution (proof, not argument): OB-limb values (slToday/slBase/
slNuance/deltas/class) joined RECON10 x RECON11 on bar|site:
OB_IDENTICAL=481, OB_DIFF=0. RECON10's total was 0 with identical OB
inputs and identical closes, so OB-limb increments are 0 on every row.
All 26 come from the two fractal increments. The 26 rows (bar|site|dir|
branch T/B/N sideV): 2026.08.26 09:50 S2POLL SHORT 1/2/2 pattern across
13 morning rows; 08.27 18:50/18:55 SHORT; 08.28 15:25 LONG; 09.01 17:40
LONG; 09.08 cluster (09:55-14:10) LONG — full list verified in-journal,
26 rows, all S2POLL/1SWING.

Reading: the fractal anchor (nearest confirmed swing) carries NO
protective-side guarantee — the close can sit inside or beyond the
current turn (the documented iteration-2 phenomenon). Council's Q2
conditional ("redundant GIVEN the anchor is protective-side") holds on
the OB limb (0) and fails on the fractal limb (26). The falsifier did
exactly its job. Builder does not substitute: no per-limb counter was
specified, so no per-limb zero can be claimed either way.

## BLOCKED 2 — instrument line-width defect (builder-owned)

The Tester journal truncates lines at ~537-540 chars (measured: first
walk line LEN=537, tail cuts mid-token "...fracWalkStep"). The fields=39
walk line (~700 chars) loses every token past the cut. NEVER printed
(0 rows): fracClass, outwardBasePts, outwardNuancePts, outwardFracPts,
outwardFracNuancePts, skipShiftT, fracAnchorShiftT. Consequences: gate 5
frac histogram present ✓ (early token) but gate 6 (outward) unmeasurable,
gate-7 fractal falsifier unmeasurable, E13 walk barTimes lost, S5 frac
carve gate unmeasurable from the walk line. SLIMBR (LEN=394) and SLIMB
fields=19 (barTimes 481/481) are intact — the defect is specific to the
39-field line. Builder owns the width; the packet specified one line.

Also noted for the repair: Select-String patterns are case-insensitive,
so `class=` matches `fracClass=` — tabulation must scope with a leading
space or distinct prefixes (RECON11 OB-class counts are clean only
because fracClass never printed).

## PROVEN positives (stand as measured)

- E11.1 no-fork: OB partition identical to RECON10 (51/0/71/200/0/159/
  0/0/0), cross-tab identical, falsifier 0, unmatched 0.
- Gate 2 identities verbatim (CQD 906, WS161 21/205/0, SLMEMO 471/118/
  589, SL_REF 432/39/10, INPLAY 157/46, MTEXIT 4, aborts
  18/37/13/11/2/0/12, PROMO 469 full-segment, CONFIRMPOLL 555,
  SUPPRESSED 156, 4 signals).
- Gate 3: SLIMB fields=19 total 481, BADFMT 0, S2POLL 432 / S3ARM 39 /
  S5 10, avail 481/481 (AVAIL0=0), apex 481/481, chosen 481/481
  (CHOSEN_NEG=0, NOOB=0), S5_NO_SL_REF=0.
- SLIMBR 10 rows, STALE 0, rFractal + fracClass present 10/10.
- FRAME_NOTE present with THRESHOLD minRewardRisk=1.00
  source=compiled_default. DIR histogram LONG=262 SHORT=219 = 481.
- FRAC_ANCHORFLAG histogram f0=318 f1=67 f2=96 — matches the SLIMB
  latestFlag shape; anchor wiring correct. FRAC_RESIDUAL=0
  (slFractal present 481/481; values past the cut aside).
- N1EQUALS: poiEqBody=28, poiEqWick=26, vwapEq=0, pocEq=3. N1 exercised
  in fact at POI body, POI wick and POC; unexercised at VWAP (computed
  double, as predicted). The honest wording council required is now
  measurable.
- DECISION block: 10 rows present.

## Gate-8 hand check — literal MISS, spirit CONFIRMED in the nuance column

Sep-7 16:40 S5 row: fracAnchorShift=2 flag=0, slFractal=1.16112 (NOT the
16:15 low — literal gate-8 spec misses; reported, not absorbed).
slFractalNuance=1.16240, rFractalNuance=2.56 (54/21), fracClass=
CARVEOUT_FIRED (read off the intact SLIMBR line). The operator's
arithmetic (R ≈ 2.45 at the 16:15-16:30 zone) lands in the FRACTAL-NUANCE
column (2.56), not the fractal-base column. First evidence ruling (c)
has live content — on the fractal limb, where the OB limb never fired
it. S5_CARVE_OB=0 (reliable, early token).

## E13.3 barTime resolution (from intact SLIMB barTimes)

Sep-7 S5 SLIMB: slShift=21 slShiftT=2026.09.07 14:55; latestShift=2
latestShiftT=2026.09.07 16:30 (avail=1 apex=1); chosenShift=21
chosenShiftT=2026.09.07 14:55. Under the named convention (barTime =
iTime at ApexShift(s), the code's price-bar belief): code's chosen =
14:55 bar, fractal anchor = 16:30 bar (value 1.16240). Operator labels
15:15 / 16:15 differ by one zone each; prices agree (1.16218 /
1.16239-40). Single bars established; labels remain his to confirm
against his chart. No prose reconciliation performed.

## Proposed repair (NOT implemented — council ruling required)

Split the walk print: OB line (existing 23 tokens + outwardBase/
outwardNuance + skipShiftT; stays under the cap) and fractal line (own
fields=N: fracAnchorShift/Flag, slFractal, slFractalNuance, deltas,
outward pair, walk counters, fracClass, barTimes). Separate side
counters per limb (sideViolations stays OB-only for gate continuity;
sideFracViolations new, reported as distribution — the 26 become the
fractal-side measurement, not a failure). All token names kept; only
the line boundary moves. E11.1 unaffected (print split, walk single).
Request: rule the split + restate gate 4 per-limb (OB 0, fractal
reported) + confirm fracClass token placement on the fractal line.

## Verdict status

No verdict claimable. No commit (this file + queue note are the report).
RECON11 does not supersede RECON10. Next action is council's: rule the
repair, then a re-run (RECON11b) on the repaired print with identical
selection code.
