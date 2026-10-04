# BUILDER RESULT B-8 - A2 1-point trial: full 14:40 SIGNAL at the filed price, one filed deal moved, RESTORED (measurement record)

Step 0 raw (measured 2026-10-04, terminal disk, branch builder/B-7):
- git log -1: 1fcd260 B-7 touch-gate trial: no entry change, KEPT, SWITCH TO OPUS (relay B-7, planner side)
- git status --short line count: 32 (25 pre-existing modified/deleted + 7 untracked: compile log, preB4, preB7 after this step, B-4 and B-7 STATUS/DONE markers)
- EA SHA-256 Experts/SRJ_FlowNexus_EA.mq5: F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582 (starts F04AF9C3, the B-7 kept build; gate passed; operator paste of relay B-8 is the word for ONE local edit plus its compile and run only, NOT a commit/push word)
- Backup Experts/SRJ_FlowNexus_EA.mq5.preB8 written before editing; its SHA-256: F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582 (identical; never committed).

## Step 1 the spot, raw (IsConfirmationCandle 2337-2378, 42 lines; single closeSideOk test, structure as the relay expects, no STOP)
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
CloseSideOk line and A2 line shown in full above (2368-2369 in the restored file). n1 counters, terms A, B, C, reclaim and returns untouched by the trial below.

