CODE REVIEW REQUEST — v149 — 2026-09-17 — FRESH-SESSION SELF-CONTAINED (no thread memory assumed; everything needed rides inline)

Background (complete on this page): the alert-only EA's entry TP selector currently picks the nearest admissible line, so session micro-lines 7-23 points away always beat family POI lines 54-297 points away. Four of the operator's booked trades therefore die at the 1R entry gate: 8/28 SHORT, 9/4 LONG (his +0.84 take), 9/7 morning LONG, 9/7 afternoon LONG. His Sept-8 SHORT already fires. The operator's governing ruling, verbatim (2026-09-17):
> R or RR or risk to reward ratio and Gain % are the same, I risk 1% either way.
> For the actual gain itself, it is counted after the exit so the entry initial TP could be different or revised along the way while the position is still floating and revised to a closer target.
> That is why, there are less than 1R or 1% gain because this revision of TP or early exit rule.
Recorded derivation from that ruling (builder, not his verbatim): entry TP is judged at signal time, realized outcome belongs to management (STEP 4, unbuilt, out of scope).

Change (one plain sentence): issue packet v3 — nearest eligible POI line including the anchor first with session lines only as fallback (E1), print-only census anchor admission (E2), restored SWEPTMASK diagnostic print (E3) — with winners stated as EXPECTED-not-required and the gate requiring a rank-eligible POI winner at R>=1.

File / function / lines: `Experts\SRJ_FlowNexus_EA.mq5` ComputeNearestTpTarget — OLD L2265-2393 and NEW v3 replacement both carried whole below verbatim with zero elisions (landed `E5B97B36`/597425/11127, committed, both remotes verified; draft packet `01_TASKS\PACKET_P-TP-FAMILYPASS.md` v3 `16FF2077`).
Source digest: SHA256 `E5B97B36` / 597425 B.

