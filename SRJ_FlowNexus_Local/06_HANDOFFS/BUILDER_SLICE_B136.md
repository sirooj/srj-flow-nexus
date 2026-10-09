# BUILDER SLICE B-136 - S0' raw, K spots and diff, T tables (RESTORED on R-a volume drift)

Scope: reads/greps/S0' script, ONE EA hunk, ONE compile, ONE RECON62 run (June skipped on R-a), text records. 4JUN/XOB/HTF never reopened.

## START GATE (raw)

- `git ls-remote backup builder/B-135` = `be0679449f32e8f77c8330641ecfc89575a064b1` (cut builder/B-136 here; no remote B-136 before push).
- `git log -1` = `be06794 B-135 his 28 Aug exit is the 11:35 open, own-body re-grade on his exits SEPARATES; verdict MEASURED`.
- `git status --short` count = 531 (kept, none staged).
- Protected diff vs be06794 EMPTY by `git diff --quiet` (pointer, RESULT_B135/SLICE_B135, RESULT_B134/SLICE_B134, RESULT_B133, ROWPACK/, register, ledger, CONTEXT, HANDOFF, both skills, spec, journal CSV, FINDING EXIT-BREAK-RETEST, 99_WORKFLOW/).
- Ledger `1280.` = 1, `B135-A1-EXIT-OWED` = 1, `1281.` = 0, `B136-` = 0. CONTEXT `B135-OWED-EXIT-NOT-MACHINE-EXIT` = 1, `B136-` = 0. HANDOFF `B-135:` = 1, `B-136:` = 0. Register `NOTE 2026-10-09 (B-135)` = 1. Pointer `Lane: A2-EXIT (first B-133, 2 of 6)` = 1.
- Disk SHAs: EA 90240F23-64char (LF-norm = raw) / EX5 6CFD3A46 / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 / terminal.ini 4082A94F. No terminal64 (0). S0 script grade_s0_b134.ps1 FOUND on disk.

## PART B (greps; append nothing)

- s23 L23: `Break-and-retest: a gap of the POC or AVP lines with price breaking through by BODY candle close flips the bias direction and exits (the 8/28 11:35 instance).`
- s36 L36, (a) SAME-LINE-NO-EXIT + (b) HIGHER-BREAK-EXITS halves on the line; s49 L49: `8/28 London exit-flaw (his words 2026-09-22: entry correct, exit mechanism flawed).`
- s78 L78: `9/1 early-exit INSTANCE (his words 2026-09-23: exit should not be full -1R; exit one candle before at the 17:45 close on the Y-POC bearish gap-break; Y POC 1.15987 vs 17:45 close 1.15984).`
- s87 L87 POC-SUPREMACY heading; s28 L28 tail `BREAK-leg next-open untouched`.
- EXACT-PRICE-NO-LENIENCY L34; NO-OVERFIT L60; RETRACE-IS-IN-PLAY L203; NO-CASCADE L205.

## S0' + S1 (re-run output; expected exactly)

- A1: anchor=Daily-VWAP first=2026.08.28 11:30 SHORT o=1.1644 c=1.16463 Daily-POC=1.16451 barpack=351 censpack=355 exitBar=2026.08.28 11:40
- A2: anchor=Monthly-VWAP first=2026.09.01 17:45 LONG o=1.16002 c=1.15985 Yearly-POC=1.15987 barpack=54 censpack=69 exitBar=2026.09.01 17:50
- A3/A4/A5/A6/A7/B2/B3/C-05-27/C-06-03: NONE. C-06-04: NONE (never counted). No STOP.
- S1: A1 MOVES-TO-HIS (HIS 11:35 open 1.16464); A2 MOVES-TO-HIS (HIS s78 17:45 close, 17:50 open); rest UNCHANGED change detectors; B1/C-06-02/C-06-10/C-08-27/C-09-01-1530/C-09-04-1040/C-08-28-1625/C-09-08-1645 OTHER-GATE.

## K0 QUOTES (no contradiction; hunk implements s23/FINDING L7, fills nextOpen per s28/spec §4, rank per s36(a)/s87)

- s23/s36/s49/s78/s87/s28-tail as in Part B. Spec §2 row 3: `POI-side exit | body closes through the level | per bar | pre-confirmation invalidation; post-entry exit`. Spec §4: `Default: evaluate at the next candle's open, at three sites — the POI retest that seeds a candidate, the confirmation candle, and the exit.` Spec §5.1: `POI behind the trade → it supports the trade. Exit only on a body close through it. A wick through does nothing.` + `The body-close break is an unconditional immediate exit.` Spec §5.2: `Classification is per bar, not fixed at entry.` Spec §5.3: `No gap concept (§1.3). No favour/adverse asymmetry.` FINDING L7: `hence the exit at 11:35` (whole quote in RESULT_B135 slice lineage).

## K1 SPOTS (real line numbers, kept EA 90240F23)

