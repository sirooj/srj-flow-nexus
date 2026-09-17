# CODE REVIEW REQUEST — v142 — 2026-09-17 (TP-preference design; fired-then-killed regression; same text to EVERY model)

Change (one plain sentence): design the TP preference order that returns his three family-line trades while keeping yesterday's session lines valid targets and closest-line for everything else.

File / function / lines: `Experts\SRJ_FlowNexus_EA.mq5` TP selector, carried whole below verbatim with zero elisions — TpTargetUpdateBest L2217-2238, TpSessionLevelFiltered L2249-2263, ComputeNearestTpTarget L2265-2393 (byte-exact v140 fence `B11F53F9`, landed `E5B97B36`, committed, both remotes verified).
Source digest: SHA256 `E5B97B36` / 597425 B / 11127 lines. Pre-promotion run RECON1 (filed record) vs post-promotion run RECON45 (archive `70CE840F`).

Complete code, verbatim, no elisions:
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
bool TpSessionLevelFiltered(int sessIdx, double mask)
  {
   if(mask == EMPTY_VALUE) return false;
   int m = (int)MathRound(mask);
   int sweptBit = sessIdx;
   if(sessIdx >= 10 && sessIdx <= 17) sweptBit = sessIdx + 4;   // [S1-TP-PROMOTION-001] prev-day session swept bits 14..21 (no FlowLogic export sets them this stage -> admitted; future sweep detection wires here, never silently)
   if((m & (1 << sweptBit)) != 0) return true;              // EA-26: already swept
   int liveBit = -1;
   if(sessIdx == 2 || sessIdx == 3)      liveBit = 10;     // Asia
   else if(sessIdx == 4 || sessIdx == 5) liveBit = 11;     // London
   else if(sessIdx == 6 || sessIdx == 7) liveBit = 12;     // NY
   else if(sessIdx == 8 || sessIdx == 9) liveBit = 13;     // PM
   if(liveBit >= 0 && (m & (1 << liveBit)) != 0) return true; // EA-51: session live
   return false;
  }
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

Regression rows (his three trades fired pre-promotion, die post-promotion; OLD = filed record `06_HANDOFFS\BUILDER_RESULT_RECON1.md` L50-57 machine-spliced under builder markers, never re-typed; NEW = RECON45 rows machine-pulled byte-verbatim):
> - #281 9/7 LDN TF LONG W AVP cvd=3 (+2.03) vs EA SIGNAL 2026.09.07 09:20:00 LONG Weekly-POC
>   LONDON R=1.76 SL 1.16098 TP 1.16200 (MTSNAP bar=09:15 entry=1.16135 regime=1; MTEXIT 10:05
>   reason=TP_TOUCH exit=1.16133 — see §5 obs-3). DAY ✓ SESSION ✓ DIR ✓ POI FAMILY ✓ CVD ✓.
>   VERDICT: MATCH. Entry-time delta NOT measurable (the journal carries no entry timestamps —
>   batched Q5).
> - #283 9/7 NY TF LONG W AVP cvd=3 (+1.06) vs EA SIGNAL 2026.09.07 16:40:15 LONG Weekly-POC NYAM
>   R=2.12 SL 1.16218 TP 1.16315 (MTSNAP bar=16:35 entry=1.16249; MTEXIT 17:10 reason=TP_TOUCH
>   exit=1.16315). DAY ✓ SESSION ✓ DIR ✓ POI FAMILY ✓ CVD ✓. VERDICT: MATCH.
[SRJ-EA] SIDE1X_STOPREF bar=2026.08.28 10:00 dir=SHORT entry=1.16466 liveStop=1.16508 ruleStop=1.16508 ruleSlot=42 ruleImb=0 liveTp=1.16459 liveR=0.17 livePass=0
[SRJ-EA] TP_ELECT shadow=true entry=1.16466 sl=1.16508 tp=1.16459 R=0.17 bar=2026.08.28 10:00 latchBar=2026.08.28 10:05
[SRJ-EA] TP_RR_FAIL_LATCH bar=2026.08.28 10:00 dir=SHORT entry=1.16466 sl=1.16508 tp=1.16459 R=0.17
[SRJ-EA] TPCENSUS #95 bar=2026.08.28 10:00 dir=SHORT close=1.16466 winner=YPML best=1.16459 distPts=7 empties=0 admitted= PDL:102 ASL:11 LOL:37 NYL:102 PML:7 YASL:11 YNYL:102 YPML:7 Monthly-POC:1042 Monthly-VWAP:602 Quarterly-POC:2132 Quarterly-VWAP:1588 Yearly-POC:1067 Yearly-VWAP:144 FOMC-POC:1098 FOMC-VWAP:793 
[SRJ-EA] TP_ELECT shadow=true entry=1.16135 sl=1.16098 tp=1.16158 R=0.62 bar=2026.09.07 09:15 latchBar=2026.09.07 09:20
[SRJ-EA] TP_RR_FAIL_LATCH bar=2026.09.07 09:15 dir=LONG entry=1.16135 sl=1.16098 tp=1.16158 R=0.62
[SRJ-EA] TPCENSUS #348 bar=2026.09.07 09:15 dir=LONG close=1.16135 winner=YPMH best=1.16158 distPts=23 empties=0 admitted= PDH:196 ASH:65 LOH:8 NYH:135 PMH:23 YASH:65 YLOH:167 YLOL:53 YNYH:135 YPMH:23 Yearly-VWAP:180 
[SRJ-EA] TP_ELECT shadow=true entry=1.16261 sl=1.16238 tp=1.16270 R=0.39 bar=2026.09.07 16:40 latchBar=2026.09.07 16:45
[SRJ-EA] TP_RR_FAIL_LATCH bar=2026.09.07 16:40 dir=LONG entry=1.16261 sl=1.16238 tp=1.16270 R=0.39
[SRJ-EA] TPCENSUS #376 bar=2026.09.07 16:40 dir=LONG close=1.16261 winner=YNYH best=1.16270 distPts=9 empties=0 admitted= PDH:70 LOH:97 NYH:21 YLOH:97 YNYH:9 Yearly-VWAP:54 
[SRJ-EA] SUPPRESSED bar=2026.09.04 15:45 poi=Yearly-POC dir=LONG opp=0 higher=0 heldPoi=Yearly-POC heldDir=LONG heldState=S3_ZONE_WAIT cum_n=110 cum_opp=36 cum_hi=5 cum_both=4 action=SUPERSEDED
[SRJ-EA] TP_RR_FAIL_LATCH bar=2026.09.04 15:55 dir=LONG entry=1.16018 sl=1.15847 tp=1.16188 R=0.99

Read: pre-promotion the same three setups fired with farther family TPs (8/28 never fired even then — MISS §3.3 — but his TP was the daily POC 1.16380, not a micro line; 9/7am fired TP 1.16200 R 1.76 matched to his +2.03; 9/7pm fired TP 1.16315 R 2.12 matched to his +1.06). Post-promotion the cleared walk added previous-day session lines and the nearest micro line now wins each race (YPML 7pts, YPMH 23pts, YNYH 9pts), killing all three below the kept 1R gate. His YES keeps micro lines valid, so exclusion is off the table. The surviving question is preference order only.

Question (one, specific): what TP preference order, with line numbers in the carried code, returns his three family-TP setups (8/28 SHORT TP Daily-POC 1.16380; 9/7am LONG TP 1.16200; 9/7pm LONG TP 1.16315) while keeping yesterday's lines valid, closest-line otherwise, and the 9/4 one-point edge untouched — any discrepancy, with line numbers?

Answer form: plain design + line numbers, or discrepancy with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
