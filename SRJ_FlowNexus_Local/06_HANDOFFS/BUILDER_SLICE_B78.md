# BUILDER SLICE B-78 - raw K3 spots, full hunk RK diff, both filed-trade tables, raw ROWKEY rows for the 11 rows, raw F2k rows (kept build trial, hunk RK; verdict RESTORED)

Conventions: 1-based lines. j37 77F454AB (kept EA 6CFE8F8B baseline); j38 6019A461 (kept baseline); j41 DD4128CB 69508 lines RECON62-B78 (hunk RK ex5 773DB69E, bal 10429.29); j42 ED757045 71394 lines JUNE0525-B78 (same build, bal 10395.28). .B78RK 7A88676A (kept, uncommitted, never pushed). Ranks per SLICE_B76 line 3. R = |target - entry| / |entry - stop| on printed booked values.

## K3 RAW SPOTS (kept EA 6CFE8F8B, located by text, pasted raw with real line numbers before editing)

- RETESTBOOK build (kept EA:2293-2308; SAME diag :2296-2311): the per-line loop (ReadBuf1 + longHit/shortHit + hits string with rank) and the PrintFormat at :2305-2308 (full raw in SLICE_B77 R5).
- `g_anchorLine = pr.topLine;` (kept EA:8299, seed path; SAME diag :8320-8322): 8297: s1g_legDir = pr.isLong ? 1 : -1; 8298: g_s2_seedShift = barShift; 8299: g_anchorLine = pr.topLine; 8300-8303: (carried-side comment); context read this turn.
- Race tier key (kept EA:2660; SAME diag :2682): 2660: int anchorRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX; (full F1 comment at :2659).
- UjPoiTargetValid whole (kept EA:2571-2580; SAME diag :2593-2601): 2571: bool UjPoiTargetValid(int k, int anchor) 2572: { 2573: if(k == anchor) return false; 2574-2576: (name strings + dash finds) 2577: if(ap < 0 || cp < 0) return true; 2578: if(StringSubstr(ak, 0, ap) != StringSubstr(ck, 0, cp)) return true; 2579: return true; 2580: } (excludes own line only).
- Reseed/reset anchor sites (all read this turn): :8051 (op-reseed), :8077 (opp reseed), :8130 (B3 same-bar upgrade), :8617 (S3 contender swap), :6706 ResetSequence (anchor -1).

## HUNK RK FULL DIFF (work vs .preB78 6CFE8F8B; +91/-0; 12 all-additive hunks)

--- preB78
+++ work
@@ -2268,4 +2268,56 @@
   }
 
+//====================== [B-78 hunk RK] row-keyed target race =====================
+//--- His words: the target race keys off the strongest line in the latest
+//--- retest candle (s65 family ranks + s87 POC-SUPREMACY), and a trade never
+//--- aims at any line it was retested from (s94 OWN-SOURCE-EXCLUSION; s53/s51/s46
+//--- latest-retest-governs). Per live seed, hold the line list of the latest
+//--- RETESTBOOK row with hits >= 1 from the seed bar up to the current bar.
+//--- Target logic only: session/pool, validity, nearest-wins, 1R floor, entry,
+//--- stop, exits, hunk S and every non-target use of g_anchorLine untouched.
+int      g_rkLines[POI_NLINES];
+int      g_rkCount = 0;
+datetime g_rkRowTime = 0;
+void SrjRowkeyClear()
+  {
+   g_rkCount = 0; g_rkRowTime = 0;
+  }
+void SrjRowkeyUpdate(const int barShift)
+  {
+   if(g_anchorLine < 0) return;
+   double o = iOpen(_Symbol, PERIOD_CURRENT, barShift);
+   double h = iHigh(_Symbol, PERIOD_CURRENT, barShift);
+   double l = iLow (_Symbol, PERIOD_CURRENT, barShift);
+   double c = iClose(_Symbol, PERIOD_CURRENT, barShift);
+   if(h <= 0.0 || l <= 0.0) return;
+   double cNext = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
+   if(cNext <= 0.0) cNext = c;
+   double bodyHi = MathMax(o, cNext);
+   double bodyLo = MathMin(o, cNext);
+   double P   = _Point;
+   double EPS = P * 0.001;
+   int lines[POI_NLINES]; int n = 0;
+   for(int k = 0; k < POI_NLINES; k++)
+     {
+      double L;
+      if(!ReadBuf1(g_hPoi, k, L, barShift)) continue;
+      if(L == EMPTY_VALUE || L <= 0.0)      continue;
+      bool longHit  = (l <= L - P + EPS && bodyLo >= L - EPS);
+      bool shortHit = (h >= L + P - EPS && bodyHi <= L + EPS);
+      if(!longHit && !shortHit) continue;
+      if(n < POI_NLINES) lines[n++] = k;
+     }
+   if(n <= 0) return;
+   for(int i = 0; i < n; i++) g_rkLines[i] = lines[i];
+   g_rkCount = n;
+   g_rkRowTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
+  }
+bool RkHeldRefused(const int k)
+  {
+   if(g_rkCount <= 0) return false;
+   for(int i = 0; i < g_rkCount; i++) if(g_rkLines[i] == k) return true;
+   return false;
+  }
+
 //====================== [P-CONFIRM-SHADOW] log-only instruments ======================
 //--- Council build 1 (COUNCIL_RESPONSE_POI-R.md). These functions READ only and print
