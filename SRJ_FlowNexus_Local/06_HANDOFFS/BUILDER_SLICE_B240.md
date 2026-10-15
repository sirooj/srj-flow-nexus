# BUILDER SLICE B-240 - raw rows (indicator reach D3)
Base: builder/B-240 cut at b7b9205 (= B-239 head). Verdict RESTORED (D3 NO-GAIN).
## Start gate
```
log-1 b7b9205 (backup ls-remote exact; on B-240).
status 995 (+B-239 artifacts ACCOUNTED). gated diff EMPTY on all 0.3 files + both skills + LESSONS + ledger.
Disk: EA a62194f8/a975ea27; Flow a8201128/c82f175e; POI d47a0e68/04fcd8a5; tini a512582a.
Cuts B238K + EU B237D present. Tick STATIC (10-06 18678468). No terminal64. Ledger ^1386=1 ^1387=0 pre. Python 3.13.16.
```
## Part B banking
```
50 L4 + 21 L2 + 28 L2 counts 1 each: ALREADY_BANKED, no new words.
```
## Part K0 map (read-only; raw spots)
```
FlowLogic buffers: #property 55 (0-54 used; Hz 51-54). SetIndexBuffer 51-54 (Hz), 33 promo-time, 31/32 objIds, 24/25 FVG leg zone, 22/23 XOB zone.
FVG birth: GAP_FORM FlowLogic:1763 (B) / :1782 (S), arrays g_b176Bull/T1-T3/Top0/Bot0/Dead (+Span).
XOB records: g_orderblocks, COrderblock.isPromoted/promotionBar/low/high/objId; reach loop :1789+; LATEST prints :1846-1849.
Closed-bar step: barClosed block :1568 (B150 touch-latch :1570-1610, B162, B176); export cadence target=i-1 (:1152, :1963-1969).
EA: FL_BUF_* 0-54 max (:219); iCustom loads InpFlowLogicName=SRJ_FlowLogic with unchanged args (:12448-12453); ReadBuf1 :2018-2024; ReadFlow=+1 offset (:2087-2089, FLOW_SHIFT_OFFSET :2035); B177HZ :10478-10506; GoAbort EA:7112-class.
K0 verdict: PASS (buffers 55/56 free, arrays update in-loop, handle loads edited indicator).
```
## Part K1 rule check (no conflict; reached the edit)
```
rules/50 L4 + 21 L2 + 28 L2 + spec 3.5; touch at _Digits (B-237); reach-only; Dead printed never used.
```
## Part K2/K4 EA diff vs .preB240
```
--- 
+++ 
@@ -217,6 +217,9 @@
 #define FL_BUF_HZ_GAP_BEAR       52
 #define FL_BUF_HZ_WIN_BULL       53
 #define FL_BUF_HZ_WIN_BEAR       54
+//--- B240ZR Reached-zone counts per side (relay B-240 K3b; additive, next free indices).
+#define FL_BUF_B240_REACH_BULL   55
+#define FL_BUF_B240_REACH_BEAR   56
 
 #define SWEEP_NONE        0
 #define SWEEP_ASIA_HIGH   1
@@ -10503,6 +10506,16 @@
              {
               GoAbort(ABORT_HISZONE_NONE, g_state); return;
              }
+           //--- B240ZR reached-zone count gate (relay B-240 K3b; additive, after B177HZ pass).
+           {
+            double b240v = 0.0;
+            int b240buf = (g_dir == DIR_LONG) ? FL_BUF_B240_REACH_BULL : FL_BUF_B240_REACH_BEAR;
+            bool b240ok = ReadFlow(b240buf, b240v, barShift);
+            string b240out = "PASS";
+            if(b240ok && b240v == 0.0) b240out = "REFUSE";
+            if(InpDebugLog) PrintFormat("[SRJ-EA] [B240ZR] bar=%s dir=%s v=%s out=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (b240ok ? DoubleToString(b240v, 0) : "READFAIL"), b240out);
+            if(b240out == "REFUSE") { GoAbort("ZONE_NOT_REACHED", g_state); return; }
+           }
           }
 
       //--- [P-NEXTOPEN 2026-09-09, operator directive] The entry reference is
```
## Part K3a/K4 FlowLogic diff vs .preB240
```
--- 
+++ 
@@ -5,7 +5,7 @@
 #property copyright "SRJ Flow Logic Auto — Pine v6 port"
 #property version   "1.00"
 #property indicator_chart_window
-#property indicator_buffers 55  // [B177HZX] Was 51. Added 51 (bull gap-touched), 52 (bear gap-touched), 53 (bull XOBWIN), 54 (bear XOBWIN). [B156SL] Was 50. Added 50 (5m 2xOB flag). [B150PR] Was 48. Added 48 (bull PROMO-RETURN), 49 (bear PROMO-RETURN). [P-SWINGIMB-2 E5] Was 39. Added 39 (OB swing-bar time). [P-SWINGIMB] Was 37. Added 37 (swing-high imbalance code), 38 (swing-low imbalance code). [Task 113] Was 33. Added 33 (selected XOB promotionTime). [Task 102] Was 31. Added 31 (selected XOB objId), 32 (selected FVG objId). [Task 155] Was 34. Added 34 (tickOBIsValid provenance), 35 (tickFVGIsValid provenance, population deferred), 36 (hasPersistedOpposingFVG provenance, population deferred). [TP-DATA-SOURCE-COMPLETE-001] Was 40. Added 40-47 (prev-day session H/L shadow).
+#property indicator_buffers 57  // [B177HZX] Was 51. Added 51 (bull gap-touched), 52 (bear gap-touched), 53 (bull XOBWIN), 54 (bear XOBWIN). [B156SL] B240ZC Added 55 (bull reached-count), 56 (bear reached-count). Was 50. Added 50 (5m 2xOB flag). [B150PR] Was 48. Added 48 (bull PROMO-RETURN), 49 (bear PROMO-RETURN). [P-SWINGIMB-2 E5] Was 39. Added 39 (OB swing-bar time). [P-SWINGIMB] Was 37. Added 37 (swing-high imbalance code), 38 (swing-low imbalance code). [Task 113] Was 33. Added 33 (selected XOB promotionTime). [Task 102] Was 31. Added 31 (selected XOB objId), 32 (selected FVG objId). [Task 155] Was 34. Added 34 (tickOBIsValid provenance), 35 (tickFVGIsValid provenance, population deferred), 36 (hasPersistedOpposingFVG provenance, population deferred). [TP-DATA-SOURCE-COMPLETE-001] Was 40. Added 40-47 (prev-day session H/L shadow).
 #property indicator_plots   2
 
 #property indicator_label1  "Fractal High"
@@ -201,6 +201,12 @@
 double   g_bufHzGapBear[];
 double   g_bufHzWinBull[];
 double   g_bufHzWinBear[];
+//--- B240ZC Reached-zone counts per side (relay B-240; additive export, no gate).
+//--- Buffers 55/56 carry per-bar reached counts; flags latch per record objId.
+double   g_bufB240ReachBull[];
+double   g_bufB240ReachBear[];
+bool     g_b240FvgHit[];
+bool     g_b240XobHit[];
 datetime g_b177WinPromoB;
 datetime g_b177WinPromoS;
 bool     g_b177WinHitB;
@@ -807,6 +813,10 @@
     SetIndexBuffer(53, g_bufHzWinBull, INDICATOR_CALCULATIONS);
     SetIndexBuffer(54, g_bufHzWinBear, INDICATOR_CALCULATIONS);
 
+    // B240ZC Append-only. Indices 55-56 = previous buffer count (was 55 buffers, 0..54).
+    SetIndexBuffer(55, g_bufB240ReachBull, INDICATOR_CALCULATIONS);
+    SetIndexBuffer(56, g_bufB240ReachBear, INDICATOR_CALCULATIONS);
+
    ArraySetAsSeries(g_bufBias,         false);
    ArraySetAsSeries(g_bufOBValid,      false);
    ArraySetAsSeries(g_bufFVGValid,     false);
@@ -884,6 +894,10 @@
     ArraySetAsSeries(g_bufHzGapBear, false);
     ArraySetAsSeries(g_bufHzWinBull, false);
     ArraySetAsSeries(g_bufHzWinBear, false);
+
+    // B240ZC
+    ArraySetAsSeries(g_bufB240ReachBull, false);
+    ArraySetAsSeries(g_bufB240ReachBear, false);
 
    SRJ_BindInputs(); 
    SRJ_Glyph_Init(); 
@@ -1540,6 +1554,10 @@
          ArrayInitialize(g_bufB150Bull, 0.0);
          ArrayInitialize(g_bufB150Bear, 0.0);
          ArrayInitialize(g_buf2xOB, 0.0);   // [B156SL] new slots start empty
+         ArrayInitialize(g_bufB240ReachBull, 0.0);   // B240ZC counts start empty
+         ArrayInitialize(g_bufB240ReachBear, 0.0);
+         ArrayResize(g_b240FvgHit, 0);
+         ArrayResize(g_b240XobHit, 0);
          ArrayResize(g_b150Touched, 0);
          ArrayResize(g_b153cbT, 0);
          ArrayResize(g_b153cbH, 0);
@@ -1847,6 +1865,70 @@
                          TimeToString(time[i], TIME_DATE|TIME_MINUTES), b176nB, b176lpB);
              PrintFormat("[SRJ-IND] B176HZ LATEST side=S bar=%s nLive=%d latestPromoT=%s",
                          TimeToString(time[i], TIME_DATE|TIME_MINUTES), b176nS, b176lpS);
+             //--- B240ZC reached-zone counts per side (relay B-240; additive export, no gate).
+             //--- One latch flag per FVG / promoted XOB record keyed by objId (B150 idiom);
+             //--- reach test at _Digits; Dead/fill flags printed elsewhere, never used here.
+             {
+              int b240nB = 0, b240nS = 0;
+              int b240fn = g_imbalances.Total();
+              for(int b240k = 0; b240k < b240fn; b240k++)
+                {
+                 CImbalance *b240fv = GetFVG(g_imbalances, b240k);
+                 if(b240fv == NULL) continue;
+                 if(b240fv.startBar < 0 || b240fv.startBar >= i) continue;
+                 if(SrjIsNa(b240fv.top) || SrjIsNa(b240fv.bottom)) continue;
+                 long b240fid = b240fv.objId;
+                 if(b240fid <= 0) continue;
+                 int b240fi = (int)b240fid;
+                 if(b240fi >= ArraySize(g_b240FvgHit))
+                   {
+                    int b240fo = ArraySize(g_b240FvgHit);
+                    ArrayResize(g_b240FvgHit, b240fi + 1024);
+                    for(int b240fz = b240fo; b240fz < b240fi + 1024; b240fz++) g_b240FvgHit[b240fz] = false;
+                   }
+                 if(!g_b240FvgHit[b240fi])
+                   {
+                    bool b240t = b240fv.isBullish ? (NormalizeDouble(low[i],_Digits) <= NormalizeDouble(b240fv.top,_Digits))
+                                                  : (NormalizeDouble(high[i],_Digits) >= NormalizeDouble(b240fv.bottom,_Digits));
+                    if(b240t) g_b240FvgHit[b240fi] = true;
+                   }
+                 if(g_b240FvgHit[b240fi]) { if(b240fv.isBullish) b240nB++; else b240nS++; }
+                }
+              int b240rn = g_orderblocks.Total();
+              for(int b240q = 0; b240q < b240rn; b240q++)
+                {
+                 COrderblock *b240ob = GetOB(g_orderblocks, b240q);
+                 if(b240ob == NULL) continue;
+                 if(!b240ob.isPromoted) continue;
+                 if(SrjIsNa((int)b240ob.promotionBar)) continue;
+                 if(i <= (int)b240ob.promotionBar) continue;
+                 if(SrjIsNa(b240ob.low) || SrjIsNa(b240ob.high)) continue;
+                 long b240oid = b240ob.objId;
+                 if(b240oid <= 0) continue;
+                 int b240oi = (int)b240oid;
+                 if(b240oi >= ArraySize(g_b240XobHit))
+                   {
+                    int b240oo = ArraySize(g_b240XobHit);
+                    ArrayResize(g_b240XobHit, b240oi + 1024);
+                    for(int b240oz = b240oo; b240oz < b240oi + 1024; b240oz++) g_b240XobHit[b240oz] = false;
+                   }
+                 if(!g_b240XobHit[b240oi])
+                   {
+                    bool b240t = b240ob.isBullish ? (NormalizeDouble(low[i],_Digits) <= NormalizeDouble(b240ob.high,_Digits))
+                                                  : (NormalizeDouble(high[i],_Digits) >= NormalizeDouble(b240ob.low,_Digits));
+                    if(b240t) g_b240XobHit[b240oi] = true;
+                   }
+                 if(g_b240XobHit[b240oi]) { if(b240ob.isBullish) b240nB++; else b240nS++; }
+                }
+              int b240target = i - 1;
+              if(b240target >= 0)
+                {
+                 g_bufB240ReachBull[b240target] = (double)b240nB;
+                 g_bufB240ReachBear[b240target] = (double)b240nS;
+                }
+              PrintFormat("[SRJ-IND] [B240ZC] bar=%s bull=%d bear=%d",
+                          TimeToString(time[i], TIME_DATE|TIME_MINUTES), b240nB, b240nS);
+             }
              //--- B177HZX latest promotion per side (kept; feeds the B179HZB value).
              datetime b177curB = 0, b177curS = 0;
              if(b176pbB != SRJ_NA_INT)
```
Braces EA +2/+2, Flow +10/+10; [B240ZR] 1; [B240ZC] 1; [B234EQ]/[B237TD] kept.
Flow compile: 0 errors + 3 pre-existing warnings (long-to-int :1594/:1816/:1954, none in new lines). EA compile: 0 errors 0 warnings.
Builds: EA e9300f09/10903897 + Flow f3bfe426/0da02ca3. .B240K (4 files) verified pre-run (B-201).
ReadFlow-vs-ReadBuf1 note: K3b text names ReadBuf1(<handle>); the gate site reads via ReadFlow (settled +1, same as B177HZ neighbours sharing the write cadence) - deviation from letter, same handle, documented.
## Part T launches (EA 10903897 + Flow 0da02ca3 pre-launch, post-RECON, post-EU)
```
RECON62-B240D: WMI launcher PID 10660 23:01:59 (~15m pre-read of ~11GB log); terminal PID 6392 23:16:14; PRE=35640782; window JL35640798 (2026.08.26-2026.09.10); first replay 2026.08.28; launcher killed; watcher PID 6692; DONE PASSED 23:21:53 (~5m).
EU0525TD-B240D: terminal 6392 stopped; WMI launcher PID 18500 23:24:40 (~23m pre-read of ~12GB log); terminal PID 17960 23:47:56; PRE=36819968; window JL36819962 (2026.05.25-2026.10.13); first replay 2026.05.29; launcher killed; watcher PID 13328; watcher TIMEOUT_90MIN 01:23:19 (no rollover handling - tailed 20261015.log).
Completion verified in journal: "Test passed in 0:25:40" 00:14:17 + log-file-written + connection closed, all in 20261016.log. EU cut spans both logs (20261015 (PRE,EOF] + 20261016 [1, close+200], continuous numbering).
```
## Part T1/T3 grader outputs raw
```
GRADE RECON62-B240D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
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
GRADE EU0525TD-B240D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 6; MACHINE-ONLY ungraded 0; trades 19
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
T2 gate: 7/7 + 6/7 + 0 = PASS -> EU launched. T5: identical to baselines -> D3 NO-GAIN.
## Part T6 ZONEREACH rows (all 62 ZR PASS; 26 May / 4 Jun / 15 Jul / 28 Aug / 1 Sep quoted)
```
header: run,date,time,dir,v,out,cut line,zc
RECON62-B240D,2026-08-28,10:00,SHORT,23,PASS,36687715,47/23/ jl36687583
RECON62-B240D,2026-09-01,17:30,LONG,40,PASS,36721364,40/32/ jl36721198
EU0525TD-B240D,2026-05-26,15:45,SHORT,62,PASS,37713468,13/62/ jl37713350
EU0525TD-B240D,2026-06-04,10:00,LONG,13,PASS,37809411,13/65/ jl37809224
EU0525TD-B240D,2026-07-15,10:30,LONG,27,PASS,38348875,27/86/ jl38348425
EU0525TD-B240D,2026-07-15,16:30,LONG,27,PASS,38355776,27/87/ jl38355726
EU0525TD-B240D,2026-08-28,10:00,SHORT,54,PASS,39222355,86/54/ jl39221622
EU0525TD-B240D,2026-09-01,17:30,LONG,79,PASS,39311845,79/63/ jl39311078
```
62/62 ZR PASS, 0 READFAIL, 0 REFUSE. Deal diffs EMPTY both runs.
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking + K0 ~40m; K hunks + compiles ~20m; RECON launch-verify ~15m + run 5m; EU launch-verify ~23m + run ~26m; cuts + grades + repairs ~30m; records ~20m; commit/push follow.
Final disk: EA a62194f8/a975ea27, Flow a8201128/c82f175e, POI d47a0e68/04fcd8a5, tini from .preB240, 17 charts, no terminal64. .B240K unstaged (4 files).
Housekeeping: kept cuts stay (B238K + EU B237D); B240D cuts stay (current trial); job/launch/grade/status/done scripts uncommitted; nothing deleted.
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4344/35 PASS; result 3822/23 PASS; slice 18717/278 PASS (this file; '?' x4 = MQL5 ternaries in raw hunk quotes); TRUTH 3143 PASS; FIXPLAN 18076 PASS; BATCH240 207 PASS; LESSONS 19984 PASS; READ_MAP rewritten. Register (source) untouched. EA/indicator/POI committed files untouched (restored).
```
(End of slice)
