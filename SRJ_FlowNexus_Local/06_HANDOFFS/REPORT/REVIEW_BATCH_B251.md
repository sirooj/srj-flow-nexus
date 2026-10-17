# REVIEW BATCH B-251 - machine-only (ungraded) takes, run basis EU0525TD-B251I, record-first

Run basis: EU0525TD-B251I (the [B251I] next-open-on-divergence diagnostic build).
Diagnostic verdict first: the rule never fired once in the whole 19-week window
(zero trigger prints), and a pure-base control run the same day (EU0525TD-B251ICT)
reproduced the same trades byte-for-byte - the take list below is NOT caused by
the rule change. The difference from the B-248D-era baseline (2 extra machine
takes, 2 valid-loss takes gone) is the build-chain difference (compile-chain),
owned as B-251-3 in the slice, never a his-word or strategy event.

Machine-only takes (register rows NONE), all repeat-shaped:
1. 4 June 09:55 EURUSD long 1.16121, out 10:26 1.16048 (NY morning; entry 3
   candles before the y-day build's 10:05 shape). His 4 June never-row stays
   "not in play" (his words 2026-10-15, review item 3, verbatim record); the
   y-day build's 10:05 fire is already his answered row; the 09:55 form adds
   one candle - carried, not re-asked.
2. 19 June 15:50 EURUSD long 1.14654, out 15:51 1.14716 - NEVER re-asked here
   (K19JUN banked, his words 2026-10-16 rules/54; entry 15:45 open 1.14644
   remains the owed shape; the machine still fills one candle late).
3. 30 June 10:45 long 1.14061, out 11:00 1.13951 (London). Repeat of the
   B-250 batch row 3 (filed 2026-10-17 06:10, REVIEW_BATCH_B250.md).
4. 16 July 10:15 long 1.14683, out 10:48 1.14745 (London). Repeat of the
   B-250 batch row 4; his 15 July 10:35 must-never row (N15JUL1035) fires in
   this build exactly as in the kept B-248D baseline (same class both).
5. 22 July 18:15 short 1.14098, out 04:00 next day 1.14182. Repeat of the
   B-250 batch row 5.
6. 18 August 14:45 short 1.15741, out 14:57 1.15766. Repeat of the
   B-250 batch row 6.

Record-first no-repeat result: rows 2-6 = exact repeats (time/price/bar) of the
B-250 batch already filed under REVIEW_BATCH_B250.md; row 1 = the 4-June class
his words cover at review item 3 plus the B-250 batch row 1 (09:55 same price).
No new unreviewed class in this run.

Valid-loss takes lost by THIS BUILD (not re-asked as a class, named because the
keep record moves): 28 May 11:50 buy 1.16134 (K28MAY, his verbatim valid loss)
and 10 June 18:55 buy 1.15490 (K10JUN, B-248B rules/55 valid) are MISSING here;
both are the compile-chain shape (the same-build pure-base control also misses
them); the B-248D-era baseline takes both exact.

NEVER rows: N26MAY fires (his verbatim row, both builds), N15JUL1035 fires
(kept-baseline same class), N4JUN1005 silent here via the 09:55 moved form
(the y-day 10:05 fire was his answered never; the moved form is row 1).
