# BUILDER SLICE B-236 - raw rows (next-open walk D3)
Base: builder/B-236 cut at 85dbda0 (= B-235 head). Verdict RESTORED (D3 NO-GAIN).
## Start gate
```
log-1 85dbda0 (backup ls-remote exact; on B-236).
status 917 (+14 B-235 artifacts ACCOUNTED). gated diff EMPTY except ordered B1 pair.
Disk: EA 35f0c73f/a6d765f0; POI d47a0e68 raw/04fcd8a5; tini a512582a (touch-class); [B234EQ] 1.
Cuts B235K 154521865 + EU B234D 577041948 present. Tick STATIC (10-06 18678468). No terminal64. Ledger ^1382=1 ^1383=0 pre. Python 3.13.16.
```
## Part B counts
```
"the opening of the candle is the same value" count 1; "but the next candle of 1640, the opening of it is the same value" count 1; rules/52 2165 bytes; SKILL index updated.
```
## Part K0 helper + rule check
```
EA:2018-2024 bool ReadBuf1(int handle, int bufIdx, double &outVal, int shift = 1) { double tmp[1]; if(CopyBuffer(handle, bufIdx, shift, 1, tmp) != 1) return false; outVal = tmp[0]; return true; } - shift is a parameter, shift 0 valid (no STOP).
WINLINE read EA:2344 ReadBuf1(g_hPoi, k, L, barShift). [B234EQ] block end EA:11870-11871, LogSignal EA:11872.
rules/52 L3 (corrected sentence) + L4 (consider the next candle open); rules/51 L5; rules/48 L4; spec s2r1 (penetration >=1pt) + s4 (value at the next open). _Digits equality only.
```
## Part K2/K3 hunk diff vs .preB236 (working tree, before restore)
```
--- 
+++ 
@@ -11869,6 +11869,16 @@
          if(InpDebugLog) PrintFormat("[SRJ-EA] [B234EQ] bar=%s dir=%s line=%s val=%s o=%s out=%s", b234Bar, DirName(g_dir), AnchorStr(), b234Vs, b234Os, b234Out);
          if(b234Out == "REFUSE") { GoAbort("RETEST_OPEN_EQ", g_state); return; }
         }
+        { string b236Out = "PASS"; int b236Sh = -1; double b236Val = 0.0;
+          if(g_anchorLine >= 0 && barShift >= 1)
+           for(int s = barShift - 1; s >= 0; s--)
+            { double v = 0.0; if(!ReadBuf1(g_hPoi, g_anchorLine, v, s)) continue; if(v == EMPTY_VALUE || v <= 0.0) continue;
+              double vN = NormalizeDouble(v,_Digits), oN = NormalizeDouble(iOpen(_Symbol,PERIOD_CURRENT,s),_Digits);
+              int eq = (oN == vN ? 1 : 0);
+              if(InpDebugLog) PrintFormat("[SRJ-EA] [B236NO] bar=%s dir=%d val=%s o=%s eq=%d bs=%d", TimeToString(iTime(_Symbol,PERIOD_CURRENT,s)), g_dir, DoubleToString(vN,_Digits), DoubleToString(oN,_Digits), eq, barShift);
+              if(eq == 1 && b236Sh < 0) { b236Sh = s; b236Val = vN; b236Out = "REFUSE"; } }
+          if(InpDebugLog) PrintFormat("[SRJ-EA] [B236NOD] bar=%s bs=%d hit=%s val=%s out=%s", TimeToString(iTime(_Symbol,PERIOD_CURRENT,0)), barShift, (b236Sh >= 0 ? TimeToString(iTime(_Symbol,PERIOD_CURRENT,b236Sh)) : "NONE"), DoubleToString(b236Val,_Digits), b236Out);
+          if(b236Out == "REFUSE") { GoAbort("NEXT_OPEN_EQ", g_state); return; } }
         LogSignal(tpTarget, tpR, slRef, slMode, divKind);
         if(InpDebugLog) A6Fired(barShift, tpTarget, tpR, slRef, slMode, divKind);   //--- [A6-HOOK] (ii)
         if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1F_WATCH bar=%s dir=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir));   //--- [SIDE1F] (iii) fire watch (read-only)
```
Braces +4/+4 balanced; [B236NO] 1; [B236NOD] 1; [B234EQ] 1 kept; [B234EQ] block untouched.
Compile: 0 errors, 0 warnings, 16198 ms. src dc6c2b59 ex5 7f94ca81. .B236K verified pre-run (B-201).
## Part T launches (ex5 7f94ca81 pre-launch, post-RECON, post-EU)
```
RECON62-B236D: WMI launcher PID 20296 19:35:06 (~8m pre-read); terminal PID 20628 19:42:47; PRE=25827029; window JL25827045 (2026.08.26-2026.09.10); first replay 2026.08.31; launcher killed; watcher PID 17548; DONE PASSED 19:47:48 (~5m).
EU0525TD-B236D: terminal 20628 stopped; WMI launcher PID 7596 19:50:19 (~7m pre-read); terminal PID 16088 19:57:34; PRE=26879968; window JL26879982 (2026.05.25-2026.10.13); first replay 2026.05.29; launcher killed; watcher PID 5156; DONE PASSED 20:23:10 (~25m); terminal stopped by PID.
Cuts once per segment (TOOLS/job_cut_b236.py). D: not re-measured (short relay; disk ample).
```
## Part T2/T4 grader outputs raw
```
GRADE RECON62-B236D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
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
GRADE EU0525TD-B236D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 7; MACHINE-ONLY ungraded 0; trades 20
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
T3 gate: 7/7 + 6/7 + 0 fires = PASS -> EU launched. T5: baselines identical, nothing better -> D3 NO-GAIN.
## Part T6 NEXTOPEN_B236.csv (27 NOD rows, all PASS; NO rows for N22SEP quoted)
```
run,date,time,dir,bs,hit,val,out,cut line
RECON62-B236D,2026-08-28,10:05,-1,1,NONE,0.00000,PASS,26750358
RECON62-B236D,2026-09-01,17:35,1,1,NONE,0.00000,PASS,26783335
RECON62-B236D,2026-09-02,14:45,-1,1,NONE,0.00000,PASS,26792937
RECON62-B236D,2026-09-04,16:00,1,1,NONE,0.00000,PASS,26820716
RECON62-B236D,2026-09-07,09:20,1,1,NONE,0.00000,PASS,26830448
RECON62-B236D,2026-09-08,10:10,-1,1,NONE,0.00000,PASS,26847103
RECON62-B236D,2026-09-08,17:00,-1,1,NONE,0.00000,PASS,26852307
EU0525TD-B236D,2026-05-26,15:50,-1,1,NONE,0.00000,PASS,27669570
EU0525TD-B236D,2026-05-28,11:50,1,1,NONE,0.00000,PASS,27695484
EU0525TD-B236D,2026-06-04,10:05,1,1,NONE,0.00000,PASS,27763475
EU0525TD-B236D,2026-06-10,16:15,1,1,NONE,0.00000,PASS,27826807
EU0525TD-B236D,2026-06-18,09:45,1,1,NONE,0.00000,PASS,27933571
EU0525TD-B236D,2026-06-25,10:45,-1,1,NONE,0.00000,PASS,28028202
EU0525TD-B236D,2026-06-29,16:15,1,1,NONE,0.00000,PASS,28061294
EU0525TD-B236D,2026-07-08,14:50,-1,1,NONE,0.00000,PASS,28198802
EU0525TD-B236D,2026-07-15,10:35,1,1,NONE,0.00000,PASS,28294827
EU0525TD-B236D,2026-07-22,14:55,-1,1,NONE,0.00000,PASS,28399425
EU0525TD-B236D,2026-08-05,11:20,1,1,NONE,0.00000,PASS,28654242
EU0525TD-B236D,2026-08-28,10:05,-1,1,NONE,0.00000,PASS,29159351
EU0525TD-B236D,2026-09-01,17:35,1,1,NONE,0.00000,PASS,29248169
EU0525TD-B236D,2026-09-02,14:45,-1,1,NONE,0.00000,PASS,29263290
EU0525TD-B236D,2026-09-04,16:00,1,1,NONE,0.00000,PASS,29329969
EU0525TD-B236D,2026-09-07,09:20,1,1,NONE,0.00000,PASS,29345644
EU0525TD-B236D,2026-09-08,10:10,-1,1,NONE,0.00000,PASS,29380599
EU0525TD-B236D,2026-09-08,17:00,-1,1,NONE,0.00000,PASS,29392017
EU0525TD-B236D,2026-09-22,19:00,-1,1,NONE,0.00000,PASS,29683464
EU0525TD-B236D,2026-10-08,11:35,-1,1,NONE,0.00000,PASS,30089476
```
N22SEP pass: bar 19:00 bs 1 hit NONE val 0.00000 PASS; single NO row 19:00 dir -1 val 1.14334 o 1.14314 eq 0 bs 1. bs=1 on all 27 passes: only the forming open is ever checked.
09-22 EU pack 4636 rows (B234EQ 1, B236NO 1, B236NOD 1 at 19:00). No deals changed either run (deal-set diff EMPTY both).
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking ~30m; K + compile ~15m; RECON launch-verify ~8m + run 5m; EU launch-verify ~7m + run 25m; cuts + grades + pack repairs ~25m; records ~25m; commit/push follow.
Final disk: EA 35f0c73f/a6d765f0 (kept, restored), POI d47a0e68/04fcd8a5, tini from .preB236, 17 charts, no terminal64. .B236K unstaged (dc6c2b59/7f94ca81).
Housekeeping: kept cuts stay; B236D cuts stay (current trial); job/launch/grade/status/done/pack scripts uncommitted; nothing deleted.
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4464/35 PASS; result 4482/26 PASS; slice 11960/148 PASS (this file; '?' x2 = MQL5 ternaries in raw hunk quote); TRUTH 3143 PASS; RULES52 2165 PASS; SKILL-index PASS; FIXPLAN 16725 PASS; BATCH236 214 PASS; LESSONS 19999 PASS; VALID_TRADES 16100 PASS (folded); VALID_TRADES_HELD 8033 PASS; READ_MAP rewritten. Register (source) untouched. EA/POI committed sources untouched (restored).
```
(End of slice)
