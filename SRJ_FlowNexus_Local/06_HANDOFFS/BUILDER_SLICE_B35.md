# BUILDER SLICE B-35 - raw rows behind P1c, P2a/c, P3a/b, P4a/b (segment line numbers; payloads only)
j18 = JUNE-B34_JOURNAL.log; j17 = RECON62-B33_JOURNAL.log

## P1c j18 probes 15:55-16:55 + seed rows 15:55-16:25
21114 [2026.06.05 15:55] RETESTBOOK bar=2026.06.05 15:50 hits=0 
21118 [2026.06.05 15:55] h4=1.0 h1=-1.0 m15=1.0 ltf=1.0
21122 [2026.06.05 16:00] RETESTBOOK bar=2026.06.05 15:55 hits=0 
21130 [2026.06.05 16:00] h4=1.0 h1=1.0 m15=1.0 ltf=-1.0
21134 [2026.06.05 16:05] RETESTBOOK bar=2026.06.05 16:00 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
21138 [2026.06.05 16:05] CONFIRMPOLL bar=2026.06.05 16:00 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=0 body=182pts doji=0 touchAttr=0 confirm=0 shadow=true
21141 [2026.06.05 16:05] ANCHOR_ELECT bar=2026.06.05 16:00 action=SEED poi=Daily-POC rank=10 tier=5 dir=LONG
21152 [2026.06.05 16:05] S2SEEDBIAS_KILL bar=2026.06.05 16:00 dir=LONG poi=Daily-POC - seedbias refused, promotion killed (Fix B2)
21153 [2026.06.05 16:05] 2026.06.05 16:05:00 ABORT reason=SEEDBIAS_REFUSED state=S2_LTF_ALIGN poi=Daily-POC dir=LONG
21154 [2026.06.05 16:05] A6REFUSED class=ABSENT_DECLINED bar=2026.06.05 16:05 state=S2_LTF_ALIGN dir=LONG predicate=SEEDBIAS_REFUSED
21162 [2026.06.05 16:05] h4=1.0 h1=1.0 m15=1.0 ltf=1.0
21166 [2026.06.05 16:10] RETESTBOOK bar=2026.06.05 16:05 hits=0 
21170 [2026.06.05 16:10] h4=1.0 h1=1.0 m15=1.0 ltf=1.0
21172 [2026.06.05 16:15] RETESTBOOK bar=2026.06.05 16:10 hits=0 
21176 [2026.06.05 16:15] h4=1.0 h1=1.0 m15=1.0 ltf=1.0
21177 [2026.06.05 16:20] RETESTBOOK bar=2026.06.05 16:15 hits=0 
21181 [2026.06.05 16:20] h4=1.0 h1=1.0 m15=1.0 ltf=1.0
21182 [2026.06.05 16:25] RETESTBOOK bar=2026.06.05 16:20 hits=0 
21187 [2026.06.05 16:25] h4=1.0 h1=1.0 m15=1.0 ltf=1.0
21203 [2026.06.05 16:40] h4=1.0 h1=1.0 m15=1.0 ltf=1.0
21210 [2026.06.05 16:45] h4=1.0 h1=1.0 m15=1.0 ltf=1.0
21255 [2026.06.05 16:50] h4=1.0 h1=1.0 m15=1.0 ltf=1.0
21734 [2026.06.05 16:55] h4=1.0 h1=1.0 m15=1.0 ltf=1.0

## P2c j18 probes 09:20-09:50 + j17 1-Sep 09:50 rows side by side
--- j18 UJPROBE 2026.06.05 09:20-09:50 ---
19760 [2026.06.05 09:20] h4=1.0 h1=-1.0 m15=-1.0 ltf=1.0
19913 [2026.06.05 09:25] h4=1.0 h1=-1.0 m15=-1.0 ltf=1.0
20066 [2026.06.05 09:30] h4=1.0 h1=-1.0 m15=-1.0 ltf=1.0
20217 [2026.06.05 09:35] h4=1.0 h1=-1.0 m15=-1.0 ltf=1.0
20369 [2026.06.05 09:40] h4=1.0 h1=-1.0 m15=-1.0 ltf=1.0
20693 [2026.06.05 09:45] h4=1.0 h1=-1.0 m15=-1.0 ltf=1.0
20700 [2026.06.05 09:50] h4=1.0 h1=-1.0 m15=-1.0 ltf=-1.0
--- j17 1-Sep 09:50 rows ---
31063 [SRJ-EA] UJPROBE bar_key=2026.09.01 09:50 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=122432 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=90 t
31337 [SRJ-EA] UJ5MENTRY_REFUSE bar=2026.09.01 09:50 dir=LONG anchor=Weekly-VWAP ltf=-1.0
31338 [SRJ-EA] 2026.09.01 09:55:00 ABORT reason=LTF_MISALIGN state=S5_GATE_CHECK poi=Weekly-VWAP dir=LONG
31341 [SRJ-EA] 2026.09.01 09:55:00 STATE S5_GATE_CHECK->ABORT dir=LONG poi=Weekly-VWAP
31345 [SRJ-EA] UJPROBE bar_key=2026.09.01 09:55 h4=-1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=122433 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=90 ti

