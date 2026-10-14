# BUILDER SLICE B-215 - raw rows (S3 trial H1+H2+H3, STOP 25Jun, RESTORED; under 600 lines)
Base: builder/B-215 cut at 3ea653c (= B-214 head). Verdict RESTORED (F1 4/6; T1 16/16 pass; T2 STOP 25Jun still fires (H1 first-close missing), 10Jun/22Jul silent, A identical, 17Aug other removed named; .B215K saved+verified, restored pristine).
## Start gate
```
log-1 3ea653c (backup exact; B-215 cut here; push via backup, never origin; branch from disk builder/B-215).
diff 3ea653c EMPTY on 0.3 files + both skills + CONTEXT + HANDOFF (LF-normalized).
Disk: EA 7c392767/83ac8bde; Panels 4335f703; flow a8201128/c82f175e; POI 5AF5E035/E5CBE1A2; SESS 16573a5b; OB 8bbf936b; FVG 568f4ce9; tini c725e437 blessedB208. Ledger ^1361=1 ^1362=0 pre. No terminal64. Python 3.13.16 first. Tick history unchanged same-day vs B-213 (no sync; grade vs B206T). B-38 dates write+readback every launch (RECON 1787702400/1788998400; EU 1779667200/1791936000).
```
## Part B (grep-first)
```
rules/46 DEAD-UNTIL-RENEWED 1 + rules/43 0610/0625/0722 1 each -> ALREADY_BANKED (d81d71d / B-204). No new rule words.
```
## Part P (planner ruling verbatim in result; veto-able)
```
P1/P2 filed verbatim in RESULT (S10b S9a panel at confirmation pass scope=pre #809-812; S5/entry post stays diagnostic; H3 at S3 pre never S3->S5/B182DEC; ren indicator-side no EA export B162).
```
## Part K0 raw
```
K0.1 FRESHSKIP PRE_BINDING skips S4/S5 poll (CheckFreshness abort/kill + veto etc. L8374 state<S4; CheckFreshness NOT called exempt per L8342-8348; probe L7606 prints ABORT/HOLD twoOfThreeKills=true at S3, no kill). Quoted L8374-8388 + L2770-2778 + L7606 real lines. 10Jun rows JL2010581-2012411 (listed in result; #809-812 adv2 ABORT pre, #813/#814 adv2 HOLD post diagnostic, B182DEC FIRE).
K0.2 pre adv>=2 seed-conf (CUT_B213 EA 83ac8bde): A1 10:00 #185/#5513 adv2 (ob1/fvg1/opp0) cleared by H2 to adv1 (S10b KEEP); A2-A7 zero pre adv>=2; 10Jun #809-812 adv2 (ob0/fvg1/opp1) H1/H2 keep adv2 (S10b REFUSE); 25Jun zero pre adv>=2 (ob0/fvg1/opp0 adv1) H1 predicts adv2 (S10b REFUSE) but H1 first-close NOT implemented here (see T STOP); 22Jul #3434 adv1 (ob0/fvg1/opp0) H1 persist predicts adv2 (S10b REFUSE). STOP-for-planner: S3 return CAN act via H3 without unskipping others (H3 adds only freshness kill); A1 adv2 cleared by H2 -> no STOP. Rule check quoted spec3.4/rules43 L15-17/rules46 L6-L8.
K0.3 buffer readers: defines L173-175; gating CheckFreshness L2773/2775/2777; beyond-freshness diagnostic only none gate FIRE (SLIMB L6350, LTFDIAG L8252-8258 comment assigns/branches nothing, b157 L11419 probe, SIDE1Q L11606/11608 print-only).
K0.4 writers + ren + S9a: code1 L172-179 false, code2 L183-189 true, code3 L553-561 false, code4 L565-571 true, code5 L209-217 true id0, code6 L334-340 true id0, code7 L226-233 true id0, code8 L287-293 true id0, code9 init L348-350; ren structureConfirmedThisBar true BiasEngine L129/L217/L270 + ImbalanceMgr L196/L321, false BiasEngine L18 + State L368, printed ren, never exported buffers 3/4/5 nor 34/35/36 (34 tickOB prov, 35/36 -99 deferred) -> no EA-readable ren (answered by P2: H1 indicator-side, no export needed). S9a quoted B-212 R3 count (!tickOB)+(fvgExists&&!tickFVG)+hasOpp; fvgEx doubleOB?ForDisplay:Now Panels L194-210/261/275.
```
## Part K hunks raw vs .preB215 (markers once each; braces equal/delta; 0 errors, no new warnings)
```
H1 OrderblockMgr code4 persist guard (+8/-7 lines, braces 125/125->127/127):
(see diff in slice appendix? Full diff pasted here - 29 lines:)
--- 
+++ 
@@ -563,11 +563,19 @@
                   else
                   {
-                     g_s.tickOBIsValid = true;
-                     // [Task 155] Buffer 34 provenance capture. Site code 4. The LAST
-                     // write in this descending loop survives to the export.
-                     Print("[SRJ][T155][OBPROV] code=4 id=", ob.objId, " bar=", i, " flag=true");
-                     g_s.tickOBSetterId   = ob.objId;
-                     g_s.tickOBSetterCode = 4;
-                     g_s.tickOBSetterBar  = i;
+                     // [B215H1] panel-leg dead-until-renewed (flag only, no OB state change; code4 opposite-skip never revives a dead leg unless ren).
+                     if(!g_s.tickOBIsValid && !g_s.structureConfirmedThisBar)
+                       {
+                        Print("[SRJ][T155][OBPROV] code=4 id=", ob.objId, " bar=", i, " flag=kept-dead h1");
+                       }
+                     else
+                       {
+                        g_s.tickOBIsValid = true;
+                        // [Task 155] Buffer 34 provenance capture. Site code 4. The LAST
+                        // write in this descending loop survives to the export.
+                        Print("[SRJ][T155][OBPROV] code=4 id=", ob.objId, " bar=", i, " flag=true");
+                        g_s.tickOBSetterId   = ob.objId;
+                        g_s.tickOBSetterCode = 4;
+                        g_s.tickOBSetterBar  = i;
+                       }
                   }
H2 Panels flag override (+2 lines, braces 46/46->46/46 equal, single-statement):
@@ -275,4 +275,6 @@
       bool fvgExistsForColor = g_s.isDoubleOB ? fvgExistsForDisplay : fvgExistsNow;
       paneARGB = SRJ_computeBiasPaneColorARGB(g_s.currentBias,obExistsNow,fvgExistsForColor);
+      // [B215H2] panel FVG export meaning (flag only, no FVG state change; buffer dead only when fvgExists and !tickFVG).
+      if(!fvgExistsForColor) g_s.tickFVGIsValid = true;
      }
H3 EA S3 kill + B215F1 (+23 lines, braces 1283/1283->1285/1285):
@@ -8378,4 +8378,27 @@
                   StateName(g_state),
                   AnchorStr());
+
+    // [B215H3] S3 pre-pass 2-of-3 kill (same refusal S4 applies; PRE_BINDING still skips everything else; never at S5/B182DEC/entry/after).
+    if(g_state == ST_S3_ZONE_WAIT)
+      {
+       string b215_fail = CheckFreshness(barShift, true);
+       if(b215_fail != "")
+         {
+          double b215_ob = 0.0, b215_fv = 0.0, b215_op = 0.0;
+          bool b215_ro = ReadFlow(FL_BUF_LTF_OB_VALID, b215_ob, barShift);
+          bool b215_rf = ReadFlow(FL_BUF_LTF_FVG_VALID, b215_fv, barShift);
+          bool b215_rp = ReadFlow(FL_BUF_LTF_OPP_FVG, b215_op, barShift);
+          int b215_a1 = (b215_ro && (int)MathRound(b215_ob) == 0) ? 1 : 0;
+          int b215_a2 = (b215_rf && (int)MathRound(b215_fv) == 0) ? 1 : 0;
+          int b215_a3 = (b215_rp && (int)MathRound(b215_op) == 1) ? 1 : 0;
+          int b215_n = b215_a1 + b215_a2 + b215_a3;
+          if(InpDebugLog)
+             PrintFormat("[SRJ-EA] B215F1 date=%s bar=%s state=%s ob=%d fvg=%d opp=%d adverse=%d action=KILL_S3",
+                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE),
+                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
+                         StateName(g_state), b215_a1, b215_a2, b215_a3, b215_n);
+          GoAbort(b215_fail, g_state); return;
+         }
+      }
Compile indicator 0 errors 3 pre-existing 1576/1798/1872 none in hunks; EA 0 errors 0 warnings. ex5 post-compile Flow 3e3ae365 EA 77824491, static pre/post T1/T2 (any move STOP, none).
Backups .preB215 SHAs: Panels 4335f703, OB 8bbf936b, flow src a8201128/ex5 c82f175e, EA src 7c392767/ex5 83ac8bde, tini c725e437.
```
## Filed-trade tables (vs DEALS B206T side/date/time/price; volumes differ by account ACCOUNTED, not STOP)
```
T1 RECON62-B215 16/16 identical, 0 side/date/time/price mismatches, C silent, B215F1 5 RECON kills (08.26 17:40 ob0/fvg1/opp1, 08.27 18:05/18:25 ob1/fvg1/opp0 x2, 09.03 14:35 ob1/fvg1/opp0, 09.03 18:20 ob0/fvg1/opp1; all S3 pre on non-A bars, A untouched):
2 sell 2026-08-28 10:05 1.16466; 3 buy 2026-08-28 11:35 1.16467; 4 buy 2026-09-01 17:35 1.16024; 5 sell 2026-09-01 17:50 1.15987; 6 sell 2026-09-02 14:45 1.15747; 7 buy 2026-09-02 15:20 1.15822; 8 buy 2026-09-04 16:00 1.16019; 9 sell 2026-09-04 23:55 1.16129; 10 buy 2026-09-07 09:20 1.16138; 11 sell 2026-09-07 10:53 1.16201; 12 buy 2026-09-07 16:45 1.16264; 13 sell 2026-09-07 17:13 1.16319; 14 sell 2026-09-08 10:10 1.16205; 15 buy 2026-09-08 10:42 1.16102; 16 sell 2026-09-08 17:00 1.16220; 17 buy 2026-09-08 17:26 1.16275.
T2 EU0525TD-B215 got 38 vs exp 44 (set difference side/date/time/price, ignore volume/dealno): REMOVED 6, ADDED 0.
REMOVED (trader words + B215F1):
- 10 June New York long, entry 16:15 1.15551, exit 18:00 1.15523 (must-never silent; B215F1 15:05 ob1/fvg1/opp0 + 15:20 ob1/fvg1/opp0 + 15:55 ob0/fvg1/opp1 adv2 KILL_S3; 18:40 post-entry S3 not the take).
- 22 July New York short, entry 14:55 1.14048, exit 14:59 1.14075 (must-never silent; B215F1 14:50 ob1/fvg1/opp0 adv2 KILL_S3; H1 persist code4 blocked, H2? fvgEx1 dead).
- 17 August New York long, entry 15:55 1.15947, exit 17:15 1.15961 (other take removed, for review; B215F1 15:35 ob1/fvg1/opp0 + 15:50 ob1/fvg1/opp0 adv2 KILL_S3; SEPARATOR_B213 S10b INFO 1, changed by H3).
PRESENT (still fires, STOP): 25 June London short, entry 10:45 1.13540, exit 11:00 1.13606 (must-never still fires; NO B215F1 25Jun in CUT (H1 first-close kill missing); FRESHCOUNT? ob0/fvg1/opp0 adv1 pre, H3 no kill).
A1-A7 identical side/date/time/price (volumes differ ACCOUNTED): A1 08-28 10:05/11:35, A2 09-01 17:35/17:51, A4 09-07 09:20/10:53, A5 09-07 16:45/21:25, A6 09-08 10:10/10:42, A7 09-08 17:00/17:26 (RECON + EU dups same prices; 09-04 09:30 other + 09-02 etc. unchanged). C silent (no added takes; all got deals in exp set minus removed 6).
B215F1 total 60 S3 kills (5 RECON + 55 EU, all scope pre, none S5/entry; full list in CUTs; take-related above, rest non-take bars).
STOP: A differs? No. C fires? No. Three still fires? YES 25Jun -> STOP, save .B215K verified, restore pristine, RESTORED naming 25Jun (H1 first-close missing). New warnings 0, ex5 static. No STOP on A/C/warnings/ex5.
One Python cut both runs (job_cut_b215.py, PRE4497928/PRE5542216 JL-continuous, T1 1044288 + T2 3311707, no overlap/gap); grade from cut (job_grade_b215.py + diff_deals.py sets).
.B215K saved+verified (Panels f383866d, OB 02f18461, flow src a8201128/ex5 3e3ae365, EA src 283edf75/ex5 77824491); restored Panels 4335f703/OB 8bbf936b/flow a8201128/c82f175e/EA 7c392767/83ac8bde/tini c725e437 byte-identical.
```
## X records
```
LESSONS +1 B-215-CONFIRM-IS-PRE (<20k). CONTEXT 5+1 B-215. HANDOFF 3a F1 4/6 RESTORED (25Jun still fires) + 3b B-215 (keep 10). FIXPLAN F1 state (H3 S3 kills 10Jun/22Jul, 25Jun needs H1 first-close) + F2 state (H1 persist works 22Jul, first-close missing 25Jun). Register C NOTE none (KEPT only). Ledger 1362. Pointer lane F1 4/6. READ_MAP rewritten. Kit disagree reported only.
```
## Size gate (READ_MAP files)
```
pointer/6000+35 PASS; result/12000 PASS; CONTEXT PASS; LESSONS PASS; HANDOFF PASS; SKILL PASS; TEMPLATE PASS; strategy max PASS; relay PASS; READ max PASS; FIXPLAN PASS; READ_MAP rewritten PASS. No OBLIFE/SEPARATOR new-gen (B-213 stands; B215F1 rows in CUTs). All under cap or STOP (STOP is trial STOP 25Jun, verdict RESTORED).
```
## Timing + final disk + housekeeping
```
Wall: gate+reads/K0 40m (0.1-0.5 + B/P/K0 greps + code locates/reads); edits H1/H2/H3 + verifies 20m; compiles indicator+EA 2m; T1 0:05:22 + wrapper/archive 11m (17:58-18:09); T2 0:44:44 + wrapper/archive 57m (18:10-19:07, large-log slow disclosed); cut 5m (2.9GB stream); grade 3m (deals + B215F1 + sets); X/records 20m; push/filing follow. Total ~150m.
Final disk: trial restored pristine (EA 7c392767/83ac8bde; Panels 4335f703; flow a8201128/c82f175e; OB 8bbf936b; FVG 568f4ce9; POI 5AF5E035/E5CBE1A2; SESS 16573a5b; tini c725e437 blessed). .B215K trial keeps unstaged (f383866d/02f18461/283edf75/3e3ae365/77824491; flow src a8201128 unchanged). .preB215 unstaged (one rollback). No terminal64. CUT_B215 (T1+T2 JL-continuous) + HANDOFF journals unstaged. Day log stays (housekeeping manifests next; B-213 1.5GB + B-215 2.9GB? Actually day log 20261014.log ~2.9GB now; delete nothing per never-delete without his word; manifest next). MQL5 live log stays (not relay evidence). No trading change stands.
Kit report only: BOOTSTRAP/MEMORY/TEMPLATE PK-2 vs SKILL/READ_MAP/pointer PK-3 (no edit).
```
(End of slice)
