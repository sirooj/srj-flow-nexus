# BUILDER_FINDING — five-example enumeration (RESCOPE Ruling 3, off-log, no rerun)

Ordered by the RESCOPE verdict 2026-09-13 (Ruling 3): enumerate his five
filed examples with dates, direction, entry, SL, TP, tagged HAND /
INFERRED / CODE per figure, mapped to S5 rows via signalTime =
s5BarTime + PeriodSeconds (M5 → +300 s). Gates adoption, not the build.

Sources: `06_HANDOFFS\BUILDER_FINDING_SEP7_CHARTREAD.md` (operator chart
read + three appendices, 2026-09-12); RECON16 journal `A32F0E85…`
(SIGMAP + SIGNAL lines). `00_CURRENT_WORKING\OPERATOR_TRADE_JOURNAL.csv`
checked and EXCLUDED with reason: June–July "Tales of Candles" journal,
wrong period, no pilot-window figures.

## Mapped (4/4)

1. Aug-28 SHORT — signal 2026.08.28 10:05 → S5 2026.08.28 10:00 (SIGMAP).
   Entry 1.16466 HAND (his "✓ SIGNAL bid"). SL 1.16508 INFERRED (the sole
   inferred figure per Ruling 2 — "SL 6:30 high ✓ (sl_ref)" is a code-side
   match, not his quote). TP 1.16364 HAND-qualified ("prev-day NY low ✓",
   his own "presumably"). Exit 1.16464 HAND (appendix 2, same 11:30 bar).
2. Sep-4 LONG — signal 2026.09.04 16:00 → S5 2026.09.04 15:55 (SIGMAP).
   Entry 1.16018 HAND. SL 1.15847 HAND ("15:30 swing low", generalized
   two-away quote, appendix 3). TP 1.16302 HAND ("TP LD high ✓"). Flat
   1.16129 at 23:55 HAND (typo-corrected, Data-Window-proved, appendix 2).
3. Sep-7 AM LONG — signal 2026.09.07 09:20 → S5 2026.09.07 09:15 (SIGMAP).
   Entry 1.16135, SL 1.16098, TP 1.16200 — all HAND ("full agreement").
4. Sep-7 PM LONG — signal 2026.09.07 16:45 → S5 2026.09.07 16:40 (SIGMAP).
   Entry 1.16261 HAND ("perfect"). SL 1.16239 HAND (status-bar low +
   two-away quote). TP 1.16318 HAND (Yearly VWAP, +3 drift read later).

## Unidentified (owed — council question 2)

5. FIFTH — no fifth example exists in any filed record. The chartread
   finding covers exactly the four above; the CSV is out-of-window. The
   Sep-4 10:35 SHORT identification is the council's conditional, NOT his
   statement: it is for him to confirm or deny, never for us to assert.
   Reported as UNMAPPED (identity unknown), per the verdict's own rule.

## Code-side cross-check (RECON16, measured, not adjudication)

His four SL figures against ext-1: 1.16508 PROVISIONAL_MATCH (resid 0),
1.15847 MATCH (resid 0), 1.16098 MATCH (resid 0), 1.16239 ABSORBED
(resid −1, barDiff −2). Full operands in the RECON16 SLEXT1 lines.

## Addendum 2026-09-13 — his answers, mid-16b-run

Q1: YES — "it is at 6:30 high". SL 1.16508 promoted INFERRED→HAND;
filed bar 06:30 now known. The code's ext-1 rung sits at 06:30 with
resid 0, so barDiff is 0 by inspection. Carried into the adoption
packet; RECON16b still grades the row PROVISIONAL_MATCH as specified
at build (no rebuild for a token flip with zero new operands).
Q2: reframed — his "5 trades" may be miscounted. Window + four code
trades listed to him with the rejected Sep-4 10:35 SHORT (entry 1.16265,
SL 1.16299, TP 1.16224, R 1.21) as candidate fifth; correction owed.

## Addendum 2 2026-09-13 — fifth confirmed + Sep-8 pair (his words)

FIFTH CONFIRMED: Sep-4 10:35 SHORT — considered, not taken. Same entry
1.16265 and TP 1.16224 as the code's candidate; his SL "one swing away +
imbalance". His written figure "1.16224" is filed verbatim but read as a
typo for 1.16299, with reason: 1.16224 sits below the 1.16265 entry and
cannot be a SHORT stop; his own "it is the same with your SL" names the
code's 1.16299; 41/34 re-derives R 1.21 exactly; the rung carries
imbCode=2, matching his "imbalance" words. Digit confirmation owed (one
yes/no). Journal defect, his diagnosis: 0.92R measured on the OANDA chart
(wrong feed) vs true 1.21 — a valid trade wrongly rejected. Verdict's
conditional met: F converts from adoption cost to recovery — fifth
independent confirmation, from a direction nobody arranged.
Digit CLOSED 2026-09-13 (his yes): SL 1.16299 HAND. The fifth-example
record is complete.

