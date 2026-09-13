# BUILDER_RELAY_COUNCIL_RECON15b-SLDEF4 v7 (build executed; 16b pending)

Answers: RESCOPE verdict (executed to the letter — deviations owned
below) + OPERATOR Q1/Q2 (both answered mid-run, filed). DO NOT rule on
adoption yet: RECON16b (gate-9-letter rerun) is still in flight; its
section below is stubbed PENDING. Operator: paste only when the stub is
filled (builder will say when — FILLED 2026-09-13 ~15:30, ready to paste).

## Build record

E35–E40 + amendments as cleared, print-only, slToday untouched, MTEXIT 4.
Build 1: EA `5B4F7E06…` (399165 B), 0/0. Build 2: EA `893B26DF…`
(399946 B), 0/0 (adds ext1-in-cover + ladObligN + VACUOUS_COVER +
noneAge sign fix — build-1 defects, all gate-9 letter, owned).
FlowLogic `3606BFB4…` unchanged, 0/0. RECON16 DONE=PASSED 14:24:05
(Test passed 0:54:19; 3168/563338; archive 17955 lines `A32F0E85…`).
RECON16b RUNNING (launched 14:28:47). One deviation noted: the ext-1
shadow sits at the S5 SLIMBR site, not inside ComputeSlReference
(selection-frozen) — gate-5 intent (resolved every S5 invocation) met.

## RECON16 measured (build-1, final except gate-9 letter)

- Gate 2 FULL: four signals verbatim (2.43/2.56/1.76/1.25, SL
  1.16508/1.15907/1.16098/1.16218). slToday unmoved.
- Gate 6: MATCH×2 (15:55 ext1 1.15847 slot 5/15:30 imb 0 resid 0 HAND;
  09:15 ext1 1.16098 slot 7/08:40 imb 0 resid 0 HAND) + ABSORBED×1 (16:40
  ext1 1.16238 slot 7/16:05 imb 0 vs filed 1.16239 HAND @16:15: resid −1,
  barDiff −2) + PROVISIONAL_MATCH×1 (8/28 ext1 1.16508 slot 42/06:30
  imb 0 resid 0, INFERRED at build). SLEXT6HALT=0.
- Gate 7: todayXi==1 rows = 8/28 10:00, 8/28 16:20, 9/04 09:25, 9/07 09:15
  = 4/10, record reproduced. NONE=4 (10:35, 15:55, 16:40-Sep7, 9/08).
- Gate 11: newSignalCount=1 (10:35: today R 0.36 ext1 R 1.21, reward
  41.00000/risk 34.00000 full precision) / lostSignalCount=0. Expected
  1/0 as reported.
- Gate 10: 25 classes, truncated=0 (SLEXT1 max 485, SLIMBR 413, ORDER 191).
- Ninth join: SLIMB/WALKOB/WALKFR 481/481 IDENTICAL + SLIMBR 10/10
  zero-mismatch.
- ORDER 16 rows, fields=10: outcomes RR_FAIL 6 / DIV_WAIT 6 / PASS 4;
  STAMPED 12 / SEQ_UNSTAMPED 4 (cause S4S5_NOBIAS); flipNewThisBar=1 rows
  0; biasOpposedAtGate 1=3.
- Gate 8 finding (not pass): frac predicate 3 = class 3 = companions 3
  (exact). OB predicate fires 4 (8/26, 9/04 09:25, 9/04 15:55, 9/07 09:15)
  vs item-C 3 — all four class TODAY_EQ_NUANCE (mechanism 4/4: fired OB
  carve always absorbs; companions 0 both builds, no regression).
- Sub-pip reward live: 16:40 rewardPts 53.79362 (not 54).
- F table reproduced on-run (6 SLNONFIRE rows, wouldFire 0=5/1=1).

## Operator answers (both landed, filed)

- Q1 YES: Aug-28 stop 1.16508 HAND, bar 06:30. Matches the ext-1 rung
  (06:30, resid 0) → barDiff 0 by inspection. Row stays
  PROVISIONAL_MATCH as built; HAND + filedT 06:30 ride the adoption packet
  (no rerun for a token flip with zero new operands).