Complete code, verbatim, no elisions — OLD L2265-2393 (baseline, untouched):
bool ComputeNearestTpTarget(int barShift, ENUM_SRJ_DIR dir,
                             double currentPrice, double &tpTargetOut)
  {
   double best = 0.0;
   bool   haveBest = false;
   //--- [S1-TP-PROMOTION-001] live promotion: prev-day session H/L join the
   //--- candidate walk (indices 10..17 -> swept bits 14..21, unset this stage).
   const int sessbufs[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
                              FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
                              FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
                              FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
                              FL_BUF_PM_HIGH, FL_BUF_PM_LOW,
                              FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW,
                              FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW,
                              FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW,
                              FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
   //--- TASK 39: swept + session-live mask, read once for the session/PD group.
   //--- The POI-line loop below is deliberately not filtered by it.
   double s39_mask;
   if(!ReadFlow(FL_BUF_SWEPT_MASK, s39_mask, barShift)) s39_mask = EMPTY_VALUE;
    //--- [Task 144 / EA-141] print the swept+live mask so every session-level
    //--- exclusion is attributable to a branch. Print only; nothing reads this.
    if(InpDebugLog)
      {
       int t144_m = (s39_mask == EMPTY_VALUE) ? -1 : (int)MathRound(s39_mask);
       PrintFormat("[SRJ-EA] SWEPTMASK bar=%s raw=%.1f m=%d "
                   "swept=%d%d%d%d%d%d%d%d%d%d live=%d%d%d%d",
                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                TIME_DATE|TIME_MINUTES),
                   s39_mask, t144_m,
                   (t144_m < 0) ? 9 : ((t144_m >> 0) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 1) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 2) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 3) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 4) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 5) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 6) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 7) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 8) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 9) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 10) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 11) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 12) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 13) & 1));
      }

   for(int i = 0; i < ArraySize(sessbufs); i++)
     {
      double v;
      if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))
         TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
     }
   int anchorRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
   for(int k = 0; k < POI_NLINES; k++)
     {
      if(k == g_anchorLine || (g_authorityRank[k] / 2) > (anchorRank / 2)) continue;
      double v;
      if(!ReadBuf1(g_hPoi, k, v, barShift)) continue;
      TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
     }
   //--- TASK 23 (EA-23a / EA-24): read-only census of the take-profit candidate
   //--- set. Re-walks both candidate groups and matches each against the value
   //--- `best` already holds, so it names the winner without touching it. It
   //--- assigns nothing this function reads and alters no control flow.
   //--- `best` was assigned directly from a candidate, so exact equality is a
   //--- valid identity test here and is not a tolerance comparison.
   if(InpDebugLog)
     {
      static int s_tpDumps = 0;
      if(s_tpDumps < 2000)
        {
         s_tpDumps++;
         const int cbuf[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
                                FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
                                FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
                                FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
                                FL_BUF_PM_HIGH, FL_BUF_PM_LOW,
                                FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW,
                                FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW,
                                FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW,
                                FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
         const string cname[18] = { "PDH", "PDL", "ASH", "ASL", "LOH", "LOL",
                                    "NYH", "NYL", "PMH", "PML",
                                    "YASH", "YASL", "YLOH", "YLOL",
                                    "YNYH", "YNYL", "YPMH", "YPML" };
         string winner   = "NONE";
         string admitted = "";
         int    nEmpty   = 0;
         for(int i = 0; i < 18; i++)
           {
            double cv;
            if(!ReadFlow(cbuf[i], cv, barShift)) continue;
            if(cv == EMPTY_VALUE) { nEmpty++; continue; }
            bool inDir = (dir == DIR_LONG) ? (cv > currentPrice) : (cv < currentPrice);
            if(!inDir) continue;
            admitted += cname[i] + ":" +
                        DoubleToString(MathAbs(cv - currentPrice) / _Point, 0) + " ";
            if(haveBest && cv == best) winner = cname[i];
           }
         for(int k2 = 0; k2 < POI_NLINES; k2++)
           {
            if(k2 == g_anchorLine || (g_authorityRank[k2] / 2) > (anchorRank / 2)) continue;
            double pv;
            if(!ReadBuf1(g_hPoi, k2, pv, barShift)) continue;
            if(pv == EMPTY_VALUE) { nEmpty++; continue; }
            bool inDir = (dir == DIR_LONG) ? (pv > currentPrice) : (pv < currentPrice);
            if(!inDir) continue;
            admitted += g_lineCode[k2] +
                        ((k2 == g_anchorLine) ? "*" : "") + ":" +
                        DoubleToString(MathAbs(pv - currentPrice) / _Point, 0) + " ";
            if(haveBest && pv == best)
               winner = g_lineCode[k2] + ((k2 == g_anchorLine) ? "(ANCHOR)" : "");
           }
         PrintFormat("[SRJ-EA] TPCENSUS #%d bar=%s dir=%s close=%s winner=%s best=%s "
                     "distPts=%s empties=%d admitted= %s",
                     s_tpDumps,
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     DirName(dir),
                     DoubleToString(currentPrice, _Digits),
                     winner,
                     haveBest ? DoubleToString(best, _Digits) : "-",
                     haveBest ? DoubleToString(MathAbs(best - currentPrice) / _Point, 0) : "-",
                     nEmpty, admitted);
        }
     }
   if(!haveBest) return false;
   tpTargetOut = best;
   return true;
  }

