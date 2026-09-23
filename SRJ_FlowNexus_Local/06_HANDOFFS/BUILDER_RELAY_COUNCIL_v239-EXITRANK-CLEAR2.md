# RELAY v239 EXITRANK CLEAR2 (packet P-EXITRANK-2 v2 DRAFT; V239 amend-fold: census-location + enumerated classes + firing-bar rows; battery owed pre-transport; NO transport ask this turn)

Project brief (standing - read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer - declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: packet P-EXITRANK-2 v2 (this file's subject, V239 amend-fold over P-EXITRANK-1 v1); prior rounds P-VNEXT-1 v3 (built tree 3F4D617B, RECON55 graded takes 5) and P-SEEDFIX-1 v3 on disk; V239 verdicts (4 seats, mechanism confirmed, wording discrepancies folded) on disk; every version folds the prior round's verdicts. Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.
- Session: CONTINUE previous council session (same thread and seats; V239 verdicts on relay v238 ruled and folded into packet v2 plus this relay; no new scope, no new seats).

Change (one plain sentence): the body-break exit fires only when the broken line outranks the entry anchor (same-line crosses never exit), replacing the mean-reversion-only fork.

His words (operator-carried 2026-09-23, verbatim - the ruled distinction): the 9/4 trade POI entry originate from the same Y POC, so when the same Y POC crossed it over it does not matter. while the 28 originates from the D VWAP which i have explained and stated on the nuance of the VWAP hierarchy is lower than the POC/AVP.

File / function / lines: Experts\SRJ_FlowNexus_EA.mq5 / EvaluateManagedTrade / L11151-L11303 (153 lines, verbatim, zero elisions - verdicts through function close, so the unchanged SL/TP/HTF/DAY chain rides inline).
Source digest: 3F4D617BB8FD66CA6C74B79C62312732750D58FD08B2A250F5FFF2BDC468664F / 622604 B / 11324 lines (EA pre-build tree; packet expects post-build 11322 = 11324 - 2 deleted, +0 new, +2 modified).

Complete code, verbatim, no elisions:
   //--- ALL verdicts computed first (instrumentation-first)
bool   vSL = false, vTP = false, vBREAK = false, vHTF = false, vDAY = false;
   double curTp = 0.0;
   bool   haveTp = MtNearestTpTarget(barShift, g_mtrade.dir, nextOpenPx, curTp);
   double breakLineVal = 0.0;
   string breakLineName = "";
   //--- [P-VNEXT-1 E3] B-fork decl (his ruling 2026-09-22): mean-reversion flag for the break gate below.
   bool isMeanRev = (g_mtrade.regimeAtAdmission == REGIME_MEANREV);

   //--- (d) SL: price trades through the latched stop (wick or body; the standard
   //--- stop semantics; the EXITMODEL-1 Q5 recommendation, unobjected)
   if(g_mtrade.dir == DIR_LONG  && l <= g_mtrade.slRef) vSL = true;
   if(g_mtrade.dir == DIR_SHORT && h >= g_mtrade.slRef) vSL = true;

    //--- (b) TP: the BOOKED target (tpRef) only, exit on TOUCH. Break-retest
    //--- rule 2026-09-20 (E4A85FD4): touch/retest of non-booked lines does
    //--- nothing once entered; only body-close break (E-c) exits early.
    bool tpBookedTouch = false;
    if(g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0)
      {
       if(g_mtrade.dir == DIR_LONG  && h >= g_mtrade.tpRef) tpBookedTouch = true;
       if(g_mtrade.dir == DIR_SHORT && l <= g_mtrade.tpRef) tpBookedTouch = true;
      }
    bool tpRecomputeTouch = false;
    if(haveTp)
      {
       if(g_mtrade.dir == DIR_LONG  && h >= curTp) tpRecomputeTouch = true;
       if(g_mtrade.dir == DIR_SHORT && l <= curTp) tpRecomputeTouch = true;
      }
    if(tpRecomputeTouch && !tpBookedTouch) g_n1_tpRecomputeSupp++;
    if(tpBookedTouch) vTP = true;

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
      //--- [P-VNEXT-1 E3] B-fork gate: DAY_CLOSE-minus-5 outranks body-break on mean-reversion; break suppressed here so vDAY decides (SL/TP above untouched).
      if(isTrigger && behind && through && !vBREAK && !isMeanRev)
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
//--- [P-EXITMODEL-2 F3] day-close-minus-5 exit (his universal rule 2026-09-21: the first bar at/after the first 16:55-ET mark at/after the fill exits every managed trade regardless of regime). Priority below SL, TP, BREAK (and HTF when re-enabled); price nextOpenPx; F3 mark is 16:55 ET (g_news_dayMarks), distinct from the 17:00 weekFlat census (g_news_friMarks); MTEXIT/MTLIFE carry DAY_CLOSE, graded by mark join.
if(!vSL && !vTP && !vBREAK && !vHTF && g_news_init)
  {
   for(int dc = 0; dc < g_news_dayN; dc++)
     {
      if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] && g_news_dayMarks[dc] <= barTime) { vDAY = true; break; }
     }
  }

    if(InpDebugLog)
      PrintFormat("[SRJ-EA] EXITVERDICT bar=%s dir=%s entry=%s curTp=%s vSL=%d "
                   "vTP=%d vBREAK=%s vHTF=%d scope=%d "
                   "htfH=%g htfM=%g htfL=%g want=%d anti=%d tpB=%s h=%s l=%s sup=%d",
                   TimeToString(barTime, TIME_DATE|TIME_MINUTES),
                   DirName(g_mtrade.dir),
                   DoubleToString(g_mtrade.entryPrice, _Digits),
                   (haveTp ? DoubleToString(curTp, _Digits) : "none"),
                   (int)vSL, (int)vTP,
                   (vBREAK ? breakLineName : "none"),
                   (int)vHTF, (int)MT_EXIT_SCOPE,
                   mtlH, mtlM, mtlL, mtlWant, mtlAnti, (g_mtrade.tpRef != EMPTY_VALUE && g_mtrade.tpRef > 0.0 ? DoubleToString(g_mtrade.tpRef, _Digits) : "none"), DoubleToString(h, _Digits), DoubleToString(l, _Digits), g_n1_tpRecomputeSupp);

