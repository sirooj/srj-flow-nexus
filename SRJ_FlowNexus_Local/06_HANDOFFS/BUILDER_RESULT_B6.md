# BUILDER RESULT B-6 - retest vs zone vs touch measurement only (no edit, no compile, no run, no fix proposed)

Step 1 raw (measured 2026-10-04, terminal disk, branch builder/B-5):
- git log -1: b74b981 B-5 confirmation + holder-slot measurement: touch-gate stops same-pass fire (relay B-5 revised, planner side)
- EA SHA-256 Experts/SRJ_FlowNexus_EA.mq5: E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC (MATCHES required; gate passed. No compile and no tester run in B-6; the EX5 on disk is still the B-4 build.)

## Step 2 bar facts (RECON78-B4_JOURNAL.log, 37030 lines; UJSBTELEM rows carry prior-bar open/close plus evaluated-bar close; bar highs and lows are NOT IN JOURNAL as raw rows)
22798 :: CK	0	03:01:42.317	Core 04	2026.06.11 14:30:00   Alert: USDJPY M5 - POI RETEST LONG at 160.522  [D-VWAP]
22799 :: DO	0	03:01:42.317	Core 04	2026.06.11 14:30:00   Alert: USDJPY M5 - POI RETEST SHORT at 160.525  [D-POC]
22873 :: MQ	0	03:01:48.421	Core 04	2026.06.11 14:40:22   Alert: USDJPY M5 - POI RETEST LONG at 160.523  [D-POC +1]
22808 :: GR	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] TPCENSUS #210 bar=2026.06.11 14:25 dir=SHORT ref=160.525 winner=YLOL best=160.493 distPts=32 empties=8 admitted= PDL:289 ASL:100 LOL:32 NYL:17 PML:73 YASL:100 YLOL:32 YNYL:202 YPML:73 LIVE:1470 LIVE:1722 PD:1470 PD:1722 LIVE:1544 LIVE:1737 LIVE:1782 LIVE:2167 PD:1782 PD:2167 LIVE:1742 LIVE:1860 PD:1742 PD:1860 LIVE:1497 LIVE:1668 LIVE:1381 LIVE:1523 LIVE:1567 LIVE:1914 LIVE:1444 LIVE:1717 LIVE:1424 LIVE:1687 LIVE:1424 LIVE:1654 LIVE:1274 LIVE:1875 LIVE:1437 LIVE:1745 LIVE:154
22810 :: CO	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SWINGPICK site=S2POLL dir=SHORT barShift=1 close=160.524 haveHigh=1 SH=160.534 atShift=4 haveLow=1 SL=160.508 atShift=5
22811 :: OL	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] SLSRC site=S2POLL dir=SHORT src=OB_SWING obStruct=160.572 obSwing=160.572 nearest=160.534 chosen=160.572 deltaPts=0
22833 :: PJ	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJSBTELEM bar=2026.06.11 14:25 dir=SHORT have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=160.525 o1=160.525 c1=160.526 c0=160.524 arm=1 termC=A_OPP termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
22834 :: RH	0	03:01:48.421	Core 04	2026.06.11 14:30:00   [SRJ-EA] ZONEID bar=2026.06.11 14:25 site=S4RQZ xobId=3091 fvgId=0
22844 :: NR	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] TPCENSUS #211 bar=2026.06.11 14:30 dir=SHORT ref=160.523 winner=YLOL best=160.493 distPts=30 empties=8 admitted= PDL:287 ASL:98 LOL:30 NYL:16 PML:71 YASL:98 YLOL:30 YNYL:200 YPML:71 LIVE:1468 LIVE:1720 PD:1468 PD:1720 LIVE:1542 LIVE:1735 LIVE:1780 LIVE:2165 PD:1780 PD:2165 LIVE:1740 LIVE:1858 PD:1740 PD:1858 LIVE:1495 LIVE:1666 LIVE:1379 LIVE:1521 LIVE:1565 LIVE:1912 LIVE:1442 LIVE:1715 LIVE:1422 LIVE:1685 LIVE:1422 LIVE:1652 LIVE:1272 LIVE:1873 LIVE:1435 LIVE:1743 LIVE:1539 
22846 :: GL	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SWINGPICK site=S2POLL dir=SHORT barShift=1 close=160.522 haveHigh=1 SH=160.534 atShift=5 haveLow=1 SL=160.508 atShift=6
22847 :: GK	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] SLSRC site=S2POLL dir=SHORT src=OB_SWING obStruct=160.572 obSwing=160.572 nearest=160.534 chosen=160.572 deltaPts=0
22869 :: CK	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] UJSBTELEM bar=2026.06.11 14:30 dir=SHORT have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=160.523 o1=160.525 c1=160.524 c0=160.522 arm=1 termC=B_BODY termH=A_OPP - contender evaluation (Fix S3)
22870 :: JF	0	03:01:48.421	Core 04	2026.06.11 14:35:10   [SRJ-EA] ZONEID bar=2026.06.11 14:30 site=S4RQZ xobId=3091 fvgId=0
22894 :: HD	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] ANCHOR_ELECT bar=2026.06.11 14:35 action=SEED poi=Daily-POC rank=10 tier=5 dir=LONG
22906 :: QH	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJSBTELEM bar=2026.06.11 14:35 dir=LONG have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=160.523 o1=160.525 c1=160.522 c0=160.526 arm=1 termC= termH=A2_CLOSE_BREAK - contender evaluation (Fix S3)
22907 :: DF	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] ZONEID bar=2026.06.11 14:35 site=S3PICK xobId=3070 fvgId=0
22909 :: FE	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] ZONEPICK bar=2026.06.11 14:35 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0 downgraded=0 fvg=--- xob=160.489-160.504
22914 :: OI	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SWINGPICK site=S3ARM dir=LONG barShift=1 close=160.526 haveHigh=1 SH=160.534 atShift=6 haveLow=1 SL=160.507 atShift=1
22915 :: NN	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLSRC site=S3ARM dir=LONG src=OB_SWING obStruct=160.489 obSwing=160.488 nearest=160.507 chosen=160.488 deltaPts=1
22926 :: GL	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 S3 zone: src=XOB haveFvg=0 haveXob=1 zoneLo=160.489 zoneHi=160.504
22927 :: PR	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ HEADS-UP LONG USDJPY M5 | Daily-POC | NYAM | zone 160.489-160.504 awaiting confirm
22928 :: IJ	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] ZONEID bar=2026.06.11 14:35 site=S4RQZ xobId=3070 fvgId=0
Read-off: 14:30 bar open 160.525 close 160.522 (bearish 3pts, from the 14:35-pass row o1/c1); 14:35 bar open 160.523 close 160.526 (bullish 3pts, from the 14:45-pass row o1/c1 and the 14:40-pass row c0); 14:40 bar close 160.521 (from the 14:45-pass row c0). Highs and lows of the three bars: NOT IN JOURNAL (SWINGPICK SH/SL are swing extremes, not bar high/low). The old RECON78-V26 journal shows identical o1/c1/c0 values on the same three passes (B-1 rows: o1=160.525 c1=160.522 c0=160.526 at 14:40:22).

## Step 3 anchor and zone (LONG at the 14:40 pass)
- ANCHOR_ELECT 22894: bar=2026.06.11 14:35 action=SEED poi=Daily-POC rank=10 tier=5 dir=LONG. Anchor line = Daily-POC; evidenced price 160.523 (marker alert 22873) with his entry reference 160.524.
- ZONEID 22907: bar 14:35 site=S3PICK xobId=3070 fvgId=0. ZONEPICK 22909: haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0, xob=160.489-160.504. S3 zone print 22926: src=XOB haveFvg=0 haveXob=1 zoneLo=160.489 zoneHi=160.504.
- s35_fromFvg: the variable itself is NOT IN JOURNAL as a printed value; the zone is proven order-block-sourced (XOB) by haveFvg=0 plus haveXob=1 plus xobId=3070 plus fvgId=0, so fromFvg=false by structure.

