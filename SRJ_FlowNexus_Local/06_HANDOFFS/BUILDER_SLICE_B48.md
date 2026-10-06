# BUILDER SLICE B-48 - raw rows behind P1, R3, R4 and R6 (payloads only)

Disk EA = 63B18C1F (680981 B, untouched; no edit, no compile). Audit script Scripts/SRJ_TickAudit.mq5 (SHA 7AD6ABEF, 21814 B, v1.01 read-only) + ex5 (SHA 7C8946D8, 62488 B) reused unchanged.

## 0.4 gate (false STOP-A forensics; corrected gate accepted)
- Relay-expected: ledger B2BD5DC0 / 1125814 B; journal 261EBD8F / 147897 B.
- Disk: ledger 51B748EB / 1125825 B (11 CRLF, body LF; normalized 1125814 B = b2bd5dc0); journal 15E568D4 / 148956 B / 1060 lines (1059 CRLF + 1 LF; normalized 147897 B = 261ebd8f).
- git status --short -- ledger/journal = empty; git diff --stat = empty. Content identical, line-endings only.
- All other gate SHAs MATCH (pointer 5B85ADB6, RESULT_B47 DEC6BECA, SLICE_B47 0B354608, register C1E4AEDE, strategy 7762E905, context AADEEC80, TickAudit 7AD6ABEF/7C8946D8, EA 63B18C1F/B0D4AA9E, FlowLogic 956BF3E3/27B5F272, BiasEngine 3B1D9D3D, OrderblockMgr 5D14FCE2, Draw FD2B3716, HTFEngine D5FD5B06, relay-skill disk 90AD274E = accounted YOLO line).
- terminal.ini ..\config\terminal.ini SHA 450ACB4A4C07F689EF08E1EA557E889E47B5C450A7D62EA4772D36EBC99444C1 (20447 B; == preB48 copy; B-47 restored value). Profiles live 137 files, tree SHA 83439d43 (sorted rel-path + file-SHA method); Profiles.preB48 137 files identical at copy time. No terminal64 running at R0.
- 0.6 planner reading: AGREE by text (WriteDayRows line 567 after AuditSymbol line 537 inside symbol loop; hGaps = OpenCsv line 587 after loop; per-day 24 hourly ReadTicks lines 286-318 + ReadBars line 320 + src ReadBars line 326).

## P1 grep counts (Experts/SRJ_FlowNexus_EA.mq5 disk 63B18C1F)
- S2SEEDBIAS_KILL: 1 hit (line 8465).
- SEEDBIAS_REFUSED: 2 hits (line 409 define; line 8465 via ABORT_SEEDBIAS_REFUSED).

## P1 hit 1/1 + 1/2: line 409 with 15 lines either side (394-424)
394: #define ABORT_DEMO_GUARD       "DEMO_GUARD"
395: #define ABORT_BELOW_STOPS      "BELOW_STOPS"
396: //--- TASK 21 (EA-21): S5_NO_SL_REF and S5_NO_TP_TARGET previously aborted
397: //--- with reason=TP_RR_FAIL, which misattributes the cause in the journal.
398: //--- These two codes are diagnostic only - no gate reads a reason string.
399: #define ABORT_NO_SL_REF        "NO_SL_REF"
400: #define ABORT_NO_TP_TARGET     "NO_TP_TARGET"
401: //--- [P-UJIMPL-IMPL-1 v8 IE7/IE9] fire-path abort reasons (print + abort)
402: #define ABORT_SUB_1R           "SUB_1R"
403: #define ABORT_NO_MEMO_AT_FIRE  "NO_MEMO_AT_FIRE"
404: #define ABORT_MEMO_IDENTITY  "MEMO_IDENTITY"
405: //--- [Task 78] Part A Step 8 / D-3 / G-2 replacement. Diagnostic string only;
406: //--- no gate reads an abort reason.
407: #define ABORT_POI_REPLACED     "POI_REPLACED"
408: #define ABORT_DIV_FALLBACK     "DIV_FALLBACK"
409: #define ABORT_SEEDBIAS_REFUSED "SEEDBIAS_REFUSED"
410: #define ABORT_HOLDER_EXPIRED   "HOLDER_EXPIRED"
411:
412: //====================== [Task 160] Migration data contracts ==========
413: // Twelve data contracts as an INERT ARCHITECTURE SHELL. Types only.
414: // Nothing declares an instance and nothing reads a field, so this block
415: // emits no code and the Tier 1 regression is byte-identical by
416: // construction. Specification: COUNCIL_RULING_TASK159.md and
417: // REVISION_60 section 9.
418: //
419: // WHY THESE LIVE IN THE EA AND NOT IN SRJ_Types.mqh (R-103, R-111):
420: // the EA includes exactly two files, SRJ_TickCore.mqh and
421: // Trade\Trade.mqh, and SRJ_TickCore.mqh includes nothing. No transitive
422: // path reaches SRJ_Types.mqh or SRJ_State.mqh. A contract declared
423: // there would compile in Task 160 and FAIL IN TASK 161. Every consumer
424: // through Milestone 6 is in this file. The EA already carries a

