# BUILDER SLICE B-234 - raw rows (F10 diagnostic RESTORED H2)
Base: builder/B-234 cut at bab0380 (= B-233 head). Verdict RESTORED (H2 NARROW-NEXT).
## Start gate
```
log-1 bab03806ec9bd472f2a8a817c399af39a6049ebd (backup ls-remote exact; on B-234).
status 876 (+1 vs 875 = ACCOUNTED class). gated diff EMPTY on all 0.3 files + both skills + LESSONS + PLANNER_CONTEXT.
Disk: EA b4db21c5/61829f05 raw; POI src d47a0e68 raw (5f380587 normalized: CRLF file, raw governs) / ex5 04fcd8a5; tini 3a7ea233 raw ([Tester]+[TickLoad] intact).
Cuts CUT_RECON62-B230K 165047122 + CUT_EU0525TD-B229D 609929022 present. Tick STATIC (EURUSD_RAW 2026.hcc mtime 10-06, pre-B-233). No terminal64. Ledger ^1380=1 ^1381=0 pre. Python 3.13.16 (pointer path; py launcher absent, unused).
rules/48 L4 22-Sep words FOUND; L9 17-Aug words FOUND. rules/51 L4-L6 his words, L7 RETEST-EQUAL-OPEN, L8 LIVE-CANDLE-IS-TRUTH FOUND. SPEC 2 L9 wick-penetration row FOUND; 3.6 FOUND.
```
## Part B banking
```
rules/51 RETEST-EQUAL-OPEN count 1; rules/48 body-same-value count 1: ALREADY_BANKED.
```
## Part R0 (job_r0_b234.py, kept EU cut; JL = journal line; EQ = open==line at _Digits)
```
17 Aug Weekly-VWAP per candle (B196BAR hPx | WINLINE val | EQ vs hPx / vs WIN):
15:00 o1.15921 hPx=- (nH0) | ADD 1.15917 JL17993055 | NO/NO
15:05 o1.15954 hPx1.15917 JL17993119 | none | NO
15:10 o1.15929 hPx1.15917 JL17993181 | none | NO
15:15 o1.15925 hPx1.15917 JL17993236 | KILL 1.15918 JL17993240 | NO/NO
15:20 o1.15917 hPx1.15917 JL17993294 | none | YES
15:25 o1.15947 hPx1.15917 JL17993353 | none | NO
15:30 o1.15904 hPx1.15918 JL17993418 | ADD 1.15918 JL17993422 | NO/NO
15:35 o1.15911 hPx1.15918 JL17994127 | none | NO
15:40 o1.15910 hPx=- | KILL 1.15918 JL17994195 | NO(vs WIN)
15:45 o1.15941 hPx1.15917 JL17994249 | ADD 1.15918 JL17994253 | NO/NO
15:50 o1.15918 hPx1.15917 JL17994965 | FREEZE - | NO vs hPx; YES vs buffer 1.15918 (diagnostic reads buffer)
RETEST_B232 used 1.15924 (WINLINE JL17997039 = 17:30 KILL row) for all: FROZEN-VALUE defect B232-FROZEN-LINE owned.
22 Sep Quarterly-POC 1.14334 per candle: 18:40 o1.14338 NO JL18813974; 18:45 o1.14334 YES JL18814033 (KILL+ADD 1.14334); 18:50 o1.14325 NO JL18814983; 18:55 o1.14334 YES JL18815905.
```
## Part K0/K3 raw spots (EA line numbers on .preB234)
```
FIRE: LogSignal call EA:11838; B182DecPrint("FIRE") EA:1873 via LogSignal EA:1872-1873.
POI-by-shift read (WINLINE KILL test): EA:2344 `if(!ReadBuf1(g_hPoi, k, L, barShift)) continue;` + bar-map EA:7704-7709 + helper EA:2018-2024.
Retest candle: g_b61RetestTime EA:1129; shift idiom e.g. EA:10490 `iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true)`.
Refusal path: GoAbort(reason, g_state) EA:7112 (prints ABORT + A6REFUSED + B182DEC rows).
Rule check: rules/51 L7 (open==line invalid, no tolerance, _Digits); rules/48 L4 + L9; SPEC 2 L9 (wick >=1pt, body correct side).
```
## Part K4 hunk diff vs .preB234 (one hunk, braces +6/+6, [B234EQ] count 1)
```
@@ -11835,6 +11835,40 @@ (context: UJ5MENTRY block close, then LogSignal call)
+ //--- B234EQ diagnostic (always restored, rules/51 L7): refuse when the latest touching candle opens on the anchor line
+ { int b234ConfSh = barShift;
+   int b234RetSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+   int b234Sh = -1; double b234Val = 0.0;
+   if(g_anchorLine >= 0 && b234RetSh >= b234ConfSh && b234RetSh >= 0)
+    { for(int s = b234ConfSh; s <= b234RetSh; s++)
+       { double b234L = 0.0;
+         if(!ReadBuf1(g_hPoi, g_anchorLine, b234L, s)) continue;
+         if(b234L == EMPTY_VALUE || b234L <= 0.0) continue;
+         bool b234Touch = false;
+         if(g_dir == DIR_LONG) b234Touch = (iLow(_Symbol, PERIOD_CURRENT, s) <= b234L);
+         else if(g_dir == DIR_SHORT) b234Touch = (iHigh(_Symbol, PERIOD_CURRENT, s) >= b234L);
+         if(b234Touch) { b234Sh = s; b234Val = b234L; break; } } }
+   string b234Out = "PASS"; (bar/val/open default to confirmation candle / "-")
+   if(b234Sh >= 0) { read iOpen; b234Vs/b234Os at _Digits;
+     if(NormalizeDouble(open) == NormalizeDouble(val)) b234Out = "REFUSE"; }
+   if(InpDebugLog) PrintFormat("[SRJ-EA] [B234EQ] bar=%s dir=%s line=%s val=%s o=%s out=%s", ...);
+   if(b234Out == "REFUSE") { GoAbort("RETEST_OPEN_EQ", g_state); return; } }
```
## Part K4 compile + keep
```
metaeditor64 /compile: 0 errors, 0 warnings, 15112 ms. src 35f0c73f ex5 a6d765f0. .B234K copies verified 35f0c73f/a6d765f0 pre-run (B-201).
```
## Part T launches (ex5 a6d765f0 pre-launch, post-RECON, post-EU: binary proof clean)
```
RECON62-B234D: WMI launcher PID 20012 16:52:10 (7m pre-read of 6.7GB day log); terminal PID 16560 16:59:16; PRE_JOURNAL_LINES=20393726; window JL20393739 (from 2026.08.26 to 2026.09.10); first replay 2026.08.27; launcher killed; watcher PID 3784; DONE PASSED 17:04:12 (~5m).
EU0525TD-B234D: terminal 16560 stopped; WMI launcher PID 20296 17:05:03; terminal PID 14896 17:13:59; PRE_JOURNAL_LINES=21446649; window JL21446666 (from 2026.05.25 to 2026.10.13); first replay 2026.05.28; launcher killed; watcher PID 15412; DONE PASSED 17:42:17 (~28m); terminal stopped by PID. D: 141.3 -> 137.2 GB.
One cut (job_cut_b234.py, 24774106 lines): CUT_RECON62-B234D + CUT_EU0525TD-B234D + DEALS + EQOPEN + day packs.
```
## Part T3/T4 grader outputs raw
```
GRADE RECON62-B234D: KEEP entries exact 7/8; KEEP exits exact 6/8; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
A1 EXACT (+3pt exit); A2 EXACT/EXACT; A3 EXACT/EXACT; A4 EXACT/EXACT; A5 MISSING (16:45 1.16264); A6 EXACT/EXACT; A7 EXACT/EXACT; K2SEP EXACT/EXACT; all NEVER SILENT.
GRADE EU0525TD-B234D: KEEP entries exact 13/14; KEEP exits exact 12/14; NEVER fires 7; MACHINE-ONLY ungraded 0; trades 20
A1-A4 EXACT; A5 MISSING; A6 A7 P3 V29JUN K28MAY K8JUL K2SEP K8OCT K5AUG EXACT; N17AUG SILENT; N4SEP0930 SILENT; fires: N10JUN N25JUN N22JUL N22SEP N26MAY N4JUN1005 N15JUL1035.
Kept lines to beat: RECON 8/8-6/8-0; EU 14/14-12/14-8. T3 gate: A5 MISSING = KEEP worse -> gate fired; EU already launched back-to-back, graded for record.
```
## Part T6 decision rows (EQOPEN_B234.csv; 30 rows total, 2 REFUSE)
```
17 Aug window: EU 15:50 LONG Weekly-VWAP 1.15918 o1.15918 REFUSE JL23426988 (N17AUG deal gone).
22 Sep window: EU 18:50 SHORT Quarterly-POC 1.14334 o1.14325 PASS JL24250108 (18:55 never decides; N22SEP fires 19:00).
Changed deals: 16:40 LONG Weekly-POC 1.16249 o1.16249 REFUSE JL21404564 (RECON) + JL23932667 (EU) = A5 gone both runs.
All other 27 rows PASS (keeps + other NEVERs, values within 1-2pt of opens).
```
## Part S copy (SEPARATOR_B234.csv: SEPARATES 14, BREAKS 1, OTHER-GATE 16)
```
SEPARATES: A1 A2 A3 A4 A6 A7 P3 V29JUN K28MAY K8JUL K2SEP K8OCT K5AUG (KEEP PASS) + N17AUG (REFUSE 15:50 silent).
BREAKS: A5 (REFUSE 16:40 missing both runs).
OTHER-GATE: N10JUN N25JUN N22JUL N26MAY N4JUN1005 N15JUL1035 (PASS+fire, F1/F2/F3 lanes) + N22SEP (PASS 18:50+fire) + 8 silent-NONE (N4SEP1040 N1SEP1530 N27AUG N28AUG1625 N8SEP1645 N7SEPSHORT N4SEP0930 W28JUL).
H2 NARROW-NEXT: A5 worse; no new NEVER fire; N22SEP still fires.
```
## Timing + final disk + housekeeping
```
Wall: gate+reads ~30m; R0 ~15m (1 own defect: JL enumerate vs journal field, caught); K ~15m; compile ~1m; RECON launch-verify ~12m + run 5m; EU launch-verify ~9m + run 28m; cut+grades ~15m; records ~20m.
Final disk RESTORED: EA b4db21c5/61829f05, POI d47a0e68/04fcd8a5, tini 3a7ea233, 18 charts, no terminal64. .B234K unstaged.
Housekeeping: kept cuts B230K/B229D + B234D cuts stay (current trial); job/launch/grade/status/done scripts uncommitted; nothing deleted.
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4525/35 PASS; result 5097/26 PASS; slice 7987/104 PASS (this file; '?' x1 = MQL5 ternary in raw hunk quote); TRUTH 3067 PASS; RULES51 1088 PASS; FIXPLAN 15831 PASS; BATCH234 360 PASS; LESSONS 19854 PASS; QUESTION_LOG 1353 unchanged PASS; READ_MAP rewritten. Register + grade script untouched. EA/POI committed sources untouched (restored).
```
(End of slice)
