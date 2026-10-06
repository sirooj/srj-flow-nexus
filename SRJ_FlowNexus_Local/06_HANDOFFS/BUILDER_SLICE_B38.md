# BUILDER SLICE B-38 - raw rows behind P1, P2, C1 and C2 (segment line numbers; payloads only)
j21 = RECON62-B36_JOURNAL.log (EU reference); j22 = JUNE-B36_JOURNAL.log (June reference, SHA 3CA65475); j23 = RECON62-B38_JOURNAL.log (this relay EU run, SHA 75B7321C); j24 = JUNE-B38_JOURNAL.log (this relay June run, SHA AC07557F)

## P1(b) j22 11 June 14:30/14:35/14:40 caller rows
38228 CONFIRMPOLL bar=2026.06.11 14:25 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=0 body=1pts doji=0 touchAttr=1 confirm=0 shadow=true
38394 CONFIRMPOLL bar=2026.06.11 14:30 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
38565 CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=1 body=3pts doji=0 touchAttr=1 confirm=1 shadow=true
38566 2026.06.11 14:40:22 STATE S2_LTF_ALIGN->S3_ZONE_WAIT dir=LONG poi=Daily-POC
38568 UJSBTELEM bar=2026.06.11 14:35 dir=LONG have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=160.523 o1=160.525 c1=160.522 c0=160.526 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
38581 2026.06.11 14:40:22 STATE S3_ZONE_WAIT->S4_ARMED dir=LONG poi=Daily-POC
38587 UJALIGN_NOMATCH bar=2026.06.11 14:35 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1
38588 CONFIRM_STRUCT_FAIL bar=2026.06.11 14:35 dir=LONG term=A2_CLOSE_BREAK

## P1(b) j22 11 June bar-fact rows (TPCENSUS/SWINGPICK/UJDTTERMS/RETESTDIAG/PROBE)
38232 UJPROBE bar_key=2026.06.11 14:30 h4=1.0 h1=1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=ALIGNED kind=regular readFail=0 empty=107049 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=32 ticktime=2026.06.11 14:35:10 lag=chartTime-1bar
38374 TPCENSUS #160 bar=2026.06.11 14:30 dir=LONG ref=160.523 winner=YLOH best=160.587 distPts=64 empties=8 admitted= PDH:48 ASH:25 LOH:64 NYH:11 PMH:17 YASH:25 YLOH:64 YNYH:6 YPMH:17 
38376 SWINGPICK site=S2POLL dir=LONG barShift=1 close=160.522 haveHigh=1 SH=160.534 atShift=5 haveLow=1 SL=160.508 atShift=6
38392 UJDTTERMS bar=2026.06.11 14:30 Daily-POC=LHIT/Sbody-above Daily-VWAP=LHIT/Sbody-above Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
38393 RETESTDIAG bar=2026.06.11 14:30 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:221.1pts
38402 UJPROBE bar_key=2026.06.11 14:35 h4=1.0 h1=1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular readFail=0 empty=107050 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=32 ticktime=2026.06.11 14:40:22 lag=chartTime-1bar
38545 TPCENSUS #161 bar=2026.06.11 14:35 dir=LONG ref=160.524 winner=YLOH best=160.587 distPts=63 empties=8 admitted= PDH:47 ASH:24 LOH:63 NYH:10 PMH:16 YASH:24 YLOH:63 YNYH:5 YPMH:16 
38547 SWINGPICK site=S2POLL dir=LONG barShift=1 close=160.526 haveHigh=1 SH=160.534 atShift=6 haveLow=1 SL=160.507 atShift=1
38563 UJDTTERMS bar=2026.06.11 14:35 Daily-POC=LHIT/Sbody-above Daily-VWAP=LHIT/Sbody-above Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
38564 RETESTDIAG bar=2026.06.11 14:35 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:227.0pts