Complete code, verbatim, no elisions — NEW v3 (replaces L2265-2393 whole; E1 POI-first incl anchor + E2 census anchor admission + E3 SWEPTMASK restore byte-identical; ASCII-only verified; braces balanced):
bool ComputeNearestTpTarget(int barShift, ENUM_SRJ_DIR dir,
                             double currentPrice, double &tpTargetOut)
  {
   double best = 0.0;
   bool   haveBest = false;
   //--- [S1-TP-PROMOTION-001] live promotion: prev-day session H/L join the
   //--- candidate walk (indices 10..17 -> swept bits 14..21, unset this stage).
   const int sessbufs[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
                              FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
                              FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
                              FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
                              FL_BUF_PM_HIGH, FL_BUF_PM_LOW,
                              FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW,
                              FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW,
                              FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW,
                              FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
   //--- TASK 39: swept + session-live mask, read once for the session/PD group.
   //--- The POI-line loop below is deliberately not filtered by it.
   double s39_mask;
   if(!ReadFlow(FL_BUF_SWEPT_MASK, s39_mask, barShift)) s39_mask = EMPTY_VALUE;
    //--- [Task 144 / EA-141] print the swept+live mask so every session-level
    //--- exclusion is attributable to a branch. Print only; nothing reads this.
    if(InpDebugLog)
      {
       int t144_m = (s39_mask == EMPTY_VALUE) ? -1 : (int)MathRound(s39_mask);
       PrintFormat("[SRJ-EA] SWEPTMASK bar=%s raw=%.1f m=%d "
                   "swept=%d%d%d%d%d%d%d%d%d%d live=%d%d%d%d",
                   TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
                                TIME_DATE|TIME_MINUTES),
                   s39_mask, t144_m,
                   (t144_m < 0) ? 9 : ((t144_m >> 0) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 1) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 2) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 3) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 4) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 5) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 6) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 7) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 8) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 9) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 10) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 11) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 12) & 1),
                   (t144_m < 0) ? 9 : ((t144_m >> 13) & 1));
      }

   //--- [P-TP-FAMILYPASS V3 2026-09-17] block above RESTORED byte-identical per Astra v148 (dropped in v2 draft; print-only, log-shape unchanged).
   //--- [P-TP-FAMILYPASS E1 2026-09-17, V2 2026-09-17] POI-FIRST (fork-2,
   //--- operator ruling 2026-09-17: entry TP is the family line; realized
   //--- outcome is management, STEP 4; V2 restatement per v145 Luna: this is
   //--- the NEAREST ELIGIBLE POI incl anchor, not a family-specific mapping).
   //--- POI lines only, anchor ADMITTED, same tier-rank filter as the legacy
   //--- walk. The nearest direction-valid POI line wins outright; the
   //--- session/PD walk runs ONLY when NO eligible POI qualifies (fallback).
   //--- TpTargetUpdateBest reuse keeps the in-zone guard (Task 31) and the
   //--- nearest-wins reduction identical in each pass.
   int anchorRank = (g_anchorLine >= 0) ? g_authorityRank[g_anchorLine] : INT_MAX;
   double famBest = 0.0;
   bool   haveFam = false;
   for(int kf = 0; kf < POI_NLINES; kf++)
     {
      if((g_authorityRank[kf] / 2) > (anchorRank / 2)) continue;
      double vf;
      if(!ReadBuf1(g_hPoi, kf, vf, barShift)) continue;
      TpTargetUpdateBest(vf, dir, currentPrice, famBest, haveFam);
     }
   if(haveFam)
     {
      best = famBest;
      haveBest = true;
     }
   else
     {
      for(int i = 0; i < ArraySize(sessbufs); i++)
        {
         double v;
         if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))
            TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
        }
      //--- Fallback POI scan OMITTED by construction: the family pass admits a
      //--- strict SUPERSET (identical filter minus the anchor skip, identical
      //--- reduction, same bar and price) -- any line it could admit already set
      //--- haveFam above. Deviation from the v144 "full walk fallback" phrasing
      //--- declared here for council rule; behaviorally identical, proven above.
     }
   //--- TASK 23 (EA-23a / EA-24): read-only census of the take-profit candidate
   //--- set. Re-walks both candidate groups and matches each against the value
   //--- `best` already holds, so it names the winner without touching it. It
   //--- assigns nothing this function reads and alters no control flow.
   //--- `best` was assigned directly from a candidate, so exact equality is a
   //--- valid identity test here and is not a tolerance comparison.
   //--- [P-TP-FAMILYPASS E2 2026-09-17, print-only] census second loop ADMITS
   //--- the anchor (rank filter unchanged) so an anchor win is nameable;
   //--- behavior unchanged, gates read winner reliably.
   if(InpDebugLog)
     {
      static int s_tpDumps = 0;
      if(s_tpDumps < 2000)
        {
         s_tpDumps++;
         const int cbuf[18] = { FL_BUF_PDAY_HIGH, FL_BUF_PDAY_LOW,
                                FL_BUF_ASIA_HIGH, FL_BUF_ASIA_LOW,
                                FL_BUF_LONDON_HIGH, FL_BUF_LONDON_LOW,
                                FL_BUF_NY_HIGH, FL_BUF_NY_LOW,
                                FL_BUF_PM_HIGH, FL_BUF_PM_LOW,
                                FL_BUF_PD_ASIA_HIGH, FL_BUF_PD_ASIA_LOW,
                                FL_BUF_PD_LONDON_HIGH, FL_BUF_PD_LONDON_LOW,
                                FL_BUF_PD_NY_HIGH, FL_BUF_PD_NY_LOW,
                                FL_BUF_PD_PM_HIGH, FL_BUF_PD_PM_LOW };
         const string cname[18] = { "PDH", "PDL", "ASH", "ASL", "LOH", "LOL",
                                    "NYH", "NYL", "PMH", "PML",
                                    "YASH", "YASL", "YLOH", "YLOL",
                                    "YNYH", "YNYL", "YPMH", "YPML" };
         string winner   = "NONE";
         string admitted = "";
         int    nEmpty   = 0;
         for(int i = 0; i < 18; i++)
           {
            double cv;
            if(!ReadFlow(cbuf[i], cv, barShift)) continue;
            if(cv == EMPTY_VALUE) { nEmpty++; continue; }
            bool inDir = (dir == DIR_LONG) ? (cv > currentPrice) : (cv < currentPrice);
            if(!inDir) continue;
            admitted += cname[i] + ":" +
                        DoubleToString(MathAbs(cv - currentPrice) / _Point, 0) + " ";
            if(haveBest && cv == best) winner = cname[i];
           }
         for(int k2 = 0; k2 < POI_NLINES; k2++)
           {
            if((g_authorityRank[k2] / 2) > (anchorRank / 2)) continue;
            double pv;
            if(!ReadBuf1(g_hPoi, k2, pv, barShift)) continue;
            if(pv == EMPTY_VALUE) { nEmpty++; continue; }
            bool inDir = (dir == DIR_LONG) ? (pv > currentPrice) : (pv < currentPrice);
            if(!inDir) continue;
            admitted += g_lineCode[k2] +
                        ((k2 == g_anchorLine) ? "*" : "") + ":" +
                        DoubleToString(MathAbs(pv - currentPrice) / _Point, 0) + " ";
            if(haveBest && pv == best)
               winner = g_lineCode[k2] + ((k2 == g_anchorLine) ? "(ANCHOR)" : "");
           }
         PrintFormat("[SRJ-EA] TPCENSUS #%d bar=%s dir=%s close=%s winner=%s best=%s "
                     "distPts=%s empties=%d admitted= %s",
                     s_tpDumps,
                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                     DirName(dir),
                     DoubleToString(currentPrice, _Digits),
                     winner,
                     haveBest ? DoubleToString(best, _Digits) : "-",
                     haveBest ? DoubleToString(MathAbs(best - currentPrice) / _Point, 0) : "-",
                     nEmpty, admitted);
        }
     }
   if(!haveBest) return false;
   tpTargetOut = best;
   return true;
  }

