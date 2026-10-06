# BUILDER RESULT B-44 - every block the machine killed on 5 June London, with levels, MEASURED (diagnostic removed after)

Trader summary: on 5 June in London the machine killed five bullish blocks between 7:35 and 9:20, where your chart counted two. This relay printed each block's top, bottom, middle and the close that killed it. Your two are confirmed in its rows: the block born at 7:35 (top 159.968, middle 159.962) died on the 8:05 close at 159.959, and the block born at 9:00 (top 159.968, middle 159.959) died on the 9:20 close at 159.952. The three extra are: the 7:50 block died on the 8:10 close and gave the machine's own 8:10 down-turn (which spent your 7:35 kill); two old blocks from 6:45 and 4:15 died at 8:20 and 8:30 but counted for nothing since the read was already down; and your 9:20 kill counted only 1 of the 2 needed, so no turn, until a second block (born 8:20, middle 159.938) died on the 9:50 close and turned it down there. The diagnostic code is fully removed again. The machine's Europe window re-proved identical, and the 5 June replay matches its reference except for the added print lines.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first, whole. Relay B-44 wins over older queue items for its scope.
- 0.2 ls-remote builder/B-43 returns `5c119f6942cecf3124eb1e2302bf28e8d56e73fc` (verified). Checked out builder/B-43, cut builder/B-44 from 5c119f69. Dirty tree kept (205 `git status --short` lines; count only). No git-config/remote change. Pushes through remote `backup` (same way as B-40 to B-43).
- 0.3 read in order: pointer; RESULT_B43 (C2 table, C3, carried note); slice B43 (S5 rows); RESULT_B41 (B1 Hunk 1, j25 grade); strategy sections 5, 6, 11, 14 + NO-OVERFIT.
- 0.4 `git log -1`: `5c119f6 B-43 four start-day replays agree, start day not the split, MEASURED`. SHA gate matched (no STOP-A): strategy 110942FA; relay 8CE3E942 (8859 B); context AADEEC80 (7952 B); FlowLogic 956BF3E3 (70308 B) / ex5 27B5F272; BiasEngine 3B1D9D3D; OrderblockMgr 5D14FCE2; Draw FD2B3716; HTFEngine D5FD5B06; EA 63B18C1F (680981 B) / ex5 B0D4AA9E. Five pushed files: `git diff 5c119f69` empty on all (pointer, result/slice B43, ledger, relay skill) - line-ending classes accounted as before.
- 0.5 names as relayed (TT; RECON62/S5 windows; standing June window restored; j31/j32; .preB44/.B44DIAG; ledger 1186; launch_b44_run.ps1; watcher; debug arguments with 0-for-XPOI_NA).

## Part A - bank
- A1 no new words this turn; banked nothing.

## Part P - read-only record searches (questions here, never to him)
- P1 PLATFORM_0605 = NO_RULING_FOUND. Searched skill, findings, journal, ledger (TradingView/OANDA/Flow Logic Auto/Pine/Dukascopy/my chart/MT5 chart). Adjacent but non-answering: findings:80 quotes him ("i thought currently is getting it from the SRJ Flow Logic auto MTF HTF bias detection?" - his assumption about the EA feed, not his chart platform); ledger:366 standing feed rule ("Dukascopy ALWAYS", builder-recorded measurement-feed rule); journal hits are chart-link URL substrings, not words. Nothing states which chart/feed his 5 June 5-minute read comes from. Planner-supplied context recorded: his three 5 June journal pictures (row 17 links) are TradingView EURUSD/OANDA 4H/1H/15m showing "SRJ Flow Logic Auto" with "ORDERFLOW BEAR .... Bearish Bias 2 OB", taken 15 Aug 2026; his 5-minute links are unopenable Telegram posts.
- P2 PINE_FLOWLOGIC: one .pine in the working tree - PineScript/HORC_OpeningRange.pine (30136 B), no "Flow Logic" text in it (case-insensitive count 0). Nothing else anywhere (excluding opencode/node_modules).
- P3 CHART_CLOCK = NO_RULING_FOUND. Searched the P1 files (UTC/GMT/time zone/timezone/server time): journal hits are URL fragments ("Gmt9Q2qG"); ledger hits are builder prose, nearest ledger:2193-2195 ("London session", "NY AM session" session-words note with "his GMT+7: broker morning = his midday" - builder wording, not his verbatim chart-clock rule). No verbatim his-words on chart/broker/server timezone.

