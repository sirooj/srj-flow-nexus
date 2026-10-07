# BUILDER SLICE B-68 - R1-R3 raws, hunk S diff, filed-trade tables (j37 77F454AB EA 6CFE8F8B; j38 6019A461 EA 6CFE8F8B)

## R1 S86_0611 raws (file:line)
- Skill s53 CONFIRMATION-BAR (2026-09-22): "the confirmation candle and the candle that did the latest POI retest was 16:55, so the entry is the next 17:00 candle open price" + same-bar rule.
- Skill s55 TIMING-N/N+1 (2026-09-26, message C governs): "11 June New York USDJPY = 14:35 retest + confirmation, 14:40 open entry" + "14:35 confirm=1 [R63 FN] for 6/11".
- Skill s86 PRIOR-CLOSE-IRRELEVANT (2026-09-25) verbatim: "the prior candlestick interaction with the D POC at 14:30 it is a break below but the next candle open of 14:35 is higher making it a valid retest. the 14:30 candle close is not relevant and not accounted."
- Skill s88 VENUE-CORRECTION (2026-09-25): proving venue = retest bar + next bar's OPEN only (14:35 open+close, 14:40 open); no later close judges.
- Skill s95 ENTRY-BAR READ-BACK (2026-09-27): "the confirmation and retest candle is at 14:35 and the entry is at the candle open of 14:40" (14:40 open 160.524; 14:45 post-entry, never evidence).
- j29 (EA D00F93BB) 14:35: o=160.523 h=160.528 l=160.513 c=160.526 dpoc=160.523 (j29:58934); RETESTBOOK hits=2 D-POC:dL D-VWAP:dL (j29:59126); CONFIRMPOLL touchAttr=1 confirm=1 (j29:59129); A2RECLAIM bar=14:35 anchor=Daily-POC c1=160.522 L=160.523 o0=160.523 c0=160.526 "prior close irrelevant (B38)" (j29:59132/59149/59154) binding 14:35 to itself.
- Tag KEEP_BY_HIS_WORDS. B-67 call 1 answered from record.

## R2 RULING1_TEXT raws
- Findings:6 Ruling 1 verbatim (2026-09-25): "the 16:05 is a valid retest but it broke the POI lines before the confirmation entry candle close so the retest is invalidated. although the +1 retest does not matter, it only matter if the scenatio is breaking the bias of the POI lines by breaking it with a candle body close, essentially breaking the POI bias."
- Findings:37 Ruling 3 verbatim (2026-09-26): "8/27 that is the correct exit, but the entry is WRONG! the last valid retest is at 18:05 and the bearish retest is invalidated by breaking it with a candle body close at 18:10 and 18:15."
- s180-182 ANSWER 6/10 verbatim (2026-10-07): 15:30 valid retest of Daily POC; 15:45 o=160.394 c=160.351 through 160.354 kills; INVALID, no take.
- Per-case (retest / kill / later touch / confirm): Ruling 1: 16:05 / pre-confirmation POI body-break (bar unnamed in rows) / +1 moot per his words / unnamed confirm bar. Ruling 3: 18:05 / 18:10 + 18:15 closes / none named / none (never confirmed). 10 June: 15:30 / 15:45 (43pt body through) / none (16:05 book hits=0, low 160.426 above 160.402) / 16:05 (machine).
- Confirm-as-fresh-touch check: Ruling 1 unnamed -> NO from rows; Ruling 3 none -> NO; 10 June 16:05 o=160.428 h=160.455 l=160.426 vs 160.402 (no span) -> NO. Tag NO_CONFLICT. +1 stays: never revives a dead retest's own confirmation.

