# DEFECTS_J2D_B204 - defect classes measured on rows across all 38 takes (trader words: dates, times, prices)

Source rows: EU0525TD-B202, GU0525TD-B202, UJ0525TD-B202 day cuts on disk (EA 7c392767); day-log 20261013.log for the freshness counts. His words 2026-10-14 (strategy skill lines 328-349). Verdict: MEASURED.

## D1 - in-bias block/FVG invalidated before entry, or opposite FVG validated
- The EA gate that should refuse: the 2-of-3 freshness kill (in-bias block dead + in-bias FVG dead + opposite FVG validated; 2 or more adverse kills the setup). It runs pre-confirmation only; at the confirmation pass it prints diagnostic-only and never kills (EA 2770-2780, built by operator packet).
- 10 June New York long 16:15 at 1.15551: CONFIRMED on rows. The machine's own freshness count shows in-bias FVG dead + opposite FVG validated (2 adverse) at 16:00, 16:05 and 16:10, then HOLD diagnostic-only at the 16:10 confirmation, then the order fired. His invalidation claim and the machine's counts agree; the gate let it through at the confirmation pass. Register: INVALID, must-never.
- 25 June London short 10:45 at 1.13540: the machine's counts show only the FVG dead (1 adverse, HOLD) at 10:35/10:40 and at confirmation. His invalidated 10:00 bearish block reads alive on the machine (block-dead 0). So the kill never saw 2 terms on rows: chart-vs-machine split on the block state. Register: INVALID on his words, must-never.
- 22 July New York short 14:55 at 1.14048: same shape - machine shows FVG dead only (1 adverse, HOLD) at 14:50 pre and confirmation; his invalidated 5-minute block reads alive on the machine. Register: INVALID on his words, must-never.
- Other 35 takes: no freshness kill fired on any fired seed's path on rows. No register A, B or F row is refused by this class on rows in hand.
- Buildability: yes, EA-readable at runtime (the three validity flags are indicator buffers the EA already reads every pass).

## D2 - latched divergence not the latest at entry (his B-130 words: never stale, only renewed; the latest is the valid one)
- 25 June: machine latched regular-bearish 10:05. Full 09:30-11:00 window on rows: no bullish divergence printed after 09:35; no bearish printed 10:20-10:50 either. His hidden-bullish latest and his 10:20-10:50 late bearish divergence are not on the machine's rows. Latched = latest with-trade on rows.
- 8 July: machine latched hidden-bearish 14:40. Full 13:45-14:50 window on rows: hidden-bearish through 14:25, bullish +2 at the 14:30 pass, bullish +1 at the 14:45 pass, bearish -2 at the 14:50 pass (bar 14:40, latest overall and latest with-trade). His hidden-bullish 14:00-14:20 is the opposite side and kind from the machine's hidden-bearish same window: machine-vs-chart read split, not a latch-order defect.
- The "late" divergence logic: NOT FOUND by text in the EA, the flow indicator or the CQD indicator. What exists: the divergence walk scans later shifts for an opposing verdict and prints it (opposing seen 09:35 on 25 June, 14:35 on 8 July - both older than the latch, never late). It fired no late row in either window.
- Other 36 takes: latched = latest with-trade print in each window on rows. No register A, B or F row is refused by this class.
- Buildability: yes (the EA reads the CQD verdict buffer at runtime; the latch is its own walk).

## D3 - zone on the far side of the stop from the entry (side test, no distance)
- Hits 11 of 38 on rows: 4 June long (zone under the 1.16069 stop), 29 June long (under 1.13995), 15 July long (under 1.14190), 22 July short (above 1.14075), 28 July short (above 1.13728), 17 August long (under 1.15835), 22 September short (above 1.14440), 8 October short (above 1.12039), 21 July pound long (under 1.34413), 12 August pound long (under 1.35042), 15 June yen long (under 160.044). His 5-of-9 planner count (4/29 June, 15/22/28 July) confirmed; 6 more outside his nine.
- The zone gate (B177HZ, HISZONE): passed on all 38 takes. It tests gap-touch at the retest candle OR in-play window at the confirmation candle - a presence test. It does not test standing (never reads the kill state) and never tests the zone side against the stop.
- Register rows hit: NONE. Every A, B, F and C row sits between entry and stop or straddles the stop on rows (5 June yen long corrected: zone 159.881-159.916 sits above the 159.598 stop, between entry and stop).
- Buildability: yes (zone range and stop are both EA-side values at the confirmation pass).

