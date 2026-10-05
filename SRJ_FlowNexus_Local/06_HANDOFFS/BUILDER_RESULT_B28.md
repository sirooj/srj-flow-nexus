# BUILDER RESULT B-28 - B-27 redundant banking banked with grep-first gate, FlowLogic start-up inputs prove Mapping B (input-group shift); six marks hold; MEASURED (trial record)

Trader summary: the banking repeat from last time is now on the record with a check that stops it happening again, and nothing was lost or doubled. The one start-up print proves the shift you suspected: at start-up the EA hands the bias indicator its settings moved one place along, so its 4-hour slot reads the 1-hour chart, its 1-hour slot reads the 15-minute chart, its 15-minute slot reads the 1-minute chart, and its history window is 16,388 bars instead of the 3,000 asked for. All four of your good takes and both refusals came out identical, to the cent. Verdict MEASURED. The fix is not made here; that belongs to the next relay.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first. Relay B-28 wins over older queue items for its scope.
- 0.2 ls-remote GitHub builder/B-27 returns `59f31c5e12c14f8b314e9e302868e8e404b12d4a refs/heads/builder/B-27` (verified). Branch builder/B-28 cut from 59f31c5. Dirty tree kept (106 `git status --short` lines; relay said 102, measured 106, nothing reset). No git-config/remote change. Pushes go through remote `backup`.
- 0.3 read in order: AGENTS.md; srj-relay skill; srj-strategy skill sections 6/8/11/12 (lines 97-148; section 12 his latest banked word); pointer; BUILDER_RESULT_B27.md (carried note first, then C0/C1/C2); BUILDER_REF_MQL5-QUIRKS.md sections 1/2/5.
- 0.4 `git log -1`: `59f31c5e12c14f8b314e9e302868e8e404b12d4a B-27 R2 banked, export rewrites measured, six marks hold, MEASURED (relay B-27, planner side)`. Status count 106 (see 0.2 note). SHA-256 gate, all match (no STOP-A):
  - EA `Experts/SRJ_FlowNexus_EA.mq5` 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8 (688599 B, uncommitted == .B20SRV).
  - EA ex5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994 (matches source).
  - HTFEngine `Include/SRJ/SRJ_HTFEngine.mqh` D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755 (23026 B, uncommitted).
  - FlowLogic.mq5 956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342 (70308 B, 1471 LF lines).
  - FlowLogic.ex5 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90 (matches source).
  - strategy skill E238A9D69638ABE627D231DD74BB4E14BD65C30F46ADD2CCA0F368FD6B88DB48 (54789 B, 148 lines).
  - relay skill disk 58785A0709A3FE2706F914B1BB957656173E12F1A68EC7BE121E29666690EFA5 vs expected C23D8288: ACCOUNTED case (A1 grep finds the gate bullet already on disk unpushed; B-27 did not push this file, GitHub holds the older text). Reported, no STOP-A.
  - journal 23329BCB141E67AC3799406A038839F335DD8AAE4A8B2D4BB73CC8AF34298B6D (146608 B, 1057 lines; not edited this turn).
  - ledger 03CC71B779023B6BEDAA9671737CED3D0E566C295F161A06632CC9BDDB0E066F (last item 1167).
  - `git diff 59f31c5 --` empty for BUILDER_SESSION_POINTER.md, BUILDER_RESULT_B27.md and PROMPTQL_PLANNER_CONTEXT.md (verified).
- 0.5 names: j12 = RECON62-B27W_JOURNAL.log (PASSED, 3168 bars, 10194.64, baseline); j13 = RECON62-B28I_JOURNAL.log (this relay). RECON62 = EURUSD M5 26 Aug - 9 Sep 2026. Six marks / four valids / vote identity / Hunk W (`SRJ-FL-B28IN`) / Mapping A-B / STOPs / backups as relayed.
- 0.6 backups before any source edit: `Indicators/SRJ_FlowLogic.mq5.preB28` 956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342; `Indicators/SRJ_FlowLogic.ex5.preB28` 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90. EA/EX5/HTFEngine untouched, no backup.

