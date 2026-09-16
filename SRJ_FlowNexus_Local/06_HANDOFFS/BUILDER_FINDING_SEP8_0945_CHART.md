# FINDING — his Sep-8 09:45 chart evidence (verbatim + verification, 2026-09-16)

## 1. His words, verbatim (screenshot + message)

"The EA timing is broken. Does it even properly communicate or see what the indicators are signaling? I have marked the 9:45 candle with that black dashed vertical line, the 5m bias is bearish, the CQD latest Divergence is bearish, the candle before that is also a bullish candle that could not be the confirmation candle. Another clue would be the dukascopy candle timestamp, idk why but that candle supposed to sat 9:45 but it says 9:49 which is not possible on the 5m chart."

## 2. Panel readout (what the image shows, verifiable)

Chart: Dukascopy-demo-mt5-1, EURUSD M5, 8 Sep 2026 (his live demo terminal, not the tester). Indicator panel top-left: ORDERFLOW BEAR (Alert 3.0); 4H Bear; 1H Bear; 15m Bear; OB/FVG marks mixed. Bottom CQD panel: red/green divergence lines. Black dashed vertical near 09:45. Crosshair tooltip "2026.09.08 09:49". Status bar: 10:00 bar O:1.16210 H:1.16229 L:1.16198 C:1.16223.

## 3. Builder verification (disk, current tree + RECON38 archive)

(a) BIAS SEEN CORRECTLY: `SIDE1T_SEEDBIAS bar=2026.09.08 09:45 dir=LONG biasAligned=0 verdict=REJECT-BIAS-TIMING` — the robot read non-LONG bias at the 09:45 seed bar, consistent with his bearish panel. No blindness on bias. (b) SEED-DESPITE-BIAS IS PIPELINE ORDER, not blindness: seed fires first (DetectPoiRetest → S2ResolveLive, EA:7617), the bias gate runs AFTER at ST_S2_LTF_ALIGN (EA:7810; unaligned → S2WAIT retain, never a kill). The robot can seed LONG into a bearish bias by design — whether it SHOULD is council mechanism judgment, never a communication defect. (c) CONFIRMATION at seed: `CONFIRMPOLL bar=2026.09.08 09:45 anchor=Monthly-POC dir=LONG confirm=0` — no confirmation at the seed bar, consistent with his "could not be the confirmation candle" (his reason why is NOT expanded — carried open, never invented). (d) CQD at S5 bars reads EMPTY in-tester (UNREAD ×14, closed-as-absent) — the one genuine non-seeing; his live panel shows bearish divergence the tester never had. Tester-vs-live CQD gap noted, not solvable from this seat. (e) 09:49 EXPLAINED, not a defect: 09:49 is the crosshair CURSOR interpolation between the 09:45 and 09:50 bars (MT5 cursor time, not a bar timestamp); the status bar correctly shows the 10:00 bar. No 5-minute-chart violation, no timing defect there.

## 4. Consequence (builder measures, council + him route)

His evidence extends LONG-invalidity to the 09:45 seed (bias bearish + CQD bearish + no LONG confirmation) — the transfer leg's ACTUAL source (09:50 PREEMPT descends from 09:45, not 09:15). BOTH morning source seeds are now chart-invalid per him. The T-horn's inheritance question sharpens past "09:15 poisons?" to "the live source itself was invalid — does anything survive?". What his evidence does NOT state (still owed, asked priority in the turn report): whether invalidity propagates through the transfer (poison) or the switch starts clean. His screenshot is validity evidence, not an inheritance ruling — never conflated.
