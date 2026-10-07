# BUILDER SLICE B-81 - raw K3 spots, both diffs, both filed-trade tables, raw R-a to R-f rows (kept trial hunk RKD; verdict KEPT)

Conventions: 1-based lines. j37 = RECON62-B66K_JOURNAL.log 77F454AB (kept EA 6CFE8F8B baseline, bal 10474.64); j43 = RECON62-B81_JOURNAL.log (hunk-RKD ex5 FA4C9249, bal 10474.64); j38 = JUNE0525-B66K_JOURNAL.log 6019A461 (kept baseline, bal 10395.28); j44 = JUNE0525-B81_JOURNAL.log (same build, bal 10395.28). .preB81 = kept (EA 6CFE8F8B / ex5 6CDBB39E / terminal.ini 88a0deb1). .B81RKD = frozen edited source 137076D9 (695359 B). New ROWKEY format: ROWKEY bar=.. row=.. dir=LONG|SHORT lines=<line>:<rank>:dL|dS,... key=.. tier=.. own=<side-matched only> fallback=0|1.

## K3 RAW SPOTS (.B78RK 7A88676A, located by text, pasted raw with real line numbers before editing)

- SrjRowkeyUpdate whole (.B78RK:2285-2320): 2285:void SrjRowkeyUpdate(const int barShift) / 2287:if(g_anchorLine < 0) return; / 2288-2291:o/h/l/c reads / 2293:cNext=open(barShift-1) / 2295-2296:bodyHi/bodyLo / 2297-2298:P+EPS / 2299:int lines[POI_NLINES]; int n = 0; / 2300-2309:per-k loop / 2305:bool longHit = (l <= L - P + EPS && bodyLo >= L - EPS); / 2306:bool shortHit = (h >= L + P - EPS && bodyHi <= L + EPS); / 2307:if(!longHit && !shortHit) continue; / 2308:if(n < POI_NLINES) lines[n++] = k; / 2310:if(n <= 0) return; / 2311:for(...) g_rkLines[i] = lines[i]; / 2312:g_rkCount = n; / 2313:g_rkRowTime = ...; / 2315:bool RkHeldRefused(const int k) / 2317:if(g_rkCount <= 0) return false; / 2318:for(...) if(g_rkLines[i] == k) return true; / 2319:return false;
- Race-head ROWKEY block (.B78RK:2712-2736): 2712:int anchorRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX; / 2715:SrjRowkeyUpdate(barShift); / 2716-2717:rkKeyRank/rkKeyLine = anchor; / 2718-2724:if(g_rkCount > 0){ lowest-rank sweep; anchorRank = rkKeyRank; } / 2725-2736:ROWKEY print (lines=code:rank own=code fallback bit).
- RkHeldRefused call sites: booking POI loop :2785 `if(RkHeldRefused(kf)) continue;` + census mirror :2934 `if(RkHeldRefused(k2)) continue;` (both inside ComputeNearestTpTarget, dir in scope).
- Trade-direction value: ComputeNearestTpTarget signature :2658 `bool ComputeNearestTpTarget(int barShift, ENUM_SRJ_DIR dir,` + strict-side TpTargetUpdateBest :2603 `bool inDir = (dir == DIR_LONG) ? (v > currentPrice) : (v < currentPrice);` + DirName :1792 `string DirName(ENUM_SRJ_DIR d) { return (d == DIR_LONG) ? "LONG" : (d == DIR_SHORT) ? "SHORT" : "NONE"; }` + enum :226 `enum ENUM_SRJ_DIR { DIR_NONE=0, DIR_LONG=1, DIR_SHORT=-1 };`.
- No NOT FOUND: every spot located by text.

