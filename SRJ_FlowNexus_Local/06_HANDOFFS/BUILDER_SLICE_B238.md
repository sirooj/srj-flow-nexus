# BUILDER SLICE B-238 - raw rows (F10 install KEPT)
Base: builder/B-238 cut at f5ef77d (= B-237 head). Verdict KEPT (G1 pass, install + re-proof).
## Start gate
```
log-1 f5ef77d (backup ls-remote exact; on B-238).
status 982 (+B-237 artifacts ACCOUNTED). gated diff EMPTY except SLICE_B234 figure line.
Disk: EA 35f0c73f/a6d765f0; .B237K a62194f8/a975ea27 verified; POI d47a0e68/04fcd8a5; tini a512582a.
Cuts B237D RECON 154523643 + EU 577040237 present. Tick STATIC (10-06 18678468). No terminal64. Ledger ^1384=1 ^1385=0 pre. Python 3.13.16.
```
## Part S separator copy (SEPARATOR_B238.csv: SEPARATES 13, OTHER-GATE 17)
```
id,class,RECON62-B237D,EU0525TD-B237D,kept-baseline,label
A1,KEEP,ENTRY EXACT + EXIT DIFF(+3pt),ENTRY EXACT + EXIT DIFF(+3pt),same as trial,SEPARATES
A2,KEEP,ENTRY EXACT + EXIT EXACT,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
A3,KEEP,ENTRY EXACT + EXIT EXACT,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
A4,KEEP,ENTRY EXACT + EXIT EXACT,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
A5,NEVER,SILENT,SILENT,B235K/B234D FIRES,OTHER-GATE
A6,KEEP,ENTRY EXACT + EXIT EXACT,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
A7,KEEP,ENTRY EXACT + EXIT EXACT,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
P3,KEEP,-,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
N10JUN,NEVER,-,FIRES,same as trial,OTHER-GATE
N25JUN,NEVER,-,FIRES,same as trial,OTHER-GATE
N22JUL,NEVER,-,FIRES,same as trial,OTHER-GATE
N4SEP1040,NEVER,-,SILENT,same as trial,OTHER-GATE
N1SEP1530,NEVER,-,SILENT,same as trial,OTHER-GATE
N27AUG,NEVER,-,SILENT,same as trial,OTHER-GATE
N28AUG1625,NEVER,-,SILENT,same as trial,OTHER-GATE
N8SEP1645,NEVER,-,SILENT,same as trial,OTHER-GATE
N7SEPSHORT,NEVER,-,SILENT,same as trial,OTHER-GATE
W28JUL,WATCH,-,SILENT,same as trial,OTHER-GATE
V29JUN,KEEP,-,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
N22SEP,NEVER,-,SILENT,B234D FIRES,SEPARATES
K28MAY,KEEP,-,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
K8JUL,KEEP,-,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
K2SEP,KEEP,ENTRY EXACT + EXIT EXACT,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
K8OCT,KEEP,-,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
N17AUG,NEVER,-,SILENT,same as trial,OTHER-GATE
N4SEP0930,NEVER,-,SILENT,same as trial,OTHER-GATE
N26MAY,NEVER,-,FIRES,same as trial,OTHER-GATE
N4JUN1005,NEVER,-,FIRES,same as trial,OTHER-GATE
N15JUL1035,NEVER,-,FIRES,same as trial,OTHER-GATE
K5AUG,KEEP,-,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
```
G1: no KEEP worse, fires only drop (EU 7->6), better -> PASS -> install.
## Part K install SHAs (no edit, no compile)
```
.preB238 EA src 35f0c73f / ex5 a6d765f0. Installed .B237K -> Experts: src a62194f8 / ex5 a975ea27 verified; [B234EQ] 1; [B237TD] 1.
```
## Part T launch + raw grade + deal compare
```
RECON62-B238K: dates 1787702400/1788998400 written + read back; ex5 a975ea27 pre. WMI launcher PID 14508 22:07:01 (~18m pre-read of ~10GB day log); terminal PID 14724 22:25:08; PRE=34587847; window JL34587863 (2026.08.26-2026.09.10); first replay 2026.08.31; launcher killed; watcher PID 19476; DONE PASSED 22:30:48 (~5m). ex5 a975ea27 post.
Cut once (TOOLS/job_cut_b238.py, 35640782 lines, 14 deals, 18 TD/EQ rows).
```
```
GRADE RECON62-B238K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
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
Deal compare B238K vs B237D (deal,side,date,time,price,volume): IDENTICAL. T2: 7/7-6/7-0 PASS.
EU not re-run: same binary a975ea27 + static ticks (ACCOUNTED, B-235 precedent). Restored 17 charts + tini from pre-launch copies; EA stays installed; no terminal64.
## INDEX_B238.md copy
```
# INDEX_B238 - KEEP rows to day-pack lines (B238K/B237D cuts)