## D4 - entry line not reached by the retest candle (line price vs retest candle range)
- His named takes REACHED on rows: 4 June Daily-POC 1.16089 vs 09:55 range (11pts through); 29 June Weekly-POC 1.14031 vs 16:10 range (2pts through, marginal).
- Hits 8 other takes on rows: 15 July Quarterly-VWAP 1.14207 vs 09:55 range (72pts above it); 1 September Monthly-VWAP 1.16007 vs 16:50 high (1pt short, marginal); 8 September New York Monthly-POC 1.16229 vs 16:45 high (4pts short); 22 September Quarterly-POC 1.14334 vs 14:30 range (255pts under it); 10 June pound Weekly-POC 1.33849 vs 17:35 range (185pts above it); 12 August pound Weekly-POC 1.35067 vs 09:05 high (13pts short); 25 August pound Monthly-POC 1.36432 vs 16:00 high (61pts short); 23 June yen Weekly-POC 161.563 vs 15:55 high (1pt short, marginal). The other 28 takes all reached (several marginal: 28 August 1pt, 7 September 09:20 2pts, 17 August 2pts, 7 July pound 2pts, 3 June yen 2pts, 8 October 3pts, 4 September pound 4pts).
- MARKED: this class would refuse register rows A2 (1 September, marginal 1pt) and A7 (8 September New York, 4pts).
- Buildability: yes (line price and candle range are both on the rows at runtime).

## D5 - setup class: every take trend following with sweep NOTREACHED
- All 38 fired trend following with no fresh sweep counted. Regime votes at the seed: mostly 2-3 with trend-ok; early-seed votes=1 trend-not-ok on 10 June euro (until 15:45), 17 August (until 15:45), 10 June pound (until 16:45), 12 August pound (until 10:05), 5 June yen (until 15:45); votes=0 trend-not-ok with no later row printed on 1 September euro and 23 June yen.
- A mean-reversal verdict IS printed on one take's window: 25 August pound short prints sweep-tag 3 and mean-reversal-ok at 14:00-15:50 (trend-not-ok there), yet fires trend following at 17:05. Only MR verdict in all 38 windows.
- His 15 July question answered: mean reversal never printed anywhere near it (sweep-tag 0, MR-ok 0, count static); the machine's trend-following call matches his mean-reversal-not-valid.
- No register A, B or F row is refused by this class. Buildability: yes (votes already print every seed).

## D6 - FOMC anchor: single latest-only anchor today; multi-anchor ordered
- Located: FOMC anchor input InpFomcTimesServer = "2026.07.29 21:00" server time (POI marker indicator, input group "FOMC anchor (slot 5)"). One entry. The EA passes only 3 positional inputs, so the default stands on all three long runs; no run file overrides it (0 hits in the run inputs).
- How it works today: the anchor is fixed once per run (latest decision day at or before now); bars before it print no FOMC lines at all. Proven on rows: zero FOMC prints on 18 June in any cut; first FOMC prints appear 30 July. The per-bar "newest at or before now" selector exists in code but is never called.
- 18 June effect: his owed early exit on the FOMC POC at the 09:55 close / 10:00 open had no FOMC line on the run (only Daily/Weekly/Monthly lines print 09:50-10:05). The 17 June decision has no anchor; the run's only anchor is 29 July.
- Federal Reserve 2026 decision days: 28 Jan, 18 Mar, 29 Apr, 17 Jun, 29 Jul, 16 Sep (27-28 Oct ahead).
- Buildability: yes, indicator-side. The input already parses lists; what the order needs is per-bar selection (each bar uses the newest decision day at or before it, at the existing 21:00 server anchor time - read from source, never set here). The EA keeps reading line values as today. Next relay B-205 trials it if the trial keeps every deal identical except the FOMC-anchored windows.
- No register A, B or F row is refused by this class on rows in hand.

## Verdict: MEASURED
