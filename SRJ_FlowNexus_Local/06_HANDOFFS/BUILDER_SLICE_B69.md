# BUILDER SLICE B-69 - R1-R3 raws, hunk C diff, j39/j40 filed-trade tables (j39 408E5073 EA 4C6D560E; j40 1D968931 EA 4C6D560E; kept 6CFE8F8B restored)

## R1 JUN04LDN_REC raws (file:line; verbatim vs paraphrase marked)
- Journal row 13 (OPERATOR_TRADE_JOURNAL.csv file line 14, UTF-8 raw, verbatim): `13,6/4/26,LDN,TF,Bear,Bull,Bull,??,,D AVP,?,VWAP,https://www.tradingview.com/x/mrA9VMWz/,https://www.tradingview.com/x/U8XXA9Uh/,https://www.tradingview.com/x/VipTfjp2/,https://t.me/c/2726392668/16833/17546,https://t.me/c/2726392668/16833/17545,,invalid XOB https://www.tradingview.com/x/Btz1Q1eb/ ,Largest Gain:,3.15,,,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00` (368/364 chars by reader; Bias col = bullish per planner read; CVD col = crossed-out; TP LQ = VWAP; Comment = invalid XOB + link; Gain % empty = no take).
- Planner correction filed in result: relays B-67 and B-68 called this fire "in neither the journal nor the register". His journal HAS a 4 June London row (row 13 above, holds no take). The register has NO 4 June row (grep 6/4|0604|4 June on register = 0; only 4 Sep hits at strategy 190-195).
- j38 machine fire (JUNE0525-B66K_JOURNAL.log 6019A461, EA 6CFE8F8B; day-log 20261007.log lines): RETESTBOOK 09:45 hits=1 Daily-POC:r10:dS (1081099); RETESTBOOK 09:50 hits=1 Daily-POC:r10:dS (1081293); CONFIRMPOLL 09:50 anchor=Daily-POC dir=SHORT oppCandle=1 bodyDir=1 body=16pts touchAttr=1 confirm=1 (1081296); TPCENSUS #119/#120 bar=09:50 dir=SHORT ref=159.868 winner=Monthly-VWAP best=159.748 (1081272/1081436); UJPOLLRISK R=0.83 poll-ref only (1081285); SIDE1E_STOPSHADOW/SIDE1X_STOPREF entry=159.868 liveStop=159.920 liveTp=159.748 liveR=2.31 (1081510/1081511); A6FIRED bar=09:50 dir=SHORT tp=159.748 r=2.31 sl=159.920 (1081520); MTSNAP anchor=Daily-POC entry=159.868 sl=159.920 tp=159.748 (1081525); MTEXIT bar=10:40 reason=SL entry=159.868 exit=159.920 (1081712).
- Strategy grep 4 June London (6/4|0604|4 June): ZERO hits for 4 June rows (only 4 Sep target lines 190-195). Strategy grep XOB: 3 hits, all 2 June (s178, s184, s185); zero for 4 June. Strategy grep session-bias-against-journal rule: ZERO (no pin bars a take against the journaled session bias; 5M-BIAS-AT-ENTRY s139 is 5m-structure-bias at entry open only; machine ltf=-1.0 bearish at 09:55 agrees with SHORT).
- Findings grep 6/4/26|4 June London: ZERO. Register grep: ZERO (no 4 June row). Ledger grep JUN04|4 June London|6/4/26: ZERO.
- Tag NOT_HIS_UNRULED (his journal holds no take; no word of his decides this SHORT; chart call carried, no register edit).

