# REPORT/LOGWRITER_B207 - who writes the 98 GB of terminal logs (read-only; no change made)

## R5 - program, volume, shape
- Writer: the terminal's MQL5 log receiver. Every line is an indicator Print from SRJ_FlowLogic (EURUSD/GBPUSD/USDJPY
  M5), SRJ_POI_Marker or SRJ_CQD_TickBased_MT5 - e.g. `SRJ_FlowLogic (USDJPY,M5) [SRJ-IND] B176HZ ...`. No tester
  journal lines (no Tester/Core prefixes); these are indicator-side prints, not EA/tester rows.
- Volume (streamed full pass, exact): 20261012 31,262,608,664 bytes / 113,855,744 lines; 20261013 51,526,756,482 bytes /
  184,860,448 lines; 20261014 30,676,735,200 bytes / 106,236,058 lines.
- Lines per minute (wall span head to tail): 20261012 ~148k (11:05:49 to 23:55:07); 20261013 ~129k (00:00:04 to
  23:55:01); 20261014 ~228k (00:00:00 to 07:46:07, batch day with 7 tester runs).
- Top 10 message sources by 1-in-10000 sample (program | head; counts per ~11-18k samples):
  - 20261012: FlowLogic-EURUSD B176HZ 1765, FlowLogic-GBPUSD B176HZ 1735, FlowLogic-USDJPY B176HZ 1656,
    GBPUSD B162ORIGIN 1095, USDJPY B162ORIGIN 1075, EURUSD B162ORIGIN 1035, GBPUSD B152PR 703, EURUSD B152PR 653,
    USDJPY B152PR 591, GBPUSD B179HZB 351.
  - 20261013: EURUSD B176HZ 3389, USDJPY B176HZ 2697, EURUSD B162ORIGIN 2130, EURUSD B152PR 1799,
    GBPUSD B176HZ 1792, USDJPY B162ORIGIN 1628, GBPUSD B162ORIGIN 1111, GBPUSD B152PR 1066, USDJPY B152PR 997,
    EURUSD B179HZB 728.
  - 20261014: EURUSD B152PR 2195, EURUSD B176HZ 1441, USDJPY B176HZ 1404, GBPUSD B176HZ 1237,
    EURUSD B162ORIGIN 859, USDJPY B162ORIGIN 797, GBPUSD B162ORIGIN 764, USDJPY B152PR 512, GBPUSD B152PR 483,
    USDJPY B179HZB 303.
- Live chart vs tester mirror: both. Steady per-bar prints across all three pairs (live charts) plus burst clusters
  at tester run windows (sample timestamps bunch at bulk walks, e.g. 11:05:49, 00:18:34). The program field cannot
  separate them; the burst timing can (batch windows 05:54-06:08 and 06:29-07:46 on 10-14).
- Growth engine (located by text): FlowLogic 1633/1657 (B152PR per-bar per-zone dumps + summary), 1661 (B162ORIGIN),
  plus B176HZ/B182MID/B178ZL prints - all unconditional PrintFormat, no input guard. The only debug inputs in the
  indicator are inHtfDebugLog=false and chart-label flags (FlowLogic 313/415/416) - print toggles for these rows:
  NOT FOUND. Stopping the growth means detaching the indicators from live charts (or a code change - forbidden here,
  none made).
