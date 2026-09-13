# BUILDER RESULT RECON18-ADOPT1A (P-ADOPT-1 run A) — BLOCKED on E46

Run A built and executed 2026-09-13. EA `3FDBC228438E8EE01E417DD1C8670C467F5AC13B59F7362A64FC9CAED9AD0D4E`
(426291 B, UNCOMMITTED); FlowLogic `3606BFB4…25911` unchanged; both compile
0 errors / 0 warnings (`06_HANDOFFS\T162_ADOPT1A_EACOMPILE.log`,
`T162_ADOPT1A_FLOWCOMPILE.log`). RECON18-ADOPT1A DONE=PASSED 19:21:07
(Test passed in 0:54:03.105; 563338 ticks, 3168 bars). Archive
`06_HANDOFFS\RECON18-ADOPT1A_JOURNAL.log`: SHA256
`5BDCA919DA09954436ED6A1DB5F9DDA0DD65C7F224FC7612A39A83FA5CFA0784`,
18597 lines = 135339-116742 exactly, bounds [116743..135339] contiguous
from RECON17, purity 1/4/481. Tabulation
`06_HANDOFFS\RECON18-ADOPT1A_TABULATION.txt`; joins
`06_HANDOFFS\RECON18_GATE_JOIN.txt` (eleventh + slToday).

## Gate verdict: BLOCKED — E46 packet halt, run B does not launch

`SLSEP846_FINAL rows=2 halts=2`. Both forced-side rows miss beyond 1 point:

- 2026.09.08 10:10 S2POLL, EA side LONG: forced SHORT ext-1 1.16251
  (slot 4, barTime 09:50, imb 0, deepest 32) vs filed 1.16258 (HAND,
  Dukascopy) → resid −7, barDiff −4.
- 2026.09.08 17:00 S2POLL, EA side LONG: forced SHORT ext-1 1.16359
  (slot 95, barTime 09:05, imb 2, deepest 29) vs filed 1.16274 →
  resid +85, barDiff −95.

No `SLSEP846HALT` threshold judgment is involved beyond the packet's own:
|resid| > 1pt on either row halts the packet. Both rows halt (halts=2).
Per the packet, run B does not launch. Per invariant 8: nothing further
written to canonical sources, nothing reverted, no commit. RECON17
(`6ACDF3B8…`) stays frozen.

Mechanism (finding, not a defect): the forced probe uses the site origin
(eval-close: 1.16190 at 10:10, 1.16241 at 17:00). His entries sit below
those origins (10:10 @1.16205, 17:00 @1.16220 — his words). The extremity
filter is origin-dependent: a swing that is protective vs his entry can be
excluded vs the higher eval-close, shifting the whole ext count. At 17:00
his 1.16274 reads as the count the code's origin excludes (code's ext-1
lands a full rung out at 1.16359, imb 2). At 10:10 the same family misses
by 7 points (0.7 pip — sub-pip, but the halt is 1 POINT, and −7 fails it).
The EA evaluated LONG at both bars (opposed-side debt, disclosed; no S5
rows exist at either bar — his pair stays unmapped, as in every run).
Same-family evidence: E48's 8 S2POLL origin disagreements below.

## E47: PASS + FINDING

`SLEXT47_FINAL rows=118 agree=118` — every SlRefMemo HIT agrees
bit-identically (def/px/slot/bt/imb) with the fresh eval-close resolve.
`SLMEMO_CENSUS computes=471 hits=118 demands=589` verbatim. FINDING: the
S5-membership join gives ATS5=2 / NONS5=116, not the predicted 10/108.
(The 10 S5-probe hits of E43 stand separately: `SLEXT43_FINAL probed=10
hits=10 agree=10` verbatim.) The prediction assumed every S5 barTime
coincides with a HIT event; measured, only 2 do. Agreement surface (the
gate) is 118/118 either way.

## E48: REPORTED (no halt ordered)

`SLORIG48_FINAL n=481 disagree=8 nS5=10 disS5=0 nS2POLL=432 disS2POLL=8
nS3ARM=39 disS3ARM=0 altNA=0`. All 8 disagreements at S2POLL (px+slot+bt,
3 with imb; magnitudes 2–27 pts, e.g. 1.16729→1.16727 slot 66→64 on
Aug-26; 1.15907→1.15934 slot 39→13 on Sep-3). S5 10/10 and S3ARM 39/39
agree across origins. Rows verbatim in the tabulation (`SLORIG48_ROWS`).
Ruling owed: do the 8 S2POLL disagreements matter for run B's memo-path
adoption (which resolves at the site origin, not the alternate)?

