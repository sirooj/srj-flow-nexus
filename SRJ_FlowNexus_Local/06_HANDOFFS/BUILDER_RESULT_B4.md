# BUILDER RESULT B-4 - one edit, one compile, one run, graded REVERT (measurement record; no fix proposed beyond the reverted edit)

## Step 1 raw (measured 2026-10-04, terminal disk, branch builder/B-3; git pull NOT needed per relay)
- git log -1: b1535fd B-3 history + code measurement: deferral origin + GoAbort + two-of-three (relay B-3 revised, planner side)
- git status --short line count: 26 (25 pre-existing modified/deleted + 1 held-out compile log). No other change at gate time.
- EA SHA-256 Experts/SRJ_FlowNexus_EA.mq5: E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC (MATCHES required; gate passed, edit authorized by operator paste of relay B-4 for ONE local EA edit only, NOT a commit/push word)

## Step 2 safety copy (Experts/SRJ_FlowNexus_EA.mq5.preB4, never committed)
- Copy-Item literal EA to EA.mq5.preB4: done, no error.
- preB4 SHA-256: E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC (identical to EA pre-edit).

## Step 3 pre-check: array indexing by g_anchorLine in EA lines 7459-8072 (relay patterns [g_anchorLine] + g_anchorLine])
EALINES=12298
HITS_N=8 LINES=7822,7833,7838,7851,7854,7880,8029,8040
--- HIT 7822 (8 before) ---
7814:    if(g_state > ST_IDLE && g_state != ST_ABORT && g_anchorLine >= 0 && inWindow)
7815:      {
7816:       PoiRetestResult t78_pr;
7817:       if(DetectPoiRetest(barShift, t78_pr) && t78_pr.found)
7818:         {
7819:           ENUM_SRJ_DIR t78_dir = t78_pr.isLong ? DIR_LONG : DIR_SHORT;
7820:           bool t78_opp  = (t78_dir != g_dir);
7821:           bool t78_tier = ((g_authorityRank[t78_pr.topLine] / 2) <
7822:                            (g_authorityRank[g_anchorLine]   / 2));
--- HIT 7833 (8 before) ---
7825:           //--- no N1 touch — detection ran once). Record-only: locals + print only.
7826:           //--- FORBIDDEN in this shadow and ABSENT below: g_state / g_anchorLine /
7827:           //--- g_dir / anchor price-time / zone-touch-latch / GoAbort /
7828:           //--- ResetSequence / order-stop-eligibility-session writes
7829:           //--- (documented guarantee, grade-verified).
7830:           if(InpDebugLog && t78_opp)
7831:             {
7832:              int s1h_newTier  = g_authorityRank[t78_pr.topLine] / 2;
7833:              int s1h_heldTier = g_authorityRank[g_anchorLine]   / 2;
--- HIT 7838 (8 before) ---
7830:           if(InpDebugLog && t78_opp)
7831:             {
7832:              int s1h_newTier  = g_authorityRank[t78_pr.topLine] / 2;
7833:              int s1h_heldTier = g_authorityRank[g_anchorLine]   / 2;
7834:              PrintFormat("[SRJ-EA] SIDE1H_WOULDPREEMPT bar=%s newPoi=%s newDir=%s heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d wouldPreempt=%d wouldTierPassLegacy=%d",
7835:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7836:                                       TIME_DATE|TIME_MINUTES),
7837:                          g_lineCode[t78_pr.topLine], DirName(t78_dir),
7838:                          g_lineCode[g_anchorLine], DirName(g_dir),
--- HIT 7851 (8 before) ---
7843:             }
7844:           if(t78_opp && t78_tier)
7845:            {
7846:             PrintFormat("[SRJ-EA] POIREPLACE bar=%s newPoi=%s newDir=%s "
7847:                         "heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d",
7848:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7849:                                      TIME_DATE|TIME_MINUTES),
7850:                         g_lineCode[t78_pr.topLine], DirName(t78_dir),
7851:                         g_lineCode[g_anchorLine], DirName(g_dir),
--- HIT 7854 (8 before) ---
7846:             PrintFormat("[SRJ-EA] POIREPLACE bar=%s newPoi=%s newDir=%s "
7847:                         "heldPoi=%s heldDir=%s heldState=%s newTier=%d heldTier=%d",
7848:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
7849:                                      TIME_DATE|TIME_MINUTES),
7850:                         g_lineCode[t78_pr.topLine], DirName(t78_dir),
7851:                         g_lineCode[g_anchorLine], DirName(g_dir),
7852:                         StateName(g_state),
7853:                         g_authorityRank[t78_pr.topLine] / 2,
7854:                         g_authorityRank[g_anchorLine]   / 2);
--- HIT 7880 (8 before) ---
7872:             {
7873:              string t78_failOp = "", t78_failHeld = "";
7874:              t78_opConf = IsConfirmationCandle(barShift, t78_pr.topLine, t78_dir, t78_failOp);
7875:              t78_heldConf = IsConfirmationCandle(barShift, g_anchorLine, g_dir, t78_failHeld);
7876:              if(InpDebugLog) PrintFormat("[SRJ-EA] UJOPCONF bar=%s poi=%s dir=%s opConf=%d heldConf=%d opTerm=%s heldTerm=%s - displace-gate inputs (Fix H1)", TimeToString(iTime(_Symbol, PERIOD_CURREN
7877:               if(!t78_opConf && !t78_heldConf && !SessionAlreadyUsed(sess, barTime) && (t78_pr.topLine != g_anchorLine || t78_dir != g_dir))
7878:                 {
7879:                  bool t78_al = false; bool t78_alOk = CheckLtfAlign(barShift, t78_dir, t78_al);
7880:                  if(InpDebugLog) PrintFormat("[SRJ-EA] UJRESEED bar=%s poi=%s dir=%s fromPoi=%s fromDir=%s al=%d ok=%d - op-retest reseeded over unconfirmed holder (Fix H1)", TimeToString(iTime(_Symbo
--- HIT 8029 (8 before) ---
8021:       s_t73_bars++;
8022:       PoiRetestResult t73_pr;
8023:       if(DetectPoiRetest(barShift, t73_pr) && t73_pr.found)
8024:         {
8025:          s_t73_n++;
8026:          ENUM_SRJ_DIR t73_dir    = t73_pr.isLong ? DIR_LONG : DIR_SHORT;
8027:          bool         t73_isOpp  = (t73_dir != g_dir);
8028:          bool         t73_isHigh = (g_authorityRank[t73_pr.topLine] <
8029:                                     g_authorityRank[g_anchorLine]);
--- HIT 8040 (8 before) ---
8032:          if(t73_isOpp && t73_isHigh)  s_t73_both++;
8033:          PrintFormat("[SRJ-EA] SUPPRESSED bar=%s poi=%s dir=%s opp=%d higher=%d "
8034:                      "heldPoi=%s heldDir=%s heldState=%s "
8035:                      "cum_n=%d cum_opp=%d cum_hi=%d cum_both=%d action=%s",
8036:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8037:                                   TIME_DATE|TIME_MINUTES),
8038:                      g_lineCode[t73_pr.topLine], DirName(t73_dir),
8039:                      (int)t73_isOpp, (int)t73_isHigh,
8040:                      g_lineCode[g_anchorLine], DirName(g_dir), StateName(g_state),
Supplementary census (same range): 25 lines mention g_anchorLine; arithmetic-adjacent (name followed by operator): 1, a comment at 7826; bracketed-index uses: exactly the same 8 lines above; no g_anchorLine-plus/minus indexing anywhere.
Guard sentence per hit: 7822 is inside the 7814 guard (state above IDLE and not ABORT and anchor non-negative and in-window); 7833, 7838, 7851, 7854 are inside the same 7814 guard via the nested 7817/7830/7844 blocks; 7875 and 7880 sit in the 7872 block inside the same 7814 guard (they reuse the 7820 direction test, which only exists inside that guard); 8029 and 8040 are inside the 8013-8014 census guard (state above IDLE and not ABORT and anchor non-negative).
Verdict: NO hit is reachable with state IDLE (anchor -1); all 8 are skipped after the abort. Pre-check PASSED, edit proceeded, no SWITCH TO OPUS.

## Step 4 the ONE edit (byte-exact python splice, CRLF preserved, 12298 lines before and after)
Deleted line 7454 exactly: `uj_saAbort = true; uj_saA = g_anchorLine; uj_saD = (int)g_dir; uj_saT = g_anchorBarTime;` (13-space indent, asserted byte-equal before removal).
Kept line 7455 (UJDEFERABORT PrintFormat) verbatim. Inserted directly after it with the same 13-space indent: `GoAbort(ABORT_LTF_MISALIGN, g_state);  //--- [B-4] operator rule 1: the flip invalidates the armed setup at once; no return, so the pass goes on to the seed block`.
Raw diff -u preB4 vs EA (exactly one removed, one added):
diff --git a/Experts/SRJ_FlowNexus_EA.mq5.preB4 b/Experts/SRJ_FlowNexus_EA.mq5
@@ -7451,8 +7451,8 @@ void EvaluateClosedBar(int barShift, datetime barTime)
              { if(InpDebugLog) PrintFormat("[SRJ-EA] UJLTFHOLD bar=%s dir=%s poi=%s state=%s m15=%s rf=%d mode=%s term=%s - LTF opposed, hold (Fix F11)", <args unchanged>); }
            else
              {
-             uj_saAbort = true; uj_saA = g_anchorLine; uj_saD = (int)g_dir; uj_saT = g_anchorBarTime;
              if(InpDebugLog) PrintFormat("[SRJ-EA] UJDEFERABORT bar=%s dir=%s poi=%s state=%s - LTF opposed, abort deferred past evaluation (Fix S-a)", <args unchanged>);
+             GoAbort(ABORT_LTF_MISALIGN, g_state);  //--- [B-4] operator rule 1: the flip invalidates the armed setup at once; no return, so the pass goes on to the seed block
              }
(UJLTFHOLD/PrintFormat argument lists elided here as <args unchanged>; the tool diff showed them whole and identical on both sides.)

## Step 5 compile (metaeditor64 /compile + /log, log SRJ_FlowNexus_Local/06_HANDOFFS/B4_EACOMPILE.log, 7852 bytes, UTF-16LE, 48 lines, written this turn)
- Raw result line: Result: 0 errors, 0 warnings, 6952 ms elapsed, cpu=X64 Regular
- CLI EXIT variable printed empty (known MetaEditor quirk, also seen on the V26 build); the log line above is the result. First try, no typo fix needed.
- Post-edit EA hash 6818C8F82F0E9698E26D2E50AF27272B1DD80FFD380430636B9A9571C7D41249; rebuilt EX5 hash 275ADA7FC5206828DE6DCA58315D32DFCDB692C819632BB2F7C7B72417E0EA01, 452294 bytes, written 02:18:56, before the 02:22:25 launch.

## Step 6 the ONE run (RECON78-B4; ini USDJPY_DEMO_JUNE.ini: USDJPY M5 Model 4 InpDebugLog=true InpMode=1 2026.06.01 to 2026.06.13)
- Slot free at launch (no terminal64, no metatester64); config terminal.ini Tester DateFrom=1780272000 DateTo=1781308800 already the June window with no terminal running, so no edit; WMI launch RC=0 PID 18388 instant; wrapper STATUS RUNNING PID 17584, ini exists, terminal free.
- Window proof from the run journal (day log line 15): Tester USDJPY,M5 testing of Experts/SRJ_FlowNexus_EA.ex5 from 2026.06.01 00:00 to 2026.06.13 00:00. Core line 42 repeats it with inputs (InpMode=1, InpDebugLog on per ini).
- Journal saved as SRJ_FlowNexus_Local/06_HANDOFFS/RECON78-B4_JOURNAL.log: 7165910 bytes, 37030 lines (whole day log, PRE_JOURNAL_LINES=0, equals wrapper ARCHIVED_LINES=37030). Day log is UTF-16LE; filed journal is UTF-8 like the V26 journal.
- DONE RESULT=PASSED at 03:08:12; Test passed in 0:45:15.372; 542258 ticks, 2880 bars; final balance 10229.50.

## Step 7 pass table (new journal RECON78-B4_JOURNAL.log, 37030 lines; old journal RECON78-V26-UJ_JOURNAL.log, 36760 lines)
### 7.0 new-journal rows 2026.06.11 14:30 to 14:55 by pass-time, every row (236 rows, spliced mechanically)
22798 :: CK	0	03:01:42.317	Core 04	2026.06.11 14:30:00   Alert: USDJPY M5 - POI RETEST LONG at 160.522  [D-VWAP]
22799 :: DO	0	03:01:42.317	Core 04	2026.06.11 14:30:00   Alert: USDJPY M5 - POI RETEST SHORT at 160.525  [D-POC]
22800 :: JO	0	03:01:42.317	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
22801 :: KI	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:25 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=107048 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=32 ticktime=2026.06.11 14:30:00 lag=chartTime-1bar
22802 :: JS	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJM15ROW bar_key=2026.06.11 14:25 m15time=2026.06.11 14:30 m15vote=1.0
22803 :: RQ	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SWEPTMASK bar=2026.06.11 14:25 raw=3429125.0 m=3429125 swept=1010000011 live=0010
22804 :: OM	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:25 line=Daily-POC anchor=Daily-POC
22805 :: EP	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:25 line=Daily-VWAP anchor=Daily-POC
22806 :: EO	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:25 line=Daily-POC anchor=Daily-POC
22807 :: KR	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:25 line=Daily-VWAP anchor=Daily-POC
22808 :: GR	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] TPCENSUS #210 bar=2026.06.11 14:25 dir=SHORT ref=160.525 winner=YLOL best=160.493 distPts=32 empties=8 admitted= PDL:289 ASL:100 LOL:32 NYL:17 PML:73 YASL:100 YLOL:32 YNYL:202 YPML:73 LIVE:1470 LIVE:1722 PD:1470 PD:1722 LIVE:1544 LIVE:1737 LIVE:1782 LIVE:2167 PD:1782 PD:2167 LIVE:1742 LIVE:1860 PD:1742 PD:1860 LIVE:1497 LIVE:1668 LIVE:1381 LIVE:1523 LIVE:1567 LIVE:1914 LIVE:1444 LIVE:1717 LIVE:1424 LIVE:1687 LIVE:1424 LIVE:1654 LIVE:1274 LIVE:1875 LIVE:1437 LIVE:1745 LIVE:154
22809 :: FN	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SLEXT481 fields=17 bar=2026.06.11 14:25 site=S2POLL dir=SHORT ladOriginPx=160.524 ladOriginBarTime=2026.06.11 14:25 ladOriginSite=S2POLL ext1Defined=1 slExt1=160.552 ext1Slot=13 ext1BarTime=2026.06.11 13:20 ext1Imb=0 deepestExt=3 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
22810 :: CO	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SWINGPICK site=S2POLL dir=SHORT barShift=1 close=160.524 haveHigh=1 SH=160.534 atShift=4 haveLow=1 SL=160.508 atShift=5
22811 :: OL	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SLSRC site=S2POLL dir=SHORT src=OB_SWING obStruct=160.572 obSwing=160.572 nearest=160.534 chosen=160.572 deltaPts=0
22812 :: QE	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=160.572 distPts=48 site=S2POLL zoneLo=160.545 zoneHi=160.572
22813 :: RR	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SLIMB fields=19 bar=2026.06.11 14:25 site=S2POLL dir=SHORT branch=1SWING obValid=1 slRef=160.572 slShift=54 slShiftT=2026.06.11 09:55 latestFlag=0 latestShift=4 latestShiftT=2026.06.11 14:05 latestAvail=1 latestApexMatch=1 chosenFlag=0 chosenShift=54 chosenShiftT=2026.06.11 09:55 chosenAvail=1 nuanceClass=OB_VALID_LATEST_NOIMB cands=-
22814 :: DS	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SLIMBWALK fields=27 bar=2026.06.11 14:25 site=S2POLL dir=SHORT branch=1SWING slToday=160.572 slBase=160.587 slNuance=160.587 deltaBasePts=15 deltaNuancePts=15 walkSteps=1 code2Seen=0 exhausted=0 skipShift=-1 skipVal=- skipFlag=- bodyExt=- extUpdatedByNonQual=0 code3Seen=0 sideViolations=0 todayEqBase=0 todayEqNuance=0 baseEqNuance=1 class=BASE_MOVED outwardBasePts=15 outwardNuancePts=15 skipShiftT=- startShiftT=2026.06.11 09:55
22815 :: LE	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:25 site=S2POLL dir=SHORT branch=1SWING fracAnchorShift=4 fracAnchorFlag=0 slFractal=160.587 slFractalNuance=160.587 deltaFracPts=15 deltaFracNuancePts=15 fracSteps=13 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=2 fracClass=BASE_MOVED sideFracViolations=0 outwardFracPts=15 outwardFracNuancePts=15 fracAnchorRawShift=4 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:05 fracSkip=13 fracSkipT=2026.06.11 13:20
22816 :: EM	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SEL61SRC site=S2POLL bar=2026.06.11 14:25 branch=SLREF_1SWING def=1 value=160.572 mode=1 scope=IN_SCOPE_RULE aux=-
22817 :: DD	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] A6TERM class=SELECTED bar=2026.06.11 14:25 shift=1 site=S2POLL dir=SHORT mode=1SWING px=160.572 ok=1 slot=54
22818 :: HI	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SEL52CTX seq=295 bar=2026.06.11 14:25 site=S2POLL dir=SHORT oPx=160.524 oBT=2026.06.11 14:25 slRef=160.572 mode=1 halt=-
22819 :: RQ	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SLMEMO bar=2026.06.11 14:25 site=S2POLL result=COMPUTE ok=1 slRef=160.572 mode=1 computes=232 hits=60 genID=232 wrSite=S2POLL wrOrigin=evalClose
22820 :: DH	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJ1R bar=2026.06.11 14:25 src=POLL entry=160.525 sl=160.572 tp=160.493 risk=0.047 reward=0.032 R=0.68 verdict=FAIL
22821 :: FR	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJPOLLRISK bar=2026.06.11 14:25 dir=SHORT R=0.68 - poll-ref verdict telemetry only, admission verdict at fire (Fix H1)
22822 :: FE	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] ZONESHADOW bar=2026.06.11 14:25 dir=SHORT close=160.525 zoneLo=160.545 zoneHi=160.572 gapPts=20 slRef=160.572 tp=160.493 R_close=0.68 tpInGap=0 shadow= near=1.93/sl1/tp1 mid=4.85/sl1/tp1 far=inf/sl0/tp1 
22823 :: CK	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] 2026.06.11 14:30:00 S2POLL_RR_SHORTFALL tpDist=0.03200 slDist=0.04700 R=0.68
22824 :: RI	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:25 bl=0 br=10 sl=0 sr=10 sel=LONG sline=0 scode=Daily-POC lcode=Daily-POC
22825 :: MI	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:25 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
22826 :: HG	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:25 bl=0 br=10 sl=0 sr=10 sel=LONG sline=0 scode=Daily-POC lcode=Daily-POC
22827 :: KR	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:25 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=76 cum_opp=13 cum_hi=7 cum_both=3 action=HELD
22828 :: PK	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:25 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
22829 :: OK	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJDTTERMS bar=2026.06.11 14:25 Daily-POC=LHIT/SHIT Daily-VWAP=LHIT/Sbody-above Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
22830 :: HD	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] RETESTDIAG bar=2026.06.11 14:25 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:234.6pts
22831 :: OD	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:25 anchor=Daily-POC dir=SHORT oppCandle=1 bodyDir=1 body=1pts doji=0 touchAttr=1 confirm=1 shadow=true
22832 :: FM	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:25 bl=0 br=10 sl=0 sr=10 sel=LONG sline=0 scode=Daily-POC lcode=Daily-POC
22833 :: PJ	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJSBTELEM bar=2026.06.11 14:25 dir=SHORT have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=160.525 o1=160.525 c1=160.526 c0=160.524 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
22834 :: RH	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] ZONEID bar=2026.06.11 14:25 site=S4RQZ xobId=3091 fvgId=0
22835 :: IH	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] LEGTOUCH bar=2026.06.11 14:25 dir=SHORT found=1 atShift=2 atBar=2026.06.11 14:20 legBound=2026.06.11 14:00 zoneLo=160.545 zoneHi=160.572 touchSeen=1
22836 :: QQ	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:25 dir=SHORT m15=1.0 uj_readFail=0
22837 :: PN	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
22838 :: JH	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:30 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=107049 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=32 ticktime=2026.06.11 14:35:10 lag=chartTime-1bar
22839 :: FS	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SWEPTMASK bar=2026.06.11 14:30 raw=3429125.0 m=3429125 swept=1010000011 live=0010
22840 :: CR	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:30 line=Daily-POC anchor=Daily-POC
22841 :: QQ	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:30 line=Daily-VWAP anchor=Daily-POC
22842 :: IL	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:30 line=Daily-POC anchor=Daily-POC
22843 :: GP	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:30 line=Daily-VWAP anchor=Daily-POC
22844 :: NR	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] TPCENSUS #211 bar=2026.06.11 14:30 dir=SHORT ref=160.523 winner=YLOL best=160.493 distPts=30 empties=8 admitted= PDL:287 ASL:98 LOL:30 NYL:16 PML:71 YASL:98 YLOL:30 YNYL:200 YPML:71 LIVE:1468 LIVE:1720 PD:1468 PD:1720 LIVE:1542 LIVE:1735 LIVE:1780 LIVE:2165 PD:1780 PD:2165 LIVE:1740 LIVE:1858 PD:1740 PD:1858 LIVE:1495 LIVE:1666 LIVE:1379 LIVE:1521 LIVE:1565 LIVE:1912 LIVE:1442 LIVE:1715 LIVE:1422 LIVE:1685 LIVE:1422 LIVE:1652 LIVE:1272 LIVE:1873 LIVE:1435 LIVE:1743 LIVE:1539 
22845 :: MQ	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SLEXT481 fields=17 bar=2026.06.11 14:30 site=S2POLL dir=SHORT ladOriginPx=160.522 ladOriginBarTime=2026.06.11 14:30 ladOriginSite=S2POLL ext1Defined=1 slExt1=160.552 ext1Slot=14 ext1BarTime=2026.06.11 13:20 ext1Imb=0 deepestExt=3 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
22846 :: GL	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SWINGPICK site=S2POLL dir=SHORT barShift=1 close=160.522 haveHigh=1 SH=160.534 atShift=5 haveLow=1 SL=160.508 atShift=6
22847 :: GK	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SLSRC site=S2POLL dir=SHORT src=OB_SWING obStruct=160.572 obSwing=160.572 nearest=160.534 chosen=160.572 deltaPts=0
22848 :: JF	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=160.572 distPts=50 site=S2POLL zoneLo=160.545 zoneHi=160.572
22849 :: EP	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SLIMB fields=19 bar=2026.06.11 14:30 site=S2POLL dir=SHORT branch=1SWING obValid=1 slRef=160.572 slShift=55 slShiftT=2026.06.11 09:55 latestFlag=0 latestShift=5 latestShiftT=2026.06.11 14:05 latestAvail=1 latestApexMatch=1 chosenFlag=0 chosenShift=55 chosenShiftT=2026.06.11 09:55 chosenAvail=1 nuanceClass=OB_VALID_LATEST_NOIMB cands=-
22850 :: HR	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SLIMBWALK fields=27 bar=2026.06.11 14:30 site=S2POLL dir=SHORT branch=1SWING slToday=160.572 slBase=160.587 slNuance=160.587 deltaBasePts=15 deltaNuancePts=15 walkSteps=1 code2Seen=0 exhausted=0 skipShift=-1 skipVal=- skipFlag=- bodyExt=- extUpdatedByNonQual=0 code3Seen=0 sideViolations=0 todayEqBase=0 todayEqNuance=0 baseEqNuance=1 class=BASE_MOVED outwardBasePts=15 outwardNuancePts=15 skipShiftT=- startShiftT=2026.06.11 09:55
22851 :: ER	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:30 site=S2POLL dir=SHORT branch=1SWING fracAnchorShift=5 fracAnchorFlag=0 slFractal=160.587 slFractalNuance=160.587 deltaFracPts=15 deltaFracNuancePts=15 fracSteps=13 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=2 fracClass=BASE_MOVED sideFracViolations=0 outwardFracPts=15 outwardFracNuancePts=15 fracAnchorRawShift=5 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:05 fracSkip=14 fracSkipT=2026.06.11 13:20
22852 :: QS	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SEL61SRC site=S2POLL bar=2026.06.11 14:30 branch=SLREF_1SWING def=1 value=160.572 mode=1 scope=IN_SCOPE_RULE aux=-
22853 :: OE	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] A6TERM class=SELECTED bar=2026.06.11 14:30 shift=1 site=S2POLL dir=SHORT mode=1SWING px=160.572 ok=1 slot=55
22854 :: KJ	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SEL52CTX seq=296 bar=2026.06.11 14:30 site=S2POLL dir=SHORT oPx=160.522 oBT=2026.06.11 14:30 slRef=160.572 mode=1 halt=-
22855 :: NN	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SLMEMO bar=2026.06.11 14:30 site=S2POLL result=COMPUTE ok=1 slRef=160.572 mode=1 computes=233 hits=60 genID=233 wrSite=S2POLL wrOrigin=evalClose
22856 :: IK	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] UJ1R bar=2026.06.11 14:30 src=POLL entry=160.523 sl=160.572 tp=160.493 risk=0.049 reward=0.030 R=0.61 verdict=FAIL
22857 :: QS	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] UJPOLLRISK bar=2026.06.11 14:30 dir=SHORT R=0.61 - poll-ref verdict telemetry only, admission verdict at fire (Fix H1)
22858 :: EG	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] ZONESHADOW bar=2026.06.11 14:30 dir=SHORT close=160.523 zoneLo=160.545 zoneHi=160.572 gapPts=22 slRef=160.572 tp=160.493 R_close=0.61 tpInGap=0 shadow= near=1.93/sl1/tp1 mid=4.85/sl1/tp1 far=inf/sl0/tp1 
22859 :: DH	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] 2026.06.11 14:35:10 S2POLL_RR_SHORTFALL tpDist=0.03000 slDist=0.04900 R=0.61
22860 :: DJ	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:30 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
22861 :: CN	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:30 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
22862 :: LG	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:30 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
22863 :: IP	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:30 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=77 cum_opp=14 cum_hi=7 cum_both=3 action=HELD
22864 :: HJ	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:30 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
22865 :: FL	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] UJDTTERMS bar=2026.06.11 14:30 Daily-POC=LHIT/Sbody-above Daily-VWAP=LHIT/Sbody-above Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
22866 :: CJ	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] RETESTDIAG bar=2026.06.11 14:30 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:221.1pts
22867 :: CS	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:30 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=1 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
22868 :: NH	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:30 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
22869 :: CK	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] UJSBTELEM bar=2026.06.11 14:30 dir=SHORT have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=160.523 o1=160.525 c1=160.524 c0=160.522 arm=1 termC=B_BODY termH=A_OPP - contender evaluation (Fix S3)
22870 :: JF	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] ZONEID bar=2026.06.11 14:30 site=S4RQZ xobId=3091 fvgId=0
22871 :: RI	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] LEGTOUCH bar=2026.06.11 14:30 dir=SHORT found=1 atShift=3 atBar=2026.06.11 14:20 legBound=2026.06.11 14:00 zoneLo=160.545 zoneHi=160.572 touchSeen=1
22872 :: IP	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:30 dir=SHORT m15=1.0 uj_readFail=0
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
22967 :: LR	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
22968 :: MI	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:45 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular readFail=0 empty=107052 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=32 ticktime=2026.06.11 14:50:00 lag=chartTime-1bar
22969 :: JL	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] FRESHCOUNT #143 bar=2026.06.11 14:45 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=47 cum2=14 cum3=0
22970 :: RF	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SWEPTMASK bar=2026.06.11 14:45 raw=3429125.0 m=3429125 swept=1010000011 live=0010
22971 :: ON	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:45 line=Daily-POC anchor=Daily-POC
22972 :: EE	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:45 line=Daily-VWAP anchor=Daily-POC
22973 :: EH	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:45 line=Daily-POC anchor=Daily-POC
22974 :: KG	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:45 line=Daily-VWAP anchor=Daily-POC
22975 :: NH	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] TPCENSUS #213 bar=2026.06.11 14:45 dir=LONG ref=160.520 winner=YLOH best=160.587 distPts=67 empties=8 admitted= PDH:51 ASH:28 LOH:67 NYH:14 PMH:20 YASH:28 YLOH:67 YNYH:9 YPMH:20 
22976 :: KI	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SLEXT481 fields=17 bar=2026.06.11 14:45 site=S2POLL dir=LONG ladOriginPx=160.519 ladOriginBarTime=2026.06.11 14:45 ladOriginSite=S2POLL ext1Defined=1 slExt1=160.501 ext1Slot=42 ext1BarTime=2026.06.11 11:15 ext1Imb=0 deepestExt=31 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
22977 :: DK	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SWINGPICK site=S2POLL dir=LONG barShift=1 close=160.519 haveHigh=1 SH=160.534 atShift=8 haveLow=1 SL=160.507 atShift=3
22978 :: LH	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SLSRC site=S2POLL dir=LONG src=OB_SWING obStruct=160.498 obSwing=160.498 nearest=160.507 chosen=160.498 deltaPts=0
22979 :: EL	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=160.498 distPts=21 site=S2POLL zoneLo=160.489 zoneHi=160.504
22980 :: FP	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SLIMB fields=19 bar=2026.06.11 14:45 site=S2POLL dir=LONG branch=1SWING obValid=1 slRef=160.498 slShift=44 slShiftT=2026.06.11 11:05 latestFlag=0 latestShift=3 latestShiftT=2026.06.11 14:30 latestAvail=1 latestApexMatch=1 chosenFlag=0 chosenShift=44 chosenShiftT=2026.06.11 11:05 chosenAvail=1 nuanceClass=OB_VALID_LATEST_NOIMB cands=-
22981 :: KJ	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SLIMBWALK fields=27 bar=2026.06.11 14:45 site=S2POLL dir=LONG branch=1SWING slToday=160.498 slBase=160.425 slNuance=160.498 deltaBasePts=-73 deltaNuancePts=0 walkSteps=16 code2Seen=1 exhausted=0 skipShift=49 skipVal=160.494 skipFlag=0 bodyExt=160.509 extUpdatedByNonQual=3 code3Seen=0 sideViolations=0 todayEqBase=0 todayEqNuance=1 baseEqNuance=0 class=TODAY_EQ_NUANCE outwardBasePts=73 outwardNuancePts=0 skipShiftT=2026.06.11 10:40 startShiftT=2026.06.11 11:05
22982 :: LG	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:45 site=S2POLL dir=LONG branch=1SWING fracAnchorShift=3 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-73 deltaFracNuancePts=9 fracSteps=23 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=5 fracClass=CARVEOUT_FIRED sideFracViolations=0 outwardFracPts=73 outwardFracNuancePts=-9 fracAnchorRawShift=3 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:30 fracSkip=42 fracSkipT=2026.06.11 11
22983 :: FJ	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SEL61SRC site=S2POLL bar=2026.06.11 14:45 branch=SLREF_1SWING def=1 value=160.498 mode=1 scope=IN_SCOPE_RULE aux=-
22984 :: LR	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] A6TERM class=SELECTED bar=2026.06.11 14:45 shift=1 site=S2POLL dir=LONG mode=1SWING px=160.498 ok=1 slot=44
22985 :: IN	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SEL52CTX seq=299 bar=2026.06.11 14:45 site=S2POLL dir=LONG oPx=160.519 oBT=2026.06.11 14:45 slRef=160.498 mode=1 halt=-
22986 :: ED	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SLMEMO bar=2026.06.11 14:45 site=S2POLL result=COMPUTE ok=1 slRef=160.498 mode=1 computes=236 hits=60 genID=236 wrSite=S2POLL wrOrigin=evalClose
22987 :: HS	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] UJ1R bar=2026.06.11 14:45 src=POLL entry=160.520 sl=160.498 tp=160.587 risk=0.022 reward=0.067 R=3.05 verdict=PASS
22988 :: RI	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] ZONESHADOW bar=2026.06.11 14:45 dir=LONG close=160.520 zoneLo=160.489 zoneHi=160.504 gapPts=16 slRef=160.498 tp=160.587 R_close=3.05 tpInGap=0 shadow= near=13.83/sl1/tp1 mid=60.33/sl0/tp1 far=10.89/sl0/tp1 
22989 :: JJ	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:45 bl=-1 br=2147483647 sl=0 sr=10 sel=SHORT sline=0 scode=Daily-POC lcode=-
22990 :: OM	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:45 newPoi=Daily-POC newDir=SHORT heldPoi=Daily-POC heldDir=LONG heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
22991 :: PL	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:45 bl=-1 br=2147483647 sl=0 sr=10 sel=SHORT sline=0 scode=Daily-POC lcode=-
22992 :: IN	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:45 poi=Daily-POC dir=SHORT opp=1 higher=0 heldPoi=Daily-POC heldDir=LONG heldState=S4_ARMED cum_n=78 cum_opp=15 cum_hi=7 cum_both=3 action=HELD
22993 :: JO	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:45 hits=2 Daily-POC:r10:dS Daily-VWAP:r11:dS
22994 :: DO	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] UJDTTERMS bar=2026.06.11 14:45 Daily-POC=Lbody-below/SHIT Daily-VWAP=Lbody-below/SHIT Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
22995 :: RI	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] RETESTDIAG bar=2026.06.11 14:45 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:225.8pts
22996 :: KS	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:45 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=1pts doji=0 touchAttr=1 confirm=0 shadow=true
22997 :: RG	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:45 bl=-1 br=2147483647 sl=0 sr=10 sel=SHORT sline=0 scode=Daily-POC lcode=-
22998 :: LQ	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] UJSBTELEM bar=2026.06.11 14:45 dir=LONG have=1 sbDir=SHORT sbLine=0 confC=0 confH=0 sbL=160.523 o1=160.524 c1=160.521 c0=160.519 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
22999 :: RR	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] ZONEID bar=2026.06.11 14:45 site=S4RQZ xobId=3103 fvgId=0
23000 :: CJ	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] ZONEADOPT bar=2026.06.11 14:45 dir=LONG adopt=1 via=BAR newLo=160.498 newHi=160.518 barLo=160.512 barHi=160.525 sw1=160.507@3 sw2=-@-1
23001 :: CP	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] LEGTOUCH bar=2026.06.11 14:45 dir=LONG found=1 atShift=1 atBar=2026.06.11 14:45 legBound=2026.06.11 14:35 zoneLo=160.489 zoneHi=160.504 touchSeen=1
23002 :: PS	0	03:01:48.421	Core 04	2026.06.11 14:50:00   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:45 dir=LONG m15=-1.0 uj_readFail=0
23003 :: CL	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
23004 :: NG	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:50 h4=1.0 h1=-1.0 m15=-1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular readFail=0 empty=107053 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=32 ticktime=2026.06.11 14:55:00 lag=chartTime-1bar
23005 :: ER	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] FRESHCOUNT #144 bar=2026.06.11 14:50 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=48 cum2=14 cum3=0
23006 :: MH	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] SWEPTMASK bar=2026.06.11 14:50 raw=3429125.0 m=3429125 swept=1010000011 live=0010
23007 :: LD	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:50 line=Daily-POC anchor=Daily-POC
23008 :: JK	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:50 line=Daily-VWAP anchor=Daily-POC
23009 :: RF	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:50 line=Daily-POC anchor=Daily-POC
23010 :: PM	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:50 line=Daily-VWAP anchor=Daily-POC
23011 :: IS	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] TPCENSUS #214 bar=2026.06.11 14:50 dir=LONG ref=160.521 winner=YLOH best=160.587 distPts=66 empties=8 admitted= PDH:50 ASH:27 LOH:66 NYH:13 PMH:19 YASH:27 YLOH:66 YNYH:8 YPMH:19 
23012 :: MO	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] SLEXT481 fields=17 bar=2026.06.11 14:50 site=S2POLL dir=LONG ladOriginPx=160.520 ladOriginBarTime=2026.06.11 14:50 ladOriginSite=S2POLL ext1Defined=1 slExt1=160.501 ext1Slot=43 ext1BarTime=2026.06.11 11:15 ext1Imb=0 deepestExt=31 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
23013 :: OQ	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] SWINGPICK site=S2POLL dir=LONG barShift=1 close=160.520 haveHigh=1 SH=160.534 atShift=9 haveLow=1 SL=160.507 atShift=4
23014 :: CF	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] SLSRC site=S2POLL dir=LONG src=OB_SWING obStruct=160.498 obSwing=160.498 nearest=160.507 chosen=160.498 deltaPts=0
23015 :: KE	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=160.498 distPts=22 site=S2POLL zoneLo=160.489 zoneHi=160.504
23016 :: DN	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] SLIMB fields=19 bar=2026.06.11 14:50 site=S2POLL dir=LONG branch=1SWING obValid=1 slRef=160.498 slShift=45 slShiftT=2026.06.11 11:05 latestFlag=0 latestShift=4 latestShiftT=2026.06.11 14:30 latestAvail=1 latestApexMatch=1 chosenFlag=0 chosenShift=45 chosenShiftT=2026.06.11 11:05 chosenAvail=1 nuanceClass=OB_VALID_LATEST_NOIMB cands=-
23017 :: PQ	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] SLIMBWALK fields=27 bar=2026.06.11 14:50 site=S2POLL dir=LONG branch=1SWING slToday=160.498 slBase=160.425 slNuance=160.498 deltaBasePts=-73 deltaNuancePts=0 walkSteps=16 code2Seen=1 exhausted=0 skipShift=50 skipVal=160.494 skipFlag=0 bodyExt=160.509 extUpdatedByNonQual=3 code3Seen=0 sideViolations=0 todayEqBase=0 todayEqNuance=1 baseEqNuance=0 class=TODAY_EQ_NUANCE outwardBasePts=73 outwardNuancePts=0 skipShiftT=2026.06.11 10:40 startShiftT=2026.06.11 11:05
23018 :: HN	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:50 site=S2POLL dir=LONG branch=1SWING fracAnchorShift=4 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-73 deltaFracNuancePts=9 fracSteps=23 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=5 fracClass=CARVEOUT_FIRED sideFracViolations=0 outwardFracPts=73 outwardFracNuancePts=-9 fracAnchorRawShift=4 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:30 fracSkip=43 fracSkipT=2026.06.11 11
23019 :: QP	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] SEL61SRC site=S2POLL bar=2026.06.11 14:50 branch=SLREF_1SWING def=1 value=160.498 mode=1 scope=IN_SCOPE_RULE aux=-
23020 :: HE	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] A6TERM class=SELECTED bar=2026.06.11 14:50 shift=1 site=S2POLL dir=LONG mode=1SWING px=160.498 ok=1 slot=45
23021 :: OP	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] SEL52CTX seq=300 bar=2026.06.11 14:50 site=S2POLL dir=LONG oPx=160.520 oBT=2026.06.11 14:50 slRef=160.498 mode=1 halt=-
23022 :: RM	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] SLMEMO bar=2026.06.11 14:50 site=S2POLL result=COMPUTE ok=1 slRef=160.498 mode=1 computes=237 hits=60 genID=237 wrSite=S2POLL wrOrigin=evalClose
23023 :: EM	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] UJ1R bar=2026.06.11 14:50 src=POLL entry=160.521 sl=160.498 tp=160.587 risk=0.023 reward=0.066 R=2.87 verdict=PASS
23024 :: LR	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] ZONESHADOW bar=2026.06.11 14:50 dir=LONG close=160.521 zoneLo=160.489 zoneHi=160.504 gapPts=17 slRef=160.498 tp=160.587 R_close=2.87 tpInGap=0 shadow= near=13.83/sl1/tp1 mid=60.33/sl0/tp1 far=10.89/sl0/tp1 
23025 :: HK	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:50 hits=0 
23026 :: CP	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] UJDTTERMS bar=2026.06.11 14:50 Daily-POC=Lbody-below/Sno-penetration Daily-VWAP=Lbody-below/Sno-penetration Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
23027 :: OM	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] RETESTDIAG bar=2026.06.11 14:50 inside=- nearAbove=Daily-VWAP:0.3pts nearBelow=Weekly-VWAP:225.6pts
23028 :: HQ	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:50 anchor=Daily-POC dir=LONG oppCandle=1 bodyDir=0 body=0pts doji=1 touchAttr=1 confirm=0 shadow=true
23029 :: QE	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] UJSBTELEM bar=2026.06.11 14:50 dir=LONG have=0 sbDir=NONE sbLine=-1 confC=0 confH=0 sbL=0.000 o1=160.520 c1=160.519 c0=160.520 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
23030 :: CF	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] ZONEID bar=2026.06.11 14:50 site=S4RQZ xobId=3103 fvgId=0
23031 :: RI	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] ZONEADOPT bar=2026.06.11 14:50 dir=LONG adopt=1 via=BAR newLo=160.498 newHi=160.518 barLo=160.512 barHi=160.522 sw1=160.507@4 sw2=-@-1
23032 :: CS	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] LEGTOUCH bar=2026.06.11 14:50 dir=LONG found=1 atShift=2 atBar=2026.06.11 14:45 legBound=2026.06.11 14:35 zoneLo=160.489 zoneHi=160.504 touchSeen=1
23033 :: QD	0	03:01:48.421	Core 04	2026.06.11 14:55:00   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:50 dir=LONG m15=-1.0 uj_readFail=0

