# BUILDER SLICE B-40 - raw rows behind B1-B4 (line numbers; payloads only)
j24 = JUNE-B38_JOURNAL.log (SHA AC07557F); v26 = RECON74-V11-UJ_JOURNAL.log (SHA B802287F, 37765 lines); r78 = RECON78-V26-UJ_JOURNAL.log (SHA 48F5C196, 36760 lines). Disk EA = 63B18C1F.

## B1 BiasChange draw (Include\SRJ\SRJ_Draw.mqh lines 192-210)
192: void SRJ_Draw_BiasAndRenewalLines(const double &high[],const double &low[],const datetime &time[],int rates_total,int i)
193:   {
194:    double priceTop, priceBottom;
195:    SRJ_getPriceRange(high,low,i,priceTop,priceBottom);
196:    
197:    if(g_s.drawBiasLineNow && g_showBiasChangeLines)
198:      {
199:       color clr = (g_s.newBiasDirection == "bullish") ? g_biasChangeLineColorBullish : g_biasChangeLineColorBearish;
200:       clr = SRJ_Opacity(clr, 50.0);
201:       string name = SRJ_DrawTrend("BiasChange", time, rates_total, i, priceTop, i, priceBottom, clr, g_biasChangeLineWidth, SRJ_STYLE_DASHED, false);
202:       CBiasChangeLine *bcl = new CBiasChangeLine();
203:       bcl.barIndex = i;
204:       bcl.direction = g_s.newBiasDirection;
205:       bcl.lineName = name;
206:       g_biasChangeLines.Add(bcl);
207:       
208:       g_s.drawBiasLineNow = false;
209:       g_s.newBiasDirection = SRJ_NA_STR;
210:      }

## B1 bias-line inputs (Indicators\SRJ_FlowLogic.mq5 lines 261-267)
261: input group "Bias Settings"
262: input bool  inShowBiasPane                    = true;            
263: input int   inBiasPaneOffsetBars              = 3;               
264: input bool  inShowBiasChangeLines             = true;            
265: input color inBiasChangeLineColorBullish      = C'50,50,255';    
266: input color inBiasChangeLineColorBearish      = C'255,50,50';    
267: input int   inBiasChangeLineWidth             = 2;               

## B2 EA FlowLogic handle (Experts\SRJ_FlowNexus_EA.mq5 lines 11227-11233)
11227:    g_hFlow = iCustom(_Symbol, PERIOD_CURRENT, InpFlowLogicName,
11228:                      "", 1, InpFL_HtfLookbackBars,   // B-29: "" fills the FlowLogic input group "HTF Automation" slot
11229:                      //--- [P-UJIMPL-IMPL-1 v8 IE1] confirmed selection (F252
11230:                      //--- inUseConfirmedHTFOnly; EU preservation sibling row
11231:                      //--- grades the global effect).
11232:                      PERIOD_H4, PERIOD_H1, PERIOD_M15, true, 60);
11233:    PrintFormat("[SRJ-EA] Flow handle=%d err=%d", g_hFlow, GetLastError());

## B2 EA lookback input (Experts\SRJ_FlowNexus_EA.mq5 lines 51-51)
51: input int    InpFL_HtfLookbackBars = 3000;

## B2 FL HTF group (Indicators\SRJ_FlowLogic.mq5 lines 246-259)
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

## B3 j24 OB/IDCHANGE 07-10
19588 KL	0	10:22:40.526	Core 04	2026.06.05 07:25:45   [SRJ][T155][OBPROV] code=3 id=2420 bar=106420 flag=false
19589 KQ	0	10:22:40.526	Core 04	2026.06.05 07:25:45   [SRJ][T155][OBPROV] code=3 id=2406 bar=106420 flag=false
19590 GJ	0	10:22:40.526	Core 04	2026.06.05 07:25:45   [SRJ][T155][OBPROV] code=8 id=0 bar=106420 flag=true
19593 IDCHANGE bar=2026.06.05 07:20 inWin=0 state=IDLE dir=NONE xobId=2415->2397 fvgId=0->0 xobLo=159.918 xobHi=159.936 cumX=179 cumF=0 bars=1242
19599 IDCHANGE bar=2026.06.05 07:25 inWin=0 state=IDLE dir=NONE xobId=2397->2419 fvgId=0->0 xobLo=159.943 xobHi=159.954 cumX=180 cumF=0 bars=1243
19620 IR	0	10:22:40.526	Core 04	2026.06.05 08:10:00   [SRJ][T155][OBPROV] code=3 id=2421 bar=106429 flag=false
19625 MM	0	10:22:40.526	Core 04	2026.06.05 08:15:04   [SRJ][T155][OBPROV] code=3 id=2422 bar=106430 flag=false
19626 KO	0	10:22:40.526	Core 04	2026.06.05 08:15:04   [SRJ][T155][OBPROV] code=8 id=0 bar=106430 flag=true
19629 IDCHANGE bar=2026.06.05 08:10 inWin=0 state=IDLE dir=NONE xobId=2419->2415 fvgId=0->0 xobLo=159.968 xobHi=159.977 cumX=181 cumF=0 bars=1252
19633 RP	0	10:22:40.526	Core 04	2026.06.05 08:25:00   [SRJ][T155][OBPROV] code=4 id=2419 bar=106432 flag=true
19634 CM	0	10:22:40.526	Core 04	2026.06.05 08:25:00   [SRJ][T155][OBPROV] code=4 id=2405 bar=106432 flag=true
19635 QM	0	10:22:40.526	Core 04	2026.06.05 08:25:00   [SRJ][T155][OBPROV] code=7 id=0 bar=106432 flag=true
19638 GI	0	10:22:40.526	Core 04	2026.06.05 08:30:00   [SRJ][T155][OBPROV] code=6 id=0 bar=106433 flag=true
19644 IH	0	10:22:40.526	Core 04	2026.06.05 08:35:12   [SRJ][T155][OBPROV] code=4 id=2397 bar=106434 flag=true
19650 HQ	0	10:22:40.526	Core 04	2026.06.05 08:45:01   [SRJ][T155][OBPROV] code=3 id=2401 bar=106436 flag=false
19660 IO	0	10:22:40.526	Core 04	2026.06.05 09:00:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106439 flag=true
19663 IDCHANGE bar=2026.06.05 08:55 inWin=0 state=IDLE dir=NONE xobId=2415->2317 fvgId=0->0 xobLo=159.878 xobHi=159.916 cumX=182 cumF=0 bars=1261
19699 EL	0	10:22:40.526	Core 04	2026.06.05 09:15:00   [SRJ][T155][OBPROV] code=4 id=2428 bar=106442 flag=true
19935 CJ	0	10:22:40.526	Core 04	2026.06.05 09:25:04   [SRJ][T155][OBPROV] code=3 id=2429 bar=106444 flag=false
20030 NR	0	10:22:40.526	Core 04	2026.06.05 09:55:00   [SRJ][T155][OBPROV] code=3 id=2424 bar=106450 flag=false
20031 RJ	0	10:22:40.526	Core 04	2026.06.05 09:55:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106450 flag=true
20034 IDCHANGE bar=2026.06.05 09:50 inWin=1 state=IDLE dir=NONE xobId=2317->2415 fvgId=0->0 xobLo=159.968 xobHi=159.977 cumX=183 cumF=0 bars=1272

## B3 j24 swing 09:15 bar (09:20 pass)
19744 S3INPLAY bar=2026.06.05 09:15 dir=SHORT inPlay=0 via=none zoneLo=159.878 zoneHi=159.916 barLo=159.954 barHi=159.964 close=159.959 sw1=159.972@1 sw2=159.968@3
19748 SWINGPICK site=S3ARM dir=SHORT barShift=1 close=159.959 haveHigh=1 SH=159.972 atShift=1 haveLow=1 SL=159.944 atShift=2
19874 SWINGDUMP #27 site=S5 dir=SHORT barShift=1 bar=2026.06.05 09:15 close=159.959 high=159.964 low=159.954 SH[1..10]= - 159.972 - 159.968 - - - - - - | SL[1..10]= - - 159.944 - - - - - 159.917 - 
19875 SWINGPICK site=S5 dir=SHORT barShift=1 close=159.959 haveHigh=1 SH=159.972 atShift=1 haveLow=1 SL=159.944 atShift=2

## B3 j24 UJPROBE ltf strip 07-10
19575 UJPROBE bar_key=2026.06.05 07:00 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106109 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:05:09 lag=chartTime-1bar
19577 UJPROBE bar_key=2026.06.05 07:05 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=hidden readFail=0 empty=106109 zero=0 complete=1 latestNZ=2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:10:04 lag=chartTime-1bar
19581 UJPROBE bar_key=2026.06.05 07:10 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=hidden readFail=0 empty=106110 zero=0 complete=1 latestNZ=2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:15:20 lag=chartTime-1bar
19584 UJPROBE bar_key=2026.06.05 07:15 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=hidden readFail=0 empty=106110 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:20:18 lag=chartTime-1bar
19591 UJPROBE bar_key=2026.06.05 07:20 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106110 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:25:45 lag=chartTime-1bar
19597 UJPROBE bar_key=2026.06.05 07:25 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106111 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:30:03 lag=chartTime-1bar
19601 UJPROBE bar_key=2026.06.05 07:30 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106112 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:35:06 lag=chartTime-1bar
19603 UJPROBE bar_key=2026.06.05 07:35 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106113 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:40:15 lag=chartTime-1bar
19605 UJPROBE bar_key=2026.06.05 07:40 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106114 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:45:08 lag=chartTime-1bar
19608 UJPROBE bar_key=2026.06.05 07:45 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106115 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:50:00 lag=chartTime-1bar
19610 UJPROBE bar_key=2026.06.05 07:50 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106116 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 07:55:03 lag=chartTime-1bar
19612 UJPROBE bar_key=2026.06.05 07:55 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106117 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:00:01 lag=chartTime-1bar
19615 UJPROBE bar_key=2026.06.05 08:00 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106117 zero=0 complete=1 latestNZ=2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:05:07 lag=chartTime-1bar
19621 UJPROBE bar_key=2026.06.05 08:05 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106117 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:10:00 lag=chartTime-1bar
19627 UJPROBE bar_key=2026.06.05 08:10 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106118 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:15:04 lag=chartTime-1bar
19631 UJPROBE bar_key=2026.06.05 08:15 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106119 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:20:03 lag=chartTime-1bar
19636 UJPROBE bar_key=2026.06.05 08:20 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106120 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:25:00 lag=chartTime-1bar
19639 UJPROBE bar_key=2026.06.05 08:25 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106120 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:30:00 lag=chartTime-1bar
19646 UJPROBE bar_key=2026.06.05 08:30 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106121 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:35:12 lag=chartTime-1bar
19648 UJPROBE bar_key=2026.06.05 08:35 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106122 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:40:13 lag=chartTime-1bar
19651 UJPROBE bar_key=2026.06.05 08:40 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106122 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:45:01 lag=chartTime-1bar
19656 UJPROBE bar_key=2026.06.05 08:45 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106123 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:50:00 lag=chartTime-1bar
19658 UJPROBE bar_key=2026.06.05 08:50 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106124 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 08:55:08 lag=chartTime-1bar
19661 UJPROBE bar_key=2026.06.05 08:55 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106125 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:00:00 lag=chartTime-1bar
19665 UJPROBE bar_key=2026.06.05 09:00 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106126 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:05:00 lag=chartTime-1bar
19671 UJPROBE bar_key=2026.06.05 09:05 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106126 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:10:00 lag=chartTime-1bar
19700 UJPROBE bar_key=2026.06.05 09:10 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106127 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:15:00 lag=chartTime-1bar
19721 UJPROBE bar_key=2026.06.05 09:15 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106128 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:20:00 lag=chartTime-1bar
19936 UJPROBE bar_key=2026.06.05 09:20 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106129 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:25:04 lag=chartTime-1bar
19961 UJPROBE bar_key=2026.06.05 09:25 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106130 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:30:00 lag=chartTime-1bar
19986 UJPROBE bar_key=2026.06.05 09:30 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106130 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:35:00 lag=chartTime-1bar
19994 UJPROBE bar_key=2026.06.05 09:35 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106131 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:40:00 lag=chartTime-1bar
20019 UJPROBE bar_key=2026.06.05 09:40 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106132 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:45:00 lag=chartTime-1bar
20025 UJPROBE bar_key=2026.06.05 09:45 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106133 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:50:05 lag=chartTime-1bar
20032 UJPROBE bar_key=2026.06.05 09:50 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=hidden readFail=0 empty=106134 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:55:00 lag=chartTime-1bar
20039 UJPROBE bar_key=2026.06.05 09:55 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106134 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 10:00:00 lag=chartTime-1bar

## B4 v26 ltf 08:55-09:50
12163 UJPROBE bar_key=2026.06.05 08:55 h4=-1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106125 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:00:00 lag=chartTime-1bar
12167 UJPROBE bar_key=2026.06.05 09:00 h4=-1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106126 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:05:00 lag=chartTime-1bar
12173 UJPROBE bar_key=2026.06.05 09:05 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106126 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:10:00 lag=chartTime-1bar
12222 UJPROBE bar_key=2026.06.05 09:10 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=106127 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:15:00 lag=chartTime-1bar
12272 UJPROBE bar_key=2026.06.05 09:15 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=106128 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:20:00 lag=chartTime-1bar
12321 UJPROBE bar_key=2026.06.05 09:20 h4=-1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=106129 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:25:04 lag=chartTime-1bar
12358 UJPROBE bar_key=2026.06.05 09:25 h4=-1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106130 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:30:00 lag=chartTime-1bar
12380 UJPROBE bar_key=2026.06.05 09:30 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=106130 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:35:00 lag=chartTime-1bar
12425 UJPROBE bar_key=2026.06.05 09:35 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=106131 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:40:00 lag=chartTime-1bar
12472 UJPROBE bar_key=2026.06.05 09:40 h4=-1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=106132 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:45:00 lag=chartTime-1bar
12604 UJPROBE bar_key=2026.06.05 09:45 h4=-1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106133 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:50:05 lag=chartTime-1bar
12616 UJPROBE bar_key=2026.06.05 09:50 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=hidden readFail=0 empty=106134 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:55:00 lag=chartTime-1bar

## B4 v26 flips 07-10
12092 JR	0	13:10:26.426	Core 04	2026.06.05 07:25:45   [SRJ][T155][OBPROV] code=8 id=0 bar=106420 flag=true
12128 CG	0	13:10:32.530	Core 04	2026.06.05 08:15:04   [SRJ][T155][OBPROV] code=8 id=0 bar=106430 flag=true
12162 JF	0	13:10:44.738	Core 04	2026.06.05 09:00:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106439 flag=true
12615 LE	0	13:10:50.842	Core 04	2026.06.05 09:55:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106450 flag=true

## B4 v26 decision+entry
12447 UJ1R bar=2026.06.05 09:35 src=POLL entry=159.955 sl=159.985 tp=159.900 risk=0.030 reward=0.055 R=1.83 verdict=PASS
12470 CONFIRM_PREBIND_FAIL bar=2026.06.05 09:35 dir=SHORT term=B_BODY
12495 UJ1R bar=2026.06.05 09:40 src=POLL entry=159.948 sl=159.972 tp=159.900 risk=0.024 reward=0.048 R=2.00 verdict=PASS
12513 UJALIGN_BYPASS bar=2026.06.05 09:40 dir=SHORT m15=1.0 rf=1 - M15 guard bypassed on confirmed bar (Fix Z-B1)
12514 2026.06.05 09:45:00 STATE S3_ZONE_WAIT->S5_GATE_CHECK dir=SHORT poi=Daily-POC
12515 CONFIRM_PREBIND bar=2026.06.05 09:40 dir=SHORT poi=Daily-POC
12571 STOPRESOLVE format=2 pkt=PACKET_EXT1LIVE-001-v28 base=6C2E4028 type=NORMAL part=1/3 emitSeq=3 barTime=2026.06.05-09:40 dir=-1 entryPx=159.94800000000001 tpPx=159.90000000000001 incomingSlRef=159.97200000000001 liveSel=2 slLive=159.97200000000001 pxExt1=159.97200000000001 ext1Defined=1 ext1Imb=0 rLive=2 rExt1=2 gateConst=1
12572 STOPRESOLVE format=2 pkt=PACKET_EXT1LIVE-001-v28 base=6C2E4028 type=NORMAL part=2/3 emitSeq=3 wouldGate=1 vetoStateAtSite=- sessionUseAtSite=- ext1Slot=6 ext1BarTime=2026.06.05-09:10 s0slot=1 s0imb=0 s1slot=6 s1imb=0 ladOriginPx=159.94800000000001 ladOriginBarTime=2026.06.05-09:45 ladOriginSite=S5 extSideOk=1
12573 STOPRESOLVE format=2 pkt=PACKET_EXT1LIVE-001-v28 base=6C2E4028 type=NORMAL part=3/3 emitSeq=3 extDistPts=24 rawNumLive=0.048000000000001819 rawDenLive=0.024000000000000909 rawNumExt1=0.048000000000001819 rawDenExt1=0.024000000000000909 wouldAdopt_monotone=0 actualGate=1 emitSeq=3 currentPrice=159.94800000000001 s0px=159.96199999999999 s1px=159.97200000000001 ladOriginStamp=2026.06.05-09:40
12588 UJ1R bar=2026.06.05 09:40 src=FIRE entry=159.948 sl=159.972 tp=159.900 risk=0.024 reward=0.048 R=2.00 verdict=PASS
12602 2026.06.05 09:45:00 STATE S5_GATE_CHECK->SIGNAL dir=SHORT poi=Daily-POC

## B4 v26 gates run-wide

## B4 r78 ltf 08:55-09:50
12654 UJPROBE bar_key=2026.06.05 08:55 h4=-1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106125 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:00:00 lag=chartTime-1bar
12658 UJPROBE bar_key=2026.06.05 09:00 h4=-1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106126 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:05:00 lag=chartTime-1bar
12664 UJPROBE bar_key=2026.06.05 09:05 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106126 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:10:00 lag=chartTime-1bar
12715 UJPROBE bar_key=2026.06.05 09:10 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=106127 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:15:00 lag=chartTime-1bar
12766 UJPROBE bar_key=2026.06.05 09:15 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=106128 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:20:00 lag=chartTime-1bar
12816 UJPROBE bar_key=2026.06.05 09:20 h4=-1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=106129 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:25:04 lag=chartTime-1bar
12854 UJPROBE bar_key=2026.06.05 09:25 h4=-1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106130 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:30:00 lag=chartTime-1bar
12877 UJPROBE bar_key=2026.06.05 09:30 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=106130 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:35:00 lag=chartTime-1bar
12924 UJPROBE bar_key=2026.06.05 09:35 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=106131 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:40:00 lag=chartTime-1bar
12972 UJPROBE bar_key=2026.06.05 09:40 h4=-1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=hidden readFail=0 empty=106132 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:45:00 lag=chartTime-1bar
13105 UJPROBE bar_key=2026.06.05 09:45 h4=-1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=hidden readFail=0 empty=106133 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:50:05 lag=chartTime-1bar
13117 UJPROBE bar_key=2026.06.05 09:50 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=hidden readFail=0 empty=106134 zero=0 complete=1 latestNZ=-2 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 09:55:00 lag=chartTime-1bar

## B4 r78 flips 07-10
12583 GL	0	16:40:51.315	Core 04	2026.06.05 07:25:45   [SRJ][T155][OBPROV] code=8 id=0 bar=106420 flag=true
12619 DP	0	16:41:03.549	Core 04	2026.06.05 08:15:04   [SRJ][T155][OBPROV] code=8 id=0 bar=106430 flag=true
12653 GP	0	16:41:15.781	Core 04	2026.06.05 09:00:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106439 flag=true
13116 GS	0	16:41:34.132	Core 04	2026.06.05 09:55:00   [SRJ][T155][OBPROV] code=8 id=0 bar=106450 flag=true

## B4 r78 decision+entry
12946 UJ1R bar=2026.06.05 09:35 src=POLL entry=159.955 sl=159.985 tp=159.900 risk=0.030 reward=0.055 R=1.83 verdict=PASS
12970 CONFIRM_PREBIND_FAIL bar=2026.06.05 09:35 dir=SHORT term=B_BODY
12995 UJ1R bar=2026.06.05 09:40 src=POLL entry=159.948 sl=159.972 tp=159.900 risk=0.024 reward=0.048 R=2.00 verdict=PASS
13014 UJALIGN_BYPASS bar=2026.06.05 09:40 dir=SHORT m15=1.0 rf=1 - M15 guard bypassed on confirmed bar (Fix Z-B1)
13015 2026.06.05 09:45:00 STATE S3_ZONE_WAIT->S5_GATE_CHECK dir=SHORT poi=Daily-POC
13016 CONFIRM_PREBIND bar=2026.06.05 09:40 dir=SHORT poi=Daily-POC
13086 A6FIRED class=SELECTED state=FIRED bar=2026.06.05 09:40 dir=SHORT tp=159.900 r=2.00 sl=159.972 mode=2SWING div=hidden
13088 ALERT SRJ SIGNAL SHORT USDJPY M5 | Daily-POC | LONDON | R=2.00 SL 159.972 TP 159.900 spr=3
13089 UJ1R bar=2026.06.05 09:40 src=FIRE entry=159.948 sl=159.972 tp=159.900 risk=0.024 reward=0.048 R=2.00 verdict=PASS
13102 ENTRY_TICKET bar=2026.06.05 09:40 ticket=4 deal=4 pid=4 ppid=4 magic=773001
13103 2026.06.05 09:45:00 STATE S5_GATE_CHECK->SIGNAL dir=SHORT poi=Daily-POC

## B4 r78 gates on 0605
13694 2026.06.05 16:05:00 ABORT reason=SEEDBIAS_REFUSED state=S2_LTF_ALIGN poi=Daily-POC dir=LONG
13695 A6REFUSED class=ABSENT_DECLINED bar=2026.06.05 16:05 state=S2_LTF_ALIGN dir=LONG predicate=SEEDBIAS_REFUSED
