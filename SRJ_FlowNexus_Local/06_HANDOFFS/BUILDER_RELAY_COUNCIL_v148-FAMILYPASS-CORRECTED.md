CODE REVIEW REQUEST — v148 — 2026-09-17 — FRESH-SESSION SELF-CONTAINED (no thread memory assumed; everything needed rides inline)

Background (complete on this page): the alert-only EA's entry TP selector currently picks the nearest admissible line, so session micro-lines 7-23 points away always beat family POI lines 54-297 points away. Four of the operator's booked trades therefore die at the 1R entry gate: 8/28 SHORT, 9/4 LONG (his +0.84 take), 9/7 morning LONG, 9/7 afternoon LONG. His Sept-8 SHORT already fires. The operator's governing ruling, verbatim (2026-09-17):
> R or RR or risk to reward ratio and Gain % are the same, I risk 1% either way.
> For the actual gain itself, it is counted after the exit so the entry initial TP could be different or revised along the way while the position is still floating and revised to a closer target.
> That is why, there are less than 1R or 1% gain because this revision of TP or early exit rule.
Recorded derivation from that ruling (builder, not his verbatim): entry TP is judged at signal time, realized outcome belongs to management (STEP 4, unbuilt, out of scope) — so all four booked setups fire at entry under the amended selector.

Change (one plain sentence): issue the amended packet that picks the nearest eligible POI line including the anchor first with session lines only as fallback, plus a print-only census fix so an anchor win is nameable — with the winners below stated as PREDICTED (run-confirmed by gate, not established by old rows) and the zone-guard evidence carried inline.

File / function / lines: `Experts\SRJ_FlowNexus_EA.mq5` ComputeNearestTpTarget — OLD L2265-2393 and NEW v2 replacement both carried whole below verbatim with zero elisions (landed `E5B97B36`/597425/11127, committed, both remotes verified; draft packet `01_TASKS\PACKET_P-TP-FAMILYPASS.md` v2 `6FA270AE`; code UNCHANGED since the v146/v147 reviews).
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

Complete code, verbatim, no elisions — NEW v2 (replaces L2265-2393 whole; E1 POI-first incl anchor + E2 census anchor admission, print-only; ASCII-only verified; braces balanced 27/27):
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

Zone rows, raw (machine-pulled byte-verbatim, same archive — entry zones at/near the five bars):
[SRJ-EA] S3INPLAY bar=2026.08.28 10:00 dir=SHORT inPlay=0 via=none zoneLo=1.16492 zoneHi=1.16507 barLo=1.16462 barHi=1.16486 close=1.16467 sw1=1.16491@1 sw2=-@-1
[SRJ-EA] S3INPLAY bar=2026.09.04 15:45 dir=LONG inPlay=1 via=BAR zoneLo=1.15907 zoneHi=1.15933 barLo=1.15902 barHi=1.16016 close=1.16006 sw1=1.15847@3 sw2=-@-1
[SRJ-EA] S3INPLAY bar=2026.09.07 09:00 dir=LONG inPlay=1 via=BAR zoneLo=1.16098 zoneHi=1.16109 barLo=1.16103 barHi=1.16143 close=1.16116 sw1=1.16098@4 sw2=1.16088@8
[SRJ-EA] S3INPLAY bar=2026.09.07 15:50 dir=LONG inPlay=1 via=BAR zoneLo=1.16229 zoneHi=1.16253 barLo=1.16247 barHi=1.16282 close=1.16252 sw1=1.16209@7 sw2=-@-1
[SRJ-EA] S3INPLAY bar=2026.09.08 10:05 dir=SHORT inPlay=1 via=SWINGLEG zoneLo=1.16362 zoneHi=1.16377 barLo=1.16206 barHi=1.16232 close=1.16207 sw1=1.16251@3 sw2=-@-1

