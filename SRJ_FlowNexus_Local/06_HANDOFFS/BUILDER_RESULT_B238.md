GRADE RECON62-B238K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B237D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 6; MACHINE-ONLY ungraded 0; trades 19
# BUILDER RESULT B-238 - KEPT (EURUSD): touch-digits refusal installed, F10 closed
Trader summary: Your 22 September short stays refused on the kept build: the 18:55 candle touches the Quarterly POC exactly at your chart's price and opens there too. The kept build is the same one the last relay tested, re-proved on the short run deal for deal with nothing else changed. F10 is closed with all three of your invalid takes silent; the paused zones lane is next.
## Relay order (B-238 F10 RETEST-EQUAL install; KEPT)
- Part 0 on builder/B-238 cut at f5ef77d (backup exact). Python 3.13.16. Reads per 0.3 in order. Gate: log-1 f5ef77d, status 982 (+B-237 artifacts ACCOUNTED, listed), gated diff EMPTY except SLICE_B234 figure line (ACCOUNTED), EA 35f0c73f/a6d765f0 + POI d47a0e68/04fcd8a5 + tini a512582a + .B237K a62194f8/a975ea27 verified, cuts B237D x2 present, tick STATIC (10-06 18678468), no terminal64, ledger ^1384=1 ^1385=0.
- Part B: no new rule words (48 L4 + 51 L5/L7/L8 + 52 L3 counts all 1).
- Part S (SEPARATOR_B238.csv, 30 rows, from committed B-237 grades): SEPARATES 13 (12 KEEP EXACT + N22SEP FIRES->SILENT); OTHER-GATE 17 (6 firing NEVERs, silent NEVER/WATCH incl N17AUG + A5). G1: no KEEP worse, fires only drop, EU 7->6 better. PASS -> install.
- Part K (no edit, no compile): .preB238 = 35f0c73f/a6d765f0; installed .B237K -> Experts verified a62194f8/a975ea27, [B234EQ] 1, [B237TD] 1.
- Part T (same binary re-proof): RECON62-B238K window JL 34587863 verified, 22:25:08-22:30:48 PASSED, ex5 a975ea27 pre/post; cut once (TOOLS/job_cut_b238.py); grade 7/7-6/7-0; deal list identical to B237D deal for deal. EU not re-run (same binary + static ticks: ACCOUNTED, B-235 precedent); EU0525TD-B237D is the kept long baseline. Restored 17 charts + tini from pre-launch copies; EA stays installed.
- Part P: ROWPACK RECON62-B238K (6 day files) + EU0525TD-B237D (20 day files, DEAL+B234EQ+B237TD) + both DEALS + INDEX_B238 (21 rows); SETUPS EXECUTED-only (7 + 19 rows; REJECTED rows need full-tag packs, stated); REVIEW_BATCH_B238 no new items.
## Final disk state
- Kept: EA a62194f8/a975ea27, POI d47a0e68/04fcd8a5, terminal.ini a512582a (touch-class), 17 chart files, no terminal64. Review batch: REPORT/REVIEW_BATCH_B238.md (no new items).
## Record checklist (grep-verified in staged files)
- S separator + G1: FOUND
- K install SHAs + markers: FOUND
- T DEALS_B238K + cut + grade + deal compare: FOUND
- P INDEX_B238 + SETUPS x2 + batch: FOUND
- X fixplan State B-238 + pointer State B-238 + ledger 1385: FOUND
## Carried note
- B-236-filed EU day packs (journal_line -1) stay corrected on disk only; the fix is not staged in this relay (out of F5 scope), same for the TOOLS/job_cut_b235.py repair. Both owned in B-236/B-237 records.
- Next: F3-INPLAY reading/export road per EU_FIX_PLAN section 3.