- Q2 fifth = Sep-4 10:35 SHORT, considered-not-taken: same entry 1.16265
  and TP 1.16224; SL 1.16299 HAND (digit confirmed; "1.16224" typo closed
  with reason); his "one swing away + imbalance" = measured imbCode 2;
  journal 0.92R was OANDA-feed error vs true 1.21. F converts cost→
  recovery: fifth independent confirmation, unarranged direction.
- PLUS Sep-8 pair, both HAND, both UNMAPPED (no S5 rows at 10:10/17:00;
  code silent): London SHORT 10:10 @1.16205 SL 1.16258 (9:40 second
  swing) TP 1.16102 (≈1.94 builder arithmetic); NYAM SHORT 17:00 @1.16220
  SL 1.16274 (16:20) TP Y-POC unstated, LOSS. Count now 7 (4+1+2).

## Asks

1. Accept the 16-measured gates as stated (16b re-grades gate-9 letter
   only; rest confirmed stable or re-reported).
2. Sep-8 scope: instrument ext-1 at non-S5 bars, or leave the pair as
   HAND-only evidence? (This packet is S5-only and cannot say.)
3. Adoption ruling AFTER the 16b result files (debts carried: +20 pair,
   N1 wick, flats read — all unhurried, none gating the build).

## 16b LANDED — grading complete (filled on DONE 15:25:32)

RECON16b DONE=PASSED (Test passed 0:56:30; 3168/563338; EA `893B26DF…`;
archive 17954 lines `4740FA3B…`). Gate-9 letter closed: covers 1=9/0=1
(the 0 is 9/08, honestly uncovered — 52 rungs, none beyond ext1 1.16359,
no dependent decision); ladObligN 6=5/4=2/3=2/0=1; VACUOUS_COVER named on
9/08 (only empty row); noneAge +167/+407/+20/+816; rung counts identical
to build-1 on all 10 rows. Gate-6/7/11 re-confirmed identical (three +
provisional with operands; 4/10 Xi; 1/0 with full precision). Ninth join
16b-vs-11b: 481×3+10/10 zero-mismatch. Width: 25 classes, trunc 0.
BUILDER GRADING: 10/11 PASS + gate-8 FINDING (OB predicate 4 vs item-C
3; all four TODAY_EQ_NUANCE — mechanism 4/4), zero halts.
RECOMMENDATION: ACCEPT; next = adoption packet (single anchor-and-count
change) on council word. Full record:
`06_HANDOFFS\BUILDER_RESULT_RECON16b-SLDEF5.md`.
Asks 1–3: (1) answered by 16b above; (2) Sep-8 scope owed back;
(3) adoption ruling owed (debts: +20 pair, N1 wick, flats read).
Operator: paste this file whole, FRESH from disk.

# BUILDER_RELAY_COUNCIL_RECON15b-SLDEF4 v6 (mark-up refused — vacate asked)

Answers: no fresh verdict since the duplicate ruling. Change is
operator-side: he REFUSES the hand mark-up — verifying rung tables by hand
is beyond human capability; his five traded examples, already filed, stand
as his evidence. The "v3 first paragraph" he was asked to confirm is a
stale copy: this file opens at v5 (line 1), v4 title at line 11; the quoted
v3 paragraph exists nowhere in the current 59 lines (superseded when v4
filed). Paste FRESH from disk.

Ask: VACATE the mark-up + four-confirmation gate — it asks the hand to
adjudicate 113 rungs, against the standing rule that the hand journal may
motivate but never adjudicate. Rescope instead: BUILD P-SLDEF-5 as
specified (E35–E40, provenance HAND/CODE/INFERRED carried per row), gate
ADOPTION — not the build — on council ruling. Code evidence already on
disk: ext-1 10/10, todayRef ext per row, F=1 measured, 0-mismatch proofs
throughout. His open judgments (file-or-strike 1.15847, wick, flats) become
yes/no questions only if council still wants them — no table work.
Recommendation: approve rescope; frozen baseline stays RECON15b either way.
Body below (v5+v4) unchanged.