## Part A - records first (grep-first applied to every step)
- A1 relay skill gate. Pre-edit grep (case-insensitive): `Grep before banking` 0; `grep` 1; `landing commit` 1. Count 0: APPENDED exactly the relayed bullet as the last bullet of the Result file section. Post-edit grep count 1. New SHA 2433F4C58BB3454852D49A6353C1F388D9B90170DA5D31D6B83E210770BB65AB (5475 B, 55 lines). (A further Trial-discipline bullet for the owned C0 launch defect is recorded under Part C0/F4; final skill SHA in Part E.)
- A2 ledger item 1168. Pre-edit grep `B27-REDUNDANT-BANKING` 0; tail item 1167 confirmed. Last item is 1167 so 1168 used. APPENDED exactly the relayed text. New SHA 8D5979262400F75FCB991080D27B3089A0BF4CA89CFB5B73C1687651A54247F0 (count post-edit 1). (Item 1169 for the owned launch defect recorded under Part C0/F4; final ledger SHA in Part E.)
- A3 planner context. Pre-edit grep `Banking grep-first` 0. APPENDED exactly the relayed bullet as the last bullet of `## 3. Wiki page: B-series relay lane`. New SHA F390DC476FD9C1CA99271563DA5596DEB132CF05CFAC5039C75050F83D95FC36 (count post-edit 1).
- A4 journal. No row this turn (no new words of his). Row count 1057, SHA 23329BCB141E67AC3799406A038839F335DD8AAE4A8B2D4BB73CC8AF34298B6D (unchanged).

## Part P - pre-checks (read-only, nothing edited)
- P1 FlowLogic input order, raw (real line numbers):
  - 246: `input group "HTF Automation"`
  - 247: `input ENUM_CHARTTF    inChartTradingTF   = CTF_5MIN;`
  - 248: `input int             inHtfLookbackBars  = 3000;`
  - 249: `input ENUM_TIMEFRAMES inHtf1_manual      = PERIOD_H4;`
  - 250: `input ENUM_TIMEFRAMES inHtf2_manual      = PERIOD_H1;`
  - 251: `input ENUM_TIMEFRAMES inHtf3_manual      = PERIOD_M15;`
  - 252: `input bool            inUseConfirmedHTFOnly = false;`
  - 253: `input int             inHtfMaxTrackedObjects = 60;`
  - FIRST_INPUT_LINE=`input group "HTF Automation"`. GROUPS_BEFORE_LOOKBACK=1. INPUTS_BEFORE_LOOKBACK=1.
- P2 EA call, raw. `g_hFlow = iCustom(` hits: 1.
  - 11208: `g_hFlow = iCustom(_Symbol, PERIOD_CURRENT, InpFlowLogicName,`
  - 11209: `1, InpFL_HtfLookbackBars,`
  - 11210-11212: three `//---` comment lines (P-UJIMPL confirmed-selection note).
  - 11213: `PERIOD_H4, PERIOD_H1, PERIOD_M15, true, 60);`
  - Declarations: line 25 `input string InpFlowLogicName   = "SRJ_FlowLogic";`, line 51 `input int    InpFL_HtfLookbackBars = 3000;`. Current call ends `true, 60);` as relayed (all-7 `false` not re-measured per relay).
- P3 predictions, copied as given (Hunk W prints the values itself; this table is read from the print, never trusted from this line):
  | Field | Mapping A (each argument lands on the next real input) | Mapping B (the `input group` line takes the first argument) |
  |---|---|---|
  | ctf (inChartTradingTF) | 1 | 3000 |
  | lookback (inHtfLookbackBars) | 3000 | 16388 |
  | htf1 | 16388 (H4) | 16385 (H1) |
  | htf2 | 16385 (H1) | 15 (M15) |
  | htf3 | 15 (M15) | 1 (M1) |
  | conf (inUseConfirmedHTFOnly) | 1 | 1 (60 read as true) |
  | maxobj | 60 | 60 (default) |