Admission function, verbatim, untouched (closes the off-page gap — `TpTargetUpdateBest`, EA L2217-2238; note L2220 rejects EMPTY_VALUE and the zone guard):
void TpTargetUpdateBest(double v, ENUM_SRJ_DIR dir, double currentPrice,
                         double &best, bool &haveBest)
  {
   if(v == EMPTY_VALUE || v <= 0.0) return;
   bool inDir = (dir == DIR_LONG) ? (v > currentPrice) : (v < currentPrice);
   if(!inDir) return;

   //--- [Task 31 / Ruling 7c] A target lying INSIDE the entry zone is not a
   //--- target. Measured instance: tp=1.15090 inside zone 1.15064-1.15096
   //--- inverted the geometry entirely (the "profit" side sat behind the
   //--- entry). Excluding it promoted the next candidate at 1.15144, giving
   //--- R 1.50 with both legs coherent. None of the operator's three logged
   //--- August targets was inside its zone, so no wider exclusion is warranted.
   //--- Threshold-free: the test is containment, not distance. Part A section 7
   //--- is not engaged.
   //--- g_zoneHi/g_zoneLo read 0.0 until the S3 transition sets them, so this
   //--- guard is inert before arming and pre-arm behaviour is unchanged.
   if(g_zoneHi > 0.0 && g_zoneLo > 0.0 && v >= g_zoneLo && v <= g_zoneHi) return;
   double dist = MathAbs(v - currentPrice);
   if(!haveBest || dist < MathAbs(best - currentPrice))
     { best = v; haveBest = true; }
  }

