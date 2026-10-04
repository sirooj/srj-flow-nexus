# BUILDER RESULT B-10 - day-close-everywhere edit: EURUSD regression 1/7 takes, STOP rule C fired, RESTORED, no June run (measurement + trial record)

Step 0 raw, Part A start gate (measured 2026-10-04, terminal disk):
- git log -1: 9c79087 B-9 zero-tolerance measure: 14:35 alone is his retest+confirmation; EA checks 14:30 and fails it; guard blocked the allowed path, MEASURED (relay B-9, planner side)
- git status --short line count: 34
- EA SHA-256 Experts/SRJ_FlowNexus_EA.mq5: F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582 (starts F04AF9C3, the B-7 kept build; gate passed)
- Branch builder/B-10 created from 9c79087 this turn.
- Backup Experts/SRJ_FlowNexus_EA.mq5.preB10 written before editing; its SHA-256: F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582 (685444 B, identical to the EA; never committed).
- Skills loaded whole this block: srj-relay (48 lines), mql5-reference (10 lines) plus BUILDER_REF_MQL5-QUIRKS.md whole (52 lines). Rule-conflict check: the edit implements his UNIVERSAL day-close rule (skill section 1, 2026-09-21 words; section 5 BOTH-TRUE universal; REFINE-ONLY allows it, no rule changes, no tolerance) - no conflict, proceeded.

## Part B - the edit (spots located by text, pasted raw with real line numbers before editing)

B1 spot, raw (EA 11031-11034, 1 hit each; single-line body plus closing brace, structure as the relay expects):
11031: bool SrjNewsIsOpen()
11032:    {
11033:     return (g_mtrade.active && g_mtrade.state != MT_CLOSED);
11034:    }
Inserted directly after the 11034 closing brace, nothing else changed: the 13-line SrjDayCloseMarkAtOrAfter function exactly as the relay lists (TC_DayStart + TimeToStruct + TC_ZoneToServer(TC_MakeTime(..., 16, 55), TZ_NEWYORK) + TC_ShiftDayStart - the same converter calls SrjNewsInit uses at EA 11007-11023, verified on disk; all five symbols pre-exist: TC_DayStart 8x, TC_ZoneToServer 13x, TC_MakeTime 12x, TC_ShiftDayStart 1x, TZ_NEWYORK 13x; new name SrjDayCloseMarkAtOrAfter 0x before, no collision).

B2 spot, raw (EA 12014-12021, 1 hit each: F3 comment, if-line, for-loop, dayMarks test):
12014: //--- [P-EXITMODEL-2 F3] day-close-minus-5 exit (his universal rule 2026-09-21: ...
12015: if(!vSL && !vTP && !vBREAK && !vHTF && g_news_init)
12016:   {
12017:    for(int dc = 0; dc < g_news_dayN; dc++)
12018:      {
12019:       if(g_mtrade.fillBarTime <= g_news_dayMarks[dc] && g_news_dayMarks[dc] <= barTime) { vDAY = true; break; }
12020:      }
12021:   }
Replaced ONLY the for loop (12017-12020) with the relay's two lines at the loop's indentation; the if-line and its braces stay; census (SrjNewsOnBar flatDay/flatWeek), SrjNewsInit, MTLIFE openAtDayClose and every other g_news_dayMarks use stay untouched.

B3 raw diff .preB10 vs EA: exactly the B1 insertion (+13 lines at 11032) and the B2 replacement (-4/+2 at 12027); nothing else. EA 12300 lines before, 12311 after (+11 net).

## Part C - compile + EURUSD regression (graded first)

C1 compile (metaeditor64 /compile + /log, log 06_HANDOFFS/B10_EACOMPILE.log, 7852 bytes):
- Raw result line: Result: 0 errors, 0 warnings, 6521 ms elapsed, cpu='X64 Regular'. First and only try.
- Rebuilt EX5 3587ADBF646D03169420D21D234FFDF5CD3478678CE4AFAEB4FCFF563DEEFC4F, 452272 bytes, compiled after the edit and before the run.