if(!(vSL || vTP || vBREAK || vHTF || vDAY)) return;

   //--- close the trade (the priority order stated in the header)
   g_mtrade.state       = MT_CLOSED;
   g_mtrade.exitBarTime = barTime;
   if(vSL)         { g_mtrade.exitReason = MT_EXIT_SL;             g_mtrade.exitPrice = g_mtrade.slRef; }
    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
   else if(vBREAK) { g_mtrade.exitReason = MT_EXIT_POI_BODY_BREAK; g_mtrade.exitPrice = nextOpenPx; }
   else if(vHTF)   { g_mtrade.exitReason = MT_EXIT_HTF_FLIP;       g_mtrade.exitPrice = nextOpenPx; }
   else if(vDAY)   { g_mtrade.exitReason = MT_EXIT_DAY_CLOSE;  g_mtrade.exitPrice = nextOpenPx; }

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

Authority table, verbatim, no elisions (EA InitAuthorityTable L88-105; lower number = higher authority):
int    g_authorityRank[POI_NLINES];
string g_lineCode[POI_NLINES];

void InitAuthorityTable()
  {
   g_authorityRank[POI_BUF_F_POC]  = 0;   g_lineCode[POI_BUF_F_POC]  = "FOMC-POC";
   g_authorityRank[POI_BUF_F_VWAP] = 1;   g_lineCode[POI_BUF_F_VWAP] = "FOMC-VWAP";
   g_authorityRank[POI_BUF_Y_POC]  = 2;   g_lineCode[POI_BUF_Y_POC]  = "Yearly-POC";
   g_authorityRank[POI_BUF_Y_VWAP] = 3;   g_lineCode[POI_BUF_Y_VWAP] = "Yearly-VWAP";
   g_authorityRank[POI_BUF_Q_POC]  = 4;   g_lineCode[POI_BUF_Q_POC]  = "Quarterly-POC";
   g_authorityRank[POI_BUF_Q_VWAP] = 5;   g_lineCode[POI_BUF_Q_VWAP] = "Quarterly-VWAP";
   g_authorityRank[POI_BUF_M_POC]  = 6;   g_lineCode[POI_BUF_M_POC]  = "Monthly-POC";
   g_authorityRank[POI_BUF_M_VWAP] = 7;   g_lineCode[POI_BUF_M_VWAP] = "Monthly-VWAP";
   g_authorityRank[POI_BUF_W_POC]  = 8;   g_lineCode[POI_BUF_W_POC]  = "Weekly-POC";
   g_authorityRank[POI_BUF_W_VWAP] = 9;   g_lineCode[POI_BUF_W_VWAP] = "Weekly-VWAP";
   g_authorityRank[POI_BUF_D_POC]  = 10;  g_lineCode[POI_BUF_D_POC]  = "Daily-POC";
   g_authorityRank[POI_BUF_D_VWAP] = 11;  g_lineCode[POI_BUF_D_VWAP] = "Daily-VWAP";
  }