## Step 2 the trial edit (byte-exact splice, CRLF preserved; 12300 lines before, 12303 after)
Raw diff preB8 vs EA (1 removed line, 4 added lines; hunk @@ -2365,7 +2365,10 @@ = 7 old vs 10 new; one function; inside all limits). Old line spliced from the restored disk file; added lines byte-identical to the edit-script literals that the EDIT-OK disk asserts verified on the edited tree before the restore:
-    bool closeSideOk = (dir == DIR_LONG) ? (c1 >= L || (allowReclaim && o1 <= L && c0 >= o1)) : (c1 <= L || (allowReclaim && o1 >= L && c0 <= o1));
+    int a2_thru = (dir == DIR_LONG) ? (int)MathRound((L - c1) / _Point) : (int)MathRound((c1 - L) / _Point);  //--- [B-8] whole-point through-distance; float rounding cannot decide
+    bool a2_old = (dir == DIR_LONG) ? (c1 >= L || (allowReclaim && o1 <= L && c0 >= o1)) : (c1 <= L || (allowReclaim && o1 >= L && c0 <= o1));  //--- [B-8] old test verbatim for the print gate
+    bool closeSideOk = a2_old || (a2_thru <= 1);  //--- [B-8] 1-point allowance like the touch term
+    if(closeSideOk && !a2_old && InpDebugLog) PrintFormat("[SRJ-EA] UJA2NEAR bar=%s dir=%s line=%s L=%s c1=%s thruPts=%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), g_lineCode[anchorLine], DoubleToString(L, _Digits), DoubleToString(c1, _Digits), a2_thru);
(The four added lines above are the exact literals the srj-b8-edit.py EDIT-OK disk asserts verified byte-for-byte on the edited tree pre-restore; the full unfiltered diff output with identical content sits in the turn record. Post-edit EA SHA-256 was DEEFA9D147923A0925D539D88BAE3D759E67F572DDEA25D0F92C4444D64013ED, measured before the restore.)

## Step 3 compile once (metaeditor64 /compile + /log, log 06_HANDOFFS/B8_EACOMPILE.log, 7854 bytes, UTF-16LE, 48 lines)
- Raw result line: Result: 0 errors, 0 warnings, 15955 ms elapsed, cpu=X64 Regular. CLI EXIT variable printed empty (known quirk); the log line is the result. First and only try.
- Rebuilt EX5 0D78C1C876326FD76161B5CBF217487534114D2459F95A0DE426BEC0FBD0300A, 452482 bytes, compiled after the edit and before the run.

## Step 4 run RECON78 once (RECON78-B8; ini USDJPY_DEMO_JUNE.ini, same settings as B-7)
- Slot free (no terminal64, no metatester64), no stale B-8 markers, config window already June with no terminal running so no edit; WMI launch RC=0 instant; wrapper RUNNING; window proven by journal line: Tester USDJPY,M5 testing of Experts/SRJ_FlowNexus_EA.ex5 from 2026.06.01 00:00 to 2026.06.13 00:00.
- Journal saved as SRJ_FlowNexus_Local/06_HANDOFFS/RECON78-B8_JOURNAL.log: 7103053 bytes, 36652 lines (day-log lines 73825 onward, PRE_JOURNAL_LINES=73824; day log UTF-16LE, filed journal UTF-8).
- DONE RESULT=PASSED; Test passed in 0:45:09.759; 542258 ticks, 2880 bars; final balance 10256.68 (above B-7 10229.50 on the earlier #4 exit shape, not on new profit).

## Step 5 filed-trade comparison: one row per deal, before (RECON78-B7, 36794 lines) vs after (RECON78-B8, 36652 lines). Dates first.
| date | session | direction | before: time and price | after: time and price | same? |
|---|---|---|---|---|---|
| 3 June | London | LONG | entry 09:10 at 159.932 (deal #2) | entry 09:10 at 159.932 (deal #2) | same |
| 3 June | London | exit of the long | 09:59:40 at 159.983 (deal #3) | 09:59:40 at 159.983 (deal #3) | same |
| 5 June | London | SHORT | entry 09:45 at 159.948 size 6.74 (deal #4) | entry 09:20 at 159.959 size 6.22 (deal #4) | CHANGED (time, price, size) |
| 5 June | London | exit of the short | 12:19:21 at 159.900 (deal #5, size 6.74) | 12:19:21 at 159.900 (deal #5, size 6.22 following #4) | same time and price (size follows #4) |
| 5 June | New York | LONG | entry 16:55 at 160.120 (deal #6; late, owed 16:15) | entry 16:55 at 160.120 (deal #6; late, owed 16:15) | same |
| 11 June | New York | stop exit of the 5 June long | 22:30:51 at 159.725 (deal #7) | 22:30:51 at 159.725 (deal #7) | same |
| 8 June | any | SHORT | silent, no trade (zero deals, zero SIGNAL rows) | silent, no trade (zero deals, zero SIGNAL rows) | same |
| 11 June | New York | LONG | no trade (the miss) | no broker deal (full SIGNAL plus ADMIT at 160.524, then ABORT CONCURRENCY_LIMIT while position #6 still open; detail in step 7) | changed in path, same empty fill |
Total deals before: 6. Total deals after: 6. No deal in the after run sits outside this table (all six accounted above).

## Step 6 every use of the allowance (UJA2NEAR rows in the whole after journal: 23, with what followed in the pass)
NTC_N=23
--- NTC k=1 line=3959 ---
3959 :: GQ	0	10:55:30.904	Core 04	2026.06.02 09:45:00   [SRJ-EA] UJA2NEAR bar=2026.06.02 09:40 dir=SHORT line=Daily-POC L=159.716 c1=159.717 thruPts=1
3969 :: OS	0	10:55:30.904	Core 04	2026.06.02 09:45:00   [SRJ-EA] 2026.06.02 09:45:00 STATE S1_REGIME->S2_LTF_ALIGN dir=LONG poi=Daily-POC
3970 :: RO	0	10:55:30.904	Core 04	2026.06.02 09:45:00   [SRJ-EA] 2026.06.02 09:45:00 STATE S2_LTF_ALIGN->S3_ZONE_WAIT dir=LONG poi=Daily-POC
3993 :: DI	0	10:55:30.904	Core 04	2026.06.02 09:45:00   [SRJ-EA] UJALIGN_PASS bar=2026.06.02 09:40 dir=LONG m15=1.0
FOLLOW_N=3
--- NTC k=2 line=10272 ---
10272 :: IS	0	11:04:34.115	Core 04	2026.06.04 10:40:04   [SRJ-EA] UJA2NEAR bar=2026.06.04 10:35 dir=LONG line=Daily-POC L=159.884 c1=159.884 thruPts=0
10274 :: DP	0	11:04:34.115	Core 04	2026.06.04 10:40:04   [SRJ-EA] SIDE1C_YIELD bar=2026.06.04 10:35 from=Daily-VWAP fromDir=SHORT to=Daily-POC toDir=LONG state=S4_ARMED term=
10279 :: KM	0	11:04:34.115	Core 04	2026.06.04 10:40:04   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.04 10:35 dir=LONG m15=-1.0 uj_readFail=0
FOLLOW_N=2
--- NTC k=3 line=12740 ---
12740 :: HR	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] UJA2NEAR bar=2026.06.05 09:15 dir=SHORT line=Daily-POC L=159.960 c1=159.961 thruPts=1
12785 :: NG	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] UJALIGN_BYPASS bar=2026.06.05 09:15 dir=SHORT m15=-1.0 rf=1 - M15 guard bypassed on confirmed bar (Fix Z-B1)
12786 :: EP	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] 2026.06.05 09:20:00 STATE S3_ZONE_WAIT->S5_GATE_CHECK dir=SHORT poi=Daily-POC
12844 :: EF	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.06.05 09:15 dir=SHORT sessUsed=0 divLatch=0 cqd=UNREAD confirm=S3_ZONE_WAIT slRef=159.985 rLive=2.27 livePass=1
12851 :: JG	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] 2026.06.05 09:20:00 SIGNAL dir=SHORT poi=Daily-POC regime=TREND div=hidden sess=LONDON tp_target=159.900 tp_R=2.27 sl_ref=159.985 sl_mode=1-swing spreadPts=4 bid=159.959 ask=159.963
12852 :: PK	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.05 09:15 dir=SHORT tp=159.900 r=2.27 sl=159.985 mode=1SWING div=hidden
12854 :: FE	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] ALERT SRJ SIGNAL SHORT USDJPY M5 | Daily-POC | LONDON | R=2.27 SL 159.985 TP 159.900 spr=4
12855 :: OM	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] UJ1R bar=2026.06.05 09:15 src=FIRE entry=159.959 sl=159.985 tp=159.900 risk=0.026 reward=0.059 R=2.27 verdict=PASS
12869 :: FI	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] 2026.06.05 09:20:00 STATE S5_GATE_CHECK->SIGNAL dir=SHORT poi=Daily-POC
FOLLOW_N=8
--- NTC k=4 line=12769 ---
12769 :: PH	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] UJA2NEAR bar=2026.06.05 09:15 dir=SHORT line=Daily-POC L=159.960 c1=159.961 thruPts=1
12785 :: NG	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] UJALIGN_BYPASS bar=2026.06.05 09:15 dir=SHORT m15=-1.0 rf=1 - M15 guard bypassed on confirmed bar (Fix Z-B1)
12786 :: EP	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] 2026.06.05 09:20:00 STATE S3_ZONE_WAIT->S5_GATE_CHECK dir=SHORT poi=Daily-POC
12844 :: EF	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.06.05 09:15 dir=SHORT sessUsed=0 divLatch=0 cqd=UNREAD confirm=S3_ZONE_WAIT slRef=159.985 rLive=2.27 livePass=1
12851 :: JG	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] 2026.06.05 09:20:00 SIGNAL dir=SHORT poi=Daily-POC regime=TREND div=hidden sess=LONDON tp_target=159.900 tp_R=2.27 sl_ref=159.985 sl_mode=1-swing spreadPts=4 bid=159.959 ask=159.963
12852 :: PK	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.05 09:15 dir=SHORT tp=159.900 r=2.27 sl=159.985 mode=1SWING div=hidden
12854 :: FE	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] ALERT SRJ SIGNAL SHORT USDJPY M5 | Daily-POC | LONDON | R=2.27 SL 159.985 TP 159.900 spr=4
12855 :: OM	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] UJ1R bar=2026.06.05 09:15 src=FIRE entry=159.959 sl=159.985 tp=159.900 risk=0.026 reward=0.059 R=2.27 verdict=PASS
12869 :: FI	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] 2026.06.05 09:20:00 STATE S5_GATE_CHECK->SIGNAL dir=SHORT poi=Daily-POC
FOLLOW_N=8
--- NTC k=5 line=12784 ---
12784 :: LI	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] UJA2NEAR bar=2026.06.05 09:15 dir=SHORT line=Daily-POC L=159.960 c1=159.961 thruPts=1
12785 :: NG	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] UJALIGN_BYPASS bar=2026.06.05 09:15 dir=SHORT m15=-1.0 rf=1 - M15 guard bypassed on confirmed bar (Fix Z-B1)
12786 :: EP	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] 2026.06.05 09:20:00 STATE S3_ZONE_WAIT->S5_GATE_CHECK dir=SHORT poi=Daily-POC
12844 :: EF	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.06.05 09:15 dir=SHORT sessUsed=0 divLatch=0 cqd=UNREAD confirm=S3_ZONE_WAIT slRef=159.985 rLive=2.27 livePass=1
12851 :: JG	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] 2026.06.05 09:20:00 SIGNAL dir=SHORT poi=Daily-POC regime=TREND div=hidden sess=LONDON tp_target=159.900 tp_R=2.27 sl_ref=159.985 sl_mode=1-swing spreadPts=4 bid=159.959 ask=159.963
12852 :: PK	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.05 09:15 dir=SHORT tp=159.900 r=2.27 sl=159.985 mode=1SWING div=hidden
12854 :: FE	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] ALERT SRJ SIGNAL SHORT USDJPY M5 | Daily-POC | LONDON | R=2.27 SL 159.985 TP 159.900 spr=4
12855 :: OM	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] UJ1R bar=2026.06.05 09:15 src=FIRE entry=159.959 sl=159.985 tp=159.900 risk=0.026 reward=0.059 R=2.27 verdict=PASS
12869 :: FI	0	11:08:38.259	Core 04	2026.06.05 09:20:00   [SRJ-EA] 2026.06.05 09:20:00 STATE S5_GATE_CHECK->SIGNAL dir=SHORT poi=Daily-POC
FOLLOW_N=8
--- NTC k=6 line=15536 ---
15536 :: HG	0	11:14:38.366	Core 04	2026.06.08 17:55:00   [SRJ-EA] UJA2NEAR bar=2026.06.08 17:50 dir=SHORT line=Weekly-VWAP L=160.149 c1=160.150 thruPts=1
FOLLOW_N=0
--- NTC k=7 line=15538 ---
15538 :: FQ	0	11:14:38.366	Core 04	2026.06.08 17:55:00   [SRJ-EA] UJA2NEAR bar=2026.06.08 17:50 dir=SHORT line=Weekly-VWAP L=160.149 c1=160.150 thruPts=1
FOLLOW_N=0
--- NTC k=8 line=15542 ---
15542 :: DE	0	11:14:38.366	Core 04	2026.06.08 17:55:00   [SRJ-EA] UJA2NEAR bar=2026.06.08 17:50 dir=SHORT line=Weekly-VWAP L=160.149 c1=160.150 thruPts=1
FOLLOW_N=0
--- NTC k=9 line=15543 ---
15543 :: PG	0	11:14:38.366	Core 04	2026.06.08 17:55:00   [SRJ-EA] UJA2NEAR bar=2026.06.08 17:50 dir=SHORT line=Weekly-VWAP L=160.149 c1=160.150 thruPts=1
FOLLOW_N=0
--- NTC k=10 line=17328 ---
17328 :: NJ	0	11:18:36.401	Core 04	2026.06.09 15:20:00   [SRJ-EA] UJA2NEAR bar=2026.06.09 15:15 dir=SHORT line=Daily-POC L=160.161 c1=160.162 thruPts=1
17329 :: PD	0	11:18:36.401	Core 04	2026.06.09 15:20:00   [SRJ-EA] UJDEFERABORT bar=2026.06.09 15:15 dir=SHORT poi=Daily-POC state=S3_ZONE_WAIT - LTF opposed, abort deferred past evaluation (Fix S-a)
17362 :: LE	0	11:18:36.401	Core 04	2026.06.09 15:20:00   [SRJ-EA] UJDEFERAPPLY bar=2026.06.09 15:15 dir=SHORT poi=Daily-POC - deferred LTF abort applies, holder unchanged (Fix S-a)
17363 :: FL	0	11:18:36.401	Core 04	2026.06.09 15:20:00   [SRJ-EA] 2026.06.09 15:20:00 ABORT reason=LTF_MISALIGN state=S3_ZONE_WAIT poi=Daily-POC dir=SHORT
17365 :: FF	0	11:18:36.401	Core 04	2026.06.09 15:20:00   [SRJ-EA] 2026.06.09 15:20:00 STATE S3_ZONE_WAIT->ABORT dir=SHORT poi=Daily-POC
FOLLOW_N=4
--- NTC k=11 line=17360 ---
17360 :: FH	0	11:18:36.401	Core 04	2026.06.09 15:20:00   [SRJ-EA] UJA2NEAR bar=2026.06.09 15:15 dir=SHORT line=Daily-POC L=160.161 c1=160.162 thruPts=1
17362 :: LE	0	11:18:36.401	Core 04	2026.06.09 15:20:00   [SRJ-EA] UJDEFERAPPLY bar=2026.06.09 15:15 dir=SHORT poi=Daily-POC - deferred LTF abort applies, holder unchanged (Fix S-a)
17363 :: FL	0	11:18:36.401	Core 04	2026.06.09 15:20:00   [SRJ-EA] 2026.06.09 15:20:00 ABORT reason=LTF_MISALIGN state=S3_ZONE_WAIT poi=Daily-POC dir=SHORT
17365 :: FF	0	11:18:36.401	Core 04	2026.06.09 15:20:00   [SRJ-EA] 2026.06.09 15:20:00 STATE S3_ZONE_WAIT->ABORT dir=SHORT poi=Daily-POC
FOLLOW_N=3
--- NTC k=12 line=17489 ---
17489 :: MP	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] UJA2NEAR bar=2026.06.09 15:40 dir=SHORT line=Daily-VWAP L=160.177 c1=160.178 thruPts=1
17528 :: PE	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] UJALIGN_BYPASS bar=2026.06.09 15:40 dir=SHORT m15=1.0 rf=1 - M15 guard bypassed on confirmed bar (Fix Z-B1)
17529 :: CM	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] 2026.06.09 15:45:04 STATE S3_ZONE_WAIT->S5_GATE_CHECK dir=SHORT poi=Daily-VWAP
17571 :: OE	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.06.09 15:40 dir=SHORT sessUsed=0 divLatch=1 cqd=UNREAD confirm=S3_ZONE_WAIT slRef=160.213 rLive=0.37 livePass=0
17579 :: GQ	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] SLNONFIRE fields=11 bar=2026.06.09 15:40 dir=SHORT outcome=RR_FAIL todayR=0.37 todayXi=0 ext1R=0.37 rewardPts=14.00000 riskPts=38.00000 ext1RewardPts=14.00000 ext1RiskPts=38.00000 wouldFire=0
17580 :: ES	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] 2026.06.09 15:45:04 ABORT reason=TP_RR_FAIL state=S5_GATE_CHECK poi=Daily-VWAP dir=SHORT
17581 :: GM	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.09 15:45 state=S5_GATE_CHECK dir=SHORT predicate=TP_RR_FAIL
17582 :: LD	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] 2026.06.09 15:45:04 STATE S5_GATE_CHECK->ABORT dir=SHORT poi=Daily-VWAP
FOLLOW_N=7
--- NTC k=13 line=17512 ---
17512 :: GD	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] UJA2NEAR bar=2026.06.09 15:40 dir=SHORT line=Daily-VWAP L=160.177 c1=160.178 thruPts=1
17528 :: PE	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] UJALIGN_BYPASS bar=2026.06.09 15:40 dir=SHORT m15=1.0 rf=1 - M15 guard bypassed on confirmed bar (Fix Z-B1)
17529 :: CM	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] 2026.06.09 15:45:04 STATE S3_ZONE_WAIT->S5_GATE_CHECK dir=SHORT poi=Daily-VWAP
17571 :: OE	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.06.09 15:40 dir=SHORT sessUsed=0 divLatch=1 cqd=UNREAD confirm=S3_ZONE_WAIT slRef=160.213 rLive=0.37 livePass=0
17579 :: GQ	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] SLNONFIRE fields=11 bar=2026.06.09 15:40 dir=SHORT outcome=RR_FAIL todayR=0.37 todayXi=0 ext1R=0.37 rewardPts=14.00000 riskPts=38.00000 ext1RewardPts=14.00000 ext1RiskPts=38.00000 wouldFire=0
17580 :: ES	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] 2026.06.09 15:45:04 ABORT reason=TP_RR_FAIL state=S5_GATE_CHECK poi=Daily-VWAP dir=SHORT
17581 :: GM	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.09 15:45 state=S5_GATE_CHECK dir=SHORT predicate=TP_RR_FAIL
17582 :: LD	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] 2026.06.09 15:45:04 STATE S5_GATE_CHECK->ABORT dir=SHORT poi=Daily-VWAP
FOLLOW_N=7
--- NTC k=14 line=17527 ---
17527 :: QF	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] UJA2NEAR bar=2026.06.09 15:40 dir=SHORT line=Daily-VWAP L=160.177 c1=160.178 thruPts=1
17528 :: PE	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] UJALIGN_BYPASS bar=2026.06.09 15:40 dir=SHORT m15=1.0 rf=1 - M15 guard bypassed on confirmed bar (Fix Z-B1)
17529 :: CM	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] 2026.06.09 15:45:04 STATE S3_ZONE_WAIT->S5_GATE_CHECK dir=SHORT poi=Daily-VWAP
17571 :: OE	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.06.09 15:40 dir=SHORT sessUsed=0 divLatch=1 cqd=UNREAD confirm=S3_ZONE_WAIT slRef=160.213 rLive=0.37 livePass=0
17579 :: GQ	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] SLNONFIRE fields=11 bar=2026.06.09 15:40 dir=SHORT outcome=RR_FAIL todayR=0.37 todayXi=0 ext1R=0.37 rewardPts=14.00000 riskPts=38.00000 ext1RewardPts=14.00000 ext1RiskPts=38.00000 wouldFire=0
17580 :: ES	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] 2026.06.09 15:45:04 ABORT reason=TP_RR_FAIL state=S5_GATE_CHECK poi=Daily-VWAP dir=SHORT
17581 :: GM	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.09 15:45 state=S5_GATE_CHECK dir=SHORT predicate=TP_RR_FAIL
17582 :: LD	0	11:18:36.401	Core 04	2026.06.09 15:45:04   [SRJ-EA] 2026.06.09 15:45:04 STATE S5_GATE_CHECK->ABORT dir=SHORT poi=Daily-VWAP
FOLLOW_N=7
--- NTC k=15 line=17887 ---
17887 :: KQ	0	11:18:48.608	Core 04	2026.06.09 16:30:00   [SRJ-EA] UJA2NEAR bar=2026.06.09 16:25 dir=SHORT line=Weekly-POC L=160.189 c1=160.190 thruPts=1
FOLLOW_N=0
--- NTC k=16 line=17893 ---
17893 :: QK	0	11:18:48.608	Core 04	2026.06.09 16:30:00   [SRJ-EA] UJA2NEAR bar=2026.06.09 16:25 dir=SHORT line=Weekly-POC L=160.189 c1=160.190 thruPts=1
FOLLOW_N=0
--- NTC k=17 line=19260 ---
19260 :: GR	0	11:21:57.817	Core 04	2026.06.10 09:45:00   [SRJ-EA] UJA2NEAR bar=2026.06.10 09:40 dir=LONG line=Daily-POC L=160.355 c1=160.354 thruPts=1
19264 :: GF	0	11:21:57.817	Core 04	2026.06.10 09:45:00   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.10 09:40 dir=LONG m15=-1.0 uj_readFail=0
FOLLOW_N=1
--- NTC k=18 line=22461 ---
22461 :: CL	0	11:27:09.095	Core 04	2026.06.11 14:25:21   [SRJ-EA] UJA2NEAR bar=2026.06.11 14:20 dir=SHORT line=Daily-POC L=160.523 c1=160.524 thruPts=1
22465 :: DL	0	11:27:09.095	Core 04	2026.06.11 14:25:21   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:20 dir=SHORT m15=1.0 uj_readFail=0
FOLLOW_N=1
--- NTC k=19 line=22501 ---
22501 :: KO	0	11:27:09.095	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJA2NEAR bar=2026.06.11 14:25 dir=SHORT line=Daily-POC L=160.525 c1=160.526 thruPts=1
22505 :: HH	0	11:27:09.095	Core 04	2026.06.11 14:30:00   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 14:25 dir=SHORT m15=1.0 uj_readFail=0
FOLLOW_N=1
--- NTC k=20 line=22580 ---
22580 :: GF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJA2NEAR bar=2026.06.11 14:35 dir=LONG line=Daily-POC L=160.523 c1=160.522 thruPts=1
22582 :: RI	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1C_YIELD bar=2026.06.11 14:35 from=Daily-POC fromDir=SHORT to=Daily-POC toDir=LONG state=S4_ARMED term=
22583 :: QE	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERDROP bar=2026.06.11 14:35 dir=LONG poi=Daily-POC - deferred LTF abort dropped, holder changed (Fix S-a)
22588 :: PF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJALIGN_PASS bar=2026.06.11 14:35 dir=LONG m15=1.0
22590 :: DJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S4_ARMED->S5_GATE_CHECK dir=LONG poi=Daily-POC
22604 :: DR	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:35 site=S5 dir=LONG branch=1SWING fracAnchorShift=1 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-63 deltaFracNuancePts=19 frac
22608 :: OD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBR bar=2026.06.11 14:35 dir=LONG entry=160.524 tp=160.587 slToday=160.488 rToday=1.75 dTodayPts=0 slBase=160.425 rBase=0.64 dBasePts=-63 slNuance=160.488 rNuance=1.75 dNuancePts=0 slFractal
22701 :: FM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.06.11 14:35 dir=LONG sessUsed=0 divLatch=0 cqd=UNREAD confirm=S4_ARMED slRef=160.501 rLive=2.74 livePass=1
22707 :: CM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 SIGNAL dir=LONG poi=Daily-POC regime=TREND div=regular sess=NYAM tp_target=160.587 tp_R=2.74 sl_ref=160.501 sl_mode=1-swing spreadPts=6 bid=160.524 ask=160.530
22708 :: JP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.11 14:35 dir=LONG tp=160.587 r=2.74 sl=160.501 mode=1SWING div=regular
22710 :: LS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-POC | NYAM | R=2.74 SL 160.501 TP 160.587 spr=6
22711 :: RO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJ1R bar=2026.06.11 14:35 src=FIRELOCAL entry=160.524 sl=160.501 tp=160.587 risk=0.023 reward=0.063 R=2.74 verdict=PASS
22712 :: II	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJ1R bar=2026.06.11 14:35 src=FIRE entry=160.524 sl=160.501 tp=160.587 risk=0.023 reward=0.063 R=2.74 verdict=PASS
22713 :: LO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJMEMO_PASS bar=2026.06.11 14:35 admit_key=2026.06.11 14:35:4 entry=160.524 tp=160.587 sl=160.501 R=2.74 src=FIRELOCAL wsrc=LOH wday=2026.06.11 wgen=-1
22717 :: OM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 ABORT reason=CONCURRENCY_LIMIT state=S5_GATE_CHECK poi=Daily-POC dir=LONG
22718 :: GH	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.11 14:40 state=S5_GATE_CHECK dir=LONG predicate=CONCURRENCY_LIMIT
22719 :: GH	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S5_GATE_CHECK->ABORT dir=LONG poi=Daily-POC
FOLLOW_N=16
--- NTC k=21 line=22589 ---
22589 :: GK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJA2NEAR bar=2026.06.11 14:35 dir=LONG line=Daily-POC L=160.523 c1=160.522 thruPts=1
22590 :: DJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S4_ARMED->S5_GATE_CHECK dir=LONG poi=Daily-POC
22604 :: DR	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:35 site=S5 dir=LONG branch=1SWING fracAnchorShift=1 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-63 deltaFracNuancePts=19 frac
22608 :: OD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBR bar=2026.06.11 14:35 dir=LONG entry=160.524 tp=160.587 slToday=160.488 rToday=1.75 dTodayPts=0 slBase=160.425 rBase=0.64 dBasePts=-63 slNuance=160.488 rNuance=1.75 dNuancePts=0 slFractal
22701 :: FM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.06.11 14:35 dir=LONG sessUsed=0 divLatch=0 cqd=UNREAD confirm=S4_ARMED slRef=160.501 rLive=2.74 livePass=1
22707 :: CM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 SIGNAL dir=LONG poi=Daily-POC regime=TREND div=regular sess=NYAM tp_target=160.587 tp_R=2.74 sl_ref=160.501 sl_mode=1-swing spreadPts=6 bid=160.524 ask=160.530
22708 :: JP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.11 14:35 dir=LONG tp=160.587 r=2.74 sl=160.501 mode=1SWING div=regular
22710 :: LS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-POC | NYAM | R=2.74 SL 160.501 TP 160.587 spr=6
22711 :: RO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJ1R bar=2026.06.11 14:35 src=FIRELOCAL entry=160.524 sl=160.501 tp=160.587 risk=0.023 reward=0.063 R=2.74 verdict=PASS
22712 :: II	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJ1R bar=2026.06.11 14:35 src=FIRE entry=160.524 sl=160.501 tp=160.587 risk=0.023 reward=0.063 R=2.74 verdict=PASS
22713 :: LO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJMEMO_PASS bar=2026.06.11 14:35 admit_key=2026.06.11 14:35:4 entry=160.524 tp=160.587 sl=160.501 R=2.74 src=FIRELOCAL wsrc=LOH wday=2026.06.11 wgen=-1
22717 :: OM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 ABORT reason=CONCURRENCY_LIMIT state=S5_GATE_CHECK poi=Daily-POC dir=LONG
22718 :: GH	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.11 14:40 state=S5_GATE_CHECK dir=LONG predicate=CONCURRENCY_LIMIT
22719 :: GH	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S5_GATE_CHECK->ABORT dir=LONG poi=Daily-POC
FOLLOW_N=13
--- NTC k=22 line=22946 ---
22946 :: NG	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] UJA2NEAR bar=2026.06.11 15:15 dir=LONG line=Daily-POC L=160.531 c1=160.530 thruPts=1
22950 :: CP	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] UJALIGN_PASS bar=2026.06.11 15:15 dir=LONG m15=1.0
22952 :: KM	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] 2026.06.11 15:20:00 STATE S4_ARMED->S5_GATE_CHECK dir=LONG poi=Daily-POC
22966 :: PS	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 15:15 site=S5 dir=LONG branch=1SWING fracAnchorShift=9 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-73 deltaFracNuancePts=9 fracS
22971 :: IN	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] SLIMBR bar=2026.06.11 15:15 dir=LONG entry=160.543 tp=160.587 slToday=160.498 rToday=0.98 dTodayPts=0 slBase=160.425 rBase=0.37 dBasePts=-73 slNuance=160.498 rNuance=0.98 dNuancePts=0 slFractal
23074 :: DQ	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.06.11 15:15 dir=LONG sessUsed=0 divLatch=0 cqd=UNREAD confirm=S4_ARMED slRef=160.501 rLive=1.05 livePass=1
23080 :: NI	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] 2026.06.11 15:20:00 SIGNAL dir=LONG poi=Daily-POC regime=TREND div=regular sess=NYAM tp_target=160.587 tp_R=1.05 sl_ref=160.501 sl_mode=1-swing spreadPts=3 bid=160.543 ask=160.546
23081 :: HL	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.11 15:15 dir=LONG tp=160.587 r=1.05 sl=160.501 mode=1SWING div=regular
23083 :: HF	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-POC | NYAM | R=1.05 SL 160.501 TP 160.587 spr=3
23085 :: HH	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] UJ1R bar=2026.06.11 15:15 src=FIRE entry=160.543 sl=160.501 tp=160.587 risk=0.042 reward=0.044 R=1.05 verdict=PASS
23090 :: RO	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] 2026.06.11 15:20:00 ABORT reason=CONCURRENCY_LIMIT state=S5_GATE_CHECK poi=Daily-POC dir=LONG
23091 :: JJ	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.11 15:20 state=S5_GATE_CHECK dir=LONG predicate=CONCURRENCY_LIMIT
23092 :: JJ	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] 2026.06.11 15:20:00 STATE S5_GATE_CHECK->ABORT dir=LONG poi=Daily-POC
FOLLOW_N=12
--- NTC k=23 line=22951 ---
22951 :: PH	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] UJA2NEAR bar=2026.06.11 15:15 dir=LONG line=Daily-POC L=160.531 c1=160.530 thruPts=1
22952 :: KM	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] 2026.06.11 15:20:00 STATE S4_ARMED->S5_GATE_CHECK dir=LONG poi=Daily-POC
22966 :: PS	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 15:15 site=S5 dir=LONG branch=1SWING fracAnchorShift=9 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-73 deltaFracNuancePts=9 fracS
22971 :: IN	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] SLIMBR bar=2026.06.11 15:15 dir=LONG entry=160.543 tp=160.587 slToday=160.498 rToday=0.98 dTodayPts=0 slBase=160.425 rBase=0.37 dBasePts=-73 slNuance=160.498 rNuance=0.98 dNuancePts=0 slFractal
23074 :: DQ	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.06.11 15:15 dir=LONG sessUsed=0 divLatch=0 cqd=UNREAD confirm=S4_ARMED slRef=160.501 rLive=1.05 livePass=1
23080 :: NI	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] 2026.06.11 15:20:00 SIGNAL dir=LONG poi=Daily-POC regime=TREND div=regular sess=NYAM tp_target=160.587 tp_R=1.05 sl_ref=160.501 sl_mode=1-swing spreadPts=3 bid=160.543 ask=160.546
23081 :: HL	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.11 15:15 dir=LONG tp=160.587 r=1.05 sl=160.501 mode=1SWING div=regular
23083 :: HF	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-POC | NYAM | R=1.05 SL 160.501 TP 160.587 spr=3
23085 :: HH	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] UJ1R bar=2026.06.11 15:15 src=FIRE entry=160.543 sl=160.501 tp=160.587 risk=0.042 reward=0.044 R=1.05 verdict=PASS
23090 :: RO	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] 2026.06.11 15:20:00 ABORT reason=CONCURRENCY_LIMIT state=S5_GATE_CHECK poi=Daily-POC dir=LONG
23091 :: JJ	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.11 15:20 state=S5_GATE_CHECK dir=LONG predicate=CONCURRENCY_LIMIT
23092 :: JJ	0	11:27:21.302	Core 04	2026.06.11 15:20:00   [SRJ-EA] 2026.06.11 15:20:00 STATE S5_GATE_CHECK->ABORT dir=LONG poi=Daily-POC
FOLLOW_N=11
SIGNAL_JUN08_N=0
Read-off: 3 passes fired after the allowance (06-05 09:20 SHORT R=2.27 to SIGNAL; 06-11 14:40 LONG R=2.74 to SIGNAL plus ADMIT; 06-11 15:20 LONG R=1.05 to SIGNAL); 4 passes aborted on LTF-misalign or 1R-fail downstream; 2 died on 15-minute direction; 4 (06-08) printed with no follow-up rows at all. Full per-row follow-ups pasted above.

