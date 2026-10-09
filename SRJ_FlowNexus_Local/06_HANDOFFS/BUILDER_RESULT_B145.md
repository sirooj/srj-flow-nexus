# BUILDER RESULT B-145 - 9:20 XOB dead on tester candles, your candles unknown, one chart question carried

Trader summary: your 9:20 zone is dead on the tester's candles (killed on the 09:40 candle) and your own candles for that morning are nowhere on this machine, so neither side can be checked against the other here. Two hard facts came back. First, the colours: on your saved chart settings a live XOB draws red and a dead one draws gray, both thick - you see thick red, which is the live rendering, not the dead one. Second, at your 16:55 confirmation nine other live zones had been touched since they formed (including the machine's pick), but none since their promotion except seven - and yours is touched-but-killed either way. Your note that the kill level isn't always the exact middle is saved below but banked nowhere this turn, by relay order - the machine, for the record, always kills at the exact middle and never moves it. One plain question for you is carried at the end. Nothing was changed and nothing was run.

## Relay order (B-145, XOB-0604 lane 4 of 6, read-only)

- Part 0 on builder/B-144 at 59d3005f4c1818361e4966a7ecf67b7a506d16cc (backup ls-remote verified exact; builder/B-145 cut here). Skills loaded (relay; strategy). Reads: pointer; RESULT_B144 (R1/R3/R4/R5/R7); SLICE_B144; XOBSUIT-1 section 6; skill B-143 L225-228 + XOB-ABSENCE-FIRST; register A6/A7 + 4 June rows/notes; CONTEXT section 3 + section 4 B142/B143/B144 lines; spec v4.2 (1.2/3.5/3.5.1/9.1).
- Start gate: log-1 = 59d3005; status 581 lines (dirty tree preserved); committed-file diff vs 59d3005 measured 0 lines; EA 585093BF.../EX5 AB159DE7.../FlowLogic 956BF3E3/27B5F272 match; result-against-commit: CONTEXT B144 = 1, relay B-144 = 1, HANDOFF B-144 = 1, ledger 1289 = 1. No STOP.
- Scope MEASURED. Code and saved chart files quoted by text with real line numbers. No edit/compile/run/launch/script/export; no chart/profile/template writes; no tolerance/count/distance in any reading.

## Part B - banking

- No new rule words (relay order). Nothing appended.

## Part R - reading (kept 585093BF; run + file:line on every row)

### R1 colour and width (kept indicator + kept include + his saved files)

- Kept defaults (Indicators/SRJ_FlowLogic.mq5:289-296): live bullish BLUE (16711680), live bearish RED (255), live midline BLACK (0); dead bullish/bearish GRAY (8421504), dead midline ORANGE (42495). Assigned to engine globals (453-472).
- Promotion (Include/SRJ/SRJ_OrderblockMgr.mqh:814-822 SRJ_ApplyPromotion): width = thickness + extra = 1 + 2 = 3 (defaults 285-287). Kill recolor (591-602): dead colours + extend flag; width untouched, stays 3.
- Saved files loading SRJ_FlowLogic (all under MQL5/Profiles/): Charts/Default/chart01.chr:87, chart02.chr:87, chart03.chr:87, chart04.chr:87; Templates/backtest.tpl:87, Templates/default.tpl:87. All six save identical inputs (chart01.chr:148-165): show valid+invalidated bearish true; extend false/false; line-extension 3; thickness 1; extra 2; RED 255 / GRAY 8421504 / midlines BLACK/ORANGE. From saved inputs (defaults identical): live promoted bearish XOB = RED width 3 with BLACK dotted midline; dead promoted bearish XOB = GRAY width 3 with ORANGE dotted midline.

### R2 his chart's candles (NOT FOUND for readable candles)

- Terminal data folders on disk (14 hashes); EURUSD history folders: 10CE...(FivePercentOnline-Real), 16D9...(BlackBullMarkets-FPDemo), 3CA1B4...(Default + Dukascopy-demo-mt5-1), 47AEB...(Default + OANDATMS-MT5), 73F26...(Default), 93011...(FusionMarkets-Demo), D0E82...(ACGMarkets-Demo), D396...(ThinkMarkets-Demo), F762...(Default); 3294/3CA1B1/DA9F none.
- Dukascopy-demo-mt5-1/history/EURUSD/2026.hcc (20 MB, 10/9/2026): the tester's own feed, current; candles NOT readable without a script run (forbidden). OANDATMS-MT5/history/EURUSD/2026.hcc (12.6 MB, 7/27/2026): stale, predates 8 Sep, does not cover it. No csv export, no TickAudit candles file, no saved chart data with 8 Sep 09:15-09:45 from any feed exists (TickAudit B48_SEP: RAW 7-10 Sep EMPTY). NOT FOUND. No EXACT/DIFFERENT pair to print.

### R3 his words (record-first; every XOB-related hit)

- Skill: 15M-READS L135/L141 (8 Sep 10:10 bearish 15m read - no XOB); 5M-FLIP-TRIGGER-0605LDN L154 (5 June dashed line - different day); Ruling (B-143) L225-228 (his 9:20 + thicker-red-line answer - the ONLY thick-line words on record).
- XOBSUIT-1: L25 (2159 re-picks at 09:20 - different XOB, 17 Aug context). Nothing else on 9:20/thick.
- Register: A4 row L19 (7 Sep 09:20 entry - different day); B-40 note L37 (5 June dashed 09:20 line); B-143 NOTE L62 (9:20 zone note).
- Journal: A6 row 285 (CSV:286, 15m bearish 10:10 - no XOB note); A7 row 313 (CSV:1065, Y-POC target - no XOB note); row 318 (CSV:1070, B-143 banking of his 9:20 words).
- Ledger: 1288 (B-143 banking) + 1289 (B-144 lifecycle, 0908-NY-XOB-0920 ref). Nothing on live-vs-dead, on colours at 16:55, or on the 09:40 close. R3 holds no answer to R5's question.

