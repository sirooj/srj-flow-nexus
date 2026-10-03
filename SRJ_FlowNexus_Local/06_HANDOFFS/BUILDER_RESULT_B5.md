# BUILDER RESULT B-5 - confirmation + holder-slot measurement only (no edit, no compile, no run, no fix proposed)

Step 1 raw (measured 2026-10-04, terminal disk, branch builder/B-4):
- git log -1: b1ad891 B-4 one-edit one-run graded REVERT: June-11 seeded but unfired (relay B-4, planner side)
- EA SHA-256 Experts/SRJ_FlowNexus_EA.mq5: E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC (MATCHES required; gate passed. The compiled EX5 on disk is still the B-4 build per relay warning; no tester run was made in B-5.)

## Step 2a - new-journal lines 22873-22966 verbatim with line numbers (94 rows, no filtering, spliced mechanically from RECON78-B4_JOURNAL.log, 37030 lines)
22873 :: MQ	0	03:01:48.421	Core 04	2026.06.11 14:40:22   Alert: USDJPY M5 - POI RETEST LONG at 160.523  [D-POC +1]
22874 :: OO	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
22875 :: RJ	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ][T155][OBPROV] code=3 id=3117 bar=107659 flag=false
22876 :: KO	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ][T155][OBPROV] code=3 id=3105 bar=107659 flag=false
22877 :: FP	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ][T155][OBPROV] code=8 id=0 bar=107659 flag=true
22878 :: HP	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:35 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=107050 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=32 ticktime=2026.06.11 14:40:22 lag=chartTime-1bar
22879 :: IF	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] IDCHANGE bar=2026.06.11 14:35 inWin=1 state=S4_ARMED dir=SHORT xobId=3091->3070 fvgId=0->0 xobLo=160.489 xobHi=160.504 cumX=348 cumF=0 bars=2481
22880 :: FR	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFFLIP bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF bias turned against the locked direction
22881 :: FG	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFDIAG bar=2026.06.11 14:35 dir=SHORT state=S4_ARMED kind=STRONG ok0=1 bias0=1 ob0=1 fvg0=1 opp0=0 ok1=1 bias1=-1 ob1=1 fvg1=1 opp1=0
22882 :: HN	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERABORT bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF opposed, abort deferred past evaluation (Fix S-a)
22883 :: NP	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 ABORT reason=LTF_MISALIGN state=S4_ARMED poi=Daily-POC dir=SHORT
22884 :: PF	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.11 14:40 state=S4_ARMED dir=SHORT predicate=LTF_MISALIGN
22885 :: CH	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ STAND-DOWN SHORT USDJPY M5 | Daily-POC | NYAM | reason=LTF_MISALIGN
22886 :: NI	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S4_ARMED->ABORT dir=SHORT poi=Daily-POC
22887 :: DH	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
22888 :: JJ	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDTTERMS bar=2026.06.11 14:35 Daily-POC=LHIT/Sbody-above Daily-VWAP=LHIT/Sbody-above Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
22889 :: FD	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTDIAG bar=2026.06.11 14:35 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:227.0pts
22890 :: PF	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:35 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
22891 :: EL	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=1 body=3pts doji=0 touchAttr=1 confirm=1 shadow=true
22892 :: JJ	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:35 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
22893 :: MR	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE IDLE->S1_REGIME dir=LONG poi=Daily-POC
22894 :: HD	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] ANCHOR_ELECT bar=2026.06.11 14:35 action=SEED poi=Daily-POC rank=10 tier=5 dir=LONG
22895 :: KO	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.06.11 14:35 dir=LONG biasAligned=1 verdict=CONSIDER
22896 :: KM	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1V_BIRTH bar=2026.06.11 14:35 dir=SHORT tf=0 mr=0 confShort=A_OPP
22897 :: QP	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1F_VOTE bar=2026.06.11 14:35 dir=LONG t1term=A2_CLOSE_BREAK t1reject=1 hier=- conf=1
22898 :: RS	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1G_PROFILE bar=2026.06.11 14:35 opp=1 a2=0 body=1 touch=1 pre=PASS term=A2_CLOSE_BREAK t1term=A2_CLOSE_BREAK match=1
22899 :: DK	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1G_VOTE3 bar=2026.06.11 14:35 h4=1.0 h1=-1.0 m15=1.0 l4=1 l1=-1 lm=1 legDir=1 gdir=LONG agree=0
22900 :: JF	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1C_BOTHDIRS bar=2026.06.11 14:35 live=LONG liveTerm=A2_CLOSE_BREAK longTerm=A2_CLOSE_BREAK shortTerm=A_OPP
22901 :: LS	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1C_CHAIN bar=2026.06.11 14:35 chainN=96
22902 :: DP	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] REGIMECENSUS #118 bar=2026.06.11 14:35 dir=LONG votes=2 trendOk=1 sweepTag=0 mrOk=0 cumMR=0
22903 :: QN	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S1_REGIME->S2_LTF_ALIGN dir=LONG poi=Daily-POC
22904 :: PL	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S2_LTF_ALIGN->S3_ZONE_WAIT dir=LONG poi=Daily-POC
22905 :: DM	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:35 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
22906 :: QH	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJSBTELEM bar=2026.06.11 14:35 dir=LONG have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=160.523 o1=160.525 c1=160.522 c0=160.526 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
22907 :: DF	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] ZONEID bar=2026.06.11 14:35 site=S3PICK xobId=3070 fvgId=0
22908 :: LR	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] XOBPROMO bar=2026.06.11 14:35 site=S3PICK xobId=3070 raw=1781166600.0 promoT=2026.06.11 08:30
22909 :: FE	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] ZONEPICK bar=2026.06.11 14:35 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0 downgraded=0 fvg=--- xob=160.489-160.504
22910 :: CP	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] S3INPLAY bar=2026.06.11 14:35 dir=LONG inPlay=0 via=none zoneLo=160.489 zoneHi=160.504 barLo=160.513 barHi=160.528 close=160.526 sw1=160.507@1 sw2=160.508@7
22911 :: DD	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] XOBINPLAY bar=2026.06.11 14:35 dir=LONG zoneSrc=XOB zoneLo=160.489 zoneHi=160.504 promoT=2026.06.11 08:30 bounded=1 scanned=74 swings=15 hits=6 firstShift=40 firstVal=160.501 capHit=0 legacy=0 legacyVia=none widened=1 flip=1
22912 :: ID	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] XOBINPLAY2 bar=2026.06.11 14:35 dir=LONG zoneSrc=XOB zoneLo=160.489 zoneHi=160.504 promoT=2026.06.11 08:30 bounded=1 legacy=0 legacyVia=none capped_scanned=74 capped_swings=15 capped_hits=6 capped_wide=1 capHit=0 unc_scanned=74 unc_swings=15 unc_hits=6 unc_first=40 unc_firstVal=160.501 unc_wide=1 reached2=1 cls1=WIDEONLY cls2=WIDEONLY
22913 :: RR	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLEXT481 fields=17 bar=2026.06.11 14:35 site=S3ARM dir=LONG ladOriginPx=160.526 ladOriginBarTime=2026.06.11 14:35 ladOriginSite=S3ARM ext1Defined=1 slExt1=160.501 ext1Slot=40 ext1BarTime=2026.06.11 11:15 ext1Imb=0 deepestExt=31 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
22914 :: OI	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SWINGPICK site=S3ARM dir=LONG barShift=1 close=160.526 haveHigh=1 SH=160.534 atShift=6 haveLow=1 SL=160.507 atShift=1
22915 :: NN	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLSRC site=S3ARM dir=LONG src=OB_SWING obStruct=160.489 obSwing=160.488 nearest=160.507 chosen=160.488 deltaPts=1
22916 :: QF	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=160.488 distPts=38 site=S3ARM zoneLo=0.000 zoneHi=0.000
22917 :: KF	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMB fields=19 bar=2026.06.11 14:35 site=S3ARM dir=LONG branch=1SWING obValid=1 slRef=160.488 slShift=110 slShiftT=2026.06.11 05:25 latestFlag=0 latestShift=1 latestShiftT=2026.06.11 14:30 latestAvail=1 latestApexMatch=1 chosenFlag=0 chosenShift=110 chosenShiftT=2026.06.11 05:25 chosenAvail=1 nuanceClass=OB_VALID_LATEST_NOIMB cands=-
22918 :: DI	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBWALK fields=27 bar=2026.06.11 14:35 site=S3ARM dir=LONG branch=1SWING slToday=160.488 slBase=160.425 slNuance=160.488 deltaBasePts=-63 deltaNuancePts=0 walkSteps=2 code2Seen=0 exhausted=0 skipShift=113 skipVal=160.475 skipFlag=0 bodyExt=160.497 extUpdatedByNonQual=1 code3Seen=0 sideViolations=0 todayEqBase=0 todayEqNuance=1 baseEqNuance=0 class=TODAY_EQ_NUANCE outwardBasePts=63 outwardNuancePts=0 skipShiftT=2026.06.11 05:10 startShiftT=2026.06.11 05:25
22919 :: IE	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:35 site=S3ARM dir=LONG branch=1SWING fracAnchorShift=1 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-63 deltaFracNuancePts=19 fracSteps=23 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=5 fracClass=CARVEOUT_FIRED sideFracViolations=0 outwardFracPts=63 outwardFracNuancePts=-19 fracAnchorRawShift=1 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:30 fracSkip=40 fracSkipT=2026.06.11 1
22920 :: EQ	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SEL61SRC site=S3ARM bar=2026.06.11 14:35 branch=SLREF_1SWING def=1 value=160.488 mode=1 scope=IN_SCOPE_RULE aux=-
22921 :: MF	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6TERM class=SELECTED bar=2026.06.11 14:35 shift=1 site=S3ARM dir=LONG mode=1SWING px=160.488 ok=1 slot=110
22922 :: KH	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SEL52CTX seq=297 bar=2026.06.11 14:35 site=S3ARM dir=LONG oPx=160.526 oBT=2026.06.11 14:35 slRef=160.488 mode=1 halt=-
22923 :: FQ	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLMEMO bar=2026.06.11 14:35 site=S3ARM result=COMPUTE ok=1 slRef=160.488 mode=1 computes=234 hits=60 genID=234 wrSite=S3ARM wrOrigin=evalClose
22924 :: CH	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] INPLAYCOMMIT bar=2026.06.11 14:35 dir=LONG zoneSrc=XOB zoneLo=160.489 zoneHi=160.504 promoT=2026.06.11 08:30 applied=1 bounded=1 scanned=110 swings=20 hits=8 firstShift=40 firstVal=160.501 commitVia=SWING legacy=0 legacyVia=none committed=1 changed=1 haveStop=1
22925 :: QM	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S3_ZONE_WAIT->S4_ARMED dir=LONG poi=Daily-POC
22926 :: GL	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 S3 zone: src=XOB haveFvg=0 haveXob=1 zoneLo=160.489 zoneHi=160.504
22927 :: PR	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ HEADS-UP LONG USDJPY M5 | Daily-POC | NYAM | zone 160.489-160.504 awaiting confirm
22928 :: IJ	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] ZONEID bar=2026.06.11 14:35 site=S4RQZ xobId=3070 fvgId=0
22929 :: CF	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] LEGTOUCH bar=2026.06.11 14:35 dir=LONG found=0 atShift=-1 atBar=- legBound=2026.06.11 14:35 zoneLo=160.489 zoneHi=160.504 touchSeen=0
22930 :: EM	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
22931 :: QD	0	03:01:48.421	Core 04	2026.06.11 14:45:05   SRJ XOB-PROMOCENSUS t=2026.06.11 14:40 bar=107660 mode=all bias=bullish objId=3103 isValid=1 isActivated=1 obStart=107617 obStartT=2026.06.11 11:05 obVal=107621 obInval=-2147483648 boundary=-2147483648 promoBar=107660 promoT=2026.06.11 14:40
22932 :: DH	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:40 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular readFail=0 empty=107051 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=32 ticktime=2026.06.11 14:45:05 lag=chartTime-1bar
22933 :: PQ	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJM15ROW bar_key=2026.06.11 14:40 m15time=2026.06.11 14:45 m15vote=1.0
22934 :: DQ	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] IDCHANGE bar=2026.06.11 14:40 inWin=1 state=S4_ARMED dir=LONG xobId=3070->3103 fvgId=0->0 xobLo=160.498 xobHi=160.518 cumX=349 cumF=0 bars=2482
22935 :: JF	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] FRESHCOUNT #142 bar=2026.06.11 14:40 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=46 cum2=14 cum3=0
22936 :: JM	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] SWEPTMASK bar=2026.06.11 14:40 raw=3429125.0 m=3429125 swept=1010000011 live=0010
22937 :: GP	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:40 line=Daily-POC anchor=Daily-POC
22938 :: MO	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:40 line=Daily-VWAP anchor=Daily-POC
22939 :: ER	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:40 line=Daily-POC anchor=Daily-POC
22940 :: CN	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:40 line=Daily-VWAP anchor=Daily-POC
22941 :: MN	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] TPCENSUS #212 bar=2026.06.11 14:40 dir=LONG ref=160.520 winner=YLOH best=160.587 distPts=67 empties=8 admitted= PDH:51 ASH:28 LOH:67 NYH:14 PMH:20 YASH:28 YLOH:67 YNYH:9 YPMH:20 
22942 :: HS	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] SLEXT481 fields=17 bar=2026.06.11 14:40 site=S2POLL dir=LONG ladOriginPx=160.521 ladOriginBarTime=2026.06.11 14:40 ladOriginSite=S2POLL ext1Defined=1 slExt1=160.501 ext1Slot=41 ext1BarTime=2026.06.11 11:15 ext1Imb=0 deepestExt=31 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
22943 :: LE	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] SWINGPICK site=S2POLL dir=LONG barShift=1 close=160.521 haveHigh=1 SH=160.534 atShift=7 haveLow=1 SL=160.507 atShift=2
22944 :: OR	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] SLSRC site=S2POLL dir=LONG src=OB_SWING obStruct=160.498 obSwing=160.498 nearest=160.507 chosen=160.498 deltaPts=0
22945 :: HJ	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=160.498 distPts=23 site=S2POLL zoneLo=160.489 zoneHi=160.504
22946 :: MI	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] SLIMB fields=19 bar=2026.06.11 14:40 site=S2POLL dir=LONG branch=1SWING obValid=1 slRef=160.498 slShift=43 slShiftT=2026.06.11 11:05 latestFlag=0 latestShift=2 latestShiftT=2026.06.11 14:30 latestAvail=1 latestApexMatch=1 chosenFlag=0 chosenShift=43 chosenShiftT=2026.06.11 11:05 chosenAvail=1 nuanceClass=OB_VALID_LATEST_NOIMB cands=-
22947 :: LD	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] SLIMBWALK fields=27 bar=2026.06.11 14:40 site=S2POLL dir=LONG branch=1SWING slToday=160.498 slBase=160.425 slNuance=160.498 deltaBasePts=-73 deltaNuancePts=0 walkSteps=16 code2Seen=1 exhausted=0 skipShift=48 skipVal=160.494 skipFlag=0 bodyExt=160.509 extUpdatedByNonQual=3 code3Seen=0 sideViolations=0 todayEqBase=0 todayEqNuance=1 baseEqNuance=0 class=TODAY_EQ_NUANCE outwardBasePts=73 outwardNuancePts=0 skipShiftT=2026.06.11 10:40 startShiftT=2026.06.11 11:05
22948 :: MM	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:40 site=S2POLL dir=LONG branch=1SWING fracAnchorShift=2 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-73 deltaFracNuancePts=9 fracSteps=23 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=5 fracClass=CARVEOUT_FIRED sideFracViolations=0 outwardFracPts=73 outwardFracNuancePts=-9 fracAnchorRawShift=2 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:30 fracSkip=41 fracSkipT=2026.06.11 11
22949 :: FL	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] SEL61SRC site=S2POLL bar=2026.06.11 14:40 branch=SLREF_1SWING def=1 value=160.498 mode=1 scope=IN_SCOPE_RULE aux=-
22950 :: QH	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] A6TERM class=SELECTED bar=2026.06.11 14:40 shift=1 site=S2POLL dir=LONG mode=1SWING px=160.498 ok=1 slot=43
22951 :: DG	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] SEL52CTX seq=298 bar=2026.06.11 14:40 site=S2POLL dir=LONG oPx=160.521 oBT=2026.06.11 14:40 slRef=160.498 mode=1 halt=-
22952 :: EN	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] SLMEMO bar=2026.06.11 14:40 site=S2POLL result=COMPUTE ok=1 slRef=160.498 mode=1 computes=235 hits=60 genID=235 wrSite=S2POLL wrOrigin=evalClose
22953 :: HI	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJ1R bar=2026.06.11 14:40 src=POLL entry=160.520 sl=160.498 tp=160.587 risk=0.022 reward=0.067 R=3.05 verdict=PASS
22954 :: RO	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] ZONESHADOW bar=2026.06.11 14:40 dir=LONG close=160.520 zoneLo=160.489 zoneHi=160.504 gapPts=16 slRef=160.498 tp=160.587 R_close=3.05 tpInGap=0 shadow= near=13.83/sl1/tp1 mid=60.33/sl0/tp1 far=10.89/sl0/tp1 
22955 :: KO	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:40 hits=0 
22956 :: PL	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJDTTERMS bar=2026.06.11 14:40 Daily-POC=Lbody-below/Sbody-above Daily-VWAP=Lbody-below/Sbody-above Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
22957 :: IH	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] RETESTDIAG bar=2026.06.11 14:40 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:225.9pts
22958 :: NL	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:40 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
22959 :: IJ	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJSBTELEM bar=2026.06.11 14:40 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.523 c1=160.526 c0=160.521 arm=1 termC= termH=A_OPP - contender evaluation (Fix S3)
22960 :: RJ	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] ZONEID bar=2026.06.11 14:40 site=S4RQZ xobId=3103 fvgId=0
22961 :: FR	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] ZONEADOPT bar=2026.06.11 14:40 dir=LONG adopt=1 via=BAR newLo=160.498 newHi=160.518 barLo=160.512 barHi=160.527 sw1=160.507@2 sw2=-@-1
22962 :: GK	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJTOUCHSEEN evalBar=2026.06.11 14:40 touchBar=2026.06.11 14:40 dir=LONG anchor=Daily-POC zoneTouch=0
22963 :: JL	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] LEGTOUCH bar=2026.06.11 14:40 dir=LONG found=1 atShift=1 atBar=2026.06.11 14:40 legBound=2026.06.11 14:35 zoneLo=160.489 zoneHi=160.504 touchSeen=1
22964 :: GD	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJALIGN_PASS bar=2026.06.11 14:40 dir=LONG m15=1.0
22965 :: OF	0	03:01:48.421	Core 04	2026.06.11 14:45:05   [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.11 14:40 dir=LONG term=A_OPP
22966 :: HK	0	03:01:48.421	Core 04	2026.06.11 14:50:00   Alert: USDJPY M5 - POI RETEST SHORT at 160.523  [D-POC +1]

## Step 2b - new-journal lines 22966-23110 filtered to CONFIRM_STRUCT_FAIL, CONFIRMPOLL, SIGNAL, FIRE, ENTRY, Alert, STATE (mechanical pull; 22966 in both halves per relay)
--- FILTERED 22966-23110 ---
KEY=CONFIRM_STRUCT_FAIL N=2
23066 :: ES	0	03:01:54.524	Core 04	2026.06.11 15:00:00   [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.11 14:55 dir=LONG term=A_OPP
23103 :: KG	0	03:01:54.524	Core 04	2026.06.11 15:05:00   [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.11 15:00 dir=LONG term=A_OPP
KEY=CONFIRMPOLL N=4
22996 :: KS	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:45 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=1pts doji=0 touchAttr=1 confirm=0 shadow=true
23028 :: HQ	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:50 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=0pts doji=1 touchAttr=1 confirm=0 shadow=true
23060 :: PM	0	03:01:54.524	Core 04	2026.06.11 15:00:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:55 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=1 body=14pts doji=0 touchAttr=0 confirm=0 shadow=true
23096 :: DN	0	03:01:54.524	Core 04	2026.06.11 15:05:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 15:00 anchor=Daily-POC dir=LONG oppCandle=0 bodyDir=0 body=5pts doji=0 touchAttr=1 confirm=0 shadow=true
KEY=SIGNAL N=0
KEY=FIRE N=4
22982 :: LG	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:45 site=S2POLL dir=LONG branch=1SWING fracAnchorShift=3 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-73 deltaFracNuancePts=9 fracSteps=23 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=5 fracClass=CARVEOUT_FIRED sideFracViolations=0 outwardFracPts=73 outwardFracNuancePts=-9 fracAnchorRawShift=3 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:30 fracSkip=42 fracSkipT=2026.06.11 11
23018 :: HN	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:50 site=S2POLL dir=LONG branch=1SWING fracAnchorShift=4 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-73 deltaFracNuancePts=9 fracSteps=23 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=5 fracClass=CARVEOUT_FIRED sideFracViolations=0 outwardFracPts=73 outwardFracNuancePts=-9 fracAnchorRawShift=4 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:30 fracSkip=43 fracSkipT=2026.06.11 11
23050 :: RK	0	03:01:54.524	Core 04	2026.06.11 15:00:00   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:55 site=S2POLL dir=LONG branch=1SWING fracAnchorShift=5 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-73 deltaFracNuancePts=9 fracSteps=23 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=5 fracClass=CARVEOUT_FIRED sideFracViolations=0 outwardFracPts=73 outwardFracNuancePts=-9 fracAnchorRawShift=5 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:30 fracSkip=44 fracSkipT=2026.06.11 11
23083 :: GE	0	03:01:54.524	Core 04	2026.06.11 15:05:00   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 15:00 site=S2POLL dir=LONG branch=1SWING fracAnchorShift=6 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-73 deltaFracNuancePts=9 fracSteps=23 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=5 fracClass=CARVEOUT_FIRED sideFracViolations=0 outwardFracPts=73 outwardFracNuancePts=-9 fracAnchorRawShift=6 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:30 fracSkip=45 fracSkipT=2026.06.11 11
KEY=ENTRY N=0
KEY=Alert N=2
22966 :: HK	0	03:01:48.421	Core 04	2026.06.11 14:50:00   Alert: USDJPY M5 - POI RETEST SHORT at 160.523  [D-POC +1]
23067 :: LR	0	03:01:54.524	Core 04	2026.06.11 15:05:00   Alert: USDJPY M5 - POI RETEST LONG at 160.527  [D-POC]
KEY=STATE N=0
FILTERED_TOTAL=12

## Step 3A - CONFIRM_STRUCT_FAIL (single emit at 9254; 70 before, 25 after: 9184-9279)
9184:       //---      restructured; only the value of g_touchSeen reaching it changes.
9185:       //--- SET-ONLY by design: this never clears g_touchSeen. TOUCHCLEAR (Task 35)
9186:       //--- remains the sole clearing mechanism, so the change is monotone in
9187:       //--- admission - it can add candidates that reach S5, never remove one.
9188:       //--- The single-bar test below is now redundant (s = barShift is this scan's
9189:       //--- first iteration, with identical tests) and therefore harmless. It is
9190:       //--- retained rather than deleted.
9191:       int    s52_shift = -1;
9192:       double s52_legT  = 0.0;
9193:       bool   s52_found = FindLegTouch(barShift, g_zoneHi, g_zoneLo,
9194:                                       s52_shift, s52_legT, s35_fromFvg);
9195:        if(s52_found && !g_touchSeen)
9196:          {
9197:          if(InpDebugLog) PrintFormat("[SRJ-EA] UJTOUCHSEEN evalBar=%s touchBar=%s dir=%s anchor=%s zoneTouch=%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, s52_shift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none"), (s35_fromFvg ? 1 : 0));
9198:          g_touchSeen  = true;
9199:          g_touchBarHi = iHigh(_Symbol, PERIOD_CURRENT, s52_shift);
9200:          g_touchBarLo = iLow (_Symbol, PERIOD_CURRENT, s52_shift);
9201:         }
9202:       if(InpDebugLog)
9203:          PrintFormat("[SRJ-EA] LEGTOUCH bar=%s dir=%s found=%d atShift=%d atBar=%s "
9204:                      "legBound=%s zoneLo=%s zoneHi=%s touchSeen=%d",
9205:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
9206:                      DirName(g_dir), (int)s52_found, s52_shift,
9207:                      (s52_shift >= 0
9208:                         ? TimeToString(iTime(_Symbol, PERIOD_CURRENT, s52_shift), TIME_DATE|TIME_MINUTES)
9209:                         : "-"),
9210:                      (s52_legT > 0.0
9211:                         ? TimeToString((datetime)s52_legT, TIME_DATE|TIME_MINUTES)
9212:                         : "none"),
9213:                      DoubleToString(g_zoneLo, _Digits),
9214:                      DoubleToString(g_zoneHi, _Digits),
9215:                      (int)g_touchSeen);
9216:       if(!g_touchSeen)
9217:         {
9218:          bool oppositeDir = (g_dir == DIR_LONG) ? (c < o) : (c > o);
9219:          bool touchesZone = (h >= g_zoneLo && l <= g_zoneHi);
9220:          if(oppositeDir && (!s35_fromFvg || touchesZone))
9221:            { if(InpDebugLog) PrintFormat("[SRJ-EA] UJTOUCHSEEN evalBar=%s touchBar=%s dir=%s anchor=%s zoneTouch=%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none"), (touchesZone ? 1 : 0)); g_touchSeen = true; g_touchBarHi = h; g_touchBarLo = l; }
9222:         }
9223:       else
9224:         {
9225:          //--- [P-UJIMPL-IMPL-1 v8 IE3] direction-alignment guard above design-E2
9226:          //--- (touch book at 8786-8793 runs before it, no shadow).
9227:            {
9228:             double uj_m15 = 0.0; int uj_rf = 0;
9229:             string uj_bk = TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES);
9230:             if(!ReadFlow(FL_BUF_HTF_LOW, uj_m15, barShift)) uj_rf = 1;
9231:             double uj_want = (g_dir == DIR_LONG ? 1.0 : -1.0);
9232:             if(uj_rf == 1 || uj_m15 != uj_want)
9233:               { PrintFormat("[SRJ-EA] UJALIGN_NOMATCH bar=%s dir=%s m15=%s uj_readFail=%d", uj_bk, DirName(g_dir), DoubleToString(uj_m15, 1), uj_rf); return; }
9234:             PrintFormat("[SRJ-EA] UJALIGN_PASS bar=%s dir=%s m15=%s", uj_bk, DirName(g_dir), DoubleToString(uj_m15, 1));
9235:            }
9236:          //--- [P-CONFIRM-GATE E2] the S4->S5 edge IS the confirmation predicate
9237:          //--- now (terms A/A2/B/C; the ruled retracement term A2: the prior
9238:          //--- candle's CLOSE stays on the setup side of the anchor line - a wick
9239:          //--- through is the retracement, a CLOSE through is a line break).
9240:          //--- One-bar validity: promotion happens ONLY on a true test bar; a
9241:          //--- failed term consumes the confirmation (no carry-forward) and a
9242:          //--- later bar can present a fresh confirmation while the candidate is
9243:          //--- alive and in-window. The touch fallback above STAYS (it sets
9244:          //--- g_touchSeen - the retracement detection; unchanged).
9245:          string cfTerm = "";
9246:          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
9247:            {
9248:             ENUM_SRJ_STATE prev = g_state;
9249:             g_confirmFromState = prev;
9250:             g_state = ST_S5_GATE_CHECK;
9251:             LogState(prev, g_state);
9252:            }
9253:          else if(InpDebugLog)
9254:             PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",
9255:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9256:                                      TIME_DATE|TIME_MINUTES),
9257:                         DirName(g_dir), cfTerm);
9258:         }
9259:      }
9260: 
9261:    if(g_state == ST_S5_GATE_CHECK)
9262:      {
9263:       //--- [P-CONFIRM-GATE E3 / operator robustness ruling 2026-09-10, verbatim:
9264:       //--- "please make the divergence detection more robust. i consider the
9265:       //--- latest CQD divergence, although that was from an older structure.
9266:       //--- WHICH EVER LAST."] The divergence term is a newest-first CQD verdict
9267:       //--- walk with NO BOUND - no seed-bar bound, no age limit. The FIRST
9268:       //--- nonzero verdict walking left IS the latest on the indicator, however
9269:       //--- old. This replaces the anchor-bounded g_divLatch in the firing path
9270:       //--- entirely (the per-bar g_divLatch machinery above stays - it is
9271:       //--- working-set state and a census field; the firing path no longer
9272:       //--- reads it).
9273:       bool   divOk    = false;
9274:       int    divVal   = 0;
9275:       string divKind  = "";
9276:       {
9277:        int maxWalk = Bars(_Symbol, PERIOD_CURRENT) - 1;
9278:        for(int s = barShift; s <= maxWalk; s++)
9279:          {
## Step 3B - awaiting confirm (single hit at 9043 inside the 9039-9042 HEADS-UP print; 40 before, 30 after: 9003-9073)
9003:                      DirName(g_dir),
9004:                      haveFvg ? "FVG" : (haveXob ? "XOB" : "none"),
9005:                      DoubleToString(s31_zLo, _Digits),
9006:                      DoubleToString(s31_zHi, _Digits),
9007:                      (t123_promoT > 0.0 && t123_promoT != EMPTY_VALUE)
9008:                         ? TimeToString((datetime)t123_promoT, TIME_DATE|TIME_MINUTES)
9009:                         : "unset",
9010:                      (int)t133_applied, (int)t133_bounded,
9011:                      t133_scanned, t133_swings, t133_hits,
9012:                      t133_first,
9013:                      (t133_first >= 0 ? DoubleToString(t133_firstV, _Digits) : "-"),
9014:                      t133_via,
9015:                      (int)t133_legacy, s31_via,
9016:                      (int)s31_inPlay,
9017:                      (int)(s31_inPlay != t133_legacy),
9018:                      (int)t133_haveStop);
9019: 
9020:       if((haveFvg || haveXob) && s31_inPlay)
9021:         {
9022:          if(haveFvg) { g_zoneHi = MathMax(fvgHi, fvgLo); g_zoneLo = MathMin(fvgHi, fvgLo); }
9023:          else        { g_zoneHi = MathMax(xobHi, xobLo); g_zoneLo = MathMin(xobHi, xobLo); }
9024:          g_touchSeen = false;
9025:          ENUM_SRJ_STATE prev = g_state;
9026:          g_state = ST_S4_ARMED;
9027:          LogState(prev, g_state);
9028:          if(InpDebugLog)
9029:             PrintFormat("[SRJ-EA] %s S3 zone: src=%s haveFvg=%d haveXob=%d "
9030:                         "zoneLo=%s zoneHi=%s%s",
9031:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
9032:                         haveFvg ? "FVG" : "XOB",
9033:                         (int)haveFvg, (int)haveXob,
9034:                         DoubleToString(g_zoneLo, _Digits),
9035:                         DoubleToString(g_zoneHi, _Digits),
9036:                         (haveFvg && haveXob)
9037:                           ? "  <- BOTH QUALIFIED, unadjudicated precedence applied (EA-1)"
9038:                           : "");
9039:          if(InpAlertHeadsUp && !g_alertedArmed)
9040:            {
9041:             g_alertedArmed = true;
9042:             EmitAlert("HEADS-UP",
9043:                       StringFormat("zone %s-%s awaiting confirm",
9044:                                    DoubleToString(g_zoneLo, _Digits),
9045:                                    DoubleToString(g_zoneHi, _Digits)),
9046:                       false);
9047:            }
9048:           string uj_carryTerm = "";
9049:           double uj_carryM15 = 0.0;
9050:           bool uj_carryR = ReadFlow(FL_BUF_HTF_LOW, uj_carryM15, barShift);
9051:           double uj_carryWant = (g_dir == DIR_LONG ? 1.0 : -1.0);
9052:           if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && uj_carryR && uj_carryM15 == uj_carryWant)
9053:             {
9054:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJCONFIRMCARRY bankBar=%s fireBar=%s dir=%s poi=%s term=%s m15=%s - same-bar retest+confirm, S4 armed and firing same pass (Fix G1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, 0), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), uj_carryTerm, DoubleToString(uj_carryM15, 1));
9055:              ENUM_SRJ_STATE uj_cprev = g_state;
9056:              g_confirmFromState = uj_cprev;
9057:              g_state = ST_S5_GATE_CHECK;
9058:              LogState(uj_cprev, g_state);
9059:             }
9060:         }
9061:       else
9062:         {
9063:           if(InpDebugLog)
9064:              PrintFormat("[SRJ-EA] %s S3 waiting: no qualifying zone",
9065:                          TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
9066:           string cfTermZ = "";
9067:           bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ);
9068:           //--- [P-UJIMPL-IMPL-1 v8 IE2] direction-alignment guard above design-E1
9069:           //--- (buffer 21 = M15 confirmed vote; F251 preserved, changing it re-scopes).
9070:             if(!cfPassZ) {
9071:              double uj_m15 = 0.0; int uj_rf = 0;
9072:              string uj_bk = TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES);
9073:              if(!ReadFlow(FL_BUF_HTF_LOW, uj_m15, barShift)) uj_rf = 1;
## Step 3C - g_state assignments (mechanical exact-match census: ST_S4_ARMED exactly 2 sites, 9026 and 9345; ST_S5_GATE_CHECK exactly 3 sites, 9057, 9101 and 9250; each pasted with 25 before and 25 after)
### S4 site 1 (9001-9051)
9001:                      "committed=%d changed=%d haveStop=%d",
9002:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
9003:                      DirName(g_dir),
9004:                      haveFvg ? "FVG" : (haveXob ? "XOB" : "none"),
9005:                      DoubleToString(s31_zLo, _Digits),
9006:                      DoubleToString(s31_zHi, _Digits),
9007:                      (t123_promoT > 0.0 && t123_promoT != EMPTY_VALUE)
9008:                         ? TimeToString((datetime)t123_promoT, TIME_DATE|TIME_MINUTES)
9009:                         : "unset",
9010:                      (int)t133_applied, (int)t133_bounded,
9011:                      t133_scanned, t133_swings, t133_hits,
9012:                      t133_first,
9013:                      (t133_first >= 0 ? DoubleToString(t133_firstV, _Digits) : "-"),
9014:                      t133_via,
9015:                      (int)t133_legacy, s31_via,
9016:                      (int)s31_inPlay,
9017:                      (int)(s31_inPlay != t133_legacy),
9018:                      (int)t133_haveStop);
9019: 
9020:       if((haveFvg || haveXob) && s31_inPlay)
9021:         {
9022:          if(haveFvg) { g_zoneHi = MathMax(fvgHi, fvgLo); g_zoneLo = MathMin(fvgHi, fvgLo); }
9023:          else        { g_zoneHi = MathMax(xobHi, xobLo); g_zoneLo = MathMin(xobHi, xobLo); }
9024:          g_touchSeen = false;
9025:          ENUM_SRJ_STATE prev = g_state;
9026:          g_state = ST_S4_ARMED;
9027:          LogState(prev, g_state);
9028:          if(InpDebugLog)
9029:             PrintFormat("[SRJ-EA] %s S3 zone: src=%s haveFvg=%d haveXob=%d "
9030:                         "zoneLo=%s zoneHi=%s%s",
9031:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
9032:                         haveFvg ? "FVG" : "XOB",
9033:                         (int)haveFvg, (int)haveXob,
9034:                         DoubleToString(g_zoneLo, _Digits),
9035:                         DoubleToString(g_zoneHi, _Digits),
9036:                         (haveFvg && haveXob)
9037:                           ? "  <- BOTH QUALIFIED, unadjudicated precedence applied (EA-1)"
9038:                           : "");
9039:          if(InpAlertHeadsUp && !g_alertedArmed)
9040:            {
9041:             g_alertedArmed = true;
9042:             EmitAlert("HEADS-UP",
9043:                       StringFormat("zone %s-%s awaiting confirm",
9044:                                    DoubleToString(g_zoneLo, _Digits),
9045:                                    DoubleToString(g_zoneHi, _Digits)),
9046:                       false);
9047:            }
9048:           string uj_carryTerm = "";
9049:           double uj_carryM15 = 0.0;
9050:           bool uj_carryR = ReadFlow(FL_BUF_HTF_LOW, uj_carryM15, barShift);
9051:           double uj_carryWant = (g_dir == DIR_LONG ? 1.0 : -1.0);
### S4 site 2 (9320-9370)
9320:               {
9321:                int s4e_bit = s4e_line * 2 + (s4e_dir == DIR_LONG ? 0 : 1);
9322:                if(s4e_sess == SESSION_LONDON)
9323:                  { if(s4e_day != g_evictDayLon) { g_evictBitsLon = 0; g_evictDayLon = s4e_day; } g_evictBitsLon |= (1 << s4e_bit); }
9324:                else
9325:                  { if(s4e_day != g_evictDayNY) { g_evictBitsNY = 0; g_evictDayNY = s4e_day; } g_evictBitsNY |= (1 << s4e_bit); }
9326:                PrintFormat("[SRJ-EA] EVICTSUPPRESS bar=%s poi=%s dir=%s sess=%s untilDay=%s action=ARM",
9327:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
9328:                            g_lineCode[s4e_line], DirName(s4e_dir), SessionName(s4e_sess),
9329:                            TimeToString(s4e_day, TIME_DATE));
9330:               }
9331:             else
9332:                PrintFormat("[SRJ-EA] EVICTSUPPRESS_SKIP bar=%s cause=dead-record line=%d dir=%s sess=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), s4e_line, DirName(s4e_dir), SessionName(s4e_sess));
9333:             return;
9334:            }
9335:          if(g_confirmFromState == ST_S3_ZONE_WAIT)
9336:            {
9337:             g_state = ST_S3_ZONE_WAIT;
9338:             LogState(prevDiv, g_state);
9339:             return;
9340:            }
9341:          PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN bar=%s origin=%s",
9342:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9343:                                   TIME_DATE|TIME_MINUTES),
9344:                      StateName(g_confirmFromState));
9345:          g_state = ST_S4_ARMED;
9346:          LogState(prevDiv, ST_S4_ARMED);
9347:          return;
9348:         }
9349: 
9350:       //--- [P-NEXTOPEN 2026-09-09, operator directive] The entry reference is
9351:       //--- the NEXT candle's OPEN (the forming bar's open at this evaluation
9352:       //--- instant), not the evaluated bar's close (Part A spec section 4).
9353:       //--- Fail-soft: the evaluated bar's close is the fallback if the next
9354:       //--- bar's open cannot be read.
9355:       double nextOpenPx = (barShift >= 1) ? iOpen(_Symbol, PERIOD_CURRENT, barShift - 1) : 0.0;
9356:       if(nextOpenPx <= 0.0) nextOpenPx = iClose(_Symbol, PERIOD_CURRENT, barShift);
9357:       double currentPrice = nextOpenPx;
9358:       double tpTarget = 0.0;
9359:       if(!ComputeNearestTpTarget(barShift, g_dir, currentPrice, tpTarget))
9360:         {
9361:          if(InpDebugLog)
9362:              PrintFormat("[SRJ-EA] %s S5_NO_TP_TARGET",
9363:                          TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
9364:           //--- [P-SLDEF-4 E33] the decided outcome rides the census.
9365:           SrjOrderEmit(barShift, "NO_TP");
9366:           GoAbort(ABORT_NO_TP_TARGET, g_state); return;
9367:         }
9368: 
9369:       double slRef = 0.0;
9370:       ENUM_SRJ_SLMODE slMode = SL_MODE_NONE;
### S5 site 1 (9032-9082)
9032:                         haveFvg ? "FVG" : "XOB",
9033:                         (int)haveFvg, (int)haveXob,
9034:                         DoubleToString(g_zoneLo, _Digits),
9035:                         DoubleToString(g_zoneHi, _Digits),
9036:                         (haveFvg && haveXob)
9037:                           ? "  <- BOTH QUALIFIED, unadjudicated precedence applied (EA-1)"
9038:                           : "");
9039:          if(InpAlertHeadsUp && !g_alertedArmed)
9040:            {
9041:             g_alertedArmed = true;
9042:             EmitAlert("HEADS-UP",
9043:                       StringFormat("zone %s-%s awaiting confirm",
9044:                                    DoubleToString(g_zoneLo, _Digits),
9045:                                    DoubleToString(g_zoneHi, _Digits)),
9046:                       false);
9047:            }
9048:           string uj_carryTerm = "";
9049:           double uj_carryM15 = 0.0;
9050:           bool uj_carryR = ReadFlow(FL_BUF_HTF_LOW, uj_carryM15, barShift);
9051:           double uj_carryWant = (g_dir == DIR_LONG ? 1.0 : -1.0);
9052:           if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, uj_carryTerm) && uj_carryR && uj_carryM15 == uj_carryWant)
9053:             {
9054:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJCONFIRMCARRY bankBar=%s fireBar=%s dir=%s poi=%s term=%s m15=%s - same-bar retest+confirm, S4 armed and firing same pass (Fix G1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, 0), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), uj_carryTerm, DoubleToString(uj_carryM15, 1));
9055:              ENUM_SRJ_STATE uj_cprev = g_state;
9056:              g_confirmFromState = uj_cprev;
9057:              g_state = ST_S5_GATE_CHECK;
9058:              LogState(uj_cprev, g_state);
9059:             }
9060:         }
9061:       else
9062:         {
9063:           if(InpDebugLog)
9064:              PrintFormat("[SRJ-EA] %s S3 waiting: no qualifying zone",
9065:                          TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
9066:           string cfTermZ = "";
9067:           bool cfPassZ = IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermZ);
9068:           //--- [P-UJIMPL-IMPL-1 v8 IE2] direction-alignment guard above design-E1
9069:           //--- (buffer 21 = M15 confirmed vote; F251 preserved, changing it re-scopes).
9070:             if(!cfPassZ) {
9071:              double uj_m15 = 0.0; int uj_rf = 0;
9072:              string uj_bk = TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES);
9073:              if(!ReadFlow(FL_BUF_HTF_LOW, uj_m15, barShift)) uj_rf = 1;
9074:              double uj_want = (g_dir == DIR_LONG ? 1.0 : -1.0);
9075:              if(uj_rf == 1 || uj_m15 != uj_want)
9076:                { PrintFormat("[SRJ-EA] UJALIGN_NOMATCH bar=%s dir=%s m15=%s uj_readFail=%d", uj_bk, DirName(g_dir), DoubleToString(uj_m15, 1), uj_rf); return; }
9077:              PrintFormat("[SRJ-EA] UJALIGN_PASS bar=%s dir=%s m15=%s", uj_bk, DirName(g_dir), DoubleToString(uj_m15, 1));
9078:             }
9079:             else
9080:              {
9081:               double uj_bm15 = 0.0; bool uj_bm15r = ReadFlow(FL_BUF_HTF_LOW, uj_bm15, barShift);
9082:               if(InpDebugLog) PrintFormat("[SRJ-EA] UJALIGN_BYPASS bar=%s dir=%s m15=%s rf=%d - M15 guard bypassed on confirmed bar (Fix Z-B1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), DoubleToString(uj_bm15, 1), (uj_bm15r ? 1 : 0));
### S5 site 2 (9076-9126)
9076:                { PrintFormat("[SRJ-EA] UJALIGN_NOMATCH bar=%s dir=%s m15=%s uj_readFail=%d", uj_bk, DirName(g_dir), DoubleToString(uj_m15, 1), uj_rf); return; }
9077:              PrintFormat("[SRJ-EA] UJALIGN_PASS bar=%s dir=%s m15=%s", uj_bk, DirName(g_dir), DoubleToString(uj_m15, 1));
9078:             }
9079:             else
9080:              {
9081:               double uj_bm15 = 0.0; bool uj_bm15r = ReadFlow(FL_BUF_HTF_LOW, uj_bm15, barShift);
9082:               if(InpDebugLog) PrintFormat("[SRJ-EA] UJALIGN_BYPASS bar=%s dir=%s m15=%s rf=%d - M15 guard bypassed on confirmed bar (Fix Z-B1)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), DoubleToString(uj_bm15, 1), (uj_bm15r ? 1 : 0));
9083:              }
9084:           //--- [P-CONFIRM-ANYSTATE E1 2026-09-11, operator ruling verbatim: "if
9085:          //--- all my conditions are met, the trade is ON. The EA must take the
9086:          //--- confirmation candle whenever it appears (even while its own prep
9087:          //--- is unfinished), keeping the one-bar rule."] A PRE-BINDING
9088:          //--- candidate (S3_ZONE_WAIT: zone unbound or not in play) now ALSO
9089:          //--- evaluates the confirmation predicate at this bar's close. PASS ->
9090:          //--- promote DIRECTLY to ST_S5_GATE_CHECK (the S5 block below runs in
9091:          //--- this same pass: divergence walk -> R latch -> fire); FAIL -> the
9092:          //--- confirmation is consumed (no carry-forward; the candidate stays
9093:          //--- at S3). DECLARED: the pre-confirmation freshness poll cannot run
9094:          //--- pre-binding (it tests the BOUND zone), so a pre-bind firing
9095:          //--- proceeds without it; S2 candidates are OUTSIDE the ruled scope.
9096:           string cfTermPB = cfTermZ;
9097:           if(cfPassZ)
9098:            {
9099:             ENUM_SRJ_STATE prevPB = g_state;
9100:             g_confirmFromState = prevPB;
9101:             g_state = ST_S5_GATE_CHECK;
9102:             LogState(prevPB, g_state);
9103:             if(InpDebugLog)
9104:                PrintFormat("[SRJ-EA] CONFIRM_PREBIND bar=%s dir=%s poi=%s",
9105:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9106:                                         TIME_DATE|TIME_MINUTES),
9107:                            DirName(g_dir), AnchorStr());
9108:             //--- no return: fall through to the ST_S5_GATE_CHECK block below
9109:            }
9110:          else
9111:            {
9112:             if(InpDebugLog)
9113:                PrintFormat("[SRJ-EA] CONFIRM_PREBIND_FAIL bar=%s dir=%s term=%s",
9114:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9115:                                         TIME_DATE|TIME_MINUTES),
9116:                            DirName(g_dir), cfTermPB);
9117:             return;
9118:            }
9119:         }
9120:      }
9121: 
9122:    if(g_state == ST_S4_ARMED)
9123:      {
9124:       double o = iOpen (_Symbol, PERIOD_CURRENT, barShift);
9125:       double h = iHigh (_Symbol, PERIOD_CURRENT, barShift);
9126:       double l = iLow  (_Symbol, PERIOD_CURRENT, barShift);
### S5 site 3 (9225-9275)
9225:          //--- [P-UJIMPL-IMPL-1 v8 IE3] direction-alignment guard above design-E2
9226:          //--- (touch book at 8786-8793 runs before it, no shadow).
9227:            {
9228:             double uj_m15 = 0.0; int uj_rf = 0;
9229:             string uj_bk = TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES);
9230:             if(!ReadFlow(FL_BUF_HTF_LOW, uj_m15, barShift)) uj_rf = 1;
9231:             double uj_want = (g_dir == DIR_LONG ? 1.0 : -1.0);
9232:             if(uj_rf == 1 || uj_m15 != uj_want)
9233:               { PrintFormat("[SRJ-EA] UJALIGN_NOMATCH bar=%s dir=%s m15=%s uj_readFail=%d", uj_bk, DirName(g_dir), DoubleToString(uj_m15, 1), uj_rf); return; }
9234:             PrintFormat("[SRJ-EA] UJALIGN_PASS bar=%s dir=%s m15=%s", uj_bk, DirName(g_dir), DoubleToString(uj_m15, 1));
9235:            }
9236:          //--- [P-CONFIRM-GATE E2] the S4->S5 edge IS the confirmation predicate
9237:          //--- now (terms A/A2/B/C; the ruled retracement term A2: the prior
9238:          //--- candle's CLOSE stays on the setup side of the anchor line - a wick
9239:          //--- through is the retracement, a CLOSE through is a line break).
9240:          //--- One-bar validity: promotion happens ONLY on a true test bar; a
9241:          //--- failed term consumes the confirmation (no carry-forward) and a
9242:          //--- later bar can present a fresh confirmation while the candidate is
9243:          //--- alive and in-window. The touch fallback above STAYS (it sets
9244:          //--- g_touchSeen - the retracement detection; unchanged).
9245:          string cfTerm = "";
9246:          if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))
9247:            {
9248:             ENUM_SRJ_STATE prev = g_state;
9249:             g_confirmFromState = prev;
9250:             g_state = ST_S5_GATE_CHECK;
9251:             LogState(prev, g_state);
9252:            }
9253:          else if(InpDebugLog)
9254:             PrintFormat("[SRJ-EA] CONFIRM_STRUCT_FAIL bar=%s dir=%s term=%s",
9255:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9256:                                      TIME_DATE|TIME_MINUTES),
9257:                         DirName(g_dir), cfTerm);
9258:         }
9259:      }
9260: 
9261:    if(g_state == ST_S5_GATE_CHECK)
9262:      {
9263:       //--- [P-CONFIRM-GATE E3 / operator robustness ruling 2026-09-10, verbatim:
9264:       //--- "please make the divergence detection more robust. i consider the
9265:       //--- latest CQD divergence, although that was from an older structure.
9266:       //--- WHICH EVER LAST."] The divergence term is a newest-first CQD verdict
9267:       //--- walk with NO BOUND - no seed-bar bound, no age limit. The FIRST
9268:       //--- nonzero verdict walking left IS the latest on the indicator, however
9269:       //--- old. This replaces the anchor-bounded g_divLatch in the firing path
9270:       //--- entirely (the per-bar g_divLatch machinery above stays - it is
9271:       //--- working-set state and a census field; the firing path no longer
9272:       //--- reads it).
9273:       bool   divOk    = false;
9274:       int    divVal   = 0;
9275:       string divKind  = "";
## Step 3D - IsConfirmationCandle whole body (2337-2378, 41 lines) plus first-use term block (8300-8320)
2337:  bool IsConfirmationCandle(const int barShift, const int anchorLine,
2338:                            const ENUM_SRJ_DIR dir, string &failTerm, const bool allowReclaim = false)
2339:   {
2340:    failTerm = "";
2341:    if(anchorLine < 0 || dir == DIR_NONE) { failTerm = "NO_ANCHOR"; return false; }
2342:    double o1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1);
2343:    double c1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1);
2344:    double h1 = iHigh (_Symbol, PERIOD_CURRENT, barShift + 1);
2345:    double l1 = iLow  (_Symbol, PERIOD_CURRENT, barShift + 1);
2346:    double o0 = iOpen (_Symbol, PERIOD_CURRENT, barShift);
2347:    double c0 = iClose(_Symbol, PERIOD_CURRENT, barShift);
2348:    if(o1 <= 0.0 || c1 <= 0.0 || o0 <= 0.0 || c0 <= 0.0)
2349:       { failTerm = "NO_DATA"; return false; }
2350:    double L;
2351:    if(!ReadBuf1(g_hPoi, anchorLine, L, barShift))
2352:       { failTerm = "NO_LINE"; return false; }
2353:     if(L == EMPTY_VALUE || L <= 0.0)
2354:        { failTerm = "NO_LINE"; return false; }
2355:     //--- [P-SLDEF-1 E14] N1 counters at the VWAP/POC site. Grounding: A2
2356:     //--- needs c1 >= L (LONG) / c1 <= L (SHORT) - "applies to VWAP and POC
2357:     //--- alike": exact equality passes. Family by line code.
2358:     //--- [P-SLDEF-1b E19] A2 verdict flags: set where equality is encountered,
2359:     //--- paired at each terminal return below (no branch touched).
2360:     bool n1_vw = false, n1_poc = false;
2361:     if(c1 == L)
2362:       {
2363:        if(StringFind(g_lineCode[anchorLine], "VWAP") >= 0) { g_n1_vwapEq++; n1_vw = true; }
2364:        if(StringFind(g_lineCode[anchorLine], "POC") >= 0) { g_n1_pocEq++; n1_poc = true; }
2365:       }
2366:     bool oppCandle = (dir == DIR_LONG)  ? (c1 < o1) : (c1 > o1);
2367:     if(!oppCandle)  { failTerm = "A_OPP"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2368:     bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L || (allowReclaim && o1 <= L && c0 >= o1)) : (c1 <= L || (allowReclaim && o1 >= L && c0 <= o1));
2369:     if(!closeSideOk) { failTerm = "A2_CLOSE_BREAK"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2370:     double body    = MathAbs(c0 - o0);
2371:     bool   isDoji  = (body < _Point * 0.0001);
2372:     bool   bodyDir = (dir == DIR_LONG)  ? (c0 > o0) : (c0 < o0);
2373:     if(isDoji || !bodyDir) { failTerm = "B_BODY"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2374:     bool touch = (h1 >= L - _Point && l1 <= L + _Point);
2375:     if(!touch)      { failTerm = "C_TOUCH"; if(n1_vw) g_n1_vwapInv++; if(n1_poc) g_n1_pocInv++; return false; }
2376:     if(n1_vw) g_n1_vwapSurv++; if(n1_poc) g_n1_pocSurv++;
2377:     return true;
2378:   }
8300:         string s1g_pre = "PASS";
8301:         if(s1g_o1 <= 0.0 || s1g_c1 <= 0.0 || s1g_o0 <= 0.0 || s1g_c0 <= 0.0) s1g_pre = "NO_DATA";
8302:         double s1g_L = g_anchorPrice;
8303:         if(s1g_pre == "PASS" && (s1g_L == EMPTY_VALUE || s1g_L <= 0.0)) s1g_pre = "NO_LINE";
8304:         int s1g_opp = (((g_dir == DIR_LONG) ? (s1g_c1 < s1g_o1) : (s1g_c1 > s1g_o1))) ? 1 : 0;
8305:         int s1g_a2 = (((g_dir == DIR_LONG) ? (s1g_c1 >= s1g_L) : (s1g_c1 <= s1g_L))) ? 1 : 0;
8306:         int s1g_isDoji = ((MathAbs(s1g_c0 - s1g_o0) < _Point * 0.0001)) ? 1 : 0;
8307:         int s1g_bodyDir = (((g_dir == DIR_LONG) ? (s1g_c0 > s1g_o0) : (s1g_c0 < s1g_o0))) ? 1 : 0;
8308:         int s1g_body = ((s1g_isDoji == 0) && (s1g_bodyDir == 1)) ? 1 : 0;
8309:         int s1g_touch = (((s1g_h1 >= s1g_L - _Point) && (s1g_l1 <= s1g_L + _Point))) ? 1 : 0;
8310:         string s1g_derived = (s1g_pre != "PASS") ? s1g_pre : ((s1g_opp == 0) ? "A_OPP" : ((s1g_a2 == 0) ? "A2_CLOSE_BREAK" : ((s1g_body == 0) ? "B_BODY" : ((s1g_touch == 0) ? "C_TOUCH" : "PASS"))));
8311:         string s1g_t1 = (s1f_term == "") ? "PASS" : s1f_term;
8312:         int s1g_match = (s1g_derived == s1g_t1) ? 1 : 0;
8313:         s1g_nProf++;
8314:         if(InpDebugLog)
8315:            PrintFormat("[SRJ-EA] SIDE1G_PROFILE bar=%s opp=%d a2=%d body=%d touch=%d pre=%s term=%s t1term=%s match=%d",
8316:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
8317:                        s1g_opp, s1g_a2, s1g_body, s1g_touch, s1g_pre, s1g_derived, s1g_t1, s1g_match);
8318:         //--- [SIDE1G] R2 VOTE3 (legDir capture vs buffer vote + 15m read-only leg)
8319:         double s1g_m15 = EMPTY_VALUE;
8320:         ReadFlow(FL_BUF_HTF_LOW, s1g_m15, barShift);
Term definitions inside the body: A_OPP at 2367 (prior candle not opposite: LONG needs c1 below o1, else fail); A2_CLOSE_BREAK at 2369 (close on the wrong side of the line without reclaim, else fail); B_BODY at 2373 (doji or wrong-direction body on the evaluated bar, else fail); C_TOUCH at 2375 (no line touch, else fail). First-use mirror at 8310 derives the same four terms from s1g fields.
## Step 3E - g_touchSeen sets-to-true and reads-in-conditions (mechanical split of all 23 mentions: sets-to-true at exactly one line, 9198; reads in conditions at 9160, 9195 and 9216; all other mentions are false-sets, decl, mirrors or comments)
9153:                            (int)g_touchSeen);
9154: 
9155:             g_zoneHi = s35_zHi;
9156:             g_zoneLo = s35_zLo;
9157: 
9158:             //--- Touch revalidation. Without it, a touch of one zone would
9159:             //--- license a confirming close against a different zone.
9160:             if(g_touchSeen && g_touchBarHi > 0.0 &&
9161:                !(g_touchBarHi >= g_zoneLo && g_touchBarLo <= g_zoneHi))
9162:               {
9163:                g_touchSeen = false;
9164:                if(InpDebugLog)
9165:                   PrintFormat("[SRJ-EA] TOUCHCLEAR bar=%s touchBarLo=%s touchBarHi=%s "
9166:                               "zoneLo=%s zoneHi=%s",
9167:                               TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
9168:                               DoubleToString(g_touchBarLo, _Digits),
9169:                               DoubleToString(g_touchBarHi, _Digits),
9170:                               DoubleToString(g_zoneLo, _Digits),
9171:                               DoubleToString(g_zoneHi, _Digits));
9172:               }
9173:            }
9174:         }
9175:       //--- [Task 52 / EA-59b] Leg-scoped touch scan. Placed AFTER the live-zone
9176:       //--- re-read above, so it tests against the current zone, and BEFORE the
9177:       //--- existing single-bar touch test below. Two effects:
9178:       //---   1. A touch that completed before this candidate armed is now seen.
9179:       //---   2. Because it sets g_touchSeen before the if/else below, the ELSE
9180:       //---      (confirm) branch runs on the SAME pass the touch is discovered.
9181:       //---      That is what admits a touch on the bar immediately left of the
9182:       //---      confirming close, and a single bar that is simultaneously the POI
9183:       //---      retest and the confirming candle. The if/else itself is not
9184:       //---      restructured; only the value of g_touchSeen reaching it changes.
9185:       //--- SET-ONLY by design: this never clears g_touchSeen. TOUCHCLEAR (Task 35)
9186:       //--- remains the sole clearing mechanism, so the change is monotone in
9187:       //--- admission - it can add candidates that reach S5, never remove one.
9188:       //--- The single-bar test below is now redundant (s = barShift is this scan's
9189:       //--- first iteration, with identical tests) and therefore harmless. It is
9190:       //--- retained rather than deleted.
9191:       int    s52_shift = -1;
9192:       double s52_legT  = 0.0;
9193:       bool   s52_found = FindLegTouch(barShift, g_zoneHi, g_zoneLo,
9194:                                       s52_shift, s52_legT, s35_fromFvg);
9195:        if(s52_found && !g_touchSeen)
9196:          {
9197:          if(InpDebugLog) PrintFormat("[SRJ-EA] UJTOUCHSEEN evalBar=%s touchBar=%s dir=%s anchor=%s zoneTouch=%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, s52_shift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none"), (s35_fromFvg ? 1 : 0));
9198:          g_touchSeen  = true;
9199:          g_touchBarHi = iHigh(_Symbol, PERIOD_CURRENT, s52_shift);
9200:          g_touchBarLo = iLow (_Symbol, PERIOD_CURRENT, s52_shift);
9201:         }
9202:       if(InpDebugLog)
9203:          PrintFormat("[SRJ-EA] LEGTOUCH bar=%s dir=%s found=%d atShift=%d atBar=%s "
9204:                      "legBound=%s zoneLo=%s zoneHi=%s touchSeen=%d",
9205:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
9206:                      DirName(g_dir), (int)s52_found, s52_shift,
9207:                      (s52_shift >= 0
9208:                         ? TimeToString(iTime(_Symbol, PERIOD_CURRENT, s52_shift), TIME_DATE|TIME_MINUTES)
9209:                         : "-"),
9210:                      (s52_legT > 0.0
9211:                         ? TimeToString((datetime)s52_legT, TIME_DATE|TIME_MINUTES)
9212:                         : "none"),
9213:                      DoubleToString(g_zoneLo, _Digits),
9214:                      DoubleToString(g_zoneHi, _Digits),
9215:                      (int)g_touchSeen);
9216:       if(!g_touchSeen)
9217:         {
9218:          bool oppositeDir = (g_dir == DIR_LONG) ? (c < o) : (c > o);
9219:          bool touchesZone = (h >= g_zoneLo && l <= g_zoneHi);
9220:          if(oppositeDir && (!s35_fromFvg || touchesZone))
9221:            { if(InpDebugLog) PrintFormat("[SRJ-EA] UJTOUCHSEEN evalBar=%s touchBar=%s dir=%s anchor=%s zoneTouch=%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none"), (touchesZone ? 1 : 0)); g_touchSeen = true; g_touchBarHi = h; g_touchBarLo = l; }
9222:         }
### Holder-slot declarations (1060-1068: g_state 1062, g_dir 1063, g_anchorLine 1066)
1060: //====================== end [Task 160] contracts ===================
1061: //====================== Singleton sequence state ====================
1062: ENUM_SRJ_STATE   g_state          = ST_IDLE;
1063: ENUM_SRJ_DIR     g_dir            = DIR_NONE;
1064: ENUM_SRJ_REGIME  g_regime         = REGIME_NONE;
1065: ENUM_SRJ_SESSION g_sessionAtEntry = SESSION_NONE;
1066: int              g_anchorLine     = -1;
1067: double           g_anchorPrice    = 0.0;
1068: datetime         g_anchorBarTime  = 0;
## Step 3F - EmitAlert( call sites (5 total: 1852 definition, calls at 6614 STAND-DOWN, 9042 HEADS-UP, 10625 SIGNAL, 12062 EXIT). Entry alert = SIGNAL (not HEADS-UP, not STAND-DOWN): pasted 10585-10645 (40 before, 20 after).
10585: 
10586:       //--- [P-CONFIRM-GATE E3] the async wait RETIRES (one-bar validity): the
10587:       //--- divergence verdict was decided above at the confirmation close.
10588:       //--- divKind is the LATEST verdict's kind from the unbounded walk - if we
10589:       //--- are here, it is matched by construction (an opposing/absent verdict
10590:       //--- already rolled the candidate back to S4).
10591:       double tpR = (slDist > 0.0) ? (tpDist / slDist) : 0.0;
10592: 
10593:        //--- [P-SLDEF-4 E33+E32] PASS census, then the firing-row flag: the
10594:        //--- decision row whose barTime matches this passing evaluation fired.
10595:        //--- Print-only; the latch and LogSignal below are untouched.
10596:        SrjOrderEmit(barShift, "PASS");
10597:        datetime ordFireT = iTime(_Symbol, PERIOD_CURRENT, barShift);
10598:        for(int ordF = 0; ordF < g_dec_n; ordF++)
10599:           if(g_dec_barT[ordF] == ordFireT) g_dec_fired[ordF] = 1;
10600:        //--- [P-SLDEF-5 E39/gate 11] lost-signal check: a firing row whose
10601:        //--- ext-1 R misses the threshold would be lost under the candidate.
10602:        //--- Expected zero lines; any line is reported, not absorbed.
10603:        if(g_slext_barT == ordFireT && g_slext_defined == 1)
10604:          {
10605:           double psRisk = MathAbs(currentPrice - g_slext_px);
10606:           double psR = (psRisk > 0.0 ? MathAbs(tpTarget - currentPrice) / psRisk : 0.0);
10607:           if(psR < InpMinRewardRisk)
10608:             {
10609:              g_slext_lostN++;
10610:              g_slext_lostRows += TimeToString(ordFireT, TIME_DATE|TIME_MINUTES) + ";";
10611:              string psLine = StringFormat("[SRJ-EA] SLEXTLOST fields=6 bar=%s dir=%s ext1R=%.2f ext1RewardPts=%.5f ext1RiskPts=%.5f threshold=%.2f",
10612:                        TimeToString(ordFireT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
10613:                        psR, g_slext_rewardPts, g_slext_riskPts, InpMinRewardRisk);
10614:              LwAudit("SLEXTLOST", psLine);
10615:              Print(psLine);
10616:             }
10617:          }
10618:         LogSignal(tpTarget, tpR, slRef, slMode, divKind);
10619:         if(InpDebugLog) A6Fired(barShift, tpTarget, tpR, slRef, slMode, divKind);   //--- [A6-HOOK] (ii)
10620:         if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1F_WATCH bar=%s dir=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir));   //--- [SIDE1F] (iii) fire watch (read-only)
10621: 
10622:       if(!g_alertedSignal)
10623:         {
10624:          g_alertedSignal = true;
10625:          EmitAlert("SIGNAL",
10626:                    StringFormat("R=%.2f SL %s TP %s spr=%d",
10627:                                 tpR,
10628:                                 DoubleToString(slRef,    _Digits),
10629:                                 DoubleToString(tpTarget, _Digits),
10630:                                 (int)SymbolInfoInteger(_Symbol, SYMBOL_SPREAD)),
10631:                    true);
10632:         }
10633: 
10634:       //--- [P-EXITMODEL 2026-09-09, operator-issued packet] The section 5 exit phase
10635:       //--- now exists: snapshot the trade into the managed record BEFORE
10636:       //--- ResetSequence (the R-201 ordering discipline). The entry reference IS the
10637:       //--- next candle's open (currentPrice above), so the fill is immediate at that
10638:       //--- open (section 5.5's limit "fills on a wick" - the forming bar's own open
10639:       //--- is the fill tick); the fill candle's own close is then tested like every
10640:       //--- bar ("exit immediately rather than waiting for a subsequent close").
10641:       //--- DECLARED BOUNDARY: one managed record (the R-201 precedent). A second
10642:       //--- signal while one trade is managing logs MTCOLLISION and REPLACES the
10643:       //--- record (spec section 6's blessed London+NY exception would need a
10644:       //--- registry - a separate packet item if it ever fires).
10645:       if(g_mtrade.active && g_mtrade.state == MT_MANAGING)
## Step 3G (supports Q7-Q8) - singleton + contender + yield + transfer + shadow guarantees, spliced
### Singleton comment (7498-7505)
7498:    //---
7499:    //--- ACCEPTED CONSEQUENCE 2, and the real risk: this is a RETENTION edit
7500:    //--- under a SINGLETON architecture. A candidate that lives longer holds the
7501:    //--- singleton longer and can suppress POI retests that previously seeded
7502:    //--- their own candidates. So the candidate COUNT may FALL and SUPPRESSED may
7503:    //--- RISE even though this edit cannot kill anything directly. Both are
7504:    //--- censused. A net loss by that route is an argument for section 5.6's
7505:    //--- concurrency work, not against this ruling.
### POIREPLACE removal by his Q3 ruling (7852-7858)
7852:                         StateName(g_state),
7853:                         g_authorityRank[t78_pr.topLine] / 2,
7854:                         g_authorityRank[g_anchorLine]   / 2);
7855:             /* [Task 91 / EA-105 / operator ruling Q3] REMOVED. Was GoAbort(ABORT_POI_REPLACED, g_state). Operator: "i will always execute the first one, the later higher POI does not get executed... if i have executed the first trade, i would not execute other trade even it's from higher hierarchy." Arrival order governs ACROSS TIME; anchor tier governs ONLY a same-bar tie between two completed candidates (EA-96), which MarkSessionUsed on the SIGNAL path already enforces. The across-time replacement reading of Part A Step 8 / D-3 / G-2 was a planner inference and is overturned. The POIREPLACE line above is RETAINED as a counterfactual census: it still prints on every bar this removal now lets pass, so the 16 firings measured on the Task 88 run stay countable. Threshold-free - nothing is added, one call is removed. */ ;
7856:             }
7857:           //--- [S2-CROSS-DIR-PREEMPT] live transfer (Luna V87-LIVE-PREEMPT-001
7858:           //--- §§3-6, cleared BY NAME; his selection token + fresh run word this
### Contender yield replaces holder (8440-8448)
8440:         double uj_sbLineVal = 0.0; if(uj_sbHave && uj_sbLine >= 0 && !ReadBuf1(g_hPoi, uj_sbLine, uj_sbLineVal, barShift)) uj_sbLineVal = 0.0;
8441:         double uj_sbo1 = iOpen (_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc1 = iClose(_Symbol, PERIOD_CURRENT, barShift + 1); double uj_sbc0 = iClose(_Symbol, PERIOD_CURRENT, barShift); int uj_sbarm = 1;
8442:         if(InpDebugLog) PrintFormat("[SRJ-EA] UJSBTELEM bar=%s dir=%s have=%d sbDir=%s sbLine=%d confC=%d confH=%d sbL=%s o1=%s c1=%s c0=%s arm=%d termC=%s termH=%s - contender evaluation (Fix S3)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), (int)uj_sbHave, DirName(uj_sbDir), uj_sbLine, (int)uj_sbConfC, (int)uj_sbConfH, DoubleToString(uj_sbLineVal, _Digits), DoubleToString(uj_sbo1, _Digits), DoubleToString(uj_sbc1, _Digits), DoubleToString(uj_sbc0, _Digits), uj_sbarm, uj_sbTermC, uj_sbTermH);
8443:        if(uj_sbConfC && !uj_sbConfH && (g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED))
8444:          {
8445:           int uj_sbFromLine = g_anchorLine; ENUM_SRJ_DIR uj_sbFromDir = g_dir;
8446:           g_anchorLine = uj_sbLine; g_dir = uj_sbDir;
8447:           ReadBuf1(g_hPoi, uj_sbLine, g_anchorPrice, barShift);
8448:           g_anchorBarTime = barTime;
### Shadow record-only guarantee (7826-7829)
7826:           //--- FORBIDDEN in this shadow and ABSENT below: g_state / g_anchorLine /
7827:           //--- g_dir / anchor price-time / zone-touch-latch / GoAbort /
7828:           //--- ResetSequence / order-stop-eligibility-session writes
7829:           //--- (documented guarantee, grade-verified).
### Census read-only scope (8010-8012)
8010:    //--- Gated on InpDebugLog. Assigns nothing outside its own statics, reads
8011:    //--- g_state / g_dir / g_anchorLine for labelling only, and cannot alter
8012:    //--- control flow. R8 is NOT engaged.
### Transfer gate (7900-7912; full gate condition at 7904)
7900:                  g_ujOpReseedBarTime = barTime;
7901:                  g_ujOpReseedDir = (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0));
7902:                 }
7903:              }
7904:           if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf)))
7905:             {
7906:              int s1c_fromLine     = g_anchorLine;
7907:              ENUM_SRJ_DIR s1c_fromDir = g_dir;
7908:              g_anchorLine    = t78_pr.topLine;
7909:              ReadBuf1(g_hPoi, t78_pr.topLine, g_anchorPrice, barShift);
7910:              g_anchorBarTime = barTime;
7911:              g_dir           = t78_dir;
7912:              g_zoneHi        = 0.0;

## Step 3b - the operator documented explanation (searched AGENTS.md, .clinerules, 1093 .md files under 06_HANDOFFS + 01_TASKS)
Broad search: 22885 total hits across 16 phrases; more than 80, so per relay only operator-near hits are kept below plus the discriminating-phrase census: first validated 0 relevant (1 unrelated harness line), first to validate 0, first to be validated 0, multiple setups 0, more than one setup 0, zone touch 0 relevant, touched the zone 0 relevant, enter on confirmation 0, enter straight away 0, enter right away 0. The planner phrasing multiple-setups-can-be-armed / first-validated-is-taken scores ZERO verbatim hits anywhere in the record.
### 6 most relevant hits, 20 lines around each (operator-quoted first)
### C1 ANCHORTIER-1 L56-75 (while-alive singleton + his verbatim Q3 ruling)
ANCHORTIER-1 L56: Then DetectPoiRetest -> g_anchorLine = the single winning line; g_dir; g_anchorPrice =
ANCHORTIER-1 L57: the line value AT THE RETEST BAR (EA L3187); g_sessionAtEntry stamped; g_divLatch=false;
ANCHORTIER-1 L58: S1_REGIME. The regime/LTF/zone/divergence gates run downstream (S1->S5).
ANCHORTIER-1 L59: 
ANCHORTIER-1 L60: ## 6. WHILE A CANDIDATE IS ALIVE — the singleton and YOUR OWN RULING
ANCHORTIER-1 L61: - Every retest arriving while a candidate is alive is DISCARDED (dedup while alive).
ANCHORTIER-1 L62:   The Task-73 census (EA L3127-3161) prints each: poi/dir/opp/higher, where
ANCHORTIER-1 L63:   higher = raw-rank comparison (t73_isHigh, EA L3142).
ANCHORTIER-1 L64: - ACROSS-TIME REPLACEMENT IS REMOVED — by YOUR ruling, verbatim on EA L3100
ANCHORTIER-1 L65:   (Task 91 / EA-105 / operator ruling Q3): "i will always execute the first one, the
ANCHORTIER-1 L66:   later higher POI does not get executed... if i have executed the first trade, i would
ANCHORTIER-1 L67:   not execute other trade even it's from higher hierarchy." Arrival order governs across
ANCHORTIER-1 L68:   time; anchor tier governs ONLY the same-bar tie (section 4). The POIREPLACE line
ANCHORTIER-1 L69:   (EA L3091) is retained as a counterfactual census: it prints when an OPPOSITE-direction
ANCHORTIER-1 L70:   retest of a HIGHER FAMILY-PAIR (rank/2) arrives while a candidate is alive.
ANCHORTIER-1 L71: - G-5's same-direction higher-tier upgrade: deliberately NOT implemented (EA L3047-3049).
ANCHORTIER-1 L72: 
ANCHORTIER-1 L73: ## 7. TP TARGET ADMISSION — ComputeNearestTpTarget (EA L1590-1644)
ANCHORTIER-1 L74: Candidates: the ten session/previous-day levels (mask-filtered by the swept+live mask,
ANCHORTIER-1 L75: EA L1631-1636) plus the 12 POI lines, where a POI line is ADMITTED only if it is in the
### C2 ANCHORTIER-1 L120-137 (ruling received 2026-09-09: singleton confirmed as his rule; file ends L137 so 18 lines)
ANCHORTIER-1 L120: Q5. The 08.14 semantic items (BUILDER_FINDING_0814-MISS.md): the 2-of-3
ANCHORTIER-1 L121:     pre-confirmation kill vs your standard; CVD=❌ on a TAKEN trade.
ANCHORTIER-1 L122: Builder recommendation attached per .clinerules §3: Q1/Q2 as measured (they agreed
ANCHORTIER-1 L123: with you on 08.17/08.20); Q3 is where the 08.18 18:20 miss mechanism actually lives —
ANCHORTIER-1 L124: recommend deciding Q3 on its own merits, not by changing the rank order.
ANCHORTIER-1 L125: 
ANCHORTIER-1 L126: ## 10. RULING RECEIVED 2026-09-09 (in-session) — OPEN ITEM (a) CLOSED
ANCHORTIER-1 L127: The operator ruled: "Keep as mapped: the rank order AND the while-alive suppression both
ANCHORTIER-1 L128: stand - close open item (a) as 'the EA matches my rule' (the 08.18 18:20 short stays
ANCHORTIER-1 L129: suppressed)." THEREFORE: Q1 (the rank order FOMC > Yearly > Quarterly > Monthly > Weekly >
ANCHORTIER-1 L130: Daily, AVP-POC over VWAP, and the AVP = the *-POC-buffers mapping), Q2 (the same-bar tie,
ANCHORTIER-1 L131: most authoritative wins) and Q3 (the while-alive singleton — arrival order governs, a
ANCHORTIER-1 L132: stuck candidate holds it, no release) are all CONFIRMED AS THE OPERATOR'S RULE. The
ANCHORTIER-1 L133: 08.18 17:35-18:40 suppression instance is accepted behavior, not a defect. No source
ANCHORTIER-1 L134: change is required or authorized by this ruling. REMAINING OPEN: Q4 (the 08.18 M5 OHLC
ANCHORTIER-1 L135: dump authorization — BUILDER_FINDING_MIDLINE-1.md (b)) and Q5 (the 08.14 items —
ANCHORTIER-1 L136: BUILDER_FINDING_0814-MISS.md section 5).
ANCHORTIER-1 L137: 
### C3 USDJPY-MISSES L86-105 (Rulings-F: his session rebuke verbatim incl multi-session multi-setup + invalidation expectation)
USDJPY-MISSES L86: - Withdrawn: "refused post-confirm by FRESHCOUNT HOLD on fvgDead" (all instances v291-v298 + V298 CLEAR UJ3 leg + v299/v300 Q3). Actual evidenced refusal: S1 suppression (slot held, xobId 3070 per IDCHANGE row) + S1WAIT regime-unclassified retention. Polls QF/FN/CE prove predicates only, never promotion or death.
USDJPY-MISSES L87: - Next: S1-suppression diagnosis (slot-holder + votes=1 cause), then UJ3 re-scope; v300 HELD until then.
USDJPY-MISSES L88: 
USDJPY-MISSES L89: ### S1 diagnosis 2026-09-26 (ledger 834; segment + code, count-asserted)
USDJPY-MISSES L90: - Slot-holder: object 3070 (promoT 08:30, obStart 05:20, bullish, valid+activated; re-identified 10:45 inWin=1, then 14:35 as xobId 3091->3070 on the identical 160.489/160.504 zone) - the 14:35 Daily-POC LONG was read as the SAME morning zone; the singleton (SUPPRESSED/HELD, heldState=S1_REGIME) refuses the second claim. MECHANISM WITHDRAWN ledger 835 (contradicts his ONE-TAKE-PER-SESSION rule) - kept as audit of what was believed, never as live mechanism.
USDJPY-MISSES L91: - Regime rule (ClassifyRegime EA 2238-2267): HTF HIGH/MID/LOW buffers 19/20/21 vote, trendOk = 2+, sweepTag yields mrOk; BOTH/TREND/MEANREV/NONE. 14:35 scored votes=1 trendOk=0 sweepTag=0 mrOk=0 = NONE -> S1WAIT retained (print EA 8060, consumer 8059). SURVIVES as the evidenced refusal.
USDJPY-MISSES L92: - Record-first: no HTF-vote-count rule in his words (findings 2-of-3 = freshness kill, not regime) -> his two calls were owed in chat (superseded: he ruled instead - see Rulings-F).
USDJPY-MISSES L93: 
USDJPY-MISSES L94: ## Rulings-F 2026-09-26 (ledger 835; his words verbatim incl typos)
USDJPY-MISSES L95: - His 15m/1H short-bias rule: "this is why i mentioned the 15m HTF bias! i know that the trend following short bias only enabled and confirmed at 14:45 because that is when the 15m structure bias flip, combining with the bearish 1H that makes it valid for the trend following setup bias for short."
USDJPY-MISSES L96: - His session-rules rebuke: "you still conflicting this rule that shows either you didn't read the skill strategy or the strategy specification. this confusion and problem is not new and has been explained by me before. what is the 8:30 potential non executed setup doing here that is preventing the 14:40 entry? why has not been invalidated by the line POI break bias or the flip of the 5m structure bias. besides that, the london setup is irrelevant to prevent setup on the NY, the one position at a time does not apply multi session. meaning i can execute a setup on NY session while the london setup is still floating, even if it's conflicting bias direction wise. also why is the 8:30 setup even considered? the london session begins at 9:00 or at most 8:55 that could be executed at the 9:00 open candle?"
USDJPY-MISSES L97: - Builder record: ONE-TAKE-PER-SESSION pin (skill line 73 + spec L283/L291) answered the session question on record - record-first failure owned; London-9:00-start pinned NEW (not found on record); 08:30-survival (no POI-break/5m-flip invalidation, no session-boundary expiry) recorded as open diagnostic for council route.
USDJPY-MISSES L98: - Read-back (veto-able, no new ask): 14:40 long stands owed on the 14:35 flip; 14:45 15m-bearish + 1H-bearish enables the short trend bias after it.
USDJPY-MISSES L99: 
USDJPY-MISSES L100: ## Rulings-G 2026-09-26 (ledger 836; his words verbatim incl typos)
USDJPY-MISSES L101: - His terminology correction: "your're using the terms that i don't use and it's confusing me. what do you mean by the short term bias? do you mean the 5m structre bias?" Builder owned: "short-term/short-trend bias" were builder inventions - bias is ALWAYS timeframe-named (5m / 15m / 1H / 4H structure bias), never bare.
USDJPY-MISSES L102: - His 11 June sequencing: "if so then on 11 jun for the NY trend following setup, the 5m bias flip is at the same candle for the retest, and confirmation candle which is at 14:35 and the entry is at 14:40 open candle price. idk why are still considering the 14:45, DO NOT REPEAT THIS MISTAKE!" Builder owned: 14:35 = flip + retest + confirmation SAME candle, entry 14:40 open; 14:45 is post-entry, never selection evidence; my 14:45-bias read-back WITHDRAWN.
USDJPY-MISSES L103: - His HTF read: "for the HTF bias, 4H, 1H, and 15m are all bullish in my journal." Journal read-back: 15m Bull CONFIRMED on all four 6/11 rows (33-36); 4H reads Bear + 1H mixed on the same rows - FLAGGED against his "all bullish" (veto-able; no ask; his eyes govern intraday).
USDJPY-MISSES L104: - His London fundamental: "The london setup which starts at 9:00 is not a new rule. this is very fundamental rule that you might overlook, which is i only trade or take a setup on the london and NY session which has been defined on the SRJ Flow Logic sessions time section." Builder corrected: NOT new - fundamental, overlooked; sessions sourced to his indicator sessions-time section (Asia 20-00 / London 02-05 / NY 07-12 / PM 13:30-16 NY tz, broker +3; buffers 8-17 + PD 40-47; HTF engine include, 53 bias hits, zero flip hits; BiasEngine flip state wasBiasFlip + bull/bear alerts).
USDJPY-MISSES L105: - His short-bias text scoped (rendering, veto-able): 15m flip + 1H agreement enables trend bias IN THE FLIP DIRECTION generally; 11 June instance = bullish variant (long bias); date-ambiguity of the earlier text stated, not resolved by invention.
### C4 USDJPY-MISSES L92-111 (Rulings-G: his 11 June sequencing verbatim, 14:35 same-candle confirmation)
USDJPY-MISSES L92: - Record-first: no HTF-vote-count rule in his words (findings 2-of-3 = freshness kill, not regime) -> his two calls were owed in chat (superseded: he ruled instead - see Rulings-F).
USDJPY-MISSES L93: 
USDJPY-MISSES L94: ## Rulings-F 2026-09-26 (ledger 835; his words verbatim incl typos)
USDJPY-MISSES L95: - His 15m/1H short-bias rule: "this is why i mentioned the 15m HTF bias! i know that the trend following short bias only enabled and confirmed at 14:45 because that is when the 15m structure bias flip, combining with the bearish 1H that makes it valid for the trend following setup bias for short."
USDJPY-MISSES L96: - His session-rules rebuke: "you still conflicting this rule that shows either you didn't read the skill strategy or the strategy specification. this confusion and problem is not new and has been explained by me before. what is the 8:30 potential non executed setup doing here that is preventing the 14:40 entry? why has not been invalidated by the line POI break bias or the flip of the 5m structure bias. besides that, the london setup is irrelevant to prevent setup on the NY, the one position at a time does not apply multi session. meaning i can execute a setup on NY session while the london setup is still floating, even if it's conflicting bias direction wise. also why is the 8:30 setup even considered? the london session begins at 9:00 or at most 8:55 that could be executed at the 9:00 open candle?"
USDJPY-MISSES L97: - Builder record: ONE-TAKE-PER-SESSION pin (skill line 73 + spec L283/L291) answered the session question on record - record-first failure owned; London-9:00-start pinned NEW (not found on record); 08:30-survival (no POI-break/5m-flip invalidation, no session-boundary expiry) recorded as open diagnostic for council route.
USDJPY-MISSES L98: - Read-back (veto-able, no new ask): 14:40 long stands owed on the 14:35 flip; 14:45 15m-bearish + 1H-bearish enables the short trend bias after it.
USDJPY-MISSES L99: 
USDJPY-MISSES L100: ## Rulings-G 2026-09-26 (ledger 836; his words verbatim incl typos)
USDJPY-MISSES L101: - His terminology correction: "your're using the terms that i don't use and it's confusing me. what do you mean by the short term bias? do you mean the 5m structre bias?" Builder owned: "short-term/short-trend bias" were builder inventions - bias is ALWAYS timeframe-named (5m / 15m / 1H / 4H structure bias), never bare.
USDJPY-MISSES L102: - His 11 June sequencing: "if so then on 11 jun for the NY trend following setup, the 5m bias flip is at the same candle for the retest, and confirmation candle which is at 14:35 and the entry is at 14:40 open candle price. idk why are still considering the 14:45, DO NOT REPEAT THIS MISTAKE!" Builder owned: 14:35 = flip + retest + confirmation SAME candle, entry 14:40 open; 14:45 is post-entry, never selection evidence; my 14:45-bias read-back WITHDRAWN.
USDJPY-MISSES L103: - His HTF read: "for the HTF bias, 4H, 1H, and 15m are all bullish in my journal." Journal read-back: 15m Bull CONFIRMED on all four 6/11 rows (33-36); 4H reads Bear + 1H mixed on the same rows - FLAGGED against his "all bullish" (veto-able; no ask; his eyes govern intraday).
USDJPY-MISSES L104: - His London fundamental: "The london setup which starts at 9:00 is not a new rule. this is very fundamental rule that you might overlook, which is i only trade or take a setup on the london and NY session which has been defined on the SRJ Flow Logic sessions time section." Builder corrected: NOT new - fundamental, overlooked; sessions sourced to his indicator sessions-time section (Asia 20-00 / London 02-05 / NY 07-12 / PM 13:30-16 NY tz, broker +3; buffers 8-17 + PD 40-47; HTF engine include, 53 bias hits, zero flip hits; BiasEngine flip state wasBiasFlip + bull/bear alerts).
USDJPY-MISSES L105: - His short-bias text scoped (rendering, veto-able): 15m flip + 1H agreement enables trend bias IN THE FLIP DIRECTION generally; 11 June instance = bullish variant (long bias); date-ambiguity of the earlier text stated, not resolved by invention.
USDJPY-MISSES L106: 
USDJPY-MISSES L107: ## Rulings-H 2026-09-26 (ledger 840; his words verbatim incl typos)
USDJPY-MISSES L108: - His R reference: "entry open."
USDJPY-MISSES L109: - His entry-vs-manage rule: "i know you meant the revision target because on the exit off the NY.H it gives less than 1R. although i reject setups that are less than 1R, i still exit and literally exit on the nearest target which is on this example setup, although upon entry the setup is valid and executed, the new revised target makes the gain less than 1R. the difference is when the setup TP is first measured upon entry vs the dynamic revised tp target such as the newer session close H/L or gapped POC. This is not a new rule and has been documented. READ YOUR STARTEGY SKILL AND STRATEGY SPECIFICATION. DEFECT!"
USDJPY-MISSES L110: - His retarget object: "today's high is logically impossible becuase we flatten any position by the end of the session, so the scenario on 6/5 is the NY AM session high which closed at 19:00."
USDJPY-MISSES L111: - Builder record: EXITMODEL-1 Q6 already documents the exit-nearest rule ("even if less than 1R after the entry and revision") - record-first failure owned; R-ref + closed-session retarget are fresh rulings carried as stated.
### C5 USDJPY-MISSES L106-125 (Rulings-H L110 retarget + Rulings-J L119 entry-bar 160.524; file ends L125 so 20 lines to EOF)
USDJPY-MISSES L106: 
USDJPY-MISSES L107: ## Rulings-H 2026-09-26 (ledger 840; his words verbatim incl typos)
USDJPY-MISSES L108: - His R reference: "entry open."
USDJPY-MISSES L109: - His entry-vs-manage rule: "i know you meant the revision target because on the exit off the NY.H it gives less than 1R. although i reject setups that are less than 1R, i still exit and literally exit on the nearest target which is on this example setup, although upon entry the setup is valid and executed, the new revised target makes the gain less than 1R. the difference is when the setup TP is first measured upon entry vs the dynamic revised tp target such as the newer session close H/L or gapped POC. This is not a new rule and has been documented. READ YOUR STARTEGY SKILL AND STRATEGY SPECIFICATION. DEFECT!"
USDJPY-MISSES L110: - His retarget object: "today's high is logically impossible becuase we flatten any position by the end of the session, so the scenario on 6/5 is the NY AM session high which closed at 19:00."
USDJPY-MISSES L111: - Builder record: EXITMODEL-1 Q6 already documents the exit-nearest rule ("even if less than 1R after the entry and revision") - record-first failure owned; R-ref + closed-session retarget are fresh rulings carried as stated.
USDJPY-MISSES L112: 
USDJPY-MISSES L113: ## Rulings-I 2026-09-26 (ledger 843; his words verbatim incl typos)
USDJPY-MISSES L114: - His redirect: "you're asking code technical aspect outside of my capability and role, just as what you're recommended as the best way. why would'nt the EA won't open the indicator? i don't even know what s2 is."
USDJPY-MISSES L115: - Builder record: DEFECT OWNED - mechanism + surface scope put to him (ROLES-FIRST); DECIDED same turn (technical-shape, veto-able): second M15 handle PROCEEDS on his "why wouldn't it" (approval); buffer-map probe first (no new surface); S2-pre-bind re-scope WITHDRAWN as unnecessary (unified S1 passage covers UJ1 once sourced); UJ2 buffer-extraction-first with M5-walk fallback; S2-state jargon banned with him going forward.
USDJPY-MISSES L116: 
USDJPY-MISSES L117: ## Rulings-J 2026-09-27 (ledger 879; his words verbatim incl typos)
USDJPY-MISSES L118: - His 6/11 own-source booking rule: "the 6/11 NY setup entry POC is both from POC and VWAP. logically, it can't target it's own source of POI with also the nuance of POC is a higher hierarchy over VWAP on the gapped scenario."
USDJPY-MISSES L119: - His entry-bar correction: "I see the problem, with that entry price of 160.520, that is the opening candle price of 14:45 NOT 14:40 which should be 160.524. the confirmation and retest candle is at 14:35 and the entry is at the candle open of 14:40"
USDJPY-MISSES L120: - His recall order: "do not reinvestigate what has been searched or done before. also i have explained every missing trades on this test window. RECALL."
USDJPY-MISSES L121: - Builder record: DEFECTS OWNED, two - (1) bar-stamp: ref 160.520 attributed to 14:40 in the RECON71 result; WITHDRAWN (repeat of the owned +1-bar class; entry 14:40 open is 160.524 per TPCENSUS #76; 160.520 is the 14:45 open, post-entry, never evidence); (2) record-first: venues diagnosed without citing his filed Rulings-D/F/G and the STRUCTURAL-BIAS + VENUE-CORRECTION pins; WITHDRAWN, recall-join filed here instead of re-derivation.
USDJPY-MISSES L122: - Recall-join (his filed explanations, not reinvestigated): 6/5 09:45 15m-confirm thesis (Rulings-D + journal row 17 + STRUCTURAL-BIAS pin: 5m flips first, 15m confirms at the entry-candle open) - RECON71 rows show the S2 5m axis retaining while his 15m thesis stands unrepresented in promotion (fix item b); 6/11 14:40 owed on the 14:35 flip (Rulings-F) with 14:35/14:40 sequencing (Rulings-G + VENUE-CORRECTION pin); 6/5 16:05 five-line discard (NEAREST-ONLY-TP pin) + NY-high retarget rule (Rulings-H).
USDJPY-MISSES L123: - Corrected 6/11 mechanism: EA elected correctly at 14:35 (TPCENSUS #76: bar 14:35, ref 160.524 = his entry, winner YLOH 160.587, R 1.75 PASS, promoted past S2); killed at 14:40 on VWAP-2pts (TPCENSUS #77: winner Daily-VWAP 160.522, R 0.11 FAIL) which his ruling declares INVALID (own-source + POC-over-VWAP hierarchy) - wrong kill; the take should have survived booked YLOH. The ledger-878 VWAP-validity question is ANSWERED (NO) and WITHDRAWN, never re-asked.
USDJPY-MISSES L124: 
USDJPY-MISSES L125: (End of file)
### C6 SINGLE_VOTE_CONTEXT whole file L1-21 (arrival order governs; POIREPLACE abort REMOVED by his Q3)
SINGLE_VOTE L1: # FINDING ADDENDUM — SINGLE-VOTING-CALL CONTEXT LINES (on-disk, read-only)
SINGLE_VOTE L2: 
SINGLE_VOTE L3: **Question (Sonnet v64 check, open item (c)):** lines 7346/7457/7497 also call `DetectPoiRetest` — shown here with what follows each. Claim: none writes `g_dir`/`g_state` or feeds the seed write; single voting call = 7523.
SINGLE_VOTE L4: 
SINGLE_VOTE L5: ## 7346 — t78 POIREPLACE census (EA:7345–7366)
SINGLE_VOTE L6: 
SINGLE_VOTE L7: Local `t78_pr` + local `t78_dir`; compares vs held (`t78_opp`, `t78_tier`); prints `POIREPLACE` counterfactual line. The abort this branch once triggered is REMOVED (EA:7363: operator ruling Q3 quoted in full, `;` no-op — arrival order governs). No `g_dir` write. No `g_state` write. Branch falls through to close braces.
SINGLE_VOTE L8: 
SINGLE_VOTE L9: ## 7457 — t73 SUPPRESSED census (EA:7456–7481)
SINGLE_VOTE L10: 
SINGLE_VOTE L11: Local `t73_pr` + local `t73_dir`; static tally counters (`s_t73_n/higher/opp/both/bars`); prints `SUPPRESSED` + periodic `SUPPRESSED_PROGRESS`. No `g_dir` write. No `g_state` write.
SINGLE_VOTE L12: 
SINGLE_VOTE L13: ## 7497 — shadow confirm poll (EA:7496–7500)
SINGLE_VOTE L14: 
SINGLE_VOTE L15: Local `sh_pr` passed to `ShadowConfirmPoll` (header EA:7484: "LOG ONLY — reads buffers and prints; assigns no state"). No `g_dir` write. No `g_state` write.
SINGLE_VOTE L16: 
SINGLE_VOTE L17: ## Conclusion (measurement, EA `E68E0AE3…`)
SINGLE_VOTE L18: 
SINGLE_VOTE L19: Three non-voting calls, all read-local-struct + print/count, zero direction/state writes — shown, not asserted. The seed vote at EA:7523 (→ write EA:7529) stands as the single voting call. Sonnet's (c) is now answerable from these lines; its key policy is unchanged and respected (check only, never a key).
SINGLE_VOTE L20: 
SINGLE_VOTE L21: (End — measured 2026-09-15; rides the next relay)
### 3b(d) plain-words answers from the pasted lines only:
(i) how many setups may be armed at once: the old documents say ONE (C1-C2, C6: while-alive singleton, arrival order governs, stuck candidate holds it, no release). The relay B-5 operator answer given this turn says multiple may be armed. Both pasted; see 3b(e).
(ii) which one is executed: the old documents say the FIRST one (his verbatim: i will always execute the first one, the later higher POI does not get executed). The relay B-5 operator answer given this turn says the first VALIDATED one. Both pasted; see 3b(e).
(iii) whether entry needs price to touch the zone first: NOT FOUND in any pasted line (no quoted line of his states a touch prerequisite or its absence for entry).
(iv) which candle counts as the confirmation: the 14:35 candle (C4 verbatim: the 5m bias flip is at the same candle for the retest, and confirmation candle which is at 14:35 and the entry is at 14:40 open).
### 3b(e) disagreement, both lines, no pick:
OLD (filed 2026-09-09, C2): arrival order governs, a stuck candidate holds the singleton, no release; later retests discarded. NEW (operator answer relayed in B-5 this turn, unfiled): multiple setups can be armed, or potentially executed, at the same time, but only the one that is FIRST VALIDATED is taken. They differ on how many setups may be armed at once. Not picked here; carried for the planner.

| question | answer | which pasted line proves it |
|---|---|---|
| Q1. After S4_ARMED in the 14:40 pass, what code runs next same pass, and does any fire check run after arming (yes/no)? | After journal 22925 (code 9026) the pass ran the zone print (9029, journal 22926), HEADS-UP (9042, journal 22927), ZONEID, zone re-read, leg-scan LEGTOUCH found=0 with touchSeen staying 0 (journal 22929), then took the if-not-touchSeen branch and ended: NO fire check ran after arming in the same pass (no S5, fire, signal, entry or refusal rows in the 14:40:22 pass; all such keyword counts are zero there). Preventing structure: the if-else at 9216 (if not touchSeen) versus 9223 (else); the S4-to-S5 confirm edge at 9246 lives only in the else branch, and the S5 block at 9261 needs S5 state which was never set. | Step 2a journal 22925-22929 then 22930 next pass; blocks 3A lines 9216, 9223, 9246, 9261; step 2b keyword zeros in the pass. |
| Q2. EVERY condition the fire check needs before the entry alert, with code lines; which bar does the confirmation read? | From pasted lines: S4_ARMED state at 9122; touchSeen true to reach the edge (else the 9216 branch skips it); confirm predicate true at 9246 (terms A/A2/B/C per 9236-9244); S5 state at 9261; divergence walk from 9273 (divOk/divVal/divKind declared, rest below the pasted span); entry alert SIGNAL at 10622-10631. The R-latch and fire lines between 9276 and 10621 were outside the relay specified blocks and are not pasted here. The confirmation reads TWO bars: the just-closed evaluated bar (barShift: c0/o0/h1/l1 used at 2370-2374) and the bar before it (barShift+1: c1/o1 at 2342). | Blocks 3A lines 9122, 9216, 9223, 9246, 9261, 9273-9275; block 3D lines 2342, 2370-2374; block 3F lines 10622-10631. |
| Q3. Which exact condition produced STRUCT_FAIL 22965, what is term=A_OPP, and why bar 14:40 not 14:35? | The 9253-9257 else-branch (confirm false at 9246 on bar 14:40). term=A_OPP is code 2367: the prior candle was not opposite (LONG needs prior close below prior open; 14:35 printed o1=160.523 c1=160.526 in the 14:45 UJSBTELEM row, close above open, so the term failed). Bar 14:40 was evaluated because the fire check runs on barShift, the just-closed bar (14:40 at the 14:45 pass); the 14:35 confirm=1 (journal 22891) belonged to the 14:40 pass evaluation and was consumed there (one-bar validity per 9240-9242: failed terms consume, no carry-forward; a passed confirmation likewise does not carry). | Step 2a journal 22958 (confirm=0 on 14:40), 22965 (STRUCT_FAIL), 22891 (confirm=1 on 14:35); blocks 3A lines 9240-9246, 9253-9257; block 3D line 2367. |
| Q4. Which line armed without zone touch, and does the fire check require touchSeen true? | Arming line 9020 gates on zone bound plus in-play only ((haveFvg or haveXob) and s31_inPlay), with no touch requirement, then arms at 9026; journal 22925 proves the arm and 22929 (touchSeen=0, LEGTOUCH found=0) proves it armed untouched. YES in effect for reaching the edge: the confirm check at 9246 sits in the else branch of 9216, so with touchSeen false the pass diverts at 9216 and the edge is never evaluated (the 14:40 pass is the instance). | Blocks 3C lines 9020-9026; blocks 3A lines 9216, 9223, 9246; step 2a journal 22925, 22929. |
| Q5. The SINGLE condition (line) that first stopped the LONG from firing at the 14:40 open; both in order if two. | FIRST, same pass: the 9216 branch (touchSeen false after LEGTOUCH found=0), which kept the pass from ever evaluating the confirm edge, so no fire path could run for the 14:40 open. SECOND, next pass: the 9246 confirm predicate failing with A_OPP on bar 14:40 (journal 22965). In order: 9216 then 9246. No change proposed. | Blocks 3A lines 9216, 9246; step 2a journal 22929 then 22965. |
| Q6. Could entry have passed at the 14:40 pass if the fire check had run there? | CANNOT TELL from rows. Seen: CONFIRMPOLL LONG confirm=1 (journal 22891) and HEADS-UP (journal 22927). Missing: UJ1R, ZONESHADOW, TPCENSUS, UJALIGN, FIRE, SIGNAL, ENTRY and S5 rows all score zero in the 14:40:22 pass, so no reward/risk, alignment, divergence or fire gate values exist to judge. | Step 2b keyword zeros in the pass (UJ1R 0, ZONESHADOW 0, TPCENSUS 0, UJALIGN 0, FIRE 0, SIGNAL 0, ENTRY 0, S5 0); step 2a journal 22891, 22927. |
| Q7. How many setups can the EA hold at once, holder variables, second setup alive, contender handling? | ONE. Holder = g_state (declared 1062), g_dir (1063), g_anchorLine (1066): a single slot, no arrays, no second set. Second armed setup alive at the same time: NO. Singleton comment 7500-7502 (a longer-lived holder holds the singleton and suppresses retests). Contender handling: SUPPRESSED census is record-only (guarantee 7826-7829, scope 8010-8012, assigns nothing); UJSBTELEM eval plus YIELD at 8443-8446 REPLACES the holder (never coexists); transfer gate 7904 with no-preempt 7841 on equal tier keeps the first arrival. | Steps 3E decl block lines 1062-1066; step 3G lines 7500-7502, 7826-7829, 8010-8012, 8443-8446, 7841, 7904. |
| Q8. Any code implementing first-validated-wins; or arrival-order instead? | First-validated-wins: NOT FOUND (mechanical census: first validated, first-validated, first to be validated, FIRST_VALIDATED all score zero in the 12298-line EA). Arrival-order instead: YES, per 7500-7502 comment (arrival order implied by singleton hold plus suppression) and the POIREPLACE abort REMOVED by his Q3 ruling (comment 7855, arrival order governs, with the SINGLE_VOTE finding pasted in 3b C6). | Step 3G lines 7500-7502, 7852-7858; census zeros from step 3 prep; step 3b C6. |
| Q9. EA vs documented explanation per point? | Number armed: DISAGREES as worded (EA singleton per 7500-7502 and Q7 decl lines with old docs agreeing singleton per 3b C1-C2, against the new B-5 answer that multiple may be armed). Which executes: DISAGREES as worded (EA keeps first arrival per 7904 plus 7855 with old docs first-arrival per 3b C1-C2, against the new B-5 answer first-validated). Zone touch: NOT FOUND on the documented side (no pasted operator line states it either way; code side for context only: 9216 reaches the confirm edge only when touchSeen is true, so no agreement grade is gradeable). Confirmation candle: AGREES (code evaluates the just-closed bar per Q2 with 14:35 carrying confirm=1 in journal 22891; old docs 14:35 same-candle per 3b C4; relay premise itself names 14:35). | Steps 3G, 3E, 3D, 3b C1-C4, step 2a journal 22891. |

No fix proposed. No placement chosen. Measurement only.