## P1 hit 2/2: line 8465 with 15 lines either side (8450-8480)
8450:       bool aligned;
8451:       if(!CheckLtfAlign(barShift, g_dir, aligned))
8452:         { GoAbort(ABORT_UPSTREAM_UNREADY, g_state); return; }
8453:       if(!aligned)
8454:         {
8455:          double uj_m15b = 0.0;
8456:          bool uj_m15r = ReadFlow(FL_BUF_HTF_LOW, uj_m15b, barShift);
8457:          double uj_wantb = (g_dir == DIR_LONG ? 1.0 : -1.0);
8458:          if(InpDebugLog) PrintFormat("[SRJ-EA] UJPROV bar=%s dir=%s reseedBar=%s seedBiasAl=%d reseedDir=%d exempt=%d - reseed provenance at S2 edge (Fix CARRY)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), TimeToString(g_ujOpReseedBarTime, TIME_DATE|TIME_MINUTES), s1g_seedBiasAl, g_ujOpReseedDir, ((uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0))))) ? 1 : 0));
8459:          if(uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0)))))
8460:            { double uj_ltfb = 0.0; int uj_ltfOk = ReadFlow(FL_BUF_LTF_BIAS, uj_ltfb, barShift) ? 1 : 0;
8461:              int uj_m15s = (int)iTime(_Symbol, PERIOD_CURRENT, barShift);
8462:              datetime uj_m15src = (datetime)(uj_m15s - uj_m15s % 900);
8463:              if(InpDebugLog) PrintFormat("[SRJ-EA] S2PROMOTE_M15 bar=%s dir=%s poi=%s sess=%s m15=%s m15src=%s ltf=%s sb=%d rf=%d/%d", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry), DoubleToString(uj_m15b, 1), TimeToString(uj_m15src, TIME_DATE|TIME_MINUTES), UjDbl(uj_ltfb), s1g_seedBiasAl, (uj_m15r ? 1 : 0), uj_ltfOk); }
8464:          else if(uj_m15r && uj_m15b == uj_wantb)
8465:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2SEEDBIAS_KILL bar=%s dir=%s poi=%s - seedbias refused, promotion killed (Fix B2)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr()); GoAbort(ABORT_SEEDBIAS_REFUSED, g_state); return; }
8466:          else
8467:            { if(InpDebugLog) PrintFormat("[SRJ-EA] S2WAIT bar=%s dir=%s poi=%s sess=%s - LTF bias unaligned, candidate RETAINED (Stage 3a)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), AnchorStr(), SessionName(g_sessionAtEntry)); return; }
8468:         }
8469:       ENUM_SRJ_STATE prev = g_state;
8470:       g_state = ST_S3_ZONE_WAIT;
8471:       LogState(prev, g_state);
8472:      }
8473:        //--- [v20 S-b] contender evaluation (self-contained; transfer shape mirrors EA-7813-7829, cited, not pasted).
8474:        if(g_state == ST_S3_ZONE_WAIT || g_state == ST_S4_ARMED) {
8475:        bool uj_sbHave = false; ENUM_SRJ_DIR uj_sbDir = DIR_NONE; int uj_sbLine = -1;
8476:        {
8477:         PoiRetestResult uj_sbPr;
8478:         if(DetectPoiRetest(barShift, uj_sbPr) && uj_sbPr.found)
8479:           { uj_sbHave = true; uj_sbDir = uj_sbPr.isLong ? DIR_LONG : DIR_SHORT; uj_sbLine = uj_sbPr.topLine; }
8480:        }

## P1 step 3: NEW-seed path after S2SEEDBIAS_KILL (ST_IDLE block, EA 8114-8196; GoAbort 6673-6676 sets ST_ABORT then ResetSequence 6616 sets ST_IDLE)
8114:     bool s1f_seedArmed = (g_state == ST_IDLE);   //--- [SIDE1F] (i) seed-bar exactness flag (new local only)
8116:     if(g_state == ST_IDLE)
8117:       {
8118:        if(!inWindow) { return; }
8119:       if(SessionAlreadyUsed(sess, barTime))
8120:         {
8121:          static datetime s_limitDay  = 0;
8122:          static int      s_limitSess = -1;
8123:          datetime dayKey = TC_DayStart(barTime);
8124:          if(InpDebugLog && (dayKey != s_limitDay || (int)sess != s_limitSess))
8125:            {
8126:             s_limitDay  = dayKey;
8127:             s_limitSess = (int)sess;
8128:             PrintFormat("[SRJ-EA] %s SESSION_LIMIT: %s window already used today - "
8129:                         "all further candidates suppressed until the next window",
8130:                         TimeToString(TimeCurrent(), TIME_DATE|TIME_SECONDS),
8131:                         SessionName(sess));
8132:            }
8133:          return;
8134:         }
8136:         PoiRetestResult pr;
8137:         if(!DetectPoiRetest(barShift, pr) || !pr.found) { return; }
8138:         //--- [P-RESQUAT-1 F-a] eviction-paired read gate (same line/dir/session/day may not re-seed; slot stays free)
8144:         ENUM_SRJ_DIR rsq_dir = pr.isLong ? DIR_LONG : DIR_SHORT;
8145:         int rsq_bit = (pr.topLine >= 0 && pr.topLine < POI_NLINES) ? pr.topLine * 2 + (pr.isLong ? 0 : 1) : -1;
8146:         bool rsq_blocked = false;
8147:         datetime rsq_day = TC_DayStart(barTime);
8148:         if(rsq_bit < 0)
8149:           {
8150:            PrintFormat("[SRJ-EA] RESEED_BLOCKED bar=%s action=INDEX-INVALID", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES));
8151:            return;
8152:           }
8153:         if(sess == SESSION_LONDON)
8154:           {
8155:            if(rsq_day != g_evictDayLon) g_evictBitsLon = 0;
8156:            else if(rsq_bit >= 0 && (g_evictBitsLon & (1 << rsq_bit)) != 0) rsq_blocked = true;
8157:           }
8158:         else if(sess == SESSION_NYAM)
8159:           {
8160:            if(rsq_day != g_evictDayNY) g_evictBitsNY = 0;
8161:            else if(rsq_bit >= 0 && (g_evictBitsNY & (1 << rsq_bit)) != 0) rsq_blocked = true;
8162:           }
8163:         if(rsq_blocked)
8164:           {
8165:            PrintFormat("[SRJ-EA] RESEED_BLOCKED bar=%s poi=%s dir=%s sess=%s evictedDay=%s action=SKIP",
8166:                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
8167:                        g_lineCode[pr.topLine], DirName(rsq_dir), SessionName(sess),
8168:                        TimeToString(rsq_day, TIME_DATE));
8169:            return;
8170:           }
8171:         s1g_legDir = pr.isLong ? 1 : -1;
8172:         g_s2_seedShift = barShift;
8173:          g_anchorLine    = pr.topLine;
8178:        g_dir           = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);
8180:       g_anchorBarTime = barTime;
8181:       ReadBuf1(g_hPoi, pr.topLine, g_anchorPrice, barShift);
8182:       g_sessionAtEntry = sess;
8183:       g_divLatch = false;
8184:       ENUM_SRJ_STATE prev = g_state;
8185:       g_state = ST_S1_REGIME;
8186:       LogState(prev, g_state);
8190:       if(InpDebugLog)
8191:          PrintFormat("[SRJ-EA] ANCHOR_ELECT bar=%s action=SEED poi=%s rank=%d tier=%d dir=%s",
8192:                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift),
8193:                                   TIME_DATE|TIME_MINUTES),
8194:                      AnchorStr(), g_authorityRank[g_anchorLine],
8195:                       B3_AnchorTier(g_anchorLine), DirName(g_dir));
8196:          }
6643: void GoAbort(const string reason, ENUM_SRJ_STATE atState)
6673:    ENUM_SRJ_STATE prev = g_state;
6674:    g_state = ST_ABORT;
6675:    LogState(prev, g_state);
6676:    ResetSequence();
6616:    g_state          = ST_IDLE;
(6614-6641 ResetSequence clears dir/anchor/session/latch; S2SEEDBIAS_KILL site 8465 returns same-bar so no same-bar reseed; next-bar IDLE block above is the only NEW-seed path. SEEDBIAS aborts set no evict bits (evict ARM only at 9371-9373 for DIV_FALLBACK).)