## P1(d) j21 ALL A2_CLOSE_BREAK rows
2817 UJSBTELEM bar=2026.08.26 09:20 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.16622 c1=1.16647 c0=1.16628 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
2821 CONFIRM_STRUCT_FAIL bar=2026.08.26 09:20 dir=SHORT term=A2_CLOSE_BREAK
3445 UJLTFHOLD bar=2026.08.26 09:55 dir=SHORT poi=Weekly-POC state=S4_ARMED m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
3542 UJSBTELEM bar=2026.08.26 09:55 dir=SHORT have=1 sbDir=LONG sbLine=2 confC=0 confH=0 sbL=1.16642 o1=1.16641 c1=1.16651 c0=1.16668 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
3547 CONFIRM_STRUCT_FAIL bar=2026.08.26 09:55 dir=SHORT term=A2_CLOSE_BREAK
3653 UJSBTELEM bar=2026.08.26 10:00 dir=SHORT have=1 sbDir=SHORT sbLine=3 confC=0 confH=0 sbL=1.16689 o1=1.16652 c1=1.16668 c0=1.16681 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
4630 UJSBTELEM bar=2026.08.26 10:55 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.16701 c1=1.16685 c0=1.16708 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
4634 CONFIRM_STRUCT_FAIL bar=2026.08.26 10:55 dir=LONG term=A2_CLOSE_BREAK
5555 SIDE1V_BIRTH bar=2026.08.26 14:35 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
5559 SIDE1C_BOTHDIRS bar=2026.08.26 14:35 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
10909 SIDE1V_BIRTH bar=2026.08.27 09:30 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
10913 SIDE1C_BOTHDIRS bar=2026.08.27 09:30 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
10931 UJOPCONF bar=2026.08.27 09:40 poi=Daily-POC dir=SHORT opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
11447 SIDE1C_BOTHDIRS bar=2026.08.27 10:10 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
13075 SIDE1V_BIRTH bar=2026.08.27 16:25 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
13080 SIDE1C_BOTHDIRS bar=2026.08.27 16:25 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
13099 UJOPCONF bar=2026.08.27 16:35 poi=Weekly-VWAP dir=SHORT opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
14502 SIDE1C_BOTHDIRS bar=2026.08.27 17:45 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
15455 SIDE1C_BOTHDIRS bar=2026.08.27 18:20 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
15610 UJLTFHOLD bar=2026.08.27 18:30 dir=SHORT poi=Daily-VWAP state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
17719 SIDE1V_BIRTH bar=2026.08.28 14:10 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
17724 SIDE1C_BOTHDIRS bar=2026.08.28 14:10 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
17761 UJOPCONF bar=2026.08.28 14:30 poi=Daily-POC dir=SHORT opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
19769 UJSBTELEM bar=2026.08.28 16:00 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.16429 c1=1.16488 c0=1.16482 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
19817 UJOPCONF bar=2026.08.28 16:15 poi=Daily-POC dir=SHORT opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
21113 UJLTFHOLD bar=2026.08.28 17:35 dir=SHORT poi=Yearly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
21218 UJSBTELEM bar=2026.08.28 17:35 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.16017 c1=1.16103 c0=1.16053 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
21233 CONFIRM_PREBIND_FAIL bar=2026.08.28 17:35 dir=SHORT term=A2_CLOSE_BREAK
23587 SIDE1C_BOTHDIRS bar=2026.08.31 09:30 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
23650 UJOPCONF bar=2026.08.31 10:00 poi=Monthly-VWAP dir=LONG opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
23827 UJLTFHOLD bar=2026.08.31 10:10 dir=LONG poi=Monthly-VWAP state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
23946 UJSBTELEM bar=2026.08.31 10:10 dir=LONG have=1 sbDir=SHORT sbLine=3 confC=0 confH=0 sbL=1.15889 o1=1.15883 c1=1.15864 c0=1.15885 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
23961 CONFIRM_PREBIND_FAIL bar=2026.08.31 10:10 dir=LONG term=A2_CLOSE_BREAK
26787 SIDE1V_BIRTH bar=2026.08.31 14:45 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
26791 SIDE1C_BOTHDIRS bar=2026.08.31 14:45 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
27023 UJOPCONF bar=2026.08.31 15:15 poi=Yearly-POC dir=LONG opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
27193 UJLTFHOLD bar=2026.08.31 15:25 dir=LONG poi=Yearly-POC state=S4_ARMED m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
27312 UJSBTELEM bar=2026.08.31 15:25 dir=LONG have=1 sbDir=SHORT sbLine=8 confC=0 confH=0 sbL=1.15982 o1=1.15988 c1=1.15975 c0=1.15966 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
27316 CONFIRM_STRUCT_FAIL bar=2026.08.31 15:25 dir=LONG term=A2_CLOSE_BREAK
27322 UJLTFHOLD bar=2026.08.31 15:30 dir=LONG poi=Yearly-POC state=S4_ARMED m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
27436 UJSBTELEM bar=2026.08.31 15:30 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15974 c1=1.15966 c0=1.15950 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
27440 CONFIRM_STRUCT_FAIL bar=2026.08.31 15:30 dir=LONG term=A2_CLOSE_BREAK
27447 UJLTFHOLD bar=2026.08.31 15:35 dir=LONG poi=Yearly-POC state=S4_ARMED m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
27561 UJSBTELEM bar=2026.08.31 15:35 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15967 c1=1.15950 c0=1.15933 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
27565 CONFIRM_STRUCT_FAIL bar=2026.08.31 15:35 dir=LONG term=A2_CLOSE_BREAK
27571 UJLTFHOLD bar=2026.08.31 15:40 dir=LONG poi=Yearly-POC state=S4_ARMED m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
27685 UJSBTELEM bar=2026.08.31 15:40 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15950 c1=1.15933 c0=1.15937 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
27689 CONFIRM_STRUCT_FAIL bar=2026.08.31 15:40 dir=LONG term=A2_CLOSE_BREAK
27818 UJLTFHOLD bar=2026.08.31 15:50 dir=LONG poi=Yearly-POC state=S4_ARMED m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
27932 UJSBTELEM bar=2026.08.31 15:50 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15937 c1=1.15928 c0=1.15936 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
27936 CONFIRM_STRUCT_FAIL bar=2026.08.31 15:50 dir=LONG term=A2_CLOSE_BREAK
28448 UJSBTELEM bar=2026.08.31 16:10 dir=LONG have=1 sbDir=SHORT sbLine=2 confC=0 confH=0 sbL=1.15976 o1=1.15952 c1=1.15978 c0=1.15965 arm=1 termC=A2_CLOSE_BREAK termH=A_OPP - contender evaluation (Fix S3)
28578 UJSBTELEM bar=2026.08.31 16:15 dir=LONG have=1 sbDir=SHORT sbLine=8 confC=0 confH=0 sbL=1.15977 o1=1.15976 c1=1.15965 c0=1.15977 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
28582 CONFIRM_STRUCT_FAIL bar=2026.08.31 16:15 dir=LONG term=A2_CLOSE_BREAK
29906 SIDE1C_BOTHDIRS bar=2026.09.01 09:05 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
30253 SIDE1C_BOTHDIRS bar=2026.09.01 09:15 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
31783 UJOPCONF bar=2026.09.01 15:00 poi=Monthly-POC dir=SHORT opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
32691 SIDE1C_BOTHDIRS bar=2026.09.01 15:30 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
33622 SIDE1C_BOTHDIRS bar=2026.09.01 16:05 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
33855 SIDE1V_BIRTH bar=2026.09.01 16:45 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
33860 SIDE1C_BOTHDIRS bar=2026.09.01 16:45 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
35498 SIDE1V_BIRTH bar=2026.09.02 10:20 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
35503 SIDE1C_BOTHDIRS bar=2026.09.02 10:20 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
36782 SIDE1V_BIRTH bar=2026.09.02 14:00 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
36787 SIDE1C_BOTHDIRS bar=2026.09.02 14:00 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
37317 SIDE1C_BOTHDIRS bar=2026.09.02 15:40 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
37633 UJSBTELEM bar=2026.09.02 15:50 dir=SHORT have=1 sbDir=LONG sbLine=1 confC=0 confH=0 sbL=1.15786 o1=1.15764 c1=1.15801 c0=1.15790 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
37638 CONFIRM_STRUCT_FAIL bar=2026.09.02 15:50 dir=SHORT term=A2_CLOSE_BREAK
38055 UJSBTELEM bar=2026.09.02 16:05 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15782 c1=1.15798 c0=1.15810 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
38060 CONFIRM_STRUCT_FAIL bar=2026.09.02 16:05 dir=SHORT term=A2_CLOSE_BREAK
38200 UJSBTELEM bar=2026.09.02 16:10 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15798 c1=1.15810 c0=1.15786 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
38205 CONFIRM_STRUCT_FAIL bar=2026.09.02 16:10 dir=SHORT term=A2_CLOSE_BREAK
38366 UJLTFHOLD bar=2026.09.02 16:20 dir=SHORT poi=Daily-VWAP state=S4_ARMED m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
38500 UJSBTELEM bar=2026.09.02 16:20 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15786 c1=1.15821 c0=1.15903 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
38505 CONFIRM_STRUCT_FAIL bar=2026.09.02 16:20 dir=SHORT term=A2_CLOSE_BREAK
38517 UJLTFHOLD bar=2026.09.02 16:25 dir=SHORT poi=Daily-VWAP state=S4_ARMED m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
39123 SIDE1V_BIRTH bar=2026.09.02 17:00 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
39127 SIDE1C_BOTHDIRS bar=2026.09.02 17:00 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
39443 UJSBTELEM bar=2026.09.02 17:10 dir=LONG have=1 sbDir=LONG sbLine=4 confC=0 confH=0 sbL=1.15935 o1=1.16018 c1=1.15951 c0=1.15939 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
39458 CONFIRM_PREBIND_FAIL bar=2026.09.02 17:10 dir=LONG term=A2_CLOSE_BREAK
39591 UJSBTELEM bar=2026.09.02 17:15 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15951 c1=1.15939 c0=1.15920 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
39606 CONFIRM_PREBIND_FAIL bar=2026.09.02 17:15 dir=LONG term=A2_CLOSE_BREAK
39614 UJLTFHOLD bar=2026.09.02 17:20 dir=LONG poi=Yearly-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
39745 UJSBTELEM bar=2026.09.02 17:20 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15941 c1=1.15920 c0=1.15901 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
39760 CONFIRM_PREBIND_FAIL bar=2026.09.02 17:20 dir=LONG term=A2_CLOSE_BREAK
39768 UJLTFHOLD bar=2026.09.02 17:25 dir=LONG poi=Yearly-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
39905 UJSBTELEM bar=2026.09.02 17:25 dir=LONG have=1 sbDir=SHORT sbLine=4 confC=0 confH=0 sbL=1.15935 o1=1.15919 c1=1.15901 c0=1.15914 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
39920 CONFIRM_PREBIND_FAIL bar=2026.09.02 17:25 dir=LONG term=A2_CLOSE_BREAK
40235 UJLTFHOLD bar=2026.09.02 17:40 dir=LONG poi=Yearly-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
40371 UJSBTELEM bar=2026.09.02 17:40 dir=LONG have=1 sbDir=SHORT sbLine=4 confC=0 confH=0 sbL=1.15935 o1=1.15915 c1=1.15912 c0=1.15904 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
40386 CONFIRM_PREBIND_FAIL bar=2026.09.02 17:40 dir=LONG term=A2_CLOSE_BREAK
40392 UJLTFHOLD bar=2026.09.02 17:45 dir=LONG poi=Yearly-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
40527 UJSBTELEM bar=2026.09.02 17:45 dir=LONG have=1 sbDir=LONG sbLine=5 confC=0 confH=0 sbL=1.15905 o1=1.15912 c1=1.15904 c0=1.15912 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
40542 CONFIRM_PREBIND_FAIL bar=2026.09.02 17:45 dir=LONG term=A2_CLOSE_BREAK
41461 UJSBTELEM bar=2026.09.02 18:15 dir=LONG have=1 sbDir=SHORT sbLine=4 confC=0 confH=0 sbL=1.15935 o1=1.15939 c1=1.15926 c0=1.15925 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
41476 CONFIRM_PREBIND_FAIL bar=2026.09.02 18:15 dir=LONG term=A2_CLOSE_BREAK
41764 UJSBTELEM bar=2026.09.02 18:25 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15927 c1=1.15916 c0=1.15946 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
41779 CONFIRM_PREBIND_FAIL bar=2026.09.02 18:25 dir=LONG term=A2_CLOSE_BREAK
42062 UJSBTELEM bar=2026.09.02 18:35 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15946 c1=1.15926 c0=1.15941 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
42077 CONFIRM_PREBIND_FAIL bar=2026.09.02 18:35 dir=LONG term=A2_CLOSE_BREAK
42360 UJSBTELEM bar=2026.09.02 18:45 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15942 c1=1.15905 c0=1.15910 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
42375 CONFIRM_PREBIND_FAIL bar=2026.09.02 18:45 dir=LONG term=A2_CLOSE_BREAK
42659 UJSBTELEM bar=2026.09.02 18:55 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15910 c1=1.15898 c0=1.15919 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
42674 CONFIRM_PREBIND_FAIL bar=2026.09.02 18:55 dir=LONG term=A2_CLOSE_BREAK
43299 SIDE1V_BIRTH bar=2026.09.03 09:00 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
43303 SIDE1C_BOTHDIRS bar=2026.09.03 09:00 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
43619 UJSBTELEM bar=2026.09.03 09:10 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.15990 c1=1.15981 c0=1.15973 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
43623 CONFIRM_STRUCT_FAIL bar=2026.09.03 09:10 dir=LONG term=A2_CLOSE_BREAK
43770 UJSBTELEM bar=2026.09.03 09:15 dir=LONG have=1 sbDir=SHORT sbLine=8 confC=0 confH=0 sbL=1.15987 o1=1.15982 c1=1.15973 c0=1.15973 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
43774 CONFIRM_STRUCT_FAIL bar=2026.09.03 09:15 dir=LONG term=A2_CLOSE_BREAK
44449 SIDE1F_VOTE bar=2026.09.03 14:05 dir=LONG t1term=A2_CLOSE_BREAK t1reject=1 hier=LONG conf=0
44450 SIDE1G_PROFILE bar=2026.09.03 14:05 opp=1 a2=0 body=1 touch=1 pre=PASS term=A2_CLOSE_BREAK t1term=A2_CLOSE_BREAK match=1
44452 SIDE1C_BOTHDIRS bar=2026.09.03 14:05 live=LONG liveTerm=A2_CLOSE_BREAK longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
44458 UJSBTELEM bar=2026.09.03 14:05 dir=LONG have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=1.16030 o1=1.16040 c1=1.16030 c0=1.16056 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
44484 CONFIRM_STRUCT_FAIL bar=2026.09.03 14:05 dir=LONG term=A2_CLOSE_BREAK
45846 UJLTFHOLD bar=2026.09.03 17:35 dir=LONG poi=Daily-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
45986 UJSBTELEM bar=2026.09.03 17:35 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.16231 c1=1.16183 c0=1.16154 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
46001 CONFIRM_PREBIND_FAIL bar=2026.09.03 17:35 dir=LONG term=A2_CLOSE_BREAK
46007 UJLTFHOLD bar=2026.09.03 17:40 dir=LONG poi=Daily-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
46147 UJSBTELEM bar=2026.09.03 17:40 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.16183 c1=1.16154 c0=1.16137 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
46162 CONFIRM_PREBIND_FAIL bar=2026.09.03 17:40 dir=LONG term=A2_CLOSE_BREAK
46168 UJLTFHOLD bar=2026.09.03 17:45 dir=LONG poi=Daily-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
46309 UJSBTELEM bar=2026.09.03 17:45 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.16154 c1=1.16137 c0=1.16162 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
46324 CONFIRM_PREBIND_FAIL bar=2026.09.03 17:45 dir=LONG term=A2_CLOSE_BREAK
46650 UJLTFHOLD bar=2026.09.03 18:00 dir=LONG poi=Daily-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
46795 UJSBTELEM bar=2026.09.03 18:00 dir=LONG have=1 sbDir=SHORT sbLine=0 confC=0 confH=0 sbL=1.16223 o1=1.16188 c1=1.16182 c0=1.16216 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
46810 CONFIRM_PREBIND_FAIL bar=2026.09.03 18:00 dir=LONG term=A2_CLOSE_BREAK
48635 SIDE1V_BIRTH bar=2026.09.04 09:15 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
48639 SIDE1C_BOTHDIRS bar=2026.09.04 09:15 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
49217 SIDE1V_BIRTH bar=2026.09.04 09:30 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
49221 SIDE1C_BOTHDIRS bar=2026.09.04 09:30 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
49371 SIDE1C_BOTHDIRS bar=2026.09.04 10:10 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
51257 SIDE1V_BIRTH bar=2026.09.04 15:30 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
51261 SIDE1C_BOTHDIRS bar=2026.09.04 15:30 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
51295 SIDE1C_BOTHDIRS bar=2026.09.04 15:35 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
54201 SIDE1V_BIRTH bar=2026.09.07 09:00 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
54205 SIDE1C_BOTHDIRS bar=2026.09.07 09:00 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
55655 SIDE1F_VOTE bar=2026.09.07 14:55 dir=LONG t1term=A2_CLOSE_BREAK t1reject=1 hier=LONG conf=0
55656 SIDE1G_PROFILE bar=2026.09.07 14:55 opp=1 a2=0 body=0 touch=1 pre=PASS term=A2_CLOSE_BREAK t1term=A2_CLOSE_BREAK match=1
55658 SIDE1C_BOTHDIRS bar=2026.09.07 14:55 live=LONG liveTerm=A2_CLOSE_BREAK longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
56539 UJLTFHOLD bar=2026.09.07 15:25 dir=SHORT poi=Weekly-POC state=S4_ARMED m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
56699 UJSBTELEM bar=2026.09.07 15:25 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.16227 c1=1.16249 c0=1.16269 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
56704 CONFIRM_STRUCT_FAIL bar=2026.09.07 15:25 dir=SHORT term=A2_CLOSE_BREAK
56872 UJSBTELEM bar=2026.09.07 15:30 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.16249 c1=1.16269 c0=1.16268 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
56953 UJOPCONF bar=2026.09.07 16:15 poi=Weekly-POC dir=LONG opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
57484 UJSBTELEM bar=2026.09.07 16:30 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.16251 c1=1.16249 c0=1.16259 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
57488 CONFIRM_STRUCT_FAIL bar=2026.09.07 16:30 dir=LONG term=A2_CLOSE_BREAK
59042 SIDE1C_BOTHDIRS bar=2026.09.08 09:30 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
60183 SIDE1V_BIRTH bar=2026.09.08 14:00 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
60188 SIDE1C_BOTHDIRS bar=2026.09.08 14:00 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
61042 SIDE1C_BOTHDIRS bar=2026.09.08 16:30 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
63353 SIDE1C_BOTHDIRS bar=2026.09.09 11:55 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
64655 UJLTFHOLD bar=2026.09.09 18:30 dir=SHORT poi=Monthly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
64835 UJSBTELEM bar=2026.09.09 18:30 dir=SHORT have=1 sbDir=LONG sbLine=2 confC=0 confH=0 sbL=1.16249 o1=1.16211 c1=1.16249 c0=1.16258 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
64850 CONFIRM_PREBIND_FAIL bar=2026.09.09 18:30 dir=SHORT term=A2_CLOSE_BREAK
64857 UJLTFHOLD bar=2026.09.09 18:35 dir=SHORT poi=Monthly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
65032 UJSBTELEM bar=2026.09.09 18:35 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.00000 o1=1.16250 c1=1.16258 c0=1.16340 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
65047 CONFIRM_PREBIND_FAIL bar=2026.09.09 18:35 dir=SHORT term=A2_CLOSE_BREAK
65055 UJLTFHOLD bar=2026.09.09 18:40 dir=SHORT poi=Monthly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
65234 UJSBTELEM bar=2026.09.09 18:40 dir=SHORT have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=1.16305 o1=1.16257 c1=1.16340 c0=1.16311 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
65249 CONFIRM_PREBIND_FAIL bar=2026.09.09 18:40 dir=SHORT term=A2_CLOSE_BREAK

