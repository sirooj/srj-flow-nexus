# BUILDER_RESULT_RECON11b-SLDEF (P-SLDEF-1b, E15–E19)

STATUS: ACCEPTED (council verdict 2026-09-12). Gate 5 restated, ACCEPT 60.
New frozen baseline: EA 75FEBFDE… (314461 B), FlowLogic 3606BFB4….
RECON11 superseded (journal only; never a fractal-limb baseline).
Local commit cleared; origin stays operator-latency (no push).

## Run record

- Window/ini: RECON1_P1.ini unchanged. 563338 ticks / 3168 bars.
- `Test passed in 1:07:31.183`. Wrapper segment archive (STATUS
  ARCHIVED_LINES=17137, DONE 2026-09-12 17:19:49, RESULT=PASSED).
- Journal: `06_HANDOFFS\RECON11b-SLDEF_JOURNAL.log`, 17137 lines,
  LEN 3177788,
  SHA256 DBA710C523F5998345E8FA693FCAF5A3B6C3BE632A9635E7B0E4A9DAE08A9CC1.
- Build: EA `75FEBFDEBBDA023A96FFB968C09D82F3FB6444B58DBEC1F609455DA4B58CBE1A`
  (314461 B, compile 0/0, 2479 ms); FlowLogic
  `3606BFB480A34B5ED4357588DDAFDFE8F7DF2224DA34C6A220EA49F506725911`
  UNCHANGED (compile 0/0, 5000 ms). Gate 1 PASS.
- Tabulation: `RECON11b-SLDEF_TABULATION.txt`. Join: `RECON11b_GATE4_JOIN.txt`.

## Gate verdicts

1. Compiles 0/0, FlowLogic digest unchanged — PASS.
2. Identities verbatim — PASS: CQD DIV 906 (170/308/263/165); WS161
   fields=21 loads=3168 changes=205 mismatch=0; SLMEMO 471/118/589;
   SL_REF S2POLL 432 / S3ARM 39 / S5 10; INPLAYCOMMIT 157 applied / 46
   committed; MTEXIT 4; aborts 18/37/13/11/2/0/12; XOB-PROMOCENSUS 469
   (pattern note: bare `PROMO` matches 1097 lines = 469 census + 157
   XOBPROMO + 471 XOBINPLAY/2 `promoT=` fields; the 469 uses the
   `XOB-PROMOCENSUS` pattern); CONFIRMPOLL 555; SUPPRESSED 156; 4 signals
   verbatim (8/28 SHORT R2.43; 9/04 LONG R2.56; 9/07 09:15 LONG R1.76;
   9/07 16:40 LONG R1.25).
3. SLIMB 481 (432+39+10, PRE 0); AVAIL0=0; apex0-with-avail=0;
   CHOSEN_NEG=0; NOOB=0; latestFlag 318/67/96 (= RECON11); branch
   1SWING 441 / 2SWING 40; S5_NO_SL_REF=0; PROGRESS 102, naAlive=0 — PASS.
4. OB join RECON11×11b on bar|site — PASS (intent met): 481/481 rows
   present both sides, zero missing; every token the old line carried is
   identical (deltas, classes, steps, skips, flags). Sole exception, by
   design of the old defect: 962 old-line outward cells (481×2) are
   absent — RECON11's line lost them to truncation on all 481 rows;
   11b restores them (present 481/481). `sideViolations` differs on
   exactly the 26 falsifier rows (old mixed-scope counter carried the
   fractal increments there; new OB-scoped counter reads 0) — that
   difference IS the E15/E16 repair, listed row-for-row in the join file.
   No-fork re-proven after the split. OB partition 51/0/71/200/0/159/0/0/0
   = RECON10 exactly.
