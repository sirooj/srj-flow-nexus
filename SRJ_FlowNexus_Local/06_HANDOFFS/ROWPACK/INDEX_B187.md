# ROWPACK INDEX B-187 - pack lines per register row (day files, GBP0629-B187, EA 67021D84)
# Other register rows unchanged from INDEX_B182 (EU/June untouched, no runs owed).
F3 [GU 10 Jul NY SHORT Yearly-POC, his 14:55] | seed ROWPACK/GBP0629-B187/2026-07-10.csv:1525 (ANCHOR_ELECT SEED bar 14:10) | conf SHADOW ONLY (14:20 pack 171 bar=14:15 + 15:20 pack 214 bar=15:15; live never: zero B60C rows) | latch NONE (no D130LATCH row at decision; B182DEC div=2 hidden dbar=15:30 pack 2112) | entry NONE (ABORT FRESH_OPP_FVG 15:55 S4 pack 2110)
F2 [GU 7 Jul NY SHORT] | machine Daily-POC take, not his Weekly-POC line | conf n/a (his candle NOT GIVEN) | entry DEAL #2 sell 14:45 1.33863 (day pack) | exit MTEXIT 16:50 TP_TOUCH 1.33747 + DEAL #3 buy 16:54:59
T0707 [GU 7 Jul SHORT change detector] | conf per INDEX_B182 | entry identical (deals #2/#3 same side/date/time/price) | exit same
T0702 [GU 2 Jul LONG must-never] | no LONG A-only poll fires into entry (SHORT A-only zone-stopped); entry NONE, same as B-182
