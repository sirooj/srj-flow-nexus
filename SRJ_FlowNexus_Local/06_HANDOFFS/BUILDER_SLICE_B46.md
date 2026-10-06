# BUILDER SLICE B-46 - raw rows behind P1-P6 (payloads only; no run, no terminal)

Disk EA = 63B18C1F (untouched). Sessions for P4: London 09:00-12:00 server, NY 14:00-19:00 server (B-44 CLOCK June mapping, assumed same for Aug/Sep; stated).

## P1 RAW files on disk (who/when/source: NOT_FOUND on record; no CustomRatesReplace in repo code)
- bases\Custom\history\USDJPY_RAW\2026.hcc 19053798 B SHA 5049D8EB (touched 2026-10-06; binary HCC, NOT_DONE_NEEDS_RUN for rows)
- bases\Custom\history\USDJPY_RAW\2025.hcc 1765971 B (2026-08-03)
- bases\Custom\ticks\USDJPY_RAW\202605.tkc 5508509 B SHA B8DD8F6C (2026-08-03; header UTF-16 "Copyright 2000-2026, MetaQuotes", records binary)
- bases\Custom\ticks\USDJPY_RAW\202606.tkc 4657360 B (2026-08-03)
- bases\Custom\ticks\USDJPY_RAW\ticks.dat 7864752 B (2026-10-06)
- bases\Custom\{history,ticks}\{EURUSD_RAW,GBPUSD_RAW}\ present (EURUSD_RAW 2026.hcc 18678468 B); June symbols mirror USDJPY_RAW layout
- Readable gap source instead: MQL5\Files\SRJ_TickAudit_20260907_{days,gaps}.csv (audits through 2026-09-04; builder-run audits, not his words)
- Record hits: skill:158 (banked W1 just now); findings: none; journal: line 1060 only (banked row 308); register: none; ledger:5404 (tester .hcc history note, ADJACENT - history files, not custom-symbol origin)

## P2 RAW row paste: NOT_DONE_NEEDS_RUN (both halves)
- USDJPY_RAW 07:50-09:05 rows: .tkc/.hcc are proprietary binary (header text + binary records); no decoder on record; readable only through the terminal.
- Tester USDJPY history rows: same (.hcc binary); NOT_DONE_NEEDS_RUN.

## P3 TESTER_HAS_HOUR = YES (raw rows below; bar arithmetic confirmed)
- j32 UJPROBE rows stamped 08:00-08:55 print in full (ltf strip B-44: -1.0 at 08:50 and earlier down bars, +1.0 from 08:55).
- Bar indices: 09:20 bar = 106444 (j32 INV). 09:00 candle = 106440 (obStart of the 09:00-born OB, j32 INV). 07:55 candle = 106427 (106444 minus 17 bars; UJPROBE bar_key 07:55 prints, j26/j32 ltf strips).
- v26 code=8: 07:25:45/106420, 08:15:04/106430, 09:00:00/106439, 09:55:00/106450 (RECON74 rows, same bars as j26).
- r78 code=8: same four passes/bars (RECON78-V26 rows).
- 106439-106420 = 19 bars across 95 minutes: the 08:00-08:55 candles are present in both. FLIP_0810 at 08:15:04 bar 106430 present in both. Both took the short with the 5m-bias-at-entry gate absent (B-40: zero London gate rows in either; BYPASS+PREBIND road).

