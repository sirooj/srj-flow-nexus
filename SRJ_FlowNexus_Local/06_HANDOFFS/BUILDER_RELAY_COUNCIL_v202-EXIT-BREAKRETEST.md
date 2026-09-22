CODE REVIEW REQUEST - v202 - 2026-09-20 (EXIT BREAK-RETEST: gate TP-touch exits vs break-only under his rule; no build, run, or spend here)

Project brief (standing - read first):
- Money: probe/print-only question. Alert-only EA. No live trades. No funded money moves on any verdict here. Any code change from the ruling needs its own packet plus token plus his run word plus a run. Nothing here builds, runs, or spends by itself.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: exit thread - v118 relay (A91BDB48724ABDA00BEC93B27B1C24247CC569027C5B982B0964D0DCF7B77633/6859 B/74 lines; mechanism proof stands) plus P-EXITMODEL executed 161-O (result filed, T161O passed) plus his break-retest rule 2026-09-20 (E4A85FD474681C164BC3FC108C9864BBB29D16FDD72C7025D65833FBC49DDD9B/2333 B/28 lines) which amends the touch disposition. EXT1LIVE v201 round closed separately (RECON50 passed, takes 4/4).
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.

Change (one plain sentence): rule whether the exit engine keeps nearest-recompute touch exits (the E-b block at L11097-L11102 with the assignment at L11195) or gates them to booked-TP touch plus body-break only under his rules (normal take-profit exits on touch of session liquidity, POC, or VWAP targets; touch and retest of other lines do nothing once entered; only a body-close break flipping bias exits early).

Money (standing): behavior question only. Alert-only EA. No live trades. Build and run only on a fresh packet plus token plus his run word. No commit without token.
Session: NEW council session for transport (stated outright per standing session-statement rule). This page is fully self-contained - rule, code regions, and rows ride inline - so it is valid on a fresh session and depends on no seat memory of v118 or v201. v118 rides by reference (labeled below); its touch-disposition asks are answered by his rules, never re-asked. Prior texts ride labeled with file plus marker plus digest, never as anyone's words.
File / function / lines: Experts\SRJ_FlowNexus_EA.mq5, EvaluateManagedTrade, L11085-L11214 (verdicts-first plus SL plus TP-touch plus body-close loop plus HTF plus EXITVERDICT plus priority assignment plus MTEXIT/EXIT emit, one contiguous region, zero elisions) plus MtNearestTpTarget, L10911-L10948 (take-profit candidate set: 18 session buffers plus authority-filtered POI lines, second contiguous region, zero elisions). Source digest (measured this turn, tree uncommitted, exit engine carried from 161-O): A897790523AE06A47F89D8E8301E317529D97661447CE23D57551D065E3BAED9 / 614371 B / 11235 lines.
Seat packaging: identical text to Luna plus Astra; keys volunteered only; either seat halts on a checkable discrepancy with line numbers.

RULE (quoted whole from 06_HANDOFFS\BUILDER_FINDING_EXIT-BREAK-RETEST.md, E4A85FD4):
> "This is the rule of break and retest. gap of the POC or AVP lines that break the price of candlestick by body candle close break is flipping the POC bias direction, hence the exit at 11:35. Touch or retest does nothing once entered."

