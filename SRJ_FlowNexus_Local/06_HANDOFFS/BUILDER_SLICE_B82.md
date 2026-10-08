# BUILDER SLICE B-82 - K3 raw spots, full diff, both filed-trade tables, raw R1-R4 rows (hunk C on RKD kept build, diagnostic, ALWAYS RESTORED)

Conventions: 1-based lines. Kept EA 137076D9 (kept + hunk S + hunk RKD, 695359 B). .B82C frozen edited source 55D91C7E (699555 B) + ex5.B82DIAG 368FE7D7 (468050 B), kept uncommitted. j43 = RECON62-B81_JOURNAL.log 8EDD1254 (71653 lines, bal 10474.64); j45 = RECON62-B82_JOURNAL.log BF03B8A2 (69400 lines, bal 10474.64); j44 = JUNE0525-B81_JOURNAL.log 113541CF (71396 lines, bal 10395.28); j46 = JUNE0525-B82_JOURNAL.log 9B2F44B6 (61224 lines, bal 10725.58); j39 408E5073 (bal 10484.57); j40 1D968931 (bal 10725.58). New ROWKEY: dir + per-line :dL/:dS tags, own = side-matched only.

## K3 RAW SPOTS (kept EA 137076D9, located by text, pasted raw with real line numbers before editing; no NOT FOUND)

- Decl :1111 `ENUM_SRJ_STATE   g_confirmFromState = ST_IDLE;` (CONFIRM_DIV_WAIT context :1107-1110).
- IsConfirmationCandle signature :2481-2482 `bool IsConfirmationCandle(const int barShift, const int anchorLine, / const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false)` + touch :2532 `bool touch = (h1 >= L - _Point && l1 <= L + _Point);` + fail/surv :2533-2534 + `return true;` :2535.
- ResetSequence :6855 `    g_confirmFromState = ST_IDLE;` (P-BUILD3 context :6856-6858; other 4-space site at op-reseed left untouched).
- Seed site ~:8437 `         g_anchorLine    = pr.topLine;` + RK clear+plant `         SrjRowkeyClear(); SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] new seed clears + plants seed-bar row` + :8443 `       g_anchorBarTime = barTime;` + :8445 `SrjS54Snap(barShift, g_dir);   //--- [B-68 hunk S] seed snapshots`.
- UJDEFERAPPLY GoAbort :8756 `             GoAbort(ABORT_LTF_MISALIGN, g_state);` (UJDEFERAPPLY context :8753-8755; DROPDROP else :8759-8763).
- Call sites: :9340 `           if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && uj_carryR && uj_carryM15 == uj_carryWant)` (uj_carryTerm :9336); :9360 `          bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ);` (cfTermZ :9359); :9548 `           if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))` (cfTerm :9547).