## Step 4 the retest alert (Indicators/SRJ_POI_Marker.mq5, 3190 lines; alert condition 1455-1456 with 10 lines before, plus format and call)
1445:       ObjectSetInteger(0,nm,OBJPROP_ZORDER,g_passId);
1446:       ObjectSetString(0,nm,OBJPROP_TOOLTIP,tip);
1447: 
1448:       if(prevStamp != g_passId)
1449:         {
1450:          if(isLong)
1451:             PushRing(g_mkU,g_mkUHead,g_mkUCount,InpKeepMarkers,nm);
1452:          else
1453:             PushRing(g_mkD,g_mkDHead,g_mkDCount,InpKeepMarkers,nm);
1454: 
1455:          if(AlertsFireable(i,rates_total,isIncremental) &&
1456:             AlertEligible(topLine,bt))
1457:            {
1458:             string tfTxt =
1459:                StringSubstr(EnumToString((ENUM_TIMEFRAMES)_Period),7);
1460: 
1461:             string msg = StringFormat(
1462:                "%s %s - POI RETEST %s at %s  [%s%s]",
1463:                _Symbol,
1464:                tfTxt,
1465:                dirStr,
1466:                DoubleToString(g_L[i][topLine],_Digits),
1467:                LineCode(topLine),
1468:                (n > 1) ? StringFormat(" +%d",n - 1) : ""
1469:             );
1470: 
1471:             if(InpAlertPopup)
1472:                Alert(msg);
### EvalBar retest test (1522-1542): LONG retest needs wick below the LINE value with body above (1529: lo below L minus point plus epsilon, bodyLo above L minus epsilon), SHORT mirrored (1536); L is the g_L line value (1524), no zone anywhere in the function.
1522:    for(int k = 0; k < NLINES; k++)
1523:      {
1524:       double L = g_L[i][k];
1525: 
1526:       if(L == EMPTY_VALUE || L <= 0.0)
1527:          continue;
1528: 
1529:       if(lo <= L - P + EPS && bodyLo >= L - EPS)
1530:         {
1531:          longHits[nL]    = k;
1532:          longPierce[nL] = (L - lo) / P;
1533:          nL++;
1534:         }
1535: 
1536:       if(hi >= L + P - EPS && bodyHi <= L + EPS)
1537:         {
1538:          shortHits[nS]    = k;
1539:          shortPierce[nS] = (hi - L) / P;
1540:          nS++;
1541:         }
1542:      }
Plain sentence: POI RETEST tests the anchor LINE value (wick through the line with body holding), not the EA zone.

## Step 5 FindLegTouch whole body (6830-6860, 30 lines)
6830: bool FindLegTouch(int barShift, double zHi, double zLo,
6831:                   int &foundShiftOut, double &legTimeOut, bool fromFvg)
6832:   {
6833:    foundShiftOut = -1;
6834:    legTimeOut    = 0.0;
6835:    if(!(zHi > 0.0 && zLo > 0.0)) return false;
6836: 
6837:    double legT;
6838:    if(ReadFlow(FL_BUF_STRUCT_LEG_TIME, legT, barShift) &&
6839:       legT > 0.0 && legT != EMPTY_VALUE)
6840:       legTimeOut = legT;
6841:    datetime legBoundary = (legTimeOut > 0.0) ? (datetime)legTimeOut : 0;
6842: 
6843:    for(int s = barShift; s <= barShift + 500; s++)
6844:      {
6845:       datetime bt = iTime(_Symbol, PERIOD_CURRENT, s);
6846:       if(bt <= 0)                              break;
6847:       if(legBoundary > 0 && bt < legBoundary)   break;
6848: 
6849:       double so = iOpen (_Symbol, PERIOD_CURRENT, s);
6850:       double sh = iHigh (_Symbol, PERIOD_CURRENT, s);
6851:       double sl = iLow  (_Symbol, PERIOD_CURRENT, s);
6852:       double sc = iClose(_Symbol, PERIOD_CURRENT, s);
6853: 
6854:       bool oppositeDir = (g_dir == DIR_LONG) ? (sc < so) : (sc > so);
6855:       bool touchesZone = (sh >= zLo && sl <= zHi);
6856:       if(oppositeDir && (!fromFvg || touchesZone))
6857:         { foundShiftOut = s; return true; }
6858:      }
6859:    return false;
6860:   }
Plain sentence: a touch counts when an opposite-direction bar (close against the holder direction, 6854) has range overlapping the ZONE (high above zoneLo and low below zoneHi, 6855), scanning the evaluated bar back up to 500 bars but never past the structural-leg boundary time (6841-6847); it tests the zone, never the anchor line.

## Step 6 fire path pull (EA 9276-10621 mechanically pulled for return, g_state =, GoAbort, [SRJ-EA] tags, return-ending ifs: 51 hits with 3 lines around each, pasted whole below)
EALINES=12298
HITS_N=51
--- HIT 9300 (3 before/after) ---
9297:       if(!divOk)
9298:         {
9299:          if(InpDebugLog)
9300:             PrintFormat("[SRJ-EA] CONFIRM_DIV_WAIT bar=%s dir=%s verdict=%d",
9301:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9302:                                      TIME_DATE|TIME_MINUTES),
9303:                          DirName(g_dir), divVal);
--- HIT 9310 (3 before/after) ---
9307:          ENUM_SRJ_STATE prevDiv = g_state;
9308:          if(g_confirmFromState == ST_S4_ARMED)
9309:            {
9310:             //--- [P-RESQUAT-1 F-a] capture BEFORE GoAbort: ResetSequence clears the anchor line (EA 6274 sentinel);
9311:             //--- anchor/dir/session captured together for tuple atomicity; dir/session capture is harmless (no ResetSequence writes per S1(22) census); the suppression record must outlive the reset.
9312:             int              s4e_line = g_anchorLine;
9313:             ENUM_SRJ_DIR     s4e_dir  = g_dir;
--- HIT 9316 (3 before/after) ---
9313:             ENUM_SRJ_DIR     s4e_dir  = g_dir;
9314:             ENUM_SRJ_SESSION s4e_sess = g_sessionAtEntry;
9315:             datetime         s4e_day  = TC_DayStart(barTime);
9316:             GoAbort(ABORT_DIV_FALLBACK, g_state);
9317:             //--- record-validity + index guard (Opus B/Q1-4): ARM only a live tuple;
9318:             //--- a dead record skips ARM (SKIP printed, no ARM row) so G2 audibly mismatches, never silently counts.
9319:             if(s4e_line >= 0 && s4e_line < POI_NLINES && s4e_dir != DIR_NONE && (s4e_sess == SESSION_LONDON || s4e_sess == SESSION_NYAM))
--- HIT 9326 (3 before/after) ---
9323:                  { if(s4e_day != g_evictDayLon) { g_evictBitsLon = 0; g_evictDayLon = s4e_day; } g_evictBitsLon |= (1 << s4e_bit); }
9324:                else
9325:                  { if(s4e_day != g_evictDayNY) { g_evictBitsNY = 0; g_evictDayNY = s4e_day; } g_evictBitsNY |= (1 << s4e_bit); }
9326:                PrintFormat("[SRJ-EA] EVICTSUPPRESS bar=%s poi=%s dir=%s sess=%s untilDay=%s action=ARM",
9327:                            TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
9328:                            g_lineCode[s4e_line], DirName(s4e_dir), SessionName(s4e_sess),
9329:                            TimeToString(s4e_day, TIME_DATE));
--- HIT 9332 (3 before/after) ---
9329:                            TimeToString(s4e_day, TIME_DATE));
9330:               }
9331:             else
9332:                PrintFormat("[SRJ-EA] EVICTSUPPRESS_SKIP bar=%s cause=dead-record line=%d dir=%s sess=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), s4e_line, DirN
9333:             return;
9334:            }
9335:          if(g_confirmFromState == ST_S3_ZONE_WAIT)
--- HIT 9333 (3 before/after) ---
9330:               }
9331:             else
9332:                PrintFormat("[SRJ-EA] EVICTSUPPRESS_SKIP bar=%s cause=dead-record line=%d dir=%s sess=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), s4e_line, DirN
9333:             return;
9334:            }
9335:          if(g_confirmFromState == ST_S3_ZONE_WAIT)
9336:            {
--- HIT 9337 (3 before/after) ---
9334:            }
9335:          if(g_confirmFromState == ST_S3_ZONE_WAIT)
9336:            {
9337:             g_state = ST_S3_ZONE_WAIT;
9338:             LogState(prevDiv, g_state);
9339:             return;
9340:            }
--- HIT 9339 (3 before/after) ---
9336:            {
9337:             g_state = ST_S3_ZONE_WAIT;
9338:             LogState(prevDiv, g_state);
9339:             return;
9340:            }
9341:          PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN bar=%s origin=%s",
9342:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
--- HIT 9341 (3 before/after) ---
9338:             LogState(prevDiv, g_state);
9339:             return;
9340:            }
9341:          PrintFormat("[SRJ-EA] EVICT_UNEXPECTED_ORIGIN bar=%s origin=%s",
9342:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9343:                                   TIME_DATE|TIME_MINUTES),
9344:                      StateName(g_confirmFromState));
--- HIT 9345 (3 before/after) ---
9342:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
9343:                                   TIME_DATE|TIME_MINUTES),
9344:                      StateName(g_confirmFromState));
9345:          g_state = ST_S4_ARMED;
9346:          LogState(prevDiv, ST_S4_ARMED);
9347:          return;
9348:         }
--- HIT 9347 (3 before/after) ---
9344:                      StateName(g_confirmFromState));
9345:          g_state = ST_S4_ARMED;
9346:          LogState(prevDiv, ST_S4_ARMED);
9347:          return;
9348:         }
9349: 
9350:       //--- [P-NEXTOPEN 2026-09-09, operator directive] The entry reference is
--- HIT 9362 (3 before/after) ---
9359:       if(!ComputeNearestTpTarget(barShift, g_dir, currentPrice, tpTarget))
9360:         {
9361:          if(InpDebugLog)
9362:              PrintFormat("[SRJ-EA] %s S5_NO_TP_TARGET",
9363:                          TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
9364:           //--- [P-SLDEF-4 E33] the decided outcome rides the census.
9365:           SrjOrderEmit(barShift, "NO_TP");
--- HIT 9366 (3 before/after) ---
9363:                          TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
9364:           //--- [P-SLDEF-4 E33] the decided outcome rides the census.
9365:           SrjOrderEmit(barShift, "NO_TP");
9366:           GoAbort(ABORT_NO_TP_TARGET, g_state); return;
9367:         }
9368: 
9369:       double slRef = 0.0;
--- HIT 9386 (3 before/after) ---
9383:        if(!ComputeSlReference(barShift, g_dir, slRef, slMode, "S5"))
9384:          {
9385:           if(InpDebugLog)
9386:               PrintFormat("[SRJ-EA] %s S5_NO_SL_REF",
9387:                           TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS));
9388:            //--- [P-SLDEF-4 E33] the decided outcome rides the census.
9389:            SrjOrderEmit(barShift, "NO_SL");
--- HIT 9392 (3 before/after) ---
9389:            SrjOrderEmit(barShift, "NO_SL");
9390:            if(InpDebugLog) O1RecordWalk(barShift, g_dir, 0.0, slMode, false);   //--- [O1-HOOK]
9391:            if(InpDebugLog) A6S5Log(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), 0);   //--- [A6-HOOK] (iii)
9392:            GoAbort(ABORT_NO_SL_REF, g_state); return;
9393:          }
9394:        //--- [P-SEL-1 E56] census context at S5 (read-only + line) + probe stage.
9395:        if(InpDebugLog)
--- HIT 9402 (3 before/after) ---
9399:           A6S5Log(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), 1);   //--- [A6-HOOK] (iii)
9400:           string sl54_s5T = TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES);
9401:          if(SrjSelIsProbeBar(sl54_s5T))
9402:            { string sl54_s5L = StringFormat("[SRJ-EA] SEL54STAGE bar=%s stage=S5 dir=%s", sl54_s5T, DirName(g_dir)); LwAudit("SEL54STAGE", sl54_s5L); Print(sl54_s5L); }
9403:         }
9404:       //--- [P-ADOPT-1 E50] dormant S5 adoption: slExt1 as the returned
9405:       //--- reference behind ADOPT_EXT1 (default false — run A provably
--- HIT 9448 (3 before/after) ---
9445:             int sl61_fResid = (int)MathRound((sl61_expPx - sl61_filedPx) / _Point);
9446:             g_origin_regN++;
9447:             if(sl61_match == 0) g_origin_regFail++;
9448:             string sl61_line = StringFormat("[SRJ-EA] ORIGINREG fields=23 bar=%s site=S5 dir=%s exID=%s entryPx=%s entryBarT=%s expPx=%s expSlot=%d expBarT=%s expImb=%d obsDef=%d obsPx=%s obsSlot=%d o
9449:                       sl61_barT, DirName(g_dir), sl61_ex,
9450:                       DoubleToString(sl61_entryPx, _Digits), sl61_entryBT,
9451:                       sl61_ePxS, sl61_expSlot, sl61_eBtS, sl61_expImb,
--- HIT 9461 (3 before/after) ---
9458:             Print(sl61_line);
9459:             if(sl61_match == 0)
9460:               {
9461:                string sl61_fail = StringFormat("[SRJ-EA] ORIGINREGFAIL exID=%s bar=%s residPts=%d",
9462:                          sl61_ex, sl61_barT, sl61_resid);
9463:                LwAudit("ORIGINREGFAIL", sl61_fail);
9464:                Print(sl61_fail);
--- HIT 9543 (3 before/after) ---
9540:                if(sl43_mBtS != sl43_eBtS) sl43_diff += "bt ";
9541:                if(sl43_mImb != e35_imb) sl43_diff += "imb ";
9542:               }
9543:             string sl43_line = StringFormat("[SRJ-EA] SLEXT43 fields=10 bar=%s dir=%s memoHit=%d memoSite=%s memoExt1=%s freshExt1=%s memoSlot=%d freshSlot=%d agree=%d diffFields=%s",
9544:                       TimeToString(slimbr_bt, TIME_DATE|TIME_MINUTES), DirName(g_dir),
9545:                       sl43_hit, sl43_mSite, sl43_mPxS, sl43_ePxS, sl43_mSlot, e35_slot, sl43_agree, sl43_diff);
9546:             LwAudit("SLEXT43", sl43_line);
--- HIT 9557 (3 before/after) ---
9554:          int slimbr_dN = (slimbr_fresh ? (int)MathRound((slimbr_n - slRef) / _Point) : 0);
9555:          int slimbr_dFB = (slimbr_fresh ? (int)MathRound((slimbr_fb - slRef) / _Point) : 0);
9556:          int slimbr_dFN = (slimbr_fresh ? (int)MathRound((slimbr_fn - slRef) / _Point) : 0);
9557:          string slimbr_line = StringFormat("[SRJ-EA] SLIMBR bar=%s dir=%s entry=%s tp=%s slToday=%s rToday=%.2f dTodayPts=0 slBase=%s rBase=%.2f dBasePts=%d slNuance=%s rNuance=%.2f dNuancePts=%d slFr
9558:                      TimeToString(slimbr_bt, TIME_DATE|TIME_MINUTES),
9559:                      DirName(g_dir),
9560:                      DoubleToString(currentPrice, _Digits),
--- HIT 9602 (3 before/after) ---
9599:                  g_sel55_n++;
9600:                  string sl55_tpS = DoubleToString(sl55_tp, _Digits);
9601:                  if(sl55_tpU == 1) sl55_tpS = "UNSTATED";
9602:                  string sl55_line = StringFormat("[SRJ-EA] SEL55 ex=%s bar=%s codedir=%s codeentry=%s codetp=%s hisentry=%s histp=%s cqd=%s",
9603:                    sl55_ex, sl55_barT, DirName(g_dir), DoubleToString(currentPrice, _Digits),
9604:                    DoubleToString(tpTarget, _Digits), DoubleToString(sl55_ePx, _Digits), sl55_tpS, sl55_cqdS);
9605:                  LwAudit("SEL55", sl55_line); Print(sl55_line);
--- HIT 9622 (3 before/after) ---
9619:             int carveWickOB = (g_dir == DIR_LONG)
9620:                               ? ((g_slimbr_obSkipV < g_slimbr_obRetV - _Point) ? 1 : 0)
9621:                               : ((g_slimbr_obSkipV > g_slimbr_obRetV + _Point) ? 1 : 0);
9622:             string slbr_cv_ob = StringFormat("[SRJ-EA] SLIMBRCARVE bar=%s site=S5 limb=OB ret=%s newerShift=%d newerT=%s newerWick=%s newerFlag=%d newerBody=%s wickMoreExt=%d bodyThru=%d",
9623:                       TimeToString(slimbr_bt, TIME_DATE|TIME_MINUTES),
9624:                       DoubleToString(g_slimbr_obRetV, _Digits),
9625:                       g_slimbr_obSkipS, SlimbShiftT(g_slimbr_obSkipS),
--- HIT 9638 (3 before/after) ---
9635:             int carveWickFR = (g_dir == DIR_LONG)
9636:                               ? ((g_slimbr_frSkipV < g_slimbr_frRetV - _Point) ? 1 : 0)
9637:                               : ((g_slimbr_frSkipV > g_slimbr_frRetV + _Point) ? 1 : 0);
9638:             string slbr_cv_fr = StringFormat("[SRJ-EA] SLIMBRCARVE bar=%s site=S5 limb=FR ret=%s newerShift=%d newerT=%s newerWick=%s newerFlag=%d newerBody=%s wickMoreExt=%d bodyThru=%d",
9639:                       TimeToString(slimbr_bt, TIME_DATE|TIME_MINUTES),
9640:                       DoubleToString(g_slimbr_frRetV, _Digits),
9641:                       g_slimbr_frSkipS, SlimbShiftT(g_slimbr_frSkipS),
--- HIT 9873 (3 before/after) ---
9870:              if(ReadFlow(FL_BUF_OB_SWING_TIME, ladObt, ladS) && ladObt > 0.0 && (datetime)ladObt == ladBt) ladIsOB = 1;
9871:              int ladIsAnchor = (ladFresh == 1 && ladS == ladGuardS) ? 1 : 0;
9872:              int ladIsToday = (ladV == slRef) ? 1 : 0;
9873:              string ladLine = StringFormat("[SRJ-EA] SLADDER fields=19 bar=%s site=S5 dir=%s rung=%d rungSlot=%d rungExt=%d shift=%d shiftT=%s barTime=%s px=%s wick=%s body=%s imbCode=%d exceedsPrev=%
9874:                        TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
9875:                        ladRungN, ladS - barShift, ladExt, ladS, SlimbShiftT(ladS),
9876:                        TimeToString(ladBt, TIME_DATE|TIME_MINUTES),
--- HIT 9884 (3 before/after) ---
9881:               Print(ladLine);
9882:               //--- [P-SLDEF-5 E38] mark-up table as its own audited class:
9883:               //--- every ladder rung in mark-up columns (evidence, not an ask).
9884:               string ladMark = StringFormat("[SRJ-EA] SLADMARK fields=11 bar=%s site=S5 dir=%s rung=%d slot=%d rungExt=%d barTime=%s px=%s imbCode=%d distPts=%d rungR=%.2f",
9885:                        TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
9886:                        ladRungN, ladS - barShift, ladExt,
9887:                        TimeToString(ladBt, TIME_DATE|TIME_MINUTES),
--- HIT 10020 (3 before/after) ---
10017:              }
10018:            if(wRowOk == 1)
10019:              {
10020:               string ladMatch = StringFormat("[SRJ-EA] SLADDER_MATCH fields=14 bar=%s site=S5 dir=%s rungs=%d todayRung=%d todayRef=%s todayResidPts=%d level=%s status=%s rung=%d rungSlot=%d rungExt=%
10021:                      TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
10022:                      ladRungN, ladTodayRung, ladTodayTok, ladTodayResid,
10023:                      ladLvlTok, ladStatus, ladMRung, ladMSlot, ladMExt, ladMT, ladMResid);
--- HIT 10069 (3 before/after) ---
10066:               int eOut = (int)MathRound(((g_dir == DIR_LONG) ? -(e35_px - slRef) : (e35_px - slRef)) / _Point);
10067:               if(e35_def == 1)
10068:                 { if(eOut > 0) g_slext_outP++; else if(eOut < 0) g_slext_outN++; else g_slext_outZ++; }
10069:               string eLine = StringFormat("[SRJ-EA] SLEXT1 fields=29 bar=%s site=S5 dir=%s ext1Defined=%d slExt1=%s ext1Slot=%d ext1BarTime=%s ext1Imb=%d deltaExt1Pts=%d outwardExt1Pts=%d deepestExt=%
10070:                        TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
10071:                        e35_def, (e35_def == 1) ? DoubleToString(e35_px, _Digits) : "-",
10072:                        e35_slot, (e35_def == 1) ? TimeToString(e35_bt, TIME_DATE|TIME_MINUTES) : "-",
--- HIT 10084 (3 before/after) ---
10081:               Print(eLine);
10082:               if(eVerd == "MISS")
10083:                 {
10084:                  string eHalt = StringFormat("[SRJ-EA] SLEXT6HALT bar=%s dir=%s filedPx=%s filedProv=%s slExt1=%s residPts=%d",
10085:                            TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
10086:                            DoubleToString(fPx, _Digits), fProv, DoubleToString(e35_px, _Digits), eResid);
10087:                  LwAudit("SLEXT6HALT", eHalt);
--- HIT 10125 (3 before/after) ---
10122:                  { sl45_noneSlot = wTodaySlot; sl45_noneT = SlimbShiftT(wTodaySlot); sl45_refAge = wTodaySlot - barShift; }
10123:                string sl45_vacS = (wRowStatus == "VACUOUS_COVER") ? "VACUOUS_COVER" : "-";
10124:                string sl45_covS = (ladCovers == 1) ? "COVERED" : "EXT1_UNCOVERED";
10125:                string sl45_line = StringFormat("[SRJ-EA] SLEXT45 fields=10 bar=%s site=S5 dir=%s extStatus=%s todayStatus=%s noneSlot=%d noneT=%s refSlotAgeBars=%d vacStatus=%s coverStatus=%s ladOblig
10126:                          TimeToString(ladBarT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
10127:                          sl45_extS, sl45_todayS, sl45_noneSlot, sl45_noneT, sl45_refAge,
10128:                          sl45_vacS, sl45_covS, wCoverN);
--- HIT 10183 (3 before/after) ---
10180:               SlimbCorrHist(corrBarT, "anchor", cAnchorFound, cAnchorRS, cAnchorRungS, cAnchorSlot);
10181:               g_corr_rows++; g_corr_fracOff += cFracOff; g_corr_todayOff += cTodayOff;
10182:              }
10183:           string corrLine = StringFormat("[SRJ-EA] SLADCORR fields=23 bar=%s site=S5 dir=%s ladRungs=%d ladDeepestSlot=%d ladCap=%d ladCapHit=%d ladCovers=%d todayRefSlot=%d baseRefSlot=%d nuanceRefSl
10184:                     corrBarT, DirName(g_dir),
10185:                      ladRungN, ladDeepest, wLimit, ladCapHit, ladCovers,
10186:                     cTodaySlot, cBaseSlot, cNuanceSlot, cFracSlot, cFracNuSlot, cAnchorSlot,
--- HIT 10199 (3 before/after) ---
10196:            //--- (the row's guaranteed line: HALT rows print only this, with
10197:            //--- the offending witness values + haltRef/haltSlot naming the
10198:            //--- halt). Measured pre-write like every shadow line.
10199:            string winLine = StringFormat("[SRJ-EA] SLADWIN fields=28 bar=%s site=S5 dir=%s status=%s todayIsRung=%d baseIsRung=%d nuanceIsRung=%d fracIsRung=%d fracNuIsRung=%d anchorIsRung=%d todaySte
10200:                      corrBarT, DirName(g_dir), wRowStatus,
10201:                      wTodayIsRung, wBaseIsRung, wNuanceIsRung, wFracIsRung, wFracNuIsRung, wAnchorIsRung,
10202:                      wTodaySteps, wBaseSteps, wNuanceSteps, wFracSteps, wFracNuSteps, wAnchorSteps,
--- HIT 10282 (3 before/after) ---
10279:        double slDist = MathAbs(currentPrice - slRef);
10280:        double tpDist = MathAbs(tpTarget - currentPrice);
10281:        bool tpOk = (slDist > 0.0 && (tpDist / slDist) >= InpMinRewardRisk);
10282:        static uint probe_seq = 0; const uint PROBE_CAP = 20000; static bool probe_schema_done = false; static bool probe_capped = false; static bool probe_dead = false; string probe_keys[38]; string p
10283:        //--- [S1-CONDSTOP-SHADOW-001] stop-source recorder (Luna V89-STOP-CLEAR-001,
10284:        //--- cleared BY NAME print-only; his fresh run word this turn). Shadow-local
10285:        //--- rung walk over the same swing/imb buffers, read-only: SrjResolveExt1
--- HIT 10338 (3 before/after) ---
10335:           int s1e_sel = -1;
10336:           if(s1e_s0slot >= 0 && s1e_s0imb > 0) s1e_sel = 0;
10337:           else if(s1e_s1slot >= 0) s1e_sel = 1;
10338:           PrintFormat("[SRJ-EA] SIDE1E_STOPSHADOW bar=%s dir=%s s0px=%s s0slot=%d s0imb=%d s1px=%s s1slot=%d s1imb=%d sel=%d r0=%.2f r1=%.2f liveSl=%s livePass=%d",
10339:                       TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
10340:                       DirName(g_dir),
10341:                       DoubleToString(s1e_s0px, _Digits), s1e_s0slot, s1e_s0imb,
--- HIT 10352 (3 before/after) ---
10349:            //--- printed for offline grade against his filed levels (which live ONLY in
10350:            //--- the grade file, NEVER as literals here). Pure reads plus one print; no
10351:            //--- state/dir/latch/order/stop/N1 write, no fresh Detect call, AdoptOff untouched.
10352:            PrintFormat("[SRJ-EA] SIDE1X_STOPREF bar=%s dir=%s entry=%s liveStop=%s ruleStop=%s ruleSlot=%d ruleImb=%d liveTp=%s liveR=%.2f livePass=%d",
10353:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
10354:                        DirName(g_dir),
10355:                        DoubleToString(currentPrice, _Digits),
--- HIT 10381 (3 before/after) ---
10378:               if(ReadFlow(s1y_b[s1y_i], s1y_f, barShift) && s1y_f != EMPTY_VALUE && s1y_f > 0.0)
10379:                  s1y_v[s1y_i] = s1y_f;
10380:              }
10381:            PrintFormat("[SRJ-EA] SIDE1Y_PDSESS bar=%s dir=%s entry=%s liveTp=%s pdAsiaH=%s pdAsiaL=%s pdLondonH=%s pdLondonL=%s pdNyH=%s pdNyL=%s pdPmH=%s pdPmL=%s",
10382:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
10383:                                     TIME_DATE|TIME_MINUTES),
10384:                        DirName(g_dir),
--- HIT 10403 (3 before/after) ---
10400:             string s1o_cqdS = "UNREAD";
10401:             if(ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, s1o_cqd, barShift) && s1o_cqd != EMPTY_VALUE)
10402:                s1o_cqdS = IntegerToString((int)MathRound(s1o_cqd));
10403:             PrintFormat("[SRJ-EA] SIDE1O_ELIGSTATE bar=%s dir=%s sessUsed=%d divLatch=%d cqd=%s confirm=%s slRef=%s rLive=%.2f livePass=%d",
10404:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
10405:                                      TIME_DATE|TIME_MINUTES),
10406:                         DirName(g_dir),
--- HIT 10431 (3 before/after) ---
10428:                s1q_fvS = DoubleToString(s1q_fv, 1);
10429:             if(ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, s1q_cq, barShift) && s1q_cq != EMPTY_VALUE)
10430:                s1q_cqS = IntegerToString((int)MathRound(s1q_cq));
10431:              PrintFormat("[SRJ-EA] SIDE1Q_CQDKILL bar=%s dir=%s obValid=%s fvgValid=%s cqdDiv=%s",
10432:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
10433:                                       TIME_DATE|TIME_MINUTES),
10434:                          DirName(g_dir), s1q_obS, s1q_fvS, s1q_cqS);
--- HIT 10445 (3 before/after) ---
10442:           //--- carries seedBT + evalBar so grade verifies linkage without assuming.
10443:           if(InpDebugLog)
10444:             {
10445:              PrintFormat("[SRJ-EA] SIDE1R_RGATE evalBar=%s seedBT=%s dir=%s seedBiasAl=%d rLive=%.2f livePass=%d slRef=%s",
10446:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
10447:                                       TIME_DATE|TIME_MINUTES),
10448:                          TimeToString(g_anchorBarTime, TIME_DATE|TIME_MINUTES),
--- HIT 10473 (3 before/after) ---
10470:                 if(s1w_k > 0) s1w_s += ",";
10471:                 s1w_s += s1w_t;
10472:                }
10473:              PrintFormat("[SRJ-EA] SIDE1W_CQDWINDOW evalBar=%s dir=%s w=%s",
10474:                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
10475:                                       TIME_DATE|TIME_MINUTES),
10476:                          DirName(g_dir), s1w_s);
--- HIT 10494 (3 before/after) ---
10491:          && (g_freshVetoDir != (int)g_dir))
10492:         {
10493:          if(InpDebugLog)
10494:             PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=DIR",
10495:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
10496:                         DirName(g_dir));
10497:          g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
--- HIT 10504 (3 before/after) ---
10501:             != StringSubstr(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE), 0, 10))
10502:         {
10503:          if(InpDebugLog)
10504:             PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=DAY",
10505:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
10506:                         DirName(g_dir));
10507:          g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
--- HIT 10514 (3 before/after) ---
10511:          && g_freshVetoDir == (int)g_dir)
10512:         {
10513:          if(InpDebugLog)
10514:             PrintFormat("[SRJ-EA] FRESHVETO bar=%s dir=%s anchor=%s vetoBar=%s",
10515:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
10516:                         DirName(g_dir), AnchorStr(),
10517:                         TimeToString(g_freshVetoBar, TIME_DATE|TIME_MINUTES));
--- HIT 10520 (3 before/after) ---
10517:                         TimeToString(g_freshVetoBar, TIME_DATE|TIME_MINUTES));
10518:          SrjOrderEmit(barShift, "FRESH_VETO");
10519:          g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
10520:          GoAbort(ABORT_FRESH_VETO, g_state); return;
10521:         }
10522:       g_latchedEntry = currentPrice;
10523:       g_latchedSl    = slRef;
--- HIT 10534 (3 before/after) ---
10531:       //--- the latch itself is build 2+; this prints the would-be values each time the
10532:       //--- gate evaluates, so the calibration shows R at every bar the gate saw.
10533:       if(InpDebugLog && SHADOW_TP_ELECT)
10534:          PrintFormat("[SRJ-EA] TP_ELECT shadow=true entry=%s sl=%s tp=%s R=%.2f "
10535:                      "bar=%s latchBar=%s",
10536:                      DoubleToString(currentPrice, _Digits),
10537:                      DoubleToString(slRef, _Digits),
--- HIT 10549 (3 before/after) ---
10546:       if(!tpOk)
10547:         {
10548:          if(InpDebugLog)
10549:             PrintFormat("[SRJ-EA] %s S5_RR_SHORTFALL tpDist=%.5f slDist=%.5f R=%.2f",
10550:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
10551:                         tpDist, slDist, (slDist > 0.0 ? tpDist / slDist : 0.0));
10552:          //--- [P-CONFIRM-GATE E5] TP_RR_FAIL keeps its name; the latch values
--- HIT 10556 (3 before/after) ---
10553:          //--- are printed with it (the ruled 1R gate is a hard kill here - the
10554:          //--- latch is never recomputed on a later, more favourable bar).
10555:          if(InpDebugLog)
10556:             PrintFormat("[SRJ-EA] TP_RR_FAIL_LATCH bar=%s dir=%s entry=%s sl=%s tp=%s R=%.2f",
10557:                         TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
10558:                                      TIME_DATE|TIME_MINUTES),
10559:                         DirName(g_dir),
--- HIT 10574 (3 before/after) ---
10571:              int nfWould = (g_slext_r >= InpMinRewardRisk) ? 1 : 0;
10572:              if(nfWould == 1)
10573:                { g_slext_newN++; g_slext_newRows += TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES) + ";"; }
10574:              string nfLine = StringFormat("[SRJ-EA] SLNONFIRE fields=11 bar=%s dir=%s outcome=RR_FAIL todayR=%.2f todayXi=%s ext1R=%.2f rewardPts=%.5f riskPts=%.5f ext1RewardPts=%.5f ext1RiskPts=%.5f 
10575:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
10576:                        DirName(g_dir), (slDist > 0.0 ? tpDist / slDist : 0.0), g_slext_todayXi,
10577:                        g_slext_r, tpDist / _Point, slDist / _Point,
--- HIT 10582 (3 before/after) ---
10579:              LwAudit("SLNONFIRE", nfLine);
10580:              Print(nfLine);
10581:             }
10582:           GoAbort(ABORT_TP_RR_FAIL, g_state);
10583:           return;
10584:         }
10585: 
--- HIT 10583 (3 before/after) ---
10580:              Print(nfLine);
10581:             }
10582:           GoAbort(ABORT_TP_RR_FAIL, g_state);
10583:           return;
10584:         }
10585: 
10586:       //--- [P-CONFIRM-GATE E3] the async wait RETIRES (one-bar validity): the
--- HIT 10611 (3 before/after) ---
10608:             {
10609:              g_slext_lostN++;
10610:              g_slext_lostRows += TimeToString(ordFireT, TIME_DATE|TIME_MINUTES) + ";";
10611:              string psLine = StringFormat("[SRJ-EA] SLEXTLOST fields=6 bar=%s dir=%s ext1R=%.2f ext1RewardPts=%.5f ext1RiskPts=%.5f threshold=%.2f",
10612:                        TimeToString(ordFireT, TIME_DATE|TIME_MINUTES), DirName(g_dir),
10613:                        psR, g_slext_rewardPts, g_slext_riskPts, InpMinRewardRisk);
10614:              LwAudit("SLEXTLOST", psLine);
--- HIT 10620 (3 before/after) ---
10617:          }
10618:         LogSignal(tpTarget, tpR, slRef, slMode, divKind);
10619:         if(InpDebugLog) A6Fired(barShift, tpTarget, tpR, slRef, slMode, divKind);   //--- [A6-HOOK] (ii)
10620:         if(InpDebugLog) PrintFormat("[SRJ-EA] SIDE1F_WATCH bar=%s dir=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir));   //--- [SIDE1F] (iii) fire 
10621: 
10622:       if(!g_alertedSignal)
10623:         {
### Gates between S5 (9261) and the SIGNAL alert (10625), in code order, each with its 14:40-pass journal value:
1. Divergence gate 9297-9347 (CONFIRM_DIV_WAIT print 9300; DIV_FALLBACK abort plus evict arm 9308-9347): NOT IN JOURNAL (CONFIRM_DIV_WAIT 0 rows, DIV_FALLBACK 0 rows in the pass).
2. TP target 9359-9366 (S5_NO_TP_TARGET print plus abort): NOT IN JOURNAL (0 rows).
3. SL reference 9383-9392 (S5_NO_SL_REF print plus abort): NOT IN JOURNAL (0 rows).
4. CQD/divergence telemetry and eligibility 10403 (SIDE1O_ELIGSTATE), 10431 (SIDE1Q_CQDKILL), 10445 (SIDE1R_RGATE), 10473 (SIDE1W_CQDWINDOW): NOT IN JOURNAL (all four tags 0 rows in the pass).
5. Fresh veto 10514-10520 (FRESHVETO print plus abort): NOT IN JOURNAL (0 rows).
6. Latch plus TP elect 10522-10534 (TP_ELECT print): NOT IN JOURNAL (0 rows).
7. 1R gate 10546-10583 (S5_RR_SHORTFALL and TP_RR_FAIL_LATCH prints plus abort): NOT IN JOURNAL (0 rows).
8. Fire: LogSignal 10618, A6Fired 10619, SIDE1F_WATCH 10620, entry alert SIGNAL 10622-10631 under if-not-already-signalled: NOT IN JOURNAL (all 0 rows).
All 31 gate and print tags score zero in the 57-row 14:40:22 pass because the pass never reached S5 (it ended after LEGTOUCH 22929 with touchSeen false).

## Step 7 regression map (OLD journal RECON78-V26-UJ_JOURNAL.log, 36760 lines; entry seeds, LEGTOUCH at arming, first UJTOUCHSEEN, PREBIND rows)
| date | deal | direction and POI | touchSeen at arming | pass where touchSeen became 1 | entry pass |
|---|---|---|---|---|---|
| 3 June | #2 buy 159.932 | LONG Daily-VWAP | 1 (LEGTOUCH old 7034 touchSeen=1 at the 09:05:05 arming pass) | same pass 09:05 (UJTOUCHSEEN old 7033) | 09:10 |
| 3 June | #3 sell 159.983 | exit of #2, no arming | N/A (exit deal) | N/A | 09:59:40 |
| 5 June | #4 sell 159.948 | SHORT Daily-POC | 0, never (zero SHORT LEGTOUCH and zero SHORT UJTOUCHSEEN rows on all of June 5, two patterns) | never | 09:45 via CONFIRM_PREBIND old 13016 (09:45 pass on the 09:40 bar) |
| 5 June | #5 buy 159.900 | exit of #4, no arming | N/A (exit deal) | N/A | 12:19:21 |
| 5 June | #6 buy 160.120 | LONG Daily-POC | 0, never (zero LONG LEGTOUCH and zero LONG UJTOUCHSEEN rows on all of June 5, two patterns) | never | 16:55 via CONFIRM_PREBIND old 13839 (16:55 pass on the 16:50 bar) |
| 11 June | #7 sell 159.725 | stop exit of #6, no arming | N/A (exit deal) | N/A | 22:30:51 |
Showing: 1 of the 3 filed entries armed with touchSeen=1 (3 June); 2 armed with touchSeen=0 never-set and still entered through CONFIRM_PREBIND (5 June pair). June-5 PREBIND_FAIL rows (old 12710-12970) precede each success. The 11 June LONG (new journal) armed touchSeen=0 with no PREBIND success and did not enter.

## Step 8 operator words (his verbatim on retest, touch, tap, wick, same candle, armed, CQD divergence; up to 10 lines with file and line)
BUILDER_RELAY_COUNCIL_v400-UJ-EXEC-10.md L2123 :: P2085:    80: - SAME-CANDLE (his words 2026-09-23: "the retest and the confirmation candle can be the same candle"). Amended point: retest plus confirmation may coincide on one candle; entry stays next-bar open. The 16:55-to-17:00 pattern was one instance, never the rule shape. Proved live: 51 elected 8/28 off the 10:00 bar and 9/7 off the 16:40 bar, both with empty books on same-bar confirm=1.
BUILDER_FINDING_SWEPT-ABSORPTION.md L5 :: "my suspicition is that the sessional liquidity high or low does not get deleted. once they are sweep with even candle wick, they are deleted in the sense of absorption. and i need another or newer POC or VWAP touch to renew the entry POI, meaning if a setup has a valid retest and then hit the sessional Liquidity before a valid 5m structure retracement and confirmation, i need another POC or VWAP retest."
BUILDER_FINDING_USDJPY-MISSES.md L67 :: - His Q3: "wdymn retarget? to what?" Builder plain definition: booked 30-Apr high 160.723 moves to today's New York high (highest point of today's NY session at that moment) once price trades above it. His trade call kept: wick past the high counts, or close past it only.
BUILDER_FINDING_USDJPY-MISSES.md L71 :: - His A5 (retarget): "once again, i do not know what you mean by passing IT, IT what? the current ny session high? if so then this is like the normal entry. once the session has closed, the H/L of it is valid to be targetted or retargetted to revise the TP target with price or wick touch. the only time for the candle close confirmation close is the POC or VWAP gap break to validate if the POC is breaking the candlestick with a candle body close." Builder rules carried: TOUCH-RETARGET - session H/L valid once closed, revise on price/wick touch, object = today's NY high/low; CLOSE-ONLY-GAP-BREAK - closes validate POC/VWAP gap breaks only.
BUILDER_FINDING_EXIT-0817.md L23 ::   only on a body close through it. A wick through does nothing." / "The body-close break is an
Rulings-F session rebuke plus G sequencing plus J entry bar (MISSES file, full lines):
MISSES L94: ## Rulings-F 2026-09-26 (ledger 835; his words verbatim incl typos)
MISSES L95: - His 15m/1H short-bias rule: "this is why i mentioned the 15m HTF bias! i know that the trend following short bias only enabled and confirmed at 14:45 because that is when the 15m structure bias flip, combining with the bearish 1H that makes it valid for the trend following setup bias for short."
MISSES L96: - His session-rules rebuke: "you still conflicting this rule that shows either you didn't read the skill strategy or the strategy specification. this confusion and problem is not new and has been explained by me before. what is the 8:30 potential non executed setup doing here that is preventing the 14:40 entry? why has not been invalidated by the line POI break bias or the flip of the 5m structure bias. besides that, the london setup is irrelevant to prevent setup on the NY, the one position at a time does not apply multi session. meaning i can execute a setup on NY session while the london setup is still floating, even if it's conflicting bias direction wise. also why is the 8:30 setup even considered? the london session begins at 9:00 or at most 8:55 that could be executed at the 9:00 open candle?"
MISSES L97: - Builder record: ONE-TAKE-PER-SESSION pin (skill line 73 + spec L283/L291) answered the session question on record - record-first failure owned; London-9:00-start pinned NEW (not found on record); 08:30-survival (no POI-break/5m-flip invalidation, no session-boundary expiry) recorded as open diagnostic for council route.
MISSES L100: ## Rulings-G 2026-09-26 (ledger 836; his words verbatim incl typos)
MISSES L101: - His terminology correction: "your're using the terms that i don't use and it's confusing me. what do you mean by the short term bias? do you mean the 5m structre bias?" Builder owned: "short-term/short-trend bias" were builder inventions - bias is ALWAYS timeframe-named (5m / 15m / 1H / 4H structure bias), never bare.
MISSES L102: - His 11 June sequencing: "if so then on 11 jun for the NY trend following setup, the 5m bias flip is at the same candle for the retest, and confirmation candle which is at 14:35 and the entry is at 14:40 open candle price. idk why are still considering the 14:45, DO NOT REPEAT THIS MISTAKE!" Builder owned: 14:35 = flip + retest + confirmation SAME candle, entry 14:40 open; 14:45 is post-entry, never selection evidence; my 14:45-bias read-back WITHDRAWN.
MISSES L103: - His HTF read: "for the HTF bias, 4H, 1H, and 15m are all bullish in my journal." Journal read-back: 15m Bull CONFIRMED on all four 6/11 rows (33-36); 4H reads Bear + 1H mixed on the same rows - FLAGGED against his "all bullish" (veto-able; no ask; his eyes govern intraday).
MISSES L104: - His London fundamental: "The london setup which starts at 9:00 is not a new rule. this is very fundamental rule that you might overlook, which is i only trade or take a setup on the london and NY session which has been defined on the SRJ Flow Logic sessions time section." Builder corrected: NOT new - fundamental, overlooked; sessions sourced to his indicator sessions-time section (Asia 20-00 / London 02-05 / NY 07-12 / PM 13:30-16 NY tz, broker +3; buffers 8-17 + PD 40-47; HTF engine include, 53 bias hits, zero flip hits; BiasEngine flip state wasBiasFlip + bull/bear alerts).
MISSES L105: - His short-bias text scoped (rendering, veto-able): 15m flip + 1H agreement enables trend bias IN THE FLIP DIRECTION generally; 11 June instance = bullish variant (long bias); date-ambiguity of the earlier text stated, not resolved by invention.
MISSES L117: ## Rulings-J 2026-09-27 (ledger 879; his words verbatim incl typos)
MISSES L118: - His 6/11 own-source booking rule: "the 6/11 NY setup entry POC is both from POC and VWAP. logically, it can't target it's own source of POI with also the nuance of POC is a higher hierarchy over VWAP on the gapped scenario."
MISSES L119: - His entry-bar correction: "I see the problem, with that entry price of 160.520, that is the opening candle price of 14:45 NOT 14:40 which should be 160.524. the confirmation and retest candle is at 14:35 and the entry is at the candle open of 14:40"
MISSES L120: - His recall order: "do not reinvestigate what has been searched or done before. also i have explained every missing trades on this test window. RECALL."
MISSES L121: - Builder record: DEFECTS OWNED, two - (1) bar-stamp: ref 160.520 attributed to 14:40 in the RECON71 result; WITHDRAWN (repeat of the owned +1-bar class; entry 14:40 open is 160.524 per TPCENSUS #76; 160.520 is the 14:45 open, post-entry, never evidence); (2) record-first: venues diagnosed without citing his filed Rulings-D/F/G and the STRUCTURAL-BIAS + VENUE-CORRECTION pins; WITHDRAWN, recall-join filed here instead of re-derivation.
MISSES L122: - Recall-join (his filed explanations, not reinvestigated): 6/5 09:45 15m-confirm thesis (Rulings-D + journal row 17 + STRUCTURAL-BIAS pin: 5m flips first, 15m confirms at the entry-candle open) - RECON71 rows show the S2 5m axis retaining while his 15m thesis stands unrepresented in promotion (fix item b); 6/11 14:40 owed on the 14:35 flip (Rulings-F) with 14:35/14:40 sequencing (Rulings-G + VENUE-CORRECTION pin); 6/5 16:05 five-line discard (NEAREST-ONLY-TP pin) + NY-high retarget rule (Rulings-H).
MISSES L94: ## Rulings-F 2026-09-26 (ledger 835; his words verbatim incl typos)
MISSES L95: - His 15m/1H short-bias rule: "this is why i mentioned the 15m HTF bias! i know that the trend following short bias only enabled and confirmed at 14:45 because that is when the 15m structure bias flip, combining with the bearish 1H that makes it valid for the trend following setup bias for short."
MISSES L96: - His session-rules rebuke: "you still conflicting this rule that shows either you didn't read the skill strategy or the strategy specification. this confusion and problem is not new and has been explained by me before. what is the 8:30 potential non executed setup doing here that is preventing the 14:40 entry? why has not been invalidated by the line POI break bias or the flip of the 5m structure bias. besides that, the london setup is irrelevant to prevent setup on the NY, the one position at a time does not apply multi session. meaning i can execute a setup on NY session while the london setup is still floating, even if it's conflicting bias direction wise. also why is the 8:30 setup even considered? the london session begins at 9:00 or at most 8:55 that could be executed at the 9:00 open candle?"
MISSES L97: - Builder record: ONE-TAKE-PER-SESSION pin (skill line 73 + spec L283/L291) answered the session question on record - record-first failure owned; London-9:00-start pinned NEW (not found on record); 08:30-survival (no POI-break/5m-flip invalidation, no session-boundary expiry) recorded as open diagnostic for council route.
MISSES L100: ## Rulings-G 2026-09-26 (ledger 836; his words verbatim incl typos)
MISSES L101: - His terminology correction: "your're using the terms that i don't use and it's confusing me. what do you mean by the short term bias? do you mean the 5m structre bias?" Builder owned: "short-term/short-trend bias" were builder inventions - bias is ALWAYS timeframe-named (5m / 15m / 1H / 4H structure bias), never bare.
MISSES L102: - His 11 June sequencing: "if so then on 11 jun for the NY trend following setup, the 5m bias flip is at the same candle for the retest, and confirmation candle which is at 14:35 and the entry is at 14:40 open candle price. idk why are still considering the 14:45, DO NOT REPEAT THIS MISTAKE!" Builder owned: 14:35 = flip + retest + confirmation SAME candle, entry 14:40 open; 14:45 is post-entry, never selection evidence; my 14:45-bias read-back WITHDRAWN.
MISSES L103: - His HTF read: "for the HTF bias, 4H, 1H, and 15m are all bullish in my journal." Journal read-back: 15m Bull CONFIRMED on all four 6/11 rows (33-36); 4H reads Bear + 1H mixed on the same rows - FLAGGED against his "all bullish" (veto-able; no ask; his eyes govern intraday).
MISSES L104: - His London fundamental: "The london setup which starts at 9:00 is not a new rule. this is very fundamental rule that you might overlook, which is i only trade or take a setup on the london and NY session which has been defined on the SRJ Flow Logic sessions time section." Builder corrected: NOT new - fundamental, overlooked; sessions sourced to his indicator sessions-time section (Asia 20-00 / London 02-05 / NY 07-12 / PM 13:30-16 NY tz, broker +3; buffers 8-17 + PD 40-47; HTF engine include, 53 bias hits, zero flip hits; BiasEngine flip state wasBiasFlip + bull/bear alerts).
MISSES L105: - His short-bias text scoped (rendering, veto-able): 15m flip + 1H agreement enables trend bias IN THE FLIP DIRECTION generally; 11 June instance = bullish variant (long bias); date-ambiguity of the earlier text stated, not resolved by invention.
MISSES L117: ## Rulings-J 2026-09-27 (ledger 879; his words verbatim incl typos)
MISSES L118: - His 6/11 own-source booking rule: "the 6/11 NY setup entry POC is both from POC and VWAP. logically, it can't target it's own source of POI with also the nuance of POC is a higher hierarchy over VWAP on the gapped scenario."
MISSES L119: - His entry-bar correction: "I see the problem, with that entry price of 160.520, that is the opening candle price of 14:45 NOT 14:40 which should be 160.524. the confirmation and retest candle is at 14:35 and the entry is at the candle open of 14:40"
MISSES L120: - His recall order: "do not reinvestigate what has been searched or done before. also i have explained every missing trades on this test window. RECALL."
MISSES L121: - Builder record: DEFECTS OWNED, two - (1) bar-stamp: ref 160.520 attributed to 14:40 in the RECON71 result; WITHDRAWN (repeat of the owned +1-bar class; entry 14:40 open is 160.524 per TPCENSUS #76; 160.520 is the 14:45 open, post-entry, never evidence); (2) record-first: venues diagnosed without citing his filed Rulings-D/F/G and the STRUCTURAL-BIAS + VENUE-CORRECTION pins; WITHDRAWN, recall-join filed here instead of re-derivation.
MISSES L122: - Recall-join (his filed explanations, not reinvestigated): 6/5 09:45 15m-confirm thesis (Rulings-D + journal row 17 + STRUCTURAL-BIAS pin: 5m flips first, 15m confirms at the entry-candle open) - RECON71 rows show the S2 5m axis retaining while his 15m thesis stands unrepresented in promotion (fix item b); 6/11 14:40 owed on the 14:35 flip (Rulings-F) with 14:35/14:40 sequencing (Rulings-G + VENUE-CORRECTION pin); 6/5 16:05 five-line discard (NEAREST-ONLY-TP pin) + NY-high retarget rule (Rulings-H).
NOT FOUND as his words on record: the word tap (7 hits, none his words on retest or touch); CQD divergence in his voice (0 hits anywhere in 06_HANDOFFS plus 01_TASKS).

## Step 9 armed, CQD divergence and the slot, in the code
### 9(a) arming condition (spliced 9018-9027) plus HEADS-UP (spliced 9037-9044) plus journal 22925 and 22927 (spliced from the new journal):
9020:       if((haveFvg || haveXob) && s31_inPlay)
9026:          g_state = ST_S4_ARMED;
9039:          if(InpAlertHeadsUp && !g_alertedArmed)
9042:             EmitAlert("HEADS-UP",
9039:          if(InpAlertHeadsUp && !g_alertedArmed)
9042:             EmitAlert("HEADS-UP",
NJ22925 :: QM	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S3_ZONE_WAIT->S4_ARMED dir=LONG poi=Daily-POC
NJ22927 :: PR	0	03:01:48.421	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ HEADS-UP LONG USDJPY M5 | Daily-POC | NYAM | zone 160.489-160.504 awaiting confirm
One sentence: NO, arming requires only a bound zone plus in-play (9020), with no POI-retest predicate in the condition.
### 9(b) CQD divergence evaluation:
10401:             if(ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, s1o_cqd, barShift) && s1o_cqd != EMPTY_VALUE)
10403:             PrintFormat("[SRJ-EA] SIDE1O_ELIGSTATE bar=%s dir=%s sessUsed=%d divLatch=%d cqd=%s confirm=%s slRef=%s rLive=%.2f livePass=%d",
10429:             if(ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, s1q_cq, barShift) && s1q_cq != EMPTY_VALUE)
10431:              PrintFormat("[SRJ-EA] SIDE1Q_CQDKILL bar=%s dir=%s obValid=%s fvgValid=%s cqdDiv=%s",
10445:              PrintFormat("[SRJ-EA] SIDE1R_RGATE evalBar=%s seedBT=%s dir=%s seedBiasAl=%d rLive=%.2f livePass=%d slRef=%s",
10468:                 if(ReadBuf1(g_hCqd, CQD_BUF_DIVVERDICT, s1w_v, barShift + s1w_k) && s1w_v != EMPTY_VALUE)
10473:              PrintFormat("[SRJ-EA] SIDE1W_CQDWINDOW evalBar=%s dir=%s w=%s",
All four sites (10403, 10431, 10445, 10473) sit inside the S5 region, i.e. AFTER the 9216 touch gate in code order (9216 below 10403). Journal value in the 14:40 pass: NOT IN JOURNAL (SIDE1O_ELIGSTATE, SIDE1Q_CQDKILL, SIDE1R_RGATE, SIDE1W_CQDWINDOW, CQD DIV, divLatch, CONFIRM_DIV all score 0 rows there; the pass never reached S5).
### 9(c) which candidate takes the single slot (spliced lines):
7904:           if(t78_opp && (g_state == ST_S2_LTF_ALIGN || (g_state == ST_S1_REGIME && t78_opConf && !t78_heldConf))) (transfer gate: holder rewritten only here)
8443:        if(uj_sbConfC && !uj_sbConfH && (g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED)) (contender yield: holder replaced, never co-kept)
8072:     if(g_state == ST_IDLE) (birth: only with no live holder)
One sentence: no single chooser exists; three site rules (birth only when idle, conditional transfer, conditional yield) keep the first arrival unless it is replaced, which is arrival-priority in effect, and first-validated appears nowhere (B-5 census zeros, carried).

| question | answer | which pasted line proves it |
|---|---|---|
| Q1. Did the 14:35 candle touch the Daily-POC price? Did it touch the zone 160.489-160.504? | Daily-POC: YES (marker alert 160.523 at new 22873; RETESTBOOK 14:35 hits=2 with Daily-POC:dL at new 22887; CONFIRMPOLL LONG confirm=1 with touchAttr=1 at new 22891; raw bar low NOT IN JOURNAL). Zone: NO (LEGTOUCH found=0 at new 22929 with touchSeen=0; S3INPLAY inPlay=0 at new 22910). | Step 2 new 22873, 22887, 22891; step 2 new 22910, 22929. |
| Q2. What exactly does POI RETEST LONG test: anchor line or zone? | Anchor LINE: marker EvalBar needs wick below the line value with body above (1529, L = g_L line value at 1524), SHORT mirrored (1536); the alert prints the line value (1466); no zone anywhere in EvalBar. | Step 4 lines 1522-1542, 1461-1468. |
| Q3. Which gates stand between S5 and the entry alert, and which have a journal value in the 14:40 pass? | Divergence (9297-9347), TP target (9359-9366), SL reference (9383-9392), CQD telemetry and eligibility (10403, 10431, 10445, 10473), fresh veto (10514-10520), latch plus TP elect (10522-10534), 1R gate (10546-10583), fire plus SIGNAL (10618-10631). Journal value in the 14:40 pass: NONE of them (all 31 tags score zero there; the pass never reached S5). | Step 6 pull plus gate list, all with NOT IN JOURNAL. |
| Q4. How many filed entries armed with touchSeen 1 and still entered, versus armed with touchSeen 0? | Armed touchSeen=1 and entered: 1 of 3 (3 June #2, LEGTOUCH old 7034 plus UJTOUCHSEEN old 7033 same pass). Armed touchSeen=0 never-set and still entered: 2 of 3 (5 June #4 with zero SHORT touch rows all day, entered via CONFIRM_PREBIND old 13016; 5 June #6 with zero LONG touch rows all day, entered via CONFIRM_PREBIND old 13839). | Step 7 table plus old rows 7033, 7034, 13016, 13839 with the two zero-count patterns. |
| Q5. What has the operator said about retest or touch, in his words? | Retest plus confirmation share the 14:35 candle with entry next open (Rulings-G verbatim); entry bar is the 14:40 open at 160.524 not 14:45 (Rulings-J verbatim); retest and confirmation may share one candle (SAME-CANDLE verbatim); a swept session level needs another or newer POC/VWAP touch to renew the entry POI (wick-sweep verbatim); wick past a high counts for retarget while only a body close breaks a line (retarget and exit verbatim); setups cross sessions with stale ones invalidated (session rebuke verbatim). Tap as his words: NOT FOUND. CQD divergence in his voice: NOT FOUND. | Step 8 lines with file and line numbers. |
| Q6. The operator means armed as valid POI retest made. Does the EA armed state happen before or after what the EA itself calls a POI retest? | BEFORE, structurally: arming at 9026 needs only zone bound plus in-play (9020) with no retest predicate, while the EA own POI-retest rows (marker alert, RETESTBOOK, ANCHOR_ELECT seed) are separate detections; on 11 June the arm (journal 22925) cited the 14:35 retest rows that had already printed (22873, 22887, 22891), but nothing in the arming condition required them. | Step 9(a) lines 9020-9026; step 2 new 22873, 22887, 22891, 22925. |
| Q7. Is the CQD divergence a gate before the entry alert, and was its value visible in the 14:40 pass? | Its evaluation sites (10403, 10431, 10445, 10473) sit after the 9216 touch gate in code order and inside the S5 region, so they gate only passes that reach S5. Visible in the 14:40 pass: NO, NOT IN JOURNAL (all seven tags zero; the pass ended after LEGTOUCH with touchSeen false). | Step 9(b) lines plus tag zeros; step 3G-equivalent order 9216 below 10403. |

No fix proposed. No placement chosen. Measurement only.