5. sideViolations=0 OB (481/481) ✓; sideFracViolations=0 post-guard
   (481/481) ✓; **fracAnchorGuardApplied=60 — restated PASS (verdict):
   input-side population, containment POS_NOT_GUARDED=0.** Raw-side
   census: WRONG=60, PROTECTIVE=421, none-missing=0; applied=60
   (every raw-wrong found a protective swing; no guard exhaustion).
   Join proof: the 26 falsifier rows ⊆ the 60 guard rows exactly
   (POS_NOT_GUARDED=0); the 34 extra rows are listed in §"The 60 vs 26"
   and in the join file. Zero guard applications at S5 (GUARD_S5=0).
6. count(outwardBasePts<0)=0, count(outwardNuancePts<0)=0, present
   481/481 each — PASS. Fractal distributions reported, unconstrained:
   outwardFrac NEG 93 / ZERO 175 / POS 213; outwardFracNuance NEG 144.
7. LINEWIDTH truncated=0 all 7 classes — PASS: SLIMB max 436, SLIMBWALK
   474, SLIMBWALKF 500, SLIMBR 346, SLIMBRCARVE 180, N1PAIR 149,
   FRAME_NOTE 175 (cap 537). The structural fix works: worst line uses
   500/537. (DECISION excluded by design — one multi-line emission of
   short physical lines; stated in code.)
8. fracClass WALKF×SLIMBR agreement 10/10 shared bar|site — PASS.
   Sep-7 16:40 S5 row complete: entry=1.16261 tp=1.16315
   slFractalNuance=1.16240 rFractalNuance=2.56 dFracNuancePts=22, plus
   SLIMBRCARVE operands (gate 10 evidence, see §"R handoff").
9. UNRESOLVED=0 / UNCLASSIFIED=0 both limbs (OB 51/0/71/200/0/159;
   FR 26/0/24/215/68/148) ✓; cross-tabs in full, OB falsifier
   cf1×BASE_MOVED=0 ✓, fractal falsifier ff1×BASE_MOVED=34 — see §"On
   the fractal falsifier". XTAB unmatched 0 both.
10. Sep-7 S5 row prints entry/tp/sl/both R terms + full carve-operand
    set — PASS (SLIMBR + SLIMBRCARVE rows quoted in tabulation).
11. SLIMBR 10 rows, STALE 0; DECISION 10 rows, five columns;
    SLIMBCARVE_FINAL ob=0 fr=3 (3 SLIMBRCARVE lines, all limb=FR:
    8/26 14:40, 9/07 09:15, 9/07 16:40) — PASS.
12. Spot check vs RECON10 — PASS: 4 signals verbatim; OB partition
    identical; firing-set R values reproduce (2.43→2.17, 2.56→1.53,
    1.76→1.07, 1.25→0.36 on the OB columns); SLIMBR 10/10 bit-identical
    to RECON11 (OB and fractal columns).
13. Digests above; archive method recorded (wrapper segment archive +
    DONE marker; journal SHA/length stated, not mtime). NO COMMIT.

## The 60 vs 26 (gate-5 finding, with row lists)

The guard (pre-walk, Task-75 parity: raw anchor wrong-side → walk back
to first protective-side confirmed swing) fires on the INPUT-side
population: 60 rows where the nearest confirmed swing sits on the wrong
side. The falsifier counted the RESULT-side population: 26 rows where
the walk's base/nuance stayed wrong-side. The 26 are exactly contained
in the 60. The 34 extra rows are wrong-anchored walks whose results
were protective anyway (post-guard outcomes on the 60: EXH 25, BASEMOVED
29, ALL3 4, TEQN 1, CARVE 1) — mostly exhaustion/termination falling
back to today. All 60 are S2POLL/S3ARM; none is S5; the S5 decision
surface is bit-identical to RECON11 (SLIMBR 10/10, §gate 12), so no R
value on record moves either way. The packet's "expected 26" assumed
input-side == result-side; measurement refutes that identity. Two
ruling options: (i) accept 60 as the true input-side population (guard
correct as built, expectation restated; the 34 non-S5 fractal values
change vs RECON11 as measured); (ii) move the guard post-walk (walk
from raw, re-walk from guarded anchor only where results are
wrong-side; fires 26; the 34 keep RECON11 values). Builder did NOT
implement (ii) — that is a design change, halted per E16/gate 5.