Run rows, raw (machine-pulled byte-verbatim, RECON45 archive `70CE840F` — OLD-code behavior, the "before"):
[SRJ-EA] TP_RR_FAIL_LATCH bar=2026.08.28 10:00 dir=SHORT entry=1.16466 sl=1.16508 tp=1.16459 R=0.17
[SRJ-EA] TPCENSUS #95 bar=2026.08.28 10:00 dir=SHORT close=1.16466 winner=YPML best=1.16459 distPts=7 empties=0 admitted= PDL:102 ASL:11 LOL:37 NYL:102 PML:7 YASL:11 YNYL:102 YPML:7 Monthly-POC:1042 Monthly-VWAP:602 Quarterly-POC:2132 Quarterly-VWAP:1588 Yearly-POC:1067 Yearly-VWAP:144 FOMC-POC:1098 FOMC-VWAP:793 
[SRJ-EA] TP_RR_FAIL_LATCH bar=2026.09.07 09:15 dir=LONG entry=1.16135 sl=1.16098 tp=1.16158 R=0.62
[SRJ-EA] TPCENSUS #348 bar=2026.09.07 09:15 dir=LONG close=1.16135 winner=YPMH best=1.16158 distPts=23 empties=0 admitted= PDH:196 ASH:65 LOH:8 NYH:135 PMH:23 YASH:65 YLOH:167 YLOL:53 YNYH:135 YPMH:23 Yearly-VWAP:180 
[SRJ-EA] TP_RR_FAIL_LATCH bar=2026.09.07 16:40 dir=LONG entry=1.16261 sl=1.16238 tp=1.16270 R=0.39
[SRJ-EA] TPCENSUS #376 bar=2026.09.07 16:40 dir=LONG close=1.16261 winner=YNYH best=1.16270 distPts=9 empties=0 admitted= PDH:70 LOH:97 NYH:21 YLOH:97 YNYH:9 Yearly-VWAP:54 
[SRJ-EA] TP_RR_FAIL_LATCH bar=2026.09.04 15:55 dir=LONG entry=1.16018 sl=1.15847 tp=1.16188 R=0.99
[SRJ-EA] TPCENSUS #329 bar=2026.09.04 15:55 dir=LONG close=1.16018 winner=YLOL best=1.16188 distPts=170 empties=0 admitted= PDH:394 ASH:313 ASL:206 LOH:284 LOL:170 NYH:252 PMH:361 PML:234 YASH:313 YASL:206 YLOH:284 YLOL:170 YNYH:283 YPMH:361 YPML:234 Yearly-VWAP:297 
[SRJ-EA] TPCENSUS #384 bar=2026.09.08 10:05 dir=SHORT close=1.16207 winner=YLOL best=1.16102 distPts=105 empties=0 admitted= PDL:157 LOL:9 YLOL:105 Monthly-VWAP:135 Quarterly-POC:1873 Quarterly-VWAP:1156 Yearly-POC:220 FOMC-POC:839 FOMC-VWAP:429 

Zone rows, raw (same archive — entry zones at/near the five bars):
[SRJ-EA] S3INPLAY bar=2026.08.28 10:00 dir=SHORT inPlay=0 via=none zoneLo=1.16492 zoneHi=1.16507 barLo=1.16462 barHi=1.16486 close=1.16467 sw1=1.16491@1 sw2=-@-1
[SRJ-EA] S3INPLAY bar=2026.09.04 15:45 dir=LONG inPlay=1 via=BAR zoneLo=1.15907 zoneHi=1.15933 barLo=1.15902 barHi=1.16016 close=1.16006 sw1=1.15847@3 sw2=-@-1
[SRJ-EA] S3INPLAY bar=2026.09.07 09:00 dir=LONG inPlay=1 via=BAR zoneLo=1.16098 zoneHi=1.16109 barLo=1.16103 barHi=1.16143 close=1.16116 sw1=1.16098@4 sw2=1.16088@8
[SRJ-EA] S3INPLAY bar=2026.09.07 15:50 dir=LONG inPlay=1 via=BAR zoneLo=1.16229 zoneHi=1.16253 barLo=1.16247 barHi=1.16282 close=1.16252 sw1=1.16209@7 sw2=-@-1
[SRJ-EA] S3INPLAY bar=2026.09.08 10:05 dir=SHORT inPlay=1 via=SWINGLEG zoneLo=1.16362 zoneHi=1.16377 barLo=1.16206 barHi=1.16232 close=1.16207 sw1=1.16251@3 sw2=-@-1

Source row for the 9/8 pair (same archive — entry/SL now on the page):
[SRJ-EA] SIDE1X_STOPREF bar=2026.09.08 10:05 dir=SHORT entry=1.16205 liveStop=1.16258 ruleStop=1.16258 ruleSlot=5 ruleImb=0 liveTp=1.16102 liveR=1.94 livePass=1