## Step 7 the 11 June 14:40 pass, raw (new journal 22656 onward, 178 rows, to the first 14:45 row)
22542 :: PJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   Alert: USDJPY M5 - POI RETEST LONG at 160.523  [D-POC +1]
22543 :: JF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
22544 :: CS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ][T155][OBPROV] code=3 id=3117 bar=107659 flag=false
22545 :: RQ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ][T155][OBPROV] code=3 id=3105 bar=107659 flag=false
22546 :: OK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ][T155][OBPROV] code=8 id=0 bar=107659 flag=true
22547 :: EJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:35 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=107050 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=32 ticktime=2026.06.11 14:40:22 lag=chartTime-1bar
22548 :: PM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] IDCHANGE bar=2026.06.11 14:35 inWin=1 state=S4_ARMED dir=SHORT xobId=3091->3070 fvgId=0->0 xobLo=160.489 xobHi=160.504 cumX=348 cumF=0 bars=2481
22549 :: GK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFFLIP bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF bias turned against the locked direction
22550 :: KN	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFDIAG bar=2026.06.11 14:35 dir=SHORT state=S4_ARMED kind=STRONG ok0=1 bias0=1 ob0=1 fvg0=1 opp0=0 ok1=1 bias1=-1 ob1=1 fvg1=1 opp1=0
22551 :: MG	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERABORT bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF opposed, abort deferred past evaluation (Fix S-a)
22552 :: IP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SWEPTMASK bar=2026.06.11 14:35 raw=3429125.0 m=3429125 swept=1010000011 live=0010
22553 :: HL	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:35 line=Daily-POC anchor=Daily-POC
22554 :: RS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:35 line=Daily-VWAP anchor=Daily-POC
22555 :: RN	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:35 line=Daily-POC anchor=Daily-POC
22556 :: DE	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:35 line=Daily-VWAP anchor=Daily-POC
22557 :: LE	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] TPCENSUS #205 bar=2026.06.11 14:35 dir=SHORT ref=160.524 winner=YLOL best=160.493 distPts=31 empties=8 admitted= PDL:288 ASL:99 LOL:31 NYL:17 PML:72 YASL:99 YLOL:31 YNYL:201 YPML:72 LIVE:1469 LIVE:1721 PD:1469 PD:1721 LIVE:1543 LIVE:1736 LIVE:1781 LIVE:2166 PD:1781 PD:2166 LIVE:1741 LIVE:1859 PD:1741 PD:1859 LIVE:1496 LIVE:1667 LIVE:1380 LIVE:1522 LIVE:1566 LIVE:1913 LIVE:1443 LIVE:1716 LIVE:1423 LIVE:1686 LIVE:1423 LIVE:1653 LIVE:1273 LIVE:1874 LIVE:1436 LIVE:1744 LIVE:1540 
22558 :: NO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLEXT481 fields=17 bar=2026.06.11 14:35 site=S2POLL dir=SHORT ladOriginPx=160.526 ladOriginBarTime=2026.06.11 14:35 ladOriginSite=S2POLL ext1Defined=1 slExt1=160.552 ext1Slot=15 ext1BarTime=2026.06.11 13:20 ext1Imb=0 deepestExt=3 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
22559 :: JN	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SWINGPICK site=S2POLL dir=SHORT barShift=1 close=160.526 haveHigh=1 SH=160.534 atShift=6 haveLow=1 SL=160.507 atShift=1
22560 :: OP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLSRC site=S2POLL dir=SHORT src=FALLBACK_SIDE obStruct=160.489 obSwing=160.488 nearest=160.534 chosen=160.534 deltaPts=1
22561 :: QG	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=160.534 distPts=8 site=S2POLL zoneLo=160.545 zoneHi=160.572
22562 :: QR	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMB fields=19 bar=2026.06.11 14:35 site=S2POLL dir=SHORT branch=1SWING obValid=1 slRef=160.534 slShift=6 slShiftT=2026.06.11 14:05 latestFlag=0 latestShift=6 latestShiftT=2026.06.11 14:05 latestAvail=1 latestApexMatch=1 chosenFlag=0 chosenShift=6 chosenShiftT=2026.06.11 14:05 chosenAvail=1 nuanceClass=OB_VALID_LATEST_NOIMB cands=-
22563 :: NP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBWALK fields=27 bar=2026.06.11 14:35 site=S2POLL dir=SHORT branch=1SWING slToday=160.534 slBase=160.587 slNuance=160.587 deltaBasePts=53 deltaNuancePts=53 walkSteps=13 code2Seen=1 exhausted=0 skipShift=15 skipVal=160.552 skipFlag=0 bodyExt=160.549 extUpdatedByNonQual=2 code3Seen=0 sideViolations=0 todayEqBase=0 todayEqNuance=0 baseEqNuance=1 class=BASE_MOVED outwardBasePts=53 outwardNuancePts=53 skipShiftT=2026.06.11 13:20 startShiftT=2026.06.11 14:05
22564 :: IP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:35 site=S2POLL dir=SHORT branch=1SWING fracAnchorShift=6 fracAnchorFlag=0 slFractal=160.587 slFractalNuance=160.587 deltaFracPts=53 deltaFracNuancePts=53 fracSteps=13 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=2 fracClass=BASE_MOVED sideFracViolations=0 outwardFracPts=53 outwardFracNuancePts=53 fracAnchorRawShift=6 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:05 fracSkip=15 fracSkipT=2026.06.11 13:20
22565 :: HR	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SEL61SRC site=S2POLL bar=2026.06.11 14:35 branch=SLREF_1SWING def=1 value=160.534 mode=1 scope=IN_SCOPE_RULE aux=-
22566 :: PD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6TERM class=SELECTED bar=2026.06.11 14:35 shift=1 site=S2POLL dir=SHORT mode=1SWING px=160.534 ok=1 slot=6
22567 :: FK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SEL52CTX seq=284 bar=2026.06.11 14:35 site=S2POLL dir=SHORT oPx=160.526 oBT=2026.06.11 14:35 slRef=160.534 mode=1 halt=-
22568 :: ML	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLMEMO bar=2026.06.11 14:35 site=S2POLL result=COMPUTE ok=1 slRef=160.534 mode=1 computes=228 hits=53 genID=228 wrSite=S2POLL wrOrigin=evalClose
22569 :: NK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJ1R bar=2026.06.11 14:35 src=POLL entry=160.524 sl=160.534 tp=160.493 risk=0.010 reward=0.031 R=3.10 verdict=PASS
22570 :: KO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] ZONESHADOW bar=2026.06.11 14:35 dir=SHORT close=160.524 zoneLo=160.545 zoneHi=160.572 gapPts=21 slRef=160.534 tp=160.493 R_close=3.10 tpInGap=0 shadow= near=4.73/sl0/tp1 mid=2.67/sl0/tp1 far=2.08/sl0/tp1 
22571 :: GO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:35 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
22572 :: LD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:35 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
22573 :: OI	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:35 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
22574 :: RF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=77 cum_opp=20 cum_hi=7 cum_both=4 action=HELD
22575 :: CG	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
22576 :: IF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDTTERMS bar=2026.06.11 14:35 Daily-POC=LHIT/Sbody-above Daily-VWAP=LHIT/Sbody-above Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
22577 :: EP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTDIAG bar=2026.06.11 14:35 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:227.0pts
22578 :: GI	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
22579 :: ER	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:35 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
22580 :: GF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJA2NEAR bar=2026.06.11 14:35 dir=LONG line=Daily-POC L=160.523 c1=160.522 thruPts=1
22581 :: PD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJSBTELEM bar=2026.06.11 14:35 dir=SHORT have=1 sbDir=LONG sbLine=0 confC=1 confH=0 sbL=160.523 o1=160.525 c1=160.522 c0=160.526 arm=1 termC= termH=A_OPP - contender evaluation (Fix S3)
22582 :: RI	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1C_YIELD bar=2026.06.11 14:35 from=Daily-POC fromDir=SHORT to=Daily-POC toDir=LONG state=S4_ARMED term=
22583 :: QE	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERDROP bar=2026.06.11 14:35 dir=LONG poi=Daily-POC - deferred LTF abort dropped, holder changed (Fix S-a)
22584 :: PQ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] ZONEID bar=2026.06.11 14:35 site=S4RQZ xobId=3070 fvgId=0
22585 :: QQ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] ZONEADOPT bar=2026.06.11 14:35 dir=LONG adopt=0 via=none newLo=160.489 newHi=160.504 barLo=160.513 barHi=160.528 sw1=160.507@1 sw2=-@-1
22586 :: KF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] LEGTOUCH bar=2026.06.11 14:35 dir=LONG found=0 atShift=-1 atBar=- legBound=none zoneLo=0.000 zoneHi=0.000 touchSeen=0
22587 :: RJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.11 14:35 dir=LONG zoneLo=0.000 zoneHi=0.000
22588 :: PF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJALIGN_PASS bar=2026.06.11 14:35 dir=LONG m15=1.0
22589 :: GK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJA2NEAR bar=2026.06.11 14:35 dir=LONG line=Daily-POC L=160.523 c1=160.522 thruPts=1
22590 :: DJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S4_ARMED->S5_GATE_CHECK dir=LONG poi=Daily-POC
22591 :: GG	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SWEPTMASK bar=2026.06.11 14:35 raw=3429125.0 m=3429125 swept=1010000011 live=0010
22592 :: JO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:35 line=Daily-POC anchor=Daily-POC
22593 :: LR	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:35 line=Daily-VWAP anchor=Daily-POC
22594 :: DI	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:35 line=Daily-POC anchor=Daily-POC
22595 :: FD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:35 line=Daily-VWAP anchor=Daily-POC
22596 :: FH	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] TPCENSUS #206 bar=2026.06.11 14:35 dir=LONG ref=160.524 winner=YLOH best=160.587 distPts=63 empties=8 admitted= PDH:47 ASH:24 LOH:63 NYH:10 PMH:16 YASH:24 YLOH:63 YNYH:5 YPMH:16 
22597 :: EH	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLEXT481 fields=17 bar=2026.06.11 14:35 site=S5 dir=LONG ladOriginPx=160.524 ladOriginBarTime=2026.06.11 14:40 ladOriginSite=S5 ext1Defined=1 slExt1=160.501 ext1Slot=40 ext1BarTime=2026.06.11 11:15 ext1Imb=0 deepestExt=31 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
22598 :: HK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SWINGDUMP #25 site=S5 dir=LONG barShift=1 bar=2026.06.11 14:35 close=160.526 high=160.528 low=160.513 SH[1..10]= - - - - - - 160.534 - 160.534 - | SL[1..10]= - 160.507 - - - - - 160.508 - - 
22599 :: FM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SWINGPICK site=S5 dir=LONG barShift=1 close=160.526 haveHigh=1 SH=160.534 atShift=6 haveLow=1 SL=160.507 atShift=1
22600 :: QK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLSRC site=S5 dir=LONG src=OB_SWING obStruct=160.489 obSwing=160.488 nearest=160.507 chosen=160.488 deltaPts=1
22601 :: PS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=160.488 distPts=38 site=S5 zoneLo=0.000 zoneHi=0.000
22602 :: DR	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMB fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG branch=1SWING obValid=1 slRef=160.488 slShift=110 slShiftT=2026.06.11 05:25 latestFlag=0 latestShift=1 latestShiftT=2026.06.11 14:30 latestAvail=1 latestApexMatch=1 chosenFlag=0 chosenShift=110 chosenShiftT=2026.06.11 05:25 chosenAvail=1 nuanceClass=OB_VALID_LATEST_NOIMB cands=-
22603 :: EO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBWALK fields=27 bar=2026.06.11 14:35 site=S5 dir=LONG branch=1SWING slToday=160.488 slBase=160.425 slNuance=160.488 deltaBasePts=-63 deltaNuancePts=0 walkSteps=2 code2Seen=0 exhausted=0 skipShift=113 skipVal=160.475 skipFlag=0 bodyExt=160.497 extUpdatedByNonQual=1 code3Seen=0 sideViolations=0 todayEqBase=0 todayEqNuance=1 baseEqNuance=0 class=TODAY_EQ_NUANCE outwardBasePts=63 outwardNuancePts=0 skipShiftT=2026.06.11 05:10 startShiftT=2026.06.11 05:25
22604 :: DR	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:35 site=S5 dir=LONG branch=1SWING fracAnchorShift=1 fracAnchorFlag=0 slFractal=160.425 slFractalNuance=160.507 deltaFracPts=-63 deltaFracNuancePts=19 fracSteps=23 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=5 fracClass=CARVEOUT_FIRED sideFracViolations=0 outwardFracPts=63 outwardFracNuancePts=-19 fracAnchorRawShift=1 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:30 fracSkip=40 fracSkipT=2026.06.11 11:1
22605 :: JG	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SEL61SRC site=S5 bar=2026.06.11 14:35 branch=SLREF_1SWING def=1 value=160.488 mode=1 scope=IN_SCOPE_RULE aux=-
22606 :: DE	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6TERM class=SELECTED bar=2026.06.11 14:35 shift=1 site=S5 dir=LONG mode=1SWING px=160.488 ok=1 slot=110
22607 :: MS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SEL52CTX seq=285 bar=2026.06.11 14:35 site=S5 dir=LONG oPx=160.524 oBT=2026.06.11 14:40 slRef=160.488 mode=1 halt=-
22608 :: OD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBR bar=2026.06.11 14:35 dir=LONG entry=160.524 tp=160.587 slToday=160.488 rToday=1.75 dTodayPts=0 slBase=160.425 rBase=0.64 dBasePts=-63 slNuance=160.488 rNuance=1.75 dNuancePts=0 slFractal=160.425 rFractal=0.64 dFracPts=-63 slFractalNuance=160.507 rFractalNuance=3.71 dFracNuancePts=19 class=TODAY_EQ_NUANCE fracClass=CARVEOUT_FIRED slExt1=160.501 rExt1=2.74 survExt1=1 obCarveFired=1 frCarveFired=1
22609 :: DM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBRCARVE bar=2026.06.11 14:35 site=S5 limb=FR ret=160.507 newerShift=40 newerT=2026.06.11 11:15 newerWick=160.501 newerFlag=0 newerBody=160.508 wickMoreExt=1 bodyThru=0
22610 :: QD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=0 rungSlot=0 rungExt=0 shift=1 shiftT=2026.06.11 14:30 barTime=2026.06.11 14:30 px=160.507 wick=160.507 body=160.522 imbCode=0 exceedsPrev=N distPts=19 rungR=3.71 isOBSwing=0 isFracAnchor=1 isTodayRef=0 ladFresh=1
22611 :: QE	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=0 slot=0 rungExt=0 barTime=2026.06.11 14:30 px=160.507 imbCode=0 distPts=19 rungR=3.71
22612 :: CR	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=1 rungSlot=6 rungExt=-1 shift=7 shiftT=2026.06.11 14:00 barTime=2026.06.11 14:00 px=160.508 wick=160.508 body=160.516 imbCode=0 exceedsPrev=B distPts=20 rungR=3.94 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22613 :: IJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=1 slot=6 rungExt=-1 barTime=2026.06.11 14:00 px=160.508 imbCode=0 distPts=20 rungR=3.94
22614 :: FO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=2 rungSlot=19 rungExt=-1 shift=20 shiftT=2026.06.11 12:55 barTime=2026.06.11 12:55 px=160.514 wick=160.514 body=160.523 imbCode=0 exceedsPrev=N distPts=26 rungR=6.30 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22615 :: PM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=2 slot=19 rungExt=-1 barTime=2026.06.11 12:55 px=160.514 imbCode=0 distPts=26 rungR=6.30
22616 :: QI	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=3 rungSlot=39 rungExt=1 shift=40 shiftT=2026.06.11 11:15 barTime=2026.06.11 11:15 px=160.501 wick=160.501 body=160.508 imbCode=0 exceedsPrev=B distPts=13 rungR=2.74 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22617 :: ES	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=3 slot=39 rungExt=1 barTime=2026.06.11 11:15 px=160.501 imbCode=0 distPts=13 rungR=2.74
22618 :: JD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=4 rungSlot=41 rungExt=2 shift=42 shiftT=2026.06.11 11:05 barTime=2026.06.11 11:05 px=160.498 wick=160.498 body=160.509 imbCode=0 exceedsPrev=W distPts=10 rungR=2.42 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22619 :: LG	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=4 slot=41 rungExt=2 barTime=2026.06.11 11:05 px=160.498 imbCode=0 distPts=10 rungR=2.42
22620 :: EP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=5 rungSlot=44 rungExt=-1 shift=45 shiftT=2026.06.11 10:50 barTime=2026.06.11 10:50 px=160.497 wick=160.497 body=160.511 imbCode=0 exceedsPrev=N distPts=9 rungR=2.33 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22621 :: DJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=5 slot=44 rungExt=-1 barTime=2026.06.11 10:50 px=160.497 imbCode=0 distPts=9 rungR=2.33
22622 :: JN	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=6 rungSlot=46 rungExt=3 shift=47 shiftT=2026.06.11 10:40 barTime=2026.06.11 10:40 px=160.494 wick=160.494 body=160.509 imbCode=0 exceedsPrev=B distPts=6 rungR=2.10 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22623 :: RL	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=6 slot=46 rungExt=3 barTime=2026.06.11 10:40 px=160.494 imbCode=0 distPts=6 rungR=2.10
22624 :: KK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=7 rungSlot=48 rungExt=-1 shift=49 shiftT=2026.06.11 10:30 barTime=2026.06.11 10:30 px=160.501 wick=160.501 body=160.509 imbCode=1 exceedsPrev=N distPts=13 rungR=2.74 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22625 :: GQ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=7 slot=48 rungExt=-1 barTime=2026.06.11 10:30 px=160.501 imbCode=1 distPts=13 rungR=2.74
22626 :: ED	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=8 rungSlot=52 rungExt=-1 shift=53 shiftT=2026.06.11 10:10 barTime=2026.06.11 10:10 px=160.493 wick=160.493 body=160.499 imbCode=1 exceedsPrev=B distPts=5 rungR=2.03 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22627 :: RF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=8 slot=52 rungExt=-1 barTime=2026.06.11 10:10 px=160.493 imbCode=1 distPts=5 rungR=2.03
22628 :: CS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=9 rungSlot=69 rungExt=-1 shift=70 shiftT=2026.06.11 08:45 barTime=2026.06.11 08:45 px=160.508 wick=160.508 body=160.509 imbCode=0 exceedsPrev=N distPts=20 rungR=3.94 isOBSwing=1 isFracAnchor=0 isTodayRef=0 ladFresh=1
22629 :: HI	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=9 slot=69 rungExt=-1 barTime=2026.06.11 08:45 px=160.508 imbCode=0 distPts=20 rungR=3.94
22630 :: KO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=10 rungSlot=74 rungExt=-1 shift=75 shiftT=2026.06.11 08:20 barTime=2026.06.11 08:20 px=160.494 wick=160.494 body=160.502 imbCode=0 exceedsPrev=B distPts=6 rungR=2.10 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22631 :: LM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=10 slot=74 rungExt=-1 barTime=2026.06.11 08:20 px=160.494 imbCode=0 distPts=6 rungR=2.10
22632 :: MK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=11 rungSlot=79 rungExt=-1 shift=80 shiftT=2026.06.11 07:55 barTime=2026.06.11 07:55 px=160.495 wick=160.495 body=160.500 imbCode=2 exceedsPrev=B distPts=7 rungR=2.17 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22633 :: RQ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=11 slot=79 rungExt=-1 barTime=2026.06.11 07:55 px=160.495 imbCode=2 distPts=7 rungR=2.17
22634 :: KD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=12 rungSlot=83 rungExt=-1 shift=84 shiftT=2026.06.11 07:35 barTime=2026.06.11 07:35 px=160.499 wick=160.499 body=160.507 imbCode=1 exceedsPrev=N distPts=11 rungR=2.52 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22635 :: MF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=12 slot=83 rungExt=-1 barTime=2026.06.11 07:35 px=160.499 imbCode=1 distPts=11 rungR=2.52
22636 :: KP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=13 rungSlot=90 rungExt=-1 shift=91 shiftT=2026.06.11 07:00 barTime=2026.06.11 07:00 px=160.510 wick=160.510 body=160.512 imbCode=0 exceedsPrev=N distPts=22 rungR=4.50 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22637 :: CK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=13 slot=90 rungExt=-1 barTime=2026.06.11 07:00 px=160.510 imbCode=0 distPts=22 rungR=4.50
22638 :: IL	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=14 rungSlot=96 rungExt=-1 shift=97 shiftT=2026.06.11 06:30 barTime=2026.06.11 06:30 px=160.508 wick=160.508 body=160.515 imbCode=0 exceedsPrev=W distPts=20 rungR=3.94 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22639 :: DO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=14 slot=96 rungExt=-1 barTime=2026.06.11 06:30 px=160.508 imbCode=0 distPts=20 rungR=3.94
22640 :: JI	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=15 rungSlot=103 rungExt=-1 shift=104 shiftT=2026.06.11 05:55 barTime=2026.06.11 05:55 px=160.508 wick=160.508 body=160.514 imbCode=0 exceedsPrev=N distPts=20 rungR=3.94 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22641 :: NS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=15 slot=103 rungExt=-1 barTime=2026.06.11 05:55 px=160.508 imbCode=0 distPts=20 rungR=3.94
22642 :: CS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=16 rungSlot=109 rungExt=4 shift=110 shiftT=2026.06.11 05:25 barTime=2026.06.11 05:25 px=160.488 wick=160.488 body=160.490 imbCode=0 exceedsPrev=B distPts=0 rungR=1.75 isOBSwing=0 isFracAnchor=0 isTodayRef=1 ladFresh=1
22643 :: FF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=16 slot=109 rungExt=4 barTime=2026.06.11 05:25 px=160.488 imbCode=0 distPts=0 rungR=1.75
22644 :: CO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=17 rungSlot=112 rungExt=5 shift=113 shiftT=2026.06.11 05:10 barTime=2026.06.11 05:10 px=160.475 wick=160.475 body=160.497 imbCode=0 exceedsPrev=W distPts=-13 rungR=1.29 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22645 :: FJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=17 slot=112 rungExt=5 barTime=2026.06.11 05:10 px=160.475 imbCode=0 distPts=-13 rungR=1.29
22646 :: DK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=18 rungSlot=121 rungExt=6 shift=122 shiftT=2026.06.11 04:25 barTime=2026.06.11 04:25 px=160.425 wick=160.425 body=160.442 imbCode=1 exceedsPrev=B distPts=-63 rungR=0.64 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22647 :: RN	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=18 slot=121 rungExt=6 barTime=2026.06.11 04:25 px=160.425 imbCode=1 distPts=-63 rungR=0.64
22648 :: FD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=19 rungSlot=129 rungExt=-1 shift=130 shiftT=2026.06.11 03:45 barTime=2026.06.11 03:45 px=160.517 wick=160.517 body=160.526 imbCode=0 exceedsPrev=N distPts=29 rungR=9.00 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22649 :: CE	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=19 slot=129 rungExt=-1 barTime=2026.06.11 03:45 px=160.517 imbCode=0 distPts=29 rungR=9.00
22650 :: PS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=20 rungSlot=137 rungExt=-1 shift=138 shiftT=2026.06.11 03:05 barTime=2026.06.11 03:05 px=160.494 wick=160.494 body=160.499 imbCode=1 exceedsPrev=B distPts=6 rungR=2.10 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22651 :: JK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=20 slot=137 rungExt=-1 barTime=2026.06.11 03:05 px=160.494 imbCode=1 distPts=6 rungR=2.10
22652 :: JM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=21 rungSlot=141 rungExt=-1 shift=142 shiftT=2026.06.11 02:45 barTime=2026.06.11 02:45 px=160.514 wick=160.514 body=160.524 imbCode=1 exceedsPrev=N distPts=26 rungR=6.30 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22653 :: DL	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=21 slot=141 rungExt=-1 barTime=2026.06.11 02:45 px=160.514 imbCode=1 distPts=26 rungR=6.30
22654 :: KF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=22 rungSlot=147 rungExt=-1 shift=148 shiftT=2026.06.11 02:15 barTime=2026.06.11 02:15 px=160.517 wick=160.517 body=160.532 imbCode=1 exceedsPrev=N distPts=29 rungR=9.00 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22655 :: HS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=22 slot=147 rungExt=-1 barTime=2026.06.11 02:15 px=160.517 imbCode=1 distPts=29 rungR=9.00
22656 :: JR	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=23 rungSlot=153 rungExt=-1 shift=154 shiftT=2026.06.11 01:45 barTime=2026.06.11 01:45 px=160.513 wick=160.513 body=160.520 imbCode=0 exceedsPrev=B distPts=25 rungR=5.73 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22657 :: MF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=23 slot=153 rungExt=-1 barTime=2026.06.11 01:45 px=160.513 imbCode=0 distPts=25 rungR=5.73
22658 :: GO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=24 rungSlot=160 rungExt=-1 shift=161 shiftT=2026.06.11 01:10 barTime=2026.06.11 01:10 px=160.505 wick=160.505 body=160.517 imbCode=0 exceedsPrev=B distPts=17 rungR=3.32 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22659 :: OM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=24 slot=160 rungExt=-1 barTime=2026.06.11 01:10 px=160.505 imbCode=0 distPts=17 rungR=3.32
22660 :: IJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=25 rungSlot=169 rungExt=-1 shift=170 shiftT=2026.06.11 00:25 barTime=2026.06.11 00:25 px=160.477 wick=160.477 body=160.486 imbCode=0 exceedsPrev=B distPts=-11 rungR=1.34 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22661 :: IS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=25 slot=169 rungExt=-1 barTime=2026.06.11 00:25 px=160.477 imbCode=0 distPts=-11 rungR=1.34
22662 :: FG	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=26 rungSlot=171 rungExt=-1 shift=172 shiftT=2026.06.11 00:15 barTime=2026.06.11 00:15 px=160.462 wick=160.462 body=160.475 imbCode=0 exceedsPrev=B distPts=-26 rungR=1.02 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22663 :: MF	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=26 slot=171 rungExt=-1 barTime=2026.06.11 00:15 px=160.462 imbCode=0 distPts=-26 rungR=1.02
22664 :: NL	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=27 rungSlot=174 rungExt=-1 shift=175 shiftT=2026.06.11 00:00 barTime=2026.06.11 00:00 px=160.458 wick=160.458 body=160.467 imbCode=0 exceedsPrev=B distPts=-30 rungR=0.95 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22665 :: NI	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=27 slot=174 rungExt=-1 barTime=2026.06.11 00:00 px=160.458 imbCode=0 distPts=-30 rungR=0.95
22666 :: NH	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=28 rungSlot=179 rungExt=-1 shift=180 shiftT=2026.06.10 23:35 barTime=2026.06.10 23:35 px=160.521 wick=160.521 body=160.525 imbCode=2 exceedsPrev=N distPts=33 rungR=21.00 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22667 :: FM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=28 slot=179 rungExt=-1 barTime=2026.06.10 23:35 px=160.521 imbCode=2 distPts=33 rungR=21.00
22668 :: FD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=29 rungSlot=192 rungExt=-1 shift=193 shiftT=2026.06.10 22:30 barTime=2026.06.10 22:30 px=160.507 wick=160.507 body=160.509 imbCode=0 exceedsPrev=B distPts=19 rungR=3.71 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22669 :: LE	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=29 slot=192 rungExt=-1 barTime=2026.06.10 22:30 px=160.507 imbCode=0 distPts=19 rungR=3.71
22670 :: RS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=30 rungSlot=201 rungExt=-1 shift=202 shiftT=2026.06.10 21:45 barTime=2026.06.10 21:45 px=160.452 wick=160.452 body=160.466 imbCode=0 exceedsPrev=B distPts=-36 rungR=0.87 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22671 :: GJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=30 slot=201 rungExt=-1 barTime=2026.06.10 21:45 px=160.452 imbCode=0 distPts=-36 rungR=0.87
22672 :: QH	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=31 rungSlot=204 rungExt=-1 shift=205 shiftT=2026.06.10 21:30 barTime=2026.06.10 21:30 px=160.467 wick=160.467 body=160.471 imbCode=0 exceedsPrev=N distPts=-21 rungR=1.11 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22673 :: OM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=31 slot=204 rungExt=-1 barTime=2026.06.10 21:30 px=160.467 imbCode=0 distPts=-21 rungR=1.11
22674 :: GE	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=32 rungSlot=208 rungExt=-1 shift=209 shiftT=2026.06.10 21:10 barTime=2026.06.10 21:10 px=160.472 wick=160.472 body=160.480 imbCode=0 exceedsPrev=N distPts=-16 rungR=1.21 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22675 :: EP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=32 slot=208 rungExt=-1 barTime=2026.06.10 21:10 px=160.472 imbCode=0 distPts=-16 rungR=1.21
22676 :: OR	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=33 rungSlot=217 rungExt=-1 shift=218 shiftT=2026.06.10 20:25 barTime=2026.06.10 20:25 px=160.478 wick=160.478 body=160.479 imbCode=0 exceedsPrev=N distPts=-10 rungR=1.37 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22677 :: DK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=33 slot=217 rungExt=-1 barTime=2026.06.10 20:25 px=160.478 imbCode=0 distPts=-10 rungR=1.37
22678 :: FO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=34 rungSlot=222 rungExt=-1 shift=223 shiftT=2026.06.10 20:00 barTime=2026.06.10 20:00 px=160.458 wick=160.458 body=160.468 imbCode=1 exceedsPrev=B distPts=-30 rungR=0.95 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22679 :: RN	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=34 slot=222 rungExt=-1 barTime=2026.06.10 20:00 px=160.458 imbCode=1 distPts=-30 rungR=0.95
22680 :: KD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=35 rungSlot=230 rungExt=-1 shift=231 shiftT=2026.06.10 19:20 barTime=2026.06.10 19:20 px=160.447 wick=160.447 body=160.452 imbCode=2 exceedsPrev=B distPts=-41 rungR=0.82 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22681 :: KQ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=35 slot=230 rungExt=-1 barTime=2026.06.10 19:20 px=160.447 imbCode=2 distPts=-41 rungR=0.82
22682 :: CP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=36 rungSlot=234 rungExt=-1 shift=235 shiftT=2026.06.10 19:00 barTime=2026.06.10 19:00 px=160.441 wick=160.441 body=160.452 imbCode=1 exceedsPrev=W distPts=-47 rungR=0.76 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22683 :: HD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=36 slot=234 rungExt=-1 barTime=2026.06.10 19:00 px=160.441 imbCode=1 distPts=-47 rungR=0.76
22684 :: GN	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=37 rungSlot=240 rungExt=-1 shift=241 shiftT=2026.06.10 18:30 barTime=2026.06.10 18:30 px=160.443 wick=160.443 body=160.453 imbCode=0 exceedsPrev=N distPts=-45 rungR=0.78 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22685 :: MO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=37 slot=240 rungExt=-1 barTime=2026.06.10 18:30 px=160.443 imbCode=0 distPts=-45 rungR=0.78
22686 :: KK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=38 rungSlot=244 rungExt=-1 shift=245 shiftT=2026.06.10 18:10 barTime=2026.06.10 18:10 px=160.455 wick=160.455 body=160.465 imbCode=0 exceedsPrev=N distPts=-33 rungR=0.91 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22687 :: ER	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=38 slot=244 rungExt=-1 barTime=2026.06.10 18:10 px=160.455 imbCode=0 distPts=-33 rungR=0.91
22688 :: ER	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER fields=19 bar=2026.06.11 14:35 site=S5 dir=LONG rung=39 rungSlot=249 rungExt=7 shift=250 shiftT=2026.06.10 17:45 barTime=2026.06.10 17:45 px=160.403 wick=160.403 body=160.415 imbCode=0 exceedsPrev=B distPts=-85 rungR=0.52 isOBSwing=0 isFracAnchor=0 isTodayRef=0 ladFresh=1
22689 :: LG	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADMARK fields=11 bar=2026.06.11 14:35 site=S5 dir=LONG rung=39 slot=249 rungExt=7 barTime=2026.06.10 17:45 px=160.403 imbCode=0 distPts=-85 rungR=0.52
22690 :: OQ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADDER_MATCH fields=14 bar=2026.06.11 14:35 site=S5 dir=LONG rungs=40 todayRung=16 todayRef=ON_LADDER todayResidPts=0 level=- status=NOLEVEL_FILED rung=-1 rungSlot=0 rungExt=-1 rungT=- residPts=0
22691 :: QN	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLEXT1 fields=29 bar=2026.06.11 14:35 site=S5 dir=LONG ext1Defined=1 slExt1=160.501 ext1Slot=40 ext1BarTime=2026.06.11 11:15 ext1Imb=0 deltaExt1Pts=13 outwardExt1Pts=-13 deepestExt=31 todayXi=4 baseXi=6 nuanceXi=4 fracXi=6 fracNuXi=0 anchorXi=0 filedPx=- filedProv=- filedT=- residPts=0 barDiffBars=-999 verdict=NOLEVEL noneSlot=-1 noneT=- refSlotAgeBars=-1 rewardPts=63.00000 riskPts=36.00000 ext1RewardPts=63.00000 ext1RiskPts=23.00000
22692 :: GP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLEXT45 fields=10 bar=2026.06.11 14:35 site=S5 dir=LONG extStatus=EXT_DEFINED todayStatus=ON_LADDER noneSlot=-1 noneT=- refSlotAgeBars=-1 vacStatus=- coverStatus=COVERED ladObligN=6
22693 :: RR	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADCORR fields=23 bar=2026.06.11 14:35 site=S5 dir=LONG ladRungs=40 ladDeepestSlot=249 ladCap=500 ladCapHit=0 ladCovers=1 todayRefSlot=110 baseRefSlot=122 nuanceRefSlot=110 fracRefSlot=122 fracNuanceRefSlot=1 fracAnchorSlot=1 fracAnchorPx=160.507 todayRS=0 baseRS=0 nuanceRS=0 fracRS=0 fracNuanceRS=0 anchorRS=0 fracOffN=0 todayOffN=0
22694 :: LP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLADWIN fields=28 bar=2026.06.11 14:35 site=S5 dir=LONG status=OK todayIsRung=1 baseIsRung=1 nuanceIsRung=1 fracIsRung=1 fracNuIsRung=1 anchorIsRung=1 todaySteps=2 baseSteps=2 nuanceSteps=2 fracSteps=23 fracNuSteps=23 anchorSteps=23 ladWindowStart=1 ladWindowSpan=172 ladReadLimit=500 ladLimitHit=0 ladCovers=1 ladObligN=6 ladRungs=40 ladDeepestSlot=249 walkWinOB=110+500 walkWinFR=1+500 haltRef=- haltSlot=-1
22695 :: JJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] STOPRESOLVE format=2 pkt=PACKET_EXT1LIVE-001-v28 base=6C2E4028 type=NORMAL part=1/3 emitSeq=5 barTime=2026.06.11-14:35 dir=1 entryPx=160.524 tpPx=160.58699999999999 incomingSlRef=160.488 liveSel=2 slLive=160.501 pxExt1=160.501 ext1Defined=1 ext1Imb=0 rLive=2.7391304347825551 rExt1=2.7391304347825551 gateConst=1
22696 :: CI	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] STOPRESOLVE format=2 pkt=PACKET_EXT1LIVE-001-v28 base=6C2E4028 type=NORMAL part=2/3 emitSeq=5 wouldGate=1 vetoStateAtSite=- sessionUseAtSite=- ext1Slot=40 ext1BarTime=2026.06.11-11:15 s0slot=1 s0imb=0 s1slot=40 s1imb=0 ladOriginPx=160.524 ladOriginBarTime=2026.06.11-14:40 ladOriginSite=S5 extSideOk=1
22697 :: RQ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] STOPRESOLVE format=2 pkt=PACKET_EXT1LIVE-001-v28 base=6C2E4028 type=NORMAL part=3/3 emitSeq=5 extDistPts=23 rawNumLive=0.062999999999988177 rawDenLive=0.022999999999996135 rawNumExt1=0.062999999999988177 rawDenExt1=0.022999999999996135 wouldAdopt_monotone=0 actualGate=1 emitSeq=5 currentPrice=160.524 s0px=160.50700000000001 s1px=160.501 ladOriginStamp=2026.06.11-14:35
22698 :: HE	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1E_STOPSHADOW bar=2026.06.11 14:35 dir=LONG s0px=160.507 s0slot=1 s0imb=0 s1px=160.501 s1slot=40 s1imb=0 sel=1 r0=3.71 r1=2.74 liveSl=160.501 livePass=1
22699 :: QG	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1X_STOPREF bar=2026.06.11 14:35 dir=LONG entry=160.524 liveStop=160.501 ruleStop=160.501 ruleSlot=40 ruleImb=0 liveTp=160.587 liveR=2.74 livePass=1
22700 :: NQ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1Y_PDSESS bar=2026.06.11 14:35 dir=LONG entry=160.524 liveTp=160.587 pdAsiaH=160.548 pdAsiaL=160.425 pdLondonH=160.587 pdLondonL=160.493 pdNyH=160.529 pdNyL=160.323 pdPmH=160.540 pdPmL=160.452
22701 :: FM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1O_ELIGSTATE bar=2026.06.11 14:35 dir=LONG sessUsed=0 divLatch=0 cqd=UNREAD confirm=S4_ARMED slRef=160.501 rLive=2.74 livePass=1
22702 :: HD	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1Q_CQDKILL bar=2026.06.11 14:35 dir=LONG obValid=1.0 fvgValid=1.0 cqdDiv=UNREAD
22703 :: JE	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1R_RGATE evalBar=2026.06.11 14:35 seedBT=2026.06.11 14:35 dir=LONG seedBiasAl=1 rLive=2.74 livePass=1 slRef=160.501
22704 :: NN	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1W_CQDWINDOW evalBar=2026.06.11 14:35 dir=LONG w=U,U,U,U,U,U,U,1,U,U,U,U,U
22705 :: QR	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] TP_ELECT shadow=true entry=160.524 sl=160.501 tp=160.587 R=2.74 bar=2026.06.11 14:35 latchBar=2026.06.11 14:40
22706 :: PK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] ORDER fields=10 bar=1 barTime=2026.06.11 14:35 seqBias=202 seqS5=203 biasAtGate=1 biasOpposedAtGate=0 flipNewThisBar=0 gateOutcome=PASS seqStamp=STAMPED seqCause=-
22707 :: CM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 SIGNAL dir=LONG poi=Daily-POC regime=TREND div=regular sess=NYAM tp_target=160.587 tp_R=2.74 sl_ref=160.501 sl_mode=1-swing spreadPts=6 bid=160.524 ask=160.530
22708 :: JP	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.11 14:35 dir=LONG tp=160.587 r=2.74 sl=160.501 mode=1SWING div=regular
22709 :: KJ	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1F_WATCH bar=2026.06.11 14:35 dir=LONG
22710 :: LS	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ SIGNAL LONG USDJPY M5 | Daily-POC | NYAM | R=2.74 SL 160.501 TP 160.587 spr=6
22711 :: RO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJ1R bar=2026.06.11 14:35 src=FIRELOCAL entry=160.524 sl=160.501 tp=160.587 risk=0.023 reward=0.063 R=2.74 verdict=PASS
22712 :: II	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJ1R bar=2026.06.11 14:35 src=FIRE entry=160.524 sl=160.501 tp=160.587 risk=0.023 reward=0.063 R=2.74 verdict=PASS
22713 :: LO	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJMEMO_PASS bar=2026.06.11 14:35 admit_key=2026.06.11 14:35:4 entry=160.524 tp=160.587 sl=160.501 R=2.74 src=FIRELOCAL wsrc=LOH wday=2026.06.11 wgen=-1
22714 :: CE	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] MTSNAP bar=2026.06.11 14:35 dir=LONG anchor=Daily-POC entry=160.524 sl=160.501 tp=160.587 regime=1
22715 :: HL	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJADMIT bar_key=2026.06.11 14:35 trade_seq=4 admit_bar=2026.06.11 14:35 entry=160.524 sl=160.501 tp=160.587 R=2.74 poolGen=-1 wsrc=LOH wday=2026.06.11 wage=0
22716 :: DK	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] EXECUTE_ACCT mode=0 login=1359506594
22717 :: OM	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 ABORT reason=CONCURRENCY_LIMIT state=S5_GATE_CHECK poi=Daily-POC dir=LONG
22718 :: GH	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.11 14:40 state=S5_GATE_CHECK dir=LONG predicate=CONCURRENCY_LIMIT
22719 :: GH	0	11:27:15.199	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S5_GATE_CHECK->ABORT dir=LONG poi=Daily-POC
FIRST1445 :: 22720 :: FJ	0	11:27:15.199	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
Trader words: the pass cancelled the old short, handed the slot to the long (yield plus dropped abort), aligned on the 15-minute, walked to the S5 gate, printed the full entry SIGNAL at 160.524 with reward 2.74, admitted it in the books, then refused the broker order because the 5 June long was still floating (concurrency guard), and stood down. The filed price printed; no broker deal exists by the guard, not by any selection rule.