## E49: NOT REPRODUCED — implementation miss owned, ruling owed

As built (swing-buffer occupancy via SrjRefIsRung), the four xT-NONE rows
(09.04 10:35, 09.04 15:55, 09.07 16:40, 09.08 16:40 — same four bars as
RECON17) all read occupied: `todayStatus ON_LADDER=6 OCCUPIED_NOMATCH=4`,
`extStatus EXT_DEFINED=10`, age −1 on all 10 rows. Expected OFF_LADDER 2
/ EXT_NONE 2. Two further owned defects: (1) the wrong witness — the
packet says rung occupancy; (2) the slot evidence regressed (RECON17 rows
carried noneSlot 168/408/21/817; run-18 rows carry −1/− because the slot
block only fires on the never-occurring statuses).

Off-run constructions measured on this archive (no build moved):

- Ladder-shift membership of the refSlot: 0/4 (168∉29 rungs max 150;
  408∉49 max 571; 21∉21 max 89; 817∉52 max 351). Gives OFF_LADDER 4 —
  the status quo ante, not 2/2.
- Slot reach (refSlot vs ladder span): 2/2 — {10:35: 168>150, 09.08:
  817>351} beyond reach vs {15:55: 408<571, 16:40: 21<89} within reach
  but skipped (a swing value sits at all four slots per the buffer read,
  yet no rung — the within-reach pair is ladder-skipped, frame-defect
  family). Pair identity matches the known OB extreme (168/817 = one
  persisting Sep-3 20:35 extreme).

Rename half LANDED on both classes: `refSlotAgeBars` present on all
SLEXT1 (10/10) and SLEXT45 (10/10) rows; old `noneAgeBars` token count 0.
Seventh FRAME_NOTE convention printed (`origin=S5:nextOpen-strictHalt|
S2POLL+S3ARM:evalClose`, `FRAME_ORIGIN=1`).

Council must rule the 2/2 predicate mechanically (which slots, which
predicate) and the label semantics (which pair is OFF_LADDER, which is
EXT_NONE) before any rebuild. No rebuild is proposed with this result.

## E50: dormant verified

`SLTODAY_IDENTICAL=10/10` (17-vs-18 SLIMBR join, zero mismatch) — with
`InpAdoptExt1=false` not one new read executes on any path. Eleventh
inert join vs RECON11b: SLIMB/WALKOB/WALKFR 481/481 ×3 + SLIMBR 10/10,
zero mismatch, zero misses either direction
(`06_HANDOFFS\RECON18_GATE_JOIN.txt`).

## Identities carried verbatim (all RECON17 values reproduce)

3168 bars / 563338 ticks; four-signal set verbatim (R 2.43/2.56/1.76/
1.25); WS161 3168/3168/205/0; SLIMB/WALKOB/WALKFR 481/481/481, sideV 0/0;
SLIMBR 10 STALE 0; SIGMAP 4/4; SLADDERMATCH 5/3/2; SLADWIN OK 9 +
VACUOUS 1, covers 9/1; SLEXT1 verdicts 6/1/2/1, SLEXT6HALT 0; SLEXT_FINAL
1/0 + 10:35 row, out 1/5/4; ORDER 6/6/4; DECISION 10 rows fired 4,
threshold 1.00 compiled_default, orderFlipPass 0 NARROW; MTEXIT 4;
MTLIFE 4; MTFLIP 1; N1EQUALS 28/26/0/3; TABLE_NOTE digest + 21:00 anchor;
BLACKOUT rows 11, in-window 1 (NFP), memberBars 3/3, overlaps 0, flats 0;
LINEWIDTH trunc 0 all six new classes max ≤326 < 537; SLIMBCARVE_PROXY
4/0/3/3; SUPPRESSED 152; spot INPLAY 157; SLEXT481 481 = 432/39/10,
NOORIGIN 0, all defined, HALT 0, Sep-8 REDUNDANT rows resids −146/−87
unchanged.

## Council asks (one relay)

1. E46 halt stands on measured values (−7/+85): confirm run B dead, or
   re-scope the probe (his-entry origin? sub-pip absorption for 10:10?).
2. E48: are the 8 S2POLL origin disagreements material for run B?
3. E49: rule the 2/2 predicate + labels (candidates on disk: reach 2/2
   with pair identity; shift-membership 0/4; swing-occupancy 4/4).
4. E47 split prediction (10/108) corrected to 2/116 — noted, no action
   asked unless the adoption packet re-uses it.
