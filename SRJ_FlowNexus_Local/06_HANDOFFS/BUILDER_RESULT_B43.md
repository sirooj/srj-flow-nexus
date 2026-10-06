# BUILDER RESULT B-43 - 5 June London replayed from 2, 3, 4 and 5 June: the 09:20 turn appears on none, MEASURED

Trader summary: I replayed your 5 June London morning four times with the machine unchanged, starting the replay on the 2nd, 3rd, 4th and 5th of June. All four mornings come out exactly like the 1 June replay: your 5-minute reads up at 9:40 on every one, the down-turn prints at 9:50 on every one, and your 9:45 short is refused on every one. Starting closer to the day changes nothing except the internal block numbers. So where the 10-day count begins is not what splits your chart from the machine. Nothing was changed, nothing was compiled.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first, whole. Relay B-43 wins over older queue items for its scope.
- 0.2 ls-remote builder/B-42 returns `18a05dab30d2e3b1b5e16d63cb6507bbe81b8504` (verified). Checked out builder/B-42, cut builder/B-43 from 18a05dab. Dirty tree kept (188 `git status --short` lines; count only). No git-config/remote change. Pushes through remote `backup` (same way as B-40 to B-42).
- 0.3 read in order: pointer; RESULT_B42 (carried note, C1, C3); RESULT_B41 (C3 table, C4); RESULT_B40 (j24 OBPROV/code-3/ltf rows); strategy sections 5, 6, 11, 14.
- 0.4 `git log -1`: `18a05da B-42 fresh chart read, June lookback-blocked, MEASURED STOP-H`. SHA gate matched (no STOP-A): strategy 110942FA; relay 602EE9D3 (8527 B); context AADEEC80 (7952 B); FlowLogic 956BF3E3 (70308 B) / ex5 27B5F272; BiasEngine 3B1D9D3D; OrderblockMgr 5D14FCE2; Draw FD2B3716; HTFEngine D5FD5B06; EA 63B18C1F (680981 B) / ex5 B0D4AA9E. Five pushed files: `git diff 18a05dab` empty on all (pointer, result/slice B42, ledger, relay skill) - line-ending classes accounted as before.
- 0.5 names as relayed (TT; S5/S4/S3/S2 epochs verified below; standing June window restored at end; j27-j30; j26; .preB43; ledger 1185; launch_b43_run.ps1; watcher).

## Part A - bank
- A1 no new words this turn; banked nothing.

## Part P - read-only pre-checks
- P1 finalLookback/withinLookbackWindow (raw): FlowLogic 544-550 (`effectiveLookback` from `inRobustnessMode`: Medium (5000 bars) at 548; else inMaxLookbackBars at 550), 554-597 (min with Balanced-M5 autoLimit 3000 at 581/597), 600-603 (`g_finalLookback = effectiveLookback`), 1018-1019 (`safeLimitBar`; `withinLookbackWindow = (i >= 2) && (i >= last_bar_index - finalLookback)`). LOOKBACK_START = the count starts at last_bar_index minus finalLookback on the first calculation (the newest ~3000 M5 bars of whatever history is present); a full recalculation re-anchors last_bar_index to the newest bar present, so the start moves with it.
- P2 j26 first bias: J26_FIRST_BIAS_T = NOT_PRINTED. No row shows the initial setting (j26's prints are window-gated to 07:00-10:00 by the B41HIST hunk; its earliest DEC row is the 07:00 candle with biasBefore=bearish already set, j26:69189).

## Part C - four replays (no source edit, no compile)
- C0 content backups first (B-42 lesson): config\terminal.ini → terminal.ini.preB43 (SHA 58CF3847); MQL5\Profiles tree (137 files) → Profiles.preB43 (TREE_SHA 0de1903a over sorted per-file SHAs). No terminal64 running (verified).
- C1 runs S5, S4, S3, S2 in order (one each, no second attempt). Per run: DateFrom/DateTo written + read back (S5 1780617600/1780704000; S4 1780531200/1780704000; S3 1780444800/1780704000; S2 1780358400/1780704000 - all verified, no STOP-W). Unchanged EA (63B18C1F/B0D4AA9E, no B41HIST hunk) with USDJPY_DEMO_JUNE.ini (same ini/inputs as j26 LIVE) from launch_b43_run.ps1 (copy of the known-good June launcher). Launch-then-stop + watcher + short cycles; graded on DONE. All four PASSED, all under 5 minutes wall (21s/35s/~1min/~1.5min test times; no STOP-T). One operational note: S4's first launch hit REFUSED_TERMINAL_BUSY (S5's terminal lingers - no ShutdownTerminal in run inis); leftover stopped, relaunched clean (same B-37/B-38 practice).
- C2 raw rows per run in slice (OBPROV code=8 + code=3 with id; ltf strips; 09:40 refusal; filed rows; deals). Per-candle 07:00-10:00 table (up/down + turns; j26 column from B-41):

  | candle | j26 (1 Jun) | S2 (2 Jun) | S3 (3 Jun) | S4 (4 Jun) | S5 (5 Jun) |
  |---|---|---|---|---|---|
  | 07:00-07:15 | down | down | down | down | down |
  | 07:20-08:05 | up (turn up 07:20) | up (same) | up (same) | up (same) | up (same) |
  | 08:10-08:50 | down (turn down 08:10) | down (same) | down (same) | down (same) | down (same) |
  | 08:55-09:40 | up (turn up 08:55) | up (same) | up (same) | up (same) | up (same) |
  | 09:45 | up | up | up | up | up |
  | 09:50-10:00 | down (turn down 09:50) | down (same) | down (same) | down (same) | down (same) |
  (09:20 reads up on all five; flip bars 07:25/08:15/09:00/09:55 passes on all five with identical ltf; only the OB ids differ by census: j26 2420/2406/2421/2422/2429/2424; S2 2242/2228/2243/2244/2223/2251/2246; S3 2053/2039/2054/2055/2034/2062/2057; S4 1895/1881/1896/1897/1876/1904/1899; S5 1730/1716/1731/1732/1734. Kinds (strong/weak) print only with the debug flag (j26): 07:20 strong up, 08:10 strong down, 08:55 weak up, 09:50 strong down.)
