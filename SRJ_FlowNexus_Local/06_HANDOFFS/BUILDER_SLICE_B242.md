# BUILDER SLICE B-242 - raw rows (F1/F2 install KEPT)
Base: builder/B-242 cut at 1415188 (= B-241 head). Verdict KEPT (G1 pass, install + re-proof).
## Start gate
```
log-1 1415188 (backup ls-remote exact; on B-242).
status 1058 (+B-241 artifacts ACCOUNTED). gated diff EMPTY on all 0.3 files + both skills + LESSONS + ledger.
Disk: kept EA a62194f8/a975ea27 + Flow a8201128/c82f175e + 5 includes pristine + POI d47a0e68/04fcd8a5; .B241K verified (EA 18a1d49b/d85cf7d2, Flow 61177aa5, 5x .B216K SHAs).
Tini b64523fc touch-class ACCOUNTED ([Tester] RECON dates + Symbol intact, [TickLoad] intact); B-241 gate line imprecise (owned, no evidence impact).
Tick STATIC (10-06 18678468). No terminal64. Ledger ^1388=1 ^1389=0 pre. Python 3.13.16.
```
## Part B banking
```
REACHED-ONLY-INPLAY pin + addendum line count 1: ALREADY_BANKED, no new words.
```
## Part S separator copy (SEPARATOR_B242.csv: SEPARATES 14, OTHER-GATE 16)
```
id,class,RECON62-B241D,EU0525TD-B241D,kept-baseline,label
A1,KEEP,ENTRY EXACT + EXIT DIFF(+3pt),ENTRY EXACT + EXIT DIFF(+3pt),same as trial,SEPARATES
A2,KEEP,ENTRY EXACT + EXIT EXACT,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
A3,KEEP,ENTRY EXACT + EXIT EXACT,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
A4,KEEP,ENTRY EXACT + EXIT EXACT,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
A5,NEVER,SILENT,SILENT,B238K/B237D SILENT,OTHER-GATE
A6,KEEP,ENTRY EXACT + EXIT EXACT,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
A7,KEEP,ENTRY EXACT + EXIT EXACT,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
P3,KEEP,-,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
N10JUN,NEVER,-,SILENT,B237D FIRES,SEPARATES
N25JUN,NEVER,-,FIRES,same as trial,OTHER-GATE
N22JUL,NEVER,-,SILENT,B237D FIRES,SEPARATES
N4SEP1040,NEVER,-,SILENT,same as trial,OTHER-GATE
N1SEP1530,NEVER,-,SILENT,same as trial,OTHER-GATE
N27AUG,NEVER,-,SILENT,same as trial,OTHER-GATE
N28AUG1625,NEVER,-,SILENT,same as trial,OTHER-GATE
N8SEP1645,NEVER,-,SILENT,same as trial,OTHER-GATE
N7SEPSHORT,NEVER,-,SILENT,same as trial,OTHER-GATE
W28JUL,WATCH,-,SILENT,same as trial,OTHER-GATE
V29JUN,KEEP,-,ENTRY EXACT + EXIT EXACT,same as trial,SEPARATES
N22SEP,NEVER,-,SILENT,same as trial,OTHER-GATE
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
G1: no KEEP worse, fires only drop (EU 6->4), better -> PASS -> install.
## Part K install SHAs (no edit, no compile)
```
.preB242: EA a62194f8/a975ea27, Flow a8201128/c82f175e, 5 includes pristine. Installed: EA 18a1d49b/d85cf7d2, Flow ex5 61177aa5 (src a8201128 unchanged), Panels f383866d, OB 915b4fc3, Imb d9a38776, Bias 0b334063, State 2e4f8a95. Markers [B215H1][B215H2][B215H3][B216H1b][B216H1c] + [B234EQ][B237TD] each 1.
```
## Part T launch + raw grade + deal compare
```
RECON62-B242K: dates 1787702400/1788998400 written + read back; EA d85cf7d2 + Flow 61177aa5 pre. WMI launcher PID 13136; terminal PID 14272; PRE=6276314; window JL6276327 (2026.08.26-2026.09.10); first replay 2026.08.26; launcher killed; watcher PID 8908; DONE PASSED (~4m). ex5 pair post-run verified.
Cut once (TOOLS/job_cut_b242.py).
```
```
GRADE RECON62-B242K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
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
Deal compare B242K vs B241D: IDENTICAL deal for deal. T2: 7/7-6/7-0 PASS.
EU not re-run: same binaries + static ticks (ACCOUNTED, B-235/B-238 precedent). Restored 17 charts + tini from pre-launch copies; installed files stay; no terminal64.
## INDEX_B242.md copy
```
# INDEX_B242 - KEEP rows to day-pack lines (B242K/B241D cuts)

register_row | run | date | side | entry | day_pack | pack_lines
K28MAY | EU0525TD-B241D | 2026-05-28 | buy | 11:50 | ROWPACK/EU0525TD-B241D/20260528.csv | 6
P3 | EU0525TD-B241D | 2026-06-18 | buy | 09:45 | ROWPACK/EU0525TD-B241D/20260618.csv | 3
V29JUN | EU0525TD-B241D | 2026-06-29 | buy | 16:15 | ROWPACK/EU0525TD-B241D/20260629.csv | 3
K8JUL | EU0525TD-B241D | 2026-07-08 | sell | 14:50 | ROWPACK/EU0525TD-B241D/20260708.csv | 4
K5AUG | EU0525TD-B241D | 2026-08-05 | buy | 11:20 | ROWPACK/EU0525TD-B241D/20260805.csv | 4
A1 | RECON62-B242K | 2026-08-28 | sell | 10:05 | ROWPACK/RECON62-B242K/20260828.csv | 4
A1 | EU0525TD-B241D | 2026-08-28 | sell | 10:05 | ROWPACK/EU0525TD-B241D/20260828.csv | 4
A2 | RECON62-B242K | 2026-09-01 | buy | 17:35 | ROWPACK/RECON62-B242K/20260901.csv | 3
A2 | EU0525TD-B241D | 2026-09-01 | buy | 17:35 | ROWPACK/EU0525TD-B241D/20260901.csv | 3
K2SEP | RECON62-B242K | 2026-09-02 | sell | 14:45 | ROWPACK/RECON62-B242K/20260902.csv | 4
K2SEP | EU0525TD-B241D | 2026-09-02 | sell | 14:45 | ROWPACK/EU0525TD-B241D/20260902.csv | 4
A3 | RECON62-B242K | 2026-09-04 | buy | 16:00 | ROWPACK/RECON62-B242K/20260904.csv | 3
A3 | EU0525TD-B241D | 2026-09-04 | buy | 16:00 | ROWPACK/EU0525TD-B241D/20260904.csv | 3
A4 | RECON62-B242K | 2026-09-07 | buy | 09:20 | ROWPACK/RECON62-B242K/20260907.csv | 3
A4 | EU0525TD-B241D | 2026-09-07 | buy | 09:20 | ROWPACK/EU0525TD-B241D/20260907.csv | 3
A6 | RECON62-B242K | 2026-09-08 | sell | 10:10 | ROWPACK/RECON62-B242K/20260908.csv | 3
A6 | EU0525TD-B241D | 2026-09-08 | sell | 10:10 | ROWPACK/EU0525TD-B241D/20260908.csv | 3
A7 | RECON62-B242K | 2026-09-08 | sell | 17:00 | ROWPACK/RECON62-B242K/20260908.csv | 7
A7 | EU0525TD-B241D | 2026-09-08 | sell | 17:00 | ROWPACK/EU0525TD-B241D/20260908.csv | 7
K8OCT | EU0525TD-B241D | 2026-10-08 | sell | 11:35 | ROWPACK/EU0525TD-B241D/20261008.csv | 3

A5 (7 Sep NY long 16:45) is NEVER: no pack lines (silent both kept runs).
```
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking + S ~25m; install ~10m; T launch-verify ~2m + run 4m; cut + packs + setups ~15m; records ~15m; commit/push follow.
Final disk KEPT: EA 18a1d49b/d85cf7d2 + Flow 61177aa5 + 5 includes (.B241K) + POI d47a0e68/04fcd8a5, tini b64523fc (touch-class), 17 charts, no terminal64.
Housekeeping: kept cuts stay (B242K + EU B241D current); job/launch/grade/status/done/pack scripts uncommitted; nothing deleted.
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4299/35 PASS; result 2881/22 PASS; slice 8213/118 PASS (this file); TRUTH 3143 PASS; FIXPLAN 19168 PASS; BATCH242 167 PASS; LESSONS 19984 PASS; READ_MAP rewritten. Register (source) untouched. EA/indicator/include/POI committed files untouched (installed files run from disk, never staged).
```
(End of slice)