P1. Is there a buy deal on 2026.06.11 at the 14:40 open, price within 0.010 of 160.524? NO. Zero buy DEAL rows exist on 11 June anywhere in the new journal (second pattern: deal plus buy plus 2026.06.11 scores 0 rows; the single buy-mention on 11 June is the 22:30:51 stop-loss notice for position #6 at new line 24285, not a deal); the only 11 June deal is deal #7 sell 0.41 at 159.725 at 22:30:51 (new line 24286), the June-5 position stop. Proving rows: the new deal list in P5 below.
P2. Did the LONG seed at the 14:40 pass, and what next? YES it seeded: new 22893 STATE IDLE->S1_REGIME dir=LONG poi=Daily-POC plus new 22894 ANCHOR_ELECT bar=2026.06.11 14:35 action=SEED poi=Daily-POC rank=10 tier=5 dir=LONG. Same pass it walked S1_REGIME->S2_LTF_ALIGN (new 22903), S2->S3 (new 22904), S3 zone with HEADS-UP LONG (new 22924-22927), S3->S4_ARMED LONG (new 22925). Next: at the 14:45 pass the LONG holder sat S4_ARMED (new 22934) and the fire was refused with CONFIRM_STRUCT_FAIL bar=14:40 dir=LONG term=A_OPP (new 22965); CONFIRMPOLL LONG confirm=0 on the 14:40 bar (new 22958). At 14:50 a SHORT contender was suppressed behind the LONG holder (new 22990-22992) and the LONG was retained; at 14:55 and 15:00/15:05 the LONG stayed armed with poll R PASS (3.05, 2.87, 1.34, 1.54) but every fire pass ended CONFIRM_STRUCT_FAIL (new 23066, 23103 and 15:05 twin). No guessing why; the confirmation check is the named next measurement (planner B-5 note).
P3. 5 June rows old vs new, side by side (identical): old deal #6 buy 0.41 at 160.120 16:55:00 (old 14059) vs new deal #6 buy 0.41 at 160.120 16:55:00 (new 13936); old UJRETARGET 19:00 old=160.723 tp=160.298 (old 14331) vs new same values (new 14208); old MTEXIT 19:15 entry=160.115 exit=160.298 (old 14354) vs new same (new 14231); old MTLIFE openBar 16:55 verdict=TP_TOUCH closeBar 19:15 closePx=160.298 (old 14355) vs new same (new 14232). Also London pair identical: old #4 sell 159.948 / #5 buy 159.900 (old 13097/13421) vs new same (new 12974/13298).
P4. Filed trades (June USDJPY venue set; EURUSD August/September rows are outside this window and unexercised by either run):
| date | session | operator filed trade | old deals | new deals | same / better / worse |
|---|---|---|---|---|---|
| 3 June | London | LONG entry 09:10 | #2 buy 159.932, #3 sell 159.983 | #2 buy 159.932, #3 sell 159.983 | same |
| 5 June | London | SHORT entry 09:45 | #4 sell 159.948, #5 buy 159.900 | #4 sell 159.948, #5 buy 159.900 | same |
| 5 June | New York | LONG entry owed 16:15 | missed (late 16:55 sub #6 buy 160.120) | missed (late 16:55 sub #6 buy 160.120) | same |
| 11 June | New York | LONG entry owed 14:40 open 160.524 | missed, no deal | missed, no deal (seeded plus armed same pass, fire refused downstream) | same |
| 8 June | either | SHORT invalid, must stay silent | silent, no deals | silent, no deals | same |
P5. All deal rows old (6): old 7147 deal #2 buy 3.71 at 159.932 06-03 09:10:00; old 7238 deal #3 sell 3.71 at 159.983 06-03 09:59:40; old 13097 deal #4 sell 6.74 at 159.948 06-05 09:45:00; old 13421 deal #5 buy 6.74 at 159.900 06-05 12:19:21; old 14059 deal #6 buy 0.41 at 160.120 06-05 16:55:00; old 24024 deal #7 sell 0.41 at 159.725 06-11 22:30:51. New (6): new 7078, 7169, 12974, 13298, 13936, 24286 with identical date, direction and price each. Counts: old 6, new 6, identical.
P6. ABORT reason=LTF_MISALIGN rows: old 23, new 23. SUPPRESSED bar= rows: old 93, new 93. (Same totals with moved order: new run prints the 14:40 ABORT immediately per the edit and prints no SUPPRESSED at the 14:35 bar; the UJDEFERAPPLY row is gone from the new journal.)

## Step 8 decision: REVERT (P1 NO, so the KEEP condition fails by the relay rule)
- Copy-Item literal preB4 over EA done; EA SHA-256 after restore: E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC; git diff --no-index preB4 vs EA: empty (byte-identical). No second edit attempted.
- Noted state: the compiled EX5 on disk (275ADA7F, 452294 bytes) still holds the B-4 binary; the next authorized compile overwrites it. The EA, the .preB4 copy and the journals are uncommitted by relay order.
- SWITCH TO OPUS check: not triggered (one B-series run only, no double compile failure, no rule-choice made here, one-function one-line change, no previously-passing trade worse per P4, no hash/count disagreement, no new packet/relay authored).