## P1(d) j22 ALL A2_CLOSE_BREAK rows
3913 SIDE1C_BOTHDIRS bar=2026.06.02 09:20 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
3960 UJOPCONF bar=2026.06.02 09:40 poi=Daily-POC dir=LONG opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
4257 UJLTFHOLD bar=2026.06.02 09:55 dir=LONG poi=Daily-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
4366 UJSBTELEM bar=2026.06.02 09:55 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=159.723 c1=159.697 c0=159.705 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
4376 CONFIRM_PREBIND_FAIL bar=2026.06.02 09:55 dir=LONG term=A2_CLOSE_BREAK
4769 UJLTFHOLD bar=2026.06.02 10:15 dir=LONG poi=Daily-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
4883 UJSBTELEM bar=2026.06.02 10:15 dir=LONG have=1 sbDir=SHORT sbLine=0 confC=0 confH=0 sbL=159.716 o1=159.715 c1=159.708 c0=159.716 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
4893 CONFIRM_PREBIND_FAIL bar=2026.06.02 10:15 dir=LONG term=A2_CLOSE_BREAK
5216 SIDE1C_BOTHDIRS bar=2026.06.02 10:25 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
5249 UJOPCONF bar=2026.06.02 10:40 poi=Daily-POC dir=LONG opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
5412 UJLTFHOLD bar=2026.06.02 10:50 dir=LONG poi=Daily-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
5527 UJSBTELEM bar=2026.06.02 10:50 dir=LONG have=1 sbDir=SHORT sbLine=0 confC=0 confH=0 sbL=159.717 o1=159.717 c1=159.705 c0=159.702 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
5537 CONFIRM_PREBIND_FAIL bar=2026.06.02 10:50 dir=LONG term=A2_CLOSE_BREAK
5544 UJLTFHOLD bar=2026.06.02 10:55 dir=LONG poi=Daily-POC state=S3_ZONE_WAIT m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
5655 UJSBTELEM bar=2026.06.02 10:55 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=159.706 c1=159.702 c0=159.693 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
5665 CONFIRM_PREBIND_FAIL bar=2026.06.02 10:55 dir=LONG term=A2_CLOSE_BREAK
5785 UJSBTELEM bar=2026.06.02 11:00 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=159.701 c1=159.693 c0=159.669 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
5810 SIDE1V_BIRTH bar=2026.06.02 11:10 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
5814 SIDE1C_BOTHDIRS bar=2026.06.02 11:10 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
7083 SIDE1V_BIRTH bar=2026.06.02 14:20 dir=SHORT tf=0 mr=1 confShort=A2_CLOSE_BREAK
7087 SIDE1C_BOTHDIRS bar=2026.06.02 14:20 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
12561 SIDE1V_BIRTH bar=2026.06.03 09:00 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
12565 SIDE1C_BOTHDIRS bar=2026.06.03 09:00 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
13323 SIDE1V_BIRTH bar=2026.06.03 14:30 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
13327 SIDE1C_BOTHDIRS bar=2026.06.03 14:30 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
13775 SIDE1V_BIRTH bar=2026.06.03 15:50 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
13779 SIDE1C_BOTHDIRS bar=2026.06.03 15:50 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
15801 UJLTFHOLD bar=2026.06.03 17:15 dir=LONG poi=Daily-POC state=S4_ARMED m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
15918 UJSBTELEM bar=2026.06.03 17:15 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=159.977 c1=159.930 c0=159.968 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
15922 CONFIRM_STRUCT_FAIL bar=2026.06.03 17:15 dir=LONG term=A2_CLOSE_BREAK
16709 UJOPCONF bar=2026.06.03 18:50 poi=Daily-POC dir=LONG opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
18527 UJOPCONF bar=2026.06.04 17:00 poi=Daily-POC dir=LONG opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
19687 SIDE1C_BOTHDIRS bar=2026.06.05 09:05 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
19724 UJOPCONF bar=2026.06.05 09:15 poi=Daily-POC dir=SHORT opConf=0 heldConf=0 opTerm=A2_CLOSE_BREAK heldTerm=A_OPP - displace-gate inputs (Fix H1)
19738 UJSBTELEM bar=2026.06.05 09:15 dir=SHORT have=1 sbDir=SHORT sbLine=0 confC=0 confH=0 sbL=159.960 o1=159.960 c1=159.961 c0=159.959 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
19759 CONFIRM_PREBIND_FAIL bar=2026.06.05 09:15 dir=SHORT term=A2_CLOSE_BREAK
21146 SIDE1V_BIRTH bar=2026.06.05 16:00 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
21150 SIDE1C_BOTHDIRS bar=2026.06.05 16:00 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
24199 SIDE1C_BOTHDIRS bar=2026.06.09 09:50 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
24464 UJLTFHOLD bar=2026.06.09 10:15 dir=SHORT poi=Daily-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
24614 UJSBTELEM bar=2026.06.09 10:15 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.183 c1=160.196 c0=160.203 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
24629 CONFIRM_PREBIND_FAIL bar=2026.06.09 10:15 dir=SHORT term=A2_CLOSE_BREAK
24634 UJLTFHOLD bar=2026.06.09 10:20 dir=SHORT poi=Daily-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
24785 UJSBTELEM bar=2026.06.09 10:20 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.197 c1=160.203 c0=160.187 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
24800 CONFIRM_PREBIND_FAIL bar=2026.06.09 10:20 dir=SHORT term=A2_CLOSE_BREAK
25484 UJSBTELEM bar=2026.06.09 10:40 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.188 c1=160.193 c0=160.166 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
25504 CONFIRM_STRUCT_FAIL bar=2026.06.09 10:40 dir=SHORT term=A2_CLOSE_BREAK
25875 SIDE1V_BIRTH bar=2026.06.09 11:10 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
25879 SIDE1C_BOTHDIRS bar=2026.06.09 11:10 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
25979 UJOPCONF bar=2026.06.09 11:55 poi=Weekly-POC dir=SHORT opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
26146 SIDE1V_BIRTH bar=2026.06.09 14:15 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
26150 SIDE1C_BOTHDIRS bar=2026.06.09 14:15 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
26328 UJLTFHOLD bar=2026.06.09 15:15 dir=SHORT poi=Daily-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
26484 UJSBTELEM bar=2026.06.09 15:15 dir=SHORT have=1 sbDir=LONG sbLine=2 confC=0 confH=0 sbL=160.161 o1=160.159 c1=160.162 c0=160.173 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
26499 CONFIRM_PREBIND_FAIL bar=2026.06.09 15:15 dir=SHORT term=A2_CLOSE_BREAK
26505 UJLTFHOLD bar=2026.06.09 15:20 dir=SHORT poi=Daily-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
26659 UJSBTELEM bar=2026.06.09 15:20 dir=SHORT have=1 sbDir=SHORT sbLine=1 confC=0 confH=0 sbL=160.177 o1=160.161 c1=160.173 c0=160.174 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
26674 CONFIRM_PREBIND_FAIL bar=2026.06.09 15:20 dir=SHORT term=A2_CLOSE_BREAK
26851 UJLTFHOLD bar=2026.06.09 15:30 dir=SHORT poi=Daily-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
27000 UJSBTELEM bar=2026.06.09 15:30 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.173 c1=160.183 c0=160.174 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
27015 CONFIRM_PREBIND_FAIL bar=2026.06.09 15:30 dir=SHORT term=A2_CLOSE_BREAK
27192 UJLTFHOLD bar=2026.06.09 15:40 dir=SHORT poi=Daily-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
27341 UJSBTELEM bar=2026.06.09 15:40 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.175 c1=160.178 c0=160.173 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
27356 CONFIRM_PREBIND_FAIL bar=2026.06.09 15:40 dir=SHORT term=A2_CLOSE_BREAK
27535 UJLTFHOLD bar=2026.06.09 15:50 dir=SHORT poi=Daily-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
27689 UJSBTELEM bar=2026.06.09 15:50 dir=SHORT have=1 sbDir=LONG sbLine=1 confC=0 confH=0 sbL=160.177 o1=160.175 c1=160.182 c0=160.185 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
27704 CONFIRM_PREBIND_FAIL bar=2026.06.09 15:50 dir=SHORT term=A2_CLOSE_BREAK
27711 UJLTFHOLD bar=2026.06.09 15:55 dir=SHORT poi=Daily-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
28067 UJLTFHOLD bar=2026.06.09 16:05 dir=SHORT poi=Weekly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
28217 UJSBTELEM bar=2026.06.09 16:05 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.186 c1=160.193 c0=160.186 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
28232 CONFIRM_PREBIND_FAIL bar=2026.06.09 16:05 dir=SHORT term=A2_CLOSE_BREAK
28759 UJLTFHOLD bar=2026.06.09 16:25 dir=SHORT poi=Weekly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
28913 UJSBTELEM bar=2026.06.09 16:25 dir=SHORT have=1 sbDir=LONG sbLine=2 confC=0 confH=0 sbL=160.189 o1=160.188 c1=160.190 c0=160.195 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
28928 CONFIRM_PREBIND_FAIL bar=2026.06.09 16:25 dir=SHORT term=A2_CLOSE_BREAK
28934 UJLTFHOLD bar=2026.06.09 16:30 dir=SHORT poi=Weekly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
29088 UJSBTELEM bar=2026.06.09 16:30 dir=SHORT have=1 sbDir=LONG sbLine=2 confC=0 confH=0 sbL=160.189 o1=160.190 c1=160.195 c0=160.195 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
29103 CONFIRM_PREBIND_FAIL bar=2026.06.09 16:30 dir=SHORT term=A2_CLOSE_BREAK
29323 SIDE1V_BIRTH bar=2026.06.09 16:45 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
29327 SIDE1C_BOTHDIRS bar=2026.06.09 16:45 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
30591 SIDE1C_BOTHDIRS bar=2026.06.10 09:15 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
30611 UJOPCONF bar=2026.06.10 09:25 poi=Daily-VWAP dir=LONG opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
30989 UJSBTELEM bar=2026.06.10 09:35 dir=LONG have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=160.354 o1=160.366 c1=160.359 c0=160.354 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
30993 CONFIRM_STRUCT_FAIL bar=2026.06.10 09:35 dir=LONG term=A2_CLOSE_BREAK
31154 UJSBTELEM bar=2026.06.10 09:40 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.357 c1=160.354 c0=160.361 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
31158 CONFIRM_STRUCT_FAIL bar=2026.06.10 09:40 dir=LONG term=A2_CLOSE_BREAK
31657 UJSBTELEM bar=2026.06.10 09:55 dir=LONG have=1 sbDir=LONG sbLine=1 confC=0 confH=0 sbL=160.363 o1=160.364 c1=160.363 c0=160.384 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
31661 CONFIRM_STRUCT_FAIL bar=2026.06.10 09:55 dir=LONG term=A2_CLOSE_BREAK
32339 UJLTFHOLD bar=2026.06.10 10:20 dir=LONG poi=Daily-VWAP state=S4_ARMED m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
32500 UJSBTELEM bar=2026.06.10 10:20 dir=LONG have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=160.354 o1=160.370 c1=160.359 c0=160.356 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
32504 CONFIRM_STRUCT_FAIL bar=2026.06.10 10:20 dir=LONG term=A2_CLOSE_BREAK
32511 UJLTFHOLD bar=2026.06.10 10:25 dir=LONG poi=Daily-VWAP state=S4_ARMED m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
33516 UJSBTELEM bar=2026.06.10 15:50 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.394 c1=160.351 c0=160.400 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
33531 CONFIRM_PREBIND_FAIL bar=2026.06.10 15:50 dir=LONG term=A2_CLOSE_BREAK
35455 UJSBTELEM bar=2026.06.10 16:45 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.379 c1=160.356 c0=160.344 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
35475 CONFIRM_STRUCT_FAIL bar=2026.06.10 16:45 dir=LONG term=A2_CLOSE_BREAK
35548 SIDE1V_BIRTH bar=2026.06.10 17:10 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
35552 SIDE1C_BOTHDIRS bar=2026.06.10 17:10 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
36419 SIDE1C_BOTHDIRS bar=2026.06.11 10:10 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
36808 UJSBTELEM bar=2026.06.11 10:45 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.537 c1=160.509 c0=160.510 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
36828 CONFIRM_STRUCT_FAIL bar=2026.06.11 10:45 dir=LONG term=A2_CLOSE_BREAK
37032 SIDE1V_BIRTH bar=2026.06.11 11:05 dir=SHORT tf=0 mr=0 confShort=A2_CLOSE_BREAK
37036 SIDE1C_BOTHDIRS bar=2026.06.11 11:05 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
38024 SIDE1C_BOTHDIRS bar=2026.06.11 14:05 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
38050 UJOPCONF bar=2026.06.11 14:20 poi=Daily-POC dir=LONG opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
38568 UJSBTELEM bar=2026.06.11 14:35 dir=LONG have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=160.523 o1=160.525 c1=160.522 c0=160.526 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
38588 CONFIRM_STRUCT_FAIL bar=2026.06.11 14:35 dir=LONG term=A2_CLOSE_BREAK
38933 UJSBTELEM bar=2026.06.11 14:45 dir=LONG have=1 sbDir=SHORT sbLine=0 confC=0 confH=0 sbL=160.523 o1=160.524 c1=160.521 c0=160.519 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
38938 CONFIRM_STRUCT_FAIL bar=2026.06.11 14:45 dir=LONG term=A2_CLOSE_BREAK
39103 UJSBTELEM bar=2026.06.11 14:50 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.520 c1=160.519 c0=160.520 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
39108 CONFIRM_STRUCT_FAIL bar=2026.06.11 14:50 dir=LONG term=A2_CLOSE_BREAK
39949 UJSBTELEM bar=2026.06.11 15:15 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.532 c1=160.530 c0=160.543 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
39954 CONFIRM_STRUCT_FAIL bar=2026.06.11 15:15 dir=LONG term=A2_CLOSE_BREAK
41606 UJLTFHOLD bar=2026.06.11 16:35 dir=LONG poi=Daily-POC state=S4_ARMED m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
41769 UJSBTELEM bar=2026.06.11 16:35 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.534 c1=160.511 c0=160.534 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
41774 CONFIRM_STRUCT_FAIL bar=2026.06.11 16:35 dir=LONG term=A2_CLOSE_BREAK
41958 UJLTFHOLD bar=2026.06.11 16:45 dir=LONG poi=Daily-POC state=S4_ARMED m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
42125 UJSBTELEM bar=2026.06.11 16:45 dir=LONG have=1 sbDir=SHORT sbLine=1 confC=0 confH=0 sbL=160.529 o1=160.535 c1=160.524 c0=160.496 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
42130 CONFIRM_STRUCT_FAIL bar=2026.06.11 16:45 dir=LONG term=A2_CLOSE_BREAK
42137 UJLTFHOLD bar=2026.06.11 16:50 dir=LONG poi=Daily-POC state=S4_ARMED m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
42298 UJSBTELEM bar=2026.06.11 16:50 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.524 c1=160.496 c0=160.471 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
42303 CONFIRM_STRUCT_FAIL bar=2026.06.11 16:50 dir=LONG term=A2_CLOSE_BREAK
42312 UJLTFHOLD bar=2026.06.11 16:55 dir=LONG poi=Daily-POC state=S4_ARMED m15=1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
42473 UJSBTELEM bar=2026.06.11 16:55 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.498 c1=160.471 c0=160.485 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
42479 CONFIRM_STRUCT_FAIL bar=2026.06.11 16:55 dir=LONG term=A2_CLOSE_BREAK
42707 SIDE1V_BIRTH bar=2026.06.11 17:35 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
42711 SIDE1C_BOTHDIRS bar=2026.06.11 17:35 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
42729 UJOPCONF bar=2026.06.11 17:45 poi=Daily-VWAP dir=SHORT opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
46121 SIDE1C_BOTHDIRS bar=2026.06.12 11:05 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
47973 UJLTFHOLD bar=2026.06.12 15:05 dir=SHORT poi=Weekly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
48156 UJSBTELEM bar=2026.06.12 15:05 dir=SHORT have=1 sbDir=LONG sbLine=2 confC=0 confH=0 sbL=160.189 o1=160.175 c1=160.193 c0=160.196 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
48171 CONFIRM_PREBIND_FAIL bar=2026.06.12 15:05 dir=SHORT term=A2_CLOSE_BREAK
48178 UJLTFHOLD bar=2026.06.12 15:10 dir=SHORT poi=Weekly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
48359 UJSBTELEM bar=2026.06.12 15:10 dir=SHORT have=1 sbDir=LONG sbLine=2 confC=0 confH=0 sbL=160.189 o1=160.189 c1=160.196 c0=160.191 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
48374 CONFIRM_PREBIND_FAIL bar=2026.06.12 15:10 dir=SHORT term=A2_CLOSE_BREAK
48776 UJLTFHOLD bar=2026.06.12 15:25 dir=SHORT poi=Weekly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
48954 UJSBTELEM bar=2026.06.12 15:25 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.183 c1=160.224 c0=160.245 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
48969 CONFIRM_PREBIND_FAIL bar=2026.06.12 15:25 dir=SHORT term=A2_CLOSE_BREAK
48977 UJLTFHOLD bar=2026.06.12 15:30 dir=SHORT poi=Weekly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
49159 UJSBTELEM bar=2026.06.12 15:30 dir=SHORT have=1 sbDir=SHORT sbLine=3 confC=0 confH=0 sbL=160.259 o1=160.223 c1=160.245 c0=160.258 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
49174 CONFIRM_PREBIND_FAIL bar=2026.06.12 15:30 dir=SHORT term=A2_CLOSE_BREAK
49180 UJLTFHOLD bar=2026.06.12 15:35 dir=SHORT poi=Weekly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
49358 UJSBTELEM bar=2026.06.12 15:35 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.243 c1=160.258 c0=160.272 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
49373 CONFIRM_PREBIND_FAIL bar=2026.06.12 15:35 dir=SHORT term=A2_CLOSE_BREAK
49380 UJLTFHOLD bar=2026.06.12 15:40 dir=SHORT poi=Weekly-POC state=S3_ZONE_WAIT m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
49564 UJSBTELEM bar=2026.06.12 15:40 dir=SHORT have=1 sbDir=LONG sbLine=3 confC=0 confH=0 sbL=160.259 o1=160.257 c1=160.272 c0=160.269 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
49579 CONFIRM_PREBIND_FAIL bar=2026.06.12 15:40 dir=SHORT term=A2_CLOSE_BREAK
49801 SIDE1C_BOTHDIRS bar=2026.06.12 16:00 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
49947 SIDE1C_BOTHDIRS bar=2026.06.12 17:05 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
50059 SIDE1C_BOTHDIRS bar=2026.06.12 17:40 live=SHORT liveTerm=A_OPP longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
50566 SIDE1V_BIRTH bar=2026.06.12 18:20 dir=SHORT tf=1 mr=0 confShort=A2_CLOSE_BREAK
50570 SIDE1C_BOTHDIRS bar=2026.06.12 18:20 live=LONG liveTerm=A_OPP longTerm=A_OPP shortTerm=A2_CLOSE_BREAK
50606 UJOPCONF bar=2026.06.12 18:35 poi=Weekly-POC dir=SHORT opConf=0 heldConf=0 opTerm=A_OPP heldTerm=A2_CLOSE_BREAK - displace-gate inputs (Fix H1)
50844 UJLTFHOLD bar=2026.06.12 18:45 dir=SHORT poi=Weekly-POC state=S4_ARMED m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
51021 UJSBTELEM bar=2026.06.12 18:45 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.183 c1=160.222 c0=160.237 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
51026 CONFIRM_STRUCT_FAIL bar=2026.06.12 18:45 dir=SHORT term=A2_CLOSE_BREAK
51033 UJLTFHOLD bar=2026.06.12 18:50 dir=SHORT poi=Weekly-POC state=S4_ARMED m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
51211 UJSBTELEM bar=2026.06.12 18:50 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.223 c1=160.237 c0=160.237 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
51216 CONFIRM_STRUCT_FAIL bar=2026.06.12 18:50 dir=SHORT term=A2_CLOSE_BREAK
51225 UJLTFHOLD bar=2026.06.12 18:55 dir=SHORT poi=Weekly-POC state=S4_ARMED m15=-1.0 rf=1 mode=M15 term=A2_CLOSE_BREAK - LTF opposed, hold (Fix F11)
51403 UJSBTELEM bar=2026.06.12 18:55 dir=SHORT have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.236 c1=160.237 c0=160.245 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
51408 CONFIRM_STRUCT_FAIL bar=2026.06.12 18:55 dir=SHORT term=A2_CLOSE_BREAK