Packet proposal (exact old-to-new; STAGE-1 exact-diff gated at build):
- DELETE EA L11157-L11158 (the two E3 decl lines above; isMeanRev unused elsewhere).
- REPLACE EA L11223-L11224 with:
      //--- [P-EXITRANK-2] anchor-rank gate (his 2026-09-23 rule: same-line cross never exits; only HIGHER-authority breaks exit; lower number = higher authority; amends charter 9.1(2) same-line case, supersedes E3).
      if(isTrigger && behind && through && !vBREAK && g_mtrade.anchorLine >= 0 && g_mtrade.anchorLine < POI_NLINES && g_authorityRank[k] < g_authorityRank[g_mtrade.anchorLine])
- Authority table (unchanged, EA InitAuthorityTable L91-105): FOMC-POC 0, FOMC-VWAP 1, Yearly-POC 2, Yearly-VWAP 3, Quarterly-POC 4, Quarterly-VWAP 5, Monthly-POC 6, Monthly-VWAP 7, Weekly-POC 8, Weekly-VWAP 9, Daily-POC 10, Daily-VWAP 11.

Run rows, raw (three rank reads; segments RECON55 EA5BCC5C + RECON51; 17:00 = election 16:55, break bar 17:05):
OQ	0	04:55:06.518	Core 04	2026.09.04 16:00:00   [SRJ-EA] MTSNAP bar=2026.09.04 15:55 dir=LONG anchor=Yearly-POC entry=1.16018 sl=1.15847 tp=1.16302 regime=1
PH	0	04:55:12.621	Core 04	2026.09.04 16:15:01   [SRJ-EA] EXITCENSUS bar=2026.09.04 16:10 dir=LONG line=Yearly-POC val=1.15987 side=behind trigger=1 bodyLo=1.15980 bodyHi=1.16004 verdict=BREAK
FG	0	04:55:12.621	Core 04	2026.09.04 16:15:01   [SRJ-EA] MTEXIT bar=2026.09.04 16:10 reason=POI_BODY_BREAK line=Yearly-POC lineVal=1.15987 entry=1.16018 exit=1.16004
JP	0	15:55:36.715	Core 04	2026.08.28 10:05:00   [SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-VWAP | LONDON | R=3.43 SL 1.16508 TP 1.16322 spr=4
HJ	0	15:56:01.163	Core 04	2026.08.28 11:40:09   [SRJ-EA] EXITCENSUS bar=2026.08.28 11:35 dir=SHORT line=Daily-POC val=1.16451 side=ahead trigger=1 bodyLo=1.16454 bodyHi=1.16464 verdict=ok
FP	0	15:56:07.273	Core 04	2026.08.28 11:45:02   [SRJ-EA] MTEXIT bar=2026.08.28 11:40 reason=POI_BODY_BREAK line=Daily-POC lineVal=1.16451 entry=1.16466 exit=1.16439
LH	0	15:55:36.715	Core 04	2026.08.28 10:05:00   [SRJ-EA] MTSNAP bar=2026.08.28 10:00 dir=SHORT anchor=Daily-VWAP entry=1.16466 sl=1.16508 tp=1.16322 regime=1
HR	0	15:56:07.273	Core 04	2026.08.28 11:45:02   [SRJ-EA] EXITCENSUS bar=2026.08.28 11:40 dir=SHORT line=Daily-POC val=1.16451 side=behind trigger=1 bodyLo=1.16439 bodyHi=1.16454 verdict=BREAK
IS	0	15:56:07.273	Core 04	2026.08.28 11:45:02   [SRJ-EA] EXITVERDICT bar=2026.08.28 11:40 dir=SHORT entry=1.16466 curTp=1.16364 vSL=0 vTP=0 vBREAK=Daily-POC vHTF=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=1.16322 h=1.16454 l=1.16436 sup=6
FE	0	05:04:15.831	Core 04	2026.09.08 17:00:00   [SRJ-EA] MTSNAP bar=2026.09.08 16:55 dir=SHORT anchor=Monthly-POC entry=1.16220 sl=1.16274 tp=1.16114 regime=1
MM	0	05:04:21.934	Core 04	2026.09.08 17:10:00   [SRJ-EA] MTEXIT bar=2026.09.08 17:05 reason=POI_BODY_BREAK line=Monthly-POC lineVal=1.16229 entry=1.16220 exit=1.16214
QS	0	04:41:46.955	Core 04	2026.09.01 17:35:01   [SRJ-EA] ALERT SRJ SIGNAL LONG EURUSD M5 | Monthly-VWAP | NYAM | R=1.17 SL 1.15975 TP 1.16077 spr=2
QQ	0	04:41:46.955	Core 04	2026.09.01 17:35:01   [SRJ-EA] MTSNAP bar=2026.09.01 17:30 dir=LONG anchor=Monthly-VWAP entry=1.16022 sl=1.15975 tp=1.16077 regime=1
FK	0	04:41:53.059	Core 04	2026.09.01 17:50:00   [SRJ-EA] EXITCENSUS bar=2026.09.01 17:45 dir=LONG line=Yearly-POC val=1.15987 side=ahead trigger=1 bodyLo=1.15987 bodyHi=1.16002 verdict=ok
RG	0	04:41:53.059	Core 04	2026.09.01 17:50:00   [SRJ-EA] EXITVERDICT bar=2026.09.01 17:45 dir=LONG entry=1.16022 curTp=1.15987 vSL=0 vTP=0 vBREAK=none vHTF=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=1.16077 h=1.16018 l=1.15984 sup=1
PR	0	04:41:53.059	Core 04	2026.09.01 17:55:01   [SRJ-EA] MTEXIT bar=2026.09.01 17:50 reason=SL line=- lineVal=- entry=1.16022 exit=1.15975
MO	0	05:04:21.934	Core 04	2026.09.08 17:10:00   [SRJ-EA] EXITCENSUS bar=2026.09.08 17:05 dir=SHORT line=Monthly-POC val=1.16229 side=behind trigger=1 bodyLo=1.16214 bodyHi=1.16241 verdict=BREAK
KN	0	05:04:21.934	Core 04	2026.09.08 17:10:00   [SRJ-EA] EXITVERDICT bar=2026.09.08 17:05 dir=SHORT entry=1.16220 curTp=1.16114 vSL=0 vTP=0 vBREAK=Monthly-POC vHTF=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=1.16114 h=1.16250 l=1.16214 sup=3
Row sources: 15:xx wall-clock rows = RECON51 segment (proves the 8/28 exit shape); 04:xx/05:xx rows = RECON55 segment EA5BCC5C (proves anchors, breaks, holds, and the 9/1 touch-kept case). Timestamps above are wall-clock; bar= fields are tester bars.
Rank reads: 9/4 anchor Y-POC rank 2 vs break Y-POC rank 2 (equal - hold); 8/28 anchor D-VWAP rank 11 vs break D-POC rank 10 (higher - exit); 17:00 anchor M-POC rank 6 vs break M-POC rank 6 (equal - hold).

Question (one, specific): does the proposed rank comparison at the gate correctly implement same-line-hold plus higher-break-exit for the named instances (9/4 hold, 8/28 exit, 17:00 hold) with no other behavior change to SL/TP/HTF/DAY legs, census row shapes, or selection - the trade-verdict changes being exactly the enumerated classes (same-line holds, lower-authority holds, MEANREV-class rank-gating), with EXITCENSUS rows unchanged by design and flips living in EXITVERDICT vBREAK plus MTEXIT?

Answer form: plain yes / no / discrepancy, with line numbers.
Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers - freetext, no length limit.
Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.
Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys - nothing refused because nothing unanswerable is asked).
Settled standing: verification split, upload-dead, and seat roles ride by reference (filed record); repeat objections to the FORMAT itself are recorded once, not re-litigated each round. New technical objections are always welcome.
Verification split: rule on the page only - genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.

Close: builder self-check pre-transport (battery green this turn): code blocks re-read vs disk byte-diff 0 both regions (B1 153 lines, B2 18 lines); zero three-dot sequences (count 0 machine-verified); one question + answer form present; no role/ID/clearance asked; rows raw for every per-row claim (18 data rows). Transport signal ships this turn.

(End of file)