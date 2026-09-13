# BUILDER_FINDING_RECON15b-OFFLOG (verdict-ordered reports 1–5, no rerun)

Source journals: RECON15b `1BB162E5…` (17598 lines), RECON15 `9A9AE93B…`
(17548 lines, retained defect record). EA file:line cites are post-fix
build 2 (1EE6FC62).

## R1 — ORDER recount, reconciled to 16

Off `1BB162E5…`: ORDER rows = 16, distinct barTimes = 16, stamped
(seqBias ≥ 0) = 12, unstamped (seqBias = −1) = 4, seq-order violations
(seqBias ≥ seqS5) = 0. The last-bar guard held: no bar carries two
emissions. Unstamped bars: 8/27 17:00, 9/01 10:10, 9/04 09:40, 9/04 10:35
(S4→S5 promotion after the bias block ran for the bar).
Reconciliation note: the verdict brief counted 13 stamped (13+4 = 17 over
16 bars). Measured 12 (12+4 = 16). The 13 appears to be a miscount; the
four −1 rows above are the complete unstamped set, and 16 distinct bars
corroborate the bar count with the 6/6/4/0/0 outcome split. Outcomes:
RR_FAIL=6 DIV_WAIT=6 PASS=4 NO_TP=0 NO_SL=0. `count(flip==1 AND PASS)` = 0,
in-code counter and off-log count agree.

## R2 — which bias variable the ORDER flag reads versus HTF_FLIP (code-read)

ORDER flag (`SrjOrderEmit`, `Experts/SRJ_FlowNexus_EA.mq5`):
- L2600: `int oWant = (g_dir == DIR_LONG) ? 1 : -1;`
- L2603: `if(ReadFlow(FL_BUF_HTF_HIGH, oH, barShift) && ReadFlow(FL_BUF_HTF_MID, oM, barShift) && ReadFlow(FL_BUF_HTF_LOW, oL, barShift))`
- L2605–2608: `oAntiNow = 0;` + three `if((int)MathRound(oX) == -oWant) oAntiNow++;`
- L2611–2616: same triple at `barShift + 1` into `oAntiPrev`
- L2618: `int oFlip = (oAntiNow >= 2 && oAntiPrev >= 0 && oAntiPrev < 2) ? 1 : 0;`

HTF_FLIP exit (`EvaluateManagedTrade`, same file):
- L7268: `mtlWant = (g_mtrade.dir == DIR_LONG) ? 1 : -1;`
- L7264: `if(ReadFlow(FL_BUF_HTF_HIGH, mtlH, barShift) &&` (+ MID/LOW triple)
- L7270–7272: three `if((int)MathRound(mtlX) == -mtlWant) anti++;`
- L7274: `vHTF = (anti >= 2);   // the majority flipped AGAINST the trade`

Same object: the HTF leg buffers HIGH/MID/LOW. Same want idiom. Three
differences, all quoted above: (a) predicate — ORDER tests NEWNESS
(now≥2 AND prev<2), HTF_FLIP tests LEVEL (now≥2, no history); (b) eval
bar — ORDER at the S5 bar (15:55), MTFLIP at the exit bar (16:00);
(c) direction source — locked candidate dir vs trade dir (equal for every
admitted trade on pilot). The flag CAN see the HTF event class (same
buffers): the zero is narrow-predicate, not wrong-class. At 15:55
antiNow=2 with flip=0 ⟺ the flip was established on an earlier bar or the
prev read failed; anti(15:50) is not printed anywhere on-log (no per-bar
HTF print exists), so no earlier-bar value is claimed. `biasAtGate = 2`
stands alone as measured.
Relocation: NOT owed by this reading — the ORDER counter stamp is an
order-only clock (bias block precedes S5 textually); the flag already
reads the HTF object. Moving the stamp changes nothing measured. Council
may overturn; that would be a one-line rider edit plus rerun.
`orderFlipPass = 0` is therefore a legitimate NARROW finding ("no S5 pass
coincided with a newly-detectable HTF flip") that must never be quoted
bare. It carries SCOPE annotation in the brief, never reassurance.

## R3 — OB-limb walkSteps for 9/08 16:40 (RECON14 debt, closed)

Off `1BB162E5…`, site=S5 (S2POLL agrees): `walkSteps=0 code2Seen=0
exhausted=0 skipShift=-1 … todayEqBase=1 todayEqNuance=1 baseEqNuance=1
class=ALL3_EQ`, slToday=slBase=slNuance=1.16379. Expected 0 confirmed.

## R4 — rungR at the two matched operator levels (off 15b)

- Sep-7 1.16240 (16:40 row, rung 0, slot 1, 16:30 bar, imbCode 0):
  `rungR=2.56`.
- Sep-4 1.15907 (15:55 row, rung 16, slot 407, 9/03 05:55 bar, imbCode 0,
  isTodayRef=1): `rungR=2.56`.
Both matched levels carry R 2.56 on their rows' live entry+tp (same as the
RECON14 off-log; re-measured, not carried).

## R5 — RECON15 9/08 under the build-1 defect (VACUOUS_COVER exhibit)

Off `9A9AE93B…`, 9/08 SLADCORR: `ladRungs=1 ladDeepestSlot=3 ladCap=500
ladCapHit=0 ladCovers=1`. Yes: it reported COVERED while enumerating a
single rung. That is the blind spot sized by measurement — an empty
obligation set with `coverT=0.0` breaks (SHORT) on the first rung and
prints covers=1. Justifies `ladObligN` + `VACUOUS_COVER` (rider) by exhibit
rather than by reasoning. RECON15b's fixed row (52/351/500/1, covers=1,
MATCH byte-identical 52/6/OFF/20) is the control.