## R2 PAPER_1615 raws
- His words verbatim: s151 JUN05NY-ENTRY-1615: "5 June New York long entry is the 16:15 candle open." s166 (Ruling 2026-10-06): "5 June NY Long, the entry line POI was based of the M POC and M VWAP (the highest is Monthly but it also the W) at 16:00." s170-174 (Ruling 2026-10-07): "16:00 flipped bearish and 16:05 flipped back bullish." + "what i mean by invalidating a setup is already forming setup not only candle POI lines retest." + paraphrase: 16:00 retest, 5m bullish bias flip 16:05, confirmation 16:10, entry 16:15 open 160.059. Register B row 2: 5 June New York USDJPY entry owed 16:15 LONG Old high 160.723 (April-30th day high) [HIS].
- Fires not on kept build (from .B61DIAG/.B63DIAG rows j33/j34, SLICE_B61/63): 5 June 16:15 LONG 160.059 tp 160.723 (j34:34224/34236); 27 Aug 17:05 SHORT 1.16524 tp 1.16322 (j33 deals #2/#3; j61:11916/11919); 2 June 15:35 LONG 159.774 tp 160.723 (j34:24781 deal #4); 10 June 16:10 LONG 160.436 tp 160.723 (j34:47275 deal #12). No others (j34 remaining 5/27, 6/3, 6/4, 6/11 identical to kept j29; j33 remaining 7 identical to kept j28).
- Hunk S reading (SLICE_B68 R3: judged = latest same-side touch incl. confirm bar, else rt-bound; window (judged,confirm]; strict close-through; zero tol): 16:15 judged rt 16:00 (B60C j34:33843 rt=16:00 cSrc=RETEST), window bars 16:05 (c=160.008) + 16:10 above Monthly-POC 159.885, no break -> LIVES. 27 Aug judged rt 16:25 (B60C j61:11697/j39:1128969 rt=16:25 cSrc=RETEST), window closes below Weekly-VWAP (SHORT break = close above), none -> LIVES (16:30 close broke the LONG seed per B63 correction, not this SHORT). 2 June judged rt 14:20 (B60C j34:24543 rt=14:20), window 14:25-15:30 lows >=159.728 closes >=159.730 above Monthly-POC 159.717, no break -> LIVES. 10 June judged rt 15:30 (B60C j34:46965 rt=15:30), 15:45 o=160.394 c=160.351 through Daily-POC 160.354 kills; 16:05 book hits=0 low 160.426 above line, no fresh touch -> DIES.
- Table (date/session; dir; entry; register; judged rt; killing close; S verdict): 5 June NY; LONG; 16:15 160.059; B row 2 (his take); 16:00; none; LIVES. 27 Aug NY; SHORT; 17:05 1.16524; C INVALID; 16:25; none (vs this SHORT); LIVES. 2 June NY; LONG; 15:35 159.774; C NOT VALID; 14:20; none; LIVES. 10 June NY; LONG; 16:10 160.436; C INVALID; 15:30; 15:45 body close; DIES.

## R3 EXTRA_WORDS raws
- 27 Aug quotes: Ruling 3 (findings:37, BUILDER_FINDING_RETEST-INVALIDATION-V1.md:37) verbatim: "8/27 that is the correct exit, but the entry is WRONG! the last valid retest is at 18:05 and the bearish retest is invalidated by breaking it with a candle body close at 18:10 and 18:15." W1 (strategy:130) verbatim: "27 aug NY: Skip cause the nearest target is the D VWAP which is less than 1R. ..." (full in SLICE_B63 R1). 8/27-NY-INVALID (strategy:136): nearest valid target D VWAP below 1R so skipped (NEAREST-ONLY-TP + 1R floor).
- 27 Aug machine rows (j33/j32, EA 7985480D): bound retest ANCHOR_ELECT bar=16:25 poi=Weekly-VWAP rank=9 tier=4 dir=LONG (j32:11118), reseeded 16:40 to SHORT, B60C bar=17:00 rt=16:25 cSrc=RETEST (j61:11697); UJBARMAP 17:00 o=1.16538 h=1.16542 l=1.16514 c=1.16526 wvwap=1.16565 dpoc=1.16541 dvwap=1.16498 (j32:11579); UJ1R POLL R=1.58 / FIRE R=2.73 entry=1.16524 sl=1.16598 tp=1.16322 (j32:11672/11919); TPCENSUS winner=Yearly-VWAP best=1.16322 (j32:11660/11779); TP_ELECT same (j32:11913); tier math anchor W-VWAP rank9 tier4, Daily-VWAP rank11 tier5, 5>4 skip EA:2624, zone outside (SLICE_B63 R2); booked Yearly-VWAP@1.16322 R2.73. Dropped: Daily lines incl. D-VWAP 1.16498 (nearest valid per him, R~0.35) thrown out by tier filter; booked Y-VWAP is NOT one of the trade's own retest lines (own = Weekly-VWAP anchor; own-source half s137 stands but is not the cause here - cause is tier skip per B-63).
- 2 June quotes: s177-178 (his B-65 answer) verbatim: "1. 2 June — NOT a trade... That 14:20 candle is annotated in my journal: there is no valid XOB retracement or touch there, so no setup ever forms for me. The machine buying at 15:35 (159.774, aiming at the 30 April high) is answering a touch I do not count." s185 0602-NY-NO-SETUP paraphrase: no valid XOB retracement/touch at 14:20, no setup, 15:35 buy INVALID.
- 2 June machine rows (j34, EA 7985480D): 14:20 o=159.721 h=159.727 l=159.716 c=159.727 mpoc=159.717 mvwap=159.600 wpoc=159.717 wvwap=159.600 dpoc=159.717 dvwap=159.691 ltf=-1.0 (j34:22276); RETESTBOOK 14:20 hits=3 Daily-POC/Weekly-POC/Monthly-POC (j34:22279); UJDTTERMS LHITs (j34:22280); ANCHOR_ELECT 14:20 poi=Monthly-POC rank=6 tier=3 dir=LONG (j34:22286); S1->S2 14:25:11 (j34:22295); B60C 15:30 rt=14:20 cSrc=RETEST (j34:24543); TP_ELECT entry=159.771 sl=159.734 tp=160.723 R=25.73 (j34:24766); deal #4 buy 4.03 at 159.774 (j34:24781). XOB/OB/FVG rows for the 14:20 candle itself: NONE (grep bar=14:20 XOB|OB|FVG on j34 = 0; only later SLIMB rows reference 14:20 as stop shift).
- Code answer (ASK-THE-CODE s163): NO - the machine has no XOB check on a retest. DetectPoiRetest (Experts/SRJ_FlowNexus_EA.mq5:2086-2155) reads OHLC + POI lines only (ReadBuf1 loop :2106-2129, rank-best pick); zero XOB buffer reads in the function.
- No proposals, no chart calls for these two (both ruled, register section C). STOP rule: no must-keep (A/B3) lost on paper by S+C (7 EU live on j61/j39; 11 June live; 16:15 lives) -> no STOP, Part D ran.

## D2 hunk C source diff (.B61DIAG 5BFBF504 vs .preB68 D00F93BB, 135 lines, only B-61 hunks)
- Matches RESULT_B61 named hunks (retest candle stored by time + converted at gate; touch read from retest candle) + C1 reseed + C4 print + 3 call sites. Nothing beyond them -> BUILD. (Full text = the D4 port diff below modulo base offsets; D2 verified hunk-for-hunk against SLICE_B61 C-site raws before porting.)

## D4 full diff vs .preB69 (EA 6CFE8F8B -> .B69DIAG 4C6D560E, 135 lines, hunk C only; hunk S context untouched)
diff --git a/Experts/SRJ_FlowNexus_EA.mq5.preB69 b/Experts/SRJ_FlowNexus_EA.mq5.B69DIAG
index 02cfe8a..de01e7a 100644
--- a/Experts/SRJ_FlowNexus_EA.mq5.preB69
+++ b/Experts/SRJ_FlowNexus_EA.mq5.B69DIAG
@@ -1109,6 +1109,9 @@ datetime         g_latchBarTime   = 0;
 //--- CONFIRM_DIV_WAIT rollback. Cleared in ResetSequence() and therefore a
 //--- working-set member (field 20, the membership rule).
 ENUM_SRJ_STATE   g_confirmFromState = ST_IDLE;
+//--- [B-61 C2] retest-candle OPEN TIME for term C: stamped at seed, converted
+//--- to a shift at the live confirmation gate (shifts go stale a pass later).
+datetime         g_b61RetestTime = 0;
 //--- [P-FRESH-S5OPP E1-K4 2026-09-18] S4 FRESH-OPP-abort veto, consume-on-fire:
 //--- stamped on abort, refuses at most one latch, zeroed as it refuses. BOUND/DAY
 //--- release (S4) and at the latch (E1d). ResetSequence-EXEMPT +
@@ -2420,7 +2423,8 @@ void ShadowConfirmPoll(const int barShift, const int anchorLine, const ENUM_SRJ_
 //---      touchAttr test with its +/- 1 point guard).
 //--- failTerm names the FIRST failed term ("" = all terms passed).
  bool IsConfirmationCandle(const int barShift, const int anchorLine,
-                           const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false)
+                           const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false,
+                           const int retestShift = -1)
   {
    failTerm = "";
    if(anchorLine < 0 || dir == DIR_NONE) { failTerm = "NO_ANCHOR"; return false; }
@@ -2470,9 +2474,27 @@ void ShadowConfirmPoll(const int barShift, const int anchorLine, const ENUM_SRJ_
     bool   isDoji  = (body < _Point * 0.0001);
     bool   bodyDir = (dir == DIR_LONG)  ? (c0 > o0) : (c0 < o0);
     if(isDoji || !bodyDir) { failTerm = "B_BODY"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
-    bool touch = (h1 >= L - _Point && l1 <= L + _Point);
+    //--- [B-61 C2/C3] touch met by the potential's retest candle OR the candle just
+    //--- before the confirmation candle; exact touch, no guard (s7, s10, s5 no-tolerance).
+    //--- retestShift arrives via iBarShift on the stamped retest OPEN TIME (B-60 defect:
+    //--- a stored shift goes stale a pass later since shifts count from the forming bar).
+    double uj60_hR = h1, uj60_lR = l1;
+    if(retestShift >= 0 && retestShift != barShift + 1)
+      { uj60_hR = iHigh(_Symbol, PERIOD_CURRENT, retestShift); uj60_lR = iLow(_Symbol, PERIOD_CURRENT, retestShift); }
+    bool uj60_tR = (uj60_hR > 0.0 && uj60_hR >= L && uj60_lR <= L);
+    bool uj60_tP = (h1 >= L && l1 <= L);
+    bool touch = (uj60_tR || uj60_tP);
+    string uj60_cSrc = (uj60_tR && uj60_tP) ? "BOTH" : (uj60_tR ? "RETEST" : "PRIOR");
     if(!touch)      { failTerm = "C_TOUCH"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
     if(n1_vw) g_n1_vwapSurv++; if(n1_poc) g_n1_pocSurv++;
+    //--- [B-61 C4] which candle satisfied C: retest time, computed shift, bar at shift, source.
+    if(InpDebugLog && retestShift >= 0)
+       PrintFormat("[SRJ-EA] B60C bar=%s dir=%s poi=%s rt=%s rSh=%d rBar=%s cSrc=%s - C satisfied by %s ([B-61 C2])",
+                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
+                   DirName(dir), g_lineCode[anchorLine],
+                   TimeToString(g_b61RetestTime, TIME_DATE|TIME_MINUTES), retestShift,
+                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, retestShift), TIME_DATE|TIME_MINUTES), uj60_cSrc,
+                   (uj60_cSrc == "BOTH" ? "retest and prior candles" : (uj60_cSrc == "RETEST" ? "the retest candle" : "the prior candle")));
     return true;
    }
@@ -6719,8 +6741,9 @@ void ResetSequence()
     g_latchedTp      = 0.0;
     g_latchedR       = 0.0;
     g_latchBarTime   = 0;
-   g_confirmFromState = ST_IDLE;
-   //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
+    g_confirmFromState = ST_IDLE;
+    g_b61RetestTime = 0;   //--- [B-61 C2] no live potential, no retest time
+    //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
     //--- price, time, zone, touch, state, latch + confirmFrom only G. all are
     //--- existing members (fields 4/5/6, 11/12, 8/9/10, 0, 15-19, 20).
    }
@@ -8304,6 +8327,7 @@ void EvaluateClosedBar(int barShift, datetime barTime)
         g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
          SrjSideNote("DetectPoiRetest", g_dir);
         g_anchorBarTime = barTime;
+       g_b61RetestTime = barTime;   //--- [B-61 C2] the potential's retest candle OPEN TIME for term C
         ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
         SrjS54Snap(barShift, g_dir);   //--- [B-68 hunk S] seed snapshots
         g_sessionAtEntry = sess;
@@ -8637,6 +8661,31 @@ void EvaluateClosedBar(int barShift, datetime barTime)
              {
               if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERAPPLY bar=%s dir=%s poi=%s - deferred LTF abort applies, holder unchanged (Fix S-a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr());
               GoAbort(ABORT_LTF_MISALIGN, g_state);
+             //--- [B-61 C1] the formed setup is dead (row above; stamp cleared in
+             //--- ResetSequence). A fresh POI retest on this bar is NOT dropped
+             //--- with it: seed it as a new potential in the same pass (his
+             //--- 2026-10-07 ruling; the 5m read is checked at confirmation
+             //--- close per s11, never here).
+             PoiRetestResult uj60_pr;
+             bool uj60_found = DetectPoiRetest(barShift, uj60_pr) && uj60_pr.found;
+             if(uj60_found)
+               {
+                double uj60_ltfB = EMPTY_VALUE;
+                ReadFlow(FL_BUF_LTF_BIAS, uj60_ltfB, barShift);
+                if(InpDebugLog) PrintFormat("[SRJ-EA] B60POT bar=%s dir=%s poi=%s ltf=%s - fresh retest kept as potential despite 5m read ([B-61 C1])", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), (uj60_pr.isLong ? "LONG" : "SHORT"), g_lineCode[uj60_pr.topLine], (uj60_ltfB == EMPTY_VALUE ? "NA" : DoubleToString(uj60_ltfB, 1)));
+                s1g_legDir = uj60_pr.isLong ? 1 : -1;
+                g_s2_seedShift = barShift;
+                g_anchorLine = uj60_pr.topLine;
+                g_dir = S2ResolveLive(uj60_pr.isLong ? DIR_LONG : DIR_SHORT);
+                SrjSideNote("DetectPoiRetest", g_dir);
+                g_anchorBarTime = barTime;
+                g_b61RetestTime = barTime;
+                ReadBuf1(g_hPoi, uj60_pr.topLine, g_anchorPrice, barShift);
+                g_sessionAtEntry = sess;
+                g_divLatch = false;
+                g_state = ST_S1_REGIME;
+                LogState(ST_ABORT, g_state);
+               }
              return;
             }
            else