@@ -2659,4 +2711,28 @@
 //--- [P-EXITMODEL-2 F1 2026-09-21, his nearest-booking word: the booked TP is the nearest valid target; family/category disregarded (amends the 2026-09-17 POI-FIRST fork). Single unified race: the 18 session/PD levels and the eligible POI lines compete by nearest distance through TpTargetUpdateBest. Validity kept per P15: direction and in-zone guard (Task 31) both pools; tier-rank filter POI lines only; swept/live mask (EA-26/EA-51) session/PD lines only; anchor admitted. Session fallback-only deleted; TPCENSUS names the winner unchanged. Tie-break: session pool evaluates first; exact price ties resolve to the session line (TpTargetUpdateBest strict-less-than keeps first-arrived, EA L2246); booked value unaffected, census tie-naming does NOT follow the booking order (disk-proved: census walks session-then-POI per L2391/L2402 but names LAST-equal via POI overwrite at L2413, while booking keeps FIRST-equal per L2246; exact cross-pool ties name POI in census vs session in booking - G2 grades winner==booked by VALUE, tie-name divergence recorded-not-failed). Swept/live (EA-26/EA-51) applies to session/PD candidates only (mask call sits in the session loop, never in any POI loop - unchanged from the old fork); POI candidates carry direction/in-zone/tier-rank. winner==booked proof covers non-anchor bookings via TPCENSUS; anchor-wins, if any, are proved by admission-time rows (MTSNAP/TP_ELECT), since the recompute skips anchor. BOOKCENSUS parked.]
 int anchorRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