## R3 BIND_TABLE raws (judged = latest same-side touch incl. confirm bar itself; strict close-through; zero tol; live values)
- Touch test = B3-ElectAnchor inequalities (EA:2171-2174); equal-open counts (s86 14:35 verdict governs the hairline; machine EPS guards agree).
- EU confirms: 8/28 10:00 SHORT (no touch, rt 09:55, c below) LIVES; 9/1 17:30 LONG (touch M-VWAP dL, empty) LIVES; 9/4 15:55 LONG (no touch, rt 15:40, above) LIVES; 9/7 09:15 LONG (touch, empty) LIVES; 9/7 16:40 LONG (no touch - equal low fails span, rt 16:15, strict-safe) LIVES; 9/8 10:05 SHORT (touch M-POC dS, empty) LIVES; 9/8 16:55 SHORT (touch M-POC dS, empty) LIVES.
- June confirms: 5/27 15:30 LONG (touch, empty) LIVES; 6/3 09:05 LONG (touch, empty) LIVES; 6/4 09:50 SHORT (touch o==L + span, empty) LIVES; 6/5 16:55 LONG (no touch, rt 16:45, above) LIVES; 6/11 14:35 LONG (touch per s86 verdict + span, empty) LIVES; 6/5 16:15 LONG (no touch, rt 16:00, above) LIVES; 6/2 15:30 LONG (no touch - low above line, rt 14:20, above) LIVES; 6/10 16:05 LONG (no touch hits=0, rt 15:30, 15:45 breaks) DIES; 18:05 (no machine seed/confirm, rt 18:05, 18:10 breaks) DIES.
- Ruling 1 (rt 16:05, break named, no confirm-touch in rows) DIES; Ruling 3 (rt 18:05, no confirm) DIES.
- Pass: 6/11 lives; 6/10 dies (16:05 verified no touch); 18:05 dies; Ruling 1 + Ruling 3 die; 7 EU live; all other j29 June live. 6/4 lands LIVES via 09:50 same-candle touch (s86 shape; supersedes B-67 seed-window reading; R3+T2 accept either).

## K1 conflict check + K2/K4
- K1 (s53-55, s86-88, s99, s105, s116, s169-174, s176-188): hunk S embodies s86 + Ruling 1 + s99; venues/bars (53-55, 88, 95), confirm predicate (105), flip (116, 169-174), B-65 pins (176-188, 5m never read) untouched; s87 POC-SUPREMACY is exit/own-line post-entry scope vs Ruling-1 pre-confirmation lane. No contradiction: BUILD.
- K2 .preB68: EA D00F93BB (683671 B), terminal.ini 88a0deb1.
- K4 compile 0/0 (LF-normalized source). .B68KEEP 6CFE8F8B (688905 B, LF-only) + ex5 6CDBB39E (461660 B). Diff vs .preB68 below (11 hunks; trailing-newline hunk only). Filed CRLF->LF repair owned (my byte surgery flipped endings; normalized + recompiled).

## T1/T2 filed-trade tables (j37 vs j28; j38 vs j29)
- j37 (77F454AB, 71418 lines, DONE PASSED, 563338/3168 = j28 data, balance 10474.64 = j28): 7 A6FIRED identical (bar/dir/tp/r/sl); deals #2-#15 identical incl. volumes (8/28 1.16466->11:45:02 1.16440; 9/1 1.16024->17:51:04 1.15975; 9/4 1.16019->23:55 1.16129 LOH 1.16302; 9/7 1.16138->10:53:07 1.16201; 9/7 1.16264->17:13:30 1.16315; 9/8 1.16205->10:42:46 1.16102; 9/8 1.16220->17:26:29 1.16275 Y-POC 1.16114). No new fire. S54KILL rows: none.
- j38 (6019A461, 71225 lines, DONE PASSED, 740873/4320 = j29 data, balance 10395.28 = j29): 5 A6FIRED identical (5/27 r9.67; 6/3 r1.35; 6/4 r2.31 entry 159.868 SL 159.920 tp 159.748; 6/5 16:55 r1.56 entry 160.120; 6/11 r2.74 entry 160.530 SL 160.501 tp 160.587); deals #2-#11 identical incl. volumes. No new fire. S54KILL rows: none.
- T3 KEPT: EA on disk 6CFE8F8B = .B68KEEP, ex5 6CDBB39E matches, .preB68 kept, terminal.ini 88a0deb1 read back, no terminal64.

## K3 hunk S diff vs .preB68 (whole)
diff --git a/Experts/SRJ_FlowNexus_EA.mq5.preB68 b/Experts/SRJ_FlowNexus_EA.mq5.B68KEEP
index eca199a..02cfe8a 100644
--- a/Experts/SRJ_FlowNexus_EA.mq5.preB68
+++ b/Experts/SRJ_FlowNexus_EA.mq5.B68KEEP
@@ -302,6 +302,13 @@ double   uj_memo_entry = 0.0;
 bool     uj_memo_valid = false;
 datetime g_ujOpReseedBarTime = 0;
 int      g_ujOpReseedDir = 0;