## P2(a) j24 9 June fire/exit rows
30073 TPCENSUS #128 bar=2026.06.09 16:50 dir=LONG ref=160.202 winner=YASH best=160.278 distPts=76 empties=8 admitted= PDH:190 ASH:76 LOH:20 NYH:22 PMH:65 YASH:76 YLOH:20 YPMH:65 PD:190 PD:38 PD:96 PD:138 
30241 TPCENSUS #129 bar=2026.06.09 16:50 dir=LONG ref=160.202 winner=YASH best=160.278 distPts=76 empties=8 admitted= PDH:190 ASH:76 LOH:20 NYH:22 PMH:65 YASH:76 YLOH:20 YPMH:65 PD:190 PD:38 PD:96 PD:138 
30302 A6FIRED class=SELECTED state=FIRED bar=2026.06.09 16:50 dir=LONG tp=160.278 r=1.31 sl=160.144 mode=1SWING div=regular
30304 ALERT SRJ SIGNAL LONG USDJPY M5 | Weekly-VWAP | NYAM | R=1.31 SL 160.144 TP 160.278 spr=7
30318 ENTRY_TICKET bar=2026.06.09 16:50 ticket=8 deal=8 pid=8 ppid=8 magic=773002
30374 MTEXIT bar=2026.06.09 17:10 reason=POI_BODY_BREAK line=Weekly-POC lineVal=160.189 entry=160.202 exit=160.194
30376 HJ	0	10:23:17.161	Core 04	2026.06.09 17:15:00   deal #9 sell 2.48 USDJPY at 160.194 done (based on order #9)
30380 MTCLOSE bar=2026.06.09 17:10 leg=POI_BODY_BREAK ticket=8 magic=773002 action=1 retcode=10009 deal=9 closepid=8 closeentry=1 entryPid=8 flat=1 ref=160.194
30382 ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | POI_BODY_BREAK [Weekly-POC] at 160.194 (entry 160.202)