## P4 RAW_READ_TRADES table (register trades / banked calls naming _RAW; then RECON62 full)
- Register trades naming _RAW: NONE (zero hits). Banked chart calls naming _RAW: exactly one - journal row 308 (5 June LDN USDJPY SHORT, read on RAW per his W1).
- 5/6 LDN USDJPY SHORT, London window 09:00-12:00 server: June gaps NOT audited (no June TickAudit file) -> NOT_DONE_NEEDS_RUN.
- RECON62 EURUSD (LDN 09:00-12:00 / NY 14:00-19:00 server):
  - 8/26 LDN NO_GAP; 8/26 NY GAP 17:00-17:55 (12 candles; 16:59:59-18:00:00).
  - 8/27 LDN NO_GAP; 8/27 NY NO_GAP. 8/28 LDN NO_GAP; 8/28 NY NO_GAP.
  - 8/29 CLOSED; 8/30 CLOSED.
  - 8/31 LDN GAP 10:00-11:55 (24 candles; 09:59:54-12:00:01; pre-window gaps 02:59-04:00 and 08:00-08:55 noted outside); 8/31 NY NO_GAP.
  - 9/01 LDN NO_GAP (01:59-03:00 outside); 9/01 NY NO_GAP.
  - 9/02 LDN NO_GAP; 9/02 NY NO_GAP. 9/03 LDN NO_GAP; 9/03 NY NO_GAP. 9/04 LDN NO_GAP; 9/04 NY NO_GAP.
  - 9/05 CLOSED; 9/06 CLOSED. 9/07 LDN NOT_DONE_NEEDS_RUN; 9/07 NY NOT_DONE_NEEDS_RUN. 9/08 LDN NOT_DONE_NEEDS_RUN; 9/08 NY NOT_DONE_NEEDS_RUN. 9/09 LDN NOT_DONE_NEEDS_RUN; 9/09 NY NOT_DONE_NEEDS_RUN.
- Count line: 2 session-windows GAP (8/26 NY, 8/31 LDN), 14 NO_GAP, 2 days CLOSED, 6 windows NOT_DONE (9/7-9/9, unaudited).

## P5 RUN_TIME table (B-41 to B-44; terminal.ini as on disk)
- terminal.ini [Tester]: Expert SRJ_FlowNexus_EA.ex5, Symbol USDJPY, Period 5, TicksMode 4, DateFrom 1780272000, DateTo 1781308800, Deposit 10000.00, Leverage 100, Execution 0.
- j26: USDJPY M5, Model 4 (run ini), 2026.06.01-13, deposit 10000, wall ~10:21 to 10:24:03 (~3 min), 542258 ticks.
- j31: EURUSD M5, Model 4, 2026.08.26-09.10, 10000, wall 16:39:39 to 16:43:46 (~4:07), 563338 ticks.
- j32: USDJPY M5, Model 4, S5 2026.06.05-06, 10000, wall 16:46:22 to 16:46:41 (~19 s; test 17.783 s), 61072 ticks.
- His usual run settings (symbol/period/model/range/deposit): NOT on record beyond his W1 "50 minutes" and the skill's old-shift era (j12/j13 51-58 min at lookback 16388).
- Builder run on _RAW symbol: NO (no run ini uses one; B-20:95 documents the near-miss line + restore).
- Plain-words line: the machine replays with the fixed 3,000-bar lookback, so the full windows grade in 3-4 minutes and short diagnostic windows in seconds; the 50-minute runs belong to the old 16,388-shift builds on the same windows. No proposal.

## P6 CONFIRM_READ_0605 = YES (j32 rows; retained from B-44)
- FLIP_0810: code=8 08:15:04 bar 106430 (bearish; ltf -1.0 from 08:10 bar).
- FLIP_0855: UJPROBE +1.0 at 08:55 after -1.0 at 08:50 (kind weakFlip per j26 EVT; no EVT in j32, debug off).
- FLIP_0950: code=3 id=1734 + code=8 09:55 bar 106450 (bearish; ltf -1.0 from 09:50 bar).
- 09:40 SEEDBIAS refusal identical to j27 (ABORT + A6REFUSED 09:40, same shape).
- At 09:40 and 09:45 the machine's 5m read was +1.0 (FLIP_0855 stood, FLIP_0950 not yet), so the refusal agrees with 5M-BIAS-AT-ENTRY (section 11) and with his W5. YES.

(End of slice)
