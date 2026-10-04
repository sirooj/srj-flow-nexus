# BUILDER RESULT B-7 - one trial edit at the touch gate, one compile, one run, no improvement (measurement record; SWITCH TO OPUS per two-run rule)

Step 0 raw (measured 2026-10-04, terminal disk, branch builder/B-6):
- git log -1: 7ffbf47 B-6 retest vs zone vs touch: touch-gate first stop, arrival wins on file (relay B-6 revised, planner side)
- git status --short line count: 29 (25 pre-existing modified/deleted + 4 untracked: compile log, preB4 safety copy after step 0, B-4 STATUS/DONE markers)
- EA SHA-256 Experts/SRJ_FlowNexus_EA.mq5: E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC (starts E80FF0C2; gate passed; operator paste of relay B-7 is the word for ONE local edit plus its compile and run only, NOT a commit/push word)
- Backup Experts/SRJ_FlowNexus_EA.mq5.preB7 written before editing; its SHA-256: E80FF0C24149AB0946EB6A4341C0503A79BFE82E9843867CEF0DBA89BF587BBC (identical; never committed).

## Step 1 the spot, raw with real line numbers (9195-9261, 67 lines; LEGTOUCH print through the else closing brace)
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
One sentence: YES, the if-not-touchSeen part sets g_touchSeen true when the touch is found in that pass, on line 9198 (leg-scan path) and on line 9221 (single-bar path, inline in the UJTOUCHSEEN print line).

## Step 2 the trial edit (byte-exact splice, CRLF preserved; 12298 lines before, 12300 after; adapted shape: declined-flag line, else-to-if, guarded print inside)
Raw diff preB7 vs EA (3 added lines, 1 changed line, 4 diff lines total, inside the 15-line limit, one function):
@@ -9213,6 +9213,7 @@ (context: LEGTOUCH print tail)
+      bool uj_touchWasSeen = g_touchSeen;  //--- [B-7] touch state on entry to the gate (trial)
@@ -9220,7 +9221,8 @@ (context: single-bar touch block tail)
-      else
+      if(uj_touchWasSeen || !g_touchSeen)
+          if(!uj_touchWasSeen && !g_touchSeen) PrintFormat("[SRJ-EA] UJNOTOUCHCONFIRM bar=%s dir=%s zoneLo=%s zoneHi=%s", <same args as house prints>)
(Full raw diff pasted verbatim in the turn record: hunk headers @@ -9213,6 +9213,7 @@ and @@ -9220,7 +9221,8 @@; old else line removed, decl plus guarded print added, entry body untouched. New EA SHA-256: F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582.)
Truth table (by construction, verified on the 14 UJNOTOUCHCONFIRM passes): was-true runs the check as today with no print; was-false found-this-pass skips as today; was-false still-false runs the check with the print (the new case).

## Step 3 compile once (metaeditor64 /compile + /log, log 06_HANDOFFS/B7_EACOMPILE.log, 7852 bytes, UTF-16LE, 48 lines)
- Raw result line: Result: 0 errors, 0 warnings, 6515 ms elapsed, cpu=X64 Regular. CLI EXIT variable printed empty (known quirk); the log line is the result. First and only try.
- Post-edit EA 6818C8F82F0E9698E26D2E50AF27272B1DD80FFD380430636B9A9571C7D41249 went into this compile; rebuilt EX5 C61DE93D4CEBBA4ECD599D180E84428298519B7BB318BC8B52F932F599510ADE, 451918 bytes.

## Step 4 run RECON78 once (RECON78-B7; ini USDJPY_DEMO_JUNE.ini, same settings as B-4)
- Slot free (no terminal64, no metatester64), no stale B-7 markers, config window already June with no terminal running so no edit; WMI launch RC=0 instant; wrapper RUNNING; window proven by journal line: Tester USDJPY,M5 testing of Experts/SRJ_FlowNexus_EA.ex5 from 2026.06.01 00:00 to 2026.06.13 00:00.
- Journal saved as SRJ_FlowNexus_Local/06_HANDOFFS/RECON78-B7_JOURNAL.log: 7124491 bytes, 36794 lines (day-log lines 37031 onward, PRE_JOURNAL_LINES=37030; day log UTF-16LE, filed journal UTF-8).
- DONE RESULT=PASSED; Test passed in 0:45:40.270; 542258 ticks, 2880 bars; final balance 10229.50 (same as B-4).