## STOP rules (evaluated after Step 5, before anything else): filed deal #4 changed in time (09:45 to 09:20), price (159.948 to 159.959) and size (6.74 to 6.22): STOP TRIGGER 1 FIRED. 8 June silent: yes. New deal elsewhere: none. Action taken: RESTORED the EA from preB8 this turn (Copy-Item literal, no second attempt).

## Step 8 restore state (restored per STOP rule, then verified)
- EA on disk: ORIGINAL preB-8 tree (B-7 kept build), SHA-256 F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582; git diff --no-index preB8 vs EA: empty (byte-identical).
- EX5 on disk: still the B-8 build 0D78C1C876326FD76161B5CBF217487534114D2459F95A0DE426BEC0FBD0300A (compiled from the trial source after the edit, before the run). EX5 does NOT match the restored EA source; the next authorized compile overwrites it as usual.
- EA, .preB8, indicator, Include/SRJ and journals: uncommitted and unpushed by relay order; only BUILDER_RESULT_B8.md ships (Step 9).

## Carried note (operator order 2026-10-04, for the next relay I make): his 2026-09-23 no-wiggle rule (no tolerancy in his trading rules) stands against the 1-point allowance on its face; the planner owes his two answers (what the edit forgives with exact prices; whether it contradicts the rule, answered from his words, never from code) before anything is built on any tolerance. The trial is restored; nothing stands on the allowance.