## HUNK RKD FULL DIFF vs .preB81 (work vs kept 6CFE8F8B; +117/-0; RK+RKD over kept)
diff --git "a/Experts\\SRJ_FlowNexus_EA.mq5.preB81" "b/Experts\\SRJ_FlowNexus_EA.mq5"
index 02cfe8a..b92a29b 100644
--- "a/Experts\\SRJ_FlowNexus_EA.mq5.preB81"
+++ "b/Experts\\SRJ_FlowNexus_EA.mq5"
@@ -2267,6 +2267,65 @@ bool SrjS54DeadAtConfirm(int confirmShift)
    return false;
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
+int      g_rkSide[POI_NLINES];   //--- [B-81 hunk RKD] hit side parallel to g_rkLines: 1 = long-side hit, 0 = short-side hit (same longHit tag as RETESTBOOK dL/dS)
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
+   int lines[POI_NLINES]; int sides[POI_NLINES]; int n = 0;
+   for(int k = 0; k < POI_NLINES; k++)
+     {
+      double L;
+      if(!ReadBuf1(g_hPoi, k, L, barShift)) continue;
+      if(L == EMPTY_VALUE || L <= 0.0)      continue;
+      bool longHit  = (l <= L - P + EPS && bodyLo >= L - EPS);
+      bool shortHit = (h >= L + P - EPS && bodyHi <= L + EPS);
+      if(!longHit && !shortHit) continue;
+      if(n < POI_NLINES) { lines[n] = k; sides[n] = (longHit ? 1 : 0); n++; }   //--- [B-81 hunk RKD] keep the hit side beside the index, same longHit tag as RETESTBOOK dL/dS
+     }
+   if(n <= 0) return;
+   for(int i = 0; i < n; i++) { g_rkLines[i] = lines[i]; g_rkSide[i] = sides[i]; }
+   g_rkCount = n;
+   g_rkRowTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
+  }
+bool RkHeldRefused(const int k, const ENUM_SRJ_DIR dir)
+  {
+   if(g_rkCount <= 0) return false;
+   for(int i = 0; i < g_rkCount; i++)
+     {
+      if(g_rkLines[i] != k) continue;
+      if(dir == DIR_LONG) return (g_rkSide[i] == 1);   //--- [B-81 hunk RKD] refuse only the side-matched held lines
+      if(dir == DIR_SHORT) return (g_rkSide[i] == 0);
+      return false;
+     }
+   return false;
+  }
+
 //====================== [P-CONFIRM-SHADOW] log-only instruments ======================
 //--- Council build 1 (COUNCIL_RESPONSE_POI-R.md). These functions READ only and print
 //--- only. They are never consulted by any state transition, abort, or signal path.
