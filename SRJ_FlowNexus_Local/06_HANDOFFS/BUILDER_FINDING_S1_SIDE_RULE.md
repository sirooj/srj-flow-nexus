# FINDING — S1 side rule from operator screenshot (Sep-8 10:05 M5)

Source: operator-attached live screenshot + his one-line rule, 2026-09-14.
His words: the trend-following bias is SHORT because 1H and 15m bias
are short.

## What the screenshot shows (read, not assumed)

- MTF box top-left: ORDERFLOW BEAR; PM.L→NA BULL; 4H Bull; 1H Bear 2xOB;
  15m Bear 2xOB with OB-tick and FVG-tick. His side call: SHORT on
  1H+15m bear alignment.
- Chart: EURUSD M5, Dukascopy demo feed (matches his Dukascopy-always
  rule). Entry zone ~1.16205 just after the 10:05 bar. Triangle markers
  on his swing highs/lows (including the 09:40 area high). Red
  "Bearish_Bias 2xOB" tag. CQD tick subwindow below with red/blue
  divergence lines into the entry bar.
- Time axis runs to 10:05 on Sep-8. This is the S1 short (filed stop
  1.16258, target 1.16102).

## Filed side rule (his, verbatim in effect)

Side comes from higher-timeframe trend-following bias: 1H bear AND 15m
bear → SHORT. (4H bull present but not blocking; PM.L→NA bull present
but not blocking — stated as shown, not as ranked.)

## Code-side contradiction (closed record, RECON21b journal)

`SEL54BAR bar=2026.09.08 10:10 … cqd=EMPTY bias1=-1.0 bias2=-1.0
carried=LONG` (and the same -1.0/-1.0/LONG at 17:00). Code's own bias
meters print negative at both Sep-8 bars — the same direction as his
1H+15m box — yet the carried candidate is LONG. So Wall One is sharper
than "code reads long": code's meters agree with his read while its
carried side contradicts both. WHY a -1.0/-1.0 meter pair still carries
LONG is a code-path question for the fix design (suppression/held-state
logic upstream of side assignment), not answered here.

## Status of the five fundamental questions (2026-09-14 revision)

- Q1 (side): ANSWERED by this screenshot — HTF 1H+15m bias alignment.
- Q2 (entry trigger), Q3 (count start / S1 first swing), Q4 (08:40
  validity), Q5 (replace vs alongside): WITHDRAWN as operator questions.
  Operator states all were explained before and journaled. Builder rule
  (answer from documented rules FIRST) now applies: the builder reads
  the goal/charter/spec/journal/chartread record and returns either with
  answers-from-record or with precise gap-only questions. No re-asking
  of anything on record.