C2 run RECON62-B10 (ini RECON50_DEMO_USD.ini: EURUSD M5, Model 4, InpDebugLog=true, InpMode=1; window via config terminal.ini [Tester] after verified-close - no terminal running - set to DateFrom=1787702400/DateTo=1788998400, unix-verified 2026.08.26/2026.09.10; WMI launch RC=0 instant, wrapper RUNNING; window proven by journal line: EURUSD,M5 testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.08.26 00:00 to 2026.09.10 00:00).
- Journal saved as SRJ_FlowNexus_Local/06_HANDOFFS/RECON62-B10_JOURNAL.log: 9550857 bytes, 46721 lines.
- DONE RESULT=PASSED; Test passed in 0:50:09.884; 563338 ticks, 3168 bars (identical feed to RECON62: 563338/3168); final balance 10061.88 (RECON62: 10474.64 - differs, see STOP below).
- Own terminal leftover closed gracefully by builder after DONE (CloseMainWindow, verified gone, no force).

C3 filed-trade table, dates first, B-10 vs RECON62 (one row per take):

| take | B-10 entry | RECON62 entry | same? | B-10 exit | RECON62 exit | same? |
|---|---|---|---|---|---|---|
| 8/28 10:05 SHORT Daily-VWAP | 10:05:00 at 1.16466 (deal #2, size 2.38) | 1.16466 | same | 11:40 POI_BODY_BREAK at 1.16439 (deal #3 at 1.16440) | 8/28 11:40 BREAK 1.16439 | same |
| 9/1 17:35 LONG Monthly-VWAP | NO SIGNAL ROW (zero in journal) | 1.16024 | MISSING | none | 9/1 17:50 SL 1.15975 | MISSING |
| 9/4 16:00 LONG Yearly-POC | NO SIGNAL ROW | 1.16019 | MISSING | none | 9/4 Fri 23:55 DAY_CLOSE 1.16129 | MISSING |
| 9/7 09:20 LONG Weekly-POC | NO SIGNAL ROW | 1.16138 | MISSING | none | 9/7 10:50 TP 1.16200 | MISSING |
| 9/7 16:45 LONG Weekly-POC | NO SIGNAL ROW | 1.16264 | MISSING | none | 9/7 17:10 TP 1.16315 | MISSING |
| 9/8 10:10 SHORT Monthly-POC | NO SIGNAL ROW | 1.16205 | MISSING | none | 9/8 10:40 TP 1.16102 | MISSING |
| 9/8 17:00 SHORT Monthly-POC | NO SIGNAL ROW | 1.16220 | MISSING | none | 9/8 17:30 SL 1.16274 | MISSING |

Whole-journal counts (raw bytes, unfiltered): ALERT SRJ SIGNAL = 1, deal # = 2, MTEXIT = 1, final balance = 1. The single take's arithmetic closes the balance gap exactly: (1.16466 - 1.16440) x 2.38 x 100000 = +61.88 on 10000.00 = 10061.88.

STOP rule C: FIRED (6 takes missing, exit rows missing with them). Action taken: RESTORED the EA from .preB10 this turn (Copy-Item literal, no second attempt); post-restore EA SHA-256 F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582, 12300 lines, git diff --no-index preB10 vs EA empty (byte-identical). Part D NOT run. Report filed here.
- Config hygiene with the stopped run: config terminal.ini [Tester] restored to the June window (Symbol=USDJPY, 1780272000/1781308800, verified by independent read); the only byte drift vs the pre-run backup is 4 terminal-runtime UI lines the terminal wrote itself (TesterTab, RecompiledAll stamp, DockedTop, Dividers) - the [Tester] window lines are byte-identical to backup. No terminal running (verified gone).

## Part D - skipped per STOP rule C (no run, nothing graded)

## Part E2 - planner context file (workflow only)
- E2-1: SRJ_FlowNexus_Local/99_WORKFLOW/PROMPTQL_PLANNER_CONTEXT.md did not exist (verified absent before writing) - created.
- E2-2: written with exactly the relay-fence text (fences excluded), UTF-8: 4779 B, 45 lines, 0 non-ASCII bytes, SHA-256 4A6FDE8FA23DF55FE866502BCAAAA9A9FB05A380656C278E4739539AC0C9D75C. Read back head (12/45 lines above).

## Part F - pointer (State/Next only, cap 35 lines)
- Updated BUILDER_SESSION_POINTER.md (16 lines): latest result B-10, EA/.preB10/EX5 SHAs, Next = relay B-11 from the planner, plus the planner-context line. Digest census: every hash token resolves (pointer edit verified by read-back before commit).
- Push ONLY BUILDER_RESULT_B10.md, BUILDER_SESSION_POINTER.md and PROMPTQL_PLANNER_CONTEXT.md to builder/B-10. EA stays uncommitted (restored B-7 kept build, still M vs HEAD by design).

### Journal-code glossary (every code cited above, few words each)
- ALERT SRJ SIGNAL: full entry signal print (direction, line, session, R, SL, TP). MTEXIT: managed-trade exit row (bar, reason, line, entry, exit). POI_BODY_BREAK: exit reason, body break of a POI line. DAY_CLOSE: exit reason, day-close-minus-5 leg (never fired here). deal #/order #: broker fill lines. BIASCENSUS_FINAL/ZONECENSUS_FINAL/WS161_CENSUS: end-of-run censuses (bars, bias/zone/store counts). XOB-PROMOCENSUS: order-block promotion census. HEARTBEAT/JOURNAL_LAST: wrapper 10s progress lines. vDAY: day-close exit verdict flag. g_news_dayMarks/g_news_dayN: pilot-window day marks array + count. g_news_init: news/window data ready flag. MT_CLOSED: managed-trade closed state. TC_DayStart/TC_ZoneToServer/TC_MakeTime/TC_ShiftDayStart/TZ_NEWYORK: time converters + New-York zone. SrjNewsInit: fills pilot-window marks. SrjNewsOnBar: flat-day/flat-week census. MTLIFE openAtDayClose: lifecycle day-close field.

## Final disk state
- EA on disk: RESTORED pre-B-10 tree (B-7 kept build), SHA-256 F04AF9C31D42B756F9DCAC62B2506D0D67D2EDA6231C571B6558D2B4B14C4582 (685444 B, 12300 lines); git diff --no-index vs .preB10 empty.
- .preB10 on disk, same SHA (never committed).
- EX5 on disk: still the B-10 build 3587ADBF646D03169420D21D234FFDF5CD3478678CE4AFAEB4FCFF563DEEFC4F (452272 B, compiled from the trial source after the edit, before the run). EX5 does NOT match the restored EA source; the next authorized compile overwrites it as usual.
- EA, .preB10, indicator, Include/SRJ and journals: uncommitted and unpushed by relay order; only the three Part-F files ship.
- Record: B-9 C2 WITHDRAWN noted - no AGENTS.md edit made in this lane. B-9 Q-A/Q-C ride with the planner directly - nothing asked of him here.

## Carried note (for the planner)
- STOP rule C fired on the FIRST-graded run: the B-10 tree takes 1 of 7 RECON62 takes (only 8/28 SHORT, byte-exact match on entry, exit bar, reason and price; balance arithmetic closes exactly). The 6 missing takes never reach SIGNAL (whole-journal SIGNAL count = 1) - they die at selection, while the B-10 edit sits in the EXIT path (vDAY verdict). Cause is NOT isolated by this relay (one compile, trials as listed, no further runs authorized): open - but not concluded - is pre-dating, because the RECON62 anchor was last proved on the Sep-25 tree while B-4 and B-7 selection-path edits landed since with only USDJPY re-proof (B-7's was-false-found skip sits in the S4 confirm path). The June day-close question is ungraded until a tree re-proves this regression. Suggested next: isolate on the restored tree (does the pre-B-10 tree still take 7/7?) before any new exit-leg trial.

(End of file)