## Part B - one diagnostic edit (print lines only), one compile each
- B0 content copies first (B-42 lesson): EA mq5 63B18C1F + ex5 B0D4AA9E; OrderblockMgr 5D14FCE2; FlowLogic mq5 956BF3E3 + ex5 27B5F272; terminal.ini 58CF3847; Profiles tree 137 files (TREE_SHA 71750974). No terminal64 running (verified; leftover stopped by PID as in B-43).
- B1 EA hunk, LIVE call only (exactly one hit, EA 11227, pasted raw before editing): appended `, 0, 0, 0, true, "2026.06.05 07:00", "2026.06.05 10:00"` after `true, 60` (same as B-41 B1). DEVIATION REPORTED (same ground as B-41): `XPOI_NA` does not exist in EA scope (grep: zero hits) and would not compile; `0` is value-identical (P1-verified: first enum member, FlowLogic 235). No other EA change.
- B2 block-mgr hunk, print lines only (three sites, pasted raw before editing): (a) live-kill SRJ INV (after `ob.invalidationBar = i`, barClosed block ~528); (b) replay SRJ INV (`source=replay`, ~144); (c) SRJ OBCAND (~799). Appended `top=` (ob.high), `bot=` (ob.low), `mid=` (ob.invalidationLevel) to all three; `killClose=` (liveClose at (a), barClose at (b)) to (a)/(b); prices via `_Digits`. B44DIAG tags at OrderblockMgr 163/548/821. No comparison, assignment, guard or control line touched (diffs in slice show print args only).
- B3 compiled FlowLogic first then EA: both `0 errors` (logs B44_FLOWLOGIC_COMPILE.log, B44_EACOMPILE.log). No STOP-C. Edited SHAs: EA 4643FDEB, OrderblockMgr 6E47429F; new ex5: EA 747055B9, FlowLogic 36EA3224. Kept `.B44DIAG` copies untracked, never committed (EA mq5+ex5, OrderblockMgr mqh, FlowLogic mq5+ex5).

## Part C - runs (launch-then-stop, watcher + short cycles, grade on DONE; one run each)
- C0 per-run hygiene as B-43 (window written + read back; no terminal before launch; script launchers; window proofs; wrapper killed; watcher PID verified by number).
- C1 j31 RECON62 on diagnostic build (RECON62-B44_JOURNAL.log, 140781 lines; PASSED; 563338 ticks, 3168 bars, balance 10474.64; PRE 845868). Grade vs j25/j23: 3168 readings identical; 7 takes identical (day/entry/exit each: 8/28 1.16466→1.16439; 9/1 1.16022→SL 1.15975; 9/4 1.16018→1.16129 +1 BROKER SENT; 9/7 1.16135→1.16200; 9/7 1.16261→1.16315; 9/8 1.16205→1.16102; 9/8 1.16220→SL 1.16274); A2RECLAIM 8; B41HIST 0 (June gate holds). RECON62_SAME = YES. No STOP-N.
- C2 j32 S5 replay on diagnostic build (JUNE-B44-S5_JOURNAL.log, 52954 lines; PASSED; 61072 ticks/288 bars; balance 10044.42 = j27; PRE 986649). Grade vs j27: OBPROV code/id/bar identical (07:25 x2+flip ids 1730/1716; 08:10 id 1731; 08:15 id 1732+flip; 08:45 id 1711; 09:00 flip-alone; 09:25 id 1739; 09:55 id 1734+flip); ltf strip 07:00-10:05 identical; 09:40 SEEDBIAS refusal identical; deals identical (16:50 LONG 160.120 → 19:16:32 160.298). Only print rows added (new level fields, DEC window rows, OBCAND-attempts-print-nothing). PRINT_NEUTRAL = YES. No STOP-N.
- C3 block-kill table from j32 SRJ INV 07:00-09:55 (raw rows in slice; pips = points/0.001):

  | kill candle | block side | born candle | top | bottom | middle | kill close | past middle | counted (refOk) | machine read before |
  |---|---|---|---|---|---|---|---|---|---|
  | 07:20 | bear | 06:50 | 159.965 | 159.951 | 159.958 | 159.960 | 2.0 pips above | 1 | down |
  | 08:05 | bull | 07:35 | 159.968 | 159.955 | 159.962 | 159.959 | 3.0 pips under | 1 | up |
  | 08:10 | bull | 07:50 | 159.961 | 159.955 | 159.958 | 159.957 | 1.0 pip under | 1 | up |
  | 08:20 | bull | 06:45 | 159.954 | 159.943 | 159.949 | 159.929 | 20.0 pips under | 1 (opposing: read already down) | down |
  | 08:30 | bull | 04:15 | 159.936 | 159.918 | 159.927 | 159.922 | 5.0 pips under | 1 (opposing) | down |
  | 08:40 | bear | 04:35 | 159.949 | 159.931 | 159.940 | 159.943 | 3.0 pips above | 1 | down |
  | 09:10 | bear | 08:55 | 159.962 | 159.949 | 159.956 | 159.961 | 5.0 pips above | 1 (opposing: read up) | up |
  | 09:20 | bull | 09:00 | 159.968 | 159.949 | 159.959 | 159.952 | 7.0 pips under | 1 | up |
  | 09:50 | bull | 08:20 | 159.957 | 159.920 | 159.938 | 159.932 | 6.0 pips under | 1 | up |
  ("past middle": bullish kill = close under mid; bearish kill = close above mid. "counted" = refOk as printed; side-vs-read decides in-bias vs opposing per DecisionBlock.)
