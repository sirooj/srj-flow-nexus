# HAND MANUAL REVIEW — SEP-8 LONGS (his words, filed verbatim in effect)

**Provenance:** operator pasted two MT5 screenshots + two findings in chat 2026-09-15 (Dukascopy-demo-mt5-1, EURUSD M5). Screenshots live in chat only (no disk save path); this file carries his words verbatim + builder's factual screen reads. His words rule; the reads below are corroboration only.

**Session-naming correction (standing, his GMT+7 note):** NEVER "morning/afternoon" (broker-clock dayparts — ambiguous; morning broker = midday his time). ALWAYS exchange sessions in HIS words: "London session" (S1 leg) and "NY AM session" (S2 leg). All builder relays/memos use these from here on.

## Finding 1 — London session (S1 leg, 09:15/09:20 → 10:10)

His words, verbatim:

> the EA is hallucinating, the 9:15 long or is a bearish closing candle that is not a valid confirmation candle for the bullish setup.

Screen read (Image 1, crosshair 2026.09.08 09:15, status bar 2026.09.08 10:40 O:1.16122 H:1.16125 L:1.16098 C:1.16124): price spiked then printed a large bearish candle at the crosshair, closing down. Panel at screenshot time: ORDERFLOW bull; AS.L-to-NA BULL Alert 3.0; 4H Bear; 1H Bull; 15m Bull. (Panel state is 10:40-after-the-fact; his finding is about the 09:15 bar CLOSE, which the candles corroborate.)

Builder reading for council (confirm-or-correct, NOT a redesign): confirmation must close in the setup direction — a bearish-close bar cannot confirm a bullish seed. The 09:15 LONG seed is invalid at inception. Candidate code counterpart already exists in the tree (`IsConfirmationCandle`, used at the LTF-confirm gates) — council maps rule-to-code, builder does not.

## Finding 2 — NY AM session (S2 leg, 16:45 → 17:00)

His words, verbatim:

> yes, the 15m bias is long but the 4H and 1H bias are short.

Screen read (Image 2, crosshair 2026.09.08 16:40, price ~1.16219): panel reads ORDERFLOW BEAR; 4H Bear; 1H Bear; 15m Bull; red tag "Bearish Bias 2xOB" at ~1.16218; CQD subwindow with red divergence rays. His words match the panel exactly (15m-long vs 4H+1H-short).

Builder reading for council (confirm-or-correct): HTF-bias-only means the HIGHER frames govern — 4H+1H short overrules 15m long. This answers the open object-identity question (which bias object): 4H/1H, not 15m. The resolver took the 15m read; it must take the higher-frame read.

## Standing consequences

- Both Sep-8 LONGs are rejected on HIS rules with HIS reasons (confirmation-close; HTF hierarchy). The fix implements these rules; it does not negotiate them.
- No band-aid (item 135): agreement-by-coincidence stays REPORT+HALT.
- These reasons ride into the converged fix packet verbatim (v60 relay carries §1+§2 above quoted).

(End — filed 2026-09-15, QUIESCENT, no build/run/commit)