## Step 5 filed-trade comparison: one row per deal, before (RECON78-V26-UJ, 36760 lines) vs after (RECON78-B7, 36794 lines). Dates first.
| date | session | direction | before: time and price | after: time and price | same? |
|---|---|---|---|---|---|
| 3 June | London | LONG | entry 09:10 at 159.932 (deal #2) | entry 09:10 at 159.932 (deal #2) | same |
| 3 June | London | exit of the long | 09:59:40 at 159.983 (deal #3) | 09:59:40 at 159.983 (deal #3) | same |
| 5 June | London | SHORT | entry 09:45 at 159.948 (deal #4) | entry 09:45 at 159.948 (deal #4) | same |
| 5 June | London | exit of the short | 12:19:21 at 159.900 (deal #5) | 12:19:21 at 159.900 (deal #5) | same |
| 5 June | New York | LONG | entry 16:55 at 160.120 (deal #6; late, owed 16:15) | entry 16:55 at 160.120 (deal #6; late, owed 16:15) | same |
| 11 June | New York | stop exit of the 5 June long | 22:30:51 at 159.725 (deal #7) | 22:30:51 at 159.725 (deal #7) | same |
| 8 June | any | SHORT | silent, no trade | silent, no trade (zero deals and zero SIGNAL rows on 8 June) | same |
| 11 June | New York | LONG | no trade (the miss) | no trade (still the miss; expected entry at the 14:40 open near 160.524 absent) | same (miss unchanged) |
Total deals before: 6. Total deals after: 6. Byte-identical date, direction and price on all six (asserted field by field in the build script).

## Step 6 every use of the new path (UJNOTOUCHCONFIRM rows in the whole after journal: 14 rows, with what followed in the pass)
NTC_N=14
--- NTC k=1 line=8544 ---
8544 :: QF	0	05:56:23.424	Core 04	2026.06.03 17:30:00   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.03 17:25 dir=LONG zoneLo=159.861 zoneHi=159.913
8545 :: JF	0	05:56:23.424	Core 04	2026.06.03 17:30:00   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.03 17:25 dir=LONG m15=-1.0 uj_readFail=0
FOLLOW_N=1
--- NTC k=2 line=8823 ---
8823 :: DJ	0	05:56:29.528	Core 04	2026.06.03 18:05:01   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.03 18:00 dir=LONG zoneLo=159.861 zoneHi=159.913
8824 :: KR	0	05:56:29.528	Core 04	2026.06.03 18:05:01   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.03 18:00 dir=LONG m15=-1.0 uj_readFail=0
FOLLOW_N=1
--- NTC k=3 line=9892 ---
9892 :: DQ	0	05:59:26.529	Core 04	2026.06.04 09:35:00   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.04 09:30 dir=SHORT zoneLo=160.001 zoneHi=160.012
9893 :: EL	0	05:59:26.529	Core 04	2026.06.04 09:35:00   [SRJ-EA] UJALIGN_PASS bar=2026.06.04 09:30 dir=SHORT m15=-1.0
9894 :: NP	0	05:59:26.529	Core 04	2026.06.04 09:35:00   [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.04 09:30 dir=SHORT term=A_OPP
FOLLOW_N=2
--- NTC k=4 line=9926 ---
9926 :: GL	0	05:59:26.529	Core 04	2026.06.04 09:40:00   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.04 09:35 dir=SHORT zoneLo=160.001 zoneHi=160.012
9927 :: JS	0	05:59:26.529	Core 04	2026.06.04 09:40:00   [SRJ-EA] UJALIGN_PASS bar=2026.06.04 09:35 dir=SHORT m15=-1.0
9928 :: MS	0	05:59:26.529	Core 04	2026.06.04 09:40:00   [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.04 09:35 dir=SHORT term=A_OPP
FOLLOW_N=2
--- NTC k=5 line=10696 ---
10696 :: HQ	0	05:59:50.943	Core 04	2026.06.04 11:30:00   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.04 11:25 dir=SHORT zoneLo=160.001 zoneHi=160.012
10697 :: IL	0	05:59:50.943	Core 04	2026.06.04 11:30:00   [SRJ-EA] UJALIGN_PASS bar=2026.06.04 11:25 dir=SHORT m15=-1.0
10698 :: JG	0	05:59:50.943	Core 04	2026.06.04 11:30:00   [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.04 11:25 dir=SHORT term=A_OPP
FOLLOW_N=2
--- NTC k=6 line=11361 ---
11361 :: MJ	0	06:00:45.874	Core 04	2026.06.04 16:35:00   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.04 16:30 dir=SHORT zoneLo=160.001 zoneHi=160.012
11362 :: MF	0	06:00:45.874	Core 04	2026.06.04 16:35:00   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.04 16:30 dir=SHORT m15=1.0 uj_readFail=0
FOLLOW_N=1
--- NTC k=7 line=11393 ---
11393 :: NS	0	06:00:45.874	Core 04	2026.06.04 16:40:00   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.04 16:35 dir=SHORT zoneLo=160.001 zoneHi=160.012
11394 :: NQ	0	06:00:45.874	Core 04	2026.06.04 16:40:00   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.04 16:35 dir=SHORT m15=1.0 uj_readFail=0
FOLLOW_N=1
--- NTC k=8 line=16943 ---
16943 :: EF	0	06:13:16.602	Core 04	2026.06.09 10:45:00   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.09 10:40 dir=SHORT zoneLo=160.221 zoneHi=160.248
16944 :: RJ	0	06:13:16.602	Core 04	2026.06.09 10:45:00   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.09 10:40 dir=SHORT m15=1.0 uj_readFail=0
FOLLOW_N=1
--- NTC k=9 line=16981 ---
16981 :: NM	0	06:13:16.602	Core 04	2026.06.09 10:50:00   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.09 10:45 dir=SHORT zoneLo=160.221 zoneHi=160.248
16982 :: HP	0	06:13:16.602	Core 04	2026.06.09 10:50:00   [SRJ-EA] UJALIGN_PASS bar=2026.06.09 10:45 dir=SHORT m15=-1.0
16983 :: KL	0	06:13:16.602	Core 04	2026.06.09 10:50:00   [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.09 10:45 dir=SHORT term=A_OPP
FOLLOW_N=2
--- NTC k=10 line=17202 ---
17202 :: EF	0	06:13:34.912	Core 04	2026.06.09 12:00:00   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.09 11:55 dir=SHORT zoneLo=160.221 zoneHi=160.248
17203 :: OI	0	06:13:34.912	Core 04	2026.06.09 12:00:00   [SRJ-EA] UJALIGN_PASS bar=2026.06.09 11:55 dir=SHORT m15=-1.0
17204 :: DE	0	06:13:34.912	Core 04	2026.06.09 12:00:00   [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.09 11:55 dir=SHORT term=A_OPP
FOLLOW_N=2
--- NTC k=11 line=19746 ---
19746 :: NN	0	06:17:51.263	Core 04	2026.06.10 10:35:01   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.10 10:30 dir=LONG zoneLo=160.325 zoneHi=160.344
19747 :: EM	0	06:17:51.263	Core 04	2026.06.10 10:35:01   [SRJ-EA] UJALIGN_PASS bar=2026.06.10 10:30 dir=LONG m15=1.0
19748 :: ML	0	06:17:51.263	Core 04	2026.06.10 10:35:01   [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.10 10:30 dir=LONG term=A_OPP
FOLLOW_N=2
--- NTC k=12 line=19779 ---
19779 :: IR	0	06:17:51.263	Core 04	2026.06.10 10:40:01   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.10 10:35 dir=LONG zoneLo=160.325 zoneHi=160.344
19780 :: FI	0	06:17:51.263	Core 04	2026.06.10 10:40:01   [SRJ-EA] UJALIGN_PASS bar=2026.06.10 10:35 dir=LONG m15=1.0
19781 :: JS	0	06:17:51.263	Core 04	2026.06.10 10:40:01   [SRJ-EA] CONFIRM_STRUCT_FAIL bar=2026.06.10 10:35 dir=LONG term=A_OPP
FOLLOW_N=2
--- NTC k=13 line=21872 ---
21872 :: IL	0	06:22:25.923	Core 04	2026.06.11 10:50:00   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.11 10:45 dir=LONG zoneLo=160.489 zoneHi=160.504
21873 :: RP	0	06:22:25.923	Core 04	2026.06.11 10:50:00   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 10:45 dir=LONG m15=-1.0 uj_readFail=0
FOLLOW_N=1
--- NTC k=14 line=21909 ---
21909 :: QH	0	06:22:25.923	Core 04	2026.06.11 10:55:10   [SRJ-EA] UJNOTOUCHCONFIRM bar=2026.06.11 10:50 dir=LONG zoneLo=160.489 zoneHi=160.504
21910 :: JD	0	06:22:25.923	Core 04	2026.06.11 10:55:10   [SRJ-EA] UJALIGN_NOMATCH bar=2026.06.11 10:50 dir=LONG m15=-1.0 uj_readFail=0
FOLLOW_N=1
2026.06.08_SIGNAL_N=0
Read-off: 8 passes ended at UJALIGN_NOMATCH (15m misaligned, return before the confirm edge); 6 passes ran UJALIGN_PASS then CONFIRM_STRUCT_FAIL term=A_OPP. None of the 14 moved to S5. No UJNOTOUCHCONFIRM row exists in the 11 June 14:40 pass (that pass aborted the SHORT at the deferred-apply return before reaching the S4 block, as in the old run).

## Step 7 the 11 June 14:40 pass, raw (new journal 22656-22699, 44 rows, to the first 14:45 row)
22656 :: FG	0	06:23:08.649	Core 04	2026.06.11 14:40:22   Alert: USDJPY M5 - POI RETEST LONG at 160.523  [D-POC +1]
22657 :: HE	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
22658 :: QP	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ][T155][OBPROV] code=3 id=3117 bar=107659 flag=false
22659 :: DE	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ][T155][OBPROV] code=3 id=3105 bar=107659 flag=false
22660 :: EG	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ][T155][OBPROV] code=8 id=0 bar=107659 flag=true
22661 :: ON	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPROBE bar_key=2026.06.11 14:35 h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=OPPOSING kind=regular readFail=0 empty=107050 zero=0 complete=1 latestNZ=1 covReq=2026.04.29 covAch=2026.04.29 dayCount=32 ticktime=2026.06.11 14:40:22 lag=chartTime-1bar
22662 :: JI	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] IDCHANGE bar=2026.06.11 14:35 inWin=1 state=S4_ARMED dir=SHORT xobId=3091->3070 fvgId=0->0 xobLo=160.489 xobHi=160.504 cumX=348 cumF=0 bars=2481
22663 :: MH	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFFLIP bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF bias turned against the locked direction
22664 :: EJ	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] LTFDIAG bar=2026.06.11 14:35 dir=SHORT state=S4_ARMED kind=STRONG ok0=1 bias0=1 ob0=1 fvg0=1 opp0=0 ok1=1 bias1=-1 ob1=1 fvg1=1 opp1=0
22665 :: GS	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERABORT bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC state=S4_ARMED - LTF opposed, abort deferred past evaluation (Fix S-a)
22666 :: OE	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SWEPTMASK bar=2026.06.11 14:35 raw=3429125.0 m=3429125 swept=1010000011 live=0010
22667 :: RH	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:35 line=Daily-POC anchor=Daily-POC
22668 :: DG	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:35 line=Daily-VWAP anchor=Daily-POC
22669 :: DK	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:35 line=Daily-POC anchor=Daily-POC
22670 :: NF	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJPOISKIP bar=2026.06.11 14:35 line=Daily-VWAP anchor=Daily-POC
22671 :: KH	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] TPCENSUS #206 bar=2026.06.11 14:35 dir=SHORT ref=160.524 winner=YLOL best=160.493 distPts=31 empties=8 admitted= PDL:288 ASL:99 LOL:31 NYL:17 PML:72 YASL:99 YLOL:31 YNYL:201 YPML:72 LIVE:1469 LIVE:1721 PD:1469 PD:1721 LIVE:1543 LIVE:1736 LIVE:1781 LIVE:2166 PD:1781 PD:2166 LIVE:1741 LIVE:1859 PD:1741 PD:1859 LIVE:1496 LIVE:1667 LIVE:1380 LIVE:1522 LIVE:1566 LIVE:1913 LIVE:1443 LIVE:1716 LIVE:1423 LIVE:1686 LIVE:1423 LIVE:1653 LIVE:1273 LIVE:1874 LIVE:1436 LIVE:1744 LIVE:1540 
22672 :: HK	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLEXT481 fields=17 bar=2026.06.11 14:35 site=S2POLL dir=SHORT ladOriginPx=160.526 ladOriginBarTime=2026.06.11 14:35 ladOriginSite=S2POLL ext1Defined=1 slExt1=160.552 ext1Slot=15 ext1BarTime=2026.06.11 13:20 ext1Imb=0 deepestExt=3 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
22673 :: LJ	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SWINGPICK site=S2POLL dir=SHORT barShift=1 close=160.526 haveHigh=1 SH=160.534 atShift=6 haveLow=1 SL=160.507 atShift=1
22674 :: EL	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLSRC site=S2POLL dir=SHORT src=FALLBACK_SIDE obStruct=160.489 obSwing=160.488 nearest=160.534 chosen=160.534 deltaPts=1
22675 :: GJ	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=160.534 distPts=8 site=S2POLL zoneLo=160.545 zoneHi=160.572
22676 :: GF	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMB fields=19 bar=2026.06.11 14:35 site=S2POLL dir=SHORT branch=1SWING obValid=1 slRef=160.534 slShift=6 slShiftT=2026.06.11 14:05 latestFlag=0 latestShift=6 latestShiftT=2026.06.11 14:05 latestAvail=1 latestApexMatch=1 chosenFlag=0 chosenShift=6 chosenShiftT=2026.06.11 14:05 chosenAvail=1 nuanceClass=OB_VALID_LATEST_NOIMB cands=-
22677 :: HD	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBWALK fields=27 bar=2026.06.11 14:35 site=S2POLL dir=SHORT branch=1SWING slToday=160.534 slBase=160.587 slNuance=160.587 deltaBasePts=53 deltaNuancePts=53 walkSteps=13 code2Seen=1 exhausted=0 skipShift=15 skipVal=160.552 skipFlag=0 bodyExt=160.549 extUpdatedByNonQual=2 code3Seen=0 sideViolations=0 todayEqBase=0 todayEqNuance=0 baseEqNuance=1 class=BASE_MOVED outwardBasePts=53 outwardNuancePts=53 skipShiftT=2026.06.11 13:20 startShiftT=2026.06.11 14:05
22678 :: KD	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLIMBWALKF fields=25 bar=2026.06.11 14:35 site=S2POLL dir=SHORT branch=1SWING fracAnchorShift=6 fracAnchorFlag=0 slFractal=160.587 slFractalNuance=160.587 deltaFracPts=53 deltaFracNuancePts=53 fracSteps=13 fracCode2=1 fracExh=0 fracC3=0 fracExtNQ=2 fracClass=BASE_MOVED sideFracViolations=0 outwardFracPts=53 outwardFracNuancePts=53 fracAnchorRawShift=6 fracAnchorRawSide=PROTECTIVE fracAnchorGuardApplied=0 fracAnchorShiftT=2026.06.11 14:05 fracSkip=15 fracSkipT=2026.06.11 13:20
22679 :: JM	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SEL61SRC site=S2POLL bar=2026.06.11 14:35 branch=SLREF_1SWING def=1 value=160.534 mode=1 scope=IN_SCOPE_RULE aux=-
22680 :: FP	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6TERM class=SELECTED bar=2026.06.11 14:35 shift=1 site=S2POLL dir=SHORT mode=1SWING px=160.534 ok=1 slot=6
22681 :: CH	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SEL52CTX seq=289 bar=2026.06.11 14:35 site=S2POLL dir=SHORT oPx=160.526 oBT=2026.06.11 14:35 slRef=160.534 mode=1 halt=-
22682 :: NP	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SLMEMO bar=2026.06.11 14:35 site=S2POLL result=COMPUTE ok=1 slRef=160.534 mode=1 computes=228 hits=58 genID=228 wrSite=S2POLL wrOrigin=evalClose
22683 :: HH	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJ1R bar=2026.06.11 14:35 src=POLL entry=160.524 sl=160.534 tp=160.493 risk=0.010 reward=0.031 R=3.10 verdict=PASS
22684 :: ES	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] ZONESHADOW bar=2026.06.11 14:35 dir=SHORT close=160.524 zoneLo=160.545 zoneHi=160.572 gapPts=21 slRef=160.534 tp=160.493 R_close=3.10 tpInGap=0 shadow= near=4.73/sl0/tp1 mid=2.67/sl0/tp1 far=2.08/sl0/tp1 
22685 :: MS	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:35 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
22686 :: NQ	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1H_WOULDPREEMPT bar=2026.06.11 14:35 newPoi=Daily-POC newDir=LONG heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED newTier=5 heldTier=5 wouldPreempt=0 wouldTierPassLegacy=0
22687 :: EL	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:35 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
22688 :: LI	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SUPPRESSED bar=2026.06.11 14:35 poi=Daily-POC dir=LONG opp=1 higher=0 heldPoi=Daily-POC heldDir=SHORT heldState=S4_ARMED cum_n=79 cum_opp=19 cum_hi=7 cum_both=4 action=HELD
22689 :: QS	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTBOOK bar=2026.06.11 14:35 hits=2 Daily-POC:r10:dL Daily-VWAP:r11:dL
22690 :: KS	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDTTERMS bar=2026.06.11 14:35 Daily-POC=LHIT/Sbody-above Daily-VWAP=LHIT/Sbody-above Weekly-POC=Lno-penetration/Sbody-above Weekly-VWAP=Lno-penetration/Sbody-above 
22691 :: OM	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] RETESTDIAG bar=2026.06.11 14:35 inside=Daily-POC Daily-VWAP nearAbove=-:-pts nearBelow=Weekly-VWAP:227.0pts
22692 :: MJ	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] CONFIRMPOLL bar=2026.06.11 14:35 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=3pts doji=0 touchAttr=1 confirm=0 shadow=true
22693 :: CQ	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] SIDE1D_BOTHDIRS bar=2026.06.11 14:35 bl=0 br=10 sl=-1 sr=2147483647 sel=LONG sline=0 scode=Daily-POC lcode=-
22694 :: QM	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJSBTELEM bar=2026.06.11 14:35 dir=SHORT have=1 sbDir=LONG sbLine=0 confC=0 confH=0 sbL=160.523 o1=160.525 c1=160.522 c0=160.526 arm=1 termC=A2_CLOSE_BREAK termH=A_OPP - contender evaluation (Fix S3)
22695 :: ML	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] UJDEFERAPPLY bar=2026.06.11 14:35 dir=SHORT poi=Daily-POC - deferred LTF abort applies, holder unchanged (Fix S-a)
22696 :: EE	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 ABORT reason=LTF_MISALIGN state=S4_ARMED poi=Daily-POC dir=SHORT
22697 :: OK	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.06.11 14:40 state=S4_ARMED dir=SHORT predicate=LTF_MISALIGN
22698 :: DM	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] ALERT SRJ STAND-DOWN SHORT USDJPY M5 | Daily-POC | NYAM | reason=LTF_MISALIGN
22699 :: MN	0	06:23:08.649	Core 04	2026.06.11 14:40:22   [SRJ-EA] 2026.06.11 14:40:22 STATE S4_ARMED->ABORT dir=SHORT poi=Daily-POC
FIRST1445 :: 22700 :: PL	0	06:23:08.649	Core 04	2026.06.11 14:45:05   [SRJ-EA] UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=32 famRead=512 unavail=0 emptyValid=15 state=2 attempt=10 poolGen=10 cadence=no-rebuild
Trader words: the pass cancelled the short on the deferred path exactly as before (UJDEFERABORT print, then apply, abort, stand-down, state change), held the long back, threw the short out and stood down with no trade; the new touch-check line never printed in this pass because the short exit ended the pass before the S4 block ran; at 14:45 the setup was judged on the 14:40 bar again and refused, same as the old run. The 11 June long did not enter.

## STOP rules (evaluated after Step 5, before anything else): filed deal changed/disappeared: NONE (6/6 identical); 8 June no longer silent: NO (silent); new deal anywhere else: NONE. Result: KEEP the edited EA in the working tree uncommitted (no STOP trigger fired).
SWITCH TO OPUS: TRIGGERED by rule 1 (two runs in a row do not improve the same filed trade: RECON78-B4 missed the 11 June long and RECON78-B7 missed it again). Said plainly below; no further local iteration from this turn.

## Step 8 restore state (no restore: KEEP per above)
- EA on disk: EDITED B-7 trial build, SHA-256 F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582 (measured this turn, equals the post-edit hash from Step 2; no drift).
- EX5 on disk: C61DE93D4CEBBA4ECD599D180E84428298519B7BB318BC8B52F932F599510ADE, compiled from this exact EA source after the edit and before the run: MATCHES. Next authorized compile overwrites both as usual.
- EA, .preB7, indicator, Include/SRJ and journals: uncommitted and unpushed by relay order; only BUILDER_RESULT_B7.md ships (Step 9).