## FULL DIFF vs .preB82 (work 55D91C7E vs kept RKD 137076D9; +63/-8; 9 hunks = D4's 9 + the one RK seam in C1)
diff --git "a/Experts\\SRJ_FlowNexus_EA.mq5.preB82" "b/Experts\\SRJ_FlowNexus_EA.mq5"
index b92a29b..667a6ff 100644
--- "a/Experts\\SRJ_FlowNexus_EA.mq5.preB82"
+++ "b/Experts\\SRJ_FlowNexus_EA.mq5"
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
@@ -2478,8 +2481,9 @@ void ShadowConfirmPoll(const int barShift, const int anchorLine, const ENUM_SRJ_
 //---   C  the prior candle's range touched the anchor line (the CONFIRMPOLL
 //---      touchAttr test with its +/- 1 point guard).
 //--- failTerm names the FIRST failed term ("" = all terms passed).
- bool IsConfirmationCandle(const int barShift, const int anchorLine,
-                           const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false)
+   bool IsConfirmationCandle(const int barShift, const int anchorLine,
+                           const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false,
+                           const int retestShift = -1)
   {
    failTerm = "";
    if(anchorLine < 0 || dir == DIR_NONE) { failTerm = "NO_ANCHOR"; return false; }
@@ -2530,8 +2534,27 @@ void ShadowConfirmPoll(const int barShift, const int anchorLine, const ENUM_SRJ_
     bool   bodyDir = (dir == DIR_LONG)  ? (c0 > o0) : (c0 < o0);
     if(isDoji || !bodyDir) { failTerm = "B_BODY"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
     bool touch = (h1 >= L - _Point && l1 <= L + _Point);
+    //--- [B-61 C2/C3] touch met by the potential's retest candle OR the candle just
+    //--- before the confirmation candle; exact touch, no guard (s7, s10, s5 no-tolerance).
+    //--- retestShift arrives via iBarShift on the stamped retest OPEN TIME (B-60 defect:
+    //--- a stored shift goes stale a pass later since shifts count from the forming bar).
+    double uj60_hR = h1, uj60_lR = l1;
+    if(retestShift >= 0 && retestShift != barShift + 1)
+      { uj60_hR = iHigh(_Symbol, PERIOD_CURRENT, retestShift); uj60_lR = iLow(_Symbol, PERIOD_CURRENT, retestShift); }
+    bool uj60_tR = (uj60_hR > 0.0 && uj60_hR >= L && uj60_lR <= L);
+    bool uj60_tP = (h1 >= L && l1 <= L);
+    touch = (uj60_tR || uj60_tP);
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
 
@@ -6829,8 +6852,9 @@ void ResetSequence()
    g_latchedTp      = 0.0;
    g_latchedR       = 0.0;
    g_latchBarTime   = 0;
-   g_confirmFromState = ST_IDLE;
-   //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
+    g_confirmFromState = ST_IDLE;
+    g_b61RetestTime = 0;   //--- [B-61 C2] no live potential, no retest time
+    //--- [P-BUILD3 E5] no new working-set field: the re-bind assigns anchor,
    //--- price, time, zone, touch, state, latch + confirmFrom only ΓÇö all are
    //--- existing members (fields 4/5/6, 11/12, 8/9/10, 0, 15-19, 20).
   }
@@ -8420,6 +8444,7 @@ void EvaluateClosedBar(int barShift, datetime barTime)
        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
         SrjSideNote("DetectPoiRetest", g_dir);
        g_anchorBarTime = barTime;
+       g_b61RetestTime = barTime;   //--- [B-61 C2] the potential's retest candle OPEN TIME for term C
        ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
        SrjS54Snap(barShift, g_dir);   //--- [B-68 hunk S] seed snapshots
        g_sessionAtEntry = sess;
@@ -8754,6 +8779,33 @@ void EvaluateClosedBar(int barShift, datetime barTime)
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
+                SrjRowkeyClear(); SrjRowkeyUpdate(barShift);   //--- [B-82] C1 reseed clears + plants bar row, same as the RKD reseed sites
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
+               return;
              return;
             }
           else
@@ -9337,7 +9389,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
           double uj_carryM15 = 0.0;
           bool uj_carryR = ReadFlow(FL_BUF_HTF_LOW, uj_carryM15, barShift);
           double uj_carryWant = (g_dir == DIR_LONG ? 1.0 : -1.0);
-           if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && uj_carryR && uj_carryM15 == uj_carryWant)
+           int uj60_carryRSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+           if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm, false, uj60_carryRSh) && uj_carryR && uj_carryM15 == uj_carryWant)
              {
               if(SrjS54DeadAtConfirm(barShift))
                 { /* [B-68 hunk S] dead retest: S54KILL printed + aborted inside; S5 not entered */ }
@@ -9357,7 +9410,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
              PrintFormat("[SRJ-EA] %s S3 waiting: no qualifying zone",
                          TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
           string cfTermZ = "";
-          bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ);
+          int uj60_preRSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+          bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ, false, uj60_preRSh);
           //--- [P-UJIMPL-IMPL-1 v8 IE2] direction-alignment guard above design-E1
           //--- (buffer 21 = M15 confirmed vote; F251 preserved, changing it re-scopes).
             if(!cfPassZ) {
@@ -9544,8 +9598,9 @@ void EvaluateClosedBar(int barShift, datetime barTime)
          //--- later bar can present a fresh confirmation while the candidate is
          //--- alive and in-window. The touch fallback above STAYS (it sets
          //--- g_touchSeen - the retracement detection; unchanged).
-         string cfTerm = "";
-         if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
+           string cfTerm = "";
+           int uj60_s4RSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+           if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm, false, uj60_s4RSh))
            {
             if(SrjS54DeadAtConfirm(barShift))
               { /* [B-68 hunk S] dead retest: S54KILL printed + aborted inside; S5 not entered */ }

## G1 FILED-TRADE TABLE j45 vs j43 (+ j39 third column; dates first; one row per deal)

- 8/28 10:05 SHORT: j43 entry 1.16466 sl 1.16508 tp 1.16364 exit 11:40 BREAK 1.16439 | j45 SAME (FIRED/MTEXIT/ENTRY identical rows) | j39 SAME (7 kept takes same bar/dir/tp/r/sl). SAME.
- 9/1 17:35 LONG: j43 entry 1.16022 sl 1.15975 tp 1.16077 exit 17:50 SL | j45 SAME | j39 SAME. SAME.
- 9/4 16:00 LONG: j43 entry 1.16018 sl 1.15847 tp 1.16302 exit DAY_CLOSE 1.16129 | j45 SAME | j39 SAME. SAME.
- 9/7 09:20 LONG: j43 entry 1.16135 sl 1.16098 tp 1.16200 exit TP_TOUCH | j45 SAME | j39 SAME. SAME.
- 9/7 16:45 LONG: j43 entry 1.16261 sl 1.16238 tp 1.16315 exit TP_TOUCH | j45 SAME | j39 SAME. SAME.
- 9/8 10:10 SHORT: j43 entry 1.16205 sl 1.16258 tp 1.16102 exit TP_TOUCH | j45 SAME | j39 SAME. SAME.
- 9/8 17:00 SHORT: j43 entry 1.16220 sl 1.16274 tp 1.16114 exit SL | j45 SAME | j39 SAME. SAME.
- Totals: 7 fires vs 7 fires (j45 bal 10474.64 = j43; j39 bal 10484.57 with extra 27 Aug deal). New vs j43: none. Lost: none. S54KILL j45: 0. Ticks/bars 563338/3168 = j43.
- Non-fire race-layer notes (no fire either way): j45-only TP_ELECT 8/28 16:55 R0.10 + 8/27 17:00 R0.35 (TP_RR_FAIL); j43-only TP_ELECT 9/1 09:50 LONG R1.81 (j45 LONG confirms anchor W-VWAP confirm=1 but seats no race).

## G3 FILED-TRADE TABLE j46 vs j44 (+ j40 third column)

- 5/27 15:35 LONG: j44 entry 159.340 sl 159.197 tp 160.723 exit TP_TOUCH 159.535 | j46 SAME (ENTRY 15:30; MTEXIT 20:05; FIRED r9.67) | j40 SAME. SAME.
- 6/3 09:10 LONG (C3): j44 entry 159.929 sl 159.889 tp 159.983 exit TP_TOUCH | j46 SAME (ENTRY 09:05; MTEXIT 09:55; FIRED r1.35) | j40 SAME. SAME.
- 6/4 09:55 SHORT: j44 entry 159.868 sl 159.920 tp 159.748 exit SL (tester-only, register C) | j46 SAME (ENTRY 09:50; MTEXIT 10:40; FIRED r2.31) | j40 SAME. SAME (record only).
- 6/5 16:15 LONG (B2): j44 machine 16:55 LONG 160.120 (not his) | j46 FIRES at 16:10 bar -> 16:15 open: TP_ELECT ref 160.059 sl 159.598 tp 160.723 R1.44; A6FIRED 16:10 r1.44; ENTRY_TICKET 16:10 (ticket=10); MTEXIT 19:15 TP_TOUCH 160.059->160.298 | j40 SAME (ref 160.059 fill 160.065 tp 160.723 exit 19:16:32 at 160.298). NEW vs j44. LOST vs j44: 6/5 16:55 machine long GONE (no FIRED/ENTRY at 16:50 on j46).
- 6/11 14:40 LONG (B3): j44 entry 160.524 sl 160.501 tp 160.587 exit TP_TOUCH | j46 SAME (ENTRY 14:35; MTEXIT 15:20; FIRED r2.74) | j40 SAME. SAME.
- Extra: 6/2 15:35 LONG FIRED on j46 (TP_ELECT ref 159.771 sl 159.734 tp 160.723 R25.73; ENTRY_TICKET 15:30; MTEXIT 19:20 TP_TOUCH 159.771->159.900) = j40 deal #4 (buy 159.774). NEW vs j44, must-never-take (register C). 10 June 16:10: S54KILL (rt 15:30, 15:45 close through D-POC), no fire on j46 (matches j40/paper).
- Totals: 6 fires vs 5 fires (j46 bal 10725.58 = j40 to the cent). S54KILL j46: 3 rows (6/1 x2 + 6/10 paper kill). Ticks/bars 740873/4320 = j44.

## RAW R1 ROWS (27 Aug 17:00 SHORT path split)

j43 kept RKD: RETESTBOOK bar=17:00 hits=1 Daily-POC:r10:dS; ROWKEY bar=17:00 row=17:00 dir=SHORT lines=Daily-POC:10:dS key=Daily-POC tier=5 own=Daily-POC fallback=0; TPCENSUS #71 winner=Daily-VWAP best=1.16498 distPts=26; UJ1R POLL R=0.20 FAIL; CONFIRMPOLL anchor=Weekly-VWAP dir=SHORT confirm=0; CONFIRM_PREBIND_FAIL C_TOUCH.
j45 hunk C: B60C bar=17:00 dir=SHORT poi=Weekly-VWAP rt=16:25 rSh=8 rBar=16:25 cSrc=RETEST; ROWKEY key Daily-POC own Daily-POC; TPCENSUS #60/#61 winner Daily-VWAP 1.16498; POLL R=0.20 FAIL; TP_ELECT R=0.35; A6REFUSED TP_RR_FAIL at 17:05. No 17:05 fire.
j39 hunk C old: B60C bar=17:00 dir=SHORT poi=Weekly-VWAP rt=16:25 cSrc=RETEST; TP_ELECT entry=1.16524 sl=1.16598 tp=1.16322 R=2.73; A6FIRED 17:00 dir=SHORT tp=1.16322 r=2.73 sl=1.16598.
One-liner: kept 17:00 stopped at PREBIND C_TOUCH (confirm=0) AND its target evaluation also ran (D-VWAP R0.20 refused) - it did NOT stop before the target step (TPCENSUS #71 on rows); the target step decided no fire on kept (refused), fire on hunk-C-old (tier-skipped D-VWAP, booked Y-VWAP R2.73).

## RAW R2 ROWS (5 June B2 on j46)

16:00 UJBARMAP o=160.216 h=160.262 l=159.726 c=160.034 mpoc=159.885 mvwap=159.798.
16:00 RETESTBOOK hits=6 Daily-POC:r10:dL Daily-VWAP:r11:dL Weekly-POC:r8:dL Weekly-VWAP:r9:dL Monthly-POC:r6:dL Monthly-VWAP:r7:dL (no dS line on the row).
B60POT bar=16:00 dir=LONG poi=Monthly-POC ltf=-1.0 (C1 fresh retest kept despite 5m read).
ROWKEY 16:00 + 16:10 rows: dir=LONG lines=all-six-dL key=Monthly-POC tier=3 own=all-six fallback=0.
B60C bar=16:10 dir=LONG poi=Monthly-POC rt=16:00 rSh=3 rBar=16:00 cSrc=RETEST.
CONFIRMPOLL 16:10 anchor=Monthly-POC dir=LONG confirm=0 shadow=true (shadow poll; the firing path is the hunk-C carry/PREBIND side per B-74 R1).
TP_ELECT ref 160.059 sl 159.598 tp 160.723 R=1.44; A6FIRED 16:10 r1.44; ENTRY_TICKET 16:10 (16:15 open); MTEXIT 19:15 TP_TOUCH 160.059->160.298.
Grades vs prediction: fires at the 16:15 open ref 160.059 to 160.723 MATCHES; 16:55 machine long gone MATCHES. No 16:00 line carries dS.

## RAW R3 ROWS (hunk-C population: every cSrc=RETEST B60C)

j45 EU 20 RETEST / 22 BOTH / 5 PRIOR; j39 EU 19 / 21 / 5. Set differences by (bar,dir): j45-only 8/27 17:10 SHORT (cSrc=BOTH) + 8/27 17:20 SHORT (cSrc=RETEST); zero j39-only. (j45's seed lived past the refused 17:00 pass and confirmed twice more; j39's seed died with its 17:05 fire.)
j46 June 8 / 14 / 1; j40 June 8 / 14 / 1. ZERO differences (identical sets).
Deciding rows beside the key passes: 17:00 SHORT (above R1); 6/5 16:10 LONG (above R2); 6/2 15:30 LONG (below R4); 6/10 16:10 LONG S54KILL (rt 15:30, 15:45 o=160.394 c=160.351 through D-POC 160.354).
BOTH/PRIOR counts only (full per-bar lists on the journals; RETEST bars above).

## RAW R4 ROWS (2 June beside 5 June; record only, no verdict, B-83 decides)

2 June (j46): rt 14:20 UJBARMAP o=159.721 h=159.727 l=159.716 c=159.727 (mpoc/wpoc/dpoc 159.717, mvwap/wvwap 159.600, dvwap 159.691); RETESTBOOK 14:20 hits=3 D-POC:r10:dL W-POC:r8:dL M-POC:r6:dL; closes 14:25 (159.733) 14:30 (159.738) 14:35 (159.733) 14:40 (159.731) 14:45 (159.730) 14:50 (159.734) 14:55 (159.742) 15:00 (159.741) 15:05 (159.745) 15:10 (159.744) 15:15 (159.752) 15:20 (159.759) 15:25 (159.754) 15:30 (159.767) - every close above anchor M-POC 159.717, no body close through; ANCHOR_ELECT 14:20 M-POC rank=6 tier=3 dir=LONG; XOB-PROMOCENSUS at rt: NO ROW; ZONEPICK/INPLAYCOMMIT only at 15:30 (xob 159.679-159.694, committed=0); B60C 15:30 rt=14:20 cSrc=RETEST rSh=15; ROWKEY key M-POC own all-three; TP_ELECT ref 159.771 R25.73 tp 160.723; A6FIRED 15:30; entry 15:35.
5 June (j46): rt 16:00 o=160.216 h=160.262 l=159.726 c=160.034; 16:00 row all-dL (above); closes 16:05 (160.008) 16:10 (160.058) above anchor M-POC 159.885, no body close through; ANCHOR_ELECT at 16:00: NO ROW (C1 B60POT seeds without ANCHOR_ELECT print); XOB-PROMOCENSUS at rt: NO ROW; ZONEPICK/INPLAYCOMMIT only at 16:10 (xob 159.881-159.916, committed=0); B60C 16:10 rt=16:00 cSrc=RETEST rSh=3; ROWKEY key M-POC own all-six; TP_ELECT ref 160.059 R1.44 tp 160.723; A6FIRED 16:10; entry 16:15 open.
5m reads beside rows only (never used to age/kill): 16:00 ltf=-1.0 (B60POT row); 6/2 rt ltf=-1.0 (UJBARMAP).
His words beside: s177-178 ("no valid XOB retracement or touch at 14:20, so no setup"; "The machine buying at 15:35 (159.774, aiming at the 30 April high) is answering a touch I do not count."); journal row 310 whole (INVALID 15:35 LONG off Monthly POC 159.717); s151 ("5 June New York long entry is the 16:15 candle open."); s166 ("the entry line POI was based of the M POC and M VWAP ... at 16:00."); s169-174 (16:00 retest, 16:05 bullish flip, 16:10 confirmation, 16:15 open 160.059; flip kills formed setups only, retest on flip candle stays potential).

## G6 SUMMARY ONE-LINERS (trader words)

(a) A1-A7 deal-identical: yes (7/7 FIRED/MTEXIT/ENTRY rows identical j45 vs j43).
(b) 27 Aug stays out: yes - on the target row (B60C rt=16:25 cSrc=RETEST passes C at 17:00; D-VWAP 1.16498 booked R0.20/0.35, A6REFUSED TP_RR_FAIL; no 17:05 fire).
(c) B2 fires at the 16:15 open: yes (FIRED 16:10 -> 16:15 open entry ref 160.059 to 160.723 R1.44; 19:15 exit 160.298).
(d) B3 and C3 unchanged: yes (both deal-identical j46 vs j44).
(e) Must-never-take fires left on either run: 6/2 15:35 LONG 159.771->159.900 FIRED on j46 (register C: no valid XOB retracement at 14:20, no setup; journal row 310); 27 Aug 17:05 NOT fired; 10 June 16:10 S54KILL, no fire; 4 June 09:55 fired on j44 AND j46 unchanged (tester-only, register C, record only).

(End of slice)