Zone containment (CORRECTED 9/4 margin — was 282, true value 382; all recomputed): 8/28 SHORT tp 1.16322 vs zone [1.16492, 1.16507] same-bar → 170pts below zoneLo, OUTSIDE. 9/4 LONG tp 1.16315 vs zone [1.15907, 1.15933] adjacent-bar (15:45 vs latch 15:55, same setup) → 382pts above zoneHi, OUTSIDE. 9/7am LONG tp 1.16315 vs zone [1.16098, 1.16109] adjacent-bar (09:00 vs latch 09:15) → 206pts above zoneHi, OUTSIDE. 9/7pm LONG tp 1.16315 vs zone [1.16229, 1.16253] adjacent-bar (15:50 vs latch 16:40) → 62pts above zoneHi, OUTSIDE. 9/8 SHORT tp 1.16072 (135 below census close 1.16207; stopref entry 1.16205 differs by 2pts, immaterial) vs zone [1.16362, 1.16377] same-bar → 290pts below zoneLo, OUTSIDE. Zone widths 11-26pts; margins 62-382pts. Winners remain EXPECTED (run-confirmed by gate, §2 names expected-not-required).

Prior round quoted complete and ruled (four texts; code UNCHANGED except E3 restore + gate words):
(A) v148 Luna, filed at `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md` marker LUNA-V148-FILED-001 — ACCEPTED in substance (predictions-vs-gate wording corrected: §2 expected-not-required, G3 requires POI-at-R>=1):
Discrepancy — **do not issue exactly as drafted.**

**L539–L557** explicitly label the supplied run rows as **OLD-code behavior**, so they cannot be NEW-code run confirmation.

**L595** then calls the five NEW-code winners “**PREDICTIONS — the run proves them**,” while the actual evidence presented immediately before is still the old-code run. That is a provenance contradiction.

**L597** makes the contradiction explicit: it requires the five winners to **MUST-FIRE**, and says a predicted winner that does not materialize triggers REPORT+HALT. That means the winners are still hypotheses awaiting NEW-code materialization, not already run-confirmed facts.

The zone evidence at **L559–L571** strengthens the eligibility case, but it does not convert the OLD-code rows into a NEW-code execution result.

**Ruling: discrepancy at L595–L597.** The packet can be described as **predicted NEW-code winners supported by code/arithmetic/zone analysis**, but not “run-confirmed” from the evidence actually carried on the page.
(B) v148 Sonnet, filed at `06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md` marker SONNET-V148-FILED-001 — ACCEPTED both points (382 corrected above; 9/8 pair now on the page via EXTRA-ROWS):
**Discrepancy** — one arithmetic error in the page's own zone-containment math, plus one prediction that can't be checked from anything given on this page. Everything else on the page (code logic, superset argument, 4 of 5 R-ratios, 4 of 5 zone margins) checks out exactly.

**What I verified as correct:**

*Code logic (OLD vs NEW).* NEW replaces the merged session+POI single reduction with a two-stage pick: a family/POI-only pass (`famBest`/`haveFam`, anchor now admitted — the `k == g_anchorLine` skip is gone from this loop only) that runs first, and the session-line loop only executes in the `else` branch when `haveFam` is false. That's a faithful implementation of "nearest eligible POI including anchor, session only as fallback."

*The "fallback POI scan omitted by construction" claim.* True. OLD's second loop filter was `k==anchorLine || rank/2>anchorRank/2`; NEW's family filter is just `rank/2>anchorRank/2`. NEW's candidate set is a strict superset (it only adds the anchor back in) of what a literal OLD-style fallback POI scan would check. Since `TpTargetUpdateBest` is a stateless per-candidate admit/nearest test, a superset scan finding nothing (`haveFam==false`) guarantees the narrower subset would also find nothing. No redundant scan needed — the comment's reasoning is sound, not just asserted.

*E2 census change.* Removing the anchor skip in the print-only second loop touches only local `winner`/`admitted` strings consumed by `PrintFormat`. It doesn't touch `best`/`haveBest`. Correctly print-only.

*R-ratio arithmetic, 4 of 5:*
- 8/28: 7/42=0.167→0.17 (old) ✓
- 9/4: 170/171=0.994→0.99 (old) ✓
- 9/7am: 23/37=0.622→0.62 (old) ✓
- 9/7pm: 9/23=0.391→0.39 (old) ✓

**The discrepancy:**

