# BUILDER SLICE B-37 - raw rows behind P1, P2 and C (segment line numbers; payloads only)
j18 = JUNE-B34_JOURNAL.log; j21 = RECON62-B36_JOURNAL.log; j22 = JUNE-B36_JOURNAL.log

## P1 11/6 call-site context lines
=== call site 7478 ===
7475           bool uj_hm15r = ReadFlow(FL_BUF_HTF_LOW, uj_hm15, barShift);
7476           double uj_hwant = (g_dir == DIR_LONG ? 1.0 : -1.0);
7477           string uj_hterm = "";
7478           bool uj_hcarve = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_hterm);
7479           if((uj_hm15r && uj_hm15 == uj_hwant) || uj_hcarve)
=== call site 7904 ===
7901           if(g_state == ST_S1_REGIME && t78_opp)
7902             {
7903              string t78_failOp = "", t78_failHeld = "";
7904              t78_opConf = IsConfirmationCandle(barShift, t78_pr.topLine, t78_dir, t78_failOp);
7905              t78_heldConf = IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);
=== call site 7905 ===
7902             {
7903              string t78_failOp = "", t78_failHeld = "";
7904              t78_opConf = IsConfirmationCandle(barShift, t78_pr.topLine, t78_dir, t78_failOp);
7905              t78_heldConf = IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);
7906              if(InpDebugLog) PrintFormat("[SRJ-EA] UJOPCONF bar=%s poi=%s dir=%s opConf=%d heldConf=%d opTerm=%s heldTerm=%s - displace-gate inputs (Fix H1)", TimeToString(iTime(_Symbol, PERIOD_CURREN
=== call site 8272 ===
8269              int s1v_mr = (((s1v_tag == SWEEP_ASIA_HIGH) || (s1v_tag == SWEEP_LONDON_HIGH) || (s1v_tag == SWEEP_NY_HIGH) || (s1v_tag == SWEEP_PM_HIGH)) ? 1 : 0);
8270              int s1v_wEq = g_n1_vwapEq, s1v_poEq = g_n1_pocEq, s1v_wIv = g_n1_vwapInv, s1v_poIv = g_n1_pocInv, s1v_wSv = g_n1_vwapSurv, s1v_poSv = g_n1_pocSurv;
8271              string s1v_term = "";
8272              IsConfirmationCandle(barShift, g_anchorLine, DIR_SHORT, s1v_term);
8273              g_n1_vwapEq = s1v_wEq; g_n1_pocEq = s1v_poEq; g_n1_vwapInv = s1v_wIv; g_n1_pocInv = s1v_poIv; g_n1_vwapSurv = s1v_wSv; g_n1_pocSurv = s1v_poSv;
=== call site 8298 ===
8295         int s1f_vwSv = g_n1_vwapSurv;
8296         int s1f_poSv = g_n1_pocSurv;
8297         string s1f_term = "";
8298          bool s1f_ok = IsConfirmationCandle(barShift, g_anchorLine, (s1g_legDir > 0 ? DIR_LONG : DIR_SHORT), s1f_term);   //--- [STAGE-C] legacy-pin: shadow diagnoses the legacy path (G-C01/G-C06 pari
8299         g_n1_vwapEq = s1f_vwEq;
=== call site 8367 ===
8364          int s1c_vwSv = g_n1_vwapSurv;
8365          int s1c_poSv = g_n1_pocSurv;
8366          string s1c_term = "";
8367          bool s1c_ok = IsConfirmationCandle(barShift, g_anchorLine, g_dir, s1c_term);
8368          g_n1_vwapEq = s1c_vwEq;
=== call site 8390 ===
8387           int s1c_bPoSv = g_n1_pocSurv;
8388           string s1c_termLong = "";
8389           string s1c_termShort = "";
8390           IsConfirmationCandle(barShift, g_anchorLine, DIR_LONG, s1c_termLong);
8391           g_n1_vwapEq = s1c_bVwEq;
=== call site 8397 ===
8394           g_n1_pocInv = s1c_bPoIv;
8395           g_n1_vwapSurv = s1c_bVwSv;
8396           g_n1_pocSurv = s1c_bPoSv;
8397           IsConfirmationCandle(barShift, g_anchorLine, DIR_SHORT, s1c_termShort);
8398           g_n1_vwapEq = s1c_bVwEq;
=== call site 8468 ===
8465           { uj_sbHave = true; uj_sbDir = uj_sbPr.isLong ? DIR_LONG : DIR_SHORT; uj_sbLine = uj_sbPr.topLine; }
8466        }
8467        string uj_sbTermC = "", uj_sbTermH = "";
8468         bool uj_sbConfC = (uj_sbHave && (uj_sbDir != g_dir)) ? IsConfirmationCandle(barShift, uj_sbLine, uj_sbDir, uj_sbTermC, true) : false;
8469        bool uj_sbConfH = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_sbTermH);
=== call site 8469 ===
8466        }
8467        string uj_sbTermC = "", uj_sbTermH = "";
8468         bool uj_sbConfC = (uj_sbHave && (uj_sbDir != g_dir)) ? IsConfirmationCandle(barShift, uj_sbLine, uj_sbDir, uj_sbTermC, true) : false;
8469        bool uj_sbConfH = IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_sbTermH);
8470         double uj_sbLineVal = 0.0; if(uj_sbHave && uj_sbLine >= 0 && !ReadBuf1(g_hPoi, uj_sbLine, uj_sbLineVal, barShift)) uj_sbLineVal = 0.0;
=== call site 9082 ===
9079           double uj_carryM15 = 0.0;
9080           bool uj_carryR = ReadFlow(FL_BUF_HTF_LOW, uj_carryM15, barShift);
9081           double uj_carryWant = (g_dir == DIR_LONG ? 1.0 : -1.0);
9082           if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && uj_carryR && uj_carryM15 == uj_carryWant)
9083             {
=== call site 9097 ===
9094              PrintFormat("[SRJ-EA] %s S3 waiting: no qualifying zone",
9095                          TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
9096           string cfTermZ = "";
9097           bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ);
9098           //--- [P-UJIMPL-IMPL-1 v8 IE2] direction-alignment guard above design-E1
=== call site 9280 ===
9277          //--- alive and in-window. The touch fallback above STAYS (it sets
9278          //--- g_touchSeen - the retracement detection; unchanged).
9279          string cfTerm = "";
9280          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
9281            {

## P1 11/6 price rows (TPCENSUS/SWINGPICK/DTTERMS/RETDIAG)
40573 [2026.06.11 14:30] [SRJ-EA] TPCENSUS #174 bar=2026.06.11 14:25 dir=LONG ref=160.525 winner=YLOH best=160.587 distPts=62 empties=8 admitted= PDH:46 ASH:23 LOH:62 NYH:9 PMH:15 YASH:23 YLOH:62 YNYH:4 YPMH:15 
40575 [2026.06.11 14:30] [SRJ-EA] SWINGPICK site=S2POLL dir=LONG barShift=1 close=160.524 haveHigh=1 SH=160.534 atShift=4 haveLow=1 SL=160.508 atShift=5
40591 [2026.06.11 14:30] [SRJ-EA] UJDTTERMS bar=2026.06.11 14:25 Daily-POC=LHIT/SHIT Daily-VWAP=LHIT/Sbody-above Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
40592 [2026.06.11 14:30] [SRJ-EA] RETESTDIAG bar=2026.06.11 14:25 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:234.6pts
40739 [2026.06.11 14:35] [SRJ-EA] TPCENSUS #175 bar=2026.06.11 14:30 dir=LONG ref=160.523 winner=YLOH best=160.587 distPts=64 empties=8 admitted= PDH:48 ASH:25 LOH:64 NYH:11 PMH:17 YASH:25 YLOH:64 YNYH:6 YPMH:17 
40741 [2026.06.11 14:35] [SRJ-EA] SWINGPICK site=S2POLL dir=LONG barShift=1 close=160.522 haveHigh=1 SH=160.534 atShift=5 haveLow=1 SL=160.508 atShift=6
40757 [2026.06.11 14:35] [SRJ-EA] UJDTTERMS bar=2026.06.11 14:30 Daily-POC=LHIT/Sbody-above Daily-VWAP=LHIT/Sbody-above Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
40758 [2026.06.11 14:35] [SRJ-EA] RETESTDIAG bar=2026.06.11 14:30 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:221.1pts
40910 [2026.06.11 14:40] [SRJ-EA] TPCENSUS #176 bar=2026.06.11 14:35 dir=LONG ref=160.524 winner=YLOH best=160.587 distPts=63 empties=8 admitted= PDH:47 ASH:24 LOH:63 NYH:10 PMH:16 YASH:24 YLOH:63 YNYH:5 YPMH:16 
40912 [2026.06.11 14:40] [SRJ-EA] SWINGPICK site=S2POLL dir=LONG barShift=1 close=160.526 haveHigh=1 SH=160.534 atShift=6 haveLow=1 SL=160.507 atShift=1
40928 [2026.06.11 14:40] [SRJ-EA] UJDTTERMS bar=2026.06.11 14:35 Daily-POC=LHIT/Sbody-above Daily-VWAP=LHIT/Sbody-above Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
40929 [2026.06.11 14:40] [SRJ-EA] RETESTDIAG bar=2026.06.11 14:35 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:227.0pts
41100 [2026.06.11 14:45] [SRJ-EA] TPCENSUS #177 bar=2026.06.11 14:40 dir=LONG ref=160.520 winner=Daily-VWAP best=160.522 distPts=2 empties=8 admitted= PDH:51 ASH:28 LOH:67 NYH:14 PMH:20 YASH:28 YLOH:67 YNYH:9 YPMH:20 Daily-VWAP:2 
41102 [2026.06.11 14:45] [SRJ-EA] SWINGPICK site=S2POLL dir=LONG barShift=1 close=160.521 haveHigh=1 SH=160.534 atShift=7 haveLow=1 SL=160.507 atShift=2
41118 [2026.06.11 14:45] [SRJ-EA] UJDTTERMS bar=2026.06.11 14:40 Daily-POC=Lbody-below/Sbody-above Daily-VWAP=Lbody-below/Sbody-above Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
41119 [2026.06.11 14:45] [SRJ-EA] RETESTDIAG bar=2026.06.11 14:40 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:225.9pts

## P2 6/5 retarget + session rows
21972 [2026.06.05 19:05] [SRJ-EA] UJRETARGET bar=2026.06.05 19:00 dir=LONG old=160.723 sess=2 tp=160.298 seq=3 admit=2026.06.05 16:50 - session-close retarget (Fix R)

## C1 j21 filed rows (all)
17156 A6FIRED class=SELECTED state=FIRED bar=2026.08.28 10:00 dir=SHORT tp=1.16364 r=2.43 sl=1.16508 mode=2SWING div=regular
17158 ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-VWAP | LONDON | R=2.43 SL 1.16508 TP 1.16364 spr=4
17172 ENTRY_TICKET bar=2026.08.28 10:00 ticket=2 deal=2 pid=2 ppid=2 magic=773001
17573 MTEXIT bar=2026.08.28 11:40 reason=POI_BODY_BREAK line=Daily-POC lineVal=1.16451 entry=1.16466 exit=1.16439
17581 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | POI_BODY_BREAK [Daily-POC] at 1.16439 (entry 1.16466)
34489 A6FIRED class=SELECTED state=FIRED bar=2026.09.01 17:30 dir=LONG tp=1.16077 r=1.17 sl=1.15975 mode=1SWING div=hidden
34491 ALERT SRJ SIGNAL LONG EURUSD M5 | Monthly-VWAP | NYAM | R=1.17 SL 1.15975 TP 1.16077 spr=2
34507 ENTRY_TICKET bar=2026.09.01 17:30 ticket=4 deal=4 pid=4 ppid=4 magic=773002
34600 MTEXIT bar=2026.09.01 17:50 reason=SL line=- lineVal=- entry=1.16022 exit=1.15975
34602 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | SL at 1.15975 (entry 1.16022)
52099 A6FIRED class=SELECTED state=FIRED bar=2026.09.04 15:55 dir=LONG tp=1.16302 r=1.66 sl=1.15847 mode=1SWING div=hidden
52101 ALERT SRJ SIGNAL LONG EURUSD M5 | Yearly-POC | NYAM | R=1.66 SL 1.15847 TP 1.16302 spr=1
52115 ENTRY_TICKET bar=2026.09.04 15:55 ticket=6 deal=6 pid=6 ppid=6 magic=773002
52830 UJRETARGET_BROKER bar=2026.09.04 19:00 ticket=6 oldTp=1.16302 newTp=1.16270 sl=1.15847 ok=1 rc=10009 action=SENT
52831 UJRETARGET bar=2026.09.04 19:00 dir=LONG old=1.16302 sess=2 tp=1.16270 seq=3 admit=2026.09.04 15:55 - session-close retarget (Fix R)
53803 MTEXIT bar=2026.09.04 23:50 reason=DAY_CLOSE line=- lineVal=- entry=1.16018 exit=1.16129
53811 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | DAY_CLOSE at 1.16129 (entry 1.16018)
54969 A6FIRED class=SELECTED state=FIRED bar=2026.09.07 09:15 dir=LONG tp=1.16200 r=1.76 sl=1.16098 mode=1SWING div=hidden
54971 ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-POC | LONDON | R=1.76 SL 1.16098 TP 1.16200 spr=3
54985 ENTRY_TICKET bar=2026.09.07 09:15 ticket=8 deal=8 pid=8 ppid=8 magic=773001
55376 MTEXIT bar=2026.09.07 10:50 reason=TP_TOUCH line=- lineVal=- entry=1.16135 exit=1.16200
55378 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | TP_TOUCH at 1.16200 (entry 1.16135)
58037 A6FIRED class=SELECTED state=FIRED bar=2026.09.07 16:40 dir=LONG tp=1.16315 r=2.34 sl=1.16238 mode=1SWING div=hidden
58039 ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-POC | NYAM | R=2.34 SL 1.16238 TP 1.16315 spr=3
58053 ENTRY_TICKET bar=2026.09.07 16:40 ticket=10 deal=10 pid=10 ppid=10 magic=773002
58177 MTEXIT bar=2026.09.07 17:10 reason=TP_TOUCH line=- lineVal=- entry=1.16261 exit=1.16315
58179 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | TP_TOUCH at 1.16315 (entry 1.16261)
59806 A6FIRED class=SELECTED state=FIRED bar=2026.09.08 10:05 dir=SHORT tp=1.16102 r=1.94 sl=1.16258 mode=1SWING div=hidden
59808 ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | LONDON | R=1.94 SL 1.16258 TP 1.16102 spr=1
59824 ENTRY_TICKET bar=2026.09.08 10:05 ticket=12 deal=12 pid=12 ppid=12 magic=773001
59979 MTEXIT bar=2026.09.08 10:40 reason=TP_TOUCH line=- lineVal=- entry=1.16205 exit=1.16102
59981 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | TP_TOUCH at 1.16102 (entry 1.16205)
62159 A6FIRED class=SELECTED state=FIRED bar=2026.09.08 16:55 dir=SHORT tp=1.16114 r=1.96 sl=1.16274 mode=1SWING div=regular
62161 ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | NYAM | R=1.96 SL 1.16274 TP 1.16114 spr=3
62175 ENTRY_TICKET bar=2026.09.08 16:55 ticket=14 deal=14 pid=14 ppid=14 magic=773002
62347 MTEXIT bar=2026.09.08 17:30 reason=SL line=- lineVal=- entry=1.16220 exit=1.16274
62349 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | SL at 1.16274 (entry 1.16220)

## C2 j22 filed rows (all)
12875 A6FIRED class=SELECTED state=FIRED bar=2026.06.03 09:05 dir=LONG tp=159.983 r=1.35 sl=159.889 mode=1SWING div=hidden
12877 ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-VWAP | LONDON | R=1.35 SL 159.889 TP 159.983 spr=3
12886 LM	0	08:35:58.464	Core 04	2026.06.03 09:10:00   deal #2 buy 3.71 USDJPY at 159.932 done (based on order #2)

12891 ENTRY_TICKET bar=2026.06.03 09:05 ticket=2 deal=2 pid=2 ppid=2 magic=773001
12977 KP	0	08:35:58.464	Core 04	2026.06.03 09:59:40   deal #3 sell 3.71 USDJPY at 159.983 done (based on order #3)

12989 MTEXIT bar=2026.06.03 09:55 reason=TP_TOUCH line=- lineVal=- entry=159.929 exit=159.983
12991 ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | TP_TOUCH at 159.983 (entry 159.929)
13362 FRESHCOUNT #17 bar=2026.06.03 14:35 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=1 adverse=2 verdict=ABORT scope=pre cum1=1 cum2=2 cum3=0
13363 2026.06.03 14:40:06 ABORT reason=FRESH_OPP_FVG state=S4_ARMED poi=Daily-POC dir=LONG
13366 2026.06.03 14:40:06 STATE S4_ARMED->ABORT dir=LONG poi=Daily-POC
17826 A6FIRED class=SELECTED state=FIRED bar=2026.06.04 09:50 dir=SHORT tp=159.368 r=9.62 sl=159.920 mode=1SWING div=hidden
17828 ALERT SRJ SIGNAL SHORT USDJPY M5 | Daily-POC | LONDON | R=9.62 SL 159.920 TP 159.368 spr=5
17837 LG	0	08:36:16.782	Core 04	2026.06.04 09:55:00   deal #4 sell 3.11 USDJPY at 159.868 done (based on order #4)

17842 ENTRY_TICKET bar=2026.06.04 09:50 ticket=4 deal=4 pid=4 ppid=4 magic=773001
17954 IQ	0	08:36:16.782	Core 04	2026.06.04 10:40:20   deal #5 buy 3.11 USDJPY at 159.920 done (based on order #5)

17968 MTEXIT bar=2026.06.04 10:40 reason=SL line=- lineVal=- entry=159.868 exit=159.920
17970 ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | SL at 159.920 (entry 159.868)
20691 UJ5MENTRY_REFUSE bar=2026.06.05 09:40 dir=SHORT anchor=Daily-POC ltf=1.0
21718 A6FIRED class=SELECTED state=FIRED bar=2026.06.05 16:50 dir=LONG tp=160.723 r=1.56 sl=159.726 mode=1SWING div=regular
21720 ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-POC | NYAM | R=1.56 SL 159.726 TP 160.723 spr=5
21729 MH	0	08:36:35.097	Core 04	2026.06.05 16:55:00   deal #6 buy 0.4 USDJPY at 160.120 done (based on order #6)

21734 ENTRY_TICKET bar=2026.06.05 16:50 ticket=6 deal=6 pid=6 ppid=6 magic=773002
21994 RQ	0	08:36:35.097	Core 04	2026.06.05 19:16:32   deal #7 sell 0.4 USDJPY at 160.298 done (based on order #7)

22002 MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH line=- lineVal=- entry=160.115 exit=160.298
22004 ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | TP_TOUCH at 160.298 (entry 160.115)
29720 A6FIRED class=SELECTED state=FIRED bar=2026.06.09 16:50 dir=LONG tp=160.278 r=1.31 sl=160.144 mode=1SWING div=regular
29722 ALERT SRJ SIGNAL LONG USDJPY M5 | Weekly-VWAP | NYAM | R=1.31 SL 160.144 TP 160.278 spr=7
29731 OD	0	08:37:05.625	Core 04	2026.06.09 16:55:03   deal #8 buy 2.48 USDJPY at 160.209 done (based on order #8)

29736 ENTRY_TICKET bar=2026.06.09 16:50 ticket=8 deal=8 pid=8 ppid=8 magic=773002
29792 MTEXIT bar=2026.06.09 17:10 reason=POI_BODY_BREAK line=Weekly-POC lineVal=160.189 entry=160.202 exit=160.194
29794 RN	0	08:37:05.625	Core 04	2026.06.09 17:15:00   deal #9 sell 2.48 USDJPY at 160.194 done (based on order #9)

29798 MTCLOSE bar=2026.06.09 17:10 leg=POI_BODY_BREAK ticket=8 magic=773002 action=1 retcode=10009 deal=9 closepid=8 closeentry=1 entryPid=8 flat=1 ref=160.194
29800 ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | POI_BODY_BREAK [Weekly-POC] at 160.194 (entry 160.202)
41340 UJ5MENTRY_REFUSE bar=2026.06.11 16:00 dir=LONG anchor=Daily-POC ltf=-1.0
50549 UJ5MENTRY_REFUSE bar=2026.06.12 18:15 dir=LONG anchor=Weekly-POC ltf=-1.0

## C2 11/6 rows
38042 [2026.06.11 14:20] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:15 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=2pts doji=0 touchAttr=0 confirm=0 shadow=true
38053 [2026.06.11 14:25] [SRJ-EA] SUPPRESSED bar=2026.06.11 14:20 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S1_REGIME cum_n=68 cum_opp=14 cum_hi=5 cum_both=1 action=HELD
38057 [2026.06.11 14:25] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:20 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=1 body=1pts doji=0 touchAttr=1 confirm=0 shadow=true
38059 [2026.06.11 14:25] [SRJ-EA] 2026.06.11 14:25:21 STATE S1_REGIME->S2_LTF_ALIGN dir=LONG poi=Daily-POC
38224 [2026.06.11 14:30] [SRJ-EA] SUPPRESSED bar=2026.06.11 14:25 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S2_LTF_ALIGN cum_n=69 cum_opp=14 cum_hi=5 cum_both=1 action=HELD
38228 [2026.06.11 14:30] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:25 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=0 body=1pts doji=0 touchAttr=1 confirm=0 shadow=true
38390 [2026.06.11 14:35] [SRJ-EA] SUPPRESSED bar=2026.06.11 14:30 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S2_LTF_ALIGN cum_n=70 cum_opp=14 cum_hi=5 cum_both=1 action=HELD
38394 [2026.06.11 14:35] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:30 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
38552 [2026.06.11 14:40] [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:35 site=S2POLL dir=LONG branch=1SWING fracAnchorShift=1 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-63 deltaFracNuancePts=19 fracSteps=23 fracC
38561 [2026.06.11 14:40] [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S2_LTF_ALIGN cum_n=71 cum_opp=14 cum_hi=5 cum_both=1 action=HELD
38565 [2026.06.11 14:40] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=1 body=3pts doji=0 touchAttr=1 confirm=1 shadow=true
38566 [2026.06.11 14:40] [SRJ-EA] 2026.06.11 14:40:22 STATE S2_LTF_ALIGN->S3_ZONE_WAIT dir=LONG poi=Daily-POC
38581 [2026.06.11 14:40] [SRJ-EA] 2026.06.11 14:40:22 STATE S3_ZONE_WAIT->S4_ARMED dir=LONG poi=Daily-POC
38587 [2026.06.11 14:40] [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:35 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1
38742 [2026.06.11 14:45] [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:40 site=S2POLL dir=LONG branch=1SWING fracAnchorShift=2 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-73 deltaFracNuancePts=9 fracSteps=23 fracCo
38755 [2026.06.11 14:45] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:40 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
38761 [2026.06.11 14:45] [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:40 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1
38914 [2026.06.11 14:50] [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:45 site=S2POLL dir=LONG branch=1SWING fracAnchorShift=3 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-73 deltaFracNuancePts=9 fracSteps=23 fracCo
38927 [2026.06.11 14:50] [SRJ-EA] SUPPRESSED bar=2026.06.11 14:45 poi=Daily-POC dir=SHORT opp=1 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S4_ARMED cum_n=72 cum_opp=15 cum_hi=5 cum_both=1 action=HELD
38931 [2026.06.11 14:50] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:45 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=1pts doji=0 touchAttr=1 confirm=0 shadow=true
38937 [2026.06.11 14:50] [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:45 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1
