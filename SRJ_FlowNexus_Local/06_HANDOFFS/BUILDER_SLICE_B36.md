# BUILDER SLICE B-36 - raw rows behind P2 and Q1 (segment line numbers; payloads only)
j18 = JUNE-B34_JOURNAL.log

## P2 14:40:22 pass + 14:45 pass rows
40767 [SRJ-EA] UJPROBE bar_key=2026.06.11 14:35 h4=1.0 h1=1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular readFail=0 empty=107050 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=32 ticktime=2026.06.11 14:40:22 lag=chartTime-1bar
40956 [SRJ-EA] UJPROBE bar_key=2026.06.11 14:40 h4=1.0 h1=1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular readFail=0 empty=107051 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=32 ticktime=2026.06.11 14:45:05 lag=chartTime-1bar
40931 [SRJ-EA] 2026.06.11 14:40:22 STATE S2_LTF_ALIGN->S3_ZONE_WAIT dir=LONG poi=Daily-POC
40946 [SRJ-EA] 2026.06.11 14:40:22 STATE S3_ZONE_WAIT->S4_ARMED dir=LONG poi=Daily-POC
40947 [SRJ-EA] 2026.06.11 14:40:22 S3 zone: src=XOB haveFvg=0 haveXob=1 zoneLo=160.489 zoneHi=160.504
40952 [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:35 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1
40953 [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.11 14:35 dir=LONG term=A2_CLOSE_BREAK
41126 [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:40 dir=LONG m15=-1.0 uj_readFail=0 reportOnly=1
41127 [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.11 14:40 dir=LONG term=A_OPP

## Q1 ticket-6 model rows + broker stop deal #7
21527 [SRJ-EA] SLIMBR bar=2026.06.05 16:50 dir=LONG entry=160.115 tp=160.723 slToday=159.881 rToday=2.60 dTodayPts=0 slBase=159.881 rBase=2.60 dBasePts=0 slNuance=159.881 rNuance=2.60 dNuancePts=0 slFractal=159.941 rFractal=3.49 dFracPts=60 slFractalNuance=159.941 r
21712 [SRJ-EA] TP_ELECT shadow=true entry=160.115 sl=159.726 tp=160.723 R=1.56 bar=2026.06.05 16:50 latchBar=2026.06.05 16:55
21724 [SRJ-EA] PRE-SEND lots=0.40 entry=160.120 slPts=394 tpPts=603 stopsLevel=0 freezeLevel=0 spreadPts=5
21726 DO	0	06:17:33.895	Core 04	2026.06.05 16:55:00   deal #6 buy 0.4 USDJPY at 160.120 done (based on order #6)
21742 [SRJ-EA] EXITVERDICT bar=2026.06.05 16:55 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.148 l=160.093 sup=1
21751 [SRJ-EA] EXITVERDICT bar=2026.06.05 17:00 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.177 l=160.060 sup=1
21759 [SRJ-EA] EXITVERDICT bar=2026.06.05 17:05 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.164 l=160.100 sup=1
21769 [SRJ-EA] EXITVERDICT bar=2026.06.05 17:10 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.167 l=160.133 sup=1
21780 [SRJ-EA] EXITVERDICT bar=2026.06.05 17:15 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.225 l=160.159 sup=1
21789 [SRJ-EA] EXITVERDICT bar=2026.06.05 17:20 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.234 l=160.179 sup=1
21800 [SRJ-EA] EXITVERDICT bar=2026.06.05 17:25 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.235 l=160.184 sup=1
21808 [SRJ-EA] EXITVERDICT bar=2026.06.05 17:30 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.204 l=160.165 sup=1
21817 [SRJ-EA] EXITVERDICT bar=2026.06.05 17:35 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.239 l=160.199 sup=1
21827 [SRJ-EA] EXITVERDICT bar=2026.06.05 17:40 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.278 l=160.233 sup=1
21839 [SRJ-EA] EXITVERDICT bar=2026.06.05 17:45 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.259 l=160.182 sup=1
21849 [SRJ-EA] EXITVERDICT bar=2026.06.05 17:50 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.262 l=160.213 sup=1
21859 [SRJ-EA] EXITVERDICT bar=2026.06.05 17:55 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.273 l=160.238 sup=1
21869 [SRJ-EA] EXITVERDICT bar=2026.06.05 18:00 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.279 l=160.250 sup=1
21877 [SRJ-EA] EXITVERDICT bar=2026.06.05 18:05 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.288 l=160.261 sup=1
21886 [SRJ-EA] EXITVERDICT bar=2026.06.05 18:10 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.287 l=160.272 sup=1
21894 [SRJ-EA] EXITVERDICT bar=2026.06.05 18:15 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.287 l=160.229 sup=1
21902 [SRJ-EA] EXITVERDICT bar=2026.06.05 18:20 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.288 l=160.251 sup=1
21912 [SRJ-EA] EXITVERDICT bar=2026.06.05 18:25 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.270 l=160.252 sup=1
21922 [SRJ-EA] EXITVERDICT bar=2026.06.05 18:30 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.279 l=160.250 sup=1
21933 [SRJ-EA] EXITVERDICT bar=2026.06.05 18:35 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.296 l=160.251 sup=1
21942 [SRJ-EA] EXITVERDICT bar=2026.06.05 18:40 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.297 l=160.279 sup=1
21950 [SRJ-EA] EXITVERDICT bar=2026.06.05 18:45 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.298 l=160.266 sup=1
21958 [SRJ-EA] EXITVERDICT bar=2026.06.05 18:50 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.283 l=160.266 sup=1
21967 [SRJ-EA] EXITVERDICT bar=2026.06.05 18:55 dir=LONG entry=160.115 curTp=none vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.723 h=160.273 l=160.211 sup=1
21975 [SRJ-EA] EXITVERDICT bar=2026.06.05 19:00 dir=LONG entry=160.115 curTp=160.298 vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.298 h=160.271 l=160.241 sup=1
21980 [SRJ-EA] EXITVERDICT bar=2026.06.05 19:05 dir=LONG entry=160.115 curTp=160.298 vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.298 h=160.278 l=160.242 sup=1
21986 [SRJ-EA] EXITVERDICT bar=2026.06.05 19:10 dir=LONG entry=160.115 curTp=160.298 vSL=0 vTP=0 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.298 h=160.285 l=160.256 sup=1
21991 [SRJ-EA] EXITVERDICT bar=2026.06.05 19:15 dir=LONG entry=160.115 curTp=none vSL=0 vTP=1 vBREAK=none vHTF=0 vDAY=0 scope=1 htfH=0 htfM=0 htfL=0 want=0 anti=-1 tpB=160.298 h=160.324 l=160.268 sup=1
21992 [SRJ-EA] MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH line=- lineVal=- entry=160.115 exit=160.298
21993 [SRJ-EA] MTLIFE fields=11 openBar=2026.06.05 16:55 dir=LONG entry=160.115 sl=159.726 tp=160.298 verdict=TP_TOUCH closeBar=2026.06.05 19:15 closePx=160.298 openAtNewsStart=0 openAtDayClose=0 openAtWeekClose=0
47855 QK	0	06:18:34.959	Core 04	2026.06.11 22:30:51   deal #7 sell 0.4 USDJPY at 159.725 done (based on order #7)
