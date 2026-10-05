# BUILDER RESULT B-29 - FlowLogic start-up settings back in their own slots (Hunk X); mapping fixed, three missing valids fire, 9/8 16:55 lost; RESTORED (trial record)

Trader summary: your bias indicator now gets every setting in its own slot - its 4-hour slot reads the 4-hour chart, its 1-hour slot reads the 1-hour chart, and its 15-minute slot reads the 15-minute chart, with the 3,000-bar window you asked for. That part is proven. Your three missing trades all appeared: the 1 Sep 17:35 long, the 7 Sep 09:20 long and the 8 Sep 10:10 short. But the 8 Sep 17:00 short you had before did not come this time, so the fix stays off and everything is put back exactly as it was. Your other three takes and both refusals came out identical.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first. Relay B-29 wins over older queue items for its scope.
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-28` returns `235eeddc024774f3618e6e93034b9a122addc7b4 refs/heads/builder/B-28` (verified). Branch builder/B-29 cut from 235eedd. Dirty tree kept (109 `git status --short` lines; no expected value, nothing reset). No git-config/remote change. Pushes go through remote `backup`.
- 0.3 read in order: AGENTS.md; srj-relay skill; srj-strategy skill sections 5 (lines 60/91-93), 6 (line 99), 8, 11 (line 141) and 12; pointer; BUILDER_RESULT_B28.md (carried note first, then P1/P2/P3/C1/C2); quirks sections 1 (line 19 ICUSTOM-INPUT-GROUP-SHIFT) and 2.
- 0.4 `git log -1`: `235eeddc024774f3618e6e93034b9a122addc7b4 B-28 grep-first gate banked, input-group shift proven Mapping B, six marks hold, MEASURED (relay B-28, planner side)`. SHA-256 gate, all match (no STOP-A):
  - EA mq5 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8 (688599 B).
  - EA ex5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994.
  - HTFEngine D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755.
  - FlowLogic.mq5 956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342.
  - FlowLogic.ex5 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90.
  - FlowLogic.mq5.B28W 430FB4D3456374AE8A98A568A5E3DEEE0F91F1C98D611D95C06D9F4CBEBE3DFC.
  - strategy skill E238A9D69638ABE627D231DD74BB4E14BD65C30F46ADD2CCA0F368FD6B88DB48.
  - relay skill 298AC58541494C7AF89C1D21B80EDAC9AC235D6A13252C0D88BF39AF58774CFD.
  - ledger 9F90A304336D9A1AC33F2840D7145B88523C60F8051873EE36938DE4515FDAD9 (last item 1169).
  - journal 23329BCB141E67AC3799406A038839F335DD8AAE4A8B2D4BB73CC8AF34298B6D (1057 lines).
  - planner context F390DC476FD9C1CA99271563DA5596DEB132CF05CFAC5039C75050F83D95FC36.
  - quirks E8EF30FA092AABE0DDBB4588AD86BFA3B5D93005E25FBFB57F52758CB73BA149 (report only).
- 0.5 names: j13 = RECON62-B28I_JOURNAL.log (PASSED, 3168 bars, 563338 ticks, 10194.64, MAPPING=B); j14 = RECON62-B29X_JOURNAL.log (this relay). RECON62 = EURUSD M5 26 Aug - 9 Sep 2026 (1787702400/1788998400). Hunk W = B28IN print (B28W file, 430FB4D3). Hunk X = one EA placeholder argument. Six marks / three missing valids (9/1 NY 17:35 LONG, 9/7 LDN 09:20 LONG, 9/8 LDN 10:10 SHORT; 15M-READS rows 301/281/285) / seven valids / fixed mapping as relayed. Backups `.preB29`; kept EA copy `.B29X`.

## Part A - records first (grep-first on every step)
- A1 relay skill, Reply line section. Pre-edit grep (case-insensitive) `travels in the reply line only`: 0. APPENDED exactly the relayed bullet as the last bullet of the section. Post-edit count 1. New SHA 865E87500698166BB3E5EEC7B508E2381492C7C5E5B78BA9EDFC1965DDAFB646.
- A2 journal: no row (no new words of his). Row count 1057, SHA 23329BCB141E67AC3799406A038839F335DD8AAE4A8B2D4BB73CC8AF34298B6D (unchanged).
- A3 strategy skill: untouched. SHA E238A9D69638ABE627D231DD74BB4E14BD65C30F46ADD2CCA0F368FD6B88DB48 (unchanged).

## Part P - pre-checks (read-only, nothing edited)
- P1 FlowLogic input block, raw: lines 246-253 equal the B-28 P1 text (`input group "HTF Automation"`, ctf, lookback 3000, htf1 H4, htf2 H1, htf3 M15, conf false, maxobj 60). No STOP-P.
- P2 EA call: `g_hFlow = iCustom(` count 1. Raw lines 11208-11213 equal the B-28 P2 text (`1, InpFL_HtfLookbackBars,` ... `PERIOD_H4, PERIOD_H1, PERIOD_M15, true, 60);`). No STOP-P.
- P3 chart-timeframe setting. Raw enum (line 232): `enum ENUM_CHARTTF { CTF_1MIN, CTF_5MIN };`. CTF_1MIN=0, CTF_5MIN=1. CTF_5MIN_VALUE=1 (no STOP-P; the EA's `1` hands over the correct chart setting once fixed). `inChartTradingTF` reads, count 2: line 247 (input declaration) and line 827 (`ChartTFToStr(inChartTradingTF));`, a panel-label use (read-only observation: the stray 3000 only ever reached this label).
- P4 iCustom census: 3 calls. (1) line 11199 `g_hPoi = iCustom(_Symbol, PERIOD_CURRENT, InpPoiMarkerName,` + line 11200 (3 args: UseSeed/BinPips/WeightMode); target `Indicators/SRJ_POI_Marker.mq5` first input line 80 `input bool InpUseSeed = true;`, first `input group` at line 84 AFTER the three passed inputs (guard comment lines 69/71: these three must stay first, no group may precede). No shift. (2) line 11203 `g_hCqd = iCustom(_Symbol, PERIOD_CURRENT, InpCqdName,` + lines 11204-11205 (5 args); target `Indicators/SRJ_CQD_TickBased_MT5.mq5` first input line 73 `input ENUM_TIMEFRAMES InpResetPeriod = PERIOD_D1;`, zero `input group` lines in the whole file. No shift. (3) FlowLogic: group line 246 before the first passed input. Shift (fixed by Hunk X). GROUP_SHIFT_OTHER=none.
- P5 seven valids + two refusals from his journal, raw (row = CSV data-row number; entry time/price only where the row journals them):
  - 8/28 London: row 257 `8/28/26 LDN TF Bear/Bear/Bear D-VWAP ... 0.10 / or 1.21R` (no journaled entry time/price; machine bar 10:00 entry 1.16466).
  - 9/1 NY: row 301 `9/1/26 NY ... M-VWAP ... EA-valid-taken 17:35 LONG entry 1.16022 sl 1.15975 tp 1.16077 R1.17; ... VALID not-taken ... 15m BULLISH ... 15M-READS`.
  - 9/4 NY: row 277 `9/4/26 LDN(journal label) TF Bull/Bear/Bear D-VWAP ... 0.92R` (no journaled entry time/price; machine bar 15:55 entry 1.16018).
  - 9/7 London: row 281 `9/7/26 LDN ... W-AVP ... 2.03 ... 09:20 LONG ... 15m BULLISH ... 15M-READS`.
  - 9/7 NY: NOT_FOUND in journal (no 9/7 NY row on record; machine bar 16:40 entry 1.16261).
  - 9/8 London: row 285 `9/8/26 LDN ... Bear ... 10:10 SHORT ... 15m BEARISH ... 15M-READS`.
  - 9/8 NY: NOT_FOUND in journal (no 9/8 NY row on record; machine bar 16:55 entry 1.16220).
  - 8/27 NY refusal: row 302 `INVALID 17:05 SHORT off Daily POC; nearest valid target D VWAP below 1R so skipped ... (W1) ... 8/27-NY-INVALID`.
  - 9/1 London refusal: row 303 `INVALID 09:45 SHORT; rejected: CQD divergence invalid ... 1SEP-LDN-0945-SHORT-INVALID`, row 304 `EA-ONLY 09:55 LONG INVALID ... 5M-BIAS-AT-ENTRY`, row 265 `9/1/26 LDN ... less than 1R Y AVP`.
- P6 rule-conflict check. Pins quoted raw: REFINE-ONLY (skill line 91), ENGINE-REFINE-KEEPS-VALID-TAKES (line 92), FIX-NOT-REPLACE (line 93), 15M-READS (line 141, W6: 1 Sep NY 17:35 LONG bullish; 7 Sep London 09:20 LONG bullish; 8 Sep London 10:10 SHORT bearish; EA's against-trade 15m reads are read errors; accurate = machine read equals his chart read). Hunk X changes how settings reach the indicator (one placeholder argument), not any trading rule; it replaces nothing and adds no gate, mirror or copy. CLEAN.
- P7 predictions, copied as given (C1 print decides):
  | Field | j13 now (Mapping B) | after Hunk X (fixed) |
  |---|---|---|
  | ctf | 3000 | 1 |
  | lookback | 16388 | 3000 |
  | htf1 | 16385 (H1) | 16388 (H4) |
  | htf2 | 15 (M15) | 16385 (H1) |
  | htf3 | 1 (M1) | 15 (M15) |
  | conf | 1 | 1 |
  | maxobj | 60 | 60 |

## Part B - edits (two compiles authorized: FlowLogic for Hunk W, EA for Hunk X)
- B0 backups before any source change, each equals its gate value: EA mq5 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8; EA ex5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994; FlowLogic mq5 956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342; FlowLogic ex5 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90.
- B1 Hunk W re-applied: copied `.B28W` over FlowLogic.mq5, SHA 430FB4D3456374AE8A98A568A5E3DEEE0F91F1C98D611D95C06D9F4CBEBE3DFC verified. Diff vs `.preB29` equals the B-28 B2 diff (one hunk, pure +3 insertion after the SRJ BUILD print). No STOP-B.
- B2 FlowLogic compiled only. Log `B29W_FLCOMPILE.log`: `Result: 0 errors, 0 warnings, 6215 ms elapsed`. New FlowLogic.ex5 2A3A544BB4E88729CB257F1E6E77E09B2C464B24B840136FF0B43792CC4888D5 (236946 B).
- B3 Hunk X. Spot raw (real numbers): 11208 `g_hFlow = iCustom(_Symbol, PERIOD_CURRENT, InpFlowLogicName,` / 11209 `1, InpFL_HtfLookbackBars,`. Changed ONLY line 11209, keeping its leading whitespace, to: `"", 1, InpFL_HtfLookbackBars,   // B-29: "" fills the FlowLogic input group "HTF Automation" slot`. Nothing else touched.
- B4 diff vs `.preB29`: exactly one hunk, -1/+1. Raw: `@@ -11206,7 +11206,7 @@` / ` g_hFlow = iCustom(_Symbol, PERIOD_CURRENT, InpFlowLogicName,` / `-                     1, InpFL_HtfLookbackBars,` / `+                     "", 1, InpFL_HtfLookbackBars,   // B-29: "" fills the FlowLogic input group "HTF Automation" slot` / `                      //--- [P-UJIMPL-IMPL-1 v8 IE1] confirmed selection (F252`. Edited SHA 70E68EE133A51705DA03A2E3F16C7D571C6A596BEF680741C0112D7565C4CA3D. Kept `Experts/SRJ_FlowNexus_EA.mq5.B29X` same SHA, never committed.
- B5 EA compiled only. Log `B29X_EACOMPILE.log`: `0 errors, 0 warnings, 8509 ms elapsed`. New EA.ex5 5D8151BF97CE9B826E38EFA294720468E7415972C5B1477CFE2B4D9E7804B7A0 (453902 B). No STOP-B.

## Part C - one run j14 (RECON62-B29X_JOURNAL.log, 86778 lines, 17052662 B, SHA 3019ABEB079EF203D5FB4F921577BB517B435257276CBF9D6E81AB11535B0C7B, local unpushed)
- C0 hygiene (same as B-28 C0): no terminal before launch (verified). Six-line ini block set to RECON62 via Edit and read back (EURUSD/5/3/1787702400/1788998400). Run ini follows the RECON50_DEMO_USD.ini pattern (EURUSD M5, InpMode 1, InpDebugLog true). Launched from script file `launch_recon62b29x_run.ps1` (copied from the B28I launcher, only RunName changed to RECON62-B29X): WMI_PID 20084 RC=0, terminal PID 14660, STATUS PRE_JOURNAL_LINES=760820. Window proof (journal lines only): day-log 760837 `NS 0 21:56:10.280 Tester EURUSD,M5 (Dukascopy-demo-mt5-1): testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00` and 760863 `LN 0 21:56:16.522 Core 04 EURUSD,M5: testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00 started with inputs:`. Wrapper shell killed once verified (his RAM order); terminal + agent survived; graded from the day log on completion (no DONE file). Run completed 22:00:16: `EURUSD,M5: 563338 ticks, 3168 bars generated. ... Test passed in 0:04:05.904` (ticks/bars digit-identical to j12/j13; the 4-minute time is the smaller 3000-bar replay window plus warm cache, not an early stop: full tick count, full bar count, balance printed). Leftover terminal stopped (CloseMainWindow refused on the headless process; idle leftover stopped) plus one orphaned agent (port-guard); both verified gone. Ini restored to June USDJPY via Edit and read back (USDJPY/1780272000/1781308800). MetaEditor usage popup seen on his screen: no metaeditor process is running; both compile logs show 0/0 with fresh elapsed times and both ex5 files changed at the compile minutes, and the run itself proves the builds (BUILD stamp + program-file lines in C1). He only needs to OK the dialog away.
- C1 start-up print. `SRJ-FL-B28IN` count 1. Raw (segment line 92 = day-log 760912): `FI 0 21:56:16.522 Core 04 2026.08.26 00:00:00   SRJ-FL-B28IN ctf=1 lookback=3000 htf1=16388 htf2=16385 htf3=15 conf=1 maxobj=60 H4=16388 H1=16385 M15=15 M1=1`. Field-by-field vs P7 "after": all 7 equal. MAPPING_FIXED=yes (no STOP-W). Run-build proof: `OF 0 21:56:16.522 Core 04 2026.08.26 00:00:00   SRJ BUILD 2026.10.05 21:51:41 refOk=invOnly diag=v9_perm` (= B2 compile minute); `program file added: \Indicators\SRJ_FlowLogic.ex5. 236979 bytes loaded` (plus POI 119766 / CQD 53471 byte lines; no EA program-file line exists on record - the EA is the tested expert, and the fixed B28IN values are themselves the proof Hunk X is live).
- C2 filed-trade table, j13 vs j14 (segment line numbers; full rows in the table file note below).
  - (a) six marks (same fields as B-28 C2):
    - 8/28 SHORT bar 10:00: HOLD ✓. A6FIRED j14:17050 tp=1.16364 r=2.43 sl=1.16508 (== j13:14046); EXIT j14:17475 POI_BODY_BREAK 1.16439 (entry 1.16466); MTEXIT j14:17467 entry=1.16466 exit=1.16439; ENTRY j14:17066.
    - 9/4 LONG bar 15:55: HOLD ✓. A6FIRED j14:56005 tp=1.16302 r=1.66 sl=1.15847 (== j13:45012); EXIT j14:57736 DAY_CLOSE 1.16093 (entry 1.16018); MTEXIT j14:57728 entry=1.16018 exit=1.16093; ENTRY j14:56021.
    - 9/7 LONG bar 16:40: HOLD ✓. A6FIRED j14:61938 tp=1.16315 r=2.34 sl=1.16238 (== j13:51951); EXIT j14:62080 TP_TOUCH 1.16315 (entry 1.16261); MTEXIT j14:62078 entry=1.16261 exit=1.16315; ENTRY j14:61954.
    - 9/8 SHORT bar 16:55: LOST ✗ (STOP-D). No A6FIRED, no ENTRY, no EXIT at 16:55 in j14 (j13:60185 tp=1.16114 r=1.96 sl=1.16274, entry 1.16220, SL exit 1.16274). Nearest j14 rows: 16:50 DIV_FALLBACK ABORT (LONG), 17:05 FRESH_OB_DEAD ABORT (SHORT).
    - 8/27 refusal: HELD (no fire) with changed signature. j13:12727 `2026.08.27 17:05:00 ABORT reason=TP_RR_FAIL ... poi=Daily-POC dir=SHORT`. j14: no 17:05 row at all; nearest 8/27 rows are 17:40 LTF_MISALIGN ABORT and 18:15/18:35 UJ5MENTRY_REFUSE. It did not fire (STOP-D refusal clause needs a fire: none).
    - 9/1 09:50 refusal: HELD (no fire) with changed signature. j13:23803 `UJ5MENTRY_REFUSE bar=2026.09.01 09:50 dir=LONG`. j14: no 09:50/09:55 row at all. It did not fire.
  - (b) three missing valids:
    - 9/1 NY 17:35 LONG: FIRED bar 17:30 (j14:35429 tp=1.16077 r=1.17 sl=1.15975 = row 301 figures; SIGNAL 35431 Monthly-VWAP NYAM). Entry unfilled: ABORT MEMO_IDENTITY at 17:35:01 (35434/35435), no ENTRY_TICKET. Fired-but-voided.
    - 9/7 LDN 09:20 LONG: FIRED bar 09:15 (j14:58882 tp=1.16200 r=1.76 sl=1.16098; SIGNAL 58884 Weekly-POC LONDON) and TRADED: ENTRY j14:58898 (ticket 6), MTEXIT j14:59289 entry=1.16135 exit=1.16200 reason=TP_TOUCH, EXIT j14:59291 TP_TOUCH at 1.16200 (entry 1.16135).
    - 9/8 LDN 10:10 SHORT: FIRED bar 10:05 (j14:63706 tp=1.16102 r=1.94 sl=1.16258; SIGNAL 63708 Monthly-POC LONDON). Entry unfilled: ABORT MEMO_IDENTITY at 10:10 (63711/63712), no ENTRY_TICKET. Fired-but-voided.
  - (c) j14 A6FIRED not at one of the seven valids: 0. All 6 fires sit on valid bars (8/28 10:00, 9/1 17:30, 9/4 15:55, 9/7 09:15, 9/7 16:40, 9/8 10:05). NEW_FIRES_OUTSIDE=0.
  - Totals: FIRED j14 6 vs j13 4; ENTRY_TICKET 4 vs 4; MTEXIT 4 vs 4; SIGNAL 6 vs 4; EXIT 4 vs 4; balance j14 10460.96 (day-log 830860 `final balance 10460.96 USD`) vs j13 10194.64.
- C3 bias reads at his bars (bar | his banked 15m | j13 EA 15m probe/row (h4/h1) | j14 EA 15m probe/row (h4/h1)):
  - 8/27 17:05 refusal | not banked | +1.0/NONE (-1.0/+1.0) | +1.0/NONE (-1.0/-1.0).
  - 8/28 10:00 | not banked | +1.0/+1.0 (-1.0/-1.0) | -1.0/-1.0 (-1.0/-1.0).
  - 9/1 09:50 refusal | not banked | +1.0/NONE (-1.0/-1.0) | -1.0/NONE (-1.0/-1.0).
  - 9/1 17:30 (his 17:35 LONG BULLISH) | BULLISH | -1.0/+1.0 (-1.0/+1.0, against) | +1.0/+1.0 (-1.0/-1.0, with him).
  - 9/4 15:55 | not banked | +1.0/NONE (-1.0/+1.0) | +1.0/NONE (+1.0/-1.0).
  - 9/7 09:15 (his 09:20 LONG BULLISH) | BULLISH | -1.0/-1.0 (+1.0/+1.0, against) | +1.0/+1.0 (+1.0/+1.0, with him).
  - 9/7 16:40 | not banked | +1.0/NONE (+1.0/+1.0) | +1.0/NONE (+1.0/+1.0, same).
  - 9/8 10:05 (his 10:10 SHORT BEARISH) | BEARISH | +1.0/NONE (-1.0/-1.0, against) | -1.0/NONE (+1.0/-1.0, m15 with him).
  - 9/8 16:55 | not banked | -1.0/NONE (-1.0/+1.0) | +1.0/NONE (-1.0/-1.0).
  - At all three missing valids the j13 15m read stood against his chart and the j14 15m read equals it (FIX-NOT-REPLACE accuracy, measured).
- C4 vote census (machine-compared, wall-clock stripped, j14 vs j13): UJPROBE identical 633 of 3168, DIFF 2535 (STOP-N suspended: votes expected to move). First 5 differing rows: bar_keys 2026.08.25 23:55 through 2026.08.26 00:15 (j13 h4=+1.0 vs j14 h4=-1.0 with mirrored m15). UJM15ROW identical 533 of 1056, DIFF 523. UJALIGN j13 PASS 212/NOMATCH 89/BYPASS 7 (308); j14 PASS 280/NOMATCH 73/BYPASS 9 (362).
- C5 STOP rules: no STOP-A (gates matched); no STOP-P (P1/P2 equal, CTF_5MIN=1); no STOP-B (0/0 both compiles, Hunk W diff equal); no STOP-W (print == fixed, count 1); STOP-D YES (9/8 16:55 take absent in j14); no STOP-S (0 outside fires); STOP-E in Part E. Verdict RESTORED. All four files restored from `.preB29` and verified; Hunk X survives in `.B29X` and the B4 diff; full C2 table kept above.
- C6 verdict: RESTORED (STOP-D). Whether missing valids fired is reported, never a condition; the condition that failed is the kept take.
- C7 trader lines: "Your indicator's 4-hour, 1-hour and 15-minute slots now read the charts their names say, on the 3,000-bar window you asked for." "Your 28 Aug, 4 Sep and 7 Sep takes and both refusals came out identical; your 8 Sep 17:00 short did not come this time." "Of your three missing trades, the 1 Sep 17:35 long and the 8 Sep 10:10 short appeared but were stopped before entry, and the 7 Sep 09:20 long traded from 1.16135 to 1.16200."

## Part D - restore
- D1 (always): FlowLogic.mq5 + ex5 from `.preB29` (956BF3E3 / 27B5F272), empty diff vs backup verified.
- D2 (STOP): EA.mq5 + ex5 from `.preB29` (964803F4 / 7C46B16C), empty diff vs backup verified.
- D3 kept on disk, untracked, never committed: `.preB29` (all four), `.B29X` (EA Hunk X, 70E68EE1), `.B28W` (print hunk, 430FB4D3).

## Part E - final disk state
- EA mq5 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8; EA ex5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994 (matches source; RESTORED). No STOP-E.
- FlowLogic 956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342 / 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90.
- HTFEngine D5FD5B06 (re-taken, unchanged).
- Relay skill 865E87500698166BB3E5EEC7B508E2381492C7C5E5B78BA9EDFC1965DDAFB646 (A1). Ledger FB031D85B53C2B0F5FE034E426AAB54808C3833181328A58A480D9B545180B62 (F3, item 1170). Quirks E8EF30FA (unedited: F4 needs KEPT, verdict is RESTORED, so no entry).
- terminal.ini June USDJPY (USDJPY/1780272000/1781308800), read back after exit; no terminal and no agents running (verified).

### Glossary (every journal code cited, few words each)
- A6FIRED: fire record (election). A6REFUSED: refusal record. ALERT SRJ SIGNAL/EXIT: entry/exit alert. ENTRY_TICKET/MTEXIT: fill/exit records. ABORT (TP_RR_FAIL/LTF_MISALIGN/SEEDBIAS_REFUSED/DIV_FALLBACK/FRESH_OB_DEAD/FRESH_OPP_FVG/FRESH_VETO/SESSION_CLOSED/HOLDER_EXPIRED/MEMO_IDENTITY): abort + reason. UJ5MENTRY_REFUSE: entry-bias refusal. UJPROBE (h4/h1/m15/ltf/div per-bar): per-bar bias/div probe. UJM15ROW: 15m vote at 15m ticks. UJALIGN_PASS/NOMATCH/BYPASS: 15m guard. SRJ-FL-B28IN: FlowLogic start-up input print. SRJ BUILD: indicator build stamp. final balance: tester end balance. Test passed: tester completion marker. program file added: loader line with byte size.

## Part F - files and push
- F1 this file. F2 pointer (B-29 RESTORED; EA restored SHA; MAPPING_FIXED=yes; GROUP_SHIFT_OTHER=none; ledger 1170; Next = relay B-30).
- F3 ledger 1170 (grep `B29-ICUSTOM-SHIFT-FIX` was 0; appended the relayed item; new SHA FB031D85B53C2B0F5FE034E426AAB54808C3833181328A58A480D9B545180B62).
- F4 quirks: skipped (needs KEPT; verdict RESTORED).
- F5 commit + push to builder/B-29 ONLY: BUILDER_RESULT_B29.md, BUILDER_SESSION_POINTER.md, SRJ_FLOW_NEXUS_LEDGER.md, .opencode/skills/srj-relay/SKILL.md. No EA/indicator/Include/journal/backup/log/ini.
- F6 ls-remote check pasted under the reply line.

## Carried note - must contain
- Gate/STOP per part: 0.4 all SHAs matched (no STOP-A); A1 APPENDED (post 1, 865E8750), A2/A3 unchanged; P1/P2 equal, CTF_5MIN_VALUE=1, GROUP_SHIFT_OTHER=none (no STOP-P); B 0/0 + 0/0, Hunk W diff equal (no STOP-B); C1 count 1 == fixed (no STOP-W); C2 STOP-D (9/8 16:55 absent); C3/C4 measured; E SHAs matched (no STOP-E). Verdict RESTORED, all four files restored + verified.
- CTF_5MIN_VALUE=1
- GROUP_SHIFT_OTHER=none
- MAPPING_FIXED=yes, raw C1 row: `FI 0 21:56:16.522 Core 04 2026.08.26 00:00:00   SRJ-FL-B28IN ctf=1 lookback=3000 htf1=16388 htf2=16385 htf3=15 conf=1 maxobj=60 H4=16388 H1=16385 M15=15 M1=1` (segment line 92; day-log 20261005.log:760912; count 1).
- SIX_MARKS=moved:9/8-16:55-absent (8/28, 9/4, 9/7-16:40 hold; both refusals held with changed signatures, neither fired).
- MISSING_VALIDS_FIRED=0901NY+0907LDN+0908LDN (all three fired): 0901NY bar 17:30 LONG tp 1.16077 sl 1.15975 R 1.17, entry unfilled (MEMO_IDENTITY 17:35, no ticket); 0907LDN bar 09:15 LONG tp 1.16200 sl 1.16098 R 1.76, TRADED entry 1.16135 exit TP_TOUCH 1.16200; 0908LDN bar 10:05 SHORT tp 1.16102 sl 1.16258 R 1.94, entry unfilled (MEMO_IDENTITY 10:10, no ticket).
- NEW_FIRES_OUTSIDE=0
- UJPROBE_DIFF=2535 of 3168, UJM15ROW_DIFF=523 of 1056
- Balance j14 10460.96 vs j13 10194.64.
- NOT_FOUND: no 9/7-NY or 9/8-NY journal rows (record-first search over 1056 rows); no EA program-file-added line (EA is the tested expert); no DONE file by design (RAM-order kill, graded from day-log markers).
- No next change is proposed here. The planner checks C2/C3 against his banked words before B-30.