## P1 step 4: j32 S5 day-log rows 5 June 16:05-16:25 (Tester/logs/20261006.log, UTF-16; run JUNE-B44-S5 PRE 986649; j32 lines)
1037625 ED 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] UJPROBE bar_key=2026.06.05 16:00 h4=1.0 h1=1.0 m15=1.0 confirmedFeed=1 ltf=-1.0 div=OPPOSING kind=regular readFail=0 empty=106191 zero=0 complete=1 latestNZ=-1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 16:05:00 lag=chartTime-1bar
1037629 NN 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:00 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
1037635 LI 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] 2026.06.05 16:05:00 STATE IDLE->S1_REGIME dir=LONG poi=Daily-POC
1037636 LI 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] ANCHOR_ELECT bar=2026.06.05 16:00 action=SEED poi=Daily-POC rank=10 tier=5 dir=LONG
1037637 CJ 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] SIDE1T_SEEDBIAS bar=2026.06.05 16:00 dir=LONG biasAligned=0 verdict=REJECT-BIAS-TIMING
1037646 MF 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] UJPROV bar=2026.06.05 16:00 dir=LONG reseedBar=1970.01.01 00:00 seedBiasAl=0 reseedDir=0 exempt=0 - reseed provenance at S2 edge (Fix CARRY)
1037647 LO 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] S2SEEDBIAS_KILL bar=2026.06.05 16:00 dir=LONG poi=Daily-POC - seedbias refused, promotion killed (Fix B2)
1037648 FK 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] 2026.06.05 16:05:00 ABORT reason=SEEDBIAS_REFUSED state=S2_LTF_ALIGN poi=Daily-POC dir=LONG
1037649 RF 0 16:46:35.849 Core 04 2026.06.05 16:05:00   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.05 16:05 state=S2_LTF_ALIGN dir=LONG predicate=SEEDBIAS_REFUSED
1037663 JO 0 16:46:35.849 Core 04 2026.06.05 16:10:00   [SRJ-EA] UJPROBE bar_key=2026.06.05 16:05 h4=1.0 h1=1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106191 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 16:10:00 lag=chartTime-1bar
1037667 HJ 0 16:46:35.849 Core 04 2026.06.05 16:10:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:05 hits=0
1037674 IM 0 16:46:35.849 Core 04 2026.06.05 16:15:00   [SRJ-EA] UJPROBE bar_key=2026.06.05 16:10 h4=1.0 h1=1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106192 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 16:15:00 lag=chartTime-1bar
1037676 IF 0 16:46:35.849 Core 04 2026.06.05 16:15:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:10 hits=0
1037683 MP 0 16:46:35.849 Core 04 2026.06.05 16:20:00   [SRJ-EA] UJPROBE bar_key=2026.06.05 16:15 h4=1.0 h1=1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106193 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 16:20:00 lag=chartTime-1bar
1037684 NI 0 16:46:35.849 Core 04 2026.06.05 16:20:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:15 hits=0
1037690 JP 0 16:46:35.849 Core 04 2026.06.05 16:25:00   [SRJ-EA] UJPROBE bar_key=2026.06.05 16:20 h4=1.0 h1=1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=106194 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=28 ticktime=2026.06.05 16:25:00 lag=chartTime-1bar
1037691 GI 0 16:46:35.849 Core 04 2026.06.05 16:25:00   [SRJ-EA] RETESTBOOK bar=2026.06.05 16:20 hits=0