- EA:12293 `double o = iOpen(_Symbol, PERIOD_CURRENT, barShift);` / EA:12296 `double c = iClose(_Symbol, PERIOD_CURRENT, barShift);` (closed candle's own open/close = UJBARMAP values; in scope at the loop — buildable).
- EA:12299-12300 nextOpenPx (+fail-soft to close); EA:12301-12302 bodyLo/bodyHi open->next-open; EA:12303 `double EPS = 0.001 * _Point;` (1e-8 EURUSD / 1e-6 USDJPY; one point = 1e-5/1e-3; EPS far below one point — no STOP).
- Loop EA:12416-12457; behind EA:12425-12426 (vs nextOpenPx); through EA:12430-12431 (bodyLo<L-EPS / bodyHi>L+EPS); trigger EA:12433 (MtIsBreakTrigger EA:12011-12017, anchor-true + FAMILY_POC evens); census EA:12440-12449; rank gate EA:12451 (strictly above anchor); priority EA:12509-12518 + header EA:12281-12282; fill EA:12516 `exitPrice = nextOpenPx`; MTEXIT EA:12520-12526.

## K2-K5

- Backups: .preB136 EA 90240F23-64char, EX5 6CFD3A46 (both verified).
- Edited SHA 585093BF576B922A241E21779C72C62236B4F57746F778E25A772E493CC3D9C6 (first pass EE7F515A...; whitespace restored on kept lines after); .B136BRK kept uncommitted.
- Compile: 0 errors, 0 warnings (two compile_and_deploy attempts hit transient WinError 32 with no terminal running; plain compile ok, binary fresh in Experts/ itself). Trial EX5 2F5199D1FB9D63412151E48777F36CCE77301645A085B4B993C1237FCBF9F9DF.

## K DIFF (raw, .preB136 vs .B136BRK; kept logic lines byte-identical)

- EA:12341 add `bool brkKeptSrc = false, brkOwnSrc = false; //--- [B-136 BRK-OWNBODY] which break test fired this pass`.
- After EA:12433 insert own-body block: `ownBehind` (L vs o), `ownThrough` (c vs L∓EPS, same strict form), `ownRankPass`, `ownBrk` (all ANDed).
- Census: format + `verdict=%s ownO=%s ownC=%s ownBrk=%d`; verdict `((isTrigger && behind && through) || ownBrk) ? "BREAK" : "ok"`; new args o/c/ownBrk.
- Kept gate: same condition + `brkKeptSrc = true;` inside. New own gate after: `if(ownBrk){ brkOwnSrc = true; if(!vBREAK){ vBREAK=true; breakLineVal=L; breakLineName=...; } }`.
- MTEXIT: format + `src=%s`; value `(BREAK ? ((both)?"BOTH":(own?"OWNBODY":"NEXTOPEN")) : "-")`. Priority chain untouched.

## T0 + T1 TABLES (day-log j993726-1065738; DONE=PASSED 19:35:57, ~3 min)

- T0: terminal64 0; copies terminal.ini.preB136 + Charts.preB136; [Tester] EURUSD 1787702400/1788998400 read back; WMI launch PID 12640 RC=0; STATUS window verified (PRE_JOURNAL_LINES=993725, term PID 21568, server from 2026.08.26); wrapper killed, terminal survived; watcher PID 9516 verified; short polls; DONE True.
- Deals (kept vs trial): #2 identical; #3 buy 11:45 1.16440 -> buy 11:35 1.16467 (MTEXIT bar=11:30 D-POC 1.16451 exit=1.16464 src=OWNBODY J1009864; +3pt lag class); #4 buy 17:35 1.16024 2.05 -> 2.04 VOLUME (R-a); #5 sell 17:51 1.15975 -> sell 17:50 1.15987 (MTEXIT bar=17:45 Y-POC 1.15987 exit=1.15987 src=OWNBODY J1024023; deal = exit exactly); #6/#7 identical (DAY_CLOSE 23:55 1.16129); #8 2.5 -> 2.49 VOLUME (R-a); #9 same price/time 2.49; #10 3.91 -> 3.9 VOLUME (R-a); #11 same price/time 3.9; #12-15 fully identical (incl. 10:42 TP, 17:26 SL). Count 14 ok.
- R-a FIRED (volumes #4/#8/#10). R-b passed. R-c passed (no new deal; 7/7 ENTRY_TICKET+EXECUTED identical; ownBrk=1 rows in segment exactly J1009851 A1-11:30 + J1024018 A2-17:45). No GATE/REFUSED/start_time warnings (STATUS RESULT=PASSED).
- Restore: terminal killed by PID; EA/EX5 from .preB136 (SHAs verified 90240F23/6CFD3A46); terminal.ini + Charts from copies (4082A94F verified, 20 files); June skipped. RESTORED.

## RECORD LINES (exact)

- X1 §4: `- B136-OWNBODY-ON-HIS-EXITS (planner lesson 2026-10-09): an exit term goes to trial only after its separator is graded on his owed exits (B-135 R5); it is OR'd onto the kept break test, with the fill left at the next open. B-134 S0 alone would have guarded the machine's 28 Aug 11:40 time. B-136 trialed the own-body break (side by the candle's own open, through by its own close) on the kept build: 28 Aug owed out at the 11:35 open, 1 Sep owed out at the 17:50 open, every other deal a change detector.`
- X2 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-136 (kit PK-2); this file stays the single planner context (PROMPTQL_PLANNER_CONTEXT.md stays audit-only).`
- X3 §3: `- B-136: kept-build trial of the own-body break exit OR'd onto the kept next-open break (28 Aug out at the 11:35 open, 1 Sep out at the 17:50 open), graded RECON62 then June; verdict <KEPT|RESTORED|STOP>.` with verdict RESTORED (June skipped on R-a; scope words kept as relayed).
- X4 ledger `1281.` tag `B136-BRK-OWNBODY` (S0'+S1, K, T1, RESTORED + 25pt correction).
- X5 pointer: RESTORED; SHAs 64-char; `Lane: A2-EXIT (first B-133, 3 of 6)`; goal open. Register untouched (KEPT-only).
- Pre-commit: X1/X2/X3 counts 1; `1281.`-class 1, `1280.` = 1; staged = result, slice, ledger, pointer, CONTEXT, HANDOFF; no source/EX5/journal/log/settings diff beyond staged.

(End of slice)
