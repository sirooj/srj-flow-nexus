# BUILDER_FINDING_RECON14-OFFLOG (P-SLDEF-4 off-log deliverables, no rerun)

Source: `06_HANDOFFS/RECON14-SLDEF3_JOURNAL.log` (F0D7AC70…, 17516 lines).
All numbers below are read off that log, not computed by hand.

## 1. Gate-5 discharge: walkSteps for both RECON14 capHit rows

- 9/08 16:40 S5: OB `walkSteps=0` (S2POLL and S5 agree; skipShift=-1;
  today=base=nuance=1.16379). Fractal: `fracSteps=0`,
  `fracAnchorFlag=1` (zero-step anchor, falsifier-consistent).
  → Discharges under the rescope: slot 817 is the OB extreme
  (REF_OB_DEEP), fractal refs match at slot 4 residual 0. Covered,
  no rerun.
- 9/04 15:55 S5: OB `walkSteps=22` (moved; skipShift=410) → base slot
  524 IS rung-obligated. Fractal: `fracSteps=95`, `fracExh=1`
  (exhausted echoes, slotless refs). → Named shortfall (slots 493 vs
  524, 31-slot gap), closed by E31, not by a rerun.

Gate 5 restated outcome: 9/10 covered + one named shortfall (15:55).

## 2. Shallow-rung table: rungs 0/1/2, all 10 S5 rows (firing rows flagged *)

Format per rung: `slot / ext / barTime / px / imb / distPts / rungR`.
R = |tp-entry|/|entry-px|, live row entry+tp (threshold 1.00).

- 8/26 14:40 LONG: r0 2/0 14:25 1.16602 imb0 d22 R0.58; r1 8/-1 13:55
  1.16611 imb2 d31 R0.70; r2 12/-1 13:35 1.16628 imb2 d48 R1.16.
- 8/27 17:00 SHORT: r0 0/0 16:55 1.16552 imb0 d-100 R0.91; r1 2/-1
  16:45 1.16549 imb1 d-103 R1.02; r2 6/1 16:25 1.16598 imb1 d-54 R0.35.
- 8/28 10:00 SHORT *: r0 0/0 09:55 1.16491 imb0 d-17 R4.08; r1 2/-1
  09:45 1.16481 imb0 d-27 R6.80; r2 4/-1 09:35 1.16482 imb0 d-26 R6.38.
- 8/28 16:20 SHORT: r0 4/0 15:55 1.16503 imb1 d-5 R0.90; r1 6/-1
  15:45 1.16432 imb0 d-76 R33.00; r2 15/-1 15:00 1.16460 imb1 d-48 R2.20.
- 9/04 09:25 LONG: r0 1/0 09:15 1.16279 imb0 d30 R2.34; r1 6/1 08:50
  1.16249 imb2 d0 R0.63; r2 11/-1 08:25 1.16263 imb0 d14 R0.95.
- 9/04 10:35 SHORT: r0 0/0 10:30 1.16289 imb2 d-90 R1.71; r1 12/1
  09:30 1.16299 imb2 d-80 R1.21; r2 16/2 09:10 1.16302 imb2 d-77 R1.11.
- 9/04 15:55 LONG *: r0 1/0 15:45 1.15902 imb0 d-5 R2.45; r1 4/1 15:30
  1.15847 imb0 d-60 R1.66; r2 309/-1 9/03 14:05 1.16017 imb0 d110 R284.00.
- 9/07 09:15 LONG: r0 0/0 09:10 1.16102 imb0 d4 R1.97; r1 2/-1 09:00
  1.16103 imb0 d5 R2.03; r2 6/1 08:40 1.16098 imb0 d0 R1.76.
- 9/07 16:40 LONG *: r0 1/0 16:30 1.16240 imb0 d22 R2.56; r1 4/-1
  16:15 1.16239 imb0 d21 R2.45; r2 6/1 16:05 1.16238 imb0 d20 R2.34.
- 9/08 16:40 SHORT: r0 3/0 16:20 1.16274 imb1 d-105 R1.62; r1 6/-1
  16:05 1.16250 imb1 d-129 R2.68; r2 78/-1 10:05 1.16232 imb0 d-147 R5.21.

Two-away reading (his definition still unpacketised): "two away" R values
(r2 column) run 0.35–6.80 excluding the 284.00 outlier (r2 on 15:55 is a
prior-session rung at slot 309 — granularity visible inside the table).
His levels sit at rung 0 (Sep-7) and rung 16 (Sep-4): refutation arithmetic
for the handoff, not a definition.

## 3. rungR at the matched operator levels

- Sep-7 1.16240 (16:40 row, rung 0, slot 1, 16:30 bar): rungR = 2.56.
- Sep-4 1.15907 (15:55 row, rung 16, slot 407, 9/03 05:55 bar,
  imbCode 0, isTodayRef=1): rungR = 2.56.
- Both matched levels carry R 2.56 on their rows' live entry+tp.

## 4. Noted, not resolved (stays open per verdict)

- 15:55 rung 1 = 1.15847 (slot 4, 15:30 bar, imbCode 0, R 1.66) — the
  unfiled Sep-4 figure sits on the ladder as a rung, but until filed as
  an E24 level it is NOT resolved by slot. The SL pair stays open.
