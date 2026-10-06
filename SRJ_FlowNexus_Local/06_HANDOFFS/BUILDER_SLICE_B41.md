# BUILDER SLICE B-41 - raw rows behind P, C1-C4 (line numbers; payloads only)
j25 = RECON62-B41_JOURNAL.log; j26 = JUNE-B41_JOURNAL.log. Diagnostic EA = 410EC99C (restored to 63B18C1F after). XPOI_NA = 0 (FlowLogic 235).

## P1 inputs HTF group (Indicators\SRJ_FlowLogic.mq5 lines 246-259)
246: input group "HTF Automation"
247: input ENUM_CHARTTF    inChartTradingTF   = CTF_5MIN;    
248: input int             inHtfLookbackBars  = 3000;        
249: input ENUM_TIMEFRAMES inHtf1_manual      = PERIOD_H4;   
250: input ENUM_TIMEFRAMES inHtf2_manual      = PERIOD_H1;   
251: input ENUM_TIMEFRAMES inHtf3_manual      = PERIOD_M15;  
252: input bool            inUseConfirmedHTFOnly = false;    
253: input int             inHtfMaxTrackedObjects = 60;      
254: input ENUM_XPOI       inHtfHighTarget    = XPOI_NA;     
255: input ENUM_XPOI       inHtfMidTarget     = XPOI_NA;     
256: input ENUM_XPOI       inHtfLowTarget     = XPOI_NA;     
257: input bool            inHtfDebugLog      = false;      
258: input string          inDebugFromTime    = "";  
259: input string          inDebugToTime      = "";  

## P2 InDebugWindow (Indicators\SRJ_FlowLogic.mq5 lines 653-667)
653: bool SRJ_InDebugWindow(const int bar)
654:   {
655:    if(!g_htfDebugLog)
656:       return(false);
657:    if(g_srjDebugFrom == 0 && g_srjDebugTo == 0)
658:       return(true);
659:    datetime t = SRJ_BarTime(bar);
660:    if(t == 0)
661:       return(false);
662:    if(g_srjDebugFrom != 0 && t < g_srjDebugFrom)
663:       return(false);
664:    if(g_srjDebugTo != 0 && t > g_srjDebugTo)
665:       return(false);
666:    return(true);
667:   }

## P3 ReadBuf1+offset (Experts\SRJ_FlowNexus_EA.mq5 lines 1986-2003)
1986: bool ReadBuf1(int handle, int bufIdx, double &outVal, int shift = 1)
1987:   {
1988:    double tmp[1];
1989:    if(CopyBuffer(handle, bufIdx, shift, 1, tmp) != 1) return false;
1990:    outVal = tmp[0];
1991:    return true;
1992:   }
1993: 
1994: //--- TASK 20: every FlowLogic export slot is written twice ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Â provisionally
1995: //--- on each tick of the forming bar, then once with settled state when that
1996: //--- bar closes. slot[X] therefore describes state after bar X+1. Reading
1997: //--- shift 1 lands in the provisional slot (measured 52% retraction rate).
1998: //--- Reading shift 2 lands in the settled slot, which describes the bar the
1999: //--- EA is evaluating, and which is never rewritten afterwards.
2000: //--- Every FlowLogic read on a logic path goes through this wrapper. The
2001: //--- bar under evaluation does not move; only the FlowLogic slot does.
2002: //--- POI Marker and CQD reads keep their own conventions and are unchanged.
2003: #define FLOW_SHIFT_OFFSET 1

