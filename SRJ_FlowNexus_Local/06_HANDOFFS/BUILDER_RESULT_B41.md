# BUILDER RESULT B-41 - the machine explains its 5 June morning, candle by candle, MEASURED (diagnostic removed after)

Trader summary: on 5 June in London your 5-minute turned down at 9:20 and counted from the 9:25 open. The machine's number stayed up until the 9:50 candle. I made its indicator explain itself for that whole morning, both the way it watched live and the way it recomputes the morning afterwards, with its own settings and with standard settings. All four watches agree with each other and none turns down at 9:20. The rows also show why: your 9:20 candle did kill a bullish block while the read was up, but that was only the first of the two failures the machine needs, because the earlier 7:35 failure had already been spent on the machine's own 8:10 turn and wiped by its turns after. The machine's down-turn came at 9:50 instead, off the 9:20 kill plus a second kill at 9:50. The diagnostic code is fully removed again; your trading logic is untouched. One defect of mine: the after-the-fact copy with identical settings shared the live copy inside the machine, and releasing it stopped the live copy after 10:00, so the 5, 9 and 11 June takes are missing from the second run. Everything the relay asked for was already printed before that happened.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first, whole. Relay B-41 wins over older queue items for its scope.
- 0.2 ls-remote builder/B-40 returns `8bf047ebf37a0010162ec6d7bd58b95ab8481c68` (verified). Checked out builder/B-40, cut builder/B-41 from 8bf047e. Dirty tree kept (162 `git status --short` lines; count only). No git-config/remote change. Pushes through remote `backup`, never `origin`.
- 0.3 read in order: pointer; RESULT_B40 (carried note, B1-B5); slice B40 (B1, B2, B3); strategy sections 5, 8, 11, 14; register B row 1 + B-40 correction.
- 0.4 `git log -1`: `8bf047e B-40 bank 5m flip answer, trace flip source and prior road, MEASURED (relay B-40, planner side)`. SHA gate matched (no STOP-A): strategy 110942FA (57755 B); relay 4656541D (8232 B); pointer CA89C5D3; result B40 C7E2FC3A (15594 B); register 4C9A293A (6895 B); planner context B6AE293C (7815 B); journal disk 61F32C9F (GitHub blob E50CBC6C, endings class); ledger disk E74EC407 (GitHub blob 1094E95E, endings class); FlowLogic 956BF3E3 (70308 B); BiasEngine 3B1D9D3D (15683 B); OrderblockMgr 5D14FCE2 (46911 B); Draw FD2B3716 (12180 B); EA 63B18C1F (680981 B, GitHub 977B0FB5 lags it, expected) / ex5 B0D4AA9E; FlowLogic ex5 27B5F272; HTFEngine D5FD5B06. Accounted line-ending deviations (3): slice B40 (disk 010EBACF vs 4DDA296D), ledger, journal - `git diff 8bf047e -- <file>` empty on all three.
- 0.5 names as relayed (j23/j24/j25/j26, LIVE, HIST-A/B, DEC rows, debug window 07:00-10:00, B41HIST tags/markers, .preB41 backups, .B41HIST copy, ledger 1183).

## Part A - bank
- A1 no new words this turn; banked nothing.