+//--- [B-78 hunk RK] row key replaces the seed-anchor rank: lowest rank in the
+//--- held latest-retest row; empty held list keeps present behaviour (fallback).
+   SrjRowkeyUpdate(barShift);
+   int rkKeyRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
+   int rkKeyLine = g_anchorLine;
+   if(g_rkCount > 0)
+     {
+      rkKeyRank = INT_MAX; rkKeyLine = -1;
+      for(int rki = 0; rki < g_rkCount; rki++)
+        { int rr = g_authorityRank[g_rkLines[rki]]; if(rr < rkKeyRank) { rkKeyRank = rr; rkKeyLine = g_rkLines[rki]; } }
+      anchorRank = rkKeyRank;
+     }
+   if(InpDebugLog)
+     {
+      string rkLines = "", rkOwn = "";
+      for(int rki2 = 0; rki2 < g_rkCount; rki2++)
+        { if(rki2 > 0) { rkLines += ","; rkOwn += ","; } rkLines += g_lineCode[g_rkLines[rki2]] + ":" + IntegerToString(g_authorityRank[g_rkLines[rki2]]); rkOwn += g_lineCode[g_rkLines[rki2]]; }
+      PrintFormat("[SRJ-EA] ROWKEY bar=%s row=%s lines=%s key=%s tier=%d own=%s fallback=%d",
+                  TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
+                  (g_rkCount > 0) ? TimeToString(g_rkRowTime, TIME_DATE|TIME_MINUTES) : "none",
+                  rkLines, (rkKeyLine >= 0 ? g_lineCode[rkKeyLine] : "none"),
+                  (rkKeyRank >= INT_MAX/2) ? -1 : (rkKeyRank / 2),
+                  rkOwn, (g_rkCount > 0 ? 0 : 1));
+     }
 for(int i = 0; i < ArraySize(sessbufs); i++)
   {
@@ -2707,4 +2783,5 @@
    if(!UjPoiTargetValid(kf, g_anchorLine))
      { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[kf], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
+   if(RkHeldRefused(kf)) continue;   //--- [B-78 hunk RK] own-source = held retest-row lines (silent, like the tier skip; ROWKEY carries the list)
    if((g_authorityRank[kf] / 2) > (anchorRank / 2)) continue;
    double vf;
@@ -2855,4 +2932,5 @@
    if(!UjPoiTargetValid(k2, g_anchorLine))
      { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[k2], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
+              if(RkHeldRefused(k2)) continue;   //--- [B-78 hunk RK] census mirror follows the same own-source list
              if((g_authorityRank[k2] / 2) > (anchorRank / 2)) continue;
             double pv;
@@ -6697,4 +6775,9 @@
 
 //====================== Sequence reset / abort ========================
+//--- [B-78 hunk RK] prototypes: definitions sit with the shadow instruments;
+//--- ResetSequence below is their first caller in file order.
+void SrjRowkeyClear();
+void SrjRowkeyUpdate(const int barShift);
+bool RkHeldRefused(const int k);
 void ResetSequence()
   {
@@ -6705,4 +6788,5 @@
    g_sessionAtEntry = SESSION_NONE;
    g_anchorLine     = -1;
+   SrjRowkeyClear();   //--- [B-78 hunk RK] reset clears the held row list
    g_anchorPrice    = 0.0;
    g_anchorBarTime  = 0;
@@ -8050,4 +8134,5 @@
                  s1g_seedBiasAl = (!t78_alOk ? -1 : (t78_al ? 1 : 0));
                  g_anchorLine = t78_pr.topLine;
+                 SrjRowkeyClear(); SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] reseed clears + plants bar row
                  ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
                  g_anchorBarTime = barTime;
@@ -8076,4 +8161,5 @@
              ENUM_SRJ_DIR s1c_fromDir = g_dir;
              g_anchorLine    = t78_pr.topLine;
+             SrjRowkeyClear(); SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] reseed clears + plants bar row
              ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
              g_anchorBarTime = barTime;
@@ -8129,4 +8215,5 @@
          ENUM_SRJ_STATE b3_prevState = g_state;
          g_anchorLine    = b3_cand;
+         SrjRowkeyClear(); SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] anchor swap clears + plants bar row
          ReadBuf1(g_hPoi, b3_cand, g_anchorPrice, barShift);
          g_anchorBarTime = barTime;
@@ -8237,4 +8324,6 @@
         }
       }
+
+    if(inWindow) SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] track latest hits row per live seed
 
     bool s1f_seedArmed = (g_state == ST_IDLE);   //--- [SIDE1F] (i) seed-bar exactness flag (new local only)
@@ -8298,4 +8387,5 @@
         g_s2_seedShift = barShift;   //--- [STAGE-C E-C05] exact-seed bar carriage for the live vote
          g_anchorLine    = pr.topLine;
+         SrjRowkeyClear(); SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] new seed clears + plants seed-bar row
        //--- [FP-LIMBSEAT-1 S2-3] F3 owns the carried-side write (single
        //--- writer). Live rows carry no declared class -> ABSTAIN
@@ -8616,4 +8706,5 @@
           int uj_sbFromLine = g_anchorLine; ENUM_SRJ_DIR uj_sbFromDir = g_dir;
           g_anchorLine = uj_sbLine; g_dir = uj_sbDir;
+          SrjRowkeyClear(); SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] contender swap clears + plants bar row
           ReadBuf1(g_hPoi, uj_sbLine, g_anchorPrice, barShift);
           g_anchorBarTime = barTime;

## T1 FILED-TRADE TABLE j41 vs j37 (RESULT_B68 T1 baseline; dates first; before vs after)