In the "Zone containment" paragraph, the 9/4 LONG line reads *"tp 1.16315 ... vs zone [1.15907, 1.15933] ... → 282pts above zoneHi."* Recomputing: 1.16315 − 1.15933 = 0.00382 → **382 points**, not 282. (The other four margins in that same paragraph — 170, 206, 62, 292 — all recompute correctly, so this looks like an isolated digit slip, not a pattern.) It doesn't change the OUTSIDE conclusion — 382 is still well clear of a 26pt zone — but it does mean the paragraph's own closing claim, *"margins are 62-292pts,"* is wrong on its own numbers: the true 9/4 margin (382) falls outside the range the paragraph asserts.

**The unverifiable one:**

9/8 SHORT has no `TP_RR_FAIL_LATCH` row on this page — only a census row (best=1.16102, distPts=105) and the S3INPLAY zone row. Cases 1–4 could be checked because entry and SL were both given verbatim; case 5's entry/SL pair isn't stated anywhere in this document, so the claimed "Monthly-VWAP 135pts R 2.55" can't be independently recomputed from what's here (it implies a risk of ~53pts, which isn't derivable from the given rows). This isn't shown to be wrong — it's just outside what the page itself proves.

**Not in scope for this review:** the hashes, commit IDs, remote-verification, and file-existence claims are disk-state assertions I have no way to check from text, and per your own instruction I'm not treating their absence as a finding either way — that's the "genuineness vs. disk" half you've already carved out.
(C) v148 Astra, filed at `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md` marker ASTRA-V148-FILED-001 — ACCEPTED (SWEPTMASK block restored byte-identical as E3; §1 claim now true):
Discrepancy — **OLD L2285–2309**: NEW v2 removes the entire Task 144 / EA-141 `SWEPTMASK` diagnostic block. This is an undeclared logging deletion beyond E1’s selector change and E2’s census anchor admission. Restore that block or explicitly declare its removal; **do not issue exactly as drafted**.
(D) v148 Opus, filed at `06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md` marker OPUS-V148-FILED-001 — ruled point by point: D1 mechanism REFUTED by L2220 above (EMPTY_VALUE rejected — failure mode impossible) but page-gap ACCEPTED (function now carried inline); D2 ACCEPTED (no TP-anchor price exists on record — searched; gate restated per his option 2, §2 expected-not-required); D3 ACCEPTED (9/8 pair now on the page; close-consistent price used):
## Discrepancy

Ruling on the page only. Two blockers, one minor.

### D1 — `haveFam` as fallback switch is not proven identical; EMPTY_VALUE can leak (NEW block L33–L44)

Line numbers below count the NEW v2 paste with `bool ComputeNearestTpTarget(` as L1 (so L33 ≈ file L2297 under the stated L2265 anchor).

- **L33–L39** hand raw `ReadBuf1` results to `TpTargetUpdateBest` with no `EMPTY_VALUE` guard.
- **L40–L44** then use `haveFam` as a hard switch that suppresses the session/PD walk entirely.
- The omission comment at **L53–L57** proves only that the *POI fallback scan* is redundant (that part is correct: identical rank filter minus the anchor skip, identical reduction, same bar and price → strict superset). It does **not** prove the new `haveFam` gate is behaviorally safe.

The gap: if every rank-eligible POI line is `EMPTY_VALUE` on a bar, and `TpTargetUpdateBest` does not reject `EMPTY_VALUE`, then for a LONG `EMPTY_VALUE > currentPrice` holds, `haveFam` goes true, `best = EMPTY_VALUE`, the session fallback at **L47–L52** never runs, and the function returns `EMPTY_VALUE` as `tpTargetOut`. Under OLD code the union walk masked this: a valid session line was already in `best` and nearest-wins kept it. NEW code widens the failure from "nothing valid anywhere" to "no valid POI line," which is a regression in scope, not an identity.

The page itself establishes that `EMPTY_VALUE` reaches these buffers — the census guards it explicitly in both loops (`if(cv == EMPTY_VALUE) { nEmpty++; continue; }` and the `pv` equivalent) and carries an `empties` counter in the print. `TpTargetUpdateBest` is off-page and declared untouched, so its admission criteria cannot be verified here. Either guard `EMPTY_VALUE` at L37–L38 before the call, or carry `TpTargetUpdateBest` verbatim on the page so the claim at L53–L57 can be closed.

### D2 — MUST-FIRE gate names non-anchor winners, but the run rows contain zero anchor data (NEW block L35 vs. the five predictions and the MUST-FIRE gate)

E1 removes the `k == g_anchorLine` skip, so the anchor is now an admissible TP candidate on every bar (it always passes the rank filter at **L35**, since `g_authorityRank[anchor]/2 == anchorRank/2`). E2's stated purpose — "so an anchor win is nameable" — concedes an anchor win is live.

But every run row on this page was produced by OLD census code, whose second loop skipped the anchor. So none of the five `admitted=` lists contain the anchor's distance. The page therefore has no basis for asserting Yearly-VWAP (×4) and Monthly-VWAP (×1) as the nearest eligible POI line — an anchor line nearer than 144/297/180/54/135 points would win instead, and the MUST-FIRE gate would `REPORT+HALT` on the exact outcome E1 and E2 were written to enable.

This cuts against the packet's purpose, not just its bookkeeping: admitting the anchor can only shorten the winning distance relative to an anchor-skipping POI-first pass. If an anchor line sits a few points past price, it becomes the nearest eligible POI and the 1R gate still fails — the same pathology the packet is trying to remove, relocated from session micro-lines to the anchor. The direction filter does not settle it either; the zone rows give `zoneLo/zoneHi/sw1/sw2`, which are swing-derived, not the anchor POI's price, so "the anchor is on the wrong side of price" is inference, not evidence.

Fix on the page, not in the run: either land E2's census first as a print-only recon pass and pull the anchor distances for the five bars, or restate MUST-FIRE as "winner is a rank-eligible POI line with R ≥ 1" and demote the five named lines to expected-not-required.

### D3 — minor, non-material: 9/8 reference price and R

The containment line uses `1.16205` for 9/8 ("135 below 1.16205" → tp 1.16070). The only 9/8 price on the page is census #384 `close=1.16207`, which gives 1.16072. Two points, and the containment margin is 292 points, so nothing flips — but the number is unsourced. Separately, 9/8 R 2.55 implies a 53-point stop; 9/8 has no `TP_RR_FAIL_LATCH` row, so no SL appears on the page and that figure is not checkable here.

### What is clean

- Subsumption of the omitted POI fallback (L53–L57), on the POI candidate set: correct.
- `anchorRank` hoisted to L30 and still in scope for the census: correct.
- Census rank filter now matches E1 (anchor skip dropped in the second loop), `winner` overwrite order session→POI is correct, print-only, no control-flow effect.
- Arithmetic re-verified from the latch rows: 144/42 = 3.43, 297/171 = 1.74, 180/37 = 4.86, 54/23 = 2.35. Yearly-VWAP is self-consistent at 1.16315 across the three September bars.
- Zone containment: margins 62–292 points against 11–26 point zones, so adjacent-bar staleness cannot flip any of the five. The in-zone guard does not exclude the predicted winners.

Expected winners under NEW code (EXPECTED-not-required — the run confirms; G3 passes on any rank-eligible POI winner at R>=1): 8/28 SHORT → Yearly-VWAP 144pts R 3.43; 9/4 LONG → Yearly-VWAP 297pts R 1.74; 9/7am LONG → Yearly-VWAP 180pts R 4.86; 9/7pm LONG → Yearly-VWAP 54pts R 2.35; 9/8 SHORT → Monthly-VWAP 135pts R 2.55 with moved TP (declared). Exit scan `MtNearestTpTarget` untouched (management stays nearest-valid per his revision rule); `TpSessionLevelFiltered` untouched; entry call sites inherit.

Gates inline (no prior text needed): compile "Result: 0 errors, 0 warnings"; run window 08-26→09-09 (3168 bars) "Test passed"; WS161 loads=stores mismatch=0; G3 EXPECTED-not-required (each of the five bars fires with a rank-eligible POI winner at R>=1; §2 names expected; anything else = REPORT+HALT, revert nothing); MUST-SILENT every day he declined (8/26, 8/27, 8/31, 9/1, 9/2, 9/3, 9/9 + his-invalid rows); any fire outside the five reports row-complete for HIS adjudication (not auto-failed); a fire on a day he marked invalid is BLOCKED per his C5 ruling; post-run digests recorded, FlowLogic untouched.

Question (one, specific): issue packet P-TP-FAMILYPASS v3 exactly as drafted (E1 POI-first per the NEW code above; E2 print-only census anchor admission; E3 SWEPTMASK restore; S1 pre-hash gate `E5B97B36`; G3 expected-not-required per above) — yes means issue as drafted; any discrepancy, with line numbers?

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