## P3a j18 14:25-14:45 rows + P3b 6/4 comparison rows
40926 [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S2_LTF_ALIGN cum_n=72 cum_opp=14 cum_hi=5 cum_both=1 action=HELD
40927 [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
40930 [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=1 body=3pts doji=0 touchAttr=1 confirm=1 shadow=true
40931 [SRJ-EA] 2026.06.11 14:40:22 STATE S2_LTF_ALIGN->S3_ZONE_WAIT dir=LONG poi=Daily-POC
40946 [SRJ-EA] 2026.06.11 14:40:22 STATE S3_ZONE_WAIT->S4_ARMED dir=LONG poi=Daily-POC
40948 [SRJ-EA] ALERT SRJ HEADS-UP LONG USDJPY M5 | Daily-POC | NYAM | zone 160.489-160.504 awaiting confirm
40959 [SRJ-EA] FRESHCOUNT #75 bar=2026.06.11 14:40 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=24 cum2=8 cum3=0
41117 [SRJ-EA] RETESTBOOK bar=2026.06.11 14:40 hits=0 
41120 [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:40 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
--- 6/4 09:45-09:55 rows 17490-17640 ---
17496 [SRJ-EA] 2026.06.04 09:50:00 STATE S3_ZONE_WAIT->S4_ARMED dir=SHORT poi=Daily-POC
17498 [SRJ-EA] ALERT SRJ HEADS-UP SHORT USDJPY M5 | Daily-POC | LONDON | zone 160.001-160.012 awaiting confirm
17499 [SRJ-EA] ZONEID bar=2026.06.04 09:45 site=S4RQZ xobId=2209 fvgId=0
17502 [SRJ-EA] UJALIGN_PASS bar=2026.06.04 09:45 dir=SHORT m15=-1.0
17623 [SRJ-EA] ZONESHADOW bar=2026.06.04 09:50 dir=SHORT close=159.868 zoneLo=160.001 zoneHi=160.012 gapPts=133 slRef=160.012 tp=159.368 R_close=3.47 tpInGap=0 shadow= near=57.55/sl1/tp1 mid=116.09/sl1/tp1 far=inf/sl0/tp1 
17624 [SRJ-EA] CQDRECHECK shift=2 passA=-2.0 passB=-2.0 diff=0 bar=2026.06.04 09:45 state=S4_ARMED dir=SHORT divLatch=1 hit1=0 hit2=236 mism=0
17627 [SRJ-EA] SUPPRESSED bar=2026.06.04 09:50 poi=Daily-POC dir=SHORT opp=0 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=16 cum_opp=6 cum_hi=0 cum_both=0 action=HELD
17631 [SRJ-EA] CONFIRMPOLL bar=2026.06.04 09:50 anchor=Daily-POC dir=SHORT oppCandle=1 bodyDir=1 body=16pts doji=0 touchAttr=1 confirm=1 shadow=true
17634 [SRJ-EA] ZONEID bar=2026.06.04 09:50 site=S4RQZ xobId=2209 fvgId=0
17636 [SRJ-EA] UJALIGN_PASS bar=2026.06.04 09:50 dir=SHORT m15=-1.0
17637 [SRJ-EA] 2026.06.04 09:55:00 STATE S4_ARMED->S5_GATE_CHECK dir=SHORT poi=Daily-POC

## P3 11/6 14:45-15:10 follow-through
40959 [2026.06.11 14:45] [SRJ-EA] FRESHCOUNT #75 bar=2026.06.11 14:40 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=24 cum2=8 cum3=0
41120 [2026.06.11 14:45] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:40 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
41126 [2026.06.11 14:45] [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:40 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1
41131 [2026.06.11 14:50] [SRJ-EA] FRESHCOUNT #76 bar=2026.06.11 14:45 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=25 cum2=8 cum3=0
41292 [2026.06.11 14:50] [SRJ-EA] SUPPRESSED bar=2026.06.11 14:45 poi=Daily-POC dir=SHORT opp=1 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S4_ARMED cum_n=73 cum_opp=15 cum_hi=5 cum_both=1 action=HELD
41296 [2026.06.11 14:50] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:45 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=1pts doji=0 touchAttr=1 confirm=0 shadow=true
41302 [2026.06.11 14:50] [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:45 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1
41306 [2026.06.11 14:55] [SRJ-EA] FRESHCOUNT #77 bar=2026.06.11 14:50 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=26 cum2=8 cum3=0
41467 [2026.06.11 14:55] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:50 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=0pts doji=1 touchAttr=1 confirm=0 shadow=true
41472 [2026.06.11 14:55] [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:50 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1
41477 [2026.06.11 15:00] [SRJ-EA] FRESHCOUNT #78 bar=2026.06.11 14:55 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=27 cum2=8 cum3=0
41636 [2026.06.11 15:00] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:55 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=1 body=14pts doji=0 touchAttr=0 confirm=0 shadow=true
41641 [2026.06.11 15:00] [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:55 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1
41804 [2026.06.11 15:05] [SRJ-EA] SUPPRESSED bar=2026.06.11 15:00 poi=Daily-POC dir=LONG opp=0 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S4_ARMED cum_n=74 cum_opp=15 cum_hi=5 cum_both=1 action=HELD
41808 [2026.06.11 15:05] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 15:00 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=0 body=5pts doji=0 touchAttr=1 confirm=0 shadow=true
41814 [2026.06.11 15:05] [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 15:00 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1
41976 [2026.06.11 15:10] [SRJ-EA] CONFIRMPOLL bar=2026.06.11 15:05 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=2pts doji=0 touchAttr=1 confirm=0 shadow=true
41981 [2026.06.11 15:10] [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 15:05 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1

## P4b j18 16:05-16:15 seed/retest + TPCENSUS 16:00-16:20
21134 [2026.06.05 16:05] [SRJ-EA] RETESTBOOK bar=2026.06.05 16:00 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
21141 [2026.06.05 16:05] [SRJ-EA] ANCHOR_ELECT bar=2026.06.05 16:00 action=SEED poi=Daily-POC rank=10 tier=5 dir=LONG
21166 [2026.06.05 16:10] [SRJ-EA] RETESTBOOK bar=2026.06.05 16:05 hits=0 
21172 [2026.06.05 16:15] [SRJ-EA] RETESTBOOK bar=2026.06.05 16:10 hits=0 