@@ -2658,6 +2717,49 @@ bool ComputeNearestTpTarget(int barShift, ENUM_SRJ_DIR dir,
 
 //--- [P-EXITMODEL-2 F1 2026-09-21, his nearest-booking word: the booked TP is the nearest valid target; family/category disregarded (amends the 2026-09-17 POI-FIRST fork). Single unified race: the 18 session/PD levels and the eligible POI lines compete by nearest distance through TpTargetUpdateBest. Validity kept per P15: direction and in-zone guard (Task 31) both pools; tier-rank filter POI lines only; swept/live mask (EA-26/EA-51) session/PD lines only; anchor admitted. Session fallback-only deleted; TPCENSUS names the winner unchanged. Tie-break: session pool evaluates first; exact price ties resolve to the session line (TpTargetUpdateBest strict-less-than keeps first-arrived, EA L2246); booked value unaffected, census tie-naming does NOT follow the booking order (disk-proved: census walks session-then-POI per L2391/L2402 but names LAST-equal via POI overwrite at L2413, while booking keeps FIRST-equal per L2246; exact cross-pool ties name POI in census vs session in booking - G2 grades winner==booked by VALUE, tie-name divergence recorded-not-failed). Swept/live (EA-26/EA-51) applies to session/PD candidates only (mask call sits in the session loop, never in any POI loop - unchanged from the old fork); POI candidates carry direction/in-zone/tier-rank. winner==booked proof covers non-anchor bookings via TPCENSUS; anchor-wins, if any, are proved by admission-time rows (MTSNAP/TP_ELECT), since the recompute skips anchor. BOOKCENSUS parked.]
 int anchorRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
+//--- [B-78 hunk RK] row key replaces the seed-anchor rank: lowest rank in the
+//--- held latest-retest row; empty held list keeps present behaviour (fallback).
+//--- [B-81 hunk RKD] side match: only held lines retested from the race direction
+//--- count as key and own-source; a line retested against the trade is never its
+//--- source (spec S2 row 1 side tag, s94). No side match keeps the kept anchor rank.
+   SrjRowkeyUpdate(barShift);
+   int rkKeyRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
+   int rkKeyLine = g_anchorLine;
+   int rkFallback = (g_rkCount > 0 ? 0 : 1);
+   if(g_rkCount > 0)
+     {
+      rkKeyRank = INT_MAX; rkKeyLine = -1;
+      int rkMatch = 0;
+      for(int rki = 0; rki < g_rkCount; rki++)
+        {
+         bool rkSideOk = ((dir == DIR_LONG) ? (g_rkSide[rki] == 1) : ((dir == DIR_SHORT) ? (g_rkSide[rki] == 0) : false));
+         if(!rkSideOk) continue;
+         rkMatch++;
+         int rr = g_authorityRank[g_rkLines[rki]];
+         if(rr < rkKeyRank) { rkKeyRank = rr; rkKeyLine = g_rkLines[rki]; }
+        }
+      if(rkMatch > 0) { anchorRank = rkKeyRank; rkFallback = 0; }
+      else { rkKeyRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX; rkKeyLine = g_anchorLine; rkFallback = 1; }
+     }
+   if(InpDebugLog)
+     {
+      string rkLines = "", rkOwn = "";
+      for(int rki2 = 0; rki2 < g_rkCount; rki2++)
+        {
+         bool rkTagLong = (g_rkSide[rki2] == 1);
+         bool rkTagOk = ((dir == DIR_LONG) ? rkTagLong : ((dir == DIR_SHORT) ? !rkTagLong : false));
+         if(rki2 > 0) { rkLines += ","; }
+         rkLines += g_lineCode[g_rkLines[rki2]] + ":" + IntegerToString(g_authorityRank[g_rkLines[rki2]]) + ":d" + (rkTagLong ? "L" : "S");
+         if(rkTagOk) { if(rkOwn != "") rkOwn += ","; rkOwn += g_lineCode[g_rkLines[rki2]]; }
+        }
+      PrintFormat("[SRJ-EA] ROWKEY bar=%s row=%s dir=%s lines=%s key=%s tier=%d own=%s fallback=%d",
+                  TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
+                  (g_rkCount > 0) ? TimeToString(g_rkRowTime, TIME_DATE|TIME_MINUTES) : "none",
+                  DirName(dir),
+                  rkLines, (rkKeyLine >= 0 ? g_lineCode[rkKeyLine] : "none"),
+                  (rkKeyRank >= INT_MAX/2) ? -1 : (rkKeyRank / 2),
+                  rkOwn, rkFallback);
+     }
 for(int i = 0; i < ArraySize(sessbufs); i++)
   {
    double v;
@@ -2706,6 +2808,7 @@ for(int kf = 0; kf < POI_NLINES; kf++)
   {
    if(!UjPoiTargetValid(kf, g_anchorLine))
      { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[kf], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
+   if(RkHeldRefused(kf, dir)) continue;   //--- [B-78 hunk RK] own-source = held retest-row lines (silent, like the tier skip; ROWKEY carries the list) //--- [B-81 hunk RKD] side-matched only
    if((g_authorityRank[kf] / 2) > (anchorRank / 2)) continue;
    double vf;
    if(!ReadBuf1(g_hPoi, kf, vf, barShift)) continue;
@@ -2854,6 +2957,7 @@ if(!haveBest)
             {
    if(!UjPoiTargetValid(k2, g_anchorLine))
      { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[k2], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
+              if(RkHeldRefused(k2, dir)) continue;   //--- [B-78 hunk RK] census mirror follows the same own-source list //--- [B-81 hunk RKD] side-matched only
              if((g_authorityRank[k2] / 2) > (anchorRank / 2)) continue;
             double pv;
             if(!ReadBuf1(g_hPoi, k2, pv, barShift)) continue;
@@ -6696,6 +6800,11 @@ bool UpdateDivergenceLatch(int barShift, ENUM_SRJ_DIR dir, string &kindOut)
   }
 
 //====================== Sequence reset / abort ========================
+//--- [B-78 hunk RK] prototypes: definitions sit with the shadow instruments;
+//--- ResetSequence below is their first caller in file order.
+void SrjRowkeyClear();
+void SrjRowkeyUpdate(const int barShift);
+bool RkHeldRefused(const int k, const ENUM_SRJ_DIR dir);   //--- [B-81 hunk RKD] side-matched refusal
 void ResetSequence()
   {
    g_state          = ST_IDLE;
@@ -6704,6 +6813,7 @@ void ResetSequence()
    g_regime         = REGIME_NONE;
    g_sessionAtEntry = SESSION_NONE;
    g_anchorLine     = -1;
+   SrjRowkeyClear();   //--- [B-78 hunk RK] reset clears the held row list
    g_anchorPrice    = 0.0;
    g_anchorBarTime  = 0;
    g_divLatch       = false;
@@ -8049,6 +8159,7 @@ void EvaluateClosedBar(int barShift, datetime barTime)
                  s1g_legDir = t78_pr.isLong ? 1 : -1;
                  s1g_seedBiasAl = (!t78_alOk ? -1 : (t78_al ? 1 : 0));
                  g_anchorLine = t78_pr.topLine;
+                 SrjRowkeyClear(); SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] reseed clears + plants bar row
                  ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
                  g_anchorBarTime = barTime;
                  g_dir = S2ResolveLive(t78_pr.isLong ? DIR_LONG : DIR_SHORT);
@@ -8075,6 +8186,7 @@ void EvaluateClosedBar(int barShift, datetime barTime)
              int s1c_fromLine     = g_anchorLine;
              ENUM_SRJ_DIR s1c_fromDir = g_dir;
              g_anchorLine    = t78_pr.topLine;
+             SrjRowkeyClear(); SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] reseed clears + plants bar row
              ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
              g_anchorBarTime = barTime;
              g_dir           = t78_dir;
@@ -8128,6 +8240,7 @@ void EvaluateClosedBar(int barShift, datetime barTime)
          int b3_toTier    = B3_AnchorTier(b3_cand);
          ENUM_SRJ_STATE b3_prevState = g_state;
          g_anchorLine    = b3_cand;
+         SrjRowkeyClear(); SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] anchor swap clears + plants bar row
          ReadBuf1(g_hPoi, b3_cand, g_anchorPrice, barShift);
          g_anchorBarTime = barTime;
          g_zoneHi        = 0.0;
@@ -8237,6 +8350,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
         }
       }
 
+    if(inWindow) SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] track latest hits row per live seed
+
     bool s1f_seedArmed = (g_state == ST_IDLE);   //--- [SIDE1F] (i) seed-bar exactness flag (new local only)
 
     if(g_state == ST_IDLE)