- P4 CLEAN. Hunk W is print-only (no value/branch/order/handle change, no copy/mirror); no trading rule touched, rule-conflict check N/A. Pins quoted raw from the strategy skill (relay lines 91/93):
  - REFINE-ONLY: `- REFINE-ONLY (his order 2026-09-25, verbatim core: "do not alter other logic in the EA cause the previous EU test range date is already correct. only refine, don't invent anything drastic."). Amended point: the five USDJPY rules ride as refinements to retest/confirmation/target logic ONLY; all other EA logic untouched; the EURUSD 8/26-9/9 window (RECON62 full-window zero-delta) is the regression anchor every future build re-proves before anything else grades. Council route.`
  - FIX-NOT-REPLACE: `- FIX-NOT-REPLACE (his order 2026-09-26, verbatim: "I said the HTF engine of the SRJ Flow Logic is sometimes not accurate that means i want you to fix it to be more accurate and robust, NOT replacing it."). Amended point: the engine is repaired from inside (confirmed repaint-free bias + a flip signal that actually fires, matching his chart) - no second indicator copy, no EA-side mirror; both handle options (isolated confirmed handle + granted 15m copy) WITHDRAWN, the granted second-15m-copy scope SUPERSEDED by this later word. Accurate = the machine's confirmed read equals his chart read at the bar; robust = no open-instant repaint, flip signal fires. Council rules the indicator-side fix; the EA only consumes it.`
- P5 hunk spot. `Print("SRJ BUILD ", __DATETIME__,` count: 1 (line 671). Raw `int OnInit()` through first `SetIndexBuffer(0,`:
  - 669: `int OnInit()`
  - 670: `  {`
  - 671: `   Print("SRJ BUILD ", __DATETIME__, " refOk=invOnly diag=v9_perm");`
  - 672: `   SetIndexBuffer(0,g_bufFractalHigh,INDICATOR_DATA);`

## Part B - one edit (Hunk W, print-only, FlowLogic only)
- B1 inserted exactly the relayed 3 lines after the line-671 print at 3-space indentation; nothing else changed.
- B2 diff `.preB28`-vs-edited: exactly one hunk, pure insertion (+3 lines), nothing else. Full diff raw:
  - `diff --git a/Indicators/SRJ_FlowLogic.mq5.preB28 b/Indicators/SRJ_FlowLogic.mq5`
  - `index ea9d5e0..9c34e5c 100644`
  - `--- a/Indicators/SRJ_FlowLogic.mq5.preB28`
  - `+++ b/Indicators/SRJ_FlowLogic.mq5`
  - `@@ -669,6 +669,9 @@ bool SRJ_InDebugWindow(const int bar)`
  - ` int OnInit()`
  - `   {`
  - `    Print("SRJ BUILD ", __DATETIME__, " refOk=invOnly diag=v9_perm");`
  - `+   PrintFormat("SRJ-FL-B28IN ctf=%d lookback=%d htf1=%d htf2=%d htf3=%d conf=%d maxobj=%d H4=%d H1=%d M15=%d M1=%d",`
  - `+               (int)inChartTradingTF, inHtfLookbackBars, (int)inHtf1_manual, (int)inHtf2_manual, (int)inHtf3_manual,`
  - `+               inUseConfirmedHTFOnly ? 1 : 0, inHtfMaxTrackedObjects, (int)PERIOD_H4, (int)PERIOD_H1, (int)PERIOD_M15, (int)PERIOD_M1);`
  - `    SetIndexBuffer(0,g_bufFractalHigh,INDICATOR_DATA);`
  - `    SetIndexBuffer(1,g_bufFractalLow, INDICATOR_DATA);`
  - `    ArraySetAsSeries(g_bufFractalHigh,false);`
  - Edited SHA 430FB4D3456374AE8A98A568A5E3DEEE0F91F1C98D611D95C06D9F4CBEBE3DFC. Kept copy `Indicators/SRJ_FlowLogic.mq5.B28W` same SHA, never committed.
- B3 FlowLogic compiled ONLY (not EA, not All). Log `SRJ_FlowNexus_Local/06_HANDOFFS/B28W_FLCOMPILE.log` (14608 B): `Result: 0 errors, 0 warnings, 5886 ms elapsed, cpu='X64 Regular'`. Gate 0/0 met, no STOP-B. New FlowLogic.ex5 009367AFC59A337BF06EC85D90E65285C5190FB1F430B2F83E67B4EF915E2137 (236836 B). EA not recompiled; it loads FlowLogic.ex5 by name.