- C3 per run:
  - S5 (j27, 6/5 start, balance 10044.42, 61072 ticks/288 bars): FLIP_0920 = NO (up at 09:20-09:45, down at 09:50). FLIPS_0700_1000: up 07:20, down 08:10, up 08:55, down 09:50. FIRST_DIFF vs j26: NONE (reads/flips/refusal identical; ids + deal numbers only). SHORT_0945 = REFUSED (ABORT SEEDBIAS_REFUSED + A6REFUSED 09:40, j27:2847-48, same shape). 5 June deals: 16:50 LONG buy 16:55 160.120 (deal #2) → sell 19:16:32 160.298 (deal #3, retargeted TP).
  - S4 (j28, 6/4 start, 9944.60, 106945 ticks/576 bars): FLIP_0920 = NO. Same four flips. FIRST_DIFF = NONE. SHORT_0945 = REFUSED (SEEDBIAS j28:5069-70). Deals: 4/6 SHORT sell 09:55 159.868 (deal #2) → buy 10:40:20 159.920 (deal #3); 5/6 LONG buy 16:55 160.120 (deal #4) → sell 19:16:32 160.298 (deal #5).
  - S3 (j29, 6/3 start, 10061.56): FLIP_0920 = NO. Same four flips. FIRST_DIFF = NONE. SHORT_0945 = REFUSED (SEEDBIAS j29:9573-74). Deals: 3/6 LONG buy 09:10 159.932 (deal #2) → sell 09:59:40 159.983 (deal #3); 4/6 SHORT 159.868 → 159.920 (deals #4/#5); 5/6 LONG 160.120 → 160.298 (deals #6/#7).
  - S2 (j30, 6/2 start, 10061.56): FLIP_0920 = NO. Same four flips. FIRST_DIFF = NONE. SHORT_0945 = REFUSED (SEEDBIAS j30:18121-23). Deals: same prices as S3 (deals #2-#7).
  - Balances differ by window scope only (S5: 5/6 only; S4: 4/6+5/6; S3/S2: 3/6+4/6+5/6); every shared deal is price-identical across runs and j24.
- C4 READ_START_DEPENDS = NO. All four start days agree with j26: no down-turn on the 09:20 candle, identical ltf strip, identical 09:40 SEEDBIAS refusal. (No latest/earliest split to name.)
- No fix proposed. Planner rules B-44.

## Part R - restore (always)
- R1 terminal.ini.preB43 copied back (SHA 58CF3847 verified); Profiles tree restored from Profiles.preB43 (137/137 files byte-identical, zero extras/missing, re-compared by relative name); run-created files in scope: none remain. [Tester] read back = USDJPY 1780272000/1781308800 (standing June window).
- R2 EA 63B18C1F / ex5 B0D4AA9E, FlowLogic 956BF3E3 / 27B5F272, BiasEngine 3B1D9D3D, OrderblockMgr 5D14FCE2, Draw FD2B3716, HTFEngine D5FD5B06 - all re-taken, untouched.

## Part F - one text line
- F1 grep `B-42 lesson`: count 0, appended verbatim under Trial discipline. New skill SHA reported below.

## STOP rules
- STOP-A none. STOP-W none (all four read-backs exact). STOP-T none (all runs ~0.5-1.5 min). STOP-H none (scope verified: only Profiles/terminal.ini/logs/cache/result files touched; Profiles + ini restored byte-exact).

## Result, push, reply
- Result + slice (253 lines) + ledger 1185 (grep `^1185.` was 0; appended; tag B43-STARTDAY-0605LDN) + pointer (B-43, next B-44) + relay skill: 5 files pushed to builder/B-43. Never the EA or the indicator.
- Final disk state: EA source 63B18C1F (680981 B, untouched, uncommitted) with ex5 B0D4AA9E MATCH; FlowLogic 956BF3E3/27B5F272 MATCH; HTFEngine D5FD5B06; BiasEngine/OrderblockMgr/Draw unchanged. No edit, no compile, no RECON62 re-run (REFINE-ONLY binds builds; none happened).
- Carried note, in trader words: starting the replay on the 2nd, 3rd, 4th or 5th of June changes nothing on your 5 June morning - the 5-minute reads up at 9:40 and turns down at 9:50 on all four, exactly like the 1 June replay, and your 9:45 short is refused on all four (same reason). The only things that move are internal block numbers. Your 5 June evening long takes at the same prices wherever the window covers it (160.120 to 160.298). So the 10-day count's starting candle is not what splits your chart from the machine. NOT_PRINTED list: first-bias-setting row (J26_FIRST_BIAS_T); flip kinds in S-runs (debug flag off - j26 kinds apply to identical bars); OB zone/mid/close per id (standing); A-vs-B attribution (standing); chart inputs under HT (standing); pre-9:20 line descriptions (standing).
- Reply line + ls-remote below.
