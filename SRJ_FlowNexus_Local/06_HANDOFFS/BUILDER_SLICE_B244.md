# BUILDER SLICE B-244 - raw rows (dead-revival guard D3)
Base: builder/B-244 cut at 26e74a6 (= B-243 head). Verdict RESTORED (D3 NO-GAIN).
Relay numbering: tags/files normalized B-243->B-244 (branch, ledger 1391, runs B-244D are B-244; B-243 tag/file strings in the relay text are slips, owned here).
## Start gate
```
log-1 26e74a6 (backup ls-remote exact; on B-244).
status 1083 (+B-243 artifacts ACCOUNTED). gated diff EMPTY on all 0.3 files + both skills + LESSONS + ledger.
Disk: kept EA 18a1d49b/d85cf7d2 + Flow 61177aa5 + 5 includes + POI d47a0e68/04fcd8a5; tini b64523fc touch-class ([Tester]/[TickLoad] intact, RECON dates).
Tick STATIC (10-06 18678468). No terminal64. Ledger ^1390=1 ^1391=0 pre. Python 3.13.16.
```
## Part B banking
```
43 L7/L16 + 46 L4/L7 + spec 3.4 counts 1: ALREADY_BANKED, no new words.
```
## Part K0 map (read-only; raw spots)
```
H3 at S3 arming site EA:9500 (barShift in scope; identifiers verified). S4 pre kill exists EA:8381-8416 (CheckFreshness + GoAbort EA:8413/8415; S5 diagnostic-only).
Code6 writer ImbalanceMgr:341-354 (guard :341 KeepDead; revival tickOB=true :347-353). Code5 mirror :209-224. Write-time ren = structureConfirmedThisBar (set :328/:196, read State.mqh:270).
Per-block dead field: COrderblock.isValid + invalidationBar (live kill :131/:540, needs prior activation :121/:526). H1b sets no per-block mark (flag-only).
Renewal scan StrictNearest (OrderblockMgr:761-799) skips !isValid/!isActivated (:776); renewalOB = nearest + !hasDrivenRenewal (ImbalanceMgr:270-284/renewal branch).
K0 verdict: PROCEED (guard can read renewalOB->isValid; identity trial-measured).
```
## Part K1 rule check (no conflict)
```
spec 3.4 pre-confirmation; 43 L7/L16 must-never; 46 L4/L7 dead-until-renewed. H4a S4-pre only; H4b guard-read only (setter code/bar untouched).
```
## Part K3 EA H4a diff vs .preB244
```
--- 
+++ 
@@ -8378,6 +8378,28 @@
                   StateName(g_state),
                   AnchorStr());
 
+   //--- B244S4 S4 pre-pass 2-of-3 kill (relay B-244 H4a; same refusal S3 applies; never at S5/B182DEC/entry/after).
+   if(g_state == ST_S4_ARMED)
+     {
+      string b244_fail = CheckFreshness(barShift, true);
+      if(b244_fail != "")
+        {
+         double b244_ob = 0.0, b244_fv = 0.0, b244_op = 0.0;
+         bool b244_ro = ReadFlow(FL_BUF_LTF_OB_VALID, b244_ob, barShift);
+         bool b244_rf = ReadFlow(FL_BUF_LTF_FVG_VALID, b244_fv, barShift);
+         bool b244_rp = ReadFlow(FL_BUF_LTF_OPP_FVG, b244_op, barShift);
+         int b244_a1 = (b244_ro && (int)MathRound(b244_ob) == 0) ? 1 : 0;
+         int b244_a2 = (b244_rf && (int)MathRound(b244_fv) == 0) ? 1 : 0;
+         int b244_a3 = (b244_rp && (int)MathRound(b244_op) == 1) ? 1 : 0;
+         int b244_n = b244_a1 + b244_a2 + b244_a3;
+         if(InpDebugLog)
+            PrintFormat("[SRJ-EA] [B244S4] date=%s bar=%s state=%s ob=%d fvg=%d opp=%d adverse=%d action=KILL_S4",
+                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE),
+                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
+                        StateName(g_state), b244_a1, b244_a2, b244_a3, b244_n);
+         GoAbort(b244_fail, g_state); return;
+        }
+     }
    if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
      {
       //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
```
## Part K3 ImbalanceMgr H4b diff vs .preB244 (both branches)
```
--- 
+++ 
@@ -206,7 +206,14 @@
                g_s.obInvalidationBoundary = i;
                g_s.fvgDetectionBoundary = i;
 
-               if(B216_KeepDead())
+               //--- B244RV dead-block revival guard (relay B-244 H4b; reads the renewal OB's own dead state, not the write-time ren).
+               bool b244dead = (renewalOB != NULL && !renewalOB.isValid);
+               PrintFormat("[SRJ-IND] [B244RV] bar=%s dir=bullish id=%d dead=%d", SRJ_BarTimeStr(i), (renewalOB != NULL ? (int)renewalOB.objId : 0), (b244dead ? 1 : 0));
+               if(b244dead)
+                 {
+                  Print("[SRJ][T155][OBPROV] code=5 id=0 bar=", i, " flag=kept-dead h1");
+                 }
+               else if(B216_KeepDead())
                  {
                   Print("[SRJ][T155][OBPROV] code=5 id=0 bar=", i, " flag=kept-dead h1");
                  }
@@ -338,7 +345,14 @@
                g_s.obInvalidationBoundary = i;
                g_s.fvgDetectionBoundary = i;
 
-               if(B216_KeepDead())
+               //--- B244RV dead-block revival guard (relay B-244 H4b; reads the renewal OB's own dead state, not the write-time ren).
+               bool b244dead = (renewalOB != NULL && !renewalOB.isValid);
+               PrintFormat("[SRJ-IND] [B244RV] bar=%s dir=bearish id=%d dead=%d", SRJ_BarTimeStr(i), (renewalOB != NULL ? (int)renewalOB.objId : 0), (b244dead ? 1 : 0));
+               if(b244dead)
+                 {
+                  Print("[SRJ][T155][OBPROV] code=6 id=0 bar=", i, " flag=kept-dead h1");
+                 }
+               else if(B216_KeepDead())
                  {
                   Print("[SRJ][T155][OBPROV] code=6 id=0 bar=", i, " flag=kept-dead h1");
                  }
```
Braces EA +2/+2, Imb +2/+2; [B244S4] 1; [B244RV] 2 prints; existing markers kept. .preB244 EA rebuilt from .B237K + H3 (verified 18a1d49b) since edits preceded the copy; ex5/Imb/Flow backups direct.
Flow compile: 0 errors + 3 pre-existing warnings (1576/1798/1872, unshifted, none in hunks). EA compile: 0 errors 0 warnings.
Trial SHAs: EA 3a365eff/1683655e + Flow 662ebe05 + Imb fc4408f1. .B244K (4 files) verified pre-run (B-201).
## Part T launches (EA 1683655e + Flow 662ebe05 pre-launch, post-RECON, post-EU)
```
RECON62-B244D: WMI launcher PID 14504; terminal PID 16972; PRE=7320943; window JL7320959 (2026.08.26-2026.09.10); first replay 2026.08.26; launcher killed; watcher PID 14508; DONE PASSED (~5m).
EU0525TD-B244D: terminal 16972 stopped; WMI launcher PID 20656; terminal PID 17648; PRE=8366131; window JL8366145 (2026.05.25-2026.10.13); first replay 2026.05.25; launcher killed; watcher PID 7956; DONE PASSED (~30m). Same day log, no rollover.
Cuts once per segment (TOOLS/job_cut_b244.py; B215F1/B216H1 bracket+date regex repairs, own defects owned).
```
## Part T1/T3 grader outputs raw
```
GRADE RECON62-B244D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
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
GRADE EU0525TD-B244D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 4; MACHINE-ONLY ungraded 1; trades 18
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
M8,MACHINE,UNGRADED BY HIM,2026-06-10 buy 18:55 1.15490,exit 01:01 1.15331,-
```
T2 gate: 7/7 + 6/7 + 0 = PASS -> EU launched. T5: keeps exact, fires 4->4, machine +1 (18:55) -> D3 NO-GAIN.
## Part T6 KILL rows quoted (1262 session + 10 FRESHCOUNT; 25 Jun 10:00-10:45)
```
header: run,date,time,code,kind,jl
EU0525TD-B244D,2026-06-25,10:05,FRESHCOUNT #2095 bar=2026.06.25 10:05 state=S1_REGIME obDead=0 fvgDead=0 oppFvg=1 adverse=1 verdict=HOLD scope=pre cum1=563 cum2=178 cum3=0,FRESHCOUNT,9504026
EU0525TD-B244D,2026-06-25,10:05,FRESHCOUNT #2096 bar=2026.06.25 10:05 state=S3_ZONE_WAIT obDead=0 fvgDead=0 oppFvg=1 adverse=1 verdict=HOLD scope=pre cum1=564 cum2=178 cum3=0,FRESHCOUNT,9504034
EU0525TD-B244D,2026-06-25,10:15,dirbearish/id5747/dead0,B244RV,9504411
EU0525TD-B244D,2026-06-25,10:35,FRESHCOUNT #2113 bar=2026.06.25 10:35 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=565 cum2=178 cum3=0,FRESHCOUNT,9505842
EU0525TD-B244D,2026-06-25,10:35,FRESHCOUNT #2114 bar=2026.06.25 10:35 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=566 cum2=178 cum3=0,FRESHCOUNT,9505843
EU0525TD-B244D,2026-06-25,10:35,FRESHCOUNT #2115 bar=2026.06.25 10:35 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=567 cum2=178 cum3=0,FRESHCOUNT,9506133
EU0525TD-B244D,2026-06-25,10:40,FRESHCOUNT #2116 bar=2026.06.25 10:40 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=568 cum2=178 cum3=0,FRESHCOUNT,9506188
EU0525TD-B244D,2026-06-25,10:40,FRESHCOUNT #2117 bar=2026.06.25 10:40 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=569 cum2=178 cum3=0,FRESHCOUNT,9506189
EU0525TD-B244D,2026-06-25,10:40,FRESHCOUNT #2118 bar=2026.06.25 10:40 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=570 cum2=178 cum3=0,FRESHCOUNT,9506479
EU0525TD-B244D,2026-06-25,10:40,FRESHCOUNT #2119 bar=2026.06.25 10:40 state=S5_GATE_CHECK obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=post cum1=571 cum2=178 cum3=0,FRESHCOUNT,9506905
EU0525TD-B244D,2026-06-25,10:40,FRESHCOUNT #2120 bar=2026.06.25 10:40 state=S5_GATE_CHECK obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=post cum1=572 cum2=178 cum3=0,FRESHCOUNT,9506907
```
10:15 RV id5747 dead0 (renewal OB IS 5747, unmarked). 10:35/10:40 S4 ob0/fvg1/opp0 adv1 HOLD, no S4 kill row. Deal diff: RECON none; EU 10 Jun pair gone + 18:55 machine pair new.
## Timing + final disk + housekeeping
```
Wall: gate + reads + banking + K0 ~50m (renewal-export hunt incl. git history); K hunks + compiles ~15m; RECON launch-verify ~2m + run 5m; EU launch-verify ~2m + run 30m; cuts + grades + batch + records ~25m; commit/push follow.
Final disk: EA 18a1d49b/d85cf7d2, Flow 61177aa5, 5 includes kept, POI d47a0e68/04fcd8a5, tini from .preB244, 17 charts, no terminal64. .B244K unstaged (4 files).
Housekeeping: kept cuts stay (B242K + EU B241D); B244D cuts stay (current trial); job/launch/grade/status/done scripts uncommitted; nothing deleted.
```
## Size gate (caps pointer 6000/35, result 12000, slice 20000/600)
```
pointer 4313/35 PASS; result 3543/26 PASS; slice 14241/189 PASS (this file); TRUTH 3143 PASS; FIXPLAN 19874 PASS; BATCH244 298 PASS; LESSONS 19984 PASS; READ_MAP rewritten. Register (source) untouched. EA/indicator/include/POI committed files untouched (restored).
```
(End of slice)