## Part C - one run j13 (RECON62-B28I_JOURNAL.log, 77276 lines, 15131981 B, SHA 023BDA7075BA128F1CD3476F0990D7DBD277E551DFF9E370C4F905C29B8BF52A, local unpushed)
- C0 hygiene (same procedure as B-27 C0): no terminal before launch (verified); RECON62 window set in terminal.ini [Tester] via the Edit tool on the exact six-line block (Expert/Symbol/Period/DateRange/DateFrom/DateTo = Experts\SRJ_FlowNexus_EA.ex5 / EURUSD / 5 / 3 / 1787702400 / 1788998400), read back and verified. Run ini `RECON50_DEMO_USD.ini` pattern (EURUSD M5, InpMode 1, InpDebugLog true). First WMI launch used an inline command string (WMI_PID 19632 RC=0) but wrote no STATUS and started no terminal: owned quoting defect, recorded as ledger 1169 with a Trial-discipline gate in the relay skill (launch from a script file, never inline). Recovered with script-file launch `SRJ_FlowNexus_Local/00_CURRENT_WORKING/launch_recon62b28i_run.ps1` (known-good pattern): WMI_PID 14052 RC=0, terminal PID 15004, STATUS `RECON62-B28I_STATUS.txt` (PRE_JOURNAL_LINES=683544, day log 20261005.log). Window proof (journal line only), full text:
  - day-log 683561: `DH 0 20:16:12.137 Tester EURUSD,M5 (Dukascopy-demo-mt5-1): testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00`
  - day-log 683587: `QE 0 20:16:19.372 Core 04 EURUSD,M5: testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00 started with inputs:`
  - Same window as j12. Per his RAM order the wrapper shell (PID 14052, re-reading the day log every 10 s) was killed once the window verified; terminal + tester agent survived. No DONE file (STATUS keeps the archive slice). Run completed 21:14:47: `EURUSD,M5: 563338 ticks, 3168 bars generated. Environment synchronized in 0:00:01.021. Test passed in 0:58:34.571` (ticks and bars digit-identical to j12; duration 0:58:34 vs j12 0:51:57). Segment sliced from PRE_JOURNAL_LINES (77276 lines). Tester day log read as UTF-16. After exit the leftover terminal was stopped (CloseMainWindow refused on the headless process; idle leftover stopped, verified gone, agents gone) and the ini restored to June USDJPY via the Edit tool on the exact six-line block and read back (Symbol=USDJPY, 1780272000/1781308800).
