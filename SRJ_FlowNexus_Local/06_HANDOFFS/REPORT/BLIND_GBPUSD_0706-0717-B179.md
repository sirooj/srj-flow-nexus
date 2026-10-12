# GBPUSD blind test 6-17 July - machine trades for his own check (B-179 kept trial)

MT5 is open on the finished pound test right now. To see the trades: open the Strategy Tester, go to the Backtest tab, right-click the finished GBPUSD run and choose Open Chart. MT5's own tester report is saved at SRJ_FlowNexus_Local/06_HANDOFFS/REPORT/MT5_GBP0629-B179.html. The full per-setup fields (entry zone with kill state, setup class, 4H/1H/15m biases, sweep source, CQD type) are in SRJ_FlowNexus_Local/06_HANDOFFS/REPORT/SETUPS_GBP0629-B179.csv, one row per setup, never simplified.

## Machine deals (2)
- 7 July New York SHORT: entry at the 14:45 candle open, 1.33863; exit at the 16:54:59 candle, 1.33747.
- 2 July New York LONG: no trade. The 18:10 confirmation candle refused it: none of the long zones the 17:20 to 17:35 candles came back into was still standing at 18:10 (two dead on the 17:25 candle, two dead on the 17:40 candle, your 16:20 zone among them), and the opposing candle touched no gap.

## Machine refusals (no alert)
- 2 July 18:10 long (above).
- 8 July 15:30 short: no standing short zone and no gap touch at that candle.

Nothing else fired on the 6-17 July window. Your journal stays private; send only your own comparison in your words when ready.