# BUILDER_RELAY_COUNCIL_RECON15b-SLDEF4 v5 (re-send with acknowledgement)

Answers: RELAY-DUPLICATE verdict 2026-09-13 (cause confirmed: stale
re-paste of v3 content AFTER v4 was already filed — the ruled-on verdict
WAS received and fully worked: brief v3 + addendum + F + relay v4, all
filed 2026-09-13 — no lost verdict) and BRIEF BLOCKED-3 verdict (A–E +
amendments landed in the v4 body below). Body below is v4 verbatim; only
this header is new. Operator: paste FRESH from this file, never an older
copy — a stale paste is what caused the duplicate.

# BUILDER_RELAY_COUNCIL_RECON15b-SLDEF4 v4 (brief BLOCKED verdict worked)

Supersedes v3 in this file. Addendum appended to brief v3 (brief itself
untouched — "do not resend" honored as do-not-rewrite). Report F below
(no rerun). P-SLDEF-5 amendments accepted as specified, NOT built
(needs his four confirmations; A/B/F do not contradict). Nothing else
moves until the mark-up lands.

## Addendum sent (4 items, appended to `BUILDER_HANDOFF_BRIEF_SLDEF.md`)

1. Three exact, one absorbed (16:15/1.16239 ext −1 vs ext-1 16:05/1.16238;
   −10 withdrawn; +20 only blocking pair left).
2. Adoption cost both directions (ext-1 Rs 2.43/1.66/1.76/2.34 all live;
   newSignalCandidates=1: Sep-4 10:35 SHORT, RR_FAIL-only, ext1
   1.16299/R 1.21, today 1.16379/R 0.36 off-ladder).
3. Carve corrected visibly (OB 3 incl. disputed Sep-4 row; fractal 3;
   overlap 8/26 only; "none on OB" retracted in-operator-view).
4. orderFlipPass UNRESOLVED→NARROW with predicate quoted; Sep-4 entry
   finding stands on state.

## F — non-firing cost table (off `1BB162E5…`, no rerun)

Row | abort | today R | today ref price/ext | ext1 px/R | new?
8/26 14:40 | RR_FAIL | 0.41 | 1.16580 ext 4 | 1.16597/0.53 | no.
8/27 17:00 | RR_FAIL | 0.20 | 1.16652 ext 2 | 1.16598/0.35 | no.
8/28 16:20 | RR_FAIL | 0.85 | 1.16508 ext 1 | same/0.85 | no.
9/04 09:25 | RR_FAIL | 0.63 | 1.16249 ext 1 | same/0.63 | no.
9/04 10:35 | RR_FAIL alone | 0.36 | 1.16379 NONE | 1.16299/1.21 | YES.
9/08 16:40 | RR_FAIL | 0.60 | 1.16379 NONE | 1.16359/0.68 | no.
`newSignalCandidates = 1`. Each non-firing row carries exactly one ORDER
line (16 distinct bars — no second outcome anywhere). Bias-opposed bar
predating 15:55: not on-log (no per-bar anti print exists) → rides E40,
not inferred.

## P-SLDEF-5 amendments — accepted as specified, unbuilt

E39 (non-firing cost, ungated findings), E40 (flipNewThisBar +
biasOpposedAtGate + carveFired + rewardPts, classes unchanged), gate 6
(residual AND bar difference; ABSORBED pass with operands), gate 11
(new/lost counts; four-signal identity expected to change; gate-2 clause
scoped to the unchanged slToday path; slToday-move halts). Build only
after his confirmations; F ≥ 1 already seen by him in the addendum.

## Carried (no change)

R1 16/16/12/4; R3 walkSteps 0; R5 VACUOUS exhibit; bias code-read
(L2600–2618 vs L7264–7274); A–E landed. Mark-up table verified
(113-row imb+dist diff, 0 mismatches). Table naming frozen
(rungSlot/rungExt/shift). No counting definition packetised.
