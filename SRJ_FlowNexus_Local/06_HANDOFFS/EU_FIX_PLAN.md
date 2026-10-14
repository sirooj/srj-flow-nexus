# EU_FIX_PLAN - EURUSD fix plan (his order 2026-10-14, B-207). Read this before any J2D-DEFECTS relay.

## 0. Goal and done line
- Euro only (his words 2026-10-14, B-207 B2). Pound and yen wait for his word.
- DONE when all three hold on one kept build:
  (a) RECON62 (EURUSD 26 Aug-9 Sep): A1-A7 taken as the register says (entry; exit per the register NOTE lines), every euro C row silent.
  (b) EU0525TD (25 May to date): his three never-takes stay silent (10 June 16:15 long 1.15551; 25 June 10:45 short 1.13540; 22 July 14:55 short 1.14048), and he passes every take on the review sheet.
  (c) The review sheet (srj-relay "Review sheet") has no NOT PRINTED on a field that decides a take: entry line + price + retest candle, 4H/1H/15m/5m, setup class + reason, zone + formation + in-play candle, in-bias OB/FVG state, opposite FVG, divergences + latched one, stop, target name + price, exit rule + line + candle.

## 1. Never (each one has cost relays before)
- No tolerance, buffer, pip margin or new number in any rule. No bar count, distance or size as a separator.
- Never change a trading rule without his banked words; quote skill line numbers for every rule a fix touches.
- Never ask him a code question. Questions reach him only as a chart call the planner checked against his record first.
- Never restore before the trial keep .B<n>K exists and its SHA verifies (B-201).
- Never grade from the day log twice; one Python cut per batch, then grade from the cut (B-170, B-191B).
- Never compare a trial with an old baseline after the tester history changed; run a same-day baseline (B-205, B-206).
- Never run a prior relay's ledger or record job (B-206).

## 2. Work fast (do these every time)
- Python 3.13.16 at C:/Users/winar/AppData/Local/Programs/Python/Python313/python.exe for every scan, cut and grade; one script per job; stream logs line by line.
- Locate code by text, never by line number. Line numbers below are where B-204 found them; re-find by the quoted text.
- A long euro run takes about 26 minutes; RECON62 about 4 minutes. Do offline grading while a run goes.
- Same-day baseline needed? Compare the tick history folder (file sizes and modified times) with the last kept baseline's record. Unchanged: grade the trial against the last kept cut. Changed: run the kept build first.
- Grade each fix on its own rows first (Part R), then the separator table (Part S, committed pack lines), then one trial (Part K), then runs (RECON62, then EU0525TD only when RECON62 passes).
- A fix is kept only if A1-A7 stay identical, no C row fires, and every changed take is named in trader words for his review.

