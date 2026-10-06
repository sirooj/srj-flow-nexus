# BUILDER RESULT B-58 - 5 June bar map on record, reseed path found, no trade moves, KEPT

Trader summary: your 5 June New York long still enters at the 16:15 candle open - on the machine's data that open is 160.059. The six line prices are now on record for every candle 15:55 to 16:20: your Monthly POC sits at 159.885 on all six, and only the 16:00 candle touches any line (it touches all six, then closes down). The 16:05 and 16:10 candles touch and break nothing. What stops a new setup after the 16:05 abort is simple: the next three candles never retest a line (zero retest hits on 16:05, 16:10 and 16:15), so no new seed can form - the code never even reaches its reseed checks. The machine's 5m read at 16:10 agrees bullish with its own probe. Nothing about how the machine trades changed: your 7 EURUSD takes and all June takes repeat exactly on both runs.

## Part 0 - fresh-session start
- 0.1 relay skill loaded first, whole. Relay B-58 wins over older queue items for its scope. His terms used (section 15 TERMS-HIS): "5m bullish bias flip", "5m bearish bias flip", "OB", "OB invalidation".
- 0.2 ls-remote builder/B-57 returns `1614377cccc152f5e57609888deab1c986ff5ccc` (verified). On builder/B-57 at that commit, cut builder/B-58. Dirty tree kept (261 `git status --short` lines; count only). No git-config/remote change. Push through remote `backup` (`origin` never used).
- 0.3 read in order: pointer; RESULT_B57 (C1, C2, MCAND rows, final state); SLICE_B57 (R1, E3, C1, C2, MCAND_J25 rows); RESULT_B55 Part E (E5: 16:00 on j25, all six touched); RESULT_B35 P1 (16:15 vs 16:50 search, P1_RECONCILE = OPEN); strategy preamble + §2 CONFIRMATION-BAR / POTENTIAL vs SETUP / SEED-CARRY EXPECTATION, §5 CONFIRM-ONCE / VENUE-CORRECTION + NEXT-OPEN-ONLY, §7 SAME-CANDLE-PERMITTED, §8 CONFIRMATION-CANONICAL / GATE-AUTHORIZATION / 5M-FLIP-KILL incl. 6/5-TIMING / FLIP-KILLED-NEVER-VETOES, §11 5M-BIAS-AT-ENTRY, §13 JUN05NY-ENTRY-1615, §15 TERMS-HIS / ASK-THE-CODE, Ruling 2026-10-06; register section B row 2 + every CORRECTION + B-56 MAP NOTE + B-57 CORRECTION; PLANNER_CONTEXT.md whole.
- 0.4 start gate: git log -1 = 1614377. Explicit-list diff EMPTY on all 11 files (`git diff 1614377` --stat empty; no directory-wide diff used). Ledger last item 1200 single hit (`^1200\.`); his trade journal 1061 lines. Disk SHAs all MATCH (full strings): EA 958D5AA1 (681229 B) / .preB57 63B18C1F / ex5 A2A47B9F (457450 B); FlowLogic 956BF3E3 / ex5 27B5F272; HTFEngine D5FD5B06, BiasEngine 3B1D9D3D, OrderblockMgr 5D14FCE2, Draw FD2B3716; MARKER 79859EDC (89118 B) / ex5 f0890c0b (119732 B); terminal.ini 88a0deb1 STD_JUNE; j23 75B7321C (79267), j25 A747E55C (79772), j26 F6E30E77 (68248), j27 DD3E6855 (66904). No terminal64 running. No STOP-A.
- 0.5 names as relayed (j23/j25/j26/j27 references; j28 RECON62-B58 run 1 new; j29 JUNE0525-B58 run 2 new; DIAG-BAR / UJBARMAP / B58-DIAG-0605 / .preB58 / .B58DIAG; RECON62 1787702400/1788998400; STD_JUNE 1779667200/1781308800; A1-A7, B1 NOT VALID, B2 owed 16:15 open, B3 160.524->160.587 15:20, C-3June 159.932; MCAND_J27 seeded 15:25 S3 15:50 abort 16:05; machine 16:55 A6FIRED 16:50 deal #8/#9; six lines as UJDTTERMS names them; 16:00-16:15 ranges as relayed).
- 0.6 authority as relayed (Part R read-only; one print-only edit + one compile; two runs with dates per run + restore; Part T tables; result/slice/ledger/pointer; one push; edit uncommitted/unpushed; read-only list honored; no second attempt).

## Part R - read-only, before edit (EA 958D5AA1, j27 DD3E6855)
- R1 j27 rows raw (line numbers j27; full raws in slice):
  - Seed/lifecycle: j27:35757 STATE IDLE->S1 LONG Monthly-POC 15:25; j27:35758 ANCHOR_ELECT SEED bar=15:20 Monthly-POC rank=6 tier=3 LONG; j27:35759 SIDE1T_SEEDBIAS biasAligned=0 verdict=REJECT-BIAS-TIMING (census Vilma, seed still formed); j27:35774 SUPPRESSED 15:25 HELD; j27:35833/35834 S1->S2->S3 15:50; FRESHSKIP PRE_BINDING 15:50/15:55/16:00 (j27:35861/36042/36231); j27:36228 LTFFLIP bar=16:00 (STRONG per j27:36229 LTFDIAG kind=STRONG); j27:36230 UJDEFERABORT; j27:36398 UJDEFERAPPLY; j27:36399 ABORT LTF_MISALIGN 16:05; j27:36400 A6REFUSED ABSENT_DECLINED predicate=LTF_MISALIGN; j27:36401 STATE S3_ZONE_WAIT->ABORT; j27:36410 SHADOW_CONVERT fail=LTF_MISALIGN opened=15:20 barsToConvert=1 16:10; j27:36411 IDCHANGE 16:10 state=IDLE.
  - Retest/confirm/probe per bar: 15:20 RETESTBOOK hits=2 (j27:35751) then hits=0 on 15:30/15:35/15:40/15:45 (j27:35797/35806/35818/35828); 15:50 hits=0 (j27:36018); 15:55 hits=0 (j27:36200); 16:00 RETESTBOOK hits=6 all six lines (j27:36392), UJDTTERMS all LHIT (j27:36393), CONFIRMPOLL anchor Monthly-POC oppCandle=0 bodyDir=0 body=182pts touchAttr=0 confirm=0 (j27:36395); 16:05/16:10/16:15/16:20 RETESTBOOK hits=0 (j27:36413/36419/36424/36429); UJDTTERMS Lno-penetration on 16:05+ (j27:36414/36420/36425/36430).
  - TPCENSUS #124/#125/#126 on 15:50/15:55/16:00 (j27:36004/36185/36374, all winner=NONE best=160.723); no VETO rows; no A6FIRED; alerts: 15:25/15:30 retest alerts + 16:05 alert LONG 159.885 [M-POC +5] (j27:36220), none 16:10-16:20; 16:50 re-seed path (j27:36464-36466 STATE+SEED, S1->S2->S3 same pass; j27:36681 S3->S5) is the machine 16:55 trade, outside R1 bars.
  - Zero ANCHOR_ELECT/SEED rows on 16:00-16:49. Zero SESSION_LIMIT/SEEDDIAG-SESSION rows before 17:00 (SESSION_LIMIT first at 17:00 after the machine trade).
  - FIRST_BLOCKER_AFTER_ABORT: j27:36399 `ABORT reason=LTF_MISALIGN` + j27:36401 `STATE S3_ZONE_WAIT->ABORT` kill the live candidate on the 16:05 candle, and j27:36413 `RETESTBOOK bar=2026.06.05 16:05 hits=0` is the first row showing no new LONG potential can form (no retest on 16:05, 16:10 or 16:15, so no new seed).
- R2 code (found by text, EA on disk, real line numbers; raws in slice):
  - (a) SHADOW_CONVERT block EA:7151-7192. For a non-regime stored fail it calls `CheckLtfAlign(barShift, g_shadowDir, al)` (EA:7177) and prints SHADOW_CONVERT only when aligned (EA:7180-7190); the print's fail= field is the stored abort reason, not a fresh read. CheckLtfAlign (EA:2428-2434) reads FL_BUF_LTF_BIAS at barShift, aligned iff rounded == dir. UJPROBE (EA:12328-12335) reads the same FL_BUF_LTF_BIAS at barShift and prints it. SAME_READ: at the 16:10 pass both read the 5m bullish (UJPROBE ltf=+1.0 on 16:05; shadow converts, i.e. aligns, and prints opened=15:20 with the stored fail=LTF_MISALIGN).
  - (b) Seed path EA:8116-8198: seed needs ST_IDLE (EA:8118), in-window, session unused (SESSION_LIMIT, EA:8121-8137), DetectPoiRetest found (EA:8138-8139), then the eviction-bit gate (EA:8148-8172, RESEED_BLOCKED SKIP on same line+dir+session+day). RESEED_AFTER_ABORT = NOT_REACHED: on 16:10/16:15 the DetectPoiRetest check returns first (RETESTBOOK hits=0, no ANCHOR_ELECT 16:00-16:49, zero RESEED_BLOCKED rows on 6/05 j27). State is back to IDLE by 16:10 (j27:36411) and the session is still unused (SESSION_LIMIT only from 17:00), so neither blocks - the path never reaches them.
  - (c) CONFIRMPOLL/C_TOUCH (EA:2285-2311 shadow terms; EA:2321-2335 live gate A/A2/B/C; EA:2337-2391 IsConfirmationCandle): A = prior candle closed against the direction; A2 = prior close stayed on the setup side of the line (a wick through is retracement, a close through is a break; break-then-reclaim rescued by B38); B = current candle closes in the direction with a real body; C = prior candle's range touched the line (+/-1 point guard); confirm = A && A2 && B && C. Trader words: the candle before must close against your direction without closing through the line, your candle must close your way with a body, and the earlier candle must have touched the line.
- R3 timing grep (terms "16:50", "flipped bullish", "5 June New York", "NY long"): skill:116 timing clause is unquoted paraphrase (B-35 P1 ruled 6/5-TIMING_RAW = NOT_FOUND); findings zero quoted hits; journal only rows 306 (his 16:15 entry) and 309 (entry POI) - neither on 5m timing; ledger zero quoted "16:50" hits. TIMING_0605NY_VERBATIM = NOT_FOUND. Never a STOP. No carried note.
- Part R has no STOP. Proceed to Part D.

## Part D - one print-only edit, one compile (EA 958D5AA1)
- D1 content copies mq5 + ex5 -> .preB58. SHAs: mq5 `958D5AA1495BD08FFAA5B74B9318CD5EB8D632F103E4685E97179642AC5692DF`, ex5 `A2A47B9FAAC84720BAFD212405E8FF0A9CC0BC97DB4B0CF6EFE246EFF6AA05CE` (both = gate).
- D2 hunk DIAG-BAR after the opening brace of `void EvaluateClosedBar(int barShift, datetime barTime)` (EA:6976-6977), before any return: one `if(InpDebugLog)` block printing UJBARMAP with bar time, o/h/l/c via DoubleToString(x, _Digits), the six lines via ReadBuf1(g_hPoi, POI_BUF_{M,W,D}_{POC,VWAP}, barShift) (same read as UJDTTERMS EA:2225-2229), ltf via ReadFlow(FL_BUF_LTF_BIAS, barShift) (same read as UJPROBE EA:12335); missing values print NA; uj_db* locals only, no state write, no return, 3-space indent (B-19 check). No STOP-D (both reads are the same state-free calls the print paths already use).
- D3 full diff vs .preB58 raw in slice (37 added lines, 0 removed, EA:6978). Edited SHA `D00F93BB688001108042536DA5B907AE7676BD51FA22E08C386551D51ABC4193` (683671 B). Edited copy kept as `.B58DIAG` (never committed).
- D4 compile EA only: `Result: 0 errors, 0 warnings, 6449 ms elapsed, cpu='X64 Regular'` (binary fresh). No STOP-B. New ex5 `84F6CE11A654D0672F3F194C82D82105BE47455220D380E22F020A81621F2AE5` (458994 B).

## Part C - runs (REFINE-ONLY: EU first; EA D00F93BB / ex5 84F6CE11)
- C0 hygiene both runs, exactly as B-57 C0: no terminal64 before launch (leftovers stopped by PID: 20976 after run 1, run-2 PID after run 2); content copy config\terminal.ini -> .preB58 (88a0deb1); [Tester] Symbol/DateFrom/DateTo written + read back (run 1 EURUSD 1787702400/1788998400; run 2 restored STD_JUNE USDJPY 1779667200/1781308800 from .preB58, SHA verified); script launchers (launch_recon62_b58_run.ps1 / launch_june0525_b58_run.ps1, WMI-from-file); window verified within minutes (run 1: 8/27-8/28 replay; run 2: 5/25-5/27 replay); wrapper shells killed by PID (17304 / 7632); watch_run.ps1 detached with PID verified (10796 / 11088); DONE polled in <=60 s cycles.
- C1 run 1 RECON62 -> j28 (RECON62-B58_JOURNAL.log, 71417 lines, SHA 29BC5DBA; PRE 214924 on Tester/logs/20261007.log; DONE PASSED 05:37:39, ~3 min; 563338 ticks, 3168 bars, balance 10474.64; window proof testing-of 2026.08.26). Table vs j26, one row per deal, dates first - every j26 deal row identical in ticket, side, time, price:
  - #2/#3 8/28 SHORT sell 10:05:00 1.16466 / buy 11:45:02 1.16440.
  - #4/#5 9/1 LONG buy 17:35:01 1.16024 / sell 17:51:04 1.15975.
  - #6/#7 9/4 LONG buy 16:00:00 1.16019 / sell 23:55:00 1.16129.
  - #8/#9 9/7 LONG buy 09:20:00 1.16138 / sell 10:53:07 1.16201.
  - #10/#11 9/7 LONG buy 16:45:00 1.16264 / sell 17:13:30 1.16315.
  - #12/#13 9/8 SHORT sell 10:10:00 1.16205 / buy 10:42:46 1.16102.
  - #14/#15 9/8 SHORT sell 17:00:00 1.16220 / buy 17:26:29 1.16275.
  - Balance 10474.64 = 10474.64.
  - UJLTFHOLD 0 (must be 0). UJDEFERABORT j28 32 vs j26 32. UJBARMAP 3168 rows (= 3168 bars). FIRED 7. j28 minus UJBARMAP 68249 vs j26 68248 (report only, +1 line).
  - STOP-E1: none (no deal differs, no new fire, no C row, balance same, holds 0). Proceed to run 2.
- C2 run 2 STD_JUNE -> j29 (JUNE0525-B58_JOURNAL.log, 71227 lines, SHA FDD4D79A; PRE 286341; DONE PASSED 05:44:02, ~4 min; 740873 ticks, 4320 bars, balance 10395.28 = j27; window proof testing-of 2026.05.25). Table vs j27, one row per deal, dates first - every j27 deal row identical:
  - #2/#3 5/27 LONG buy 15:35:00 159.344 / sell 20:08:14 159.535.
  - #4/#5 6/03 LONG (C-3June) buy 09:10:00 159.932 / sell 09:59:40 159.983.
  - #6/#7 6/04 SHORT sell 09:55:00 159.868 / buy 10:40:20 159.920.
  - #8/#9 6/05 LONG (machine 16:55) buy 16:55:00 160.120 / sell 19:16:32 160.298.
  - #10/#11 6/11 LONG (B3) buy 14:40:22 160.530 / sell 15:23:06 160.588.
  - B3 MTEXIT 15:20 TP_TOUCH entry=160.524 exit=160.587 (all 5 MTEXIT rows identical to j27). Balance 10395.28 = 10395.28.
  - UJLTFHOLD 0 (must be 0). FIRED 5, no B1 (no 6/05 morning deals), no C row. MCAND_J29 rows match MCAND_J27 15/15 in content (STATE/SEED/FLIP/DEFER/ABORT/SHADOW). UJBARMAP 4320 rows (= 4320 bars). j29 minus UJBARMAP 66907 vs j27 66904 (report only, +3 lines).
  - STOP-E2: none (no deal differs, B1 out, no C row, balance same, holds 0).
- C3 after runs: config\terminal.ini restored from .preB58 (terminal re-saved it on exit, 1E5393A5 - B-42 lesson confirmed) back to STD_JUNE 88a0deb1 and read back ([Tester] Symbol=USDJPY DateFrom=1779667200 DateTo=1781308800); no terminal64 running.
- Verdict: KEPT (C1 and C2 both pass; the print stays on disk).

## Part T - trader tables (j29 UJBARMAP, EA D00F93BB)
- T1 raw j29 UJBARMAP rows (line numbers j29; each row is printed on the next pass, so the stamp is one bar after bar=):
  - j29:38828 `[SRJ-EA] UJBARMAP bar=2026.06.05 15:55 o=160.146 h=160.219 l=160.125 c=160.212 mpoc=159.885 mvwap=159.794 wpoc=159.885 wvwap=159.794 dpoc=159.945 dvwap=159.959 ltf=1.0`
  - j29:39014 `[SRJ-EA] UJBARMAP bar=2026.06.05 16:00 o=160.216 h=160.262 l=159.726 c=160.034 mpoc=159.885 mvwap=159.796 wpoc=159.885 wvwap=159.796 dpoc=159.945 dvwap=159.963 ltf=-1.0`
  - j29:39198 `[SRJ-EA] UJBARMAP bar=2026.06.05 16:05 o=160.032 h=160.086 l=159.992 c=160.008 mpoc=159.885 mvwap=159.798 wpoc=159.885 wvwap=159.798 dpoc=159.945 dvwap=159.966 ltf=1.0`
  - j29:39209 `[SRJ-EA] UJBARMAP bar=2026.06.05 16:10 o=160.009 h=160.062 l=159.981 c=160.058 mpoc=159.885 mvwap=159.799 wpoc=159.885 wvwap=159.799 dpoc=159.945 dvwap=159.968 ltf=1.0`
  - j29:39215 `[SRJ-EA] UJBARMAP bar=2026.06.05 16:15 o=160.059 h=160.082 l=160.022 c=160.073 mpoc=159.885 mvwap=159.800 wpoc=159.885 wvwap=159.800 dpoc=159.945 dvwap=159.971 ltf=1.0`
  - j29:39221 `[SRJ-EA] UJBARMAP bar=2026.06.05 16:20 o=160.071 h=160.166 l=160.053 c=160.161 mpoc=159.885 mvwap=159.801 wpoc=159.885 wvwap=159.801 dpoc=159.945 dvwap=159.974 ltf=1.0`
- T2 marks (machine-computed, exact tests, no margin, no rounding):

| Candle | Open | High | Low | Close | 5m | M-POC 159.885 | M-VWAP | W-POC 159.885 | W-VWAP | D-POC 159.945 | D-VWAP |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 15:55 | 160.146 | 160.219 | 160.125 | 160.212 | +1.0 | NONE | NONE (159.794) | NONE | NONE (159.794) | NONE | NONE (159.959) |
| 16:00 | 160.216 | 160.262 | 159.726 | 160.034 | -1.0 | TOUCH | TOUCH (159.796) | TOUCH | TOUCH (159.796) | TOUCH | TOUCH (159.963) |
| 16:05 | 160.032 | 160.086 | 159.992 | 160.008 | +1.0 | NONE | NONE (159.798) | NONE | NONE (159.798) | NONE | NONE (159.966) |
| 16:10 | 160.009 | 160.062 | 159.981 | 160.058 | +1.0 | NONE | NONE (159.799) | NONE | NONE (159.799) | NONE | NONE (159.968) |
| 16:15 | 160.059 | 160.082 | 160.022 | 160.073 | +1.0 | NONE | NONE (159.800) | NONE | NONE (159.800) | NONE | NONE (159.971) |
| 16:20 | 160.071 | 160.166 | 160.053 | 160.161 | +1.0 | NONE | NONE (159.801) | NONE | NONE (159.801) | NONE | NONE (159.974) |

- T3 in trader words, no proposal: (a) the 16:15 open on the machine's data is 160.059; (b) the 16:05 candle touches or breaks none of the six lines, and the 16:10 candle touches or breaks none of the six lines either; (c) the 16:10 candle closes up (160.058 above the 160.009 open); (d) the 16:00 candle opens at 160.216 and closes down (160.034 below the open).
- T4 cross-check vs 0.5 ranges: 16:00 low-high 159.726-160.262 close 160.034 SAME; 16:05 159.992-160.086/160.008 SAME; 16:10 159.981-160.062/160.058 SAME; 16:15 160.022-160.082/160.073 SAME. Report: SAME.

## Part F - file, push, reply
- F1 this result. F2 slice BUILDER_SLICE_B58.md (R1-R3 raws, D3 diff, C1/C2 tables + raw deal rows, T1 rows).
- F3 ledger item 1201 tag B58-DIAG-0605 (grep "^1201\." count 0 and "B58-DIAG-0605" count 0 -> appended; see below).
- F4 pointer (latest B-58 KEPT; EA on disk D00F93BB, ex5 84F6CE11; j28 29BC5DBA 71417 lines; j29 FDD4D79A 71227 lines; terminal.ini 88a0deb1; Next = relay B-59 from the planner; 35-line cap).
- F5 stage explicit paths only + push builder/B-58 via `backup` (result, slice, ledger, pointer). Never the EA, includes, ex5, journals, logs, inis, launchers or backups.
- F6 ls-remote under the reply line.
- Final disk state: EA source D00F93BB (683671 B) on disk = .B58DIAG; ex5 84F6CE11 (458994 B) compiled from it post-edit 0/0 - MATCH. Includes/FlowLogic/MARKER untouched at gate SHAs. terminal.ini 88a0deb1 STD_JUNE (preB58 88a0deb1 kept in config/). No terminal64 running. Gated text files (disk SHA / LF-normalized SHA): result c626c4e7/c626c4e7 (pre-finalization figure; a file cannot contain its own final hash), slice 38ca0d3b/38ca0d3b, ledger fb7fe68b/ed3b8941, pointer cdfd23f1/cdfd23f1.

## Carried note
- None (no STOP; both ledger greps count 0; R3 NOT_FOUND; nothing for the planner to rule on. Do NOT propose the next change - the planner rules B-59 from R1, R2 and T2).