## P3 UJPROBE reader (Experts\SRJ_FlowNexus_EA.mq5 lines 12325-12351)
12325: //--- single probe printer (pass bar-time join key; M15 row gated on M15-new-bar)
12326: void SrjUjProbeTuple(int barShift, datetime barTime)
12327:   {
12328:    string bk = TimeToString(barTime, TIME_DATE|TIME_MINUTES);
12329:    double h4 = EMPTY_VALUE, h1 = EMPTY_VALUE, m15 = EMPTY_VALUE, ltf = EMPTY_VALUE;
12330:    if(!ReadFlow(FL_BUF_HTF_HIGH, h4, barShift)) h4 = EMPTY_VALUE;
12331:    if(!ReadFlow(FL_BUF_HTF_MID, h1, barShift)) h1 = EMPTY_VALUE;
12332:    if(!ReadFlow(FL_BUF_HTF_LOW, m15, barShift)) m15 = EMPTY_VALUE;
12333:    if(!ReadFlow(FL_BUF_LTF_BIAS, ltf, barShift)) ltf = EMPTY_VALUE;
12334:    //--- probe-side DIV classifier: verbatim firing-walk bound, full domain
12335:    int maxWalk = Bars(_Symbol, PERIOD_CURRENT) - 1;
12336:    int readFail = 0, emptyV = 0, zeroV = 0, latestNZ = 0;
12337:    string kind = "-";
12338:    bool complete = true;
12339:    for(int s = barShift; s <= maxWalk; s++)
12340:      {
12341:       double verdict = EMPTY_VALUE;
12342:       if(!ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, verdict, s)) { readFail++; complete = false; continue; }
12343:       if(verdict == EMPTY_VALUE) { emptyV++; continue; }
12344:       int v = (int)MathRound(verdict);
12345:       if(v == 0) { zeroV++; continue; }
12346:       if(latestNZ == 0) { latestNZ = v; kind = ((MathAbs(v) == 1) ? "regular" : "hidden"); }
12347:      }
12348:    bool aligned = ((g_dir == DIR_LONG && (latestNZ == 1 || latestNZ == 2)) ||
12349:                    (g_dir == DIR_SHORT && (latestNZ == -1 || latestNZ == -2)));
12350:    string cls = (!complete ? "INCOMPLETE" : (latestNZ == 0 ? "ABSENT" : (aligned ? "ALIGNED" : "OPPOSING")));
12351:    PrintFormat("[SRJ-EA] UJPROBE bar_key=%s h4=%s h1=%s m15=%s confirmedFeed=1 ltf=%s div=%s kind=%s readFail=%d empty=%d zero=%d complete=%d latestNZ=%d covReq=%s covAch=%s dayCount=%d ticktime=%s lag=chartTime-1bar",

## C1 j25 filed rows
71385 A6FIRED class=SELECTED state=FIRED bar=2026.08.28 10:00 dir=SHORT tp=1.16364 r=2.43 sl=1.16508 mode=2SWING div=regular
71387 ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-VWAP | LONDON | R=2.43 SL 1.16508 TP 1.16364 spr=4
71401 ENTRY_TICKET bar=2026.08.28 10:00 ticket=2 deal=2 pid=2 ppid=2 magic=773001
71861 MTEXIT bar=2026.08.28 11:40 reason=POI_BODY_BREAK line=Daily-POC lineVal=1.16451 entry=1.16466 exit=1.16439
71869 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | POI_BODY_BREAK [Daily-POC] at 1.16439 (entry 1.16466)
90688 A6FIRED class=SELECTED state=FIRED bar=2026.09.01 17:30 dir=LONG tp=1.16077 r=1.17 sl=1.15975 mode=1SWING div=hidden
90690 ALERT SRJ SIGNAL LONG EURUSD M5 | Monthly-VWAP | NYAM | R=1.17 SL 1.15975 TP 1.16077 spr=2
90706 ENTRY_TICKET bar=2026.09.01 17:30 ticket=4 deal=4 pid=4 ppid=4 magic=773002
90808 MTEXIT bar=2026.09.01 17:50 reason=SL line=- lineVal=- entry=1.16022 exit=1.15975
90810 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | SL at 1.15975 (entry 1.16022)
108844 A6FIRED class=SELECTED state=FIRED bar=2026.09.04 15:55 dir=LONG tp=1.16302 r=1.66 sl=1.15847 mode=1SWING div=hidden
108846 ALERT SRJ SIGNAL LONG EURUSD M5 | Yearly-POC | NYAM | R=1.66 SL 1.15847 TP 1.16302 spr=1
108860 ENTRY_TICKET bar=2026.09.04 15:55 ticket=6 deal=6 pid=6 ppid=6 magic=773002
109685 UJRETARGET_BROKER bar=2026.09.04 19:00 ticket=6 oldTp=1.16302 newTp=1.16270 sl=1.15847 ok=1 rc=10009 action=SENT
110822 MTEXIT bar=2026.09.04 23:50 reason=DAY_CLOSE line=- lineVal=- entry=1.16018 exit=1.16129
110830 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | DAY_CLOSE at 1.16129 (entry 1.16018)
112292 A6FIRED class=SELECTED state=FIRED bar=2026.09.07 09:15 dir=LONG tp=1.16200 r=1.76 sl=1.16098 mode=1SWING div=hidden
112294 ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-POC | LONDON | R=1.76 SL 1.16098 TP 1.16200 spr=3
112308 ENTRY_TICKET bar=2026.09.07 09:15 ticket=8 deal=8 pid=8 ppid=8 magic=773001
112754 MTEXIT bar=2026.09.07 10:50 reason=TP_TOUCH line=- lineVal=- entry=1.16135 exit=1.16200
112756 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | TP_TOUCH at 1.16200 (entry 1.16135)
115627 A6FIRED class=SELECTED state=FIRED bar=2026.09.07 16:40 dir=LONG tp=1.16315 r=2.34 sl=1.16238 mode=1SWING div=hidden
115629 ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-POC | NYAM | R=2.34 SL 1.16238 TP 1.16315 spr=3
115643 ENTRY_TICKET bar=2026.09.07 16:40 ticket=10 deal=10 pid=10 ppid=10 magic=773002
115784 MTEXIT bar=2026.09.07 17:10 reason=TP_TOUCH line=- lineVal=- entry=1.16261 exit=1.16315
115786 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | TP_TOUCH at 1.16315 (entry 1.16261)
117980 A6FIRED class=SELECTED state=FIRED bar=2026.09.08 10:05 dir=SHORT tp=1.16102 r=1.94 sl=1.16258 mode=1SWING div=hidden
117982 ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | LONDON | R=1.94 SL 1.16258 TP 1.16102 spr=1
117998 ENTRY_TICKET bar=2026.09.08 10:05 ticket=12 deal=12 pid=12 ppid=12 magic=773001
118178 MTEXIT bar=2026.09.08 10:40 reason=TP_TOUCH line=- lineVal=- entry=1.16205 exit=1.16102
118180 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | TP_TOUCH at 1.16102 (entry 1.16205)
120577 A6FIRED class=SELECTED state=FIRED bar=2026.09.08 16:55 dir=SHORT tp=1.16114 r=1.96 sl=1.16274 mode=1SWING div=regular
120579 ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | NYAM | R=1.96 SL 1.16274 TP 1.16114 spr=3
120593 ENTRY_TICKET bar=2026.09.08 16:55 ticket=14 deal=14 pid=14 ppid=14 magic=773002
120785 MTEXIT bar=2026.09.08 17:30 reason=SL line=- lineVal=- entry=1.16220 exit=1.16274
120787 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | SL at 1.16274 (entry 1.16220)

## C2 j26 filed rows
60873 A6FIRED class=SELECTED state=FIRED bar=2026.06.03 09:05 dir=LONG tp=159.983 r=1.35 sl=159.889 mode=1SWING div=hidden
60875 ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-VWAP | LONDON | R=1.35 SL 159.889 TP 159.983 spr=3
60889 ENTRY_TICKET bar=2026.06.03 09:05 ticket=2 deal=2 pid=2 ppid=2 magic=773001
61014 MTEXIT bar=2026.06.03 09:55 reason=TP_TOUCH line=- lineVal=- entry=159.929 exit=159.983
61016 ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | TP_TOUCH at 159.983 (entry 159.929)
66710 A6FIRED class=SELECTED state=FIRED bar=2026.06.04 09:50 dir=SHORT tp=159.368 r=9.62 sl=159.920 mode=1SWING div=hidden
66712 ALERT SRJ SIGNAL SHORT USDJPY M5 | Daily-POC | LONDON | R=9.62 SL 159.920 TP 159.368 spr=5
66726 ENTRY_TICKET bar=2026.06.04 09:50 ticket=4 deal=4 pid=4 ppid=4 magic=773001
66879 MTEXIT bar=2026.06.04 10:40 reason=SL line=- lineVal=- entry=159.868 exit=159.920
66881 ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | SL at 159.920 (entry 159.868)

## C2 j26 16:50 EMPTY rows
119541 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=28 famRead=448 unavail=0 emptyValid=15 state=2 attempt=6 poolGen=6 cadence=no-rebuild
119542 UJPROBE bar_key=2026.06.05 16:40 h4=EMPTY h1=EMPTY m15=EMPTY confirmedFeed=1 ltf=EMPTY div=OPPOSING kind=regular readFail=0 empty=106198 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 16:45:00 lag=chartTime-1bar
119545 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=28 famRead=448 unavail=0 emptyValid=15 state=2 attempt=6 poolGen=6 cadence=no-rebuild
119546 UJPROBE bar_key=2026.06.05 16:45 h4=EMPTY h1=EMPTY m15=EMPTY confirmedFeed=1 ltf=EMPTY div=OPPOSING kind=regular readFail=0 empty=106199 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 16:50:00 lag=chartTime-1bar
119547 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=28 famRead=448 unavail=0 emptyValid=15 state=2 attempt=6 poolGen=6 cadence=no-rebuild
119548 UJPROBE bar_key=2026.06.05 16:50 h4=EMPTY h1=EMPTY m15=EMPTY confirmedFeed=1 ltf=EMPTY div=OPPOSING kind=regular readFail=0 empty=106199 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 16:55:00 lag=chartTime-1bar

## C3a LIVE DEC 07-10
69189 IN	0	13:32:29.612	Core 04	2026.06.05 07:00:00   SRJ DEC t=2026.06.05 07:00 bar=106416 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69190 MI	0	13:32:29.612	Core 04	2026.06.05 07:00:00   SRJ DEC3 t=2026.06.05 07:00 bar=106416 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69191 DO	0	13:32:29.612	Core 04	2026.06.05 07:00:00   SRJ DEC2 t=2026.06.05 07:00 bar=106416 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
69204 GR	0	13:32:29.612	Core 04	2026.06.05 07:05:09   SRJ DEC t=2026.06.05 07:00 bar=106416 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69205 OR	0	13:32:29.612	Core 04	2026.06.05 07:05:09   SRJ DEC3 t=2026.06.05 07:00 bar=106416 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69206 JS	0	13:32:29.612	Core 04	2026.06.05 07:05:09   SRJ DEC2 t=2026.06.05 07:00 bar=106416 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
69213 CO	0	13:32:29.612	Core 04	2026.06.05 07:05:09   SRJ DEC t=2026.06.05 07:05 bar=106417 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69214 KO	0	13:32:29.612	Core 04	2026.06.05 07:05:09   SRJ DEC3 t=2026.06.05 07:05 bar=106417 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69215 FL	0	13:32:29.612	Core 04	2026.06.05 07:05:09   SRJ DEC2 t=2026.06.05 07:05 bar=106417 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
69226 HO	0	13:32:29.612	Core 04	2026.06.05 07:10:04   SRJ DEC t=2026.06.05 07:05 bar=106417 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69227 PN	0	13:32:29.612	Core 04	2026.06.05 07:10:04   SRJ DEC3 t=2026.06.05 07:05 bar=106417 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69228 IL	0	13:32:29.612	Core 04	2026.06.05 07:10:04   SRJ DEC2 t=2026.06.05 07:05 bar=106417 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
69235 QH	0	13:32:29.612	Core 04	2026.06.05 07:10:04   SRJ DEC t=2026.06.05 07:10 bar=106418 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69236 IK	0	13:32:29.612	Core 04	2026.06.05 07:10:04   SRJ DEC3 t=2026.06.05 07:10 bar=106418 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69237 PI	0	13:32:29.612	Core 04	2026.06.05 07:10:04   SRJ DEC2 t=2026.06.05 07:10 bar=106418 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
69250 LQ	0	13:32:29.612	Core 04	2026.06.05 07:15:20   SRJ DEC t=2026.06.05 07:10 bar=106418 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69251 DP	0	13:32:29.612	Core 04	2026.06.05 07:15:20   SRJ DEC3 t=2026.06.05 07:10 bar=106418 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69252 MF	0	13:32:29.612	Core 04	2026.06.05 07:15:20   SRJ DEC2 t=2026.06.05 07:10 bar=106418 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
69259 PR	0	13:32:29.612	Core 04	2026.06.05 07:15:20   SRJ DEC t=2026.06.05 07:15 bar=106419 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69260 HM	0	13:32:29.612	Core 04	2026.06.05 07:15:20   SRJ DEC3 t=2026.06.05 07:15 bar=106419 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69261 QS	0	13:32:29.612	Core 04	2026.06.05 07:15:20   SRJ DEC2 t=2026.06.05 07:15 bar=106419 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
69274 IN	0	13:32:29.612	Core 04	2026.06.05 07:20:18   SRJ DEC t=2026.06.05 07:15 bar=106419 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69275 MI	0	13:32:29.612	Core 04	2026.06.05 07:20:18   SRJ DEC3 t=2026.06.05 07:15 bar=106419 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69276 DO	0	13:32:29.612	Core 04	2026.06.05 07:20:18   SRJ DEC2 t=2026.06.05 07:15 bar=106419 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
69283 MK	0	13:32:29.612	Core 04	2026.06.05 07:20:18   SRJ DEC t=2026.06.05 07:20 bar=106420 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69284 IJ	0	13:32:29.612	Core 04	2026.06.05 07:20:18   SRJ DEC3 t=2026.06.05 07:20 bar=106420 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69285 PH	0	13:32:29.612	Core 04	2026.06.05 07:20:18   SRJ DEC2 t=2026.06.05 07:20 bar=106420 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
69301 EF	0	13:32:29.612	Core 04	2026.06.05 07:25:45   SRJ DEC t=2026.06.05 07:20 bar=106420 biasBefore=bearish inBias=2 opp=1 bull=1 bear=2 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=1 renew=0 weak=0
69302 HF	0	13:32:29.612	Core 04	2026.06.05 07:25:45   SRJ DEC3 t=2026.06.05 07:20 bar=106420 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=2 drawBiasLine=0 strongResult=1 tickOBIsValid=0 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69305 RJ	0	13:32:29.612	Core 04	2026.06.05 07:25:45   SRJ DEC2 t=2026.06.05 07:20 bar=106420 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69312 PF	0	13:32:29.612	Core 04	2026.06.05 07:25:45   SRJ DEC t=2026.06.05 07:25 bar=106421 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69313 JF	0	13:32:29.612	Core 04	2026.06.05 07:25:45   SRJ DEC3 t=2026.06.05 07:25 bar=106421 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69314 PG	0	13:32:29.612	Core 04	2026.06.05 07:25:45   SRJ DEC2 t=2026.06.05 07:25 bar=106421 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69328 RF	0	13:32:29.612	Core 04	2026.06.05 07:30:03   SRJ DEC t=2026.06.05 07:25 bar=106421 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69329 PF	0	13:32:29.612	Core 04	2026.06.05 07:30:03   SRJ DEC3 t=2026.06.05 07:25 bar=106421 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69330 JD	0	13:32:29.612	Core 04	2026.06.05 07:30:03   SRJ DEC2 t=2026.06.05 07:25 bar=106421 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69338 OO	0	13:32:29.612	Core 04	2026.06.05 07:30:03   SRJ DEC t=2026.06.05 07:30 bar=106422 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69339 IO	0	13:32:29.612	Core 04	2026.06.05 07:30:03   SRJ DEC3 t=2026.06.05 07:30 bar=106422 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69340 OL	0	13:32:29.612	Core 04	2026.06.05 07:30:03   SRJ DEC2 t=2026.06.05 07:30 bar=106422 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69356 OM	0	13:32:29.612	Core 04	2026.06.05 07:35:06   SRJ DEC t=2026.06.05 07:30 bar=106422 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69357 IM	0	13:32:29.612	Core 04	2026.06.05 07:35:06   SRJ DEC3 t=2026.06.05 07:30 bar=106422 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69358 OR	0	13:32:29.612	Core 04	2026.06.05 07:35:06   SRJ DEC2 t=2026.06.05 07:30 bar=106422 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69365 QN	0	13:32:29.612	Core 04	2026.06.05 07:35:06   SRJ DEC t=2026.06.05 07:35 bar=106423 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69366 CN	0	13:32:29.612	Core 04	2026.06.05 07:35:06   SRJ DEC3 t=2026.06.05 07:35 bar=106423 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69367 MO	0	13:32:29.612	Core 04	2026.06.05 07:35:06   SRJ DEC2 t=2026.06.05 07:35 bar=106423 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69378 CN	0	13:32:29.612	Core 04	2026.06.05 07:40:15   SRJ DEC t=2026.06.05 07:35 bar=106423 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69379 MI	0	13:32:29.612	Core 04	2026.06.05 07:40:15   SRJ DEC3 t=2026.06.05 07:35 bar=106423 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69380 CO	0	13:32:29.612	Core 04	2026.06.05 07:40:15   SRJ DEC2 t=2026.06.05 07:35 bar=106423 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69387 FK	0	13:32:29.612	Core 04	2026.06.05 07:40:15   SRJ DEC t=2026.06.05 07:40 bar=106424 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69388 PJ	0	13:32:29.612	Core 04	2026.06.05 07:40:15   SRJ DEC3 t=2026.06.05 07:40 bar=106424 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69389 JH	0	13:32:29.612	Core 04	2026.06.05 07:40:15   SRJ DEC2 t=2026.06.05 07:40 bar=106424 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69400 EJ	0	13:32:29.612	Core 04	2026.06.05 07:45:08   SRJ DEC t=2026.06.05 07:40 bar=106424 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69401 OJ	0	13:32:29.612	Core 04	2026.06.05 07:45:08   SRJ DEC3 t=2026.06.05 07:40 bar=106424 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69402 IK	0	13:32:29.612	Core 04	2026.06.05 07:45:08   SRJ DEC2 t=2026.06.05 07:40 bar=106424 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69410 QH	0	13:32:29.612	Core 04	2026.06.05 07:45:08   SRJ DEC t=2026.06.05 07:45 bar=106425 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69411 CK	0	13:32:29.612	Core 04	2026.06.05 07:45:08   SRJ DEC3 t=2026.06.05 07:45 bar=106425 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69412 MI	0	13:32:29.612	Core 04	2026.06.05 07:45:08   SRJ DEC2 t=2026.06.05 07:45 bar=106425 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69424 IP	0	13:32:29.612	Core 04	2026.06.05 07:50:00   SRJ DEC t=2026.06.05 07:45 bar=106425 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69425 KS	0	13:32:29.612	Core 04	2026.06.05 07:50:00   SRJ DEC3 t=2026.06.05 07:45 bar=106425 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69426 EQ	0	13:32:29.612	Core 04	2026.06.05 07:50:00   SRJ DEC2 t=2026.06.05 07:45 bar=106425 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69433 FM	0	13:32:29.612	Core 04	2026.06.05 07:50:00   SRJ DEC t=2026.06.05 07:50 bar=106426 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69434 LL	0	13:32:29.612	Core 04	2026.06.05 07:50:00   SRJ DEC3 t=2026.06.05 07:50 bar=106426 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69435 FR	0	13:32:29.612	Core 04	2026.06.05 07:50:00   SRJ DEC2 t=2026.06.05 07:50 bar=106426 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69445 FH	0	13:32:29.612	Core 04	2026.06.05 07:55:03   SRJ DEC t=2026.06.05 07:50 bar=106426 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69446 PK	0	13:32:29.612	Core 04	2026.06.05 07:55:03   SRJ DEC3 t=2026.06.05 07:50 bar=106426 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69447 JI	0	13:32:29.612	Core 04	2026.06.05 07:55:03   SRJ DEC2 t=2026.06.05 07:50 bar=106426 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69454 HE	0	13:32:29.612	Core 04	2026.06.05 07:55:03   SRJ DEC t=2026.06.05 07:55 bar=106427 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69455 JE	0	13:32:29.612	Core 04	2026.06.05 07:55:03   SRJ DEC3 t=2026.06.05 07:55 bar=106427 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69456 PJ	0	13:32:29.612	Core 04	2026.06.05 07:55:03   SRJ DEC2 t=2026.06.05 07:55 bar=106427 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69466 IP	0	13:32:29.612	Core 04	2026.06.05 08:00:01   SRJ DEC t=2026.06.05 07:55 bar=106427 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69467 KP	0	13:32:29.612	Core 04	2026.06.05 08:00:01   SRJ DEC3 t=2026.06.05 07:55 bar=106427 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69468 EQ	0	13:32:29.612	Core 04	2026.06.05 08:00:01   SRJ DEC2 t=2026.06.05 07:55 bar=106427 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69475 GM	0	13:32:29.612	Core 04	2026.06.05 08:00:01   SRJ DEC t=2026.06.05 08:00 bar=106428 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69476 QM	0	13:32:29.612	Core 04	2026.06.05 08:00:01   SRJ DEC3 t=2026.06.05 08:00 bar=106428 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69477 GR	0	13:32:29.612	Core 04	2026.06.05 08:00:01   SRJ DEC2 t=2026.06.05 08:00 bar=106428 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69492 PD	0	13:32:29.612	Core 04	2026.06.05 08:05:07   SRJ DEC t=2026.06.05 08:00 bar=106428 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69493 FG	0	13:32:29.612	Core 04	2026.06.05 08:05:07   SRJ DEC3 t=2026.06.05 08:00 bar=106428 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69494 LE	0	13:32:29.612	Core 04	2026.06.05 08:05:07   SRJ DEC2 t=2026.06.05 08:00 bar=106428 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69502 DE	0	13:32:29.612	Core 04	2026.06.05 08:05:07   SRJ DEC t=2026.06.05 08:05 bar=106429 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69503 RE	0	13:32:29.612	Core 04	2026.06.05 08:05:07   SRJ DEC3 t=2026.06.05 08:05 bar=106429 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69504 HJ	0	13:32:29.612	Core 04	2026.06.05 08:05:07   SRJ DEC2 t=2026.06.05 08:05 bar=106429 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69520 ED	0	13:32:29.612	Core 04	2026.06.05 08:10:00   SRJ DEC t=2026.06.05 08:05 bar=106429 biasBefore=bullish inBias=1 opp=0 bull=1 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69521 OD	0	13:32:29.612	Core 04	2026.06.05 08:10:00   SRJ DEC3 t=2026.06.05 08:05 bar=106429 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69522 IE	0	13:32:29.612	Core 04	2026.06.05 08:10:00   SRJ DEC2 t=2026.06.05 08:05 bar=106429 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69530 KE	0	13:32:29.612	Core 04	2026.06.05 08:10:00   SRJ DEC t=2026.06.05 08:10 bar=106430 biasBefore=bullish inBias=1 opp=0 bull=1 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69531 ME	0	13:32:29.612	Core 04	2026.06.05 08:10:00   SRJ DEC3 t=2026.06.05 08:10 bar=106430 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69532 CK	0	13:32:29.612	Core 04	2026.06.05 08:10:00   SRJ DEC2 t=2026.06.05 08:10 bar=106430 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
69546 KM	0	13:32:29.612	Core 04	2026.06.05 08:15:04   SRJ DEC t=2026.06.05 08:10 bar=106430 biasBefore=bullish inBias=2 opp=0 bull=2 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=1 renew=0 weak=0
69547 LM	0	13:32:29.612	Core 04	2026.06.05 08:15:04   SRJ DEC3 t=2026.06.05 08:10 bar=106430 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=2 drawBiasLine=0 strongResult=1 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69550 DF	0	13:32:29.612	Core 04	2026.06.05 08:15:04   SRJ DEC2 t=2026.06.05 08:10 bar=106430 biasAfterDecision=bearish justChangedBias=0 obInvBound=106430 lastRenewalOB=106409
69557 OR	0	13:32:29.612	Core 04	2026.06.05 08:15:04   SRJ DEC t=2026.06.05 08:15 bar=106431 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106430 obInvBound=106430 obInvBoundT=2026.06.05 08:10 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69558 PM	0	13:32:29.612	Core 04	2026.06.05 08:15:04   SRJ DEC3 t=2026.06.05 08:15 bar=106431 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69559 HS	0	13:32:29.612	Core 04	2026.06.05 08:15:04   SRJ DEC2 t=2026.06.05 08:15 bar=106431 biasAfterDecision=bearish justChangedBias=0 obInvBound=106430 lastRenewalOB=106409
69573 FP	0	13:32:29.612	Core 04	2026.06.05 08:20:03   SRJ DEC t=2026.06.05 08:15 bar=106431 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106430 obInvBound=106430 obInvBoundT=2026.06.05 08:10 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69574 QP	0	13:32:29.612	Core 04	2026.06.05 08:20:03   SRJ DEC3 t=2026.06.05 08:15 bar=106431 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69575 IF	0	13:32:29.612	Core 04	2026.06.05 08:20:03   SRJ DEC2 t=2026.06.05 08:15 bar=106431 biasAfterDecision=bearish justChangedBias=0 obInvBound=106430 lastRenewalOB=106409
69583 MF	0	13:32:29.612	Core 04	2026.06.05 08:20:03   SRJ DEC t=2026.06.05 08:20 bar=106432 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106430 obInvBound=106430 obInvBoundT=2026.06.05 08:10 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69584 RQ	0	13:32:29.612	Core 04	2026.06.05 08:20:03   SRJ DEC3 t=2026.06.05 08:20 bar=106432 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69585 JG	0	13:32:29.612	Core 04	2026.06.05 08:20:03   SRJ DEC2 t=2026.06.05 08:20 bar=106432 biasAfterDecision=bearish justChangedBias=0 obInvBound=106430 lastRenewalOB=106409
69601 DI	0	13:32:29.612	Core 04	2026.06.05 08:25:00   SRJ DEC t=2026.06.05 08:20 bar=106432 biasBefore=bearish inBias=0 opp=2 bull=2 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106430 obInvBound=106430 obInvBoundT=2026.06.05 08:10 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=1 weak=0
69602 QI	0	13:32:29.612	Core 04	2026.06.05 08:25:00   SRJ DEC3 t=2026.06.05 08:20 bar=106432 oppCount=2 drawStructRenewal=0 renewResult=1 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69605 FR	0	13:32:29.612	Core 04	2026.06.05 08:25:00   SRJ DEC2 t=2026.06.05 08:20 bar=106432 biasAfterDecision=bearish justChangedBias=0 obInvBound=106432 lastRenewalOB=106409
69612 NN	0	13:32:29.612	Core 04	2026.06.05 08:25:00   SRJ DEC t=2026.06.05 08:25 bar=106433 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106432 obInvBound=106432 obInvBoundT=2026.06.05 08:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
69613 PI	0	13:32:29.612	Core 04	2026.06.05 08:25:00   SRJ DEC3 t=2026.06.05 08:25 bar=106433 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69614 JO	0	13:32:29.612	Core 04	2026.06.05 08:25:00   SRJ DEC2 t=2026.06.05 08:25 bar=106433 biasAfterDecision=bearish justChangedBias=0 obInvBound=106432 lastRenewalOB=106409
69629 JP	0	13:32:29.612	Core 04	2026.06.05 08:30:00   SRJ DEC t=2026.06.05 08:25 bar=106433 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69630 HP	0	13:32:29.612	Core 04	2026.06.05 08:30:00   SRJ DEC3 t=2026.06.05 08:25 bar=106433 oppCount=0 drawStructRenewal=1 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69631 IQ	0	13:32:29.612	Core 04	2026.06.05 08:30:00   SRJ DEC2 t=2026.06.05 08:25 bar=106433 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
69639 QQ	0	13:32:29.612	Core 04	2026.06.05 08:30:00   SRJ DEC t=2026.06.05 08:30 bar=106434 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69640 DQ	0	13:32:29.612	Core 04	2026.06.05 08:30:00   SRJ DEC3 t=2026.06.05 08:30 bar=106434 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69641 FF	0	13:32:29.612	Core 04	2026.06.05 08:30:00   SRJ DEC2 t=2026.06.05 08:30 bar=106434 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
69657 QJ	0	13:32:29.612	Core 04	2026.06.05 08:35:12   SRJ DEC t=2026.06.05 08:30 bar=106434 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69658 GJ	0	13:32:29.612	Core 04	2026.06.05 08:35:12   SRJ DEC3 t=2026.06.05 08:30 bar=106434 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69659 JK	0	13:32:29.612	Core 04	2026.06.05 08:35:12   SRJ DEC2 t=2026.06.05 08:30 bar=106434 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
69667 OO	0	13:32:29.612	Core 04	2026.06.05 08:35:12   SRJ DEC t=2026.06.05 08:35 bar=106435 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69668 EO	0	13:32:29.612	Core 04	2026.06.05 08:35:12   SRJ DEC3 t=2026.06.05 08:35 bar=106435 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69669 DL	0	13:32:29.612	Core 04	2026.06.05 08:35:12   SRJ DEC2 t=2026.06.05 08:35 bar=106435 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
69679 LJ	0	13:32:29.612	Core 04	2026.06.05 08:40:13   SRJ DEC t=2026.06.05 08:35 bar=106435 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69680 FJ	0	13:32:29.612	Core 04	2026.06.05 08:40:13   SRJ DEC3 t=2026.06.05 08:35 bar=106435 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69681 CK	0	13:32:29.612	Core 04	2026.06.05 08:40:13   SRJ DEC2 t=2026.06.05 08:35 bar=106435 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
69688 KG	0	13:32:29.612	Core 04	2026.06.05 08:40:13   SRJ DEC t=2026.06.05 08:40 bar=106436 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69689 EG	0	13:32:29.612	Core 04	2026.06.05 08:40:13   SRJ DEC3 t=2026.06.05 08:40 bar=106436 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69690 DD	0	13:32:29.612	Core 04	2026.06.05 08:40:13   SRJ DEC2 t=2026.06.05 08:40 bar=106436 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
69704 GE	0	13:32:29.612	Core 04	2026.06.05 08:45:01   SRJ DEC t=2026.06.05 08:40 bar=106436 biasBefore=bearish inBias=1 opp=1 bull=1 bear=1 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69705 MD	0	13:32:29.612	Core 04	2026.06.05 08:45:01   SRJ DEC3 t=2026.06.05 08:40 bar=106436 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69706 LJ	0	13:32:29.612	Core 04	2026.06.05 08:45:01   SRJ DEC2 t=2026.06.05 08:40 bar=106436 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
69714 IJ	0	13:32:29.612	Core 04	2026.06.05 08:45:01   SRJ DEC t=2026.06.05 08:45 bar=106437 biasBefore=bearish inBias=1 opp=1 bull=1 bear=1 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69715 GJ	0	13:32:29.612	Core 04	2026.06.05 08:45:01   SRJ DEC3 t=2026.06.05 08:45 bar=106437 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69716 JK	0	13:32:29.612	Core 04	2026.06.05 08:45:01   SRJ DEC2 t=2026.06.05 08:45 bar=106437 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
69732 LN	0	13:32:29.612	Core 04	2026.06.05 08:50:00   SRJ DEC t=2026.06.05 08:45 bar=106437 biasBefore=bearish inBias=1 opp=1 bull=1 bear=1 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69733 JN	0	13:32:29.612	Core 04	2026.06.05 08:50:00   SRJ DEC3 t=2026.06.05 08:45 bar=106437 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69734 GO	0	13:32:29.612	Core 04	2026.06.05 08:50:00   SRJ DEC2 t=2026.06.05 08:45 bar=106437 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
69741 EK	0	13:32:29.612	Core 04	2026.06.05 08:50:00   SRJ DEC t=2026.06.05 08:50 bar=106438 biasBefore=bearish inBias=1 opp=1 bull=1 bear=1 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69742 OK	0	13:32:29.612	Core 04	2026.06.05 08:50:00   SRJ DEC3 t=2026.06.05 08:50 bar=106438 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69743 RH	0	13:32:29.612	Core 04	2026.06.05 08:50:00   SRJ DEC2 t=2026.06.05 08:50 bar=106438 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
69757 PI	0	13:32:29.612	Core 04	2026.06.05 08:55:08   SRJ DEC t=2026.06.05 08:50 bar=106438 biasBefore=bearish inBias=1 opp=1 bull=1 bear=1 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69758 QI	0	13:32:29.612	Core 04	2026.06.05 08:55:08   SRJ DEC3 t=2026.06.05 08:50 bar=106438 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69759 OO	0	13:32:29.612	Core 04	2026.06.05 08:55:08   SRJ DEC2 t=2026.06.05 08:50 bar=106438 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
69766 LJ	0	13:32:29.612	Core 04	2026.06.05 08:55:08   SRJ DEC t=2026.06.05 08:55 bar=106439 biasBefore=bearish inBias=1 opp=1 bull=1 bear=1 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69767 MJ	0	13:32:29.612	Core 04	2026.06.05 08:55:08   SRJ DEC3 t=2026.06.05 08:55 bar=106439 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
69768 KH	0	13:32:29.612	Core 04	2026.06.05 08:55:08   SRJ DEC2 t=2026.06.05 08:55 bar=106439 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
69781 OL	0	13:32:29.612	Core 04	2026.06.05 09:00:00   SRJ DEC t=2026.06.05 08:55 bar=106439 biasBefore=bearish inBias=1 opp=1 bull=1 bear=1 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=1 strong=0 renew=0 weak=1
69782 JO	0	13:32:29.612	Core 04	2026.06.05 09:00:00   SRJ DEC3 t=2026.06.05 08:55 bar=106439 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=1 weakResult=1
69786 CI	0	13:32:29.612	Core 04	2026.06.05 09:00:00   SRJ DEC2 t=2026.06.05 08:55 bar=106439 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
69793 PE	0	13:32:29.612	Core 04	2026.06.05 09:00:00   SRJ DEC t=2026.06.05 09:00 bar=106440 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69794 IE	0	13:32:29.612	Core 04	2026.06.05 09:00:00   SRJ DEC3 t=2026.06.05 09:00 bar=106440 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69795 PJ	0	13:32:29.612	Core 04	2026.06.05 09:00:00   SRJ DEC2 t=2026.06.05 09:00 bar=106440 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
69809 QF	0	13:32:29.612	Core 04	2026.06.05 09:05:00   SRJ DEC t=2026.06.05 09:00 bar=106440 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69810 LF	0	13:32:29.612	Core 04	2026.06.05 09:05:00   SRJ DEC3 t=2026.06.05 09:00 bar=106440 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69811 ED	0	13:32:29.612	Core 04	2026.06.05 09:05:00   SRJ DEC2 t=2026.06.05 09:00 bar=106440 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
69820 CM	0	13:32:29.612	Core 04	2026.06.05 09:05:00   SRJ DEC t=2026.06.05 09:05 bar=106441 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69821 NL	0	13:32:29.612	Core 04	2026.06.05 09:05:00   SRJ DEC3 t=2026.06.05 09:05 bar=106441 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69822 CR	0	13:32:29.612	Core 04	2026.06.05 09:05:00   SRJ DEC2 t=2026.06.05 09:05 bar=106441 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
69839 CS	0	13:32:29.612	Core 04	2026.06.05 09:10:00   SRJ DEC t=2026.06.05 09:05 bar=106441 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69840 NR	0	13:32:29.612	Core 04	2026.06.05 09:10:00   SRJ DEC3 t=2026.06.05 09:05 bar=106441 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69841 CP	0	13:32:29.612	Core 04	2026.06.05 09:10:00   SRJ DEC2 t=2026.06.05 09:05 bar=106441 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
69849 PQ	0	13:32:29.612	Core 04	2026.06.05 09:10:00   SRJ DEC t=2026.06.05 09:10 bar=106442 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69850 EQ	0	13:32:29.612	Core 04	2026.06.05 09:10:00   SRJ DEC3 t=2026.06.05 09:10 bar=106442 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69851 LF	0	13:32:29.612	Core 04	2026.06.05 09:10:00   SRJ DEC2 t=2026.06.05 09:10 bar=106442 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
69892 CI	0	13:32:29.612	Core 04	2026.06.05 09:15:00   SRJ DEC t=2026.06.05 09:10 bar=106442 biasBefore=bullish inBias=0 opp=1 bull=0 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69893 QH	0	13:32:29.612	Core 04	2026.06.05 09:15:00   SRJ DEC3 t=2026.06.05 09:10 bar=106442 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69894 GN	0	13:32:29.612	Core 04	2026.06.05 09:15:00   SRJ DEC2 t=2026.06.05 09:10 bar=106442 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
69902 KO	0	13:32:29.612	Core 04	2026.06.05 09:15:00   SRJ DEC t=2026.06.05 09:15 bar=106443 biasBefore=bullish inBias=0 opp=1 bull=0 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69903 QO	0	13:32:29.612	Core 04	2026.06.05 09:15:00   SRJ DEC3 t=2026.06.05 09:15 bar=106443 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69904 GM	0	13:32:29.612	Core 04	2026.06.05 09:15:00   SRJ DEC2 t=2026.06.05 09:15 bar=106443 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
69935 CF	0	13:32:29.612	Core 04	2026.06.05 09:20:00   SRJ DEC t=2026.06.05 09:15 bar=106443 biasBefore=bullish inBias=0 opp=1 bull=0 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69936 MQ	0	13:32:29.612	Core 04	2026.06.05 09:20:00   SRJ DEC3 t=2026.06.05 09:15 bar=106443 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69937 CG	0	13:32:29.612	Core 04	2026.06.05 09:20:00   SRJ DEC2 t=2026.06.05 09:15 bar=106443 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
69945 ND	0	13:32:29.612	Core 04	2026.06.05 09:20:00   SRJ DEC t=2026.06.05 09:20 bar=106444 biasBefore=bullish inBias=0 opp=1 bull=0 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
69946 HD	0	13:32:29.612	Core 04	2026.06.05 09:20:00   SRJ DEC3 t=2026.06.05 09:20 bar=106444 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
69947 RE	0	13:32:29.612	Core 04	2026.06.05 09:20:00   SRJ DEC2 t=2026.06.05 09:20 bar=106444 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70171 KS	0	13:32:29.612	Core 04	2026.06.05 09:25:04   SRJ DEC t=2026.06.05 09:20 bar=106444 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
70172 ES	0	13:32:29.612	Core 04	2026.06.05 09:25:04   SRJ DEC3 t=2026.06.05 09:20 bar=106444 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
70173 KP	0	13:32:29.612	Core 04	2026.06.05 09:25:04   SRJ DEC2 t=2026.06.05 09:20 bar=106444 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70180 MM	0	13:32:29.612	Core 04	2026.06.05 09:25:04   SRJ DEC t=2026.06.05 09:25 bar=106445 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
70181 OM	0	13:32:29.612	Core 04	2026.06.05 09:25:04   SRJ DEC3 t=2026.06.05 09:25 bar=106445 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
70182 IS	0	13:32:29.612	Core 04	2026.06.05 09:25:04   SRJ DEC2 t=2026.06.05 09:25 bar=106445 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70217 QE	0	13:32:29.612	Core 04	2026.06.05 09:30:00   SRJ DEC t=2026.06.05 09:25 bar=106445 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
70218 DE	0	13:32:29.612	Core 04	2026.06.05 09:30:00   SRJ DEC3 t=2026.06.05 09:25 bar=106445 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70219 MJ	0	13:32:29.612	Core 04	2026.06.05 09:30:00   SRJ DEC2 t=2026.06.05 09:25 bar=106445 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70226 FD	0	13:32:29.612	Core 04	2026.06.05 09:30:00   SRJ DEC t=2026.06.05 09:30 bar=106446 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
70227 KG	0	13:32:29.612	Core 04	2026.06.05 09:30:00   SRJ DEC3 t=2026.06.05 09:30 bar=106446 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70228 FE	0	13:32:29.612	Core 04	2026.06.05 09:30:00   SRJ DEC2 t=2026.06.05 09:30 bar=106446 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70263 EG	0	13:32:35.839	Core 04	2026.06.05 09:35:00   SRJ DEC t=2026.06.05 09:30 bar=106446 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
70264 HG	0	13:32:35.839	Core 04	2026.06.05 09:35:00   SRJ DEC3 t=2026.06.05 09:30 bar=106446 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70265 QE	0	13:32:35.839	Core 04	2026.06.05 09:35:00   SRJ DEC2 t=2026.06.05 09:30 bar=106446 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70272 OF	0	13:32:35.839	Core 04	2026.06.05 09:35:00   SRJ DEC t=2026.06.05 09:35 bar=106447 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
70273 JQ	0	13:32:35.839	Core 04	2026.06.05 09:35:00   SRJ DEC3 t=2026.06.05 09:35 bar=106447 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70274 OG	0	13:32:35.839	Core 04	2026.06.05 09:35:00   SRJ DEC2 t=2026.06.05 09:35 bar=106447 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70291 OO	0	13:32:35.839	Core 04	2026.06.05 09:40:00   SRJ DEC t=2026.06.05 09:35 bar=106447 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
70292 NO	0	13:32:35.839	Core 04	2026.06.05 09:40:00   SRJ DEC3 t=2026.06.05 09:35 bar=106447 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70293 CL	0	13:32:35.839	Core 04	2026.06.05 09:40:00   SRJ DEC2 t=2026.06.05 09:35 bar=106447 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70301 HR	0	13:32:35.839	Core 04	2026.06.05 09:40:00   SRJ DEC t=2026.06.05 09:40 bar=106448 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
70302 MM	0	13:32:35.839	Core 04	2026.06.05 09:40:00   SRJ DEC3 t=2026.06.05 09:40 bar=106448 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70303 DS	0	13:32:35.839	Core 04	2026.06.05 09:40:00   SRJ DEC2 t=2026.06.05 09:40 bar=106448 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70337 MG	0	13:32:35.839	Core 04	2026.06.05 09:45:00   SRJ DEC t=2026.06.05 09:40 bar=106448 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
70338 DG	0	13:32:35.839	Core 04	2026.06.05 09:45:00   SRJ DEC3 t=2026.06.05 09:40 bar=106448 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70339 MD	0	13:32:35.839	Core 04	2026.06.05 09:45:00   SRJ DEC2 t=2026.06.05 09:40 bar=106448 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70347 GJ	0	13:32:35.839	Core 04	2026.06.05 09:45:00   SRJ DEC t=2026.06.05 09:45 bar=106449 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
70348 NE	0	13:32:35.839	Core 04	2026.06.05 09:45:00   SRJ DEC3 t=2026.06.05 09:45 bar=106449 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70349 CK	0	13:32:35.839	Core 04	2026.06.05 09:45:00   SRJ DEC2 t=2026.06.05 09:45 bar=106449 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70364 HL	0	13:32:35.839	Core 04	2026.06.05 09:50:05   SRJ DEC t=2026.06.05 09:45 bar=106449 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
70365 MO	0	13:32:35.839	Core 04	2026.06.05 09:50:05   SRJ DEC3 t=2026.06.05 09:45 bar=106449 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70366 DM	0	13:32:35.839	Core 04	2026.06.05 09:50:05   SRJ DEC2 t=2026.06.05 09:45 bar=106449 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70373 FN	0	13:32:35.839	Core 04	2026.06.05 09:50:05   SRJ DEC t=2026.06.05 09:50 bar=106450 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
70374 KN	0	13:32:35.839	Core 04	2026.06.05 09:50:05   SRJ DEC3 t=2026.06.05 09:50 bar=106450 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70375 FO	0	13:32:35.839	Core 04	2026.06.05 09:50:05   SRJ DEC2 t=2026.06.05 09:50 bar=106450 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
70391 CO	0	13:32:35.839	Core 04	2026.06.05 09:55:00   SRJ DEC t=2026.06.05 09:50 bar=106450 biasBefore=bullish inBias=2 opp=1 bull=2 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=1 renew=0 weak=0
70392 OO	0	13:32:35.839	Core 04	2026.06.05 09:55:00   SRJ DEC3 t=2026.06.05 09:50 bar=106450 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=2 drawBiasLine=0 strongResult=1 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70395 NS	0	13:32:35.839	Core 04	2026.06.05 09:55:00   SRJ DEC2 t=2026.06.05 09:50 bar=106450 biasAfterDecision=bearish justChangedBias=0 obInvBound=106450 lastRenewalOB=106432
70402 LM	0	13:32:35.839	Core 04	2026.06.05 09:55:00   SRJ DEC t=2026.06.05 09:55 bar=106451 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106450 structStartT=2026.06.05 09:50 countRef=106450 countRefT=2026.06.05 09:50 lastRelStruct=106450 obInvBound=106450 obInvBoundT=2026.06.05 09:50 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
70403 HL	0	13:32:35.839	Core 04	2026.06.05 09:55:00   SRJ DEC3 t=2026.06.05 09:55 bar=106451 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70404 FR	0	13:32:35.839	Core 04	2026.06.05 09:55:00   SRJ DEC2 t=2026.06.05 09:55 bar=106451 biasAfterDecision=bearish justChangedBias=0 obInvBound=106450 lastRenewalOB=106432

## C3a LIVE EVT+INV 07-10
69297 LP	0	13:32:29.612	Core 04	2026.06.05 07:25:45   SRJ INV t=2026.06.05 07:20 bar=106420 obStart=106414 obStartT=2026.06.05 06:50 obVal=106416 obInv=106420 obCreation=106415 isBull=0 bias=bearish ref=106409 refT=2026.06.05 06:25 refOk=1 sameBarValInv=0
69299 EL	0	13:32:29.612	Core 04	2026.06.05 07:25:45   SRJ INV t=2026.06.05 07:20 bar=106420 obStart=106395 obStartT=2026.06.05 05:15 obVal=106417 obInv=106420 obCreation=106396 isBull=0 bias=bearish ref=106409 refT=2026.06.05 06:25 refOk=1 sameBarValInv=0
69304 MH	0	13:32:29.612	Core 04	2026.06.05 07:25:45   SRJ EVT t=2026.06.05 07:20 bar=106420 kind=strongFlip bias=bullish resetOn=true
69518 HN	0	13:32:29.612	Core 04	2026.06.05 08:10:00   SRJ INV t=2026.06.05 08:05 bar=106429 obStart=106423 obStartT=2026.06.05 07:35 obVal=106428 obInv=106429 obCreation=106424 isBull=1 bias=bullish ref=106420 refT=2026.06.05 07:20 refOk=1 sameBarValInv=0
69544 CQ	0	13:32:29.612	Core 04	2026.06.05 08:15:04   SRJ INV t=2026.06.05 08:10 bar=106430 obStart=106426 obStartT=2026.06.05 07:50 obVal=106428 obInv=106430 obCreation=106428 isBull=1 bias=bullish ref=106420 refT=2026.06.05 07:20 refOk=1 sameBarValInv=0
69549 HD	0	13:32:29.612	Core 04	2026.06.05 08:15:04   SRJ EVT t=2026.06.05 08:10 bar=106430 kind=strongFlip bias=bearish resetOn=true
69596 HN	0	13:32:29.612	Core 04	2026.06.05 08:25:00   SRJ INV t=2026.06.05 08:20 bar=106432 obStart=106413 obStartT=2026.06.05 06:45 obVal=106414 obInv=106432 obCreation=106414 isBull=1 bias=bearish ref=106430 refT=2026.06.05 08:10 refOk=1 sameBarValInv=0
69598 HK	0	13:32:29.612	Core 04	2026.06.05 08:25:00   SRJ INV t=2026.06.05 08:20 bar=106432 obStart=106393 obStartT=2026.06.05 05:05 obVal=106395 obInv=106432 obCreation=106395 isBull=1 bias=bearish ref=106430 refT=2026.06.05 08:10 refOk=1 sameBarValInv=0
69604 QN	0	13:32:29.612	Core 04	2026.06.05 08:25:00   SRJ EVT t=2026.06.05 08:20 bar=106432 kind=doRenewal bias=bearish resetOn=true
69628 QS	0	13:32:29.612	Core 04	2026.06.05 08:30:00   SRJ EVT t=2026.06.05 08:25 bar=106433 kind=fvgRenewal bias=bearish resetOn=true
69655 LH	0	13:32:29.612	Core 04	2026.06.05 08:35:12   SRJ INV t=2026.06.05 08:30 bar=106434 obStart=106383 obStartT=2026.06.05 04:15 obVal=106384 obInv=106434 obCreation=106384 isBull=1 bias=bearish ref=106430 refT=2026.06.05 08:10 refOk=1 sameBarValInv=0
69701 JI	0	13:32:29.612	Core 04	2026.06.05 08:45:01   SRJ INV t=2026.06.05 08:40 bar=106436 obStart=106387 obStartT=2026.06.05 04:35 obVal=106432 obInv=106436 obCreation=106389 isBull=0 bias=bearish ref=106430 refT=2026.06.05 08:10 refOk=1 sameBarValInv=0
69784 KR	0	13:32:29.612	Core 04	2026.06.05 09:00:00   SRJ EVT t=2026.06.05 08:55 bar=106439 kind=weakFlip bias=bullish resetOn=true
69888 KK	0	13:32:29.612	Core 04	2026.06.05 09:15:00   SRJ INV t=2026.06.05 09:10 bar=106442 obStart=106439 obStartT=2026.06.05 08:55 obVal=106441 obInv=106442 obCreation=106441 isBull=0 bias=bullish ref=106439 refT=2026.06.05 08:55 refOk=1 sameBarValInv=0
70169 GS	0	13:32:29.612	Core 04	2026.06.05 09:25:04   SRJ INV t=2026.06.05 09:20 bar=106444 obStart=106440 obStartT=2026.06.05 09:00 obVal=106442 obInv=106444 obCreation=106442 isBull=1 bias=bullish ref=106439 refT=2026.06.05 08:55 refOk=1 sameBarValInv=0
70389 CG	0	13:32:35.839	Core 04	2026.06.05 09:55:00   SRJ INV t=2026.06.05 09:50 bar=106450 obStart=106432 obStartT=2026.06.05 08:20 obVal=106439 obInv=106450 obCreation=106433 isBull=1 bias=bullish ref=106439 refT=2026.06.05 08:55 refOk=1 sameBarValInv=0
70394 LR	0	13:32:35.839	Core 04	2026.06.05 09:55:00   SRJ EVT t=2026.06.05 09:50 bar=106450 kind=strongFlip bias=bearish resetOn=true

## C3c HOOP DEC (10:00:00/01)
70420 HJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:55 bar=106451 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106450 structStartT=2026.06.05 09:50 countRef=106450 countRefT=2026.06.05 09:50 lastRelStruct=106450 obInvBound=106450 obInvBoundT=2026.06.05 09:50 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
70421 LE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:55 bar=106451 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70422 RK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:55 bar=106451 biasAfterDecision=bearish justChangedBias=0 obInvBound=106450 lastRenewalOB=106432
70430 GH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 10:00 bar=106452 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106450 structStartT=2026.06.05 09:50 countRef=106450 countRefT=2026.06.05 09:50 lastRelStruct=106450 obInvBound=106450 obInvBoundT=2026.06.05 09:50 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
70431 GH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 10:00 bar=106452 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
70432 EN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 10:00 bar=106452 biasAfterDecision=bearish justChangedBias=0 obInvBound=106450 lastRenewalOB=106432
118875 ME	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 07:00 bar=106416 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
118876 ID	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 07:00 bar=106416 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
118877 PJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 07:00 bar=106416 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
118884 MF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 07:05 bar=106417 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
118885 QF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 07:05 bar=106417 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
118886 HG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 07:05 bar=106417 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
118893 PS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 07:10 bar=106418 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
118894 DS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 07:10 bar=106418 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
118895 MP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 07:10 bar=106418 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
118902 PL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 07:15 bar=106419 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
118903 LL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 07:15 bar=106419 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
118904 ER	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 07:15 bar=106419 biasAfterDecision=bearish justChangedBias=0 obInvBound=106411 lastRenewalOB=106409
118915 CP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 07:20 bar=106420 biasBefore=bearish inBias=2 opp=1 bull=1 bear=2 structStart=106409 structStartT=2026.06.05 06:25 countRef=106409 countRefT=2026.06.05 06:25 lastRelStruct=106411 obInvBound=106411 obInvBoundT=2026.06.05 06:35 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=1 renew=0 weak=0
118916 JP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 07:20 bar=106420 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=2 drawBiasLine=0 strongResult=1 tickOBIsValid=0 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
118919 PE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 07:20 bar=106420 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
118926 NQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 07:25 bar=106421 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
118927 LQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 07:25 bar=106421 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
118928 FF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 07:25 bar=106421 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
118939 OM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 07:30 bar=106422 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
118940 QM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 07:30 bar=106422 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
118941 GR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 07:30 bar=106422 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
118948 EN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 07:35 bar=106423 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
118949 ON	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 07:35 bar=106423 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
118950 IO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 07:35 bar=106423 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
118957 LH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 07:40 bar=106424 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
118958 FK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 07:40 bar=106424 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
118959 LI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 07:40 bar=106424 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
118967 DI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 07:45 bar=106425 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
118968 FI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 07:45 bar=106425 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
118969 LO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 07:45 bar=106425 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
118976 OK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 07:50 bar=106426 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
118977 EJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 07:50 bar=106426 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
118978 KH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 07:50 bar=106426 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
118985 ID	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 07:55 bar=106427 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
118986 OD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 07:55 bar=106427 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
118987 IE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 07:55 bar=106427 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
118994 OF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 08:00 bar=106428 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
118995 EQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 08:00 bar=106428 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
118996 KG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 08:00 bar=106428 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
119006 MK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 08:05 bar=106429 biasBefore=bullish inBias=1 opp=0 bull=1 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
119007 CJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 08:05 bar=106429 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119008 MH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 08:05 bar=106429 biasAfterDecision=bullish justChangedBias=0 obInvBound=106420 lastRenewalOB=106409
119018 JL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 08:10 bar=106430 biasBefore=bullish inBias=2 opp=0 bull=2 bear=0 structStart=106420 structStartT=2026.06.05 07:20 countRef=106420 countRefT=2026.06.05 07:20 lastRelStruct=106420 obInvBound=106420 obInvBoundT=2026.06.05 07:20 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=1 renew=0 weak=0
119019 QO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 08:10 bar=106430 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=2 drawBiasLine=0 strongResult=1 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119022 IP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 08:10 bar=106430 biasAfterDecision=bearish justChangedBias=0 obInvBound=106430 lastRenewalOB=106409
119029 JL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 08:15 bar=106431 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106430 obInvBound=106430 obInvBoundT=2026.06.05 08:10 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
119030 IL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 08:15 bar=106431 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119031 QM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 08:15 bar=106431 biasAfterDecision=bearish justChangedBias=0 obInvBound=106430 lastRenewalOB=106409
119044 DJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 08:20 bar=106432 biasBefore=bearish inBias=0 opp=2 bull=2 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106430 obInvBound=106430 obInvBoundT=2026.06.05 08:10 lastRenewalOB=106409 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=1 weak=0
119045 IJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 08:20 bar=106432 oppCount=2 drawStructRenewal=0 renewResult=1 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119048 FO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 08:20 bar=106432 biasAfterDecision=bearish justChangedBias=0 obInvBound=106432 lastRenewalOB=106409
119059 HR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 08:25 bar=106433 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119060 NM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 08:25 bar=106433 oppCount=0 drawStructRenewal=1 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
119061 KS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 08:25 bar=106433 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
119071 GG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 08:30 bar=106434 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119072 IG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 08:30 bar=106434 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
119073 HD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 08:30 bar=106434 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
119081 MH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 08:35 bar=106435 biasBefore=bearish inBias=0 opp=1 bull=1 bear=0 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119082 GH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 08:35 bar=106435 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
119083 JI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 08:35 bar=106435 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
119093 HH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 08:40 bar=106436 biasBefore=bearish inBias=1 opp=1 bull=1 bear=1 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119094 RK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 08:40 bar=106436 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
119095 OI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 08:40 bar=106436 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
119104 NH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 08:45 bar=106437 biasBefore=bearish inBias=1 opp=1 bull=1 bear=1 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119105 HH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 08:45 bar=106437 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
119106 II	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 08:45 bar=106437 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
119116 GH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 08:50 bar=106438 biasBefore=bearish inBias=1 opp=1 bull=1 bear=1 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119117 NH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 08:50 bar=106438 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119118 LI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 08:50 bar=106438 biasAfterDecision=bearish justChangedBias=0 obInvBound=106433 lastRenewalOB=106432
119127 QL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 08:55 bar=106439 biasBefore=bearish inBias=1 opp=1 bull=1 bear=1 structStart=106430 structStartT=2026.06.05 08:10 countRef=106430 countRefT=2026.06.05 08:10 lastRelStruct=106433 obInvBound=106433 obInvBoundT=2026.06.05 08:25 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=1 strong=0 renew=0 weak=1
119128 HO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 08:55 bar=106439 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=1 weakResult=1
119132 EI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 08:55 bar=106439 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
119139 NE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:00 bar=106440 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119140 CE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:00 bar=106440 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
119141 NJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:00 bar=106440 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
119152 RQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:05 bar=106441 biasBefore=bullish inBias=0 opp=0 bull=0 bear=0 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119153 GQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:05 bar=106441 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
119154 RF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:05 bar=106441 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
119166 OI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:10 bar=106442 biasBefore=bullish inBias=0 opp=1 bull=0 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119167 II	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:10 bar=106442 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
119168 ON	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:10 bar=106442 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
119176 KL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:15 bar=106443 biasBefore=bullish inBias=0 opp=1 bull=0 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119177 EL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:15 bar=106443 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
119178 KM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:15 bar=106443 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
119188 PF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:20 bar=106444 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119189 JF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:20 bar=106444 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=1 hasPersistedOppFVG=0 weakResult=0
119190 PG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:20 bar=106444 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
119198 HG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:25 bar=106445 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119199 QF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:25 bar=106445 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119200 HD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:25 bar=106445 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
119207 KQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:30 bar=106446 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119208 JQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:30 bar=106446 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119209 OF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:30 bar=106446 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
119216 EP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:35 bar=106447 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119217 LS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:35 bar=106447 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119218 EQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:35 bar=106447 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
119226 RG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:40 bar=106448 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119227 GF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:40 bar=106448 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119228 RD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:40 bar=106448 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
119236 PJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:45 bar=106449 biasBefore=bullish inBias=1 opp=1 bull=1 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=0 renew=0 weak=0
119237 EE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:45 bar=106449 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=1 drawBiasLine=0 strongResult=0 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119238 LK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:45 bar=106449 biasAfterDecision=bullish justChangedBias=0 obInvBound=106439 lastRenewalOB=106432
119247 CH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:50 bar=106450 biasBefore=bullish inBias=2 opp=1 bull=2 bear=1 structStart=106439 structStartT=2026.06.05 08:55 countRef=106439 countRefT=2026.06.05 08:55 lastRelStruct=106439 obInvBound=106439 obInvBoundT=2026.06.05 08:55 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=0 persistOppFVG=0 strong=1 renew=0 weak=0
119248 OK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:50 bar=106450 oppCount=1 drawStructRenewal=0 renewResult=0 inBiasCount=2 drawBiasLine=0 strongResult=1 tickOBIsValid=0 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119251 NL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:50 bar=106450 biasAfterDecision=bearish justChangedBias=0 obInvBound=106450 lastRenewalOB=106432
119258 PI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 09:55 bar=106451 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106450 structStartT=2026.06.05 09:50 countRef=106450 countRefT=2026.06.05 09:50 lastRelStruct=106450 obInvBound=106450 obInvBoundT=2026.06.05 09:50 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
119259 DI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 09:55 bar=106451 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119260 JN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 09:55 bar=106451 biasAfterDecision=bearish justChangedBias=0 obInvBound=106450 lastRenewalOB=106432
119268 CL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC t=2026.06.05 10:00 bar=106452 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106450 structStartT=2026.06.05 09:50 countRef=106450 countRefT=2026.06.05 09:50 lastRelStruct=106450 obInvBound=106450 obInvBoundT=2026.06.05 09:50 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
119269 KL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC3 t=2026.06.05 10:00 bar=106452 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119270 QM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ DEC2 t=2026.06.05 10:00 bar=106452 biasAfterDecision=bearish justChangedBias=0 obInvBound=106450 lastRenewalOB=106432
119289 HE	0	13:32:35.839	Core 04	2026.06.05 10:00:01   SRJ DEC t=2026.06.05 10:00 bar=106452 biasBefore=bearish inBias=0 opp=0 bull=0 bear=0 structStart=106450 structStartT=2026.06.05 09:50 countRef=106450 countRefT=2026.06.05 09:50 lastRelStruct=106450 obInvBound=106450 obInvBoundT=2026.06.05 09:50 lastRenewalOB=106432 justChangedBias=0 isDoubleOB=1 persistOppFVG=0 strong=0 renew=0 weak=0
119290 HE	0	13:32:35.839	Core 04	2026.06.05 10:00:01   SRJ DEC3 t=2026.06.05 10:00 bar=106452 oppCount=0 drawStructRenewal=0 renewResult=0 inBiasCount=0 drawBiasLine=0 strongResult=0 tickOBIsValid=1 tickFVGIsValid=0 hasPersistedOppFVG=0 weakResult=0
119291 FK	0	13:32:35.839	Core 04	2026.06.05 10:00:01   SRJ DEC2 t=2026.06.05 10:00 bar=106452 biasAfterDecision=bearish justChangedBias=0 obInvBound=106450 lastRenewalOB=106432

## C3c HOOP EVT+INV
115079 GM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 02:50 bar=103486 kind=weakFlip bias=bullish resetOn=true
115086 IP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 03:55 bar=103499 kind=fvgRenewal bias=bullish resetOn=true
115099 EG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 05:00 bar=103512 kind=fvgRenewal bias=bullish resetOn=true
115107 FE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 05:35 bar=103519 kind=strongFlip bias=bearish resetOn=true
115112 ID	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 05:45 bar=103521 kind=doRenewal bias=bearish resetOn=true
115114 DL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 05:50 bar=103522 kind=fvgRenewal bias=bearish resetOn=true
115120 LP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 06:15 bar=103527 kind=weakFlip bias=bullish resetOn=true
115127 KG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 07:00 bar=103536 kind=strongFlip bias=bearish resetOn=true
115136 FP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 07:55 bar=103547 kind=strongFlip bias=bullish resetOn=true
115141 LJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 08:25 bar=103553 kind=fvgRenewal bias=bullish resetOn=true
115149 QJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 08:55 bar=103559 kind=doRenewal bias=bullish resetOn=true
115155 QF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 09:15 bar=103563 kind=strongFlip bias=bearish resetOn=true
115168 EM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 10:35 bar=103579 kind=strongFlip bias=bullish resetOn=true
115176 EO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 11:05 bar=103585 kind=strongFlip bias=bearish resetOn=true
115180 GH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 11:10 bar=103586 kind=strongFlip bias=bullish resetOn=true
115185 HD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 11:15 bar=103587 kind=strongFlip bias=bearish resetOn=true
115190 RQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 11:30 bar=103590 kind=strongFlip bias=bullish resetOn=true
115199 LM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 12:15 bar=103599 kind=fvgRenewal bias=bullish resetOn=true
115202 IN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 12:20 bar=103600 kind=fvgRenewal bias=bullish resetOn=true
115207 DR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 12:50 bar=103606 kind=strongFlip bias=bearish resetOn=true
115210 OH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 13:00 bar=103608 kind=fvgRenewal bias=bearish resetOn=true
115218 LI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 13:30 bar=103614 kind=weakFlip bias=bullish resetOn=true
115220 LL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 13:35 bar=103615 kind=fvgRenewal bias=bullish resetOn=true
115226 FN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 14:10 bar=103622 kind=fvgRenewal bias=bullish resetOn=true
115237 EH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 14:55 bar=103631 kind=doRenewal bias=bullish resetOn=true
115246 NQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 15:10 bar=103634 kind=strongFlip bias=bearish resetOn=true
115250 OF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 15:15 bar=103635 kind=fvgRenewal bias=bearish resetOn=true
115254 FQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 15:20 bar=103636 kind=strongFlip bias=bullish resetOn=true
115260 OS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 15:55 bar=103643 kind=strongFlip bias=bearish resetOn=true
115268 HM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 16:05 bar=103645 kind=doRenewal bias=bearish resetOn=true
115270 MG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 16:10 bar=103646 kind=fvgRenewal bias=bearish resetOn=true
115276 PH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 16:35 bar=103651 kind=strongFlip bias=bullish resetOn=true
115281 OK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 17:00 bar=103656 kind=doRenewal bias=bullish resetOn=true
115283 KH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 17:05 bar=103657 kind=fvgRenewal bias=bullish resetOn=true
115293 MR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 17:55 bar=103667 kind=strongFlip bias=bearish resetOn=true
115305 HK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 18:30 bar=103674 kind=strongFlip bias=bullish resetOn=true
115308 KS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 18:35 bar=103675 kind=fvgRenewal bias=bullish resetOn=true
115319 JR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 20:00 bar=103692 kind=weakFlip bias=bearish resetOn=true
115326 JH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 20:25 bar=103697 kind=doRenewal bias=bearish resetOn=true
115329 KO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 20:30 bar=103698 kind=fvgRenewal bias=bearish resetOn=true
115342 GP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 21:25 bar=103709 kind=strongFlip bias=bullish resetOn=true
115353 FN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 22:15 bar=103719 kind=weakFlip bias=bearish resetOn=true
115362 GP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 22:55 bar=103727 kind=strongFlip bias=bullish resetOn=true
115371 NO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 23:35 bar=103735 kind=strongFlip bias=bearish resetOn=true
115377 CN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.22 23:55 bar=103739 kind=doRenewal bias=bearish resetOn=true
115393 EM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 00:00 bar=103740 kind=fvgRenewal bias=bearish resetOn=true
115396 CR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 00:05 bar=103741 kind=fvgRenewal bias=bearish resetOn=true
115411 FJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 01:30 bar=103758 kind=fvgRenewal bias=bearish resetOn=true
115417 LN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 02:15 bar=103767 kind=strongFlip bias=bullish resetOn=true
115422 CI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 02:45 bar=103773 kind=fvgRenewal bias=bullish resetOn=true
115430 OF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 03:45 bar=103785 kind=strongFlip bias=bearish resetOn=true
115432 KH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 03:50 bar=103786 kind=fvgRenewal bias=bearish resetOn=true
115443 OK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 04:10 bar=103790 kind=doRenewal bias=bearish resetOn=true
115446 OI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 04:15 bar=103791 kind=fvgRenewal bias=bearish resetOn=true
115451 FG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 04:45 bar=103797 kind=strongFlip bias=bullish resetOn=true
115465 CJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 06:10 bar=103814 kind=fvgRenewal bias=bullish resetOn=true
115472 QO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 06:40 bar=103820 kind=doRenewal bias=bullish resetOn=true
115475 OI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 06:45 bar=103821 kind=fvgRenewal bias=bullish resetOn=true
115485 JK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 07:05 bar=103825 kind=doRenewal bias=bullish resetOn=true
115495 NI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 08:05 bar=103837 kind=strongFlip bias=bearish resetOn=true
115502 IP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 08:45 bar=103845 kind=weakFlip bias=bullish resetOn=true
115507 HP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 08:55 bar=103847 kind=doRenewal bias=bullish resetOn=true
115509 FP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 09:00 bar=103848 kind=fvgRenewal bias=bullish resetOn=true
115518 LP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 09:35 bar=103855 kind=doRenewal bias=bullish resetOn=true
115524 RQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 09:55 bar=103859 kind=strongFlip bias=bearish resetOn=true
115529 EO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 10:05 bar=103861 kind=strongFlip bias=bullish resetOn=true
115532 KH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 10:10 bar=103862 kind=fvgRenewal bias=bullish resetOn=true
115542 GP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 11:05 bar=103873 kind=weakFlip bias=bearish resetOn=true
115550 DD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 11:45 bar=103881 kind=doRenewal bias=bearish resetOn=true
115557 QI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 12:00 bar=103884 kind=doRenewal bias=bearish resetOn=true
115564 HL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 12:10 bar=103886 kind=strongFlip bias=bullish resetOn=true
115566 IN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 12:15 bar=103887 kind=fvgRenewal bias=bullish resetOn=true
115577 IK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 13:10 bar=103898 kind=doRenewal bias=bullish resetOn=true
115583 OQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 13:30 bar=103902 kind=doRenewal bias=bullish resetOn=true
115591 GI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 14:15 bar=103911 kind=strongFlip bias=bearish resetOn=true
115599 NM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 14:35 bar=103915 kind=fvgRenewal bias=bearish resetOn=true
115605 RJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 15:15 bar=103923 kind=fvgRenewal bias=bearish resetOn=true
115617 NI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 16:15 bar=103935 kind=strongFlip bias=bullish resetOn=true
115623 OE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 16:35 bar=103939 kind=doRenewal bias=bullish resetOn=true
115626 HR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 16:50 bar=103942 kind=fvgRenewal bias=bullish resetOn=true
115633 GM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 17:40 bar=103952 kind=strongFlip bias=bearish resetOn=true
115639 CN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 18:00 bar=103956 kind=strongFlip bias=bullish resetOn=true
115643 NI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 18:05 bar=103957 kind=doRenewal bias=bullish resetOn=true
115651 GP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 18:25 bar=103961 kind=strongFlip bias=bearish resetOn=true
115656 EP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 18:50 bar=103966 kind=doRenewal bias=bearish resetOn=true
115662 KO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 19:00 bar=103968 kind=strongFlip bias=bullish resetOn=true
115664 RS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 19:05 bar=103969 kind=fvgRenewal bias=bullish resetOn=true
115677 OE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 20:30 bar=103986 kind=strongFlip bias=bearish resetOn=true
115684 NL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 21:25 bar=103997 kind=weakFlip bias=bullish resetOn=true
115694 LL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 22:20 bar=104008 kind=strongFlip bias=bearish resetOn=true
115700 OM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 22:30 bar=104010 kind=strongFlip bias=bullish resetOn=true
115708 NR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 22:50 bar=104014 kind=fvgRenewal bias=bullish resetOn=true
115711 HO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 22:55 bar=104015 kind=fvgRenewal bias=bullish resetOn=true
115720 QL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 23:25 bar=104021 kind=fvgRenewal bias=bullish resetOn=true
115727 JH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 23:50 bar=104026 kind=strongFlip bias=bearish resetOn=true
115734 OD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.25 23:55 bar=104027 kind=doRenewal bias=bearish resetOn=true
115742 HL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 00:00 bar=104028 kind=fvgRenewal bias=bearish resetOn=true
115745 FM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 00:05 bar=104029 kind=fvgRenewal bias=bearish resetOn=true
115752 HE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 00:30 bar=104034 kind=strongFlip bias=bullish resetOn=true
115762 DH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 01:00 bar=104040 kind=doRenewal bias=bullish resetOn=true
115764 HH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 01:05 bar=104041 kind=fvgRenewal bias=bullish resetOn=true
115770 GI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 01:30 bar=104046 kind=fvgRenewal bias=bullish resetOn=true
115778 DM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 02:20 bar=104056 kind=doRenewal bias=bullish resetOn=true
115782 JK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 02:25 bar=104057 kind=fvgRenewal bias=bullish resetOn=true
115790 DQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 03:00 bar=104064 kind=strongFlip bias=bearish resetOn=true
115796 LS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 03:10 bar=104066 kind=strongFlip bias=bullish resetOn=true
115798 JG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 03:20 bar=104068 kind=fvgRenewal bias=bullish resetOn=true
115807 FH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 04:10 bar=104078 kind=weakFlip bias=bearish resetOn=true
115811 HN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 04:15 bar=104079 kind=fvgRenewal bias=bearish resetOn=true
115822 MD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 05:15 bar=104091 kind=doRenewal bias=bearish resetOn=true
115829 PN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 05:40 bar=104096 kind=strongFlip bias=bullish resetOn=true
115831 MP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 05:45 bar=104097 kind=fvgRenewal bias=bullish resetOn=true
115837 JG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 05:55 bar=104099 kind=strongFlip bias=bearish resetOn=true
115839 MJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 06:00 bar=104100 kind=fvgRenewal bias=bearish resetOn=true
115844 KF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 06:20 bar=104104 kind=doRenewal bias=bearish resetOn=true
115850 QJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 06:50 bar=104110 kind=strongFlip bias=bullish resetOn=true
115853 JP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 07:20 bar=104116 kind=fvgRenewal bias=bullish resetOn=true
115861 OL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 07:45 bar=104121 kind=fvgRenewal bias=bullish resetOn=true
115863 HQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 07:50 bar=104122 kind=fvgRenewal bias=bullish resetOn=true
115867 RG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 07:55 bar=104123 kind=doRenewal bias=bullish resetOn=true
115873 FO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 08:55 bar=104135 kind=fvgRenewal bias=bullish resetOn=true
115877 NE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 09:00 bar=104136 kind=fvgRenewal bias=bullish resetOn=true
115884 JD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 09:30 bar=104142 kind=doRenewal bias=bullish resetOn=true
115891 NF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 09:55 bar=104147 kind=doRenewal bias=bullish resetOn=true
115897 EG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 10:00 bar=104148 kind=fvgRenewal bias=bullish resetOn=true
115905 RH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 10:20 bar=104152 kind=doRenewal bias=bullish resetOn=true
115912 LR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 11:00 bar=104160 kind=doRenewal bias=bullish resetOn=true
115914 PQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 11:05 bar=104161 kind=fvgRenewal bias=bullish resetOn=true
115924 LQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 11:45 bar=104169 kind=strongFlip bias=bearish resetOn=true
115926 EE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 11:50 bar=104170 kind=fvgRenewal bias=bearish resetOn=true
115933 PP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 12:10 bar=104174 kind=doRenewal bias=bearish resetOn=true
115937 HF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 12:15 bar=104175 kind=doRenewal bias=bearish resetOn=true
115947 CL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 12:55 bar=104183 kind=fvgRenewal bias=bearish resetOn=true
115951 NM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 13:15 bar=104187 kind=fvgRenewal bias=bearish resetOn=true
115958 IE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 13:30 bar=104190 kind=fvgRenewal bias=bearish resetOn=true
115966 OR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 14:25 bar=104201 kind=strongFlip bias=bullish resetOn=true
115970 GE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 14:35 bar=104203 kind=doRenewal bias=bullish resetOn=true
115976 IS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 15:10 bar=104210 kind=doRenewal bias=bullish resetOn=true
115981 RD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 15:20 bar=104212 kind=doRenewal bias=bullish resetOn=true
115987 GR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 15:55 bar=104219 kind=doRenewal bias=bullish resetOn=true
115989 HN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 16:00 bar=104220 kind=fvgRenewal bias=bullish resetOn=true
115991 FS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 16:05 bar=104221 kind=fvgRenewal bias=bullish resetOn=true
116000 MP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 16:30 bar=104226 kind=fvgRenewal bias=bullish resetOn=true
116007 LG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 17:05 bar=104233 kind=strongFlip bias=bearish resetOn=true
116015 QQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 17:50 bar=104242 kind=strongFlip bias=bullish resetOn=true
116017 HE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 17:55 bar=104243 kind=fvgRenewal bias=bullish resetOn=true
116023 FR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 18:20 bar=104248 kind=fvgRenewal bias=bullish resetOn=true
116030 KK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 18:40 bar=104252 kind=fvgRenewal bias=bullish resetOn=true
116035 FH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 19:05 bar=104257 kind=strongFlip bias=bearish resetOn=true
116045 FF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 20:00 bar=104268 kind=fvgRenewal bias=bearish resetOn=true
116050 JE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 20:35 bar=104275 kind=strongFlip bias=bullish resetOn=true
116052 MI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 20:50 bar=104278 kind=fvgRenewal bias=bullish resetOn=true
116056 RS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 21:10 bar=104282 kind=weakFlip bias=bearish resetOn=true
116064 QS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 21:45 bar=104289 kind=doRenewal bias=bearish resetOn=true
116074 HM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 22:35 bar=104299 kind=fvgRenewal bias=bearish resetOn=true
116079 DD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 22:50 bar=104302 kind=doRenewal bias=bearish resetOn=true
116083 HD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 22:55 bar=104303 kind=strongFlip bias=bullish resetOn=true
116093 MS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 23:35 bar=104311 kind=doRenewal bias=bullish resetOn=true
116100 QH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.26 23:55 bar=104315 kind=strongFlip bias=bearish resetOn=true
116102 QJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 00:00 bar=104316 kind=fvgRenewal bias=bearish resetOn=true
116108 ER	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 00:50 bar=104326 kind=fvgRenewal bias=bearish resetOn=true
116112 IR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 01:00 bar=104328 kind=doRenewal bias=bearish resetOn=true
116121 OF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 01:55 bar=104339 kind=fvgRenewal bias=bearish resetOn=true
116127 JG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 02:20 bar=104344 kind=doRenewal bias=bearish resetOn=true
116130 JM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 02:25 bar=104345 kind=fvgRenewal bias=bearish resetOn=true
116136 DL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 02:40 bar=104348 kind=doRenewal bias=bearish resetOn=true
116144 PE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 03:20 bar=104356 kind=doRenewal bias=bearish resetOn=true
116149 QQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 03:30 bar=104358 kind=strongFlip bias=bullish resetOn=true
116152 FH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 03:35 bar=104359 kind=fvgRenewal bias=bullish resetOn=true
116159 QR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 03:50 bar=104362 kind=doRenewal bias=bullish resetOn=true
116162 OE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 03:55 bar=104363 kind=fvgRenewal bias=bullish resetOn=true
116168 PR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 04:05 bar=104365 kind=weakFlip bias=bearish resetOn=true
116176 FK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 04:35 bar=104371 kind=strongFlip bias=bullish resetOn=true
116182 EK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 04:55 bar=104375 kind=fvgRenewal bias=bullish resetOn=true
116192 LO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 05:45 bar=104385 kind=strongFlip bias=bearish resetOn=true
116196 HG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 06:00 bar=104388 kind=doRenewal bias=bearish resetOn=true
116205 JE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 06:55 bar=104399 kind=doRenewal bias=bearish resetOn=true
116214 FF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 07:25 bar=104405 kind=strongFlip bias=bullish resetOn=true
116217 GO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 07:40 bar=104408 kind=fvgRenewal bias=bullish resetOn=true
116224 NP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 08:35 bar=104419 kind=fvgRenewal bias=bullish resetOn=true
116229 DL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 08:45 bar=104421 kind=doRenewal bias=bullish resetOn=true
116231 IG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 08:50 bar=104422 kind=fvgRenewal bias=bullish resetOn=true
116235 EM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 09:00 bar=104424 kind=fvgRenewal bias=bullish resetOn=true
116242 FR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 09:45 bar=104433 kind=strongFlip bias=bearish resetOn=true
116249 CH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 10:25 bar=104441 kind=weakFlip bias=bullish resetOn=true
116253 KR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 10:35 bar=104443 kind=weakFlip bias=bearish resetOn=true
116257 FM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 10:50 bar=104446 kind=weakFlip bias=bullish resetOn=true
116267 DO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 11:10 bar=104450 kind=doRenewal bias=bullish resetOn=true
116269 PE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 11:15 bar=104451 kind=fvgRenewal bias=bullish resetOn=true
116277 FR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 12:15 bar=104463 kind=strongFlip bias=bearish resetOn=true
116286 HO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 12:55 bar=104471 kind=strongFlip bias=bullish resetOn=true
116293 QR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 13:25 bar=104477 kind=fvgRenewal bias=bullish resetOn=true
116304 CF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 14:25 bar=104489 kind=fvgRenewal bias=bullish resetOn=true
116308 IR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 14:30 bar=104490 kind=fvgRenewal bias=bullish resetOn=true
116314 GJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 14:50 bar=104494 kind=doRenewal bias=bullish resetOn=true
116320 MF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 15:05 bar=104497 kind=strongFlip bias=bearish resetOn=true
116329 RP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 15:20 bar=104500 kind=doRenewal bias=bearish resetOn=true
116333 NI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 15:25 bar=104501 kind=strongFlip bias=bullish resetOn=true
116341 LL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 15:50 bar=104506 kind=doRenewal bias=bullish resetOn=true
116346 HN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 15:55 bar=104507 kind=doRenewal bias=bullish resetOn=true
116355 FN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 16:30 bar=104514 kind=strongFlip bias=bearish resetOn=true
116365 IN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 17:10 bar=104522 kind=doRenewal bias=bearish resetOn=true
116369 MI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 17:15 bar=104523 kind=fvgRenewal bias=bearish resetOn=true
116374 DE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 17:20 bar=104524 kind=strongFlip bias=bullish resetOn=true
116381 FD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 17:30 bar=104526 kind=doRenewal bias=bullish resetOn=true
116383 JL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 17:35 bar=104527 kind=fvgRenewal bias=bullish resetOn=true
116388 EP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 17:50 bar=104530 kind=fvgRenewal bias=bullish resetOn=true
116398 LM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 18:45 bar=104541 kind=doRenewal bias=bullish resetOn=true
116402 IJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 19:05 bar=104545 kind=fvgRenewal bias=bullish resetOn=true
116412 QJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 20:10 bar=104558 kind=fvgRenewal bias=bullish resetOn=true
116417 PF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 21:05 bar=104569 kind=fvgRenewal bias=bullish resetOn=true
116423 GJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 21:25 bar=104573 kind=strongFlip bias=bearish resetOn=true
116428 JF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 21:40 bar=104576 kind=doRenewal bias=bearish resetOn=true
116431 JN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 21:45 bar=104577 kind=fvgRenewal bias=bearish resetOn=true
116441 NE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 22:45 bar=104589 kind=strongFlip bias=bullish resetOn=true
116445 LO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 23:05 bar=104593 kind=weakFlip bias=bearish resetOn=true
116450 CN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 23:45 bar=104601 kind=weakFlip bias=bullish resetOn=true
116455 FK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.27 23:55 bar=104603 kind=strongFlip bias=bearish resetOn=true
116465 FD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 00:00 bar=104604 kind=fvgRenewal bias=bearish resetOn=true
116468 HE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 00:05 bar=104605 kind=fvgRenewal bias=bearish resetOn=true
116477 JF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 01:00 bar=104616 kind=strongFlip bias=bullish resetOn=true
116485 JN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 01:45 bar=104625 kind=doRenewal bias=bullish resetOn=true
116488 EI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 01:50 bar=104626 kind=fvgRenewal bias=bullish resetOn=true
116497 FG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 02:20 bar=104632 kind=doRenewal bias=bullish resetOn=true
116499 RM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 02:25 bar=104633 kind=fvgRenewal bias=bullish resetOn=true
116507 DL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 02:40 bar=104636 kind=doRenewal bias=bullish resetOn=true
116512 IN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 02:50 bar=104638 kind=doRenewal bias=bullish resetOn=true
116524 IO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 03:30 bar=104646 kind=doRenewal bias=bullish resetOn=true
116528 PJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 03:55 bar=104651 kind=strongFlip bias=bearish resetOn=true
116537 LR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 04:55 bar=104663 kind=weakFlip bias=bullish resetOn=true
116541 FL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 05:15 bar=104667 kind=weakFlip bias=bearish resetOn=true
116546 KG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 05:20 bar=104668 kind=fvgRenewal bias=bearish resetOn=true
116551 IH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 05:40 bar=104672 kind=weakFlip bias=bullish resetOn=true
116558 QJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 06:15 bar=104679 kind=fvgRenewal bias=bullish resetOn=true
116563 RF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 06:30 bar=104682 kind=doRenewal bias=bullish resetOn=true
116570 FN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 07:10 bar=104690 kind=strongFlip bias=bearish resetOn=true
116581 LJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 08:35 bar=104707 kind=doRenewal bias=bearish resetOn=true
116585 GF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 09:05 bar=104713 kind=fvgRenewal bias=bearish resetOn=true
116591 NF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 09:35 bar=104719 kind=doRenewal bias=bearish resetOn=true
116605 JS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 10:25 bar=104729 kind=strongFlip bias=bullish resetOn=true
116609 IK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 10:30 bar=104730 kind=fvgRenewal bias=bullish resetOn=true
116618 CR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 10:50 bar=104734 kind=strongFlip bias=bearish resetOn=true
116623 RM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 11:00 bar=104736 kind=fvgRenewal bias=bearish resetOn=true
116627 LH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 11:05 bar=104737 kind=doRenewal bias=bearish resetOn=true
116631 HD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 11:15 bar=104739 kind=weakFlip bias=bullish resetOn=true
116637 KH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 11:30 bar=104742 kind=doRenewal bias=bullish resetOn=true
116641 IP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 11:40 bar=104744 kind=weakFlip bias=bearish resetOn=true
116646 DE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 12:15 bar=104751 kind=fvgRenewal bias=bearish resetOn=true
116653 MD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 12:40 bar=104756 kind=doRenewal bias=bearish resetOn=true
116659 LL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 12:55 bar=104759 kind=strongFlip bias=bullish resetOn=true
116664 DI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 13:05 bar=104761 kind=strongFlip bias=bearish resetOn=true
116674 QR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 13:40 bar=104768 kind=strongFlip bias=bullish resetOn=true
116681 PE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 14:25 bar=104777 kind=doRenewal bias=bullish resetOn=true
116690 MQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 15:10 bar=104786 kind=strongFlip bias=bearish resetOn=true
116698 QG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 15:30 bar=104790 kind=fvgRenewal bias=bearish resetOn=true
116707 CH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 16:15 bar=104799 kind=weakFlip bias=bullish resetOn=true
116714 CO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 16:30 bar=104802 kind=doRenewal bias=bullish resetOn=true
116717 II	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 16:35 bar=104803 kind=fvgRenewal bias=bullish resetOn=true
116723 QG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 17:00 bar=104808 kind=fvgRenewal bias=bullish resetOn=true
116734 KJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 17:10 bar=104810 kind=strongFlip bias=bearish resetOn=true
116740 PG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 17:15 bar=104811 kind=fvgRenewal bias=bearish resetOn=true
116742 PI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 17:15 bar=104811 kind=strongFlip bias=bullish resetOn=true
116751 MG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 17:55 bar=104819 kind=strongFlip bias=bearish resetOn=true
116753 CJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 18:00 bar=104820 kind=fvgRenewal bias=bearish resetOn=true
116757 MJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 18:05 bar=104821 kind=doRenewal bias=bearish resetOn=true
116765 LS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 18:40 bar=104828 kind=weakFlip bias=bullish resetOn=true
116771 DK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 19:00 bar=104832 kind=doRenewal bias=bullish resetOn=true
116776 HS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 19:20 bar=104836 kind=strongFlip bias=bearish resetOn=true
116779 IK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 19:25 bar=104837 kind=fvgRenewal bias=bearish resetOn=true
116783 MD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 19:35 bar=104839 kind=weakFlip bias=bullish resetOn=true
116793 CF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 20:50 bar=104854 kind=doRenewal bias=bullish resetOn=true
116802 NK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 21:20 bar=104860 kind=doRenewal bias=bullish resetOn=true
116807 KH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 21:30 bar=104862 kind=fvgRenewal bias=bullish resetOn=true
116814 KQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 22:05 bar=104869 kind=fvgRenewal bias=bullish resetOn=true
116818 JJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 22:25 bar=104873 kind=strongFlip bias=bearish resetOn=true
116824 EM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 23:15 bar=104883 kind=weakFlip bias=bullish resetOn=true
116827 LD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 23:25 bar=104885 kind=fvgRenewal bias=bullish resetOn=true
116836 LF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.28 23:55 bar=104891 kind=strongFlip bias=bearish resetOn=true
116841 DL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 00:00 bar=104892 kind=doRenewal bias=bearish resetOn=true
116858 KP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 02:10 bar=104918 kind=weakFlip bias=bullish resetOn=true
116862 RJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 02:25 bar=104921 kind=weakFlip bias=bearish resetOn=true
116869 PO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 02:40 bar=104924 kind=strongFlip bias=bullish resetOn=true
116876 DJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 02:55 bar=104927 kind=doRenewal bias=bullish resetOn=true
116881 JN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 03:05 bar=104929 kind=fvgRenewal bias=bullish resetOn=true
116887 LO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 03:30 bar=104934 kind=fvgRenewal bias=bullish resetOn=true
116896 IK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 04:05 bar=104941 kind=strongFlip bias=bearish resetOn=true
116902 DM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 04:45 bar=104949 kind=strongFlip bias=bullish resetOn=true
116910 QH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 05:40 bar=104960 kind=weakFlip bias=bearish resetOn=true
116912 IJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 05:45 bar=104961 kind=fvgRenewal bias=bearish resetOn=true
116917 NI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 05:55 bar=104963 kind=strongFlip bias=bullish resetOn=true
116921 MN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 06:00 bar=104964 kind=fvgRenewal bias=bullish resetOn=true
116930 FL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 06:40 bar=104972 kind=doRenewal bias=bullish resetOn=true
116938 GL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 07:35 bar=104983 kind=strongFlip bias=bearish resetOn=true
116943 EG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 07:40 bar=104984 kind=doRenewal bias=bearish resetOn=true
116946 MI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 07:45 bar=104985 kind=fvgRenewal bias=bearish resetOn=true
116952 DP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 08:10 bar=104990 kind=doRenewal bias=bearish resetOn=true
116955 DD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 08:15 bar=104991 kind=fvgRenewal bias=bearish resetOn=true
116964 GE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 08:45 bar=104997 kind=fvgRenewal bias=bearish resetOn=true
116967 LJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 08:55 bar=104999 kind=strongFlip bias=bullish resetOn=true
116978 DM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 09:40 bar=105008 kind=strongFlip bias=bearish resetOn=true
116981 CI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 09:45 bar=105009 kind=fvgRenewal bias=bearish resetOn=true
116988 KO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 09:55 bar=105011 kind=fvgRenewal bias=bearish resetOn=true
116995 LG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 10:05 bar=105013 kind=strongFlip bias=bullish resetOn=true
117001 EG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 10:20 bar=105016 kind=doRenewal bias=bullish resetOn=true
117005 LQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 10:30 bar=105018 kind=fvgRenewal bias=bullish resetOn=true
117011 RS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 11:00 bar=105024 kind=weakFlip bias=bearish resetOn=true
117020 JP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 11:50 bar=105034 kind=strongFlip bias=bullish resetOn=true
117022 CR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 11:55 bar=105035 kind=fvgRenewal bias=bullish resetOn=true
117029 PM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 12:15 bar=105039 kind=strongFlip bias=bearish resetOn=true
117038 JJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 12:35 bar=105043 kind=strongFlip bias=bullish resetOn=true
117045 MM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 13:00 bar=105048 kind=fvgRenewal bias=bullish resetOn=true
117049 ME	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 13:05 bar=105049 kind=strongFlip bias=bearish resetOn=true
117057 LM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 13:30 bar=105054 kind=doRenewal bias=bearish resetOn=true
117064 RI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 13:50 bar=105058 kind=strongFlip bias=bullish resetOn=true
117072 KL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 14:20 bar=105064 kind=weakFlip bias=bearish resetOn=true
117077 JM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 14:30 bar=105066 kind=strongFlip bias=bullish resetOn=true
117080 ES	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 14:45 bar=105069 kind=weakFlip bias=bearish resetOn=true
117085 CN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 14:55 bar=105071 kind=doRenewal bias=bearish resetOn=true
117091 MS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 15:35 bar=105079 kind=weakFlip bias=bullish resetOn=true
117100 NJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 16:30 bar=105090 kind=doRenewal bias=bullish resetOn=true
117103 IJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 16:40 bar=105092 kind=strongFlip bias=bearish resetOn=true
117114 PM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 17:10 bar=105098 kind=strongFlip bias=bullish resetOn=true
117116 QQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 17:15 bar=105099 kind=fvgRenewal bias=bullish resetOn=true
117128 CJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 17:50 bar=105106 kind=strongFlip bias=bearish resetOn=true
117133 PE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 18:00 bar=105108 kind=doRenewal bias=bearish resetOn=true
117138 PI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 18:05 bar=105109 kind=doRenewal bias=bearish resetOn=true
117149 OM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 19:05 bar=105121 kind=strongFlip bias=bullish resetOn=true
117158 PK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 19:35 bar=105127 kind=weakFlip bias=bearish resetOn=true
117167 QL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 20:20 bar=105136 kind=weakFlip bias=bullish resetOn=true
117170 CF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 20:25 bar=105137 kind=fvgRenewal bias=bullish resetOn=true
117179 CF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 20:50 bar=105142 kind=doRenewal bias=bullish resetOn=true
117182 CM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 20:55 bar=105143 kind=fvgRenewal bias=bullish resetOn=true
117189 GG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 21:35 bar=105151 kind=strongFlip bias=bearish resetOn=true
117195 DR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 21:50 bar=105154 kind=doRenewal bias=bearish resetOn=true
117203 QE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 22:15 bar=105159 kind=strongFlip bias=bullish resetOn=true
117215 GQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 23:15 bar=105171 kind=doRenewal bias=bullish resetOn=true
117221 IR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.05.29 23:55 bar=105179 kind=strongFlip bias=bearish resetOn=true
117228 FD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 00:00 bar=105180 kind=strongFlip bias=bullish resetOn=true
117231 QJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 00:05 bar=105181 kind=fvgRenewal bias=bullish resetOn=true
117240 KF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 00:50 bar=105190 kind=fvgRenewal bias=bullish resetOn=true
117244 CN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 01:00 bar=105192 kind=doRenewal bias=bullish resetOn=true
117251 PE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 01:30 bar=105198 kind=fvgRenewal bias=bullish resetOn=true
117258 MO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 02:05 bar=105205 kind=weakFlip bias=bearish resetOn=true
117265 KR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 02:30 bar=105210 kind=fvgRenewal bias=bearish resetOn=true
117269 HO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 02:45 bar=105213 kind=fvgRenewal bias=bearish resetOn=true
117274 FQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 03:00 bar=105216 kind=weakFlip bias=bullish resetOn=true
117278 HF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 03:05 bar=105217 kind=fvgRenewal bias=bullish resetOn=true
117280 CJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 03:10 bar=105218 kind=fvgRenewal bias=bullish resetOn=true
117287 NJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 03:50 bar=105226 kind=doRenewal bias=bullish resetOn=true
117293 KH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 04:25 bar=105233 kind=doRenewal bias=bullish resetOn=true
117302 ND	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 05:10 bar=105242 kind=strongFlip bias=bearish resetOn=true
117313 DE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 05:55 bar=105251 kind=doRenewal bias=bearish resetOn=true
117318 QQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 06:20 bar=105256 kind=weakFlip bias=bullish resetOn=true
117326 HR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 07:45 bar=105273 kind=doRenewal bias=bullish resetOn=true
117331 JJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 08:00 bar=105276 kind=weakFlip bias=bearish resetOn=true
117338 DO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 08:55 bar=105287 kind=doRenewal bias=bearish resetOn=true
117346 PQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 09:10 bar=105290 kind=strongFlip bias=bullish resetOn=true
117348 IE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 09:15 bar=105291 kind=fvgRenewal bias=bullish resetOn=true
117352 PS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 09:20 bar=105292 kind=doRenewal bias=bullish resetOn=true
117360 MS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 09:55 bar=105299 kind=strongFlip bias=bearish resetOn=true
117367 DJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 10:40 bar=105308 kind=weakFlip bias=bullish resetOn=true
117370 NS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 10:45 bar=105309 kind=fvgRenewal bias=bullish resetOn=true
117379 JS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 11:25 bar=105317 kind=strongFlip bias=bearish resetOn=true
117387 QL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 12:05 bar=105325 kind=strongFlip bias=bullish resetOn=true
117390 CR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 12:10 bar=105326 kind=fvgRenewal bias=bullish resetOn=true
117397 FS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 12:30 bar=105330 kind=doRenewal bias=bullish resetOn=true
117401 RG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 12:40 bar=105332 kind=weakFlip bias=bearish resetOn=true
117408 IM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 13:15 bar=105339 kind=weakFlip bias=bullish resetOn=true
117415 JF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 13:35 bar=105343 kind=strongFlip bias=bearish resetOn=true
117420 RP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 13:45 bar=105345 kind=fvgRenewal bias=bearish resetOn=true
117424 OI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 14:00 bar=105348 kind=strongFlip bias=bullish resetOn=true
117432 EJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 15:05 bar=105361 kind=doRenewal bias=bullish resetOn=true
117440 CL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 15:25 bar=105365 kind=strongFlip bias=bearish resetOn=true
117442 GN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 15:30 bar=105366 kind=fvgRenewal bias=bearish resetOn=true
117451 DN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 15:55 bar=105371 kind=strongFlip bias=bullish resetOn=true
117455 QI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 16:00 bar=105372 kind=doRenewal bias=bullish resetOn=true
117463 NK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 16:10 bar=105374 kind=doRenewal bias=bullish resetOn=true
117472 CR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 17:05 bar=105385 kind=strongFlip bias=bearish resetOn=true
117483 NI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 18:05 bar=105397 kind=doRenewal bias=bearish resetOn=true
117486 GJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 18:10 bar=105398 kind=fvgRenewal bias=bearish resetOn=true
117495 LM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 18:45 bar=105405 kind=strongFlip bias=bullish resetOn=true
117497 PQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 18:50 bar=105406 kind=fvgRenewal bias=bullish resetOn=true
117503 LN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 19:10 bar=105410 kind=fvgRenewal bias=bullish resetOn=true
117511 LH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 19:50 bar=105418 kind=strongFlip bias=bearish resetOn=true
117516 IK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 20:25 bar=105425 kind=doRenewal bias=bearish resetOn=true
117519 HM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 20:30 bar=105426 kind=fvgRenewal bias=bearish resetOn=true
117527 EF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 21:00 bar=105432 kind=strongFlip bias=bullish resetOn=true
117534 PL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 21:20 bar=105436 kind=strongFlip bias=bearish resetOn=true
117539 KI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 21:25 bar=105437 kind=strongFlip bias=bullish resetOn=true
117542 MQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 21:30 bar=105438 kind=fvgRenewal bias=bullish resetOn=true
117548 IN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 21:45 bar=105441 kind=fvgRenewal bias=bullish resetOn=true
117553 FI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 21:50 bar=105442 kind=fvgRenewal bias=bullish resetOn=true
117559 NK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 21:55 bar=105443 kind=fvgRenewal bias=bullish resetOn=true
117567 PD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 23:00 bar=105456 kind=strongFlip bias=bearish resetOn=true
117578 QG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.01 23:55 bar=105467 kind=doRenewal bias=bearish resetOn=true
117585 RI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 00:00 bar=105468 kind=fvgRenewal bias=bearish resetOn=true
117591 JR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 00:05 bar=105469 kind=fvgRenewal bias=bearish resetOn=true
117601 CF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 00:40 bar=105476 kind=doRenewal bias=bearish resetOn=true
117605 JR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 01:00 bar=105480 kind=weakFlip bias=bullish resetOn=true
117615 CG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 01:30 bar=105486 kind=fvgRenewal bias=bullish resetOn=true
117622 OK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 02:15 bar=105495 kind=strongFlip bias=bearish resetOn=true
117627 QG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 02:40 bar=105500 kind=fvgRenewal bias=bearish resetOn=true
117633 NG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 03:05 bar=105505 kind=strongFlip bias=bullish resetOn=true
117641 OI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 03:20 bar=105508 kind=doRenewal bias=bullish resetOn=true
117649 ON	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 03:55 bar=105515 kind=strongFlip bias=bearish resetOn=true
117652 FD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 04:00 bar=105516 kind=fvgRenewal bias=bearish resetOn=true
117656 IP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 04:10 bar=105518 kind=doRenewal bias=bearish resetOn=true
117662 PP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 04:35 bar=105523 kind=strongFlip bias=bullish resetOn=true
117667 EK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 04:50 bar=105526 kind=fvgRenewal bias=bullish resetOn=true
117672 OO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 05:35 bar=105535 kind=fvgRenewal bias=bullish resetOn=true
117677 NH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 05:40 bar=105536 kind=fvgRenewal bias=bullish resetOn=true
117683 RJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 06:05 bar=105541 kind=strongFlip bias=bearish resetOn=true
117690 JL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 06:35 bar=105547 kind=fvgRenewal bias=bearish resetOn=true
117695 JP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 06:45 bar=105549 kind=weakFlip bias=bullish resetOn=true
117700 HH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 06:50 bar=105550 kind=fvgRenewal bias=bullish resetOn=true
117708 QS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 07:30 bar=105558 kind=strongFlip bias=bearish resetOn=true
117715 QI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 07:55 bar=105563 kind=strongFlip bias=bullish resetOn=true
117725 DJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 09:00 bar=105576 kind=strongFlip bias=bearish resetOn=true
117728 MP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 09:05 bar=105577 kind=fvgRenewal bias=bearish resetOn=true
117732 RD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 09:10 bar=105578 kind=doRenewal bias=bearish resetOn=true
117734 FL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 09:15 bar=105579 kind=fvgRenewal bias=bearish resetOn=true
117743 CE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 09:35 bar=105583 kind=strongFlip bias=bullish resetOn=true
117748 GO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 09:40 bar=105584 kind=fvgRenewal bias=bullish resetOn=true
117752 OH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 09:55 bar=105587 kind=weakFlip bias=bearish resetOn=true
117761 OH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 10:45 bar=105597 kind=doRenewal bias=bearish resetOn=true
117768 FR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 11:00 bar=105600 kind=doRenewal bias=bearish resetOn=true
117774 LM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 11:25 bar=105605 kind=strongFlip bias=bullish resetOn=true
117782 OM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 12:00 bar=105612 kind=fvgRenewal bias=bullish resetOn=true
117789 ME	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 12:25 bar=105617 kind=strongFlip bias=bearish resetOn=true
117793 QJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 12:30 bar=105618 kind=fvgRenewal bias=bearish resetOn=true
117800 DD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 12:55 bar=105623 kind=strongFlip bias=bullish resetOn=true
117802 KI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 13:00 bar=105624 kind=fvgRenewal bias=bullish resetOn=true
117808 DN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 13:25 bar=105629 kind=weakFlip bias=bearish resetOn=true
117817 NE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 14:05 bar=105637 kind=doRenewal bias=bearish resetOn=true
117823 LM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 14:30 bar=105642 kind=strongFlip bias=bullish resetOn=true
117830 EL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 15:05 bar=105649 kind=doRenewal bias=bullish resetOn=true
117836 QJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 15:30 bar=105654 kind=doRenewal bias=bullish resetOn=true
117844 MP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 16:15 bar=105663 kind=doRenewal bias=bullish resetOn=true
117848 KS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 16:30 bar=105666 kind=fvgRenewal bias=bullish resetOn=true
117858 NG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 17:05 bar=105673 kind=fvgRenewal bias=bullish resetOn=true
117862 DD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 17:20 bar=105676 kind=fvgRenewal bias=bullish resetOn=true
117868 LH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 17:40 bar=105680 kind=weakFlip bias=bearish resetOn=true
117872 PR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 18:00 bar=105684 kind=weakFlip bias=bullish resetOn=true
117879 PG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 18:30 bar=105690 kind=fvgRenewal bias=bullish resetOn=true
117887 HS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 18:55 bar=105695 kind=strongFlip bias=bearish resetOn=true
117892 RR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 19:25 bar=105701 kind=weakFlip bias=bullish resetOn=true
117896 LO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 20:10 bar=105710 kind=fvgRenewal bias=bullish resetOn=true
117902 KL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 20:40 bar=105716 kind=fvgRenewal bias=bullish resetOn=true
117910 FH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 21:40 bar=105728 kind=weakFlip bias=bearish resetOn=true
117917 MO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 22:10 bar=105734 kind=doRenewal bias=bearish resetOn=true
117924 QN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 22:35 bar=105739 kind=strongFlip bias=bullish resetOn=true
117931 MH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 22:50 bar=105742 kind=fvgRenewal bias=bullish resetOn=true
117935 GI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 22:55 bar=105743 kind=fvgRenewal bias=bullish resetOn=true
117948 OR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.02 23:55 bar=105755 kind=strongFlip bias=bearish resetOn=true
117950 KD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 00:00 bar=105756 kind=fvgRenewal bias=bearish resetOn=true
117957 LP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 00:15 bar=105759 kind=strongFlip bias=bullish resetOn=true
117965 JE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 01:10 bar=105770 kind=doRenewal bias=bullish resetOn=true
117972 HO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 01:55 bar=105779 kind=fvgRenewal bias=bullish resetOn=true
117976 QI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 02:00 bar=105780 kind=doRenewal bias=bullish resetOn=true
117983 PJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 02:35 bar=105787 kind=doRenewal bias=bullish resetOn=true
117989 FN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 03:05 bar=105793 kind=weakFlip bias=bearish resetOn=true
117994 DH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 03:25 bar=105797 kind=fvgRenewal bias=bearish resetOn=true
117996 KM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 03:30 bar=105798 kind=fvgRenewal bias=bearish resetOn=true
118001 IN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 03:45 bar=105801 kind=weakFlip bias=bullish resetOn=true
118009 JG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 04:20 bar=105808 kind=strongFlip bias=bearish resetOn=true
118014 EQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 04:25 bar=105809 kind=fvgRenewal bias=bearish resetOn=true
118024 FD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 04:40 bar=105812 kind=fvgRenewal bias=bearish resetOn=true
118031 IM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 05:05 bar=105817 kind=fvgRenewal bias=bearish resetOn=true
118039 EG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 05:45 bar=105825 kind=weakFlip bias=bullish resetOn=true
118041 LK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 05:50 bar=105826 kind=fvgRenewal bias=bullish resetOn=true
118048 FO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 06:30 bar=105834 kind=fvgRenewal bias=bullish resetOn=true
118056 QH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 07:15 bar=105843 kind=weakFlip bias=bearish resetOn=true
118063 GQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 07:30 bar=105846 kind=strongFlip bias=bullish resetOn=true
118068 CM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 07:40 bar=105848 kind=strongFlip bias=bearish resetOn=true
118077 NL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 08:20 bar=105856 kind=strongFlip bias=bullish resetOn=true
118083 KH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 08:25 bar=105857 kind=fvgRenewal bias=bullish resetOn=true
118090 FR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 08:45 bar=105861 kind=fvgRenewal bias=bullish resetOn=true
118095 MS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 08:55 bar=105863 kind=fvgRenewal bias=bullish resetOn=true
118102 LE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 09:10 bar=105866 kind=doRenewal bias=bullish resetOn=true
118110 DK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 10:00 bar=105876 kind=doRenewal bias=bullish resetOn=true
118115 IM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 10:15 bar=105879 kind=doRenewal bias=bullish resetOn=true
118118 CK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 10:25 bar=105881 kind=fvgRenewal bias=bullish resetOn=true
118133 FQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 10:30 bar=105882 kind=strongFlip bias=bearish resetOn=true
118137 GF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 10:35 bar=105883 kind=fvgRenewal bias=bearish resetOn=true
118145 HS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 10:40 bar=105884 kind=doRenewal bias=bearish resetOn=true
118149 FL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 10:45 bar=105885 kind=strongFlip bias=bullish resetOn=true
118160 HG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 11:10 bar=105890 kind=doRenewal bias=bullish resetOn=true
118170 RS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 11:35 bar=105895 kind=doRenewal bias=bullish resetOn=true
118176 CQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 11:40 bar=105896 kind=doRenewal bias=bullish resetOn=true
118179 CS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 11:45 bar=105897 kind=fvgRenewal bias=bullish resetOn=true
118185 PJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 12:25 bar=105905 kind=doRenewal bias=bullish resetOn=true
118191 FG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 12:55 bar=105911 kind=strongFlip bias=bearish resetOn=true
118194 EO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 13:05 bar=105913 kind=fvgRenewal bias=bearish resetOn=true
118199 IP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 13:15 bar=105915 kind=weakFlip bias=bullish resetOn=true
118206 QK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 13:40 bar=105920 kind=doRenewal bias=bullish resetOn=true
118212 IL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 14:45 bar=105933 kind=fvgRenewal bias=bullish resetOn=true
118217 RD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 14:55 bar=105935 kind=doRenewal bias=bullish resetOn=true
118222 PE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 15:00 bar=105936 kind=fvgRenewal bias=bullish resetOn=true
118229 PG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 15:35 bar=105943 kind=fvgRenewal bias=bullish resetOn=true
118236 LL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 15:55 bar=105947 kind=fvgRenewal bias=bullish resetOn=true
118243 NG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 16:50 bar=105958 kind=fvgRenewal bias=bullish resetOn=true
118248 PD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 17:10 bar=105962 kind=strongFlip bias=bearish resetOn=true
118256 FM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 17:25 bar=105965 kind=strongFlip bias=bullish resetOn=true
118264 QE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 17:50 bar=105970 kind=strongFlip bias=bearish resetOn=true
118266 PI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 17:55 bar=105971 kind=fvgRenewal bias=bearish resetOn=true
118270 LQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 18:00 bar=105972 kind=strongFlip bias=bullish resetOn=true
118274 CP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 18:05 bar=105973 kind=fvgRenewal bias=bullish resetOn=true
118280 JG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 18:40 bar=105980 kind=fvgRenewal bias=bullish resetOn=true
118286 CK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 19:05 bar=105985 kind=doRenewal bias=bullish resetOn=true
118294 RQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 19:40 bar=105992 kind=strongFlip bias=bearish resetOn=true
118296 KE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 19:45 bar=105993 kind=fvgRenewal bias=bearish resetOn=true
118302 MR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 20:00 bar=105996 kind=fvgRenewal bias=bearish resetOn=true
118310 JN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 20:15 bar=105999 kind=strongFlip bias=bullish resetOn=true
118318 JE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 20:55 bar=106007 kind=doRenewal bias=bullish resetOn=true
118331 DO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 21:30 bar=106014 kind=doRenewal bias=bullish resetOn=true
118334 DE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 21:35 bar=106015 kind=fvgRenewal bias=bullish resetOn=true
118338 MF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 21:40 bar=106016 kind=strongFlip bias=bearish resetOn=true
118345 PG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 21:45 bar=106017 kind=fvgRenewal bias=bearish resetOn=true
118352 JK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 22:20 bar=106024 kind=strongFlip bias=bullish resetOn=true
118357 MG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 22:25 bar=106025 kind=fvgRenewal bias=bullish resetOn=true
118361 LM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 22:30 bar=106026 kind=fvgRenewal bias=bullish resetOn=true
118372 DK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 23:35 bar=106039 kind=doRenewal bias=bullish resetOn=true
118377 IR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.03 23:55 bar=106043 kind=strongFlip bias=bearish resetOn=true
118379 CD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 00:00 bar=106044 kind=fvgRenewal bias=bearish resetOn=true
118389 KI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 00:50 bar=106054 kind=fvgRenewal bias=bearish resetOn=true
118394 OE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 01:00 bar=106056 kind=strongFlip bias=bullish resetOn=true
118397 DM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 01:05 bar=106057 kind=fvgRenewal bias=bullish resetOn=true
118403 ES	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 01:30 bar=106062 kind=weakFlip bias=bearish resetOn=true
118413 IL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 01:55 bar=106067 kind=fvgRenewal bias=bearish resetOn=true
118425 NH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 03:25 bar=106085 kind=strongFlip bias=bullish resetOn=true
118429 ER	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 03:35 bar=106087 kind=weakFlip bias=bearish resetOn=true
118441 PE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 04:45 bar=106101 kind=doRenewal bias=bearish resetOn=true
118453 NK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 05:15 bar=106107 kind=strongFlip bias=bullish resetOn=true
118455 HO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 05:20 bar=106108 kind=fvgRenewal bias=bullish resetOn=true
118465 NH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 06:05 bar=106117 kind=doRenewal bias=bullish resetOn=true
118468 GK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 06:10 bar=106118 kind=fvgRenewal bias=bullish resetOn=true
118473 II	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 06:25 bar=106121 kind=doRenewal bias=bullish resetOn=true
118476 DK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 06:35 bar=106123 kind=fvgRenewal bias=bullish resetOn=true
118485 IK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 07:20 bar=106132 kind=fvgRenewal bias=bullish resetOn=true
118498 JQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 07:30 bar=106134 kind=strongFlip bias=bearish resetOn=true
118503 CJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 07:35 bar=106135 kind=fvgRenewal bias=bearish resetOn=true
118509 KN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 08:10 bar=106142 kind=strongFlip bias=bullish resetOn=true
118516 JH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 09:00 bar=106152 kind=weakFlip bias=bearish resetOn=true
118522 QO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 09:20 bar=106156 kind=weakFlip bias=bullish resetOn=true
118528 JS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 09:30 bar=106158 kind=strongFlip bias=bearish resetOn=true
118539 IG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 10:35 bar=106171 kind=strongFlip bias=bullish resetOn=true
118549 KH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 11:25 bar=106181 kind=strongFlip bias=bearish resetOn=true
118556 QK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 12:05 bar=106189 kind=fvgRenewal bias=bearish resetOn=true
118562 DM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 12:25 bar=106193 kind=strongFlip bias=bullish resetOn=true
118567 JK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 12:40 bar=106196 kind=weakFlip bias=bearish resetOn=true
118581 GI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 14:00 bar=106212 kind=fvgRenewal bias=bearish resetOn=true
118585 ON	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 14:05 bar=106213 kind=fvgRenewal bias=bearish resetOn=true
118590 JN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 14:15 bar=106215 kind=doRenewal bias=bearish resetOn=true
118597 RS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 14:35 bar=106219 kind=doRenewal bias=bearish resetOn=true
118603 DH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 14:45 bar=106221 kind=doRenewal bias=bearish resetOn=true
118610 NS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 15:10 bar=106226 kind=strongFlip bias=bullish resetOn=true
118618 PE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 15:55 bar=106235 kind=doRenewal bias=bullish resetOn=true
118622 FR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 16:00 bar=106236 kind=fvgRenewal bias=bullish resetOn=true
118628 II	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 16:10 bar=106238 kind=doRenewal bias=bullish resetOn=true
118633 LF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 16:30 bar=106242 kind=strongFlip bias=bearish resetOn=true
118641 OM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 16:50 bar=106246 kind=strongFlip bias=bullish resetOn=true
118643 NQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 16:55 bar=106247 kind=fvgRenewal bias=bullish resetOn=true
118650 NG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 17:15 bar=106251 kind=doRenewal bias=bullish resetOn=true
118656 HI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 17:30 bar=106254 kind=fvgRenewal bias=bullish resetOn=true
118662 RD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 17:55 bar=106259 kind=doRenewal bias=bullish resetOn=true
118667 MR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 18:00 bar=106260 kind=fvgRenewal bias=bullish resetOn=true
118675 RF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 18:55 bar=106271 kind=weakFlip bias=bearish resetOn=true
118682 KM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 19:10 bar=106274 kind=fvgRenewal bias=bearish resetOn=true
118689 MF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 19:30 bar=106278 kind=strongFlip bias=bullish resetOn=true
118693 LM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 19:35 bar=106279 kind=fvgRenewal bias=bullish resetOn=true
118697 JJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 19:40 bar=106280 kind=fvgRenewal bias=bullish resetOn=true
118704 HR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 20:05 bar=106285 kind=fvgRenewal bias=bullish resetOn=true
118707 HK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 20:20 bar=106288 kind=fvgRenewal bias=bullish resetOn=true
118712 GL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 20:35 bar=106291 kind=weakFlip bias=bearish resetOn=true
118718 MQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 20:55 bar=106295 kind=strongFlip bias=bullish resetOn=true
118721 MG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 21:05 bar=106297 kind=weakFlip bias=bearish resetOn=true
118727 OJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 21:30 bar=106302 kind=weakFlip bias=bullish resetOn=true
118730 OD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 21:35 bar=106303 kind=fvgRenewal bias=bullish resetOn=true
118738 GM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 22:10 bar=106310 kind=doRenewal bias=bullish resetOn=true
118744 NF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 22:50 bar=106318 kind=weakFlip bias=bearish resetOn=true
118749 EH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 23:15 bar=106323 kind=weakFlip bias=bullish resetOn=true
118755 DI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 23:25 bar=106325 kind=fvgRenewal bias=bullish resetOn=true
118761 PJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.04 23:55 bar=106331 kind=strongFlip bias=bearish resetOn=true
118769 CO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 00:45 bar=106341 kind=doRenewal bias=bearish resetOn=true
118776 NQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 00:50 bar=106342 kind=fvgRenewal bias=bearish resetOn=true
118782 RE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 01:25 bar=106349 kind=fvgRenewal bias=bearish resetOn=true
118786 RR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 01:40 bar=106352 kind=weakFlip bias=bullish resetOn=true
118788 NG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 01:45 bar=106353 kind=fvgRenewal bias=bullish resetOn=true
118795 GK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 02:15 bar=106359 kind=weakFlip bias=bearish resetOn=true
118797 KN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 02:20 bar=106360 kind=fvgRenewal bias=bearish resetOn=true
118801 EI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 02:35 bar=106363 kind=weakFlip bias=bullish resetOn=true
118807 QJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 03:00 bar=106368 kind=strongFlip bias=bearish resetOn=true
118814 LN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 03:30 bar=106374 kind=doRenewal bias=bearish resetOn=true
118819 II	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 04:05 bar=106381 kind=fvgRenewal bias=bearish resetOn=true
118825 HN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 04:25 bar=106385 kind=weakFlip bias=bullish resetOn=true
118834 RL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 04:55 bar=106391 kind=fvgRenewal bias=bullish resetOn=true
118843 JM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 05:20 bar=106396 kind=fvgRenewal bias=bullish resetOn=true
118850 QO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 05:55 bar=106403 kind=doRenewal bias=bullish resetOn=true
118854 GH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 06:00 bar=106404 kind=fvgRenewal bias=bullish resetOn=true
118861 CL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 06:25 bar=106409 kind=strongFlip bias=bearish resetOn=true
118864 NR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 06:30 bar=106410 kind=fvgRenewal bias=bearish resetOn=true
118870 PM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 06:35 bar=106411 kind=doRenewal bias=bearish resetOn=true
118911 NQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ INV t=2026.06.05 07:20 bar=106420 obStart=106414 obStartT=2026.06.05 06:50 obVal=106416 obInv=106420 obCreation=106415 isBull=0 bias=bearish ref=106409 refT=2026.06.05 06:25 refOk=1 sameBarValInv=0
118913 CR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ INV t=2026.06.05 07:20 bar=106420 obStart=106395 obStartT=2026.06.05 05:15 obVal=106417 obInv=106420 obCreation=106396 isBull=0 bias=bearish ref=106409 refT=2026.06.05 06:25 refOk=1 sameBarValInv=0
118918 KG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 07:20 bar=106420 kind=strongFlip bias=bullish resetOn=true
119004 LH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ INV t=2026.06.05 08:05 bar=106429 obStart=106423 obStartT=2026.06.05 07:35 obVal=106428 obInv=106429 obCreation=106424 isBull=1 bias=bullish ref=106420 refT=2026.06.05 07:20 refOk=1 sameBarValInv=0
119016 JG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ INV t=2026.06.05 08:10 bar=106430 obStart=106426 obStartT=2026.06.05 07:50 obVal=106428 obInv=106430 obCreation=106428 isBull=1 bias=bullish ref=106420 refT=2026.06.05 07:20 refOk=1 sameBarValInv=0
119021 MR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 08:10 bar=106430 kind=strongFlip bias=bearish resetOn=true
119039 HM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ INV t=2026.06.05 08:20 bar=106432 obStart=106413 obStartT=2026.06.05 06:45 obVal=106414 obInv=106432 obCreation=106414 isBull=1 bias=bearish ref=106430 refT=2026.06.05 08:10 refOk=1 sameBarValInv=0
119041 HN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ INV t=2026.06.05 08:20 bar=106432 obStart=106393 obStartT=2026.06.05 05:05 obVal=106395 obInv=106432 obCreation=106395 isBull=1 bias=bearish ref=106430 refT=2026.06.05 08:10 refOk=1 sameBarValInv=0
119047 QS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 08:20 bar=106432 kind=doRenewal bias=bearish resetOn=true
119058 CQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 08:25 bar=106433 kind=fvgRenewal bias=bearish resetOn=true
119069 FL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ INV t=2026.06.05 08:30 bar=106434 obStart=106383 obStartT=2026.06.05 04:15 obVal=106384 obInv=106434 obCreation=106384 isBull=1 bias=bearish ref=106430 refT=2026.06.05 08:10 refOk=1 sameBarValInv=0
119090 ME	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ INV t=2026.06.05 08:40 bar=106436 obStart=106387 obStartT=2026.06.05 04:35 obVal=106432 obInv=106436 obCreation=106389 isBull=0 bias=bearish ref=106430 refT=2026.06.05 08:10 refOk=1 sameBarValInv=0
119130 MR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 08:55 bar=106439 kind=weakFlip bias=bullish resetOn=true
119162 CK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ INV t=2026.06.05 09:10 bar=106442 obStart=106439 obStartT=2026.06.05 08:55 obVal=106441 obInv=106442 obCreation=106441 isBull=0 bias=bullish ref=106439 refT=2026.06.05 08:55 refOk=1 sameBarValInv=0
119186 DL	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ INV t=2026.06.05 09:20 bar=106444 obStart=106440 obStartT=2026.06.05 09:00 obVal=106442 obInv=106444 obCreation=106442 isBull=1 bias=bullish ref=106439 refT=2026.06.05 08:55 refOk=1 sameBarValInv=0
119245 CK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ INV t=2026.06.05 09:50 bar=106450 obStart=106432 obStartT=2026.06.05 08:20 obVal=106439 obInv=106450 obCreation=106433 isBull=1 bias=bullish ref=106439 refT=2026.06.05 08:55 refOk=1 sameBarValInv=0
119250 LN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   SRJ EVT t=2026.06.05 09:50 bar=106450 kind=strongFlip bias=bearish resetOn=true

## C3c B41HIST markers+strips
70419 GO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST_A_BEGIN
70442 KS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 07:00 bias=-1.0
70443 LG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 07:05 bias=-1.0
70444 DK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 07:10 bias=-1.0
70445 PM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 07:15 bias=1.0
70446 HP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 07:20 bias=1.0
70447 MD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 07:25 bias=1.0
70448 KH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 07:30 bias=1.0
70449 JO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 07:35 bias=1.0
70450 NS	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 07:40 bias=1.0
70451 GF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 07:45 bias=1.0
70452 IJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 07:50 bias=1.0
70453 LN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 07:55 bias=1.0
70454 KE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 08:00 bias=1.0
70455 MK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 08:05 bias=-1.0
70456 MO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 08:10 bias=-1.0
70457 FR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 08:15 bias=-1.0
70458 DF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 08:20 bias=-1.0
70459 KJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 08:25 bias=-1.0
70460 KN	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 08:30 bias=-1.0
70461 DQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 08:35 bias=-1.0
70462 JE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 08:40 bias=-1.0
70463 QI	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 08:45 bias=-1.0
70464 FO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 08:50 bias=1.0
70465 KR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 08:55 bias=1.0
70466 FF	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 09:00 bias=1.0
70467 CJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 09:05 bias=1.0
70468 QQ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 09:10 bias=1.0
70469 HE	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 09:15 bias=1.0
70470 LH	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 09:20 bias=1.0
70471 ML	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 09:25 bias=1.0
70472 GP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 09:30 bias=1.0
70473 RG	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 09:35 bias=1.0
70474 JK	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 09:40 bias=1.0
70475 LM	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 09:45 bias=-1.0
70476 DP	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 09:50 bias=-1.0
70477 CD	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 09:55 bias=-1.0
70478 KJ	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST src=A bar=2026.06.05 10:00 bias=0.0
70479 MO	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST_A_END
70482 RR	0	13:32:35.839	Core 04	2026.06.05 10:00:00   B41HIST_B_BEGIN
119299 MP	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 07:00 bias=-1.0
119300 ND	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 07:05 bias=-1.0
119301 FH	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 07:10 bias=-1.0
119302 RN	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 07:15 bias=1.0
119303 JE	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 07:20 bias=1.0
119304 KI	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 07:25 bias=1.0
119305 MM	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 07:30 bias=1.0
119306 HP	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 07:35 bias=1.0
119307 LD	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 07:40 bias=1.0
119308 IK	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 07:45 bias=1.0
119309 GO	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 07:50 bias=1.0
119310 NS	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 07:55 bias=1.0
119311 MF	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 08:00 bias=1.0
119312 KH	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 08:05 bias=-1.0
119313 KL	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 08:10 bias=-1.0
119314 DG	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 08:15 bias=-1.0
119315 FK	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 08:20 bias=-1.0
119316 MO	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 08:25 bias=-1.0
119317 MS	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 08:30 bias=-1.0
119318 FF	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 08:35 bias=-1.0
119319 HJ	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 08:40 bias=-1.0
119320 ON	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 08:45 bias=-1.0
119321 DP	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 08:50 bias=1.0
119322 MG	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 08:55 bias=1.0
119323 DK	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 09:00 bias=1.0
119324 EO	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 09:05 bias=1.0
119325 OR	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 09:10 bias=1.0
119326 JF	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 09:15 bias=1.0
119327 NM	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 09:20 bias=1.0
119328 KQ	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 09:25 bias=1.0
119329 IE	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 09:30 bias=1.0
119330 PH	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 09:35 bias=1.0
119331 HL	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 09:40 bias=1.0
119332 NR	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 09:45 bias=-1.0
119333 FE	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 09:50 bias=-1.0
119334 EI	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 09:55 bias=-1.0
119335 DP	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST src=B bar=2026.06.05 10:00 bias=EMPTY
119336 GM	0	13:32:35.839	Core 04	2026.06.05 10:00:01   B41HIST_B_END

## C3 j26 OBPROV 07-10
69298 FM	0	13:32:29.612	Core 04	2026.06.05 07:25:45   [SRJ][T155][OBPROV] code=3 id=2420 bar=106420 flag=false
69300 LR	0	13:32:29.612	Core 04	2026.06.05 07:25:45   [SRJ][T155][OBPROV] code=3 id=2406 bar=106420 flag=false
69303 NK	0	13:32:29.612	Core 04	2026.06.05 07:25:45   [SRJ][T155][OBPROV] code=8 id=0 bar=106420 flag=true
69519 NP	0	13:32:29.612	Core 04	2026.06.05 08:10:00   [SRJ][T155][OBPROV] code=3 id=2421 bar=106429 flag=false
69545 RN	0	13:32:29.612	Core 04	2026.06.05 08:15:04   [SRJ][T155][OBPROV] code=3 id=2422 bar=106430 flag=false
69548 NO	0	13:32:29.612	Core 04	2026.06.05 08:15:04   [SRJ][T155][OBPROV] code=8 id=0 bar=106430 flag=true
69597 EN	0	13:32:29.612	Core 04	2026.06.05 08:25:00   [SRJ][T155][OBPROV] code=4 id=2419 bar=106432 flag=true
69599 JJ	0	13:32:29.612	Core 04	2026.06.05 08:25:00   [SRJ][T155][OBPROV] code=4 id=2405 bar=106432 flag=true
69603 DS	0	13:32:29.612	Core 04	2026.06.05 08:25:00   [SRJ][T155][OBPROV] code=7 id=0 bar=106432 flag=true
69627 DQ	0	13:32:29.612	Core 04	2026.06.05 08:30:00   [SRJ][T155][OBPROV] code=6 id=0 bar=106433 flag=true
69656 HH	0	13:32:29.612	Core 04	2026.06.05 08:35:12   [SRJ][T155][OBPROV] code=4 id=2397 bar=106434 flag=true
69702 EF	0	13:32:29.612	Core 04	2026.06.05 08:45:01   [SRJ][T155][OBPROV] code=3 id=2401 bar=106436 flag=false
69783 JQ	0	13:32:29.612	Core 04	2026.06.05 09:00:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106439 flag=true
69889 HK	0	13:32:29.612	Core 04	2026.06.05 09:15:00   [SRJ][T155][OBPROV] code=4 id=2428 bar=106442 flag=true
70170 NM	0	13:32:29.612	Core 04	2026.06.05 09:25:04   [SRJ][T155][OBPROV] code=3 id=2429 bar=106444 flag=false
70390 KI	0	13:32:35.839	Core 04	2026.06.05 09:55:00   [SRJ][T155][OBPROV] code=3 id=2424 bar=106450 flag=false
70393 MP	0	13:32:35.839	Core 04	2026.06.05 09:55:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106450 flag=true

## C3 j26 UJPROBE ltf 07-10
69224 UJPROBE bar_key=2026.06.05 07:00 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106109 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:05:09 lag=chartTime-1bar
69246 UJPROBE bar_key=2026.06.05 07:05 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=hidden readFail=0 empty=106109 zero=0 complete=1 latestNZ=2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:10:04 lag=chartTime-1bar
69271 UJPROBE bar_key=2026.06.05 07:10 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=hidden readFail=0 empty=106110 zero=0 complete=1 latestNZ=2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:15:20 lag=chartTime-1bar
69293 UJPROBE bar_key=2026.06.05 07:15 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=hidden readFail=0 empty=106110 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:20:18 lag=chartTime-1bar
69323 UJPROBE bar_key=2026.06.05 07:20 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106110 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:25:45 lag=chartTime-1bar
69349 UJPROBE bar_key=2026.06.05 07:25 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106111 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:30:03 lag=chartTime-1bar
69376 UJPROBE bar_key=2026.06.05 07:30 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106112 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:35:06 lag=chartTime-1bar
69398 UJPROBE bar_key=2026.06.05 07:35 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106113 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:40:15 lag=chartTime-1bar
69421 UJPROBE bar_key=2026.06.05 07:40 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106114 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:45:08 lag=chartTime-1bar
69443 UJPROBE bar_key=2026.06.05 07:45 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106115 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:50:00 lag=chartTime-1bar
69464 UJPROBE bar_key=2026.06.05 07:50 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106116 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:55:03 lag=chartTime-1bar
69489 UJPROBE bar_key=2026.06.05 07:55 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106117 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:00:01 lag=chartTime-1bar
69513 UJPROBE bar_key=2026.06.05 08:00 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106117 zero=0 complete=1 latestNZ=2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:05:07 lag=chartTime-1bar
69540 UJPROBE bar_key=2026.06.05 08:05 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106117 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:10:00 lag=chartTime-1bar
69569 UJPROBE bar_key=2026.06.05 08:10 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106118 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:15:04 lag=chartTime-1bar
69594 UJPROBE bar_key=2026.06.05 08:15 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106119 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:20:03 lag=chartTime-1bar
69623 UJPROBE bar_key=2026.06.05 08:20 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106120 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:25:00 lag=chartTime-1bar
69650 UJPROBE bar_key=2026.06.05 08:25 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106120 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:30:00 lag=chartTime-1bar
69677 UJPROBE bar_key=2026.06.05 08:30 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106121 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:35:12 lag=chartTime-1bar
69699 UJPROBE bar_key=2026.06.05 08:35 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106122 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:40:13 lag=chartTime-1bar
69726 UJPROBE bar_key=2026.06.05 08:40 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106122 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:45:01 lag=chartTime-1bar
69752 UJPROBE bar_key=2026.06.05 08:45 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106123 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:50:00 lag=chartTime-1bar
69777 UJPROBE bar_key=2026.06.05 08:50 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106124 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:55:08 lag=chartTime-1bar
69805 UJPROBE bar_key=2026.06.05 08:55 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106125 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:00:00 lag=chartTime-1bar
69831 UJPROBE bar_key=2026.06.05 09:00 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106126 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:05:00 lag=chartTime-1bar
69860 UJPROBE bar_key=2026.06.05 09:05 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106126 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:10:00 lag=chartTime-1bar
69914 UJPROBE bar_key=2026.06.05 09:10 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106127 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:15:00 lag=chartTime-1bar
69955 UJPROBE bar_key=2026.06.05 09:15 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106128 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:20:00 lag=chartTime-1bar
70191 UJPROBE bar_key=2026.06.05 09:20 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106129 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:25:04 lag=chartTime-1bar
70238 UJPROBE bar_key=2026.06.05 09:25 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106130 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:30:00 lag=chartTime-1bar
70283 UJPROBE bar_key=2026.06.05 09:30 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106130 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:35:00 lag=chartTime-1bar
70312 UJPROBE bar_key=2026.06.05 09:35 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106131 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:40:00 lag=chartTime-1bar
70358 UJPROBE bar_key=2026.06.05 09:40 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106132 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:45:00 lag=chartTime-1bar
70384 UJPROBE bar_key=2026.06.05 09:45 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106133 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:50:05 lag=chartTime-1bar
70413 UJPROBE bar_key=2026.06.05 09:50 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=hidden readFail=0 empty=106134 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:55:00 lag=chartTime-1bar
119281 UJPROBE bar_key=2026.06.05 09:55 h4=0.0 h1=0.0 m15=0.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106134 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 10:00:00 lag=chartTime-1bar

## C3 j26 09:40 refusal
70290 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=28 famRead=448 unavail=0 emptyValid=15 state=2 attempt=6 poolGen=6 cadence=no-rebuild
70319 2026.06.05 09:40:00 STATE IDLE->S1_REGIME dir=SHORT poi=Daily-POC
70330 2026.06.05 09:40:00 STATE S1_REGIME->S2_LTF_ALIGN dir=SHORT poi=Daily-POC
70333 2026.06.05 09:40:00 ABORT reason=SEEDBIAS_REFUSED state=S2_LTF_ALIGN poi=Daily-POC dir=SHORT
70334 A6REFUSED class=ABSENT_DECLINED bar=2026.06.05 09:40 state=S2_LTF_ALIGN dir=SHORT predicate=SEEDBIAS_REFUSED
70335 2026.06.05 09:40:00 STATE S2_LTF_ALIGN->ABORT dir=SHORT poi=Daily-POC