@@ -8297,6 +8412,7 @@ void EvaluateClosedBar(int barShift, datetime barTime)
         s1g_legDir = pr.isLong ? 1 : -1;   //--- [SIDE1G] (0) independent legDir capture (new local only)
         g_s2_seedShift = barShift;   //--- [STAGE-C E-C05] exact-seed bar carriage for the live vote
          g_anchorLine    = pr.topLine;
+         SrjRowkeyClear(); SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] new seed clears + plants seed-bar row
        //--- [FP-LIMBSEAT-1 S2-3] F3 owns the carried-side write (single
        //--- writer). Live rows carry no declared class -> ABSTAIN
        //--- pass-through of the legacy value (D3 holds by construction);
@@ -8615,6 +8731,7 @@ void EvaluateClosedBar(int barShift, datetime barTime)
          {
           int uj_sbFromLine = g_anchorLine; ENUM_SRJ_DIR uj_sbFromDir = g_dir;
           g_anchorLine = uj_sbLine; g_dir = uj_sbDir;
+          SrjRowkeyClear(); SrjRowkeyUpdate(barShift);   //--- [B-78 hunk RK] contender swap clears + plants bar row
           ReadBuf1(g_hPoi, uj_sbLine, g_anchorPrice, barShift);
           g_anchorBarTime = barTime;
           g_zoneHi = 0.0; g_zoneLo = 0.0; g_touchSeen = false;
diff --git "a/Experts\\SRJ_FlowNexus_EA.mq5.B78RK" "b/Experts\\SRJ_FlowNexus_EA.mq5"
index 9731ce9..b92a29b 100644
--- "a/Experts\\SRJ_FlowNexus_EA.mq5.B78RK"
+++ "b/Experts\\SRJ_FlowNexus_EA.mq5"
@@ -2276,6 +2276,7 @@ bool SrjS54DeadAtConfirm(int confirmShift)
 //--- Target logic only: session/pool, validity, nearest-wins, 1R floor, entry,
 //--- stop, exits, hunk S and every non-target use of g_anchorLine untouched.
 int      g_rkLines[POI_NLINES];
+int      g_rkSide[POI_NLINES];   //--- [B-81 hunk RKD] hit side parallel to g_rkLines: 1 = long-side hit, 0 = short-side hit (same longHit tag as RETESTBOOK dL/dS)
 int      g_rkCount = 0;
 datetime g_rkRowTime = 0;
 void SrjRowkeyClear()
@@ -2296,7 +2297,7 @@ void SrjRowkeyUpdate(const int barShift)
    double bodyLo = MathMin(o, cNext);
    double P   = _Point;
    double EPS = P * 0.001;
-   int lines[POI_NLINES]; int n = 0;
+   int lines[POI_NLINES]; int sides[POI_NLINES]; int n = 0;
    for(int k = 0; k < POI_NLINES; k++)
      {
       double L;
@@ -2305,17 +2306,23 @@ void SrjRowkeyUpdate(const int barShift)
       bool longHit  = (l <= L - P + EPS && bodyLo >= L - EPS);
       bool shortHit = (h >= L + P - EPS && bodyHi <= L + EPS);
       if(!longHit && !shortHit) continue;
-      if(n < POI_NLINES) lines[n++] = k;
+      if(n < POI_NLINES) { lines[n] = k; sides[n] = (longHit ? 1 : 0); n++; }   //--- [B-81 hunk RKD] keep the hit side beside the index, same longHit tag as RETESTBOOK dL/dS
      }
    if(n <= 0) return;
-   for(int i = 0; i < n; i++) g_rkLines[i] = lines[i];
+   for(int i = 0; i < n; i++) { g_rkLines[i] = lines[i]; g_rkSide[i] = sides[i]; }
    g_rkCount = n;
    g_rkRowTime = iTime(_Symbol, PERIOD_CURRENT, barShift);
   }