Zone containment (measured, not asserted — predicted winner vs zone edge): 8/28 SHORT tp 1.16322 (Yearly-VWAP 144 below 1.16466) vs zone [1.16492, 1.16507] same-bar → 170pts below zoneLo, OUTSIDE. 9/4 LONG tp 1.16315 (entry+297) vs zone [1.15907, 1.15933] adjacent-bar (15:45 vs latch 15:55, same setup: latch entry 1.16018 vs row close 1.16006) → 282pts above zoneHi, OUTSIDE. 9/7am LONG tp 1.16315 (entry+180) vs zone [1.16098, 1.16109] adjacent-bar (09:00 vs latch 09:15, latch SL 1.16098 equals row sw1) → 206pts above zoneHi, OUTSIDE. 9/7pm LONG tp 1.16315 (entry+54) vs zone [1.16229, 1.16253] adjacent-bar (15:50 vs latch 16:40, latch entry 1.16261 sits 8pts above zoneHi — same setup neighborhood) → 62pts above zoneHi, OUTSIDE. 9/8 SHORT tp 1.16070 (135 below 1.16205) vs zone [1.16362, 1.16377] same-bar → 292pts below zoneLo, OUTSIDE. Zone widths are 11-26pts; margins are 62-292pts, so adjacent-bar staleness cannot flip any containment. Stated honestly: zones for three bars ride from the nearest printed bar, not the latch bar itself — and the winners remain PREDICTED until the run measures them (gate G3 confirms; any mismatch = REPORT+HALT).

Prior round quoted complete and ruled (filed at `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md` marker LUNA-V147-FILED-001 — v147 fresh relay — mechanism catch ACCEPTED and credited; presentation corrected above; containment evidence answers the eligibility half):
No — discrepancy.

The packet as drafted is internally inconsistent on the page:

* **L278–L285** show the four previously failing setups still producing `TP_RR_FAIL_LATCH` and census winners that are **session lines** (`YPML`, `YPMH`, `YNYH`, `YLOL`).
* **L286** likewise shows the 9/8 census winner as `YLOL`, not `Monthly-VWAP`.
* **L289** then states that, **under NEW code**, the five winners are the named POI-family lines and that all five **FIRE**. Those conclusions are not established by the preceding run rows.
* The code at **L173–L183** explicitly retains `TpTargetUpdateBest`'s in-zone guard during the POI-first pass, while the census at **L248–L258** only tests direction and therefore is not a complete reproduction of POI eligibility. Thus the admitted-distance lists alone cannot prove the L289 winners.

So I would **not issue P-TP-FAMILYPASS v2 exactly as drafted**.



The v147 second answer (filed at `06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md` marker SONNET-V147-FILED-001) says yes, issue as drafted, with E1+E2+structure+subsumption verified and all five R figures re-verified POI-only (3.43 / 1.74 / 4.86 / 2.35 / 2.55) — stands on code+arithmetic; the zone half it did not cover is carried above instead of relitigated.

Predicted winners under NEW code (PREDICTIONS — the run proves them): 8/28 SHORT → Yearly-VWAP 144pts R 3.43 FIRES; 9/4 LONG → Yearly-VWAP 297pts R 1.74 FIRES; 9/7am LONG → Yearly-VWAP 180pts R 4.86 FIRES; 9/7pm LONG → Yearly-VWAP 54pts R 2.35 FIRES; 9/8 SHORT → Monthly-VWAP 135pts R 2.55 still FIRES with moved TP (declared, not a failure). Exit scan `MtNearestTpTarget` untouched (management stays nearest-valid per his revision rule); `TpTargetUpdateBest` + `TpSessionLevelFiltered` untouched; entry call sites inherit.

Gates inline (no prior text needed): compile "Result: 0 errors, 0 warnings"; run window 08-26→09-09 (3168 bars) "Test passed"; WS161 loads=stores mismatch=0; MUST-FIRE the five predictions above (a predicted winner that does not materialize = REPORT+HALT, revert nothing); MUST-SILENT every day he declined (8/26, 8/27, 8/31, 9/1, 9/2, 9/3, 9/9 + his-invalid rows); any fire outside the five reports row-complete for HIS adjudication (not auto-failed); a fire on a day he marked invalid is BLOCKED per his C5 ruling; post-run digests recorded, FlowLogic untouched.

Question (one, specific): issue packet P-TP-FAMILYPASS v2 exactly as drafted (E1 POI-first per the NEW code above; E2 print-only census anchor admission; S1 pre-hash gate `E5B97B36`; gates above, winners as run-confirmed predictions) — yes means issue as drafted; any discrepancy, with line numbers?

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