- C4 OBCAND at 09:15/09:20 passes: NOT_PRINTED (zero OBCAND rows in all of j32; also zero in j26 and j24 - the dump never fires in these windows).
- C5 named answers:
  - BLOCK_0735 = top 159.968 / bottom 159.955 / middle 159.962; killed by the 08:05 candle close 159.959 (3.0 pips under the middle).
  - BLOCK_0900 = top 159.968 / bottom 159.949 / middle 159.959; killed by the 09:20 candle close 159.952 (7.0 pips under).
  - EXTRA_BULL_KILLS (07:35→09:20): 08:10 kill of the 07:50-born block (159.961/159.955/159.958, close 159.957, 1 pip under, counted - fired the machine's 08:10 down-turn); 08:20 kill of the 06:45-born block (159.954/159.943/159.949, close 159.929, 20 pips under, opposing - read already down); 08:30 kill of the 04:15-born block (159.936/159.918/159.927, close 159.922, 5 pips under, opposing).
  - TESTER_CLOCK (j32:78-80 raw in slice): `TimeCurrent=2026.06.05 00:00:00 TimeGMT=2026.06.05 00:00:00 srvMinusGmt=+0s ... tester=YES` - tester offset from GMT on 5 June = +0 (both clocks read the same); session frame: LONDON 02:00-05:00 ET = 09:00-12:00 server, NYAM 07:00-12:00 ET = 14:00-19:00 server. No code added for this.
- No fix proposed. Planner rules B-45.

## Part R - restore (always)
- R1 all `.preB44` contents copied back (no recompile, nothing required it): EA 63B18C1F (680981 B) / ex5 B0D4AA9E; OrderblockMgr 5D14FCE2; FlowLogic 956BF3E3 / ex5 27B5F272; terminal.ini 58CF3847; Profiles tree 137/137 byte-identical, zero extras/missing (re-compared by relative name). Run-created files in scope: none remain. `.B44DIAG` copies kept untracked, never committed.
- R2 [Tester] read back = USDJPY 1780272000 / 1781308800 (standing June window).

## Part F - one text line
- F1 grep `B-43 lesson` = 0 and `ShutdownTerminal` = 0: appended verbatim under Trial discipline. New skill SHA reported below.

## STOP rules
- STOP-A none. STOP-C none (both 0 errors). STOP-N none (RECON62_SAME YES, PRINT_NEUTRAL YES). STOP-W none (both read-backs exact). STOP-T none (j31 ~4 min, j32 ~21 s; j32 reached 10:05). STOP-H none (only the listed scopes touched; all restored byte-exact).

## Result, push, reply
- Result + slice (147 lines: P hits, both diffs, j31 grade, j32 INV/OBCAND-attempt/CLOCK rows) + ledger 1186 (grep `^1186.` was 0; appended; tag B44-OBLEVELS-0605LDN) + pointer (B-44, next B-45) + relay skill: 5 files pushed to builder/B-44. Never the EA, the indicator or any include.
- Final disk state: EA source 63B18C1F (680981 B, restored, uncommitted) with ex5 B0D4AA9E MATCH; FlowLogic 956BF3E3/27B5F272 MATCH; BiasEngine/OrderblockMgr/Draw/HTFEngine at gate SHAs. No build remains on disk (diagnostic binaries restored, not rebuilt).
- Carried note, in trader words: every bullish block the machine killed between 7:35 and 9:20, with born candle, top, bottom, middle and killing close - 08:05 killed the 7:35 block (159.968/159.955, middle 159.962, close 159.959); 08:10 killed the 7:50 block (159.961/159.955, middle 159.958, close 159.957) and that spent your 7:35 kill on the machine's own down-turn; 08:20 killed the 6:45 block (159.954/159.943, middle 159.949, close 159.929) and 08:30 killed the 4:15 block (159.936/159.918, middle 159.927, close 159.922), both for nothing with the read already down; 09:20 killed the 9:00 block (159.968/159.949, middle 159.959, close 159.952) and that counted only 1 of 2, until the 8:20-born block (middle 159.938) died on the 9:50 close at 159.932 and turned it down there. Your two are the 7:35 and 9:00 blocks. P1 PLATFORM_0605 = NO_RULING_FOUND; P2 one unrelated .pine (HORC, no Flow Logic text); P3 CHART_CLOCK = NO_RULING_FOUND.
- Reply line + ls-remote below.
