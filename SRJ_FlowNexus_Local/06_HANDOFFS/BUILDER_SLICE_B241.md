# BUILDER SLICE B-241 - raw rows (early-kill regrade D1)
Base: builder/B-241 cut at c7d698c (= B-240 head). Verdict RESTORED (D1 GAIN).
## Start gate
```
log-1 c7d698c (backup ls-remote exact; on B-241).
status 1022 (+B-240 artifacts ACCOUNTED). gated diff EMPTY on all 0.3 files + both skills + LESSONS + ledger.
Disk: EA a62194f8/a975ea27; Flow a8201128/c82f175e; POI d47a0e68/04fcd8a5; tini a512582a; .B216K SHAs verified (Panels f383866d, OB 915b4fc3, Imb d9a38776, Bias 0b334063, State 2e4f8a95, Flow ex5 839dec09).
Tick STATIC (10-06 18678468). No terminal64. Ledger ^1387=1 ^1388=0 pre. Python 3.13.16.
Line numbers: rules/50 L4 exact; 21/28 actual L2 (relay said L3).
```
## Part B banking + addendum
```
Relay quotes count 1 (no new rule words). Addendum line count 0/0 pre -> rules/50 appended (1344->1807 bytes) + REACHED-ONLY-INPLAY pin + index updated. Filing: not a new defect, no defect row, no LESSONS line.
```
## Part K0 port map (whole-hunk rule: all pieces or STOP)
```
Includes vs B-217 pristine: Panels 4335f703 MATCH, OB 8bbf936b MATCH, Imb 568f4ce9 MATCH, Bias 3b1d9d3d MATCH, State 80a466ac MATCH -> .B216K copies installed byte-exact (SHAs verified post-copy).
FlowLogic.mq5 a8201128 = B-216 flow src (no FlowLogic.mq5 edit needed).
H3 context in today EA: ST_S3_ZONE_WAIT (13 hits), CheckFreshness(int,bool)->string (:2770), FL_BUF_LTF_* (:173-175), LogAbort (:1844), S3 arming site with barShift (:9500 if(g_state == ST_S3_ZONE_WAIT)). H3 placed first inside that block.
```
## Part K1 rule check (quoted in B-215/B-216; re-verified, no conflict)
```
spec 3.4 kill pre-confirmation; 10 Jun / 25 Jun / 22 Jul must-nevers; dead-until-renewed; B215 P1/P2 (S3-pre scope, indicator-side ren).
```
## Part K3 EA H3 diff vs .preB241 (includes are byte-copies, diffs in B-215/B-216 slices)
```
--- 
+++ 
@@ -9499,6 +9499,28 @@
 
    if(g_state == ST_S3_ZONE_WAIT)
      {
+      // [B215H3] S3 pre-pass 2-of-3 kill (same refusal S4 applies; PRE_BINDING still skips everything else; never at S5/B182DEC/entry/after).
+      if(g_state == ST_S3_ZONE_WAIT)
+        {
+         string b215_fail = CheckFreshness(barShift, true);
+         if(b215_fail != "")
+           {
+            double b215_ob = 0.0, b215_fv = 0.0, b215_op = 0.0;
+            bool b215_ro = ReadFlow(FL_BUF_LTF_OB_VALID, b215_ob, barShift);
+            bool b215_rf = ReadFlow(FL_BUF_LTF_FVG_VALID, b215_fv, barShift);
+            bool b215_rp = ReadFlow(FL_BUF_LTF_OPP_FVG, b215_op, barShift);
+            int b215_a1 = (b215_ro && (int)MathRound(b215_ob) == 0) ? 1 : 0;
+            int b215_a2 = (b215_rf && (int)MathRound(b215_fv) == 0) ? 1 : 0;
+            int b215_a3 = (b215_rp && (int)MathRound(b215_op) == 1) ? 1 : 0;
+            int b215_n = b215_a1 + b215_a2 + b215_a3;
+            if(InpDebugLog)
+               PrintFormat("[SRJ-EA] B215F1 date=%s bar=%s state=%s ob=%d fvg=%d opp=%d adverse=%d action=KILL_S3",
+                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE),
+                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
+                           StateName(g_state), b215_a1, b215_a2, b215_a3, b215_n);
+            GoAbort(b215_fail, g_state); return;
+           }
+        }
       double xobHi, xobLo, fvgHi, fvgLo;
 
       // [Task 105] Identity census at the S3 arming site. Same rationale as the
```
Braces EA 1292->1294 (+2 H3); OB 125->131 (+6); Imb 65->69 (+4); Bias 34->36 (+2); State 7->8 (+1); Panels 46->46. Markers once each.
Flow compile: 0 errors + 3 pre-existing warnings (1576/1798/1872, same lines as B-215). EA compile: 0 errors 0 warnings.
Trial SHAs: EA 18a1d49b/d85cf7d2; Flow ex5 61177aa5 (!= B-216 839dec09: other-include drift + compiler; sources byte-exact). .B241K (9 files) verified pre-run (B-201).
## Part T launches (EA d85cf7d2 + Flow 61177aa5 pre-launch, post-RECON, post-EU)
```
RECON62-B241D: WMI launcher PID 12000; terminal PID 13844; PRE=2019288; window JL2019301 (2026.08.26-2026.09.10); first replay 2026.08.26; launcher killed; watcher PID 11744; DONE PASSED (~3m).
EU0525TD-B241D: terminal 13844 stopped; WMI launcher PID 15216; terminal PID 9120; PRE=3063917; window JL3063931 (2026.05.25-2026.10.13); first replay 2026.05.25; launcher killed; watcher PID 12772; DONE PASSED (~29m). Same day log, no rollover.
Cuts once per segment (TOOLS/job_cut_b241.py; DAYLOG day fix; B215F1/B216H1 bracket+date regex repairs, own defects owned).
```
## Part T1/T3 grader outputs raw
```
GRADE RECON62-B241D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
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
GRADE EU0525TD-B241D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 4; MACHINE-ONLY ungraded 0; trades 17
id,class,verdict,trade,exit,source
A1,KEEP,ENTRY EXACT,2026-08-28 sell 10:05 1.16466,EXIT DIFF machine 11:35 1.16467 vs owed 11:35 1.16464 (+3pt),register A row 1 + NOTE B-137 (his exit 11:35 open)
A2,KEEP,ENTRY EXACT,2026-09-01 buy 17:35 1.16024,EXIT EXACT,register A row 2 + NOTE B-137 (17:45 Yearly-POC close-through)
A3,KEEP,ENTRY EXACT,2026-09-04 buy 16:00 1.16019,EXIT EXACT,register A row 3 + CORRECTION B-33 (day close)
A4,KEEP,ENTRY EXACT,2026-09-07 buy 09:20 1.16138,EXIT EXACT,register A row 4 (TP 1.16201)
A5,NEVER,SILENT,-,-,his words 2026-10-15 B-235 addendum (verbatim; 16:35 valid retest by close
A6,KEEP,ENTRY EXACT,2026-09-08 sell 10:10 1.16205,EXIT EXACT,register A row 6 (TP 1.16102)
A7,KEEP,ENTRY EXACT,2026-09-08 sell 17:00 1.16220,EXIT EXACT,register A row 7 (SL 1.16275)
P3,KEEP,ENTRY EXACT,2026-06-18 buy 09:45 1.15256,EXIT EXACT,rules/43 0618-EU-FOMC-EXIT; B-223 KEPT
N10JUN,NEVER,SILENT,-,-,register C 0610-EU-INVALID
N25JUN,NEVER,FIRES,2026-06-25 sell 10:45 1.13540,-,register C 0625-EU-INVALID
N22JUL,NEVER,SILENT,-,-,register C 0722-EU-INVALID
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
T2 gate: 7/7 + 6/7 + 0 = PASS -> EU launched. T5: 10 Jun + 22 Jul silent, 25 Jun fires, keeps exact -> D1 GAIN.
## Part T6 KILL rows quoted (924 total: 140 RECON + 784 EU)
```
header: run,date,time,side,code,kind,jl
EU0525TD-B241D,2026-06-10,15:05,-,ob1/fvg1/opp0/adv2/KILL_S3,B215F1,4007629
EU0525TD-B241D,2026-06-10,15:15,-,ob1/fvg1/opp0/adv2/KILL_S3,B215F1,4007771
EU0525TD-B241D,2026-06-10,15:55,-,ob0/fvg1/opp1/adv2/KILL_S3,B215F1,4008664
EU0525TD-B241D,2026-06-10,18:35,-,ob1/fvg0/opp1/adv2/KILL_S3,B215F1,4012206
EU0525TD-B241D,2026-07-22,14:45,-,ob1/fvg1/opp0/adv2/KILL_S3,B215F1,4566234
```
25 Jun: 0 B215F1 rows (still fires, as predicted). Deal diff: RECON none; EU only the 10 Jun + 22 Jul pairs gone.
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking ~30m; K0 map + port + compiles ~30m; RECON launch-verify ~2m + run 3m; EU launch-verify ~2m + run 29m; cuts + grades + batch + records ~25m; commit/push follow.
Final disk: EA a62194f8/a975ea27, Flow a8201128/c82f175e, 5 includes pristine, POI d47a0e68/04fcd8a5, tini from .preB241, 17 charts, no terminal64. .B241K unstaged (9 files).
Housekeeping: kept cuts stay (B238K + EU B237D); B241D cuts stay (current trial); job/launch/grade/status/done scripts uncommitted; nothing deleted.
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4310/35 PASS; result 4014/28 PASS; slice 10715/143 PASS (this file; '?' x3 = MQL5 ternaries in raw H3 quote); TRUTH 3143 PASS; FIXPLAN 18656 PASS; BATCH241 369 PASS; LESSONS 19984 PASS; READ_MAP rewritten. Register (source) untouched. EA/indicator/include/POI committed files untouched (restored).
```
(End of slice)