## 3. Fix queue (in this order; each item is one lane, limit 6 relays)
F1 CONFIRM-KILL - his 2-of-3 freshness kill skipped at the confirmation candle.
- Shows on: 10 June NY long 16:15 1.15551. The machine itself counted 2 adverse (in-bias FVG dead + opposite FVG validated) at 16:00, 16:05 and 16:10, printed HOLD at the 16:10 confirmation, and fired.
- Look at: the freshness check (B-204: "CheckFreshness", EA ~2770-2780; the confirmation pass prints diagnostic only). Tags FRESHCOUNT, S5 HOLD, FIRE.
- His words: the freshness 2-of-3 section of the strategy skill; register C 4 Sep 10:40 ("in-bias FVG invalidated + OPP validated").
- Measure: the count on every pass, seed to entry, for A1-A7 and every euro take.
- Done when: 10 June is refused, A1-A7 identical.
F2 BLOCK-DEAD - his invalidated in-bias block still read alive.
- Shows on: 25 June London 10:00 bearish OB (and FVG 10:05-10:15) before the 10:45 short; 22 July NY 5m in-bias OB before the 14:55 short. The machine prints block-dead 0, so the count never reaches 2.
- Look at: where the block-dead flag is set (indicator or EA; locate by the flag name the FRESHCOUNT row prints). Compare with his OB invalidation words (strategy skill; spec 3.4).
- Measure: every candle from the block's formation to the entry, o/h/l/c, the first candle that meets his kill words, the machine's flag on each pass.
- Done when: 25 June and 22 July are refused, A1-A7 identical.
F3 IN-PLAY - a zone the stop leg never reached is accepted.
- Shows on: 4 June 10:05 long, 29 June 16:15 long, 15 July 10:35 long, 22 July 14:55 short, 28 July 10:45 short, 17 August 15:55 long, 22 September 19:00 short, 8 October 11:35 short (zone on the far side of the stop). None of A1-A7.
- Look at: the zone gate (B-204: B177HZ / HISZONE, EA ~10452-10480). It tests gap-touch at the retest candle OR in-play window at the confirmation candle - a presence test. It does not test standing (never reads the kill state) and never tests the zone side against the stop.
- His words: spec 3.5 (in play = a penetration of the XOB in the swing leg), B-91 pin ("retrace and in play are the same thing"), 4 June ("there is no retest of XOB in play"), 28 July ("i do not see valid XOB or FVG to be in play").
- Measure: for every take, the leg from the zone's promotion to the confirmation candle and whether any candle reached into the zone.
- Done when: the never-reached takes are refused, A1-A7 identical.
F4 DIV-READ - the machine's CQD divergence differs from his live chart.
- Shows on: 25 June (he reads hidden bullish as the latest at entry and a late bearish 10:20-10:50; the machine prints regular bearish 10:05, nothing bullish after 09:35, nothing bearish 10:20-10:50); 8 July (he reads hidden bullish 14:00-14:20; the machine prints hidden bearish through 14:25 and latches hidden bearish 14:40).
- Look at: the CQD indicator inputs the EA loads against his saved chart (Profiles/templates: D1 reset, tick source, swing settings); the latch walk (B-204: D130, EA ~10334-10343). "Late divergence" logic: NOT FOUND in B-204.
- His words: B-130 ("never stale, only renewed; the latest is the valid one"); P-CQDRESTORE (only swing-detection validity changed).
- Measure first that the machine's pane equals his pane on the same candles; a latch fix waits until the reads match.
F5 YEARLY-DEPTH - Yearly lines on the tester do not start 1 January.
- Shows on: B-206 R0: the walk starts 25 May and the Yearly line folds from 26 June off a checkpoint; his chart starts 1 January. Moves the A5 7 Sep target (1.16315 -> 1.16319) and holds the 1 Sep Yearly-POC break (A2 exit) hostage to history depth.
- Look at: the POI marker's Yearly slot start and checkpoint (SRJ_POI_Marker.mq5); the tick history holds EURUSD monthly files back to 2023-09 (B-206 inventory).
- Measure: whether the Yearly fold can start at 1 January from that history, and the Yearly POC/VWAP it gives on 1 Sep and 7 Sep.
F6 LINE-REACH - the entry line not touched by the retest candle.
- Shows on: 15 July 10:35 long (Quarterly-VWAP 72 points away from the 09:55 candle), 22 Sep 19:00 short (255 points). Marginal: 1 Sep (A2) and 8 Sep NY (A7) at the machine's candle.
- Grade at HIS retest candle first (A2: his 17:30 retest + confirmation, register row 2). No gate until A2 and A7 pass at his candles.
F7 REGIME - trend following with too few HTF votes.
- Shows on: takes fired TREND with seed votes 0 or 1 (B-204 D5). A2 (1 Sep) is among them and its class is his to rule (register NOTE B-121): measure only, never gate before his word.
F8 18-JUNE - FOMC VWAP line kill at 09:40 drops the 09:45 long. Waits on his chart call (planner carries it).
F9 REPORT-COMPLETE - print-only additions, deals identical: target name in TP_ELECT, zone formation candle, sweep source, the exit rows missing from 9 takes (B-204 R3). Any time a fix relay has spare room.

## 4. Where to look (symptom -> first rows)
- Fired although his never-take: FIRE, then FRESHCOUNT on each pass, then B177HZ, then CONFIRMPOLL.
- Refused although his take: A6REFUSED + B182DEC reason, then B201TO rule, then the seed's BORN/ALIVE rows.
- Wrong target: TP_ELECT (price, R, winner), then the line values at the entry candle.
- Wrong exit: MTEXIT (rule), EXITCENSUS (break verdict), the candle o/h/l/c (B196BAR).
- Wrong divergence: B196DIV / D130 latch / CQDRECHECK across the setup window.
- Wrong zone: ZONEPICK / XOBPROMO / INPLAYCOMMIT / B162ORIGIN / B182MID / B178ZL.