## Part P - read-only pre-checks (before B)
- P1 inputs pasted raw (FlowLogic 246-259): order confirmed exactly - group slot, inChartTradingTF, inHtfLookbackBars, inHtf1/2/3_manual, inUseConfirmedHTFOnly, inHtfMaxTrackedObjects, inHtfHigh/Mid/LowTarget, inHtfDebugLog, inDebugFromTime, inDebugToTime. No STOP-P. XPOI_NA: `enum ENUM_XPOI { XPOI_NA, ... }` (FlowLogic 235) - first member = 0.
- P2 debug prints. `bool SRJ_InDebugWindow(const int bar)` pasted raw (FlowLogic 653-667: false unless flag on; true when no window set; else bar-time inside [from, to]). Gated-print census (28 sites): BiasEngine - SRJ DEC (176 window), SRJ EVT x2 (258/307 FLAG-ONLY), SRJ RENEWAL-DROP (365 window), SRJ DEC2 (377 window); OrderblockMgr - SRJ INV x2 (143 discoveryBar-windowed, 527 windowed), SRJ OBREDRAW x2 (317/419 windowed), SRJ OBDUMP (772 inverted-window early-return), SRJ XOB x4 (831/856/867/880 windowed), SRJ XOB-QUEUE (1021 windowed); HTFEngine - SRJ HTF x3 + SRJ-HTF-UJDBG (527/537/577/590 ALL FLAG-ONLY); FlowLogic - SRJ HISTSHIFT (879 FLAG-ONLY), SWINGIMB x2 (1145/1156 FLAG-ONLY), SRJ SLREF/RENEWBOUND/STRUCTLEG/SWEPTMASK/EXPORT (1344/1363/1415/1422/1427 windowed), SRJ BIASEND (1440 windowed). FLAG-ONLY count: 9 (2 EVT + 4 HTF/UJDBG + 1 HISTSHIFT + 2 SWINGIMB). Not a STOP.
- P3 bias buffer: SetIndexBuffer(2, g_bufBias) (B-39; re-confirmed). EA feed: UJPROBE ltf via `ReadFlow(FL_BUF_LTF_BIAS, ltf, barShift)` (EA 12333) → `ReadBuf1(g_hFlow, 2, out, barShift+1)` (EA 2055-2058, FLOW_SHIFT_OFFSET=1 at EA 2003) → `CopyBuffer(handle, 2, shift, 1, tmp)` (EA 1986-1992). HIST-A/B read the same buffer number 2.
- P4 chart setup: CHART_INPUTS = NOT_FOUND. No .chr/.tpl under terminal hash 10CE948A...EBD4 contains `SRJ_FlowLogic` (Charts + Templates swept; .chr present for other symbols, none with the string; earlier hash typo owned - folder ends EBD4). Nothing copied, opened or changed elsewhere.

## Part B - one diagnostic edit (EA only), one compile
- B0 `.preB41` backups: EA mq5 63B18C1F / ex5 B0D4AA9E (equal to gate).
- B1 Hunk 1, LIVE call (exactly one hit, EA 11227, pasted before editing): after `true, 60` appended `, 0, 0, 0, true, "2026.06.05 07:00", "2026.06.05 10:00"`. DEVIATION REPORTED (not silent): the relay text says `XPOI_NA, XPOI_NA, XPOI_NA`, but that name does not exist in the EA (grep: zero hits) and would not compile. `0` is value-identical (P1: XPOI_NA = 0, first enum member), so the three XPOI inputs still bind XPOI_NA; inHtfDebugLog=true with the 07:00-10:00 window as specified. Nothing else in the call changed.
- B2 Hunk 2, HIST block at the top of `void OnTick()` (EA 12370, pasted): once-only, gated 2026.06.05 10:00 <= TimeCurrent() < 2026.06.05 12:00 (both bounds; RECON62 excluded by dates). Step A: HIST-A with exactly the B1 LIVE arguments, B41HIST_A_BEGIN, BarsCalculated-gated CopyBuffer of buffer 2, 50-tick retry else B41HIST_A_NOTREADY, 37 B41HIST src=A rows (07:00-10:00), B41HIST_A_END, IndicatorRelease. Step B after A with inUseConfirmedHTFOnly=false, B markers/rows. Own statics/locals only (b41_ prefix).
- B3 compile once: `Result: 0 errors, 0 warnings, 8274 ms elapsed` (log B41_EACOMPILE.log). Edited source SHA 410EC99C9... kept `.B41HIST` same SHA, never committed. Full diff vs `.preB41` pasted raw in slice (two hunks). No compile errors: no Part R verdict change needed on this account.

