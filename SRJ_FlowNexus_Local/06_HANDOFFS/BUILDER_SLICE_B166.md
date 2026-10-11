# BUILDER SLICE B-166 - readiness quotes, audit table, run lines (MEASURED; no trade list)

Base: builder/B-165 head 57ffc52 on builder/B-166. Gate per result (diff EMPTY, SHAs match, counts 1, pre-greps 0, terminal.ini ACCOUNTED). Runs: GBP0629-B162 (Tester/logs/20261011.log, PRE=1078201).

## Part B (grep-first, verbatim)

- B1 counts 0/0/0/0 (skill, journal, ledger, register) → landed: skill section "27 May NY long UNVERIFIABLE (his words 2026-10-11, B-166)" + consequence line; journal row 321 (B-150 row shape); register section-B NOTE (verbatim); ledger item 1312. All counts 1.
- B2 landed in journal row 321 with B1. Count 1.

## R1 raw

- Symbol: bases\Dukascopy-demo-mt5-1\history\GBPUSD\2026.hcc present (17 MB, 10/06) + ticks\GBPUSD + cache M5.hc. Digits/point NOT PRINTED pre-launch (binary symbol DBs); T-run prints 5 decimals (deal fills 1.33716/1.33564/1.33863/1.33901). Spread: no Spread key in RECON50_DEMO_USD.ini, USDJPY_DEMO_JUNE.ini, GBP0629-B162.ini (B-138 R2 class) — broker floating, SAME.
- Branches: EA `USDJPY|EURUSD|GBPUSD` hits = EA:4974/4984/4988 `inst=EURUSD_M5` (print labels, cosmetic); `"JPY"|_JPY` = 0; 419 _Symbol/Symbol() uses generic. Include/SRJ = 4 comment hits (ImbalanceMgr:356, SeedFormat:85, TickCore:88/417/446). Indicator = 0. UJ* prints unconditional (EA:11305/12518/12887, no symbol gate) — general path. Fixtures EU-Sep-scoped diagnostic-only (HandFixture header: labels never operands; SrjFiledLevel bar-keyed Aug/Sep; g2Px HYPO/FIXTURE grade flags; sl41_halt feeds SLEXT481 print; ladDate 09.07/09.04). No _Digits/JPY branching (0 hits). Verdict: general path, no STOP. Cosmetic: A6DECISION inst tag mislabels GBPUSD rows.
- TickAudit: SOURCES found (Indicators + Scripts .mq5); runnable preset NOT FOUND (only B48 sets) → Presets\SRJ_B166_GBP.set (InpSymbols=GBPUSD, InpFrom=1782691200, InpTo=1784332800, B48 shapes) + GBP0629_TICKAUDIT.ini ([StartUp] B47 pattern). Startup-script launch (WMI PID 5000), NOT tester. Table (Files/SRJ_TickAudit_20261011_days.csv): 6/29 77836, 6/30 91671, 7/01 99533, 7/02 126442, 7/03 78306, 7/04-05 CLOSED, 7/06 70382, 7/07 74896, 7/08 116131, 7/09 72244, 7/10 93051, 7/11-12 CLOSED, 7/13 110724, 7/14 112951, 7/15 91016, 7/16 88104, 7/17 82806, 7/18 CLOSED (ticks/day; ~1430 min/day; max_gap empty; verdict UNREAD_BARS; M5 bars "?"). 15/15 with data, 10/10 graded ≥ 8 → proceed. Terminal stopped by PID, terminal.ini + Charts restored (CF80083C + 22/22 verified).
- His record: fixed patterns GBPUSD=1 (own L1073 row), GBP=1 (same), GU=15 (all substring noise: L5/L58-61/L82-89/L263/L281), 7/6-7/10 + 7/13-7/17 dated rows L102-L138 (#101-#137, LDN-dated + companions); 7/11 + 7/12 = 0 (weekend). Regex second form: 9. July block L102-L141 EXISTS, trade details unread (blind discipline: dates/line numbers only).

## T lines

- T0 .preB166 copies: terminal.ini CF80083C + Profiles (4 charts) + run ini, SHAs recorded.
- T1 ini diff raw: only `-Symbol=EURUSD` / `+Symbol=GBPUSD`; no Spread key.
- T2 window write + read-back: [Tester] DateFrom=1782691200 DateTo=1784332800 (only those two lines changed, encoding preserved).
- T3 launch script (WMI PID 19264); journal `GBPUSD,M5 ... testing ... from 2026.06.29 00:00 to 2026.07.18 00:00` + B162ORIGIN on GBPUSD verified; wrapper killed, terminal 8748 alive; watcher PID 19460 verified; DONE polled short-cycle, verified vs marker (B-162 lesson).
- T4 marker: `GBPUSD,M5: 1386092 ticks, 4320 bars ... Test passed in 0:03:55.061` (slot fix live). Restored CF80083C + 22/22 Charts; terminal stopped by PID; no terminal64. Build SHAs unchanged.

## R2 (packs/index/reports)

- Cutter build_rowpack_gbp0629.ps1 (fixed B-165R copy; 2 owned defects fixed: span-list flattening, wrong-loop run names). Packs: 24944 rows (W1 6983/W2 9636/W3 8325) + 15 day files; both MTEXITs packed (j=1448182 W1:5459, j=1470236 W2:3235). DEALS 4 rows register NONE. INDEX (2 deals + 13 kills, refs verified). SETUPS via build_setups_gbp0629.ps1 (15 B60C-dedup candidates, README joins; 4 owned defects fixed: FL collision, kill scoping, bar formats, zone/div joins): 15 rows, 2 EXECUTED, 13 REJECTED with killing rows.
- Sealed sheet: 1 graded + 1 warm-up trade (trader words, report rows only); per-day rejected counts (7/01:1, 7/02:0, 7/03:2, 7/06:4, 7/07:0, 7/08:2, 7/09:1, 7/10:0, 7/13:1, 7/14:2, 7/15-17:0); no validity words.

## X records

- CONTEXT X1 / HANDOFF X2 (1/1); ledger 1312 ("^1312." = 1); pointer B-166 MEASURED, Lane BLIND-GBP0706 (first B-166, 1 of 6); register +1 NOTE (Part B).

(End of slice)
