# BUILDER SLICE B-42 - raw rows behind P2-P5 and C1 (line numbers where applicable; payloads only)

Disk EA = 63B18C1F (untouched). TT install = C:\Program Files\Dukascopy MetaTrader 5 (data 3CA1B4AB...). HT data folder = 10CE948A...EBD4 (install C:\Program Files\Five Percent Online MetaTrader 5).

## P2 INDICATOR_COPIES (SHA | path | size | write time | install)
98C97984 | ...\3CA1B4AB...\MQL5\.kilo\worktrees\delightful-maize\Indicators\SRJ_FlowLogic.ex5 | 300070 B | 2026-09-16 13:22 | install=C:\Program Files\Dukascopy MetaTrader 5
956BF3E3 | ...\3CA1B4AB...\MQL5\.kilo\worktrees\delightful-maize\Indicators\SRJ_FlowLogic.mq5 | 70308 B | 2026-10-04 04:20 | install=C:\Program Files\Dukascopy MetaTrader 5
D5525014 | ...\delightful-maize\...\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\SRJ_FlowLogic.mq5 | 54078 B | 2026-09-16 12:57 | (snapshot, not live)
D5525014 | ...\delightful-maize\...\02_TASK_CHECKPOINTS\Rev060_Task155_Pre2_EditRegionAnchor\SOURCE_SNAPSHOT\SRJ_FlowLogic.mq5 | 54078 B | 2026-09-16 12:57 | (snapshot, not live)
27B5F272 | ...\3CA1B4AB...\MQL5\Indicators\SRJ_FlowLogic.ex5 | 236500 B | 2026-10-04 20:52 | install=C:\Program Files\Dukascopy MetaTrader 5 (LIVE binary)
956BF3E3 | ...\3CA1B4AB...\MQL5\Indicators\SRJ_FlowLogic.mq5 | 70308 B | 2026-09-30 06:18 | install=C:\Program Files\Dukascopy MetaTrader 5 (LIVE source)
2E7DDA70 | ...\3CA1B4AB...\...\02_TASK_CHECKPOINTS\Rev060_Task155_ExportStage_Buffer34\BEFORE\SRJ_FlowLogic.mq5 | 52899 B | 2026-09-30 06:18 | (snapshot, not live)
2E7DDA70 | ...\3CA1B4AB...\...\02_TASK_CHECKPOINTS\Rev060_Task155_Pre2_EditRegionAnchor\SOURCE_SNAPSHOT\SRJ_FlowLogic.mq5 | 52899 B | 2026-09-30 06:18 | (snapshot, not live)
73175600 | ...\47AEB69ED...\MQL5\Indicators\SRJ_Flow_Logic\SRJ_FlowLogic.mq5 | 32280 B | 2026-07-28 05:33 | install=C:\Program Files\OANDA TMS MT5 Terminal (old, underscore dir, no ex5)
D07530E5 | ...\47AEB69ED...\MQL5\Indicators\SRJ_FlowLogic.mq5 | 52525 B | 2026-07-27 23:08 | install=C:\Program Files\OANDA TMS MT5 Terminal (old, no ex5)
HT_EX5_DIFFERS = NO (no SRJ_FlowLogic copy of any kind under 10CE948A...EBD4; wider *FlowLogic*/*Flow_Logic* sweep also empty outside the rows above).

## P3 .chr hits (all under 3CA1B4AB...\MQL5\Profiles\Charts\Default; UTF-16LE; one SRJ_FlowLogic block each)
- chart28.chr symbol=USDJPY period_size=5; chart29 USDJPY M5; chart30 USDJPY M5; chart31 USDJPY M5; chart32 EURUSD M5; chart33 EURUSD M5; chart34 EURUSD M5; chart36 EURUSD M5.
- Block (identical all 8): `<indicator> name=Custom Indicator path=Indicators\SRJ_FlowLogic.ex5 apply=0 show_data=1 ... <graph> Fractal High ... <graph> Fractal Low ... <inputs> HTF Automation= inChartTradingTF=1 inHtfLookbackBars=3000 inHtf1_manual=16388 inHtf2_manual=16385 inHtf3_manual=15 inUseConfirmedHTFOnly=false inHtfMaxTrackedObjects=60 inHtfHighTarget=0 inHtfMidTarget=0 inHtfLowTarget=0 inDebugFromTime= inDebugToTime= (Bias/OB/FVG/Fractal/Session/Performance/Alert/MTF/ Sweep/Port groups all defaults; full text in working file B42_FLBLOCK.txt)`.
- EA-vs-chart differing name: inUseConfirmedHTFOnly (chart false vs EA true). Lookback/periods/targets identical.
- .tpl sweep under 10CE948A...EBD4 Templates: ADX/BollingerBands/default/Momentum .tpl, no SRJ_FlowLogic string in any .chr/.tpl there.

## P4 MaxBars (both absent)
- TT config\terminal.ini: no [Charts] section, no MaxBars key (full sweep). MAXBARS_TT = NOT_FOUND.
- HT config\terminal.ini: TradeHistory* only, no [Charts]/MaxBars. MAXBARS_HT = NOT_FOUND.

## P5 DrawTrend name (Include/SRJ/SRJ_Draw.mqh:60-68, SRJ_State.mqh:515-522)
- `string name = SRJ_NextName(category);` + `ObjectCreate(0,name,OBJ_TREND,0,t1,y1,t2,y2)`; `name = "SRJ_" + category + "_" + seq`. BiasChange call passes category "BiasChange" (SRJ_Draw.mqh:201) -> names `SRJ_BiasChange_<seq>`.

## C0/C1 launch rows
- WMI_PID=9672 RC=0 LAUNCHED B42-CHART (script launch_b42_chart.ps1).
- Terminal journal 20261006.log: `HE 0 14:12:36.086 Startup successfully initialized from start config "...\B42_START.ini"`; `HG 0 14:12:37.906 Indicators custom indicator SRJ_FlowLogic (USDJPY,M5) loaded succesfully`.
- Experts log: `GL 0 14:12:37.935 SRJ_FlowLogic (USDJPY,M5) SRJ BUILD 2026.10.04 20:52:13 refOk=invOnly diag=v9_perm` (= 27B5F272 binary).
- Live tail sample (14:14:33-14:14:38): `SRJ_FlowLogic (USDJPY,M5) SRJ-HTF-UJDBG chart=2026.10.06 ...` repeating per tick (debug flag ON via template; instance computing today).
- B42_CHART.tpl as written (UTF-16LE BOM, 18776 B): chart28.chr base (USDJPY M5), Main price block kept, POI_Marker + CQD blocks removed (one custom indicator left), debug flips verified true/"2026.06.05 07:00"/"2026.06.05 10:00". B42_START.ini: `[StartUp] / Symbol=USDJPY / Period=M5 / Template=B42_CHART.tpl` (no Expert/Script).
- Zero-count evidence: `SRJ DEC t=2026.06.05 0[789]` in MQL5\Logs\20261006.log = 0 rows; `SRJ DEC t=2026.06` = 0; `SRJ DEC t=2026.10` = 0 (full-file scans). No B42 profile folder was created by the launch (no profiles\charts\B42 anywhere).

## C3 STOP-H snapshot diff (138 files before -> 139 after; Profiles tree + config\terminal.ini)
- NEW (deleted after): MQL5\Profiles\Charts\British Pound\chart05.chr.
- CHANGED (view-state re-saves on terminal exit; content-restore impossible, no before-copies - owned defect): British Pound chart01/02/03/04.chr (all still well-formed: 3 indicator blocks each, closed tag present; indicator blocks re-verified intact with inUseConfirmedHTFOnly=false); config\terminal.ini ([Tester] window intact: Symbol=USDJPY DateFrom=1780272000 DateTo=1781308800; churn elsewhere).
- Templates + all other profiles: SHAs identical before/after.
- B42_CHART.tpl + B42_START.ini deleted after; no B42 remnants (re-swept, empty).

(End of slice)
