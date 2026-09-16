# FINDING — SEP-8 + SEP-4 MANUAL REVIEW (his words + screenshots, 2026-09-16)

## His Sep-8 words (verbatim from chat, filed as received)

> "here is the screenshot live at that time. The setups that i were consider was 16:25 open candle long cause no XOB and invalid CQD divergence. Second was the 16:45 short which was invalid RR cause the SL was two swings away at 9:05 high at 1.16359 and eventually the valid 17:00 short. If the EA consider 16:30 short, the 5m structure bias has only fliped the bias short at 16:35 candle open."

## His Sep-4 words (verbatim from chat, filed as received)

> "First, my considered trade short setup was 10:25 open candle entry which as invalid CQD divergence. There was a valid type 2 bearish CQD divergence from 10:10 to 10:30 which would validate the 10:35 setup you mentioned BUT the setup was invalidated because the invalidated in bias imbalance invalidation and the validation of the OPP FVG. No, I want the EA alert to be as strict as it would execute it. so i do not want a false alert even though the setup is only violating or does not pass one single rule. In other words, i only consider A+ setup."

## Chart reads (builder, from his two screenshots)

- Sep-8 panel at the time: ORDERFLOW BEAR; LD.L-to-NA BULL; 4H Bear; 1H Bear; 15m Bull; red label "Bearish Bias 2xOB". CQD sub-panel with bearish-divergence lines into the 16:5x area.
- Sep-4 panel: NY.H-to-NA BEAR; 4H Bear; 1H Bull; 15m Bear. CQD sub-panel with type-2 bearish divergence drawn 10:10→10:30, price axis 11:25/O1.16203/H1.16230/L1.16203/C1.16230 at cursor.

## Operational consequences (builder, no invention)

- Q-A ANSWERED: S2 (Sep-8 16:30 SHORT) stays DOWN. Reason (his): the 5m structure bias flipped short only at the 16:35 candle open — the EA's 16:30 seed predates the flip. Mechanism owed to council: consideration gated on bias-already-flipped (new rule detail; never on record before).
- His Sep-8 consideration set: 16:25 LONG (invalid: no XOB + invalid CQD) + 16:45 SHORT (invalid RR: SL two swings away at 1.16359 = 09:05 high) + 17:00 SHORT (valid). The EA's 16:30/16:40 SHORT is none of the three.
- Q-B ANSWERED: HOLD — no R2 surfacing, no interim alerts. His A+ rule (STANDING from this turn): an alert must be as strict as an execution; a single-rule violation = no alert.
- R2's decline reasons (his, two, both new): (1) his considered entry was the 10:25 open candle (NOT the EA's 10:35 row — bar-mapping nuance filed), invalid CQD; the 10:10→10:30 type-2 bearish divergence would have validated 10:35 BUT (2a) in-bias imbalance invalidation + (2b) OPP-FVG validation killed it. Council maps (2a)/(2b) to repo mechanics; never re-asked.
- Untouched: v92 paste + verdicts still owed; the cleared inventory shadow (print-only) is unaffected by the A+ rule (it changes nothing).