## P1 step 5: section-13 words raw (.opencode/skills/srj-strategy/SKILL.md:151)
- JUN05NY-ENTRY-1615 (his words 2026-10-06, answering the B-34 carried question "5 June New York long off the old high: is your entry the 16:15 open or the 16:55 open?", verbatim: "5 June New York long entry is the 16:15 candle open."). Amended point: his 5 June New York USDJPY LONG off the old high (160.723, the 30 April day high; register B row 2) enters at the 16:15 candle open. The 16:55 fill at 160.120 (r78 and j18 deal #6, ENTRY bar 16:50) is the machine's trade, never his entry.

## R2 PRESET texts raw (UTF-16 LE BOM, 366 B each; Presets/SRJ_B48_JUNE.set SHA 999d4a31; Presets/SRJ_B48_SEP.set SHA bd917f03)
SRJ_B48_JUNE.set:
InpSymbols=USDJPY_RAW
InpFrom=1780272000
InpTo=1781395199
InpGapAlertMin=5
InpFullDayMinutes=600
InpHealBackHours=6
InpCheckSource=true
InpWriteCsv=true
InpLogEveryDay=true
SRJ_B48_SEP.set: same with InpSymbols=EURUSD_RAW, InpFrom=1788739200, InpTo=1789084799.

## R2 launch inis raw (LF; B48_JUNE.ini 105 B; B48_SEP.ini 105 B)
B48_JUNE.ini:
[StartUp]
Symbol=USDJPY
Period=M5
Script=SRJ_TickAudit.ex5
ScriptParameters=SRJ_B48_JUNE.set
B48_SEP.ini: same with Symbol=EURUSD, ScriptParameters=SRJ_B48_SEP.set.

## R3 RUN_JUNE header + completion raw (Logs/20261006.log UTF-16; terminal journal ..\logs/20261006.log)
- Journal 21:36:54.579: MQL5 9 inputs read from script 'SRJ_TickAudit.ex5' set file "...MQL5\Presets\SRJ_B48_JUNE.set"
- Journal 21:36:54.595: Scripts script SRJ_TickAudit (USDJPY,M5) loaded successfully (WMI_PID=9052)
- Experts 21:36:54.626: [Audit] server UTC+3:00 | archive now 2026.10.06 17:36 | range 2026.06.01 -> 2026.06.13 (expected range; no STOP-P)
- Experts 21:41:57.652: [Audit] wrote MQL5/Files/SRJ_TickAudit_20261006_days.csv; [Audit] wrote MQL5/Files/SRJ_TickAudit_20261006_gaps.csv; [Audit] audit complete. No data was modified. (5m03s after header; run accepted MEASURED; 3 s over the 5-min STOP-T mark owned as polling granularity)
- Renamed to Files/SRJ_TickAudit_B48_JUNE_days.csv (1203 B) / ..._gaps.csv (317 B). Terminal stopped by PID 9052.
- R5 restore: terminal.ini 450ACB4A == copy byte-exact; Profiles 1 extra deleted (Charts/Default/chart57.chr), 33 files restored, re-compare 0 mismatches; [Tester] June window read back (Expert SRJ_FlowNexus_EA.ex5, USDJPY, Period 5, DateFrom 1780272000, DateTo 1781308800).

## R4 RUN_SEP header + completion raw
- Journal 21:43:36.453: 9 inputs read from '...Presets\SRJ_B48_SEP.set'
- Journal 21:43:36.465: Scripts script SRJ_TickAudit (EURUSD,M5) loaded successfully (WMI_PID=14720)
- Experts 21:43:36.479: [Audit] server UTC+3:00 | archive now 2026.10.06 17:43 | range 2026.09.07 -> 2026.09.10 (expected; no STOP-P)
- Experts 21:47:05.558: [Audit] EURUSD_RAW re-import : 2026.09.07 -> 2026.09.10 (4 days); rebuild : none; weekend : none; day rows 2026.09.07-10 all ticks 0 min 0 bars 0 src 1393/1430/1436/1433 EMPTY
- Experts 21:47:05.559: [Audit] no intraday gaps of 5 min or more found; [Audit] wrote MQL5/Files/SRJ_TickAudit_20261006_days.csv; [Audit] audit complete. No data was modified. (3m29s; no STOP-T)
- Renamed to Files/SRJ_TickAudit_B48_SEP_days.csv (281 B); gaps file never created = GAPS_ABSENT. Terminal stopped by PID 14720.
- R5 restore: terminal.ini 450ACB4A == copy; Profiles 1 extra deleted (chart57.chr), 49 files restored, 0 mismatches; [Tester] June window intact.

## R6 gaps-CSV rows raw
JUNE gaps (Files/SRJ_TickAudit_B48_JUNE_gaps.csv, 317 B):
symbol,gap_from,gap_to,duration
USDJPY_RAW,2026.06.01 00:26:40,2026.06.01 00:32:26,5m
USDJPY_RAW,2026.06.01 00:42:41,2026.06.01 00:49:36,6m
USDJPY_RAW,2026.06.01 07:59:59,2026.06.01 09:00:00,1h00m
USDJPY_RAW,2026.06.05 07:59:58,2026.06.05 09:00:00,1h00m
USDJPY_RAW,2026.06.09 14:59:58,2026.06.09 16:00:00,1h00m
SEP gaps: file never created; log line `no intraday gaps of 5 min or more found` pasted above; GAPS_ABSENT.

## R6 days-CSV non-OK non-CLOSED rows raw
JUNE days (1203 B; CLOSED 06-06/06-07/06-13 omitted):
USDJPY_RAW,2026.06.01,Mon,61254,1355,?,?,2026.06.01 00:00:04,2026.06.01 23:59:59,1h00m,UNREAD_BARS/GAP
USDJPY_RAW,2026.06.02,Tue,40351,1424,?,?,2026.06.02 00:00:00,2026.06.02 23:59:59,,UNREAD_BARS
USDJPY_RAW,2026.06.03,Wed,55194,1435,?,?,2026.06.03 00:00:00,2026.06.03 23:59:59,,UNREAD_BARS
USDJPY_RAW,2026.06.04,Thu,48746,1438,?,?,2026.06.04 00:00:00,2026.06.04 23:59:59,,UNREAD_BARS
USDJPY_RAW,2026.06.05,Fri,62866,1370,?,?,2026.06.05 00:00:00,2026.06.05 23:59:58,1h00m,UNREAD_BARS/GAP
USDJPY_RAW,2026.06.08,Mon,68071,1432,?,?,2026.06.08 00:04:00,2026.06.08 23:59:59,,UNREAD_BARS
USDJPY_RAW,2026.06.09,Tue,55379,1379,?,?,2026.06.09 00:00:00,2026.06.09 23:59:59,1h00m,UNREAD_BARS/GAP
USDJPY_RAW,2026.06.10,Wed,49832,1428,?,?,2026.06.10 00:00:00,2026.06.10 23:59:59,,UNREAD_BARS
USDJPY_RAW,2026.06.11,Thu,67820,1429,?,?,2026.06.11 00:00:00,2026.06.11 23:59:59,,UNREAD_BARS
USDJPY_RAW,2026.06.12,Fri,70863,1439,?,?,2026.06.12 00:00:00,2026.06.12 23:59:59,,UNREAD_BARS
SEP days (281 B; all EMPTY):
EURUSD_RAW,2026.09.07,Mon,0,0,0,1393,-,-,,EMPTY
EURUSD_RAW,2026.09.08,Tue,0,0,0,1430,-,-,,EMPTY
EURUSD_RAW,2026.09.09,Wed,0,0,0,1436,-,-,,EMPTY
EURUSD_RAW,2026.09.10,Thu,0,0,0,1433,-,-,,EMPTY
(Note: June bars/src read `?` = barsUnread true, srcBars -1 on every weekday; ticks present 40k-70k/day. September ticks 0 with broker src 1393-1436 present = EMPTY needs re-import.)

## R6 CONTROL_0605
- Criterion: USDJPY_RAW gap row on 2026.06.05 with gap_from <= 07:55:59 and gap_to >= 09:00:00.
- Only 06-05 gap row: USDJPY_RAW,2026.06.05 07:59:58,2026.06.05 09:00:00,1h00m. gap_from 07:59:58 is after 07:55:59.
- Verdict: NOT_FOUND. No conclusion beyond that. (The 1h00m 07:59:58-09:00:00 row is pasted in gaps above.)

## R6 JUDGED table (session frame server: London 09:00-12:00, New York 14:00-19:00; TOUCH_WINDOW = session open minus 3h to entry candle open)
| Trade | Date | Session | Entry candle | TOUCH_WINDOW | Day verdict | GAP overlap | Verdict |
| J1 | 3 June | London | LONG 09:10 open | 06:00-09:10 | UNREAD_BARS | none (no 06-03 gaps) | UNREAD |
| J2 | 5 June | London | SHORT 09:45 open (NOT VALID by his words, audit only) | 06:00-09:45 | UNREAD_BARS/GAP | USDJPY_RAW,2026.06.05 07:59:58,2026.06.05 09:00:00,1h00m | TOUCHED |
| J3 | 5 June | New York | LONG owed 16:15 open | 11:00-16:15 | UNREAD_BARS/GAP | none (07:59-09:00 ends before 11:00) | UNREAD |
| J4 | 11 June | New York | LONG owed 14:40 open | 11:00-14:40 | UNREAD_BARS | none (no 06-11 gaps) | UNREAD |
| S1 | 7 Sep | London | LONG 09:20 | 06:00-09:20 | EMPTY | none (GAPS_ABSENT) | CLEAN |
| S2 | 7 Sep | New York | LONG 16:45 | 11:00-16:45 | EMPTY | none | CLEAN |
| S3 | 8 Sep | London | SHORT 10:10 | 06:00-10:10 | EMPTY | none | CLEAN |
| S4 | 8 Sep | New York | SHORT 17:00 | 11:00-17:00 | EMPTY | none | CLEAN |
Count line: CLEAN 4, TOUCHED 1, UNREAD 3, NOT_REACHED 0.
(Precedence applied: TOUCHED on positive gap overlap; UNREAD on UNREAD_BARS days with no overlap; CLEAN on EMPTY days with GAPS_ABSENT per literal "no GAP row overlaps" with EMPTY caveat in result. S-CLEAN means no measured 5-min gap, not candles-confirmed-present: Sep days hold zero ticks and need re-import.)

(End of slice)