## P2(a) j24 9 June probe/anchor rows
29891 PE	0	10:23:17.161	Core 04	2026.06.09 16:50:00   Alert: USDJPY M5 - POI RETEST LONG at 160.159  [W-VWAP]
29895 UJPROBE bar_key=2026.06.09 16:45 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106630 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=30 ticktime=2026.06.09 16:50:00 lag=chartTime-1bar
29941 UJPROBE bar_key=2026.06.09 16:50 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular readFail=0 empty=106630 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=30 ticktime=2026.06.09 16:55:03 lag=chartTime-1bar
30091 UJDTTERMS bar=2026.06.09 16:50 Daily-POC=Lbody-below/Sbody-above Daily-VWAP=Lbody-below/Sbody-above Weekly-POC=Lbody-below/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
30092 RETESTDIAG bar=2026.06.09 16:50 inside=Daily-POC Daily-VWAP Weekly-POC nearAbove=-:-pts nearBelow=Weekly-VWAP:11.3pts
30094 UJSBTELEM bar=2026.06.09 16:50 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=1 sbL=0.000 o1=160.218 c1=160.173 c0=160.202 arm=1 termC= termH= - contender evaluation (Fix S3)
30334 OQ	0	10:23:17.161	Core 04	2026.06.09 17:05:00   Alert: USDJPY M5 - POI RETEST LONG at 160.159  [W-VWAP]

