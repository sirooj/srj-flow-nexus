# BUILDER SLICE B-167 - ini diff, launch lines, marker, deal table (MEASURED; terminal left open)

Base: builder/B-166 head 5ead339 on builder/B-167. Gate per result (diff EMPTY on protected, SHAs match raw+norm, counts 1, pre-greps 0, terminal.ini ACCOUNTED, no terminal64 pre-launch). Runs: GBP0629-B167 (Tester/logs/20261011.log, PRE=1556930).

## Part B (grep-first, verbatim)

- B1 counts 0/0 (journal, ledger) → landed: journal row 322 (B-150 row shape, B-167 banking comment); ledger item 1313 (verbatim inside). Both counts 1.

## W edits

- W1 srj-relay SKILL.md: Blind-test section after Setup report (0→1).
- W2 CONTEXT section 4: B-167-BLIND-MEANS-HIS-JOURNAL-PRIVATE after B-166 line (0→1).
- W3 blind sheet first line replaced (SEALED → machine-trades-for-his-own-check); rest byte-identical.

## T lines

- T0 .preB167 copies: terminal.ini CF80083CEA9875D327CBF15621E75ECE3AD6EDDE0CB773E4A8EEE4A9A0AB160E + Profiles.preB167 (4 charts) + run ini preB167 9C88E21D473E2C93256BA2AB2662AC00400195D5AAA108747B6657B93A91BEE1.
- T1 keys quoted: ReplaceReport=1 from config/160REG-R2-tester.ini:14; Report= from mql5.com [Tester] batch example (Report=test_bluegolden + ReplaceReport=1). Ini diff raw: only `Report=\MQL5\Files\MT5_GBP0629-B167` + `ReplaceReport=1` added under [Tester]; ShutdownTerminal 0 hits.
- T2 window write + read-back: [Tester] DateFrom=1782691200 DateTo=1784332800 (lines 419/420; [TickLoad] untouched).
- T3 launch script WMI PID 17368; journal `GBPUSD,M5 (Dukascopy-demo-mt5-1): testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.06.29 00:00 to 2026.07.18 00:00` verified; wrapper 17368 killed, terminal 19848 alive; watcher PID 4800 verified by PID; DONE PASSED 2026-10-11 13:13:23 polled short-cycle, verified vs marker.
- T4 marker: `GBPUSD,M5: 1386092 ticks, 4320 bars generated. Environment synchronized in 0:00:00.043. Test passed in 0:03:50.435 (including ticks preprocessing 0:00:00.188).` Terminal 19848 NOT stopped, no restore (re-saves on exit; .preB167 owed). Build SHAs unchanged.
- T5 day-log deals (13:10:31 IS/RJ + 13:11:14 CF/NE): #2 buy 0.65 1.33716 2026.07.02 18:15:00; #3 sell 0.65 1.33564 19:07:53; #4 sell 1.28 1.33863 2026.07.07 14:45:00; #5 buy 1.28 1.33901 15:35:00.

| deal | B-166 | B-167 | result |
|---|---|---|---|
| 2 | buy 2026-07-02 18:15 1.33716 0.65 | buy 2026-07-02 18:15 1.33716 0.65 | SAME |
| 3 | sell 2026-07-02 19:07 1.33564 0.65 | sell 2026-07-02 19:07 1.33564 0.65 | SAME |
| 4 | sell 2026-07-07 14:45 1.33863 1.28 | sell 2026-07-07 14:45 1.33863 1.28 | SAME |
| 5 | buy 2026-07-07 15:35 1.33901 1.28 | buy 2026-07-07 15:35 1.33901 1.28 | SAME |

- T6 MT5 report: Files/MT5_GBP0629-B167.htm 36776 bytes → REPORT/MT5_GBP0629-B167.html SHA DD4FCED16ACCBECA6CD7998A8AF3507FD27A09E4B6CB774211222B1A5CEA6774; no xml; 9 GBPUSD/price hits incl 7/02 18:15 buy 1.33716.

## X records

- HANDOFF X1 / ledger 1313 ("^1313." = 1, tag = 1) / pointer B-167 MEASURED 24 lines, Lane BLIND-GBP0706 (first B-166, 2 of 6), terminal64 19848 ACCOUNTED; register +0.

(End of slice)