-bool RkHeldRefused(const int k)
+bool RkHeldRefused(const int k, const ENUM_SRJ_DIR dir)
   {
    if(g_rkCount <= 0) return false;
-   for(int i = 0; i < g_rkCount; i++) if(g_rkLines[i] == k) return true;
+   for(int i = 0; i < g_rkCount; i++)
+     {
+      if(g_rkLines[i] != k) continue;
+      if(dir == DIR_LONG) return (g_rkSide[i] == 1);   //--- [B-81 hunk RKD] refuse only the side-matched held lines
+      if(dir == DIR_SHORT) return (g_rkSide[i] == 0);
+      return false;
+     }
    return false;
   }
 
@@ -2712,27 +2719,46 @@ bool ComputeNearestTpTarget(int barShift, ENUM_SRJ_DIR dir,
 int anchorRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
 //--- [B-78 hunk RK] row key replaces the seed-anchor rank: lowest rank in the
 //--- held latest-retest row; empty held list keeps present behaviour (fallback).
+//--- [B-81 hunk RKD] side match: only held lines retested from the race direction
+//--- count as key and own-source; a line retested against the trade is never its
+//--- source (spec S2 row 1 side tag, s94). No side match keeps the kept anchor rank.
    SrjRowkeyUpdate(barShift);
    int rkKeyRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
    int rkKeyLine = g_anchorLine;
+   int rkFallback = (g_rkCount > 0 ? 0 : 1);
    if(g_rkCount > 0)
      {
       rkKeyRank = INT_MAX; rkKeyLine = -1;
+      int rkMatch = 0;
       for(int rki = 0; rki < g_rkCount; rki++)
-        { int rr = g_authorityRank[g_rkLines[rki]]; if(rr < rkKeyRank) { rkKeyRank = rr; rkKeyLine = g_rkLines[rki]; } }
-      anchorRank = rkKeyRank;
+        {
+         bool rkSideOk = ((dir == DIR_LONG) ? (g_rkSide[rki] == 1) : ((dir == DIR_SHORT) ? (g_rkSide[rki] == 0) : false));
+         if(!rkSideOk) continue;
+         rkMatch++;
+         int rr = g_authorityRank[g_rkLines[rki]];
+         if(rr < rkKeyRank) { rkKeyRank = rr; rkKeyLine = g_rkLines[rki]; }
+        }
+      if(rkMatch > 0) { anchorRank = rkKeyRank; rkFallback = 0; }
+      else { rkKeyRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX; rkKeyLine = g_anchorLine; rkFallback = 1; }
      }
    if(InpDebugLog)
      {
       string rkLines = "", rkOwn = "";
       for(int rki2 = 0; rki2 < g_rkCount; rki2++)
-        { if(rki2 > 0) { rkLines += ","; rkOwn += ","; } rkLines += g_lineCode[g_rkLines[rki2]] + ":" + IntegerToString(g_authorityRank[g_rkLines[rki2]]); rkOwn += g_lineCode[g_rkLines[rki2]]; }
-      PrintFormat("[SRJ-EA] ROWKEY bar=%s row=%s lines=%s key=%s tier=%d own=%s fallback=%d",
+        {
+         bool rkTagLong = (g_rkSide[rki2] == 1);
+         bool rkTagOk = ((dir == DIR_LONG) ? rkTagLong : ((dir == DIR_SHORT) ? !rkTagLong : false));
+         if(rki2 > 0) { rkLines += ","; }
+         rkLines += g_lineCode[g_rkLines[rki2]] + ":" + IntegerToString(g_authorityRank[g_rkLines[rki2]]) + ":d" + (rkTagLong ? "L" : "S");
+         if(rkTagOk) { if(rkOwn != "") rkOwn += ","; rkOwn += g_lineCode[g_rkLines[rki2]]; }
+        }
+      PrintFormat("[SRJ-EA] ROWKEY bar=%s row=%s dir=%s lines=%s key=%s tier=%d own=%s fallback=%d",
                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                   (g_rkCount > 0) ? TimeToString(g_rkRowTime, TIME_DATE|TIME_MINUTES) : "none",
+                  DirName(dir),
                   rkLines, (rkKeyLine >= 0 ? g_lineCode[rkKeyLine] : "none"),
                   (rkKeyRank >= INT_MAX/2) ? -1 : (rkKeyRank / 2),
-                  rkOwn, (g_rkCount > 0 ? 0 : 1));
+                  rkOwn, rkFallback);
      }
 for(int i = 0; i < ArraySize(sessbufs); i++)
   {
@@ -2782,7 +2808,7 @@ for(int kf = 0; kf < POI_NLINES; kf++)
   {
    if(!UjPoiTargetValid(kf, g_anchorLine))
      { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[kf], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
-   if(RkHeldRefused(kf)) continue;   //--- [B-78 hunk RK] own-source = held retest-row lines (silent, like the tier skip; ROWKEY carries the list)
+   if(RkHeldRefused(kf, dir)) continue;   //--- [B-78 hunk RK] own-source = held retest-row lines (silent, like the tier skip; ROWKEY carries the list) //--- [B-81 hunk RKD] side-matched only
    if((g_authorityRank[kf] / 2) > (anchorRank / 2)) continue;
    double vf;
    if(!ReadBuf1(g_hPoi, kf, vf, barShift)) continue;
@@ -2931,7 +2957,7 @@ if(!haveBest)
             {
    if(!UjPoiTargetValid(k2, g_anchorLine))
      { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[k2], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
-              if(RkHeldRefused(k2)) continue;   //--- [B-78 hunk RK] census mirror follows the same own-source list
+              if(RkHeldRefused(k2, dir)) continue;   //--- [B-78 hunk RK] census mirror follows the same own-source list //--- [B-81 hunk RKD] side-matched only
              if((g_authorityRank[k2] / 2) > (anchorRank / 2)) continue;
             double pv;
             if(!ReadBuf1(g_hPoi, k2, pv, barShift)) continue;
@@ -6778,7 +6804,7 @@ bool UpdateDivergenceLatch(int barShift, ENUM_SRJ_DIR dir, string &kindOut)
 //--- ResetSequence below is their first caller in file order.
 void SrjRowkeyClear();
 void SrjRowkeyUpdate(const int barShift);
-bool RkHeldRefused(const int k);
+bool RkHeldRefused(const int k, const ENUM_SRJ_DIR dir);   //--- [B-81 hunk RKD] side-matched refusal
 void ResetSequence()
   {
    g_state          = ST_IDLE;

## HUNK RKD DIFF vs .B78RK (work vs hunk-RK 7A88676A; +39/-13; RKD side-match only)

## T1 FILED-TRADE TABLE j43 vs j37 (B-78 T1 format; dates first; before vs after)

- 8/28 10:05 SHORT: j37 entry 1.16466 sl 1.16508 tp 1.16364 exit 11:40 BREAK D-POC 1.16439 | j43 SAME (ELECT j43 bar=10:00 R2.43; ENTRY bar=10:00; MTEXIT bar=11:40 entry=1.16466 exit=1.16439). SAME.
- 9/1 17:35 LONG: j37 entry 1.16022 sl 1.15975 tp 1.16077 exit 17:50 SL 1.15975 | j43 SAME (ELECT R1.17; ENTRY bar=17:30; MTEXIT bar=17:50 SL). SAME.
- 9/4 16:00 LONG: j37 entry 1.16018 sl 1.15847 tp 1.16302 exit 23:55 DAY_CLOSE 1.16129 | j43 SAME (ELECT R1.66 bar=15:55; ENTRY bar=15:55; MTEXIT bar=23:50 DAY_CLOSE entry=1.16018 exit=1.16129). SAME.
- 9/7 09:20 LONG: j37 entry 1.16135 sl 1.16098 tp 1.16200 exit 10:55 TP_TOUCH 1.16200 | j43 SAME (ELECT R1.76; ENTRY bar=09:15; MTEXIT bar=10:50 TP_TOUCH). SAME.
- 9/7 16:45 LONG: j37 entry 1.16261 sl 1.16238 tp 1.16315 exit 17:15 TP_TOUCH 1.16315 | j43 SAME (ELECT R2.34; ENTRY bar=16:40; MTEXIT bar=17:10 TP_TOUCH entry=1.16261 exit=1.16315). SAME.
- 9/8 10:10 SHORT: j37 entry 1.16205 sl 1.16258 tp 1.16102 exit 10:45 TP_TOUCH 1.16102 | j43 SAME (ELECT R1.94; ENTRY bar=10:05; MTEXIT bar=10:40 TP_TOUCH). SAME.
- 9/8 17:00 SHORT: j37 entry 1.16220 sl 1.16274 tp 1.16114 exit 17:35 SL 1.16274 | j43 SAME (ELECT R1.96; ENTRY bar=16:55; MTEXIT bar=17:30 SL). SAME.
- Totals: 7 fires vs 7 fires. New: none. Lost: none. Balance: j37 10474.64 vs j43 10474.64 (identical to the cent). Row-level: A6FIRED 7/7, MTEXIT 7/7, TP_ELECT 18/18, A6REFUSED 68/68 identical (normalized). S54KILL: j37 0, j43 0. Ticks/bars: 563338/3168 = j37.

## T2 FILED-TRADE TABLE j44 vs j38 (B-78 T2 format)

- 5/27 15:35 LONG: j38 entry 159.340 sl 159.197 tp 160.723 exit 20:10 159.535 (TP_TOUCH) | j44 SAME (ENTRY bar=15:30; MTEXIT bar=20:05 TP_TOUCH entry=159.340 exit=159.535; FIRED r9.67). SAME.
- 6/3 09:10 LONG (C3): j38 entry 159.929 sl 159.889 tp 159.983 exit 10:00 159.983 (TP_TOUCH) | j44 SAME (ENTRY bar=09:05; MTEXIT 09:55 TP_TOUCH; FIRED r1.35). SAME.
- 6/4 09:55 SHORT: j38 entry 159.868 sl 159.920 tp 159.748 exit 10:45 SL 159.920 | j44 SAME (ENTRY bar=09:50; MTEXIT 10:40 SL; FIRED r2.31). SAME.
- 6/5 16:55 LONG: j38 entry 160.115 sl 159.726 tp 160.723 exit 19:20 160.298 (TP_TOUCH) | j44 SAME (ENTRY bar=16:50; MTEXIT 19:15 TP_TOUCH; FIRED r1.56). SAME.
- 6/11 14:40 LONG (B3): j38 entry 160.524 sl 160.501 tp 160.587 exit 15:20 160.587 (TP_TOUCH) | j44 SAME (ENTRY bar=14:35; MTEXIT 15:20 TP_TOUCH; FIRED r2.74). SAME.
- Totals: 5 fires vs 5 fires. New: none. Lost: none. Balance: j38 10395.28 vs j44 10395.28 (identical to the cent). Row-level: A6FIRED 5/5, MTEXIT 5/5, TP_ELECT 10/10, A6REFUSED 77/77 identical (normalized). S54KILL: j38 0, j44 0. Ticks/bars: 740873/4320 = j38.

## RAW R-a ROWS (j43 EA FA4C9249; expected key Monthly-POC own W,M-POC fallback 0)

CS 0 06:03:50.016 SRJ_FlowNexus_EA (EURUSD,M5) 2026.09.04 15:40:00 [SRJ-EA] ROWKEY bar=2026.09.04 15:35 row=2026.09.04 15:35 dir=LONG lines=Weekly-POC:8:dL,Monthly-POC:6:dL,Yearly-POC:2:dS key=Monthly-POC tier=3 own=Weekly-POC,Monthly-POC fallback=0
CS 0 06:03:50.017 (identical second print)
TPCENSUS #212 bar=15:35 dir=LONG winner=Yearly-POC best=1.15987; #213 same winner.
TP_ELECT shadow=true entry=1.15964 sl=1.15835 tp=1.15987 R=0.18 bar=15:35 latchBar=15:40.
A6REFUSED class=ABSENT_DECLINED bar=15:40 state=S5_GATE_CHECK dir=LONG predicate=TP_RR_FAIL. No fire at 15:40 (no A6FIRED/ENTRY at 15:35).

## RAW R-b ROWS (expected key Yearly-POC own Yearly-POC; fire 15:55 R1.66; exit DAY_CLOSE)

TP_ELECT shadow=true entry=1.16018 sl=1.15847 tp=1.16302 R=1.66 bar=15:55 latchBar=16:00.
A6FIRED class=SELECTED state=FIRED bar=15:55 dir=LONG tp=1.16302 r=1.66 sl=1.15847 mode=1SWING div=hidden.
ENTRY_TICKET bar=15:55 (16:00 open entry).
MTEXIT bar=23:50 reason=DAY_CLOSE entry=1.16018 exit=1.16129 (Friday 23:55 execution per register CORRECTION).

## RAW R-c ROWS (F2k 17:00 SHORT; expected key Daily-POC; D-VWAP R0.20 FAIL; C_TOUCH; no fire)

ROWKEY bar=17:00 row=17:00 dir=SHORT lines=Daily-POC:10:dS key=Daily-POC tier=5 own=Daily-POC fallback=0.
TPCENSUS #71 bar=17:00 dir=SHORT winner=Daily-VWAP best=1.16498 distPts=26 (admitted carries Daily-VWAP:26).
UJ1R POLL entry=1.16524 sl=1.16652 tp=1.16498 R=0.20 FAIL.
CONFIRM_PREBIND_FAIL bar=17:00 dir=SHORT term=C_TOUCH. No A6FIRED/ENTRY.

## RAW R-d ROWS (27 Aug 10:05 SHORT; census predicted D-POC R0.40 refused)

ROWKEY bar=10:05 row=10:05 dir=SHORT lines=Daily-POC:10:dL,Daily-VWAP:11:dS key=Daily-VWAP tier=5 own=Daily-VWAP fallback=0.
TPCENSUS #60 bar=10:05 dir=SHORT winner=Daily-POC best=1.16541 distPts=6 (admitted carries Daily-POC:6).
UJ1R POLL entry=1.16547 sl=1.16562 tp=1.16541 R=0.40 FAIL.
Downstream seed refusals (no fire): A6REFUSED 10:10/10:20/10:45 (LTF_MISALIGN/FRESH_OB_DEAD). Covering words s89 + 27 Aug skip lines (s130/s136/s147).

## RAW R-e ROWS (key + own vs SLICE_B78)

A1 j43 bar=10:00 row=09:55 dir=SHORT lines=Daily-VWAP:11:dS key=Daily-VWAP tier=5 own=Daily-VWAP fallback=0. SAME.
A2 j43 bar=17:30 row=17:30 dir=LONG lines=Daily-VWAP:11:dL,Monthly-VWAP:7:dL key=Monthly-VWAP tier=3 own=Daily-VWAP,Monthly-VWAP fallback=0. SAME. (SHORT pass same bar: dir=SHORT same lines key=Yearly-POC tier=1 own= fallback=1.)
A4 j43 bar=09:15 row=09:15 dir=LONG lines=Daily-POC:10:dL,Weekly-POC:8:dL key=Weekly-POC tier=4 own=Daily-POC,Weekly-POC fallback=0. SAME.
A5 j43 bar=16:40 row=16:35 dir=LONG same lines/key/own as A4. SAME.
A6 j43 bar=10:05 row=10:05 dir=SHORT lines=Monthly-POC:6:dS key=Monthly-POC tier=3 own=Monthly-POC fallback=0. SAME.
A7 j43 bar=16:55 row=16:55 dir=SHORT same as A6. SAME.
F2k (see R-c). SAME.
B3 j44 bar=14:35 row=14:35 dir=LONG lines=Daily-POC:10:dL,Daily-VWAP:11:dL key=Daily-POC tier=5 own=Daily-POC,Daily-VWAP fallback=0. SAME.
C3 j44 bar=09:05 row=09:05 dir=LONG lines=Daily-VWAP:11:dL key=Daily-VWAP tier=5 own=Daily-VWAP fallback=0. SAME.
F1a j44 bar=15:30 row=14:20 dir=LONG lines=Daily-POC:10:dL,Weekly-POC:8:dL,Monthly-POC:6:dL key=Monthly-POC tier=3 own=Daily-POC,Weekly-POC,Monthly-POC fallback=0. SAME.
10/10 SAME.

## R-f PREDICTION CHECK (every pass whose winner/R differs from the B-80 R3 predicted column)

418/418 passes checked (EU 235 + UJ 183; scripted TPCENSUS-winner + POLL-R join on the B-80 census CSV): ZERO differences. Every live race winner/best and every POLL R/verdict on j43/j44 equals the B-80 predicted column (S = j41/j42 rows, K = j37/j38 rows, N = hand recompute incl. 10:05 D-POC R0.40). The census admitted-vs-booking zone nuance (X1) never materialized into a winner/R difference on these windows. Rows grade, never the census.

(End of slice)