EA EVIDENCE (whole contiguous region EA L11085-L11214, pulled from disk this turn, byte-exact):
   //--- ALL verdicts computed first (instrumentation-first)
   bool   vSL = false, vTP = false, vBREAK = false, vHTF = false;
   double curTp = 0.0;
   bool   haveTp = MtNearestTpTarget(barShift, g_mtrade.dir, nextOpenPx, curTp);
   double breakLineVal = 0.0;
   string breakLineName = "";

   //--- (d) SL: price trades through the latched stop (wick or body; the standard
   //--- stop semantics; the EXITMODEL-1 Q5 recommendation, unobjected)
   if(g_mtrade.dir == DIR_LONG  && l <= g_mtrade.slRef) vSL = true;
   if(g_mtrade.dir == DIR_SHORT && h >= g_mtrade.slRef) vSL = true;

   //--- (b) TP: the CURRENT nearest valid target (Q6), exit on TOUCH (5.1/2.2)
   if(haveTp)
     {
      if(g_mtrade.dir == DIR_LONG  && h >= curTp) vTP = true;
      if(g_mtrade.dir == DIR_SHORT && l <= curTp) vTP = true;
     }

   //--- (c) the body-close exit: PRICE's BODY close through a BEHIND trigger line
   //--- (body = open -> next open, the T161K convention; "it must be body" - Q5).
   //--- A line's own gap/move alone never exits (Q3; section 1.3). Side is per bar
   //--- (section 5.2): a trigger line whose CURRENT value sits ahead of the trade
   //--- is a touch-target, not a body-close trigger. The census logs ALL twelve
   //--- lines per bar so every MT_EXIT_SCOPE variant is measurable from one run.
   for(int k = 0; k < POI_NLINES; k++)
     {
       double L;
       if(!ReadBuf1(g_hPoi, k, L, barShift)) continue;
       if(L == EMPTY_VALUE || L <= 0.0) continue;
       //--- [P-SLDEF-1 E14] same N1 body counter at the exit site. Grounding:
       //--- break needs bodyLo < L-EPS (LONG) / bodyHi > L+EPS (SHORT), both
       //--- strict: exact equality never breaks.
       if(bodyLo == L || bodyHi == L) g_n1_poiEqBody++;
       bool behind = (g_mtrade.dir == DIR_LONG)  ? (L < nextOpenPx)
                                                 : (L > nextOpenPx);
      bool through = false;
      if(behind)
        {
         if(g_mtrade.dir == DIR_LONG)  through = (bodyLo < L - EPS);
         else                          through = (bodyHi > L + EPS);
        }
       bool isTrigger = MtIsBreakTrigger(k);
       //--- [P-SLDEF-1b E19] exit-site pairing: the line verdict is known here.
       //--- Strictness says equality never sets `through`, so every paired
       //--- instance is expected ok (survived); a BREAK coincidence reports inv.
       if(bodyLo == L || bodyHi == L)
         { if(isTrigger && behind && through) g_n1_exitBodyInv++; else g_n1_exitBodySurv++; }
       if(InpDebugLog)
         PrintFormat("[SRJ-EA] EXITCENSUS bar=%s dir=%s line=%s val=%s side=%s "
                     "trigger=%d bodyLo=%s bodyHi=%s verdict=%s",
                     TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                     DirName(g_mtrade.dir),
                     g_lineCode[k], DoubleToString(L, _Digits),
                     (behind ? "behind" : "ahead"),
                     (int)isTrigger,
                     DoubleToString(bodyLo, _Digits),
                     DoubleToString(bodyHi, _Digits),
                     (isTrigger && behind && through) ? "BREAK" : "ok");
      if(isTrigger && behind && through && !vBREAK)
        {
         vBREAK = true;
         breakLineVal  = L;
         breakLineName = g_lineCode[k];
        }
     }

   //--- (e) section 5.6: the HTF aggregate flip exits TREND-following trades
   double mtlH = 0.0, mtlM = 0.0, mtlL = 0.0; // [P-HTFLOG] the HTF leg values (diagnostic)
   int    mtlWant = 0, mtlAnti = -1;          // [P-HTFLOG] anti=-1 => the leg block did not run
   if(MT_HTF_EXIT && !vSL && !vTP && !vBREAK)
     {
      if(g_mtrade.regimeAtAdmission == REGIME_TREND ||
         g_mtrade.regimeAtAdmission == REGIME_BOTH)
        {
         if(ReadFlow(FL_BUF_HTF_HIGH, mtlH, barShift) &&
            ReadFlow(FL_BUF_HTF_MID,  mtlM, barShift) &&
            ReadFlow(FL_BUF_HTF_LOW,  mtlL, barShift))
           {
            mtlWant = (g_mtrade.dir == DIR_LONG) ? 1 : -1;
            int anti = 0;
            if((int)MathRound(mtlH) == -mtlWant) anti++;
            if((int)MathRound(mtlM) == -mtlWant) anti++;
            if((int)MathRound(mtlL) == -mtlWant) anti++;
             mtlAnti = anti;
             vHTF = (anti >= 2);   // the majority flipped AGAINST the trade
             if(vHTF && InpDebugLog) MtFlipEmit(barShift, barTime, mtlAnti, mtlWant);
           }
        }
     }

   if(InpDebugLog)
      PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s vSL=%d "
                  "vTP=%d vBREAK=%s vHTF=%d scope=%d "
                  "htfH=%g htfM=%g htfL=%g want=%d anti=%d",
                  TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                  DirName(g_mtrade.dir),
                  DoubleToString(g_mtrade.entryPrice, _Digits),
                  (haveTp ? DoubleToString(curTp, _Digits) : "none"),
                  (int)vSL, (int)vTP,
                  (vBREAK ? breakLineName : "none"),
                  (int)vHTF, (int)MT_EXIT_SCOPE,
                  mtlH, mtlM, mtlL, mtlWant, mtlAnti);

   if(!(vSL || vTP || vBREAK || vHTF)) return;

   //--- close the trade (the priority order stated in the header)
   g_mtrade.state       = MT_CLOSED;
   g_mtrade.exitBarTime = barTime;
   if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
   else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = curTp; }
   else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
   else            { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }

    PrintFormat("[SRJ-EA] MTEXIT bar=%s reason=%s line=%s lineVal=%s entry=%s exit=%s",
                TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                MtExitName(g_mtrade.exitReason),
                (vBREAK ? breakLineName : "-"),
                (vBREAK ? DoubleToString(breakLineVal, _Digits) : "-"),
                DoubleToString(g_mtrade.entryPrice, _Digits),
                DoubleToString(g_mtrade.exitPrice, _Digits));
    if(InpDebugLog) MtLifeEmit();
   EmitAlert("EXIT",
             StringFormat("%s%s at %s (entry %s)",
                          MtExitName(g_mtrade.exitReason),
                          (vBREAK ? " [" + breakLineName + "]" : ""),
                          DoubleToString(g_mtrade.exitPrice, _Digits),
                          DoubleToString(g_mtrade.entryPrice, _Digits)),
             true);
  }

