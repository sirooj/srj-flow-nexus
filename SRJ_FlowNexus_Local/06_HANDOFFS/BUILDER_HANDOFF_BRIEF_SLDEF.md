# HANDOFF BRIEF — SLDEF ladder, for the operator's mark-up

Read this before marking up. Short sentences. Every number below is
measured on the frozen run (RECON15b, full window Aug-26–Sep-10, below).
No bare counts anywhere: each claim names its bar time and price.

## What you are marking up

The decision block (`SLADDER_DECISION`): 10 S5 rows, 4 firing rows
flagged. The 4 flagged rows are the 4 signals: Aug-28 10:00 SHORT,
Sep-4 15:55 LONG, Sep-7 09:15 LONG, Sep-7 16:40 LONG. Each flagged row
lists ladder steps 0/1/2 two ways (by position, by extremity), every step
with its slot, bar time, price, and R. Threshold 1.00, compiled default.

SCOPE NOTE (council ruling, read first): the flip-and-pass counter reads 0
on this run — SCOPE UNRESOLVED. It answers a narrow question (did a pass
coincide with a newly-detectable flip), not the broad one. Do NOT read it
as "no signal ever passed against a flip" — item 6 below shows one did.

## 1. The counting arithmetic (two refutations of pure-count)

- Your Sep-7 level 1.16240 = ladder step 0, slot 1, 16:30 bar, R 2.56.
- Your Sep-4 level 1.15907 = ladder step 16, slot 407, early-morning
  Sep-3 bar, R 2.56.
- No single count reaches both. Step 0 versus step 16 on your own levels.
- Second refutation: on 2 of the 10 rows, today's stop is not a ladder
  step at all. Sep-4 10:35 SHORT and Sep-8 16:40 SHORT both rest on
  1.16379, a zero-step extreme (the walk never moved there). No count of
  any kind reproduces today's reference on those rows.

## 2. The retraction price (Sep-7 16:40 row)

- Carve-out counts: order-block side 0, fractal side 3.
- Your 1.16240 lives ONLY in the fractal-nuance stop (R 2.56) under a
  fired carve-out. The conservative stops (today, base, nuance, fractal)
  are all 1.16112, R 0.36.
- Ladder step 0 says a count COULD reach your level. Your mark-up decides
  whether it does.

## 3. Label table (blocking before adoption as selection)

- One pair resolved by content: your 16:15 low = slot 1, 16:30 bar,
  1.16240.
- Two pairs open: +20 (14:55 versus 15:15 bar labels), −10 (16:05 versus
  16:15 on the newer stamp). Adopt neither as selection until resolved.

## 4. N1 equality (measured, your ruling, not a code change)

- Price-body equality: 28 survived, 0 invalidated. Confirmed.
- POC equality: 3 survived, 0 invalidated. Confirmed.
- Wick equality: 10 survived, 16 invalidated. CONTRADICTED — your ruling owed.
- VWAP equality: 0 and 0. Unexercised, not verified.

## 5. The Sep-4 concentration (restated with operands)

- The 15:55 gate passed with the bias already opposed: bias stamp before
  gate stamp, anti-2 legs at the gate, outcome PASS. The record died on
  its own opening bar (held zero bars, flip exit at 16:00).
- Your 23:55 flat sits against a record that never held a bar (the run's
  day-flat count is 0 with operands). Provisional, not frozen.
- The untested 1.15847 sits as ladder step 1, slot 4, 15:30 bar, R 1.66.
  It resolves to nothing until filed. The Sep-4 stop pair is NOT closed
  by the 1.15907 match — two numbers, one tested.

## Your four asks (unchanged, in order)

1. File 1.15847 as a level or strike it. Until filed it is an open number.
2. Mark up: which ladder steps are your swings — by BAR TIME AND PRICE
   ONLY. Never step numbers, never labels. Step numbers move when the
   window moves; labels are shown above to be unreliable.
3. Rule the wick-equality contradiction (10 survived, 16 invalidated).
4. Read the 23:55 flat against the never-held record. Your read opens
   each item above; the operands close it.

## For the record (appendix, not needed for mark-up)

- Frozen baseline: EA 1EE6FC62 (383844 B), indicator 3606BFB4 unchanged.
  Run archive 1BB162E5, 17598 lines, bounds [44769..62366].
- Ghost level retired as a question: 1.16112 = step 19, slot 77, morning
  Sep-7 bar, imbalance present, bracketed 1.16141 / 1.16102.
- Sep-4 afternoon gap closed: window 574, deepest step 571, base slot 524
  matched at residual 0.
- Full evidence: `BUILDER_RESULT_RECON15b-SLDEF4.md`,
  `BUILDER_FINDING_RECON15b-OFFLOG.md` (same folder).