## C1 j23 filed rows (all fires/entries/exits/broker)
17157 A6FIRED class=SELECTED state=FIRED bar=2026.08.28 10:00 dir=SHORT tp=1.16364 r=2.43 sl=1.16508 mode=2SWING div=regular
17159 ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-VWAP | LONDON | R=2.43 SL 1.16508 TP 1.16364 spr=4
17173 ENTRY_TICKET bar=2026.08.28 10:00 ticket=2 deal=2 pid=2 ppid=2 magic=773001
17574 MTEXIT bar=2026.08.28 11:40 reason=POI_BODY_BREAK line=Daily-POC lineVal=1.16451 entry=1.16466 exit=1.16439
17582 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | POI_BODY_BREAK [Daily-POC] at 1.16439 (entry 1.16466)
34481 A6FIRED class=SELECTED state=FIRED bar=2026.09.01 17:30 dir=LONG tp=1.16077 r=1.17 sl=1.15975 mode=1SWING div=hidden
34483 ALERT SRJ SIGNAL LONG EURUSD M5 | Monthly-VWAP | NYAM | R=1.17 SL 1.15975 TP 1.16077 spr=2
34499 ENTRY_TICKET bar=2026.09.01 17:30 ticket=4 deal=4 pid=4 ppid=4 magic=773002
34592 MTEXIT bar=2026.09.01 17:50 reason=SL line=- lineVal=- entry=1.16022 exit=1.15975
34594 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | SL at 1.15975 (entry 1.16022)
50121 A6FIRED class=SELECTED state=FIRED bar=2026.09.04 15:55 dir=LONG tp=1.16302 r=1.66 sl=1.15847 mode=1SWING div=hidden
50123 ALERT SRJ SIGNAL LONG EURUSD M5 | Yearly-POC | NYAM | R=1.66 SL 1.15847 TP 1.16302 spr=1
50137 ENTRY_TICKET bar=2026.09.04 15:55 ticket=6 deal=6 pid=6 ppid=6 magic=773002
50852 UJRETARGET_BROKER bar=2026.09.04 19:00 ticket=6 oldTp=1.16302 newTp=1.16270 sl=1.15847 ok=1 rc=10009 action=SENT
51825 MTEXIT bar=2026.09.04 23:50 reason=DAY_CLOSE line=- lineVal=- entry=1.16018 exit=1.16129
51833 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | DAY_CLOSE at 1.16129 (entry 1.16018)
52991 A6FIRED class=SELECTED state=FIRED bar=2026.09.07 09:15 dir=LONG tp=1.16200 r=1.76 sl=1.16098 mode=1SWING div=hidden
52993 ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-POC | LONDON | R=1.76 SL 1.16098 TP 1.16200 spr=3
53007 ENTRY_TICKET bar=2026.09.07 09:15 ticket=8 deal=8 pid=8 ppid=8 magic=773001
53398 MTEXIT bar=2026.09.07 10:50 reason=TP_TOUCH line=- lineVal=- entry=1.16135 exit=1.16200
53400 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | TP_TOUCH at 1.16200 (entry 1.16135)
56059 A6FIRED class=SELECTED state=FIRED bar=2026.09.07 16:40 dir=LONG tp=1.16315 r=2.34 sl=1.16238 mode=1SWING div=hidden
56061 ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-POC | NYAM | R=2.34 SL 1.16238 TP 1.16315 spr=3
56075 ENTRY_TICKET bar=2026.09.07 16:40 ticket=10 deal=10 pid=10 ppid=10 magic=773002
56199 MTEXIT bar=2026.09.07 17:10 reason=TP_TOUCH line=- lineVal=- entry=1.16261 exit=1.16315
56201 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | TP_TOUCH at 1.16315 (entry 1.16261)
57828 A6FIRED class=SELECTED state=FIRED bar=2026.09.08 10:05 dir=SHORT tp=1.16102 r=1.94 sl=1.16258 mode=1SWING div=hidden
57830 ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | LONDON | R=1.94 SL 1.16258 TP 1.16102 spr=1
57846 ENTRY_TICKET bar=2026.09.08 10:05 ticket=12 deal=12 pid=12 ppid=12 magic=773001
58001 MTEXIT bar=2026.09.08 10:40 reason=TP_TOUCH line=- lineVal=- entry=1.16205 exit=1.16102
58003 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | TP_TOUCH at 1.16102 (entry 1.16205)
60181 A6FIRED class=SELECTED state=FIRED bar=2026.09.08 16:55 dir=SHORT tp=1.16114 r=1.96 sl=1.16274 mode=1SWING div=regular
60183 ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | NYAM | R=1.96 SL 1.16274 TP 1.16114 spr=3
60197 ENTRY_TICKET bar=2026.09.08 16:55 ticket=14 deal=14 pid=14 ppid=14 magic=773002
60369 MTEXIT bar=2026.09.08 17:30 reason=SL line=- lineVal=- entry=1.16220 exit=1.16274
60371 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | SL at 1.16274 (entry 1.16220)