@@ -9220,7 +9269,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
            double uj_carryM15 = 0.0;
            bool uj_carryR = ReadFlow(FL_BUF_HTF_LOW, uj_carryM15, barShift);
            double uj_carryWant = (g_dir == DIR_LONG ? 1.0 : -1.0);
-           if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && uj_carryR && uj_carryM15 == uj_carryWant)
+           int uj60_carryRSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+           if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm, false, uj60_carryRSh) && uj_carryR && uj_carryM15 == uj_carryWant)
               {
                if(SrjS54DeadAtConfirm(barShift))
                  { /* [B-68 hunk S] dead retest: S54KILL printed + aborted inside; S5 not entered */ }
@@ -9240,7 +9290,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
               PrintFormat("[SRJ-EA] %s S3 waiting: no qualifying zone",
                           TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
            string cfTermZ = "";
-          bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ);
+          int uj60_preRSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+          bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ, false, uj60_preRSh);
            //--- [P-UJIMPL-IMPL-1 v8 IE2] direction-alignment guard above design-E1
            //--- (buffer 21 = M15 confirmed vote; F251 preserved, changing it re-scopes).
              if(!cfPassZ) {
@@ -9428,7 +9479,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
           //--- alive and in-window. The touch fallback above STAYS (it sets
           //--- g_touchSeen - the retracement detection; unchanged).
           string cfTerm = "";
-         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
+         int uj60_s4RSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm, false, uj60_s4RSh))
             {
              if(SrjS54DeadAtConfirm(barShift))
                { /* [B-68 hunk S] dead retest: S54KILL printed + aborted inside; S5 not entered */ }

## j39 filed-trade table vs j37 (RECON62-B69_JOURNAL.log 408E5073 67093 lines, EA 4C6D560E; DONE PASSED 16:52:55; 563338 ticks / 3168 bars = j37 data; balance 10484.57 vs j37 10474.64)
- A6FIRED x8 (day-log 20261007.log:1129188/1130645/1143751/1158562/1161641/1164471/1166451/1168890): 8/27 17:05 SHORT tp=1.16322 r=2.73 sl=1.16598 (NEW vs j37; his INVALID, register C); 8/28 10:05 SHORT tp=1.16364 r=2.43 sl=1.16508; 9/1 17:35 LONG tp=1.16077 r=1.17 sl=1.15975; 9/4 16:00 LONG tp=1.16302 r=1.66 sl=1.15847; 9/7 09:20 LONG tp=1.16200 r=1.76 sl=1.16098; 9/7 16:45 LONG tp=1.16315 r=2.34 sl=1.16238; 9/8 10:10 SHORT tp=1.16102 r=1.94 sl=1.16258; 9/8 17:00 SHORT tp=1.16114 r=1.96 sl=1.16274. All 7 kept takes same bar/dir/tp/r/sl as j37 (9/8 vols 1.96 vs j37 1.95 sizing drift from the extra 27 Aug balance path).
- Deals #2-#17: #2 sell 1.35 at 1.16524 / #3 buy 1.35 at 1.16517 (27 Aug NEW); #4 sell 2.38 at 1.16466 / #5 buy 2.38 at 1.16440; #6 buy 2.05 at 1.16024 / #7 sell 2.05 at 1.15975; #8 buy 0.57 at 1.16019 / #9 sell 0.57 at 1.16129; #10 buy 2.5 at 1.16138 / #11 sell 2.5 at 1.16201; #12 buy 3.91 at 1.16264 / #13 sell 3.91 at 1.16315; #14 sell 1.96 at 1.16205 / #15 buy 1.96 at 1.16102; #16 sell 1.96 at 1.16220 / #17 buy 1.96 at 1.16275.
- S54KILL rows in j39 segment: NONE. B60C sample: 17:00 SHORT rt=16:25 cSrc=RETEST (1128969); 8/28 10:00 rt=09:55 cSrc=BOTH (1130502).

## j40 filed-trade table vs j38 (JUNE0525-B69_JOURNAL.log 1D968931 61107 lines, EA 4C6D560E; DONE PASSED 17:01:40; 740873 ticks / 4320 bars = j38 data; balance 10725.58 vs j38 10395.28 vs j34 10775.32)
- A6FIRED x6 (day-log:1191161/1208413/1210243/1213543/1217865/1235505): 5/27 15:35 LONG tp=160.723 r=9.67 sl=159.197 (same); 6/2 15:35:08 LONG tp=160.723 r=25.73 sl=159.734 (same as j34 EXTRA; new vs j38); 6/3 09:10 LONG tp=159.983 r=1.35 sl=159.889 (same); 6/4 09:55 SHORT tp=159.748 r=2.31 sl=159.920 (same as j38; tester-only, not his take per R1); 6/5 16:15 LONG tp=160.723 r=1.44 sl=159.598 (his take; ref 160.059 fill 160.065; 16:55 machine long GONE vs j38); 6/11 14:40:22 LONG tp=160.587 r=2.74 sl=160.501 (same). Lost vs j34: 6/10 16:10 LONG (killed by S54, see below). Lost vs j38: 6/5 16:55 LONG 160.120 (replaced by his 16:15).
- Deals #2-#13: #2 buy 1.08 at 159.344 / #3 sell 1.08 at 159.535; #4 buy 4.03 at 159.774 / #5 sell 4.03 at 159.900; #6 buy 3.88 at 159.932 / #7 sell 3.88 at 159.983; #8 sell 3.25 at 159.868 / #9 buy 3.25 at 159.920 (SL 10:40:20); #10 buy 0.35 at 160.065 / #11 sell 0.35 at 160.298 (19:16:32 retarget); #12 buy 5.81 at 160.530 / #13 sell 5.81 at 160.588 (15:23:06).
- S54KILL rows (3): 6/1 10:45 Monthly-VWAP 159.437 o=159.443 c=159.427 rt=10:10 (1199368); 6/1 15:05 Monthly-POC 159.466 o=159.472 c=159.463 rt=14:10 (1201814); 6/10 16:10 Daily-POC 160.354 o=160.394 c=160.351 rt=15:30 (1230607; the R2 paper kill, 15:45 close).
- 5 June NY grade (trader words): yes, it fires at your 16:15 open (machine ref 160.059, fill 160.065) aiming at your 30 April high 160.723, exits 19:16 at 160.298; the machine's late 16:55 long is gone.
- vs R2 paper: NO differences (16:15 lives, 2 June lives, 10 June dies by S54, 27 Aug lives on j39).

(End of slice)
