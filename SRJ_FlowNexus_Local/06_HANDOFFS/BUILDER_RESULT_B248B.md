GRADE EU0525TD-B241D: KEEP entries exact 13/15; KEEP exits exact 12/15; NEVER fires 4; MACHINE-ONLY ungraded 0; trades 17
# BUILDER RESULT B-248B - MEASURED (banking): 10 June valid, swing-confirm timing
Trader summary: Your 10 June long is banked valid, with the setup class left open since you did not restate it. Your 19 June long is not late: the 15:35 low only becomes a swing when the 15:40 candle closes, so your 15:45 open stands and your 15:25 rejection stands on the equal 1.14638 low. The machine still enters at 15:50, one candle after your 15:45. The machine reads divergence lines from the CQD indicator; it does not decide swings itself, and nothing in it waits for the next candle to close.
## Relay order (B-248B addendum; MEASURED)
- Part B banked rules/55 verbatim (counts 0) + rules/54 correction line + index + register NOTE (all landed in B-248; verified ALREADY on this branch, nothing re-appended).
- Part G: truth K19JUN already 15:45/1.14644 (verified); K10JUN appended (18:55/1.15490 + machine exit 01:01/1.15331 marked); kept EU re-graded 13/15-12/15-4 (K19JUN + K10JUN MISSING).
- Part R (EU-B247B cut): SWING19JUN_B248B.csv (B196BAR 15:15-15:55 table; EA stores 15:35 low from the 15:40 bar but latches div at 15:45); R2: swing validity decided in the CQD indicator (EA UpdateDivergenceLatch EA:7024 reads published verdicts; no next-close wait NOT FOUND); R3: HTF10JUN carried as VALID class OPEN.
- Part X/F: EU_FIX_PLAN F4a/F4b amended (landed in B-248); batch closes 10 Jun VALID/OPEN + 19 Jun banked; pointer State B-248B (this branch); ledger 1397; LESSONS B248B line (folded B-78 first).
## Final disk state
- No source touched by this addendum (banking + reading only). Kept build on disk per B-248 T4 restore.
## Carried note
- (a) The EA reads the CQD indicator's lines (it does not work out divergence itself). (b) No step in the EA waits for the next candle to close before counting a swing (NOT FOUND); the 15:45 latch vs 15:40-confirm gap is one bar, split between CQD publish timing (not exported) and settled reads.
- Next: planner decides (F4a confirm-at-next-close measure; F4b swing-equality in CQD).