CANDIDATE SET (whole contiguous region EA L10911-L10948, pulled from disk this turn, byte-exact):
bool MtNearestTpTarget(const int barShift, const ENUM_SRJ_DIR dir,
                       const double currentPrice, double &tpTargetOut)
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
   double s39_mask;
   if(!ReadFlow(FL_BUF_SWEPT_MASK, s39_mask, barShift)) s39_mask = EMPTY_VALUE;
   for(int i = 0; i < ArraySize(sessbufs); i++)
     {
      double v;
      if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))
         TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
     }
   int anchorRank = (g_mtrade.anchorLine >= 0)
                    ? g_authorityRank[g_mtrade.anchorLine] : INT_MAX;
   for(int k = 0; k < POI_NLINES; k++)
     {
      if(k == g_mtrade.anchorLine || (g_authorityRank[k] / 2) > (anchorRank / 2))
         continue;
      double v;
      if(!ReadBuf1(g_hPoi, k, v, barShift)) continue;
      TpTargetUpdateBest(v, dir, currentPrice, best, haveBest);
     }
   if(!haveBest) return false;
   tpTargetOut = best;
   return true;
  }

10:45 CENSUS (all twelve POI lines, RECON50 segment 43AB634D, pulled this turn): no POI line sits at the touched 1.16459 (nearest-ahead POI is Monthly-VWAP 1.15865); the touched target is a session-level recompute value per the candidate set above; his booked TP was 1.16322 (MTLIFE row below).
IM	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITCENSUS bar=2026.08.28 10:45 dir=SHORT line=Daily-POC val=1.16532 side=behind trigger=1 bodyLo=1.16445 bodyHi=1.16469 verdict=ok
OI	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITCENSUS bar=2026.08.28 10:45 dir=SHORT line=Daily-VWAP val=1.16482 side=behind trigger=1 bodyLo=1.16445 bodyHi=1.16469 verdict=ok
KR	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITCENSUS bar=2026.08.28 10:45 dir=SHORT line=Weekly-POC val=1.16523 side=behind trigger=1 bodyLo=1.16445 bodyHi=1.16469 verdict=ok
DF	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITCENSUS bar=2026.08.28 10:45 dir=SHORT line=Weekly-VWAP val=1.16547 side=behind trigger=0 bodyLo=1.16445 bodyHi=1.16469 verdict=ok
ER	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITCENSUS bar=2026.08.28 10:45 dir=SHORT line=Monthly-POC val=1.15424 side=ahead trigger=1 bodyLo=1.16445 bodyHi=1.16469 verdict=ok
GF	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITCENSUS bar=2026.08.28 10:45 dir=SHORT line=Monthly-VWAP val=1.15865 side=ahead trigger=0 bodyLo=1.16445 bodyHi=1.16469 verdict=ok
FR	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITCENSUS bar=2026.08.28 10:45 dir=SHORT line=Quarterly-POC val=1.14334 side=ahead trigger=1 bodyLo=1.16445 bodyHi=1.16469 verdict=ok
KF	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITCENSUS bar=2026.08.28 10:45 dir=SHORT line=Quarterly-VWAP val=1.14880 side=ahead trigger=0 bodyLo=1.16445 bodyHi=1.16469 verdict=ok
KM	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITCENSUS bar=2026.08.28 10:45 dir=SHORT line=Yearly-POC val=1.15399 side=ahead trigger=1 bodyLo=1.16445 bodyHi=1.16469 verdict=ok
EI	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITCENSUS bar=2026.08.28 10:45 dir=SHORT line=Yearly-VWAP val=1.16322 side=ahead trigger=0 bodyLo=1.16445 bodyHi=1.16469 verdict=ok
PN	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITCENSUS bar=2026.08.28 10:45 dir=SHORT line=FOMC-POC val=1.15368 side=ahead trigger=1 bodyLo=1.16445 bodyHi=1.16469 verdict=ok
CM	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITCENSUS bar=2026.08.28 10:45 dir=SHORT line=FOMC-VWAP val=1.15674 side=ahead trigger=0 bodyLo=1.16445 bodyHi=1.16469 verdict=ok