- C1 Hunk W rows. `SRJ-FL-B28IN` count: 1 (the EA's FlowLogic handle; no PRINTS_ABSENT). Raw with journal line numbers (segment line 92 = day-log 683636):
  - `ON 0 20:16:19.372 Core 04 2026.08.26 00:00:00   SRJ-FL-B28IN ctf=3000 lookback=16388 htf1=16385 htf2=15 htf3=1 conf=1 maxobj=60 H4=16388 H1=16385 M15=15 M1=1`
  - Field-by-field vs P3: ctf 3000 = B; lookback 16388 = B; htf1 16385 = B; htf2 15 = B; htf3 1 = B; conf 1 = B; maxobj 60 = B. No field differs.
  - MAPPING=B
  - LOOKBACK_IS_H4=yes
  - SLOT1_TF=16385
  - SLOT3_TF=1
  - CONF_PRINTED=1
  - Run-build proof the B28 ex5 was live: `SRJ BUILD 2026.10.05 20:06:50` stamp (= our compile minute), `program file added: \Indicators\SRJ_FlowLogic.ex5. 236869 bytes loaded`.
- C2 six marks, j13 vs j12 (all ✓, j13 segment line numbers):
  - 1. 8/28 SHORT ✓ (A6FIRED j13:14046 bar 10:00 tp=1.16364 r=2.43 sl=1.16508, byte-identical to j12:14959; EXIT j13:14471 `POI_BODY_BREAK [Daily-POC] at 1.16439 (entry 1.16466)`; ENTRY_TICKET j13:14062; MTEXIT j13:14463 entry=1.16466 exit=1.16439).
  - 2. 9/4 LONG ✓ (A6FIRED j13:45012 bar 15:55 tp=1.16302 r=1.66 sl=1.15847, identical to j12:47900; EXIT j13:46743 `DAY_CLOSE at 1.16093 (entry 1.16018)`; MTEXIT j13:46735 entry=1.16018 exit=1.16093).
  - 3. 9/7 LONG ✓ (A6FIRED j13:51951 bar 16:40 tp=1.16315 r=2.34 sl=1.16238, identical to j12:55226; EXIT j13:52093 `TP_TOUCH at 1.16315 (entry 1.16261)`; MTEXIT j13:52091 entry=1.16261 exit=1.16315).
  - 4. 9/8 SHORT ✓ (A6FIRED j13:60185 bar 16:55 tp=1.16114 r=1.96 sl=1.16274, identical to j12:63842; EXIT j13:60378 `SL at 1.16274 (entry 1.16220)`; MTEXIT j13:60376 entry=1.16220 exit=1.16274).
  - 5. 8/27 no fire ✓ (ABORT TP_RR_FAIL j13:12081, identical text to j12:12727).
  - 6. 9/1 refused ✓ (UJ5MENTRY_REFUSE j13:23803 bar 09:50 LONG, identical to j12:25448).
  - A6FIRED set equals j12: 4 FIRED + 4 ALERT SIGNAL + 4 ALERT EXIT + 4 ENTRY_TICKET + 4 MTEXIT (4 signals / 8 deals); ABORT_TP_RR 4/4; UJ5MENTRY_REFUSE 1/1; UJPROBE 3168/3168; UJM15ROW 1056/1056; UJALIGN 308/308. Balance j13 10194.64 (day-log 746777 `final balance 10194.64 USD`) == j12 10194.64.
  - Segment delta accounted: 77276 vs j12 81413 = -4142 B27V rows +1 B28IN row + run-specific preamble/epilogue variants (wall-clock stamps, CQD ms timings, ex5 byte size); every [SRJ] tag count identical.
  - Vote identity j13-vs-j12: UJPROBE payloads (wall-clock stripped) 3168 of 3168 identical, machine-compared. No STOP-N.
- C3 STOP rules: no STOP-A (gate SHAs with the accounted relay-skill case only); no STOP-B (0/0); no STOP-D (all marks hold, set equal, balance equal); no STOP-N (3168/3168); no STOP-S (4 FIRED on the same four bars, nothing outside the four valids); no STOP-E (Part E SHAs, below). A print-only hunk moved no number. Verdict MEASURED.
- C4 trader lines: "At start-up the EA hands the bias indicator its settings shifted one place along, so none of its slots reads the chart its name says. Your 4-hour slot reads the 1-hour chart, your 1-hour slot reads the 15-minute chart, and your 15-minute slot reads the 1-minute chart." "Its history window is 16,388 bars instead of the 3,000 asked for, and that is where the engine's oversized replay comes from."

## Part D - restore (always)
- D1 FlowLogic.mq5 + FlowLogic.ex5 restored from `.preB28`: 956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342 / 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90, empty diff vs backup (verified).
- D2 `.preB28` (both) + `.B28W` (edited mq5 430FB4D3) kept on disk, uncommitted (untracked). The B28-compiled ex5 (009367AF) lived only for the run (proven by the BUILD stamp + B28IN print) and was restored over after.

## Part E - final disk state
- Re-taken SHAs, all equal gate values (no STOP-E): EA 964803F4FD452349D67FDC31A73A7B297D4BB93726FA69086DB0A60283AE74F8; EX5 7C46B16C035A9F19B936FD4899BEC0289AD82C8F4AF8B652B0FA6D7A3DC54994 (matches source); HTFEngine D5FD5B063E75628745B27E57133E58ACD19F470D4036DC4B2567CE1BE5053755; FlowLogic.mq5 956BF3E3ADB7064DAD89A0D2F97BFCAC6D706E40E39B6817EFB29F1A04418342; FlowLogic.ex5 27B5F272DCFAF6089CBE6E74DB2D61A1EBA49904720EB2C41FF56A22B46DDF90.
- A-edited docs: relay skill 298AC58541494C7AF89C1D21B80EDAC9AC235D6A13252C0D88BF39AF58774CFD (A1 gate bullet + B-28 launch-script bullet); ledger 9F90A304336D9A1AC33F2840D7145B88523C60F8051873EE36938DE4515FDAD9 (items 1168 + 1169); planner context F390DC476FD9C1CA99271563DA5596DEB132CF05CFAC5039C75050F83D95FC36; quirks (below).
- terminal.ini [Tester] June USDJPY (Symbol=USDJPY, 1780272000/1781308800), read back after exit; no terminal and no agents running (verified).
- Kept copies with SHAs: `.preB28` mq5 956BF3E3 / ex5 27B5F272; `.B28W` mq5 430FB4D3456374AE8A98A568A5E3DEEE0F91F1C98D611D95C06D9F4CBEBE3DFC. Each kept EX5 matches its source.

### Glossary (every journal code cited, few words each)
- A6FIRED: fire record. ALERT SRJ SIGNAL/EXIT: entry/exit alert. ENTRY_TICKET/MTEXIT: fill/exit records. ABORT (TP_RR_FAIL): no-fire + reason. UJ5MENTRY_REFUSE: entry-bias refusal. UJPROBE (ltf/m15/div per-bar): per-bar bias/div probe. UJM15ROW: 15m vote at 15m ticks. UJALIGN_PASS/NOMATCH/BYPASS: 15m guard. UJTAKENSKIP: taken-line skip. SIDE1D_BOTHDIRS: direction selection. SUPPRESSED (HELD): holder kept. SRJ-FL-B28IN (ctf/lookback/htf1/htf2/htf3/conf/maxobj/H4/H1/M15/M1): FlowLogic start-up input print. SRJ BUILD: indicator build stamp. final balance: tester end balance. Test passed: tester completion marker.

## Part F - files, push
- F1 this file. F2 pointer updated (B-28 MEASURED; SHAs unchanged/restored; MAPPING=B line; Next = relay B-29).
- F3 `BUILDER_REF_MQL5-QUIRKS.md`: MAPPING=B, so one dated entry added under section 1 (ICUSTOM-INPUT-GROUP-SHIFT, with the j13 B28IN evidence line, stating the `input group` line consumes the first iCustom argument).
- F4 commit + push to builder/B-28 on GitHub ONLY: BUILDER_RESULT_B28.md, BUILDER_SESSION_POINTER.md, .opencode/skills/srj-relay/SKILL.md (reaches GitHub this time), SRJ_FLOW_NEXUS_LEDGER.md, PROMPTQL_PLANNER_CONTEXT.md, BUILDER_REF_MQL5-QUIRKS.md. No EA/indicator/Include/journal/backup committed or pushed.
- F5 ls-remote check pasted below (commit hash + reply line).

## Carried note (for the planner; B-29 per its plan)
- Gate/STOP status: A-clean (gate SHAs with the accounted relay-skill case; A1-A3 APPENDED, A4 no row) / B-clean (0 errors 0 warnings) / C-clean (PASSED 0:58:34, 563338 ticks, 3168 bars); no STOP-A/B/D/N/S/E. Verdict MEASURED, disk restored and verified.
- C1 lines verbatim:
  - MAPPING=B
  - LOOKBACK_IS_H4=yes
  - SLOT1_TF=16385
  - SLOT3_TF=1
  - CONF_PRINTED=1
  - Raw: `ON 0 20:16:19.372 Core 04 2026.08.26 00:00:00   SRJ-FL-B28IN ctf=3000 lookback=16388 htf1=16385 htf2=15 htf3=1 conf=1 maxobj=60 H4=16388 H1=16385 M15=15 M1=1` (segment line 92; day-log 20261005.log:683636; count 1).
- A1-A3 outcomes: A1 APPENDED (relay-skill grep-first bullet; post grep 1; SHA 2433F4C5 at the time); A2 APPENDED (ledger 1168; SHA 8D597926 at the time); A3 APPENDED (planner-context bullet; SHA F390DC47). Extras this turn, same push set: relay-skill Trial-discipline launch-script bullet (defect owned, C0) and ledger 1169; final SHAs in Part E.
- Anything NOT_FOUND: none this turn (B28IN printed; all marks found; no DONE file by design after the RAM-order wrapper kill - graded from the day-log completion markers).
- Do NOT propose or make the fix in this relay: MAPPING=B stands measured; the fix belongs to B-29 after the planner checks it against his banked words.
