# BUILDER FINDING — SEL1 zero-run forensic read (R4 / R5 / S1 + v14 registration order)

Zero-run, read-only, no build/run/token. Sources: archived
`06_HANDOFFS\RECON20b-SEL1_JOURNAL.log` (33937 lines, SHA
`06556CF46A0935F649ED3FD5D2FB80AA8C10CA6F9740B952735AA5B622B06AA4`)
plus code-read of `Experts\SRJ_FlowNexus_EA.mq5` (build-2 `766BADDC…`,
uncommitted) and the frozen v14/v15 records. Mandate: Opus-v16 Ask 2
(zero-run read); Astra-7 Ask 2 warrants evidence-only R4 work for design
consideration while authorizing no execution — this read executes
nothing, instruments nothing, moves no digest. If the operator reads
Astra-close strictly (no reads either), this file stands as measurements
only and nothing depends on it.

## 1. R4 — PRESENT in swing census, NEVER SELECTED by the fractal shadow

- `1.16098` occurs 517× on-log across 30+ tags (incl. SLIMB 12,
  SLIMBWALK 14, SLIMBWALKF 8, SEL52 384, SLEXT481 5, SLIMBR 1).
- Binding rows (all five verbatim): `SLIMB fields=19 bar=2026.09.07 09:00
  site=S3ARM … slRef=1.16098 slShift=4 slShiftT=2026.09.07 08:40 …
  chosenShift=4 chosenShiftT=2026.09.07 08:40 …`;
  `… bar=2026.09.07 09:05 site=S2POLL … slShiftT=2026.09.07 08:40 …
  chosenShiftT=2026.09.07 08:40 …`; `… bar=2026.09.07 09:10 site=S2POLL …
  slShiftT=2026.09.07 08:40 … chosenShiftT=2026.09.07 08:40 …`;
  `… bar=2026.09.07 09:15 site=S2POLL … slShiftT=2026.09.07 08:40 …
  chosenShiftT=2026.09.07 08:40 …`;
  `… bar=2026.09.07 09:15 site=S5 dir=LONG … slRef=1.16098 slShift=7
  slShiftT=2026.09.07 08:40 … chosenFlag=0 chosenShift=7
  chosenShiftT=2026.09.07 08:40 chosenAvail=1
  nuanceClass=OB_VALID_LATEST_NOIMB …`.
  The swing-buffer path binds AND chooses 08:40 at the S5 decision row
  itself (09:15, the R4 signal bar's eval row).
- Shadow side: 384 SEL52 (defined-stop) rows mention 1.16098, but ZERO
  bind it to 08:40 as the defined stop (`SEL52_116098_0840=0`).
  `SEL53 ex=R4 v=V005 … px=1.16088 bt=2026.09.07 08:20 slot=12 …
  wit=1.16102@2026.09.07 09:10 skU=0 skN=0 skE=0 amb=0` — the walk lands
  08:20 with no skip witness and a 09:10 nearest-witness, i.e. 08:40 is
  not in the shadow's outward chain at all, not merely outvoted there.
- Placement on Opus's binary: PRESENT-but-unselected → counting/ordinal
  side, with one stated boundary: this read does NOT isolate whether a
  raw iFractals 08:40 fractal exists in the shadow's pre-walk list
  (enumeration-recognition vs walk-ordinal remains unseparated inside the
  shadow). What IS separated: swing-space recognition is proven (five
  bound rows), so a pure "code never saw 08:40" theory is dead; the live
  alternatives are (a) shadow list lacks it (shadow-side recognition) or
  (b) shadow list has it and the two-swing walk steps past it (ordinal).
  Distinguishing (a)/(b) needs the shadow's raw list, which P-SEL-1 did
  not print — reported as a gap, per Astra's "report the gap" rule.

## 2. R5 — BOTH limbs present, code prefers retained (tie-break, not recognition)

- `SWINGDUMP #29 site=S5 … bar=2026.09.07 16:40 … SL[1..10]= - -
  1.16240 - - 1.16239 - 1.16238 - -` — filed (16:15), retained (16:05),
  and skip-1 (1.16240@16:30) sit adjacent, one seat apart.
- `ORIGINREG … bar=2026.09.07 16:40 site=S5 … exID=R5 …
  expPx=1.16238 expSlot=7 expBarT=2026.09.07 16:05 expImb=0 obsDef=1
  obsPx=1.16239 obsSlot=5 obsBarT=2026.09.07 16:15 obsImb=0 residPts=1
  match=0 filedPx=1.16239 filedProv=HAND filedResidPts=-1
  feed=Dukascopy skip1Px=1.16240 skip1BarT=2026.09.07 16:30` — the origin
  instrument OBSERVED the filed limb and expected the retained one.
- `SLADDER … bar=2026.09.07 16:40 site=S5 … rung=1 rungSlot=4 …
  barTime=2026.09.07 16:15 px=1.16239 … rungR=2.45 …` and
  `SLADMARK … rung=1 slot=4 … barTime=2026.09.07 16:15 px=1.16239 …
  rungR=2.45` — the ladder's rung 1 IS the filed limb (R 2.45 ≈ his
  living-signal arithmetic).