## C1 j23 refusal + probe-count rows
31331 UJ5MENTRY_REFUSE bar=2026.09.01 09:50 dir=LONG anchor=Weekly-VWAP ltf=-1.0
31332 2026.09.01 09:55:00 ABORT reason=LTF_MISALIGN state=S5_GATE_CHECK poi=Weekly-VWAP dir=LONG
31333 A6REFUSED class=ABSENT_DECLINED bar=2026.09.01 09:55 state=S5_GATE_CHECK dir=LONG predicate=LTF_MISALIGN
31334 ALERT SRJ STAND-DOWN LONG EURUSD M5 | Weekly-VWAP | LONDON | reason=LTF_MISALIGN
31335 2026.09.01 09:55:00 STATE S5_GATE_CHECK->ABORT dir=LONG poi=Weekly-VWAP
32659 UJ5MENTRY_REFUSE bar=2026.09.01 15:25 dir=SHORT anchor=Monthly-POC ltf=1.0

## C2 j24 filed rows (all fires/entries/exits)
12875 A6FIRED class=SELECTED state=FIRED bar=2026.06.03 09:05 dir=LONG tp=159.983 r=1.35 sl=159.889 mode=1SWING div=hidden
12877 ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-VWAP | LONDON | R=1.35 SL 159.889 TP 159.983 spr=3
12891 ENTRY_TICKET bar=2026.06.03 09:05 ticket=2 deal=2 pid=2 ppid=2 magic=773001
12989 MTEXIT bar=2026.06.03 09:55 reason=TP_TOUCH line=- lineVal=- entry=159.929 exit=159.983
12991 ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | TP_TOUCH at 159.983 (entry 159.929)
17826 A6FIRED class=SELECTED state=FIRED bar=2026.06.04 09:50 dir=SHORT tp=159.368 r=9.62 sl=159.920 mode=1SWING div=hidden
17828 ALERT SRJ SIGNAL SHORT USDJPY M5 | Daily-POC | LONDON | R=9.62 SL 159.920 TP 159.368 spr=5
17842 ENTRY_TICKET bar=2026.06.04 09:50 ticket=4 deal=4 pid=4 ppid=4 magic=773001
17968 MTEXIT bar=2026.06.04 10:40 reason=SL line=- lineVal=- entry=159.868 exit=159.920
17970 ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | SL at 159.920 (entry 159.868)
22300 A6FIRED class=SELECTED state=FIRED bar=2026.06.05 16:50 dir=LONG tp=160.723 r=1.56 sl=159.726 mode=1SWING div=regular
22302 ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-POC | NYAM | R=1.56 SL 159.726 TP 160.723 spr=5
22316 ENTRY_TICKET bar=2026.06.05 16:50 ticket=6 deal=6 pid=6 ppid=6 magic=773002
22584 MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH line=- lineVal=- entry=160.115 exit=160.298
22586 ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | TP_TOUCH at 160.298 (entry 160.115)
30302 A6FIRED class=SELECTED state=FIRED bar=2026.06.09 16:50 dir=LONG tp=160.278 r=1.31 sl=160.144 mode=1SWING div=regular
30304 ALERT SRJ SIGNAL LONG USDJPY M5 | Weekly-VWAP | NYAM | R=1.31 SL 160.144 TP 160.278 spr=7
30318 ENTRY_TICKET bar=2026.06.09 16:50 ticket=8 deal=8 pid=8 ppid=8 magic=773002
30374 MTEXIT bar=2026.06.09 17:10 reason=POI_BODY_BREAK line=Weekly-POC lineVal=160.189 entry=160.202 exit=160.194
30380 MTCLOSE bar=2026.06.09 17:10 leg=POI_BODY_BREAK ticket=8 magic=773002 action=1 retcode=10009 deal=9 closepid=8 closeentry=1 entryPid=8 flat=1 ref=160.194
30382 ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | POI_BODY_BREAK [Weekly-POC] at 160.194 (entry 160.202)
39229 A6FIRED class=SELECTED state=FIRED bar=2026.06.11 14:35 dir=LONG tp=160.587 r=2.74 sl=160.501 mode=1SWING div=regular
39231 ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-POC | NYAM | R=2.74 SL 160.501 TP 160.587 spr=6
39245 ENTRY_TICKET bar=2026.06.11 14:35 ticket=10 deal=10 pid=10 ppid=10 magic=773002
39361 MTEXIT bar=2026.06.11 15:20 reason=TP_TOUCH line=- lineVal=- entry=160.524 exit=160.587
39363 ALERT SRJ EXIT NONE USDJPY M5 | - | NONE | TP_TOUCH at 160.587 (entry 160.524)