The 34 guard-not-falsifier rows (all S2POLL except two S3ARM):
8/26 18:05, 8/26 10:30, 8/26 11:05, 8/27 09:20, 8/27 09:25, 8/27 10:00,
8/27 17:05 S3ARM, 8/28 09:55 S3ARM, 8/28 15:05 S2POLL (sic — S2POLL at
15:05), 8/28 15:10, 8/28 17:50, 8/28 17:55, 8/31 10:25→10:55 run,
8/31 11:00, 8/31 14:50→15:05 run, 9/01 14:55→15:10 run, 9/01 17:25,
9/01 17:30, 9/03 09:10, 9/07 16:05, 9/08 09:30, 9/08 09:35.
(Full bar|site lists: tabulation WALKF_GUARD_ROWS; join GUARD_NOT_POS.)

## On the fractal falsifier (ff1×BASE_MOVED=34)

Definitional, not a violation. Zero-step returns the ANCHOR price; on
the fractal limb the anchor differs from today by construction, so
anchor-flag-1 + zero-step yields BASE_MOVED (eqB=0,eqN=0,eqBN=1) unless
the walk re-resolves to today. The flag-1-implies-ALL3 reading holds
only where anchor==today (OB limb, where the falsifier is 0). The 34
rows overlap the guard-extra set by 1 row only — the cell is NOT
guard-created. Context: RECON11 has no precedent here — its fractal
cross-tab matched zero rows (truncation ate fracClass past the cut, and
its `class=`-family patterns were collision-blind), so 11b is the first
complete fractal census (481 rows). OB falsifier cf1×BASE_MOVED=0.

## E15.3 token-collision audit (one-time, shadow family + new tokens)

Colliding set: `class` / `fracClass` / `nuanceClass` — each a
case-insensitive suffix of the next. Standing rule adopted: match
`class=` only with a non-letter lookbehind (`(?<![A-Za-z])class=`);
`fracClass=`/`nuanceClass=` matched literally. Co-finding that proves
the rule was needed: RECON11's tabulation fractal cross-tab silently
matched 0 rows. All other emitted names audited pairwise — no further
suffix collisions (near-misses `skipShift`/`skipShiftT`,
`fracAnchorShift`/`fracAnchorShiftT` etc. are prefix relations, safe
under `=`-terminated matching; fractal-side counters were deliberately
named fracSteps/fracCode2/fracExh/fracC3/fracExtNQ to avoid creating new
collisions). New-line BADFMT=1 counts are the LINEWIDTH audit lines
themselves matching the negative-lookahead patterns — data BADFMT=0
(RECON11: 0; same meaning).

## E16.1 route (no halt)

Single shared expression `SlimbProtectiveSideOk(dir,refV,curPx)` holding
the Task-75 ternary verbatim; the Task-75 call site passes identical
operands (boolean provably unchanged; OB join 481/481 re-proves it
empirically); the fractal guard and its walk-back skip test call the
same function. No second side test exists. The Task-75 walk-back loop
body itself is untouched.

## E18 implementation note (deviation, structural)