+//--- [B-68 hunk S] seed-pointing snapshot for the retrospective death check:
+//--- the bar time, anchor line and direction of the latest seed or opposite
+//--- re-point (DetectPoiRetest seed, UJRESEED, SIDE1C_PREEMPT). B3 supersession
+//--- never writes these (anchor-label moves only; the retest event stands).
+datetime g_s54SeedTime = 0;
+int      g_s54SeedLine = -1;
+int      g_s54SeedDir = 0;
 int      uj_memo_anchor = -1;
 int      uj_memo_dir = 0;
 datetime uj_memo_barTime = 0;
@@ -402,6 +409,9 @@ void MtReset()
 #define ABORT_SUB_1R           "SUB_1R"
 #define ABORT_NO_MEMO_AT_FIRE  "NO_MEMO_AT_FIRE"
 #define ABORT_MEMO_IDENTITY  "MEMO_IDENTITY"
+//--- [B-68 hunk S] pre-confirmation POI body-break death (spec S5.4, his Ruling 1).
+//--- Diagnostic string only, like the fire-path reasons above.
+#define ABORT_S54_POI_BREAK    "S54_POI_BREAK"
 //--- [Task 78] Part A Step 8 / D-3 / G-2 replacement. Diagnostic string only;
 //--- no gate reads an abort reason.
 #define ABORT_POI_REPLACED     "POI_REPLACED"
@@ -2179,7 +2189,82 @@ int B3_ElectAnchor(int barShift, ENUM_SRJ_DIR dir)
       if(tr < bestTier || (tr == bestTier && rk < bestRank))
         { bestTier = tr; bestRank = rk; bestLine = k; }
      }
-   return bestLine;
+    return bestLine;
+   }
+
+//--- [B-68 hunk S] snapshot writer: records the pointing bar time, the anchor
+//--- line and the direction. Called at the seed site, UJRESEED and
+//--- SIDE1C_PREEMPT only. Read-only; writes the 3 statics.
+void SrjS54Snap(int snapShift, ENUM_SRJ_DIR snapDir)
+  {
+   g_s54SeedTime = iTime(_Symbol, PERIOD_CURRENT, snapShift);
+   g_s54SeedLine = g_anchorLine;
+   g_s54SeedDir  = (snapDir == DIR_LONG ? 1 : (snapDir == DIR_SHORT ? -1 : 0));
+  }
+//--- [B-68 hunk S] same-side touch test, B3_ElectAnchor inequalities
+//--- (EA:2171-2174), read-only. Equal-open counts as on-side: his explicit
+//--- "valid retest" verdict on the equal-open 14:35 bar (s86) governs the hairline.
+bool SrjS54Touched(int sh, int line, ENUM_SRJ_DIR dir)
+  {
+   double L;
+   if(line < 0 || line >= POI_NLINES) return false;
+   if(sh < 1) return false;
+   if(!ReadBuf1(g_hPoi, line, L, sh)) return false;
+   if(L == EMPTY_VALUE || L <= 0.0) return false;
+   double o = iOpen(_Symbol, PERIOD_CURRENT, sh);
+   double h = iHigh(_Symbol, PERIOD_CURRENT, sh);
+   double l = iLow(_Symbol, PERIOD_CURRENT, sh);
+   if(o <= 0.0 || h <= 0.0 || l <= 0.0) return false;
+   double cNext = iOpen(_Symbol, PERIOD_CURRENT, sh - 1);
+   if(cNext <= 0.0) cNext = iClose(_Symbol, PERIOD_CURRENT, sh);
+   double P = _Point, EPS = P * 0.001;
+   double bodyLo = MathMin(o, cNext), bodyHi = MathMax(o, cNext);
+   if(dir == DIR_LONG) return (l <= L - P + EPS && bodyLo >= L - EPS);
+   if(dir == DIR_SHORT) return (h >= L + P - EPS && bodyHi <= L + EPS);
+   return false;
+  }
+//--- [B-68 hunk S] retrospective death check at confirm-commit (spec S5.4).
+//--- Judged retest = latest bar in [seed, confirm] with a same-side touch of
+//--- the snapshot line (s86: earlier closes go moot with a later valid retest).
+//--- Any strict body close through the line, against the trade direction, in
+//--- (judged, confirm] kills: S54KILL prints, GoAbort fires, true returns and
+//--- the caller must NOT advance to S5. Zero tolerance. Live line values
+//--- (same source as UJDTTERMS; moot on all banked instances). Read-only
+//--- except the kill path.
+bool SrjS54DeadAtConfirm(int confirmShift)
+  {
+   if(g_s54SeedTime <= 0 || g_s54SeedLine < 0 || g_s54SeedLine >= POI_NLINES) return false;
+   int wantDir = (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0));
+   if(wantDir == 0 || wantDir != g_s54SeedDir) return false;
+   int seedShift = iBarShift(_Symbol, PERIOD_CURRENT, g_s54SeedTime, true);
+   if(seedShift < 0 || confirmShift < 1 || seedShift < confirmShift) return false;
+   int judgedShift = -1;
+   for(int sh = confirmShift; sh <= seedShift; sh++)
+     {
+      if(SrjS54Touched(sh, g_s54SeedLine, g_dir)) { judgedShift = sh; break; }
+     }
+   if(judgedShift < 0) judgedShift = seedShift;
+   for(int b = judgedShift - 1; b >= confirmShift; b--)
+     {
+      double L;
+      if(!ReadBuf1(g_hPoi, g_s54SeedLine, L, b)) continue;
+      if(L == EMPTY_VALUE || L <= 0.0) continue;
+      double bo = iOpen(_Symbol, PERIOD_CURRENT, b);
+      double bc = iClose(_Symbol, PERIOD_CURRENT, b);
+      if(bo <= 0.0 || bc <= 0.0) continue;
+      bool broke = (g_dir == DIR_LONG) ? (bc < L) : (bc > L);
+      if(broke)
+        {
+         PrintFormat("[SRJ-EA] S54KILL bar=%s line=%s lineVal=%s o=%s c=%s rt=%s - pre-confirmation POI body-break death ([B-68 hunk S])",
+                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, b), TIME_DATE|TIME_MINUTES),
+                     g_lineCode[g_s54SeedLine], DoubleToString(L, _Digits),
+                     DoubleToString(bo, _Digits), DoubleToString(bc, _Digits),
+                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, judgedShift), TIME_DATE|TIME_MINUTES));
+         GoAbort(ABORT_S54_POI_BREAK, g_state);
+         return true;
+        }
+     }
+   return false;
   }
 
 //====================== [P-CONFIRM-SHADOW] log-only instruments ======================