T1 ROWS (morning Aug-28 London short T1, RECON50 segment 43AB634D579D92DF79A0E84F4054D68E20E351F786AFBECD97F58D9A374BA521, pulled this turn):
EF	0	21:22:10.152	Core 04	2026.08.28 10:10:00   [SRJ-EA] EXITVERDICT bar=2026.08.28 10:05 dir=SHORT entry=1.16466 curTp=1.16364 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=-1 htfM=-1 htfL=1 want=-1 anti=1
FL	0	21:22:16.255	Core 04	2026.08.28 10:15:00   [SRJ-EA] EXITVERDICT bar=2026.08.28 10:10 dir=SHORT entry=1.16466 curTp=1.16364 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=-1 htfM=-1 htfL=-1 want=-1 anti=0
CI	0	21:22:16.255	Core 04	2026.08.28 10:20:00   [SRJ-EA] EXITVERDICT bar=2026.08.28 10:15 dir=SHORT entry=1.16466 curTp=1.16364 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=-1 htfM=-1 htfL=-1 want=-1 anti=0
KP	0	21:22:16.255	Core 04	2026.08.28 10:25:03   [SRJ-EA] EXITVERDICT bar=2026.08.28 10:20 dir=SHORT entry=1.16466 curTp=1.16364 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=-1 htfM=-1 htfL=-1 want=-1 anti=0
GJ	0	21:22:16.255	Core 04	2026.08.28 10:30:00   [SRJ-EA] EXITVERDICT bar=2026.08.28 10:25 dir=SHORT entry=1.16466 curTp=1.16364 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=-1 htfM=-1 htfL=-1 want=-1 anti=0
KO	0	21:22:16.255	Core 04	2026.08.28 10:35:01   [SRJ-EA] EXITVERDICT bar=2026.08.28 10:30 dir=SHORT entry=1.16466 curTp=1.16364 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=-1 htfM=-1 htfL=-1 want=-1 anti=0
KH	0	21:22:16.255	Core 04	2026.08.28 10:40:00   [SRJ-EA] EXITVERDICT bar=2026.08.28 10:35 dir=SHORT entry=1.16466 curTp=1.16364 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=-1 htfM=-1 htfL=-1 want=-1 anti=0
HG	0	21:22:16.255	Core 04	2026.08.28 10:45:00   [SRJ-EA] EXITVERDICT bar=2026.08.28 10:40 dir=SHORT entry=1.16466 curTp=1.16364 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=-1 htfM=-1 htfL=1 want=-1 anti=1
QE	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] EXITVERDICT bar=2026.08.28 10:45 dir=SHORT entry=1.16466 curTp=1.16459 vSL=0 vTP=1 vBREAK=none vHTF=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1
JH	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] MTEXIT bar=2026.08.28 10:45 reason=TP_TOUCH line=- lineVal=- entry=1.16466 exit=1.16459
DF	0	21:22:16.255	Core 04	2026.08.28 10:50:08   [SRJ-EA] MTLIFE fields=11 openBar=2026.08.28 10:05 dir=SHORT entry=1.16466 sl=1.16508 tp=1.16322 verdict=TP_TOUCH closeBar=2026.08.28 10:45 closePx=1.16459 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
His 8/28 exit (recorded 2026-09-11 in 06_HANDOFFS\BUILDER_FINDING_0828-FVG.md): entry 1.16466, early exit 1.16464 at the 11:35 open under the EXIT-POCVWAP standard; the 10:45 touch exit above is early by his break-retest rule.

Question (one, specific): under his quoted rules, should the engine keep nearest-recompute touch exits (E-b at L11097-L11102 with the assignment at L11195 as coded), gate E-b to booked-TP touch only (tpRef, with non-booked touches ignored and body-break early exits kept), or halt - with line numbers. (His normal-TP touch rule stays: touch of session liquidity, POC, or VWAP targets exits. His booked TP on the morning trade was 1.16322; the 10:45 touch of the recomputed 1.16459 session-level target was never his booked target.)
Analytic ask A (standing): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.
Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.
Answer form: plain accept (keep touch) / amend-with-delta (gate, with line numbers) / halt, with line numbers, plus analytic answers.
Verification split: rule on the page only - genuineness vs disk is proven on disk (digests plus counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
