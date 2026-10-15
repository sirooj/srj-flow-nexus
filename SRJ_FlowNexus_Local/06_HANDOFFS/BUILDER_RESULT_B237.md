GRADE RECON62-B235K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B234D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 7; MACHINE-ONLY ungraded 0; trades 20
GRADE RECON62-B237D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B237D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 6; MACHINE-ONLY ungraded 0; trades 19
# BUILDER RESULT B-237 - RESTORED (EURUSD): touch at chart precision refuses 22 Sep, D1 GAIN
Trader summary: Your 22 September short is refused when the touch is tested the way your chart shows it: the 18:55 candle's high sits exactly on the Quarterly POC at 5 digits, and its open sits there too, so it is not a valid retest and the trade never fires. Nothing else changes on either run: every one of your keeps takes exactly as before, and the other never-takes fire exactly as before. The change is undone; the next relay installs it as the kept build.
## Relay order (B-237 F10 RETEST-EQUAL 6 of 6 diagnostic 3; RESTORED D1 GAIN)
- Part 0 on builder/B-237 cut at 7db5875 (backup exact). Python 3.13.16. Reads per 0.3 in order. Gate: log-1 7db5875, status 959 (+B-236 artifacts ACCOUNTED, listed), gated diff EMPTY except SLICE_B234 figure line (ACCOUNTED), EA 35f0c73f/a6d765f0 + POI d47a0e68/04fcd8a5 + tini a512582a + [B234EQ] 1 + [B236NO] 0, tick STATIC (10-06 18678468), no terminal64, ledger ^1383=1 ^1384=0.
- Part B: no new rule words (48 L4 + 51 L5/L7/L8 + 52 L3 counts all 1).
- Part K (inside kept [B234EQ] block EA:11852-11853, verified text count 1 each): touch compares at _Digits (chart price, no tolerance); [B237TD] row per walked candle (raw %.10f + digits + touch). Braces equal 1292/1292, [B237TD] 1, [B234EQ] 1, compile 0 errors 0 warnings, src a62194f8 ex5 a975ea27, .B237K verified pre-run.
- Part T (diagnostic build a975ea27 pre/post both runs): RECON62-B237D window JL 30207480 verified, PASSED, grade 7/7-6/7-0 (T2 gate passes); EU0525TD-B237D window JL 31260416 verified, PASSED, grade 13/13-12/13-6. Cuts once per segment (TOOLS/job_cut_b237.py). D1 GAIN: N22SEP silent, no KEEP worse, no new NEVER fire.
- Part T6 (TOUCHDIG_B237.csv, 74 rows): 18:55 TD row raw 1.1433400000 val 1.14334 hi 1.14334 lo 1.14307 o 1.14334 touch 1 JL34063889; EQ row 18:55 REFUSE JL34063890. Deal diff vs baselines: RECON none; EU only the 22 Sep pair gone (19:00 sell 1.14314, 19:13 buy 1.14306).
- Part T4 restored EA 35f0c73f/a6d765f0, 17 charts + tini from .preB237, no terminal64; .B237K unstaged (a62194f8/a975ea27).
## Final disk state
- Kept: EA 35f0c73f/a6d765f0, POI d47a0e68/04fcd8a5, terminal.ini a512582a (touch-class), 17 chart files, no terminal64. Review batch: REPORT/REVIEW_BATCH_B237.md (no new items).
## Record checklist (grep-verified in staged files)
- X ledger 1384 + pointer State B-237 + fixplan State B-237 + batch no-new-items: FOUND
- X VALID_TRADES fold pair under cap (16100 + 8033): FOUND
- T DEALS_B237D x2 + cuts + grades + TOUCHDIG: FOUND
## Carried note
- The 18:55 touch mystery is settled: machine confirmation for 22 Sep is the 18:55 candle itself; the old unrounded test read its high just below the unrounded line value, so the walk passed it by to 18:50. At chart precision the high sits exactly on the line. Nothing about the walk order changes.
- B-236-filed EU day packs carried journal_line -1 (committed cutter read the day-log's 2-letter first field as a number); repaired on disk from cut-relative offsets and cross-checked, script fixed. The 09-22 pack also had one B236NOD mistagged B236NO (alternation order), fixed. Lesson B-237-CUT-LINES banked (oldest line folded to archive).
- Next: install relay (KEPT trial with Part S) per D1 GAIN.
