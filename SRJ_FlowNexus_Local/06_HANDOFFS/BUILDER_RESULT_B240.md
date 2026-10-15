GRADE RECON62-B238K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B237D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 6; MACHINE-ONLY ungraded 0; trades 19
GRADE RECON62-B240D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B240D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 6; MACHINE-ONLY ungraded 0; trades 19
# BUILDER RESULT B-240 - RESTORED (EURUSD): indicator reach counts never hit 0, D3 NO-GAIN
Trader summary: Your "no zone reached, no trade" rule was built as a counting test inside the machine's zone indicator: every candle now counts how many of its zones price has touched. It changes nothing, because the machine holds dozens of old zones and the count never drops to zero at any take, valid or invalid. The change is undone; the kept build stands. The rule needs a smaller set of zones to count, or your word on which zone carries each take.
## Relay order (B-240 F3-INPLAY 6 of 6 diagnostic 3; RESTORED D3 NO-GAIN)
- Part 0 on builder/B-240 cut at b7b9205 (backup exact). Python 3.13.16. Reads per 0.3 in order. Gate: log-1 b7b9205, status 995 (+B-239 artifacts ACCOUNTED, listed), gated diff EMPTY, EA a62194f8/a975ea27 + POI d47a0e68/04fcd8a5 + tini a512582a + Flow a8201128/c82f175e, tick STATIC (10-06 18678468), no terminal64, ledger ^1386=1 ^1387=0.
- Part B: no new rule words (50 L4 + 21 L2 + 28 L2 counts 1).
- Part K0 (map in slice, no STOP): FVG arrays + XOB records + reach loop all in FlowLogic; buffers 0-54 used (55/56 free); EA handle loads SRJ_FlowLogic with unchanged args; ReadBuf1/ReadFlow + B177HZ confirmed. New buffers ride the target=i-1 cadence; EA reads via ReadFlow (settled offset, same as neighbours).
- Part K (hunks in slice): FlowLogic reached flags per record (objId idiom) + count buffers 55/56 + one [B240ZC] row per bar; EA FL_BUF 55/56 + gate read at B177HZ with [B240ZR] row, refuse on 0, READFAIL passes. Braces EA +2/+2, Flow +10/+10; tags 1 each; B234EQ/B237TD kept. Flow compile 0 errors + 3 pre-existing warnings (long-to-int at 1594/1816/1954, none in new lines); EA compile 0 errors 0 warnings. Builds EA e9300f09/10903897 + Flow f3bfe426/0da02ca3; .B240K verified pre-run.
- Part T (both ex5 SHAs pre/post both runs): RECON62-B240D window JL 35640798 verified, PASSED, grade 7/7-6/7-0 (T2 gate passes); EU0525TD-B240D window JL 36819962 verified, completion "Test passed" 00:14:17 in 20261016.log (midnight rollover; tailored cut spans both logs), grade 13/13-12/13-6. Cuts once per segment (TOOLS/job_cut_b240.py). D3 NO-GAIN: identical to baselines.
- Part T6 (ZONEREACH_B240.csv, 62 ZR rows + same-bar ZC, 0 READFAIL, 0 REFUSE): 26 May SHORT v62, 4 Jun LONG v13, 15 Jul LONG v27 (x2 passes), 28 Aug SHORT v54, 1 Sep LONG v79/81. Deal diffs EMPTY both runs.
- Part T4 restored EA/Flow src+ex5 + 17 charts + tini from .preB240, SHAs verified; .B240K unstaged.
## Final disk state
- Kept: EA a62194f8/a975ea27, Flow a8201128/c82f175e, POI d47a0e68/04fcd8a5, terminal.ini a512582a (touch-class), 17 chart files, no terminal64. Review batch: REPORT/REVIEW_BATCH_B240.md (no new items).
## Record checklist (grep-verified in staged files)
- X ledger 1387 + fixplan State B-240 + pointer State B-240 + Lane 6/6: FOUND
- T DEALS_B240D x2 + cuts + grades + ZONEREACH: FOUND
- Q batch no-new-items: FOUND
## Carried note
- The watcher (watch_run.ps1) has no midnight-rollover handling: it tailed 20261015.log while completion landed in 20261016.log, then filed TIMEOUT_90MIN. The run itself passed ("Test passed in 0:25:40"). Fix for the next relay that crosses midnight: point the watcher at the new day log or teach it the rollover. Owned here.
- Next: F3 PARKED 6 of 6, next EU_FIX_PLAN item F1/F2.