@@ -7982,6 +8067,7 @@ void EvaluateClosedBar(int barShift, datetime barTime)
                  uj_memo_valid = false;
                  g_ujOpReseedBarTime = barTime;
                  g_ujOpReseedDir = (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0));
+                 SrjS54Snap(barShift, g_dir);   //--- [B-68 hunk S] re-point re-snapshots
                 }
              }
           if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf)))
@@ -8010,7 +8096,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
                             g_lineCode[s1c_fromLine], DirName(s1c_fromDir),
                             g_lineCode[t78_pr.topLine], DirName(t78_dir),
                             StateName(g_state));
-            }
+              SrjS54Snap(barShift, g_dir);   //--- [B-68 hunk S] re-point re-snapshots
+             }
          }
       }
 
@@ -8216,9 +8303,10 @@ void EvaluateClosedBar(int barShift, datetime barTime)
        //--- legacy output stays the compared label, fire-log identical.
        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
         SrjSideNote("DetectPoiRetest", g_dir);
-      g_anchorBarTime = barTime;
-      ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
-      g_sessionAtEntry = sess;
+       g_anchorBarTime = barTime;
+       ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
+       SrjS54Snap(barShift, g_dir);   //--- [B-68 hunk S] seed snapshots
+       g_sessionAtEntry = sess;
       g_divLatch = false;
       ENUM_SRJ_STATE prev = g_state;
       g_state = ST_S1_REGIME;
@@ -8266,8 +8354,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
          g_anchorBarTime = 0;
          LogState(r2_prev, g_state);
          if(InpDebugLog) PrintFormat("[SRJ-EA] SEEDVOID bar=%s dir=%s buf=%d line=%s evals=%d hi=%s lo=%s", TimeToString(barTime, TIME_DATE|TIME_MINUTES), DirName(g_dir), r2_buf, DoubleToString(r2_val, _Digits), r2_evals, DoubleToString(r2_hi, _Digits), DoubleToString(r2_lo, _Digits));
-        }
-     }
+         }
+      }
          //--- [S2-TIMING-SHADOW-001] seed-bias recorder (Luna V94 F1, cleared BY NAME
          //--- print-only). Record-only: locals + print. Reuses CheckLtfAlign GÇö the SAME
          //--- pure helper the S2 path calls (EA:7787), same buffer/semantics; NO new bias