register_row | run | date | side | entry | day_pack | pack_lines
K28MAY | EU0525TD-B237D | 2026-05-28 | buy | 11:50 | ROWPACK/EU0525TD-B237D/20260528.csv | 6
P3 | EU0525TD-B237D | 2026-06-18 | buy | 09:45 | ROWPACK/EU0525TD-B237D/20260618.csv | 3
V29JUN | EU0525TD-B237D | 2026-06-29 | buy | 16:15 | ROWPACK/EU0525TD-B237D/20260629.csv | 3
K8JUL | EU0525TD-B237D | 2026-07-08 | sell | 14:50 | ROWPACK/EU0525TD-B237D/20260708.csv | 4
K5AUG | EU0525TD-B237D | 2026-08-05 | buy | 11:20 | ROWPACK/EU0525TD-B237D/20260805.csv | 4
A1 | RECON62-B238K | 2026-08-28 | sell | 10:05 | ROWPACK/RECON62-B238K/20260828.csv | 4
A1 | EU0525TD-B237D | 2026-08-28 | sell | 10:05 | ROWPACK/EU0525TD-B237D/20260828.csv | 4
A2 | RECON62-B238K | 2026-09-01 | buy | 17:35 | ROWPACK/RECON62-B238K/20260901.csv | 3
A2 | EU0525TD-B237D | 2026-09-01 | buy | 17:35 | ROWPACK/EU0525TD-B237D/20260901.csv | 3
K2SEP | RECON62-B238K | 2026-09-02 | sell | 14:45 | ROWPACK/RECON62-B238K/20260902.csv | 4
K2SEP | EU0525TD-B237D | 2026-09-02 | sell | 14:45 | ROWPACK/EU0525TD-B237D/20260902.csv | 4
A3 | RECON62-B238K | 2026-09-04 | buy | 16:00 | ROWPACK/RECON62-B238K/20260904.csv | 3
A3 | EU0525TD-B237D | 2026-09-04 | buy | 16:00 | ROWPACK/EU0525TD-B237D/20260904.csv | 3
A4 | RECON62-B238K | 2026-09-07 | buy | 09:20 | ROWPACK/RECON62-B238K/20260907.csv | 3
A4 | EU0525TD-B237D | 2026-09-07 | buy | 09:20 | ROWPACK/EU0525TD-B237D/20260907.csv | 3
A6 | RECON62-B238K | 2026-09-08 | sell | 10:10 | ROWPACK/RECON62-B238K/20260908.csv | 3
A6 | EU0525TD-B237D | 2026-09-08 | sell | 10:10 | ROWPACK/EU0525TD-B237D/20260908.csv | 3
A7 | RECON62-B238K | 2026-09-08 | sell | 17:00 | ROWPACK/RECON62-B238K/20260908.csv | 7
A7 | EU0525TD-B237D | 2026-09-08 | sell | 17:00 | ROWPACK/EU0525TD-B237D/20260908.csv | 7
K8OCT | EU0525TD-B237D | 2026-10-08 | sell | 11:35 | ROWPACK/EU0525TD-B237D/20261008.csv | 3

A5 (7 Sep NY long 16:45) is NEVER: no pack lines (silent both kept runs).
```
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking + S ~20m; install ~5m; T launch-verify ~18m + run 5m; cut + packs + setups ~15m; records ~15m; commit/push follow.
Final disk KEPT: EA a62194f8/a975ea27, POI d47a0e68/04fcd8a5, tini a512582a (touch-class), 17 charts, no terminal64.
Housekeeping: kept cuts stay (B238K + EU B237D current); job/launch/grade/status/done/pack scripts uncommitted; nothing deleted.
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4344/35 PASS; result 3056/26 PASS; slice 7837/113 PASS (this file); TRUTH 3143 PASS; FIXPLAN 17438 PASS; BATCH238 165 PASS; LESSONS 19984 PASS; VALID_TRADES 16100 PASS; VALID_TRADES_HELD 8033 PASS; READ_MAP rewritten. Register (source) untouched. EA/POI committed sources untouched (installed build runs from disk, never staged).
```
(End of slice)