- `SLEXT1 … bar=2026.09.07 16:40 … slExt1=1.16238 ext1Slot=7
  ext1BarTime=2026.09.07 16:05 … filedPx=1.16239 filedT=2026.09.07 16:15
  residPts=-1 barDiffBars=-2 verdict=ABSORBED …` — ext-1 prefers retained.
- `1.16239` occurs 23× on-log (S3INPLAY, SWINGPICK, SLSRC, IDCHANGE,
  SWINGDUMP, ORIGINREG, SLADDER, SLADMARK, SLEXT1, DECISION_RUNG) and
  NEVER inside a SLIMB/SLIMBWALK/SEL52/SEL53 defined stop. Opus's
  retention/tie-break hypothesis is CONFIRMED as stated (1 pt / 10 min
  adjacent-limb resolution against HAND); no new run needed to see it.

## 3. S1 — SAME selection path as R-side (code-read, not discountable)

`SrjSelForceEval` (EA lines 2958–3001): one loop over all seven frozen
entries `{"2026.08.28 10:00", "2026.09.04 10:35", "2026.09.04 15:55",
"2026.09.07 09:15", "2026.09.07 16:40", "2026.09.08 10:10",
"2026.09.08 17:00"}` (R1–R5+S1+S2), one identical `SrjSelVariant(D,
sT[O], dir, …)` call per example per variant (line 2976), direction from
the frozen entry (`SrjSelEntry`), no side-specific branch; per-example
differences are frozen expectations only (`SrjSelExpected`: g1/ref/tp/
decline). End-of-run over recorded rows with causal prefixes (line 2958
comment) applies equally to R and S rows. S1's `px=1.16359
bt=2026.09.08 09:05 … R=0.669 take=0` (101 pts over HAND 1.16258) is the
same machinery's output on his SHORT side — it belongs in the defect
sample alongside R4, not banked as benign via its decline outcome.
Caveat recorded: S1/S2 force-eval stops are notional (G5: no SHORT row at
either bar, EA LONG-opposed) — same-path, unexercised-context.

## 4. v14 registration order (Opus conditional) — ANTECEDENT HOLDS, with a boundary

- v14 relay line 20 (frozen reference table, pre-run): `| R5 | 16:40/16:45
  Sep-7 | LONG | 1.16261 HAND | FILED 1.16239 @16:15 (authoritative
  target); retained 1.16238 @16:05 recorded as code-under-test, NOT a
  target | 1.16318 HAND |`.
- Freeze `BUILDER_FREEZE_PSEL1.md` lines 29/37: `G1 = 4/4 exact …
  R5 target filed 1.16239@16:15 ONLY, dual-printed vs 1.16238@16:05 for
  every variant` + `R5 2.59 filed (2.48 retained)`.
- So the split WAS on the frozen reference at registration. Boundary the
  relay did not state: at registration no variant output was known, so
  strict ex-ante unreachability does not follow — G1 was reachable iff
  some variant produced filed, which is exactly what the run tested. The
  run closed that door (all-M5-retained, H1-1.16050); unreachability is
  ex-post, established 2026-09-14, not ex-ante. Whether the proposed
  standing gate-design rule should distinguish ex-ante-known from
  ex-post-proven is council's call — no rule adopted here.

## 5. Standing notes (measured only)

- Start-offset inert: O1≡O2 shown everywhere; PRIOR tracks with them
  (V005/V013/V021 identical) — 24-cell space has 8 effective cells, 4
  eligible (from the filed result; restated, not re-derived).
- H1 adds no pass and costs R3 on this evidence (SEL53_FINAL + §G1 rows).
- R2 `decl=1` is construction (blocked adoption; M5 takes on R 1.281) —
  harness fact, not geometry (restated).
- Evidentials retained on disk: EA `766BADDC…` 469237 B + journal
  `06556C…` 33937 lines (per Opus preservation condition; no commit).
- Inbound duplication noted: each stream's v16 text arrived twice,
  byte-identical content; filed once per source (Astra-7, Opus-v16).