## Part C - two runs
- C0 hygiene: no terminal before each launch (verified; leftover stopped before C2); terminal.ini [Tester] written + read back per run (RECON62 1787702400/1788998400 EURUSD; June 1780272000/1781308800 USDJPY); script launchers (RunName-only mirrors); window proofs from day log; wrapper killed; watcher started + PID verified by number (B-38 lesson applied, PIDs 10256 and 1664); short-cycle DONE polls.
- C1 run 1 j25 (RECON62-B41_JOURNAL.log, 140778 lines; PASSED DONE 13:28:14; 563338 ticks, 3168 bars, balance 10474.64; PRE 522843). Line-count note: 140778 vs j23 79267 - tester/agent chatter, not EA rows (UJPROBE 3168/3168 identical). Grade vs j23: readings 3168 identical; 7 takes identical (entry candle/price/exit each: 8/28 1.16466→1.16439; 9/1 1.16022→SL 1.15975; 9/4 1.16018→1.16129 +1 BROKER SENT; 9/7 1.16135→1.16200; 9/7 1.16261→1.16315; 9/8 1.16205→1.16102; 9/8 1.16220→SL 1.16274); A2RECLAIM 8; B41HIST 0 (date gate held; RECON62 excluded). No STOP-E. C2 run.
- C2 run 2 j26 (JUNE-B41_JOURNAL.log, 128884 lines; PASSED DONE 13:33:08; 542258 ticks, 2880 bars; final balance 10017.14; PRE 663621). Neutrality check vs j24: OBPROV code/id/bar rows 07:00-10:00 identical (07:25 x2+flip; 08:15 x1+flip; 09:00 flip-alone; 09:25 code=3; 09:55 code=3+flip); UJPROBE ltf per bar_key identical through the 09:55 bar; 09:40 refusal SEEDBIAS_REFUSED identical (j26 has it; verified in C3 slice section); 3 June + 4 June takes identical. THEN DIVERGES: 5, 9, 11 June takes missing (only 2 fires: 3/6 LONG 159.932→159.983; 4/6 SHORT 159.868→159.920), balance 10017.14 vs 10238.43. Cause (builder defect, owned): HIST-A used exactly the LIVE arguments, so MT5 returned the SAME shared indicator instance (b41_hA == g_hFlow); my IndicatorRelease calls destroyed the live copy at the 10:00:01 tick; every g_hFlow read after prints EMPTY (first at the 10:05 pass, j26:119338+). "Never touches g_hFlow" held for variables but not for the shared instance. STOP-N declared: C3 extracted below, the whole C3 marked NOT_NEUTRAL for post-10:00 bars only (07:00-10:00 evidence printed before/during the 10:00:01 tick and is intact), then Part R. Verdict: MEASURED (the extraction - the relay's purpose - fully succeeded) with NOT_NEUTRAL recorded, not RESTORED-on-failure.
- C3 extract (raw rows with j26 numbers in slice; trader table here).
  - a. LIVE DEC rows 07:00-10:00: one pass per candle (no per-tick repeats in-window; the pass kept is the candle's close pass, stated per row by its stamp). Per candle: biasBefore/after, inBias, opp, bull, bear, strong, renew, weak, drawBiasLine, structStartT. Full rows in slice C3a. Material spine: 07:20 strongFlip→bullish; 08:10 strongFlip→bearish; 08:55 weakFlip→bullish (SRJ EVT kind=weakFlip, j26:69784); 09:50 strongFlip→bearish (j26:70394). On the 09:20 candle (close pass 09:25:04): biasBefore=bullish, inBias=1, opp=1, bull=1, bear=1, strong=0, renew=0, weak=0, drawBiasLine=0, structStartT=08:55, biasAfterDecision=bullish (j26:70171-70173).
  - b. OB invalidations 07:00-10:00 (SRJ INV + OBPROV code map; zone/mid/close NOT_PRINTED everywhere - no row carries them; only the 09:15 bar OHLC exists and it is not an invalidation bar):
    - 07:20 bar: TWO bearish OBs (obStart 06:50 + 05:15), bias bearish, refOk=1 → in-bias pair; fed the 07:20 strongFlip bullish. (OBPROV ids 2420/2406 by pass-map.)
    - 08:05 bar: bullish OB (obStart 07:35), bias bullish, refOk=1 → in-bias #1. (id=2421.) THIS is his 7:35 event (OB born 07:35, killed by the 08:05 close).
    - 08:10 bar: bullish OB (obStart 07:50), bias bullish, refOk=1 → in-bias #2 → strongFlip BEARISH at 08:15. (id=2422.)
    - 08:20 bar: TWO bullish OBs (obStart 06:45 + 05:05) killed with bias ALREADY bearish → opposing-side; fed the 08:25 renewal, not a flip.
    - 08:30 bar: bullish OB (obStart 04:15), bias bearish → opposing. 08:40 bar: bearish OB (obStart 04:35), bias bearish → in-bias (bearish count).
    - 09:10 bar: bearish OB (obStart 08:55), bias bullish → opposing (opp=1). (id=2428 = code=4.)
    - 09:20 bar: bullish OB (obStart 09:00), bias bullish, refOk=1 → in-bias #1 (bull=1). (id=2429.) THIS is his 9:00 event (OB born 09:00, killed by the 09:20 close).
    - 09:50 bar: bullish OB (obStart 08:20), bias bullish, refOk=1 → in-bias #2 → strongFlip BEARISH at 09:55. (id=2424.)
  - c. HIST hoop rows (journal stamps 10:00:00/10:00:01): the full recompute reprints every INV/EVT/DEC row with identical values (e.g. hoop 119186 repeats the 09:20 INV verbatim; hoop 119188-119200 repeat its DEC triplet). A-vs-B attribution: NOT SEPARABLE in DEC/EVT (no instance tag; both computed the same tick) - reported as A∪B joint. The B41HIST bias strips ARE tagged and complete (37+37 rows, A_BEGIN/END j26:70419/70479, B_BEGIN/END j26:70482/119336, no NOTREADY): A strip and B strip are IDENTICAL bar-for-bar (07:00-07:10 down; 07:15-08:00 up; 08:05-08:50 down; 08:55-09:40 up; 09:45-09:55 down; 10:00 0.0/EMPTY forming-bar edge). Caveat recorded: HIST-A shared the LIVE instance (identical args), so its strip re-reads LIVE's buffer; HIST-B is the independent recomputation (default flag) and agrees with it entirely.
  - d. Side-by-side (bar convention stated first): my strips read CopyBuffer shift = iBarShift(bar) with NO +1 offset; UJPROBE bar_key=B reads slot s(B)+1 (FLOW_SHIFT_OFFSET, EA 2003-2007; TASK-20 comment). Empirically strip[B] == UJPROBE[B+1bar] on all 36 checkable bars (e.g. strip 09:45 -1.0 == UJPROBE 09:50 -1.0; strip 08:50 +1.0 == UJPROBE 08:55 +1.0). Under that lane convention the table collapses to identity - stated raw below so the planner sees both:

    | candle | LIVE ltf (UJPROBE) | HIST-A bias | HIST-B bias | flips on candle |
    |---|---|---|---|---|
    | 07:00-07:10 | down x3 bars | down x3 | down x3 | - |
    | 07:15 | down | up | up | (slot convention; LIVE turns up at 07:20) |
    | 07:20 | up | up | up | LIVE+A∪B strongFlip→bullish |
    | 07:25-08:00 | up | up | up | - |
    | 08:05 | up | down | down | (slot convention; LIVE turns down at 08:10) |
    | 08:10 | down | down | down | LIVE+A∪B strongFlip→bearish |
    | 08:15-08:50 | down | down | down | - (08:20/08:30 kills opposing-side) |
    | 08:55 | up | up | up | LIVE+A∪B weakFlip→bullish |
    | 09:00-09:15 | up | up | up | - |
    | 09:20 | up | up | up | NO flip anywhere (inBiasCount=1) |
    | 09:25-09:40 | up | up | up | - |
    | 09:45 | up | down | down | (slot convention; LIVE turns down at 09:50) |
    | 09:50-09:55 | down | down | down | LIVE+A∪B strongFlip→bearish |
    | 10:00 | down | 0.0/EMPTY | EMPTY | forming-bar edge, no read |
- C4 named answers:
  - HIST_A_FLIP_0920 = NO. First bearish turn after 09:00: the 09:45 strip bar (-1.0); executing flip = 09:50 strongFlip (kind=strongFlip, joint hoop row).
  - HIST_B_FLIP_0920 = NO. Same: 09:45 strip bar; 09:50 strongFlip.
  - LIVE_FLIPS_0700_1000: 07:20 strong→bullish; 08:10 strong→bearish; 08:55 weak→bullish; 09:50 strong→bearish (EVT kinds quoted).
  - HIST_A_FLIPS = HIST_B_FLIPS: same four (joint hoop EVT rows; strips identical; A/B not separable in EVT).
  - BULL_OB_FAIL_0735: LIVE: the 07:35-born bullish OB died on the 08:05 close (id=2421 by pass-map; mid+close NOT_PRINTED). A: same joint rows (shared-instance caveat). B: same joint rows (independent recompute, identical values).
  - BULL_OB_FAIL_0900: LIVE: the 09:00-born bullish OB died on the 09:20 close (id=2429; mid/close NOT_PRINTED). A/B: same joint rows.
  - COUNTER_0920: LIVE inBias=1, opp=1, strong=0 (inBiasCount=1); A∪B joint identical (hoop 119188-119190).
  - WHY_NO_FLIP_LIVE_0920: `inBiasCount=1` with `strongResult=0` - quote j26:70172 `SRJ DEC3 t=2026.06.05 09:20 ... inBiasCount=1 ... strongResult=0 ...` (full row in slice). One counted, two needed.
  - READ_SPLIT = BOTH_MISS. Neither A nor B turns at 09:20 (strips + joint DECs agree with LIVE under the stated convention); the confirmed-only setting changes nothing here (A≡B). Points to history depth (tester instance starts 2026-04-29, lookback 3000; his chart's depth unknown, inputs unrecovered) or his chart setup (NOT_FOUND). Fix NOT proposed; planner rules B-42.

## Part R - restore (always)
- R1 `.preB41` copied back over EA source + ex5 (no recompile, nothing required it). Verified EA 63B18C1F (680981 B) and ex5 B0D4AA9E.
- R2 untouched: FlowLogic mq5 956BF3E3, ex5 27B5F272, HTFEngine D5FD5B06 (all re-taken).

## Part F - planner-context refresh
- F1 context section 2, `- GitHub integration (PromptQL):` bullet extended with the base64 sentence, verbatim. New SHA reported below.

## STOP rules
- STOP-A none. STOP-P none (order verified). STOP-E none (C1 identical). STOP-N DECLARED (C2 diverges post-10:00 by builder defect; C3 extracted, marked NOT_NEUTRAL below for post-10:00 bars). No compile errors.

## Result, push, reply
- Result + slice (1249 lines) + ledger 1183 (grep `^1183.` was 0; appended; tag B41-HISTREAD-0605LDN) + pointer (B-41, next B-42) + planner context: 5 files pushed to builder/B-41. Never the EA.
- Final disk state: EA source 63B18C1F (restored, uncommitted; == .preB41 == .B38A2 content lineage) with ex5 B0D4AA9E MATCH (restored binary from the B-38 0/0 compile, no rebuild). `.preB41` (both) and `.B41HIST` kept untracked, never committed.
- Carried note: C4 in trader words - your 9:20 candle did kill a bullish block while the read was up (the block born at 9:00, id 2429), but it counted only 1 of the 2 the machine needs, because your 7:35 block's kill (08:05) had already been spent on the machine's own 8:10 down-turn and wiped by its turns after (up 08:55, still up through 09:45). The machine's down-turn came at 9:50 instead, off your 9:20 kill plus a second kill at 9:50. Its after-the-fact recomputation agrees with its live watch, and the standard-settings copy agrees too - so the split is not live-vs-history and not the one differing setting; what is left is how far back each copy looks or your chart's own settings, which this machine could not recover. The 5/9/11 June takes are missing from run 2 by my defect (explained above), not by the market: everything asked for was printed before it. NOT_PRINTED list: OB zone/mid/close per id (2420/2406/2421/2422/2401/2428/2429/2424); counter values after each event (per-candle DEC snapshots only); A-vs-B attribution inside joint DEC/EVT rows; his chart's FlowLogic inputs (CHART_INPUTS NOT_FOUND); 07:00-10:00 OHLC except the 09:15 bar (159.959/159.964/159.954); second UJPROBE passes; post-10:00 June takes in j26 (NOT_NEUTRAL by defect).
- Reply line + ls-remote below.