- 8/28 10:05 SHORT: j37 entry 1.16466 sl 1.16508 tp 1.16364 exit 11:45:02 1.16439 (BREAK D-POC) | j41 SAME (j41:15863 A6FIRED; j41:15879 ENTRY; j41:16300 MTEXIT entry=1.16466 exit=1.16439). SAME.
- 9/1 17:35 LONG: j37 entry 1.16022 sl 1.15975 tp 1.16077 exit 17:55:01 1.15975 (SL) | j41 SAME (j41:30044 A6FIRED; j41:30062 ENTRY; j41:30159 MTEXIT). SAME.
- 9/4: j37 entry 16:00 1.16018 sl 1.15847 tp 1.16302 exit 23:55 1.16129 (DAY_CLOSE) | j41 entry 15:40 open 1.15964 sl 1.15835 tp 1.16302 exit 15:45 1.15990 (BREAK Y-POC) (j41:43996 TP_ELECT R2.62; j41:43999 A6FIRED bar=15:35; j41:44015 ENTRY bar=15:35; j41:44043 MTEXIT). CHANGED (earlier bar/entry/stop/exit; target same 1.16302).
- 9/7 09:20 LONG: j37 entry 1.16135 sl 1.16098 tp 1.16200 exit 10:55 1.16200 (TP_TOUCH) | j41 SAME (j41:45899 A6FIRED; j41:45915 ENTRY; j41:46325 MTEXIT + MTLIFE TP_TOUCH). SAME.
- 9/7 16:45 LONG: j37 entry 1.16261 sl 1.16238 tp 1.16315 exit 17:15:01 1.16315 (TP_TOUCH) | j41 SAME (j41:48739 A6FIRED; j41:48755 ENTRY; j41:48885 MTEXIT). SAME.
- 9/8 10:10 SHORT: j37 entry 1.16205 sl 1.16258 tp 1.16102 exit 10:45 1.16102 (TP_TOUCH) | j41 SAME (j41:50720 A6FIRED; j41:50738 ENTRY; j41:50901 MTEXIT). SAME.
- 9/8 17:00 SHORT: j37 entry 1.16220 sl 1.16274 tp 1.16114 exit 17:35 1.16274 (SL) | j41 SAME (j41:53162 A6FIRED; j41:53178 ENTRY; j41:53359 MTEXIT). SAME.
- Totals: 7 fires vs 7 fires. New fires: none. Lost fires: none. Balance: j37 10474.64 vs j41 10429.29 (-45.35, the A3 early-fire delta). S54KILL: j37 0, j41 0.
- A3 mechanism on rows (before vs after): j37 15:35 race books Yearly-POC 1.15987 R0.18 (j37:43789 TP_ELECT) refused at the 1R gate, no fire; j41 15:35 ROWKEY key Yearly-POC own W/M/Y-POC (j41:43766) refuses it so TPCENSUS #212/#213 books YLOH 1.16302 R2.62 (j41:43732/43891) and fires (j41:43999). Target same as his London high; entry/stop/exit moved earlier.

## T2 FILED-TRADE TABLE j42 vs j38 (RESULT_B68 T2 baseline)

