# BUILDER SLICE B-237 - raw rows (touch-digits D1)
Base: builder/B-237 cut at 7db5875 (= B-236 head). Verdict RESTORED (D1 GAIN).
## Start gate
```
log-1 7db5875 (backup ls-remote exact; on B-237).
status 959 (+B-236 artifacts ACCOUNTED). gated diff EMPTY except SLICE_B234 figure line.
Disk: EA 35f0c73f/a6d765f0; POI d47a0e68 raw/04fcd8a5; tini a512582a; [B234EQ] 1; [B236NO] 0.
Tick STATIC (10-06 18678468). No terminal64. Ledger ^1383=1 ^1384=0 pre. Python 3.13.16.
```
## Part K paste (EA:11851-11854 pre-edit) + diff vs .preB237
```
11851 bool b234Touch = false;
11852 if(g_dir == DIR_LONG) b234Touch = (iLow(_Symbol, PERIOD_CURRENT, s) <= b234L);
11853 else if(g_dir == DIR_SHORT) b234Touch = (iHigh(_Symbol, PERIOD_CURRENT, s) >= b234L);
11854 if(b234Touch) { b234Sh = s; b234Val = b234L; break; }
--- 
+++ 
@@ -11849,8 +11849,9 @@
                if(!ReadBuf1(g_hPoi, g_anchorLine, b234L, s)) continue;
                if(b234L == EMPTY_VALUE || b234L <= 0.0) continue;
                bool b234Touch = false;
-               if(g_dir == DIR_LONG) b234Touch = (iLow(_Symbol, PERIOD_CURRENT, s) <= b234L);
-               else if(g_dir == DIR_SHORT) b234Touch = (iHigh(_Symbol, PERIOD_CURRENT, s) >= b234L);
+               if(g_dir == DIR_LONG) b234Touch = (NormalizeDouble(iLow(_Symbol, PERIOD_CURRENT, s), _Digits) <= NormalizeDouble(b234L, _Digits));
+               else if(g_dir == DIR_SHORT) b234Touch = (NormalizeDouble(iHigh(_Symbol, PERIOD_CURRENT, s), _Digits) >= NormalizeDouble(b234L, _Digits));
+               if(InpDebugLog) PrintFormat("[SRJ-EA] [B237TD] bar=%s dir=%d raw=%.10f val=%s hi=%s lo=%s o=%s touch=%d", TimeToString(iTime(_Symbol,PERIOD_CURRENT,s)), g_dir, b234L, DoubleToString(b234L,_Digits), DoubleToString(iHigh(_Symbol,PERIOD_CURRENT,s),_Digits), DoubleToString(iLow(_Symbol,PERIOD_CURRENT,s),_Digits), DoubleToString(iOpen(_Symbol,PERIOD_CURRENT,s),_Digits), (b234Touch ? 1 : 0));
                if(b234Touch) { b234Sh = s; b234Val = b234L; break; }
               }
            }
```
Braces equal 1292/1292; [B237TD] 1; [B234EQ] 1. Compile: 0 errors, 0 warnings, 15747 ms. src a62194f8 ex5 a975ea27. .B237K verified pre-run (B-201).
Rule check: 48 L4 + 51 L5/L7/L8 + 52 L3/L4 + spec s2r1/s4; 5-digit compare = chart price, no tolerance; no conflict.
## Part T launches (ex5 a975ea27 pre-launch, post-RECON, post-EU)
```
RECON62-B237D: WMI launcher PID 8076 20:57:39 (~13m pre-read); terminal PID 8892 21:10:57; PRE=30207464; window JL30207480 (2026.08.26-2026.09.10); first replay 2026.08.27; launcher killed; watcher PID 3132; DONE PASSED 21:15:35 (~5m).
EU0525TD-B237D: terminal 8892 stopped; WMI launcher PID 14852 21:17:07 (~10m pre-read); terminal PID 18580 21:27:23; PRE=31260399; window JL31260416 (2026.05.25-2026.10.13); first replay 2026.05.29; launcher killed; watcher PID 13496; DONE PASSED 21:52:01 (~25m); terminal stopped by PID.
Cuts once per segment (TOOLS/job_cut_b237.py: RECON 31260399 lines/14 deals/18 rows; EU 34587847 lines/38 deals/56 rows).
```
## Part T1/T3 grader outputs raw
```
GRADE RECON62-B237D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
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
GRADE EU0525TD-B237D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 6; MACHINE-ONLY ungraded 0; trades 19
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
N22SEP,NEVER,SILENT,-,-,his words 2026-10-15 review batch item 11 (verbatim)+his words 2026-10-15 B-233 addendum
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
T2 gate: 7/7 + 6/7 + 0 = PASS -> EU launched. T5: EU identical except N22SEP SILENT (19 deals) -> D1 GAIN.
## Part T6 TOUCHDIG 22 Sep 18:45-18:55 rows
```
EU0525TD-B237D,2026-09-22,18:55,2026.09.22 18:55,1.1433400000,1.14334,1.14334,1.14307,1.14334,1,34063889
EU0525TD-B237D,2026-09-22,18:55,2026.09.22 18:55,-,1.14334,-,-,1.14334,REFUSE,34063890
```
TOUCHDIG_B237.csv: 74 rows. Deal diff: RECON none; EU only 22 Sep pair gone (19:00 sell 1.14314, 19:13 buy 1.14306).
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking ~25m; K + compile ~10m; RECON launch-verify ~13m + run 5m; EU launch-verify ~10m + run 25m; cuts + grades + pack work ~20m; records ~25m; commit/push follow.
Final disk: EA 35f0c73f/a6d765f0 (kept, restored), POI d47a0e68/04fcd8a5, tini from .preB237, 17 charts, no terminal64. .B237K unstaged (a62194f8/a975ea27).
Housekeeping: kept cuts stay; B237D cuts stay (current trial); job/launch/grade/status/done/pack scripts uncommitted; nothing deleted.
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4464/35 PASS; result 3779/26 PASS; slice 9084/110 PASS (this file; '?' x1 = MQL5 ternary in raw hunk quote); TRUTH 3143 PASS; RULES52 2165 PASS; SKILL-index PASS; FIXPLAN 17089 PASS; BATCH237 240 PASS; LESSONS 19984 PASS; VALID_TRADES 16100 PASS; VALID_TRADES_HELD 8033 PASS; READ_MAP rewritten. Register (source) untouched. EA/POI committed sources untouched (restored).
```
(End of slice)