## C2 j24 11 June 14:30-15:00 path rows
38378 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
38381 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
38386 IDCHANGE bar=2026.06.11 14:00 inWin=1 state=IDLE dir=NONE xobId=3070->3091 fvgId=0->0 xobLo=160.545 xobHi=160.572 cumX=347 cumF=0 bars=2474
38391 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
38394 CQDRECHECK shift=2 passA=1.0 passB=1.0 diff=0 bar=2026.06.11 14:00 state=IDLE dir=NONE divLatch=0 hit1=0 hit2=608 mism=0
38401 2026.06.11 14:10:00 STATE IDLE->S1_REGIME dir=SHORT poi=Daily-POC
38412 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
38421 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
38430 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
38433 SIDE1H_WOULDPREEMPT bar=2026.06.11 14:20 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S1_REGIME newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
38437 SUPPRESSED bar=2026.06.11 14:20 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S1_REGIME cum_n=65 cum_opp=14 cum_hi=3 cum_both=1 action=HELD
38443 2026.06.11 14:25:21 STATE S1_REGIME->S2_LTF_ALIGN dir=LONG poi=Daily-POC
38448 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
38451 FRESHSKIP bar=2026.06.11 14:25 dir=LONG state=S2_LTF_ALIGN poi=Daily-POC reason=PRE_BINDING
38608 SUPPRESSED bar=2026.06.11 14:25 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S2_LTF_ALIGN cum_n=66 cum_opp=14 cum_hi=3 cum_both=1 action=HELD
38615 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
38617 FRESHSKIP bar=2026.06.11 14:30 dir=LONG state=S2_LTF_ALIGN poi=Daily-POC reason=PRE_BINDING
38774 SUPPRESSED bar=2026.06.11 14:30 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S2_LTF_ALIGN cum_n=67 cum_opp=14 cum_hi=3 cum_both=1 action=HELD
38782 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
38787 IDCHANGE bar=2026.06.11 14:35 inWin=1 state=S2_LTF_ALIGN dir=LONG xobId=3091->3070 fvgId=0->0 xobLo=160.489 xobHi=160.504 cumX=348 cumF=0 bars=2481
38788 FRESHSKIP bar=2026.06.11 14:35 dir=LONG state=S2_LTF_ALIGN poi=Daily-POC reason=PRE_BINDING
38945 SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S2_LTF_ALIGN cum_n=68 cum_opp=14 cum_hi=3 cum_both=1 action=HELD
38950 2026.06.11 14:40:22 STATE S2_LTF_ALIGN->S3_ZONE_WAIT dir=LONG poi=Daily-POC
38952 A2RECLAIM bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG c1=160.522 L=160.523 o0=160.523 c0=160.526 - prior close irrelevant (B38)
38966 2026.06.11 14:40:22 STATE S3_ZONE_WAIT->S4_ARMED dir=LONG poi=Daily-POC
38969 A2RECLAIM bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG c1=160.522 L=160.523 o0=160.523 c0=160.526 - prior close irrelevant (B38)
38973 UJALIGN_NOMATCH bar=2026.06.11 14:35 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1
38974 A2RECLAIM bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG c1=160.522 L=160.523 o0=160.523 c0=160.526 - prior close irrelevant (B38)
38975 2026.06.11 14:40:22 STATE S4_ARMED->S5_GATE_CHECK dir=LONG poi=Daily-POC
39216 STOPRESOLVE format=2 pkt=PACKET_EXT1LIVE-001-v28 base=6C2E4028 type=NORMAL part=1/3 emitSeq=13 barTime=2026.06.11-14:35 dir=1 entryPx=160.524 tpPx=160.58699999999999 incomingSlRef=160.488 liveSel=2 slLive=160.501 pxExt1=160.501 ext1Defined=1 ext1Imb=0 rLive=2.7391304347825551 rExt1=2.7391304347825551 gateConst=1
39217 STOPRESOLVE format=2 pkt=PACKET_EXT1LIVE-001-v28 base=6C2E4028 type=NORMAL part=2/3 emitSeq=13 wouldGate=1 vetoStateAtSite=- sessionUseAtSite=- ext1Slot=40 ext1BarTime=2026.06.11-11:15 s0slot=1 s0imb=0 s1slot=40 s1imb=0 ladOriginPx=160.524 ladOriginBarTime=2026.06.11-14:40 ladOriginSite=S5 extSideOk=1
39218 STOPRESOLVE format=2 pkt=PACKET_EXT1LIVE-001-v28 base=6C2E4028 type=NORMAL part=3/3 emitSeq=13 extDistPts=23 rawNumLive=0.062999999999988177 rawDenLive=0.022999999999996135 rawNumExt1=0.062999999999988177 rawDenExt1=0.022999999999996135 wouldAdopt_monotone=0 actualGate=1 emitSeq=13 currentPrice=160.524 s0px=160.50700000000001 s1px=160.501 ladOriginStamp=2026.06.11-14:35
39222 SIDE1O_ELIGSTATE bar=2026.06.11 14:35 dir=LONG sessUsed=0 divLatch=0 cqd=UNREAD confirm=S4_ARMED slRef=160.501 rLive=2.74 livePass=1
39229 A6FIRED class=SELECTED state=FIRED bar=2026.06.11 14:35 dir=LONG tp=160.587 r=2.74 sl=160.501 mode=1SWING div=regular
39246 2026.06.11 14:40:22 STATE S5_GATE_CHECK->SIGNAL dir=LONG poi=Daily-POC
39247 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39251 IDCHANGE bar=2026.06.11 14:40 inWin=1 state=IDLE dir=NONE xobId=3070->3103 fvgId=0->0 xobLo=160.498 xobHi=160.518 cumX=349 cumF=0 bars=2482
39262 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39274 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39284 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39298 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39311 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39321 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39332 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39346 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39352 CQDRECHECK shift=2 passA=2.0 passB=2.0 diff=0 bar=2026.06.11 15:15 state=IDLE dir=NONE divLatch=0 hit1=0 hit2=609 mism=0
39364 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39372 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39380 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39383 CQDRECHECK shift=2 passA=2.0 passB=2.0 diff=0 bar=2026.06.11 15:30 state=IDLE dir=NONE divLatch=0 hit1=0 hit2=610 mism=0
39388 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39397 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39402 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
39414 IDCHANGE bar=2026.06.11 15:55 inWin=1 state=IDLE dir=NONE xobId=3103->0 fvgId=0->0 xobLo=- xobHi=- cumX=350 cumF=0 bars=2497
39426 CQDRECHECK shift=2 passA=1.0 passB=1.0 diff=0 bar=2026.06.11 15:55 state=IDLE dir=NONE divLatch=0 hit1=0 hit2=611 mism=0

## C2 j24 11 June deals
39240 JS	0	10:23:41.584	Core 04	2026.06.11 14:40:22   deal #10 buy 5.54 USDJPY at 160.530 done (based on order #10)
39343 IP	0	10:23:47.685	Core 04	2026.06.11 15:23:06   deal #11 sell 5.54 USDJPY at 160.588 done (based on order #11)

## C1+C2 A2RECLAIM rows (j23 + j24, all)
28449 A2RECLAIM bar=2026.08.31 16:10 anchor=Weekly-POC dir=SHORT c1=1.15978 L=1.15976 o0=1.15976 c0=1.15965 - prior close irrelevant (B38)
28457 A2RECLAIM bar=2026.08.31 16:10 anchor=Weekly-POC dir=SHORT c1=1.15978 L=1.15976 o0=1.15976 c0=1.15965 - prior close irrelevant (B38)
44441 A2RECLAIM bar=2026.09.03 14:05 anchor=Daily-POC dir=LONG c1=1.16030 L=1.16030 o0=1.16032 c0=1.16056 - prior close irrelevant (B38)
44445 A2RECLAIM bar=2026.09.03 14:05 anchor=Daily-POC dir=LONG c1=1.16030 L=1.16030 o0=1.16032 c0=1.16056 - prior close irrelevant (B38)
44446 A2RECLAIM bar=2026.09.03 14:05 anchor=Daily-POC dir=LONG c1=1.16030 L=1.16030 o0=1.16032 c0=1.16056 - prior close irrelevant (B38)
44453 A2RECLAIM bar=2026.09.03 14:05 anchor=Daily-POC dir=LONG c1=1.16030 L=1.16030 o0=1.16032 c0=1.16056 - prior close irrelevant (B38)
44476 A2RECLAIM bar=2026.09.03 14:05 anchor=Daily-POC dir=LONG c1=1.16030 L=1.16030 o0=1.16032 c0=1.16056 - prior close irrelevant (B38)
44481 A2RECLAIM bar=2026.09.03 14:05 anchor=Daily-POC dir=LONG c1=1.16030 L=1.16030 o0=1.16032 c0=1.16056 - prior close irrelevant (B38)
j24:19724 A2RECLAIM bar=2026.06.05 09:15 anchor=Daily-POC dir=SHORT c1=159.961 L=159.960 o0=159.960 c0=159.959 - prior close irrelevant (B38)
j24:19739 A2RECLAIM bar=2026.06.05 09:15 anchor=Daily-POC dir=SHORT c1=159.961 L=159.960 o0=159.960 c0=159.959 - prior close irrelevant (B38)
j24:19760 A2RECLAIM bar=2026.06.05 09:15 anchor=Daily-POC dir=SHORT c1=159.961 L=159.960 o0=159.960 c0=159.959 - prior close irrelevant (B38)
j24:32239 A2RECLAIM bar=2026.06.10 09:55 anchor=Daily-VWAP dir=LONG c1=160.363 L=160.363 o0=160.366 c0=160.384 - prior close irrelevant (B38)
j24:32244 A2RECLAIM bar=2026.06.10 09:55 anchor=Daily-VWAP dir=LONG c1=160.363 L=160.363 o0=160.366 c0=160.384 - prior close irrelevant (B38)
j24:38952 A2RECLAIM bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG c1=160.522 L=160.523 o0=160.523 c0=160.526 - prior close irrelevant (B38)
j24:38969 A2RECLAIM bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG c1=160.522 L=160.523 o0=160.523 c0=160.526 - prior close irrelevant (B38)
j24:38974 A2RECLAIM bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG c1=160.522 L=160.523 o0=160.523 c0=160.526 - prior close irrelevant (B38)