@@ -9132,14 +9220,19 @@ void EvaluateClosedBar(int barShift, datetime barTime)
           double uj_carryM15 = 0.0;
           bool uj_carryR = ReadFlow(FL_BUF_HTF_LOW, uj_carryM15, barShift);
           double uj_carryWant = (g_dir == DIR_LONG ? 1.0 : -1.0);
-          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && uj_carryR && uj_carryM15 == uj_carryWant)
-            {
-             if(InpDebugLog) PrintFormat("[SRJ-EA] UJCONFIRMCARRY bankBar=%s fireBar=%s dir=%s poi=%s term=%s m15=%s - same-bar retest+confirm, S4 armed and firing same pass (Fix G1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, 0), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), uj_carryTerm, DoubleToString(uj_carryM15, 1));
-             ENUM_SRJ_STATE uj_cprev = g_state;
-             g_confirmFromState = uj_cprev;
-             g_state = ST_S5_GATE_CHECK;
-             LogState(uj_cprev, g_state);
-            }
+           if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && uj_carryR && uj_carryM15 == uj_carryWant)
+             {
+              if(SrjS54DeadAtConfirm(barShift))
+                { /* [B-68 hunk S] dead retest: S54KILL printed + aborted inside; S5 not entered */ }
+              else
+               {
+              if(InpDebugLog) PrintFormat("[SRJ-EA] UJCONFIRMCARRY bankBar=%s fireBar=%s dir=%s poi=%s term=%s m15=%s - same-bar retest+confirm, S4 armed and firing same pass (Fix G1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, 0), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), uj_carryTerm, DoubleToString(uj_carryM15, 1));
+              ENUM_SRJ_STATE uj_cprev = g_state;
+              g_confirmFromState = uj_cprev;
+              g_state = ST_S5_GATE_CHECK;
+              LogState(uj_cprev, g_state);
+               }
+             }
         }
       else
         {
@@ -9180,16 +9273,21 @@ void EvaluateClosedBar(int barShift, datetime barTime)
           string cfTermPB = cfTermZ;
           if(cfPassZ)
            {
-            ENUM_SRJ_STATE prevPB = g_state;
-            g_confirmFromState = prevPB;
-            g_state = ST_S5_GATE_CHECK;
-            LogState(prevPB, g_state);
-            if(InpDebugLog)
-               PrintFormat("[SRJ-EA] CONFIRM_PREBIND bar=%s dir=%s poi=%s",
-                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
-                                        TIME_DATE|TIME_MINUTES),
-                           DirName(g_dir), AnchorStr());
-            //--- no return: fall through to the ST_S5_GATE_CHECK block below
+            if(SrjS54DeadAtConfirm(barShift))
+              { /* [B-68 hunk S] dead retest: S54KILL printed + aborted inside; S5 not entered */ }
+            else
+             {
+             ENUM_SRJ_STATE prevPB = g_state;
+             g_confirmFromState = prevPB;
+             g_state = ST_S5_GATE_CHECK;
+             LogState(prevPB, g_state);
+             if(InpDebugLog)
+                PrintFormat("[SRJ-EA] CONFIRM_PREBIND bar=%s dir=%s poi=%s",
+                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
+                                         TIME_DATE|TIME_MINUTES),
+                            DirName(g_dir), AnchorStr());
+             //--- no return: fall through to the ST_S5_GATE_CHECK block below
+             }
            }
          else
            {
@@ -9332,10 +9430,15 @@ void EvaluateClosedBar(int barShift, datetime barTime)
          string cfTerm = "";
          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
            {
-            ENUM_SRJ_STATE prev = g_state;
-            g_confirmFromState = prev;
-            g_state = ST_S5_GATE_CHECK;
-            LogState(prev, g_state);
+            if(SrjS54DeadAtConfirm(barShift))
+              { /* [B-68 hunk S] dead retest: S54KILL printed + aborted inside; S5 not entered */ }
+            else
+             {
+             ENUM_SRJ_STATE prev = g_state;
+             g_confirmFromState = prev;
+             g_state = ST_S5_GATE_CHECK;
+             LogState(prev, g_state);
+             }
            }
          else if(InpDebugLog)
             PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",
@@ -12430,4 +12533,4 @@ void OnTick()
    if(InpDebugLog && SHADOW_NEWS)
       SrjNewsOnBar(currentBarTime);
   }
-//+------------------------------------------------------------------+
\ No newline at end of file
+//+------------------------------------------------------------------+