SEP-8 PAIR (both HAND, both UNMAPPED — no S5 rows at 10:10 or 17:00; the
code's only Sep-8 S5 row is 16:40, non-firing; the code is silent):
A. London SHORT (4H Bull, 1H+15m Bear, trend-following). Entry 10:10 open
   1.16205 (M POC + 9:20 bearish XOB). SL two swings: first 9:50, second
   9:40 at 1.16258. TP prev-day London low 9:10 at 1.16102. Builder
   arithmetic: risk 53 / reward 103 ≈ R 1.94 (approx, his figures).
B. NYAM SHORT (4H+1H Bear, 15m Bull, trend-following). Entry 17:00 open
   1.16220 (same 9:20 XOB). SL two swings: first 16:50, second 16:20 at
   1.16274. TP Y POC (price not stated — R underivable). Result: LOSS.
Council scope decision owed: whether ext-1 gets instrumented at non-S5
bars (this packet cannot say — S5-only instrument). No build moves.

Count: 7 in-window as he counts (4 code signals + 1 recovered + 2 Sep-8).

## Addendum 3 2026-09-13 — recovery YES + feed authority + MinR rule (his words)

RECOVERY CONFIRMED: on correct (Dukascopy) data he WOULD have taken the
Sep-4 10:35 SHORT. Standing feed rule: Dukascopy ALWAYS; his OANDA-chart
0.92R was his measurement error. Min-1R rule, verbatim sense: takes flat
1.0R, does not take 0.99R (take iff R >= 1.0). Ext-1 R 1.21 clears it —
F is now definition-YES + recovery-YES, the fifth TAKEN setup (4 fired +
 1 recovered, all HAND). All five ext-1 R values (2.43 / 1.66 / 1.76 /
 2.34 / 1.21) clear 1.0. Adoption inputs from him COMPLETE; last term
 closed post-compact.

 ## Addendum 4 2026-09-13 — Sep-8 feed-tag + swing-rule confirm (his words; verdict #8 entry condition 1)

 FEED CONFIRMED: the Sep-8 pair is Dukascopy-sourced. No contamination;
 the verdict's cheaper branch (feed error like Sep-4 10:35) is closed.
 RULE CONFIRMED: both stops swing-based, second-swing stops, times as
 filed in Addendum 2 (London second 9:40 at 1.16258 after first 9:50; NY
 second 16:20 at 1.16274 after first 16:50). His memory is correct — the
 candle times were already on disk here before he was asked. The 53/54pt
 near-identical distances are two independent second-swing placements,
 not a fixed-distance stop. Verdict #8 entry condition 1 is fully met;
 P-ORIGIN-1 issuance is council's (packet text not yet issued — no build
 moves on this addendum).

 LADDER CORROBORATION (measured 2026-09-13 off the RECON18 archive, no
 build): the code's only Sep-8 S5 row (16:40 SHORT, non-firing) carries
 BOTH his levels as rungs at exact price+barTime — rung 0 slot 3 ext 0
 barTime 16:20 px 1.16274 imb 1, and rung 4 slot 83 ext −1 barTime 09:40
 px 1.16258 imb 0. His stops exist in the ladder; the E46 forced ext-1
 walk (10:10 → 09:50/1.16251; 17:00 → 09:05/1.16359) did not land on
 them. Note the index offset, stated without interpretation: his "second
 swing" sits at code ext-index 0 (16:20) and unindexed −1 (09:40),
  never at rungExt 1 — consistent with the verdict's origin-binding
  discovery, and material for the declared-per-site origin design.

## Addendum 5 2026-09-13 — R2 ruled INVALID (CQD) + Aug-28 first-swing correction (his words; v13 prerequisites)

A1 — R2 (Sep-4 10:35 SHORT): OPERATOR- RULED INVALID SETUP, his error
owned: the sub-1R decline stood on OANDA feed error AND, on the reopened
chart (not the journal screenshot), the setup is INVALID CQD under his
recently updated, more accurate CQD indicator. Quote sense: "hypothetically
if that was the entry, yes that SL would be correct" (1.16299). CONSEQUENCES:
(i) Addendum-3 F=recovery is SUPERCEDED — R2 converts from would-take to
MUST-DECLINE; the mapped selection set is the four fired trades (R1/R3/R4/
R5); (ii) R2's stop PRICE stands hypothetically confirmed, its stop BAR
(09:30/slot-13) remains code-side only — his records never state it, so the
5/5 gate as specified is NOT evaluable and the packet must reshape G1
(proposed: G1 = 4/4 fired exact; R2 joins S1/S2 as force-evaluated
stop-only evidence + must-decline anchor — council rules in v14);
(iii) CQD DIVERGENCE: on-disk CQD is UNCHANGED (`BE6FD84F…A421F`, verified
post-compact) — his update is chart-side; whether the repo CQD needs the
same fix is a canonical-file question for council scoping (v14), NOT a
builder edit. Desk owed: what frozen CQD says at R2's bar.

A2 — R1 (Aug-28 SHORT): first swing 09:55, NOT 09:45; second 06:30; SL
outcome unchanged (06:30 high). His caveat kept: the difference matters
because it could rule out different outcomes elsewhere. CORROBORATION
(frozen ORIGINREG R1 row, no new run): skip-witness 09:55/1.16491 (= his
first swing, skipped) then walk stops 09:45/1.16481 (= raw-second) for the
−27 miss — the walk stepped PAST his first swing and stopped one fractal
later. PREDICTION, not ruling: monotone-outward wins R1; the matrix grades
it across all examples (dimension stays in, per his caveat).

TARGET INVENTORY (for packet G6; HAND unless noted): R1 TP 1.16364
HAND-qualified + exit 1.16464 (scratch); R2 TP 1.16224 (moot for selection,
kept for accounting); R3 TP 1.16302; R4 TP 1.16200; R5 TP 1.16318;
S1 TP 1.16102; S2 TP Y-POC price NOT STATED = the single gap (stays a gap).
