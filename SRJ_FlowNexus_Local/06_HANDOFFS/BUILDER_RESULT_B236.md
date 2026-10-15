GRADE RECON62-B235K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B234D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 7; MACHINE-ONLY ungraded 0; trades 20
GRADE RECON62-B236D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B236D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 7; MACHINE-ONLY ungraded 0; trades 20
# BUILDER RESULT B-236 - RESTORED (EURUSD): next-open walk checks only the forming open, 22 Sep still fires
Trader summary: Your next-open rule was built as a second test change that watches every candle opening after the confirmation candle. It changes nothing: your 22 September short still takes because at its firing pass only the 19:00 forming candle is checked (open 1.14314, not on the line), while your 18:55 candle is the confirmation candle itself, which neither the old walk nor the new one tests for its open. The change is undone; the kept build stands. Your 22 September needs either your eyes or a walk that also tests the confirmation candle's own open.
## Relay order (B-236 F10 RETEST-EQUAL 5 of 6 diagnostic 2; RESTORED D3 NO-GAIN)
- Part 0 on builder/B-236 cut at 85dbda0 (backup exact). Python 3.13.16. Reads per 0.3 in order. Gate: log-1 85dbda0, status 917 (+14 B-235 cut/ini/status/done/grade artifacts ACCOUNTED, listed), gated diff EMPTY except the ordered B1 banking pair (1 line each), EA 35f0c73f/a6d765f0 + POI d47a0e68/04fcd8a5 + tini a512582a + [B234EQ] 1, cuts B235K + EU B234D present, tick STATIC (10-06 18678468), no terminal64, ledger ^1382=1 ^1383=0.
- Part B (planner slip owned): rules/52 "the opening of it is the same value as the line POI. So my verdict" -> "the opening of the candle is the same value as the line POI. So my verdict" (after: both phrases count 1); index bytes 2157->2165. No new rule words.
- Part K (one hunk after the [B234EQ] block, EA:11871; refusal path GoAbort): walk shifts barShift-1 down to 0 (candles opening after confirmation up to the forming open), ReadBuf1 per shift (shift 0 valid via CopyBuffer; helper EA:2018-2024 pasted in slice), [B236NO] per walked candle + [B236NOD] decision row, refuse on open==value at _Digits with reason NEXT_OPEN_EQ. Braces +4/+4, [B236NO] 1, [B236NOD] 1, [B234EQ] 1 kept, compile 0 errors 0 warnings, src dc6c2b59 ex5 7f94ca81, .B236K verified pre-run.
- Part T (diagnostic build 7f94ca81 pre/post both runs): RECON62-B236D window JL 25827045 verified, 19:42:47-19:47:48 PASSED, grade 7/7-6/7-0 (T3 gate passes); EU0525TD-B236D window JL 26879982 verified, 19:57:34-20:23:10 PASSED, grade 13/13-12/13-7 (identical to baseline, N22SEP fires). Cuts once per segment (job_cut_b236.py). D3 NO-GAIN.
- Part T6 (NEXTOPEN_B236.csv, 27 NOD rows all PASS): N22SEP pass bar 19:00 bs 1 hit NONE (single [B236NO] row: 19:00 open 1.14314 vs 1.14334). bs=1 on every pass: the walk only ever checks the forming open. Restored EA 35f0c73f/a6d765f0, 17 charts + tini from .preB236, no terminal64; .B236K unstaged.
## Final disk state
- Kept: EA 35f0c73f/a6d765f0, POI d47a0e68/04fcd8a5, terminal.ini a512582a (touch-class), 17 chart files, no terminal64. Review batch: REPORT/REVIEW_BATCH_B236.md (no new items).
## Record checklist (grep-verified in staged files)
- B rules/52 phrase + index bytes: FOUND
- K hunk records in slice: FOUND
- T DEALS_B236D x2 + cuts + grades: FOUND
- Q batch no-new-items: FOUND
- X fixplan State B-236 + ledger 1383 + pointer State B-236 + VALID_TRADES fold pair under cap: FOUND
## Carried note
- The confirmation candle's own open is checked by neither walk: [B234EQ] walks confirmation-to-retest (18:55 does not touch at buffer precision, latest touch 18:50) and [B236NO] walks newer-than-confirmation only (bs=1, forming 19:00 open only). A next road must test the confirmation candle's open itself, or settle the 18:55 touch-precision question (tester high 1.14334 vs buffer no-touch).
- Data repair inside this relay: the committed TOOLS/job_cut_b235.py read journal numbers from the day-log's first tab field, which carries a 2-letter code, not a number; 17 EU day packs filed journal_line -1. Repaired from cut-relative offsets (cross-checked against EQOPEN_B234), and the script fixed the same way. Same-class fix on the 09-22 pack (+1 mistag B236NOD-as-B236NO from alternation order, fixed).
- Next: F10 parks per pointer (blocker to his batch); next EU_FIX_PLAN item F3.
