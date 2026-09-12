# BUILDER_DECISION_MEMO_NEWS-RULINGS — operator answers, council §4.4 (2026-09-12)

Source: operator chat answers, recorded verbatim in intent.

1. In-blackout confirmation: WAIT / rollback (council recommendation confirmed).
   Setup stays alive across the blackout; fresh confirmation after may fire.
   Terminology fix: "blackout" = news entry/exit freeze, NOT a volatility
   regime; SL logic untouched by it.
2. FOMC scope: RATE DECISION ONLY — same anchor the operator uses for the
   FOMC VWAP/POC. Statement, press talk, minutes: no blackout.
3. Start anchor: the candle BEFORE the news candle (spread already widened
   in the holding candle). So blackout opens at open(C-1). End per original
   rule "one candle after": close(C+1). Full window [open(C-1), close(C+1)],
   M5 = 15 min. Council encodes exact bar math.
4. Weekly close: pinned Friday + fixed ET time (operator agreed). Flat may
   run up to 60 MIN early — accepted cost for gap/spread safety. Ideal
   (no spread/gap) would hold to close; safety wins. Daily flat stays
   5 min before close (earlier ruling, unchanged).
5. Blackout suppresses FIRING only, not state: S1–S4 keep evolving on live
   bars; the news candle's data still counts — a bias flip (or any normal
   invalidation) kills the setup as usual. Only the S5 fire is gated.
6. TIMEFLAT takes the exit in-book: managed record closed, MTEXIT counted,
   plus alert — same standing as TP/SL verdicts today. ALERT-ONLY (no
   broker orders) unchanged.

Downstream: exit side first (fifth verdict, moves MTEXIT only), entry side
second (S5-gate guard, moves signals), both after P-SL-IMBALANCE. Static
pinned event table (operator-reviewed, own digest) remains the recommended
backtest input; live calendar optional cross-check only.