### R4 live census (machine data, beside, no ruling, not a separator; stamp rule B-144 R1: close-of-C state = barT C-minus-one row)

- A7 16:55 (barT-16:50 rows; SHORT, promoted=1, valid=1): range-touched from formation: 1704 (8/26 06:30), 1728 (8/26 07:35), 1784 (8/26 00:35), 1891 (8/26 15:45), 2109 (8/28 01:00), 2149 (8/28 06:25), 2217 (8/28 16:25), 2896 (9/3 20:20), 2898 = machine pick (9/3 20:30); never touched: 1389/1401/1403/1481/1484/1495/1516. From promotion: 1704 (8/26 16:30), 1728 (8/27 16:25), 1784 (8/26 00:35), 2109 (8/28 05:55), 2149 (8/28 14:00), 2217 (8/28 17:00), 2896 (9/3 20:50); NOT from promotion: 1891, 2898 + the 7 never-touched. (Tester log single-pass scan, 2796 EU bars; swing-leg half unchecked - swing series unprinted.)
- A6 10:05 beside (barT-10:00 rows): same form-touched set (all first touches predate 10:05); same promo-touched set.
- C-06-04 09:50 (June full INCREMENTAL barT-09:45 = 1780566300 rows; promoted=1, valid=1): 3038 (form 6/3 23:50), 3046 (form 6/4 01:00), 3052 = machine pick (form 6/4 01:40); promo-touched: NONE of the three. (407 UJ bars scanned.)

### R5 classification: FEED

- R4's A7 list beside: form-touched 1704/1728/1784/1891/2109/2149/2217/2896/2898 (pick marked); promo-touched 1704/1728/1784/2109/2149/2217/2896.
- FEED: his 09:15-09:45 candles are unknown (R2 NOT FOUND) while the tester's 09:40 candle kills 3293 (B-144 R3). DRAW excluded: dead renders GRAY width 3 (R1 + his saved inputs), but he reports thick RED = the live rendering - the line he sees is not the dead-colour line. RECORD excluded: R3 holds no live-vs-dead answer. OPEN not needed: FEED is evidenced (unknown-vs-kill), the level nuance below notwithstanding.
- Beside (unbanked operator clarification, Part B forbade banking): he states the invalidation level is not always the 0.5 midline - a more extreme body close moves it. The machine pins level = midline at creation forever (OrderblockMgr.mqh:37-40, charter-9 comment; no other write site in Include/SRJ). For 3293 the machine used 1.16243 and killed on 09:40 close 1.16248. Whether his level for 3293 sits higher is his rule to bank, never inferred here; the chart call below uses the relay-ordered shape.

### R6 record-first gate: FIRES (FEED + R3 silent)

- ONE carried chart call (his words, dates, times, prices; colour names red/gray from R1): "8 Sep, your 9:20 XOB 1.16230-1.16256 (middle 1.16243): on the tester's candles the 09:40 candle closed at 1.16248, above the middle, which by your midline rule ends that XOB. On your chart, what did the 09:40 candle close at, and after 09:40 is that XOB drawn in red or in gray?"

## Part X - records (grep-first, append once, verify count 1)

- X1 CONTEXT section 4: B145-STAMP-CORRECTED appended after B144-STAMP-BEFORE-CANDLE (relay text verbatim; pre-grep 0). Count 1.
- X2 CONTEXT section 5: B-145 session line appended. Count 1.
- X3 HANDOFF section 3: B-145 line appended. Count 1.
- X4 ledger 1290, tag B145-3293-FEED-OR-DRAW (Part B/R5/R6, unbanked level note). "^1290." = 1.
- X5 pointer (25 lines): latest B-145 MEASURED; SHAs unchanged; "Lane: XOB-0604 (4 of 6)"; R5 FEED line with A7 lists; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (colour/draw code, saved inputs, grep hits, journal rows, R4 rows; under 600 lines). F3 ledger 1290. F4 pointer (35-line cap).
- F5 stages result, slice, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md. Never EA/indicator/includes/ex5/logs/journals/inis/profiles/templates/backups/artifacts.
- F6 commit + push via backup + ls-remote check. Reply MEASURED with carried-note flag.

## Final disk state (MEASURED turn; B-137 kept build on disk, verified)

- EA 585093BF.../EX5 AB159DE7...; FlowLogic 956BF3E3/27B5F272; diagnostic variants + includes untouched; no launches; scan scripts in TEMP uncommitted. CONTEXT +2 lines; HANDOFF +1 line; ledger +1 item (1290); pointer rewritten (25 lines). Skill/register/journal untouched. No source/ex5 committed.

## Carried note

- Chart call (record-first done - R3 searched skill/journal/ledger/XOBSUIT/register; his words answer in-play but never live-vs-dead, colours, or the 09:40 close; R2 found no his-feed candles; R5 FEED): "8 Sep, your 9:20 XOB 1.16230-1.16256 (middle 1.16243): on the tester's candles the 09:40 candle closed at 1.16248, above the middle, which by your midline rule ends that XOB. On your chart, what did the 09:40 candle close at, and after 09:40 is that XOB drawn in red or in gray?"

(End of file)
