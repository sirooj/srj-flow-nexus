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

Count: 7 in-window as he counts (4 code signals + 1 considered + 2 Sep-8).