Carve operands print on `SLIMBRCARVE` companion lines (same bar|site key,
only when that limb's class is CARVEOUT_FIRED), not appended to SLIMBR:
14 operand tokens would breach the 537 cap whenever both limbs fire,
and gate 7 forbids silent truncation. All operand values verified live
on the Sep-7 row (ret=1.16240 newerShift=7 newerT=2026.09.07 16:05
newerWick=1.16238 newerFlag=0 newerBody=1.16245 wickMoreExt=1
bodyThru=0).

## N1 pairing (E19)

Unpaired counters verbatim 28/26/0/3. Paired: entryWick 10 survived /
16 invalidated (=26 ✓); entryBody 28 / 0 (=28 ✓); vwap 0/0; poc 3 / 0
(=3 ✓); exitBody 0 / 0 — the exit site encountered zero equalities, so
its pairing is unexercised (rider present, never incremented). Total
paired 57/57. Reading: every POI-body equality lived (28/28 at entry);
wick equalities split (10 lived, 16 died with the retest); POC
equalities all lived (3/3). Verdict definitions are in code comments;
no comparison changed (all increments sit beside branches).

## R handoff (gate-8 arithmetic, operator's call, no code moves)

Sep-7 NYAM S5 fractal-nuance operands: entry 1.16261, tp 1.16315
(reward 54 pts), sl 1.16240 (risk 21 pts), R 2.56. The hand figure
≈2.45 with the same 54 reward implies risk 22 ⟺ sl 1.16239 — i.e. the
entire gap is the 0.1-pip stop difference (16:30-bar 1.16240 vs the
hand 1.16239), NOT a second operand gap. Note the newer-bar label:
code prints newerT=2026.09.07 16:05 for newerShift=7; the hand label
16:15 stands unreconciled (E13.3: blocking-before-adoption, unchanged).

## What closes / what is owed

Closed by measurement: split, LINEWIDTH (7/7 zero), outward restore
(OB 481/481 + fractal distributions), OB no-fork 481/481, fracClass
agreement 10/10, SLIMBR/DECISION intact and identical, N1 paired 57/57,
carve operands live (3 FR rows), decision surface bit-identical.

VERDICT 2026-09-12 — ACCEPTED, no rerun. Gate 5 restated (option i):
sideViolations=0 (OB result-side); sideFracViolations=0 (fractal
result-side, post-guard); fracAnchorGuardApplied=60 (fractal INPUT-side);
containment POS_NOT_GUARDED=0 — all four measured on RECON11b. The 60
are input-precondition failures (Q2's precondition false at anchor
choice); the 26 were accidental repairs. Decision surface untouched by
the ruling (0/60 at S5; SLIMBR 10/10 identical). Standing rules adopted:
gate counts must name their population in the same sentence (population
identity becomes FRAME_NOTE's 4th convention in the next run touching
it); repaired inputs stay distinguishable (raw tokens mandatory);
count-collision scoping (non-letter lookbehind) with the
class/fracClass/nuanceClass triple grandfathered; audit lines must not
self-match data patterns (owed fix); bare-PROMO decomposition recorded.
Gate 8 CLOSED on operands (council's 51.5-vs-54 inference withdrawn;
single 0.1-pip operand gap). N1 honest status: CONFIRMED at POI body
(28/0) and POC (3/0), CONTRADICTED at POI wick (10/16), UNEXERCISED at
VWAP (0/0) and at the exit site (0 encounters) — operator's ruling owed;
no comparison changes. Label discrepancy now three pairs (+20/−15/−10);
resolution by content (wick/body extremes per bar), operator to identify
by price; blocking-before-adoption unchanged.

Off-log restated falsifier (no rerun, token name `fracSteps=`):
count(fracAnchorFlag==1 AND fracSteps!=0) = 0 over all 56 ff=1 rows
(row list in §gate-5 finding context — full list: 8/26 10:05→11:00 run,
8/26 11:50, 8/27 10:05→10:35 run, 8/27 17:05 S3ARM, 8/28 15:15→15:20,
8/28 16:15 S3ARM, 8/28 16:20 S2POLL+S5, 8/28 18:00→18:25 run, 8/31
11:05→11:30 run, 9/01 10:10 S3ARM, 9/01 17:35, 9/02 10:25, 9/02
14:15 S3ARM, 9/02 14:20→14:30 run, 9/02 15:40 S3ARM, 9/02 15:45, 9/03
09:10, 9/03 18:10→18:25 run, 9/08 10:30→10:40 run, 9/08 16:35 S3ARM,
9/08 16:40 S2POLL+S5). The real zero-step content HOLDS. Second half
(slFractal == fracAnchorPx): UNVERIFIED — fracAnchorPx is not a token;
owed in the next run that touches the walk line. The two 34s are
distinct populations (overlap 1 row) and are never quoted as one.
