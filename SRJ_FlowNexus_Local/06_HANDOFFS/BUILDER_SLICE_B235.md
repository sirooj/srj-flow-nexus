# BUILDER SLICE B-235 - raw rows (NEXT-OPEN-EQUAL KEPT)
Base: builder/B-235 cut at cfd31c5 (= B-234 head). Verdict KEPT (G1 pass, install + re-proof).
## Start gate
```
log-1 cfd31c5 (backup ls-remote exact; on B-235).
status 903 (+27 B-234 job/launch/grade/status/done artifacts ACCOUNTED, listed in result).
gated diff EMPTY on all 0.3 files + both skills + LESSONS, except SLICE_B234 1-line size-gate figure fix (ACCOUNTED: committed 7987/ae01175b, recomputed 8002/b8fecfd4).
Disk: EA b4db21c5/61829f05; POI d47a0e68 raw/04fcd8a5; .B234K 35f0c73f/a6d765f0; tini touch-class ACCOUNTED ([Tester] RECON dates + Symbol EURUSD intact, [TickLoad] intact; RecompiledAll stamp + Docking bit from B-234 compile).
Cuts B230K/B229D/B234D(x2) present. Kept DEALS FOUND (ROWPACK). Tick STATIC (EURUSD_RAW 2026.hcc 10-06 18678468). No terminal64. Ledger ^1381=1 ^1382=0 pre. Python 3.13.16.
```
## Part B banking (grep-first)
```
rules/ "16:40, the opening of the candle is the same value" count 0 -> rules/52 written verbatim (2157 bytes) + SKILL index line (now 52 files). NEXT-OPEN-EQUAL count 0 pre.
Journal OPERATOR_TRADE_JOURNAL.csv: no B-233 ruling-row shape = NOT FOUND, skipped.
```
## Part R truth edits
```
REGISTER_TRUTH.csv: A5 KEEP -> NEVER (exact relay row; exit cells emptied).
VALID_TRADES: section A row 5 NOTE + section C row appended; no row deleted.
QUESTION_LOG.md: 2026-09-07 NY long ANSWERED B-235 line appended.
```
## Part S grader outputs raw x5 (new truth)
```
GRADE RECON62-B230K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 1; MACHINE-ONLY ungraded 0; trades 8
id,class,verdict,trade,exit,source
A1,KEEP,ENTRY EXACT,2026-08-28 sell 10:05 1.16466,EXIT DIFF machine 11:35 1.16467 vs owed 11:35 1.16464 (+3pt),register A row 1 + NOTE B-137 (his exit 11:35 open)
A2,KEEP,ENTRY EXACT,2026-09-01 buy 17:35 1.16024,EXIT EXACT,register A row 2 + NOTE B-137 (17:45 Yearly-POC close-through)
A3,KEEP,ENTRY EXACT,2026-09-04 buy 16:00 1.16019,EXIT EXACT,register A row 3 + CORRECTION B-33 (day close)
A4,KEEP,ENTRY EXACT,2026-09-07 buy 09:20 1.16138,EXIT EXACT,register A row 4 (TP 1.16201)
A5,NEVER,FIRES,2026-09-07 buy 16:45 1.16264,-,his words 2026-10-15 B-235 addendum (verbatim; 16:35 valid retest by close
A6,KEEP,ENTRY EXACT,2026-09-08 sell 10:10 1.16205,EXIT EXACT,register A row 6 (TP 1.16102)
A7,KEEP,ENTRY EXACT,2026-09-08 sell 17:00 1.16220,EXIT EXACT,register A row 7 (SL 1.16275)
N4SEP1040,NEVER,SILENT,-,-,register C 4 Sep 10:40 short
N1SEP1530,NEVER,SILENT,-,-,register C 1 Sep 15:30 take
N27AUG,NEVER,SILENT,-,-,register C 27 Aug take (any NY entry that day)
N28AUG1625,NEVER,SILENT,-,-,register C 28 Aug 16:25
N8SEP1645,NEVER,SILENT,-,-,register C 8 Sep 16:45
N7SEPSHORT,NEVER,SILENT,-,-,rules/47 0907-NY-SHORT-INVALID
K2SEP,KEEP,ENTRY EXACT,2026-09-02 sell 14:45 1.15747,EXIT EXACT,his words 2026-10-15 review batch item 9 (verbatim)
N4SEP0930,NEVER,SILENT,-,-,his words 2026-10-15 review batch item 10 (verbatim; item names London 09:30)
```
```
GRADE EU0525TD-B229D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 9; MACHINE-ONLY ungraded 0; trades 22
id,class,verdict,trade,exit,source
A1,KEEP,ENTRY EXACT,2026-08-28 sell 10:05 1.16466,EXIT DIFF machine 11:35 1.16467 vs owed 11:35 1.16464 (+3pt),register A row 1 + NOTE B-137 (his exit 11:35 open)
A2,KEEP,ENTRY EXACT,2026-09-01 buy 17:35 1.16024,EXIT EXACT,register A row 2 + NOTE B-137 (17:45 Yearly-POC close-through)
A3,KEEP,ENTRY EXACT,2026-09-04 buy 16:00 1.16019,EXIT EXACT,register A row 3 + CORRECTION B-33 (day close)
A4,KEEP,ENTRY EXACT,2026-09-07 buy 09:20 1.16138,EXIT EXACT,register A row 4 (TP 1.16201)
A5,NEVER,FIRES,2026-09-07 buy 16:45 1.16264,-,his words 2026-10-15 B-235 addendum (verbatim; 16:35 valid retest by close
A6,KEEP,ENTRY EXACT,2026-09-08 sell 10:10 1.16205,EXIT EXACT,register A row 6 (TP 1.16102)
A7,KEEP,ENTRY EXACT,2026-09-08 sell 17:00 1.16220,EXIT EXACT,register A row 7 (SL 1.16275)
P3,KEEP,ENTRY EXACT,2026-06-18 buy 09:45 1.15256,EXIT EXACT,rules/43 0618-EU-FOMC-EXIT; B-223 KEPT
N10JUN,NEVER,FIRES,2026-06-10 buy 16:15 1.15551,-,register C 0610-EU-INVALID
N25JUN,NEVER,FIRES,2026-06-25 sell 10:45 1.13540,-,register C 0625-EU-INVALID
N22JUL,NEVER,FIRES,2026-07-22 sell 14:55 1.14048,-,register C 0722-EU-INVALID
N4SEP1040,NEVER,SILENT,-,-,register C 4 Sep 10:40 short
N1SEP1530,NEVER,SILENT,-,-,register C 1 Sep 15:30 take
N27AUG,NEVER,SILENT,-,-,register C 27 Aug take (any NY entry that day)
N28AUG1625,NEVER,SILENT,-,-,register C 28 Aug 16:25
N8SEP1645,NEVER,SILENT,-,-,register C 8 Sep 16:45
N7SEPSHORT,NEVER,SILENT,-,-,rules/47 0907-NY-SHORT-INVALID
W28JUL,WATCH,SILENT,-,-,rules/43 question (not a ruling); register C NOTE B-223
V29JUN,KEEP,ENTRY EXACT,2026-06-29 buy 16:15 1.14039,EXIT EXACT,his words 2026-10-15 review batch item 4 (verbatim)
N22SEP,NEVER,FIRES,2026-09-22 sell 19:00 1.14314,-,his words 2026-10-15 review batch item 11 (verbatim)+his words 2026-10-15 B-233 addendum
K28MAY,KEEP,ENTRY EXACT,2026-05-28 buy 11:50 1.16134,EXIT EXACT,his words 2026-10-15 review batch item 2 (verbatim valid loss)
K8JUL,KEEP,ENTRY EXACT,2026-07-08 sell 14:50 1.14002,EXIT EXACT,his words 2026-10-15 review batch item 5 (verbatim)
K2SEP,KEEP,ENTRY EXACT,2026-09-02 sell 14:45 1.15747,EXIT EXACT,his words 2026-10-15 review batch item 9 (verbatim)
K8OCT,KEEP,ENTRY EXACT,2026-10-08 sell 11:35 1.11884,EXIT EXACT,his words 2026-10-15 review batch item 12 (verbatim)
N17AUG,NEVER,FIRES,2026-08-17 buy 15:55 1.15947,-,his words 2026-10-15 review batch item 8 (verbatim)+his words 2026-10-15 B-233 addendum
N4SEP0930,NEVER,SILENT,-,-,his words 2026-10-15 review batch item 10 (verbatim; item names London 09:30)
N26MAY,NEVER,FIRES,2026-05-26 sell 15:50 1.16336,-,his words 2026-10-15 review item 1 (verbatim; no 5m XOB or FVG in play)
N4JUN1005,NEVER,FIRES,2026-06-04 buy 10:05 1.16117,-,his words 2026-10-15 review item 3 (verbatim; not in play)
N15JUL1035,NEVER,FIRES,2026-07-15 buy 10:35 1.14227,-,his words 2026-10-15 review item 6 (verbatim; not in play)
K5AUG,KEEP,ENTRY EXACT,2026-08-05 buy 11:20 1.15409,EXIT EXACT,his words 2026-10-15 review item 7 (verbatim valid; setup class under check)
```
```
GRADE RECON62-B234D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
id,class,verdict,trade,exit,source
A1,KEEP,ENTRY EXACT,2026-08-28 sell 10:05 1.16466,EXIT DIFF machine 11:35 1.16467 vs owed 11:35 1.16464 (+3pt),register A row 1 + NOTE B-137 (his exit 11:35 open)
A2,KEEP,ENTRY EXACT,2026-09-01 buy 17:35 1.16024,EXIT EXACT,register A row 2 + NOTE B-137 (17:45 Yearly-POC close-through)
A3,KEEP,ENTRY EXACT,2026-09-04 buy 16:00 1.16019,EXIT EXACT,register A row 3 + CORRECTION B-33 (day close)
A4,KEEP,ENTRY EXACT,2026-09-07 buy 09:20 1.16138,EXIT EXACT,register A row 4 (TP 1.16201)
A5,NEVER,SILENT,-,-,his words 2026-10-15 B-235 addendum (verbatim; 16:35 valid retest by close
A6,KEEP,ENTRY EXACT,2026-09-08 sell 10:10 1.16205,EXIT EXACT,register A row 6 (TP 1.16102)
A7,KEEP,ENTRY EXACT,2026-09-08 sell 17:00 1.16220,EXIT EXACT,register A row 7 (SL 1.16275)
N4SEP1040,NEVER,SILENT,-,-,register C 4 Sep 10:40 short
N1SEP1530,NEVER,SILENT,-,-,register C 1 Sep 15:30 take
N27AUG,NEVER,SILENT,-,-,register C 27 Aug take (any NY entry that day)
N28AUG1625,NEVER,SILENT,-,-,register C 28 Aug 16:25
N8SEP1645,NEVER,SILENT,-,-,register C 8 Sep 16:45
N7SEPSHORT,NEVER,SILENT,-,-,rules/47 0907-NY-SHORT-INVALID
K2SEP,KEEP,ENTRY EXACT,2026-09-02 sell 14:45 1.15747,EXIT EXACT,his words 2026-10-15 review batch item 9 (verbatim)
N4SEP0930,NEVER,SILENT,-,-,his words 2026-10-15 review batch item 10 (verbatim; item names London 09:30)
```
```
GRADE EU0525TD-B234D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 7; MACHINE-ONLY ungraded 0; trades 20
id,class,verdict,trade,exit,source
A1,KEEP,ENTRY EXACT,2026-08-28 sell 10:05 1.16466,EXIT DIFF machine 11:35 1.16467 vs owed 11:35 1.16464 (+3pt),register A row 1 + NOTE B-137 (his exit 11:35 open)
A2,KEEP,ENTRY EXACT,2026-09-01 buy 17:35 1.16024,EXIT EXACT,register A row 2 + NOTE B-137 (17:45 Yearly-POC close-through)
A3,KEEP,ENTRY EXACT,2026-09-04 buy 16:00 1.16019,EXIT EXACT,register A row 3 + CORRECTION B-33 (day close)
A4,KEEP,ENTRY EXACT,2026-09-07 buy 09:20 1.16138,EXIT EXACT,register A row 4 (TP 1.16201)
A5,NEVER,SILENT,-,-,his words 2026-10-15 B-235 addendum (verbatim; 16:35 valid retest by close
A6,KEEP,ENTRY EXACT,2026-09-08 sell 10:10 1.16205,EXIT EXACT,register A row 6 (TP 1.16102)
A7,KEEP,ENTRY EXACT,2026-09-08 sell 17:00 1.16220,EXIT EXACT,register A row 7 (SL 1.16275)
P3,KEEP,ENTRY EXACT,2026-06-18 buy 09:45 1.15256,EXIT EXACT,rules/43 0618-EU-FOMC-EXIT; B-223 KEPT
N10JUN,NEVER,FIRES,2026-06-10 buy 16:15 1.15551,-,register C 0610-EU-INVALID
N25JUN,NEVER,FIRES,2026-06-25 sell 10:45 1.13540,-,register C 0625-EU-INVALID
N22JUL,NEVER,FIRES,2026-07-22 sell 14:55 1.14048,-,register C 0722-EU-INVALID
N4SEP1040,NEVER,SILENT,-,-,register C 4 Sep 10:40 short
N1SEP1530,NEVER,SILENT,-,-,register C 1 Sep 15:30 take
N27AUG,NEVER,SILENT,-,-,register C 27 Aug take (any NY entry that day)
N28AUG1625,NEVER,SILENT,-,-,register C 28 Aug 16:25
N8SEP1645,NEVER,SILENT,-,-,register C 8 Sep 16:45
N7SEPSHORT,NEVER,SILENT,-,-,rules/47 0907-NY-SHORT-INVALID
W28JUL,WATCH,SILENT,-,-,rules/43 question (not a ruling); register C NOTE B-223
V29JUN,KEEP,ENTRY EXACT,2026-06-29 buy 16:15 1.14039,EXIT EXACT,his words 2026-10-15 review batch item 4 (verbatim)
N22SEP,NEVER,FIRES,2026-09-22 sell 19:00 1.14314,-,his words 2026-10-15 review batch item 11 (verbatim)+his words 2026-10-15 B-233 addendum
K28MAY,KEEP,ENTRY EXACT,2026-05-28 buy 11:50 1.16134,EXIT EXACT,his words 2026-10-15 review batch item 2 (verbatim valid loss)
K8JUL,KEEP,ENTRY EXACT,2026-07-08 sell 14:50 1.14002,EXIT EXACT,his words 2026-10-15 review batch item 5 (verbatim)
K2SEP,KEEP,ENTRY EXACT,2026-09-02 sell 14:45 1.15747,EXIT EXACT,his words 2026-10-15 review batch item 9 (verbatim)
K8OCT,KEEP,ENTRY EXACT,2026-10-08 sell 11:35 1.11884,EXIT EXACT,his words 2026-10-15 review batch item 12 (verbatim)
N17AUG,NEVER,SILENT,-,-,his words 2026-10-15 review batch item 8 (verbatim)+his words 2026-10-15 B-233 addendum
N4SEP0930,NEVER,SILENT,-,-,his words 2026-10-15 review batch item 10 (verbatim; item names London 09:30)
N26MAY,NEVER,FIRES,2026-05-26 sell 15:50 1.16336,-,his words 2026-10-15 review item 1 (verbatim; no 5m XOB or FVG in play)
N4JUN1005,NEVER,FIRES,2026-06-04 buy 10:05 1.16117,-,his words 2026-10-15 review item 3 (verbatim; not in play)
N15JUL1035,NEVER,FIRES,2026-07-15 buy 10:35 1.14227,-,his words 2026-10-15 review item 6 (verbatim; not in play)
K5AUG,KEEP,ENTRY EXACT,2026-08-05 buy 11:20 1.15409,EXIT EXACT,his words 2026-10-15 review item 7 (verbatim valid; setup class under check)
```
```
GRADE RECON62-B235K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
id,class,verdict,trade,exit,source
A1,KEEP,ENTRY EXACT,2026-08-28 sell 10:05 1.16466,EXIT DIFF machine 11:35 1.16467 vs owed 11:35 1.16464 (+3pt),register A row 1 + NOTE B-137 (his exit 11:35 open)
A2,KEEP,ENTRY EXACT,2026-09-01 buy 17:35 1.16024,EXIT EXACT,register A row 2 + NOTE B-137 (17:45 Yearly-POC close-through)
A3,KEEP,ENTRY EXACT,2026-09-04 buy 16:00 1.16019,EXIT EXACT,register A row 3 + CORRECTION B-33 (day close)
A4,KEEP,ENTRY EXACT,2026-09-07 buy 09:20 1.16138,EXIT EXACT,register A row 4 (TP 1.16201)
A5,NEVER,SILENT,-,-,his words 2026-10-15 B-235 addendum (verbatim; 16:35 valid retest by close
A6,KEEP,ENTRY EXACT,2026-09-08 sell 10:10 1.16205,EXIT EXACT,register A row 6 (TP 1.16102)
A7,KEEP,ENTRY EXACT,2026-09-08 sell 17:00 1.16220,EXIT EXACT,register A row 7 (SL 1.16275)
N4SEP1040,NEVER,SILENT,-,-,register C 4 Sep 10:40 short
N1SEP1530,NEVER,SILENT,-,-,register C 1 Sep 15:30 take
N27AUG,NEVER,SILENT,-,-,register C 27 Aug take (any NY entry that day)
N28AUG1625,NEVER,SILENT,-,-,register C 28 Aug 16:25
N8SEP1645,NEVER,SILENT,-,-,register C 8 Sep 16:45
N7SEPSHORT,NEVER,SILENT,-,-,rules/47 0907-NY-SHORT-INVALID
K2SEP,KEEP,ENTRY EXACT,2026-09-02 sell 14:45 1.15747,EXIT EXACT,his words 2026-10-15 review batch item 9 (verbatim)
N4SEP0930,NEVER,SILENT,-,-,his words 2026-10-15 review batch item 10 (verbatim; item names London 09:30)
```
G1: B234D vs kept both windows: KEEP rows identical (7/7-6/7, 13/13-12/13), NEVER fires 1->0 and 9->7, better both runs. PASS -> install.
## SEPARATOR_B235.csv copy (A5 patched to NEVER SILENT SEPARATES; else = B234)
```
id,class,run,eq_row,eq_journal_line,grader,sep
A1,KEEP,RECON62-B234D+EU0525TD-B234D,PASS 09:55 SHORT Daily-VWAP 1.16490 o=1.16473,21317051,EU:EXACT RECON:EXACT,SEPARATES
A2,KEEP,RECON62-B234D+EU0525TD-B234D,PASS 17:30 LONG Monthly-VWAP 1.16009 o=1.16010,21350026,EU:EXACT RECON:EXACT,SEPARATES
A3,KEEP,RECON62-B234D+EU0525TD-B234D,PASS 15:55 LONG Yearly-POC 1.15987 o=1.15997,21387403,EU:EXACT RECON:EXACT,SEPARATES
A4,KEEP,RECON62-B234D+EU0525TD-B234D,PASS 09:15 LONG Weekly-POC 1.16109 o=1.16113,21397133,EU:EXACT RECON:EXACT,SEPARATES
A5,NEVER,RECON62-B234D+EU0525TD-B234D,REFUSE 16:40 LONG Weekly-POC 1.16249 o=1.16249,21404564,EU:SILENT RECON:SILENT,SEPARATES
A6,KEEP,RECON62-B234D+EU0525TD-B234D,PASS 10:05 SHORT Monthly-POC 1.16229 o=1.16222,21413786,EU:EXACT RECON:EXACT,SEPARATES
A7,KEEP,RECON62-B234D+EU0525TD-B234D,PASS 16:55 SHORT Monthly-POC 1.16229 o=1.16226,21418988,EU:EXACT RECON:EXACT,SEPARATES
P3,KEEP,EU0525TD-B234D,PASS 09:40 LONG Daily-POC 1.15217 o=1.15223,22500243,EU:EXACT,SEPARATES
N10JUN,NEVER,EU0525TD-B234D,PASS 15:30 LONG Daily-VWAP 1.15463 o=1.15464,22393481,EU:FIRES,OTHER-GATE
N25JUN,NEVER,EU0525TD-B234D,PASS 10:40 SHORT Weekly-POC 1.13548 o=1.13543,22594872,EU:FIRES,OTHER-GATE
N22JUL,NEVER,EU0525TD-B234D,PASS 14:45 SHORT Weekly-POC 1.14065 o=1.14050,22966087,EU:FIRES,OTHER-GATE
N4SEP1040,NEVER,EU0525TD-B234D,NONE,-,EU:SILENT,OTHER-GATE
N1SEP1530,NEVER,EU0525TD-B234D,NONE,-,EU:SILENT,OTHER-GATE
N27AUG,NEVER,EU0525TD-B234D,NONE,-,EU:SILENT,OTHER-GATE
N28AUG1625,NEVER,EU0525TD-B234D,NONE,-,EU:SILENT,OTHER-GATE
N8SEP1645,NEVER,EU0525TD-B234D,NONE,-,EU:SILENT,OTHER-GATE
N7SEPSHORT,NEVER,EU0525TD-B234D,NONE,-,EU:SILENT,OTHER-GATE
W28JUL,WATCH,EU0525TD-B234D,NONE,-,EU:SILENT,OTHER-GATE
V29JUN,KEEP,EU0525TD-B234D,PASS 16:10 LONG Weekly-POC 1.14031 o=1.14033,22627962,EU:EXACT,SEPARATES
N22SEP,NEVER,EU0525TD-B234D,PASS 18:50 SHORT Quarterly-POC 1.14334 o=1.14325,24250108,EU:FIRES,OTHER-GATE
K28MAY,KEEP,EU0525TD-B234D,PASS 11:30 LONG Daily-VWAP 1.16089 o=1.16095,22262162,EU:EXACT,SEPARATES
K8JUL,KEEP,EU0525TD-B234D,PASS 14:40 SHORT Daily-POC 1.14057 o=1.13946,22765468,EU:EXACT,SEPARATES
K2SEP,KEEP,RECON62-B234D+EU0525TD-B234D,PASS 14:35 SHORT Daily-VWAP 1.15785 o=1.15759,21359626,EU:EXACT RECON:EXACT,SEPARATES
K8OCT,KEEP,EU0525TD-B234D,PASS 11:30 SHORT Daily-VWAP 1.11974 o=1.11967,24656118,EU:EXACT,SEPARATES
N17AUG,NEVER,EU0525TD-B234D,REFUSE 15:50 LONG Weekly-VWAP 1.15918 o=1.15918,23426988,EU:SILENT,SEPARATES
N4SEP0930,NEVER,EU0525TD-B234D,NONE,-,EU:SILENT,OTHER-GATE
N26MAY,NEVER,EU0525TD-B234D,PASS 15:40 SHORT Daily-POC 1.16349 o=1.16336,22236250,EU:FIRES,OTHER-GATE
N4JUN1005,NEVER,EU0525TD-B234D,PASS 09:55 LONG Daily-POC 1.16089 o=1.16119,22330151,EU:FIRES,OTHER-GATE
N15JUL1035,NEVER,EU0525TD-B234D,PASS 10:25 LONG FOMC-VWAP 1.14210 o=1.14236,22861491,EU:FIRES,OTHER-GATE
K5AUG,KEEP,EU0525TD-B234D,PASS 11:10 LONG Daily-POC 1.15363 o=1.15368,23220902,EU:EXACT,SEPARATES
```
## Part K install SHAs (no edit, no compile)
```
.preB235 EA src b4db21c5 / ex5 61829f05 (copies). Installed .B234K -> Experts: src 35f0c73f / ex5 a6d765f0 verified; [B234EQ] count 1 in src.
```
## Part T confirmation run
```
RECON62-B235K: dates 1787702400/1788998400 written + read back; ex5 a6d765f0 pre. WMI launcher PID 18284 18:42:26 (~13m pre-read of 8.2GB day log); terminal PID 5136 18:55:14; PRE_JOURNAL_LINES=24774106; window JL24774119 (from 2026.08.26 to 2026.09.10); first replay 2026.09.01; launcher killed; watcher PID 11020; DONE PASSED 19:00:11 (~5m). ex5 a6d765f0 post.
Cut once (TOOLS/job_cut_b235.py, 25827029 lines): CUT_RECON62-B235K.log + DEALS (14) + 6 day packs; EU packs from committed B234D cut (17 new, 3 full-tag kept).
Deal identity B235K vs B234D (deal,side,date,time,price,volume): IDENTICAL incl deal numbers. T2 grade 7/7-6/7-0 (raw above).
EU not re-run: same binary a6d765f0 pre/post both B-234 runs + static ticks (ACCOUNTED). Restored tini + 17 charts from .preB235 (chart06.chr deleted by terminal exit, ACCOUNTED). EA stays installed.
```
## INDEX_B235.md copy
```
# INDEX_B235 - KEEP rows to day-pack lines (B235K/B234D cuts, new truth)

register_row | run | date | side | entry | day_pack | pack_lines
K28MAY | EU0525TD-B234D | 2026-05-28 | buy | 11:50 | ROWPACK/EU0525TD-B234D/20260528.csv | 2
P3 | EU0525TD-B234D | 2026-06-18 | buy | 09:45 | ROWPACK/EU0525TD-B234D/20260618.csv | 2
V29JUN | EU0525TD-B234D | 2026-06-29 | buy | 16:15 | ROWPACK/EU0525TD-B234D/20260629.csv | 2
K8JUL | EU0525TD-B234D | 2026-07-08 | sell | 14:50 | ROWPACK/EU0525TD-B234D/20260708.csv | 2
K5AUG | EU0525TD-B234D | 2026-08-05 | buy | 11:20 | ROWPACK/EU0525TD-B234D/20260805.csv | 2
A1 | RECON62-B235K | 2026-08-28 | sell | 10:05 | ROWPACK/RECON62-B235K/20260828.csv | 2
A1 | EU0525TD-B234D | 2026-08-28 | sell | 10:05 | ROWPACK/EU0525TD-B234D/20260828.csv | 2
A2 | RECON62-B235K | 2026-09-01 | buy | 17:35 | ROWPACK/RECON62-B235K/20260901.csv | 2
A2 | EU0525TD-B234D | 2026-09-01 | buy | 17:35 | ROWPACK/EU0525TD-B234D/20260901.csv | 2
K2SEP | RECON62-B235K | 2026-09-02 | sell | 14:45 | ROWPACK/RECON62-B235K/20260902.csv | 2
K2SEP | EU0525TD-B234D | 2026-09-02 | sell | 14:45 | ROWPACK/EU0525TD-B234D/20260902.csv | 2
A3 | RECON62-B235K | 2026-09-04 | buy | 16:00 | ROWPACK/RECON62-B235K/20260904.csv | 2
A3 | EU0525TD-B234D | 2026-09-04 | buy | 16:00 | ROWPACK/EU0525TD-B234D/20260904.csv | 2
A4 | RECON62-B235K | 2026-09-07 | buy | 09:20 | ROWPACK/RECON62-B235K/20260907.csv | 2
A4 | EU0525TD-B234D | 2026-09-07 | buy | 09:20 | ROWPACK/EU0525TD-B234D/20260907.csv | 338
A6 | RECON62-B235K | 2026-09-08 | sell | 10:10 | ROWPACK/RECON62-B235K/20260908.csv | 2
A6 | EU0525TD-B234D | 2026-09-08 | sell | 10:10 | ROWPACK/EU0525TD-B234D/20260908.csv | 2
A7 | RECON62-B235K | 2026-09-08 | sell | 17:00 | ROWPACK/RECON62-B235K/20260908.csv | 5
A7 | EU0525TD-B234D | 2026-09-08 | sell | 17:00 | ROWPACK/EU0525TD-B234D/20260908.csv | 5
K8OCT | EU0525TD-B234D | 2026-10-08 | sell | 11:35 | ROWPACK/EU0525TD-B234D/20261008.csv | 2

A5 (7 Sep NY long 16:45) is NEVER on the new truth: no pack lines (silent both kept runs).
```
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking + truth + regrades ~40m; install ~5m; R0 script ~10m; T launch-verify ~13m + run 5m; cut + packs + setups ~15m; records ~20m; commit/push follow.
Final disk KEPT: EA 35f0c73f/a6d765f0, POI d47a0e68/04fcd8a5, tini a512582a (touch-class), 17 charts, no terminal64.
Housekeeping: kept cuts stay; B235K cut/ini uncommitted; nothing deleted.
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4434/35 PASS; result 4267/26 PASS; slice 19471/232 PASS (this file); TRUTH 3143 PASS; RULES52 2157 PASS; SKILL-index PASS; FIXPLAN 16352 PASS; BATCH235 321 PASS; LESSONS 19999 PASS; QUESTION_LOG 1463 PASS; VALID_TRADES 23650 OVER-CAP pre-existing (23070 at base, +580 ordered append; filed per F3, flagged); READ_MAP rewritten. Register (source) untouched. EA/POI committed sources untouched (installed build runs from disk, never staged).
```
(End of slice)