- 5/27 15:35 LONG: j38 entry 159.340 sl 159.197 tp 160.723 exit 20:10:09 159.535 (TP_TOUCH) | j42 SAME (j42:6781 A6FIRED r9.67; j42:6797 ENTRY; j42:7353 MTEXIT). SAME (B-68's 159.344 cell vs 159.340 rows on both journals).
- 6/3 09:10 LONG (C3): j38 entry 159.929 sl 159.889 tp 159.983 exit 10:00 159.983 (TP_TOUCH) | j42 SAME (j42:29847 A6FIRED r1.35; j42:29863 ENTRY; j42:30011 MTEXIT). SAME.
- 6/4 09:55 SHORT: j38 entry 159.868 sl 159.920 tp 159.748 exit 10:45:10 159.920 (SL) | j42 SAME (j42:35569 A6FIRED r2.31; j42:35585 ENTRY; j42:35761 MTEXIT). SAME (not a new fire; recorded per T3 note).
- 6/5 16:55 LONG: j38 entry 160.115 sl 159.726 tp 160.723 exit 19:20:01 160.298 (TP_TOUCH) | j42 SAME (j42:39927 A6FIRED r1.56; j42:39943 ENTRY; j42:40356 MTEXIT). SAME (not a new fire; recorded per T3 note).
- 6/11 14:40 LONG (B3): j38 entry 160.524 sl 160.501 tp 160.587 exit 15:20 160.587 (TP_TOUCH) | j42 SAME (j42:59603 A6FIRED r2.74; j42:59619 ENTRY; j42:59762 MTEXIT). SAME.
- Totals: 5 fires vs 5 fires. New: none. Lost: none. Balance: j38 10395.28 vs j42 10395.28 (identical to the cent). S54KILL: j38 0, j42 0.

## RAW ROWKEY ROWS for the 11 rows (key + own vs SLICE_B77 R1)

- A1 j41:15605 + j41:15723 ROWKEY bar=10:00 row=09:55 lines=Daily-VWAP:11 key=Daily-VWAP tier=5 own=Daily-VWAP fallback=0. SAME (key+own).
- A2 j41:29756 + j41:29906 ROWKEY bar=17:30 row=17:30 lines=Daily-VWAP:11,Monthly-VWAP:7 key=Monthly-VWAP tier=3 own both fallback=0. SAME.
- A3: NO 15:55 ROWKEY/TPCENSUS/A6FIRED on j41 (fired 15:40; no 15:55 race). NOT SAME (missing).
- A4 j41:45503 + j41:45666 ROWKEY bar=09:15 row=09:15 lines=Daily-POC:10,Weekly-POC:8 key=Weekly-POC tier=4 own both fallback=0. SAME.
- A5 j41:48364 + j41:48525 ROWKEY bar=16:40 row=16:35 lines=Daily-POC:10,Weekly-POC:8 key=Weekly-POC tier=4 own both fallback=0. SAME key+own (row bar 16:35 vs B-77's 16:15 noted; latest-wins picked the 16:35 row which also has hits).
- A6 j41:50348 + j41:50536 ROWKEY bar=10:05 row=10:05 lines=Monthly-POC:6 key=Monthly-POC tier=3 own=Monthly-POC fallback=0. SAME.
- A7 j41:52794 + j41:52968 ROWKEY bar=16:55 row=16:55 lines=Monthly-POC:6 key=Monthly-POC tier=3 own=Monthly-POC fallback=0. SAME.
- F2k j41:12670 ROWKEY bar=17:00 row=17:00 lines=Daily-POC:10 key=Daily-POC tier=5 own=Daily-POC fallback=0. SAME.
- B3 j42:59098 + j42:59318 ROWKEY bar=14:35 row=14:35 lines=Daily-POC:10,Daily-VWAP:11 key=Daily-POC tier=5 own both fallback=0. SAME.
- C3 j42:29511 + j42:29665 ROWKEY bar=09:05 row=09:05 lines=Daily-VWAP:11 key=Daily-VWAP tier=5 own=Daily-VWAP fallback=0. SAME.
- F1a j42:24628 ROWKEY bar=15:30 row=14:20 lines=Daily-POC:10,Weekly-POC:8,Monthly-POC:6 key=Monthly-POC tier=3 own all three fallback=0. SAME.
- Match: 10/11 key+own SAME, fallback=0 everywhere printed; A3 15:55 race absent.

## RAW F2k ROWS (27 Aug 17:00 pass, j41 kept+hunk RK)

- ROWKEY j41:12670 (above): key Daily-POC tier 5, own Daily-POC, fallback 0.
- TPCENSUS #71 j41:12748 bar=17:00 dir=SHORT ref=1.16524 winner=Daily-VWAP best=1.16498 distPts=26 admitted= PDL:105 LOL:49 ... (no D-VWAP token; D-VWAP wins the silent POI race).
- UJ1R POLL j41:12760 entry=1.16524 sl=1.16652 tp=1.16498 R=0.20 verdict=FAIL (refused below 1R at the target step).
- RETESTBOOK j41:12767 bar=17:00 hits=1 Daily-POC:r10:dS. CONFIRM_PREBIND_FAIL j41:12788 bar=17:00 dir=SHORT term=C_TOUCH. No A6FIRED, no ENTRY_TICKET, no fire.

(End of slice)
