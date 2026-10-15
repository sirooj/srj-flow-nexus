# EU_FIX_PLAN - EURUSD fix plan (his order 2026-10-14, B-207). Read this before any J2D-DEFECTS relay.

## 0. Goal and done line
- Euro only (his words 2026-10-14, B-207 B2). Pound and yen wait for his word.
- DONE when all three hold on one kept build:
  (a) RECON62 (EURUSD 26 Aug-9 Sep): A1-A4, A6, A7 taken as the register says (entry; exit per the register NOTE lines) and A5 (7 Sep NY long) silent by his words 2026-10-15 (B-235), every euro C row silent.
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
- Never order a long euro run before RECON62 has passed his A rows on the same build (his words 2026-10-15).

## 2. Work fast (do these every time)
- Python 3.13.16 at C:/Users/winar/AppData/Local/Programs/Python/Python313/python.exe for every scan, cut and grade; one script per job; stream logs line by line.
- Locate code by text, never by line number. Line numbers below are where B-204 found them; re-find by the quoted text.
- A long euro run takes about 26 minutes; RECON62 about 4 minutes. Do offline grading while a run goes.
- Same-day baseline needed? Compare the tick history folder (file sizes and modified times) with the last kept baseline's record. Unchanged: grade the trial against the last kept cut. Changed: run the kept build first.
- Grade each fix with the grader on whole runs: at most 2 readings, then one always-restored diagnostic trial (RECON62, then EU0525TD only when RECON62 passes); a Part S table only before the kept trial (PK-4).
- A fix is kept only if the grader shows no KEEP row worse and no new NEVER fire on both runs and one scoreboard number better; every changed take goes into his review batch.

## 3. Fix queue (PK-4 order: F5 first, then F3, F1/F2, F0, F4, F6, F7, F9; each lane gets 2 readings then a diagnostic trial). F5 goes first: the long euro run prints no Yearly line at all, which drops the 4 Sep New York long, moves the 1 Sep and 7 Sep New York exits and the 8 Sep New York target (B-225 R4, B-226 R3); it needs no new ruling (his chart starts 1 January).
F0 OBJECTS - the machine's in-bias OB and FVG are not his. 28 Aug: his zone is the 06:30-06:40 FVG (register A1 NOTE B-175); the machine never printed a gap there (B-183 R2) and counts its own OB and FVG dead at confirmation (B-207 R3). 141 euro days: zero OB invalidation events (B-207 R2). F1 (confirmation kill) and F2 (block dead) wait on F0: fix detection and the kill first, then re-grade the 2-of-3 count. Parked B-211 (J2D-DEFECTS 6/6); count definition carried into F1 by his rules/46 words.
F1 CONFIRM-KILL (after F0) - his 2-of-3 freshness kill skipped at the confirmation candle.
- Shows on: 10 June NY long 16:15 1.15551. The machine itself counted 2 adverse (in-bias FVG dead + opposite FVG validated) at 16:00, 16:05 and 16:10, printed HOLD at the 16:10 confirmation, and fired.
- Look at: the freshness check (B-204: "CheckFreshness", EA ~2770-2780; the confirmation pass prints diagnostic only). Tags FRESHCOUNT, S5 HOLD, FIRE.
- His words: the freshness 2-of-3 section of the strategy skill; register C 4 Sep 10:40 ("in-bias FVG invalidated + OPP validated").
- Measure: the count on every pass, seed to entry, for A1-A7 and every euro take.
- Done when: 10 June is refused, A1-A7 identical.
- State B-214 (K0 STOP MEASURED, no trial): 10 June counts 2 at S3 15:55-16:10 (ABORT pre, PRE_BINDING skip, B200POT ALIVE) but state never leaves S3, jumps S3->S5 16:15 -> B182DEC FIRE; shared step after 16:10 close, so H3 refused as spec-forbidden; ren unexported.
- State B-215 (trial H1+H2+H3 at S3 pre, RESTORED): H3 S3 kills 10Jun 15:05/15:20/15:55 + 22Jul 14:50 (B215F1 adv2) + 17Aug other 15:35/15:50; 25Jun no B215F1 (H1 first-close kill missing, ob alive adv1); A1-A7 identical, C silent.
- State B-216 (complete H1 H1b+H1c, RESTORED): H1b B216H1 10:05 id5747 fires (698 EU rows) but S3 10:35 first paint fvg alive adv1, no B215F1 25Jun; H3 kills 10Jun/22Jul/17Aug at S3 (B215F1); A identical, C silent; 25Jun needs fvg second-paint road.
- State B-217 (K0 R-OTHER, no trial, park F1): 25Jun S4 passes (H3 S3-only misses) + code6 revival despite export ren0 (H1c KeepDead false at write ren1/timing) + S3 10:30 first-paint fvg alive (H3 needs second-paint); no B215F1 25Jun; B216H1 10:05 fires; H4 none from list fixes all three (R-STATE H4 adv1 no kill; R-STALE/MASK false); F1 parks.
F2 BLOCK-DEAD (after F0) - his invalidated in-bias block still read alive.
- Shows on: 25 June London 10:00 bearish OB 1.13524-1.13587 lvl 1.13556 (10:05 close 1.13574 beyond, activation-skipped) + FVG 10:05-10:15 before the 10:45 short 1.13540; 22 July NY 13:45 bearish OB 1.14046-1.14061 lvl 1.14054 (14:35 close 1.14064 dead, 14:50 repaint alive ren0, EA reads alive) before the 14:55 short 1.14048. The machine prints block-dead 0, so the count never reaches 2.
- Look at: where the block-dead flag is set (indicator or EA; locate by the flag name the FRESHCOUNT row prints). Compare with his OB invalidation words (strategy skill; spec 3.4).
- Measure: every candle from the block's formation to the entry, o/h/l/c, the first candle that meets his kill words, the machine's flag on each pass.
- Done when: 25 June and 22 July are refused, A1-A7 identical.
- State B-214 (K0 STOP, H1/H2 not applied): 25 June 10:05 kill + 22 July 14:35 kill + repaint ren0 stand per B-213 S10b (SEPARATES on rows); H1 dead-until-renewed + H2 fvgExists export await pre-confirmation road or ruling (ren unexported).
- State B-215 (RESTORED): H1 persist blocks 22Jul 9080 revival (code4 kept-dead, ren0) -> 22Jul silent; H2 clears A1 false FVG (fvgEx0 -> alive) -> A1 kept; H1 first-close kill missing -> 25Jun still fires (ob alive); 25Jun kill remains the row.
- State B-216 (RESTORED): H1b first-close kill fires (code10 10:05 5747) + H1c blocks codes 2/4/5/6/7 revival unless ren (22Jul persist works, 22Jul silent); H2 keeps A1 (fvgEx0 alive); 25Jun S3 first paint fvg alive -> adv1 -> H3 no kill -> 25Jun still fires; fvg second-paint road remains (S3 second paint fvg dead adv2).
- State B-217 (park): H1b/H1c persist + H2 + H3 stand per B-215/B-216 (10Jun/22Jul silent, A kept); 25Jun fvg second-paint + S4 + revival roads remain open (no trial); F1 PARKED 6 of 6.
F3 IN-PLAY - a zone the stop leg never reached is accepted.
- Shows on: 4 June 10:05 long, 29 June 16:15 long, 15 July 10:35 long, 22 July 14:55 short, 28 July 10:45 short (removed B-223, 5m flip at 10:10), 17 August 15:55 long, 22 September 19:00 short, 8 October 11:35 short (zone on the far side of the stop). None of A1-A7.
- Shows on (B-232 re-scope with today's truth: 4 Jun NEVER N4JUN1005 and 15 Jul NEVER N15JUL1035 banked with his zone reasons): no machine-only take is left to refuse (29 Jun + 8 Oct his VALID; 22 Sep + 17 Aug + 4 Jun + 15 Jul his INVALID with reasons; 22 Jul his must-never; 28 Jul removed B-223). F3 lane holds no remaining refuse set.
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
- Shows on (B-225 R4): A5 short-run exit 17:13 1.16319 vs owed TP 1.16315 (YEARLY-DEPTH, F5 target move; MTEXIT TP 17:10 1.16318 JL 9682416; euro-run stopped 21:25 1.16239, target 1.16358 unreached, no Yearly rows on EU run).
- Shows on (B-226 R3/R4): 4 Sep NY long not taken on EU0525TD (B218K, B222K, B206T: no 16:00 deal; 16:00 Monthly-POC candidate ABORT TP_RR_FAIL JL 12138603; no Yearly line printed 14:00-17:00); 1 Sep long exits at the stop 17:51 1.15975 instead of the 17:45 Yearly-POC break; 7 Sep NY long target 1.16358 on the long run vs 1.16318 on RECON62, stopped 21:25 1.16239; 8 Sep NY target 1.16077 vs 1.16114 (EXITS_B225).
- Look at: the POI marker's Yearly slot start and checkpoint (SRJ_POI_Marker.mq5); the tick history holds EURUSD monthly files back to 2023-09 (B-206 inventory).
- Measure: whether the Yearly fold can start at 1 January from that history, and the Yearly POC/VWAP it gives on 1 Sep and 7 Sep.
- State B-230 (KEPT): tester-only seam gate installed (POI d47a0e68/04fcd8a5); long run uses the short run's Yearly lines; A3 taken, A2/A5 exits match RECON62; 4 Sep London 09:30 (his never-take) removed. Residue: A5 1.16319 vs his 1.16315 and the 1 January fold start, open, no lane.
F6 LINE-REACH - the entry line not touched by the retest candle.
- Shows on: 15 July 10:35 long (Quarterly-VWAP 72 points away from the 09:55 candle), 22 Sep 19:00 short (255 points). Marginal: 1 Sep (A2) and 8 Sep NY (A7) at the machine's candle.
- Grade at HIS retest candle first (A2: his 17:30 retest + confirmation, register row 2). No gate until A2 and A7 pass at his candles.
F7 REGIME - trend following with too few HTF votes.
- Shows on: takes fired TREND with seed votes 0 or 1 (B-204 D5). A2 (1 Sep) is among them and its class is his to rule (register NOTE B-121): measure only, never gate before his word.
F8 18-JUNE - FOMC VWAP line kill at 09:40 drops the 09:45 long. Waits on his chart call (planner carries it).
- State B-218: R3 KILL-HIS-RULE (09:35 o1.15275 c1.15224 through 1.15233 before 09:45 confirm), R4 SUPPRESSION-ENDS-AT-KILL (Daily-POC held for alive FOMC-VWAP to 10:00 END), R8 D3 HIS-EYES chart call (rows in BUILDER_SLICE_B218.md).
- State B-219: R1 HOLDER-DEAD-STILL-SUPPRESSES (09:40 order SUPPRESSED/ALIVE/ADD/KILL; 1317/1922 name killed FOMC-VWAP; ALIVE rows L6 defect), S E2 (A5/C27/C28 touched, R6 NO); B-218 chart call withheld (rows in BUILDER_SLICE_B219.md).
- State B-220: G2 NARROW-NEXT RESTORED (18Jun FIRES 09:45 1.15256 exit 10:00 1.15195 SAME; A2 1Sep GONE on EU via reset-wiped rt/latch, 28Jul likewise; C silent; rows in BUILDER_SLICE_B220.md).
- State B-221: MEASURED no trial (R1 104 CLOSE / 407 ABSENT of 511; S V1 fails A5/10Jun/28Jul/22Sep/8Oct, V2 fails 13 kept; R3 kill record FOUND moot; rows in BUILDER_SLICE_B221.md).
- State B-222: RESTORED V1 trial b4db21c5/61829f05 (RECON 16/16 SAME; EU 44 deals: NEW 18Jun pair only, GONE 28Jul flip-death 10:10 LTF_MISALIGN; A1-A7 identical incl A2/A5; 7Sep short no FIRE/entry; rows in BUILDER_SLICE_B222.md).
- State B-223: DONE KEPT (18 Jun fires; 28 Jul removed by his 5m flip rule).
- State B-224 (MEASURED): T-REACH on kept rows; HIS-KEEP 10/13 PASS; F3-NAMED 6/6 FAIL beyond-stop; next trials the gate.
- State B-225 (MEASURED): one zone per take; A2 split (17:25 promo both, 17:30 pick short-run only); his 28Aug gap printed never picked; stop-side NO RULING; exits censused; DOES NOT SEPARATE reach+standing, no trial.
- State B-226 (MEASURED): current-leg test; A1/P3/A3/A7 legs ended (A7 CONFLICTS his B-143 words); A2-EU pick defect owned by XOBPROMO; A3 EU ABSENT (F5); 22Sep passes T-LEG; DOES NOT SEPARATE, no trial.
F9 REPORT-COMPLETE - print-only additions, deals identical: target name in TP_ELECT, zone formation candle, sweep source, the exit rows missing from 9 takes (B-204 R3). Any time a fix relay has spare room.
- B-225 gaps: A6 8 Sep London retest + HTF NOT PRINTED (no BORN row); A2 1 Sep 17:30 line value NOT PRINTED (WINLINE).
F10 RETEST-EQUAL - a line touched only equal (wick or body edge at the same price, nothing beyond) is not his retest (his 22 Sep words rules/48: "the Q POC is at the same price value so not a valid retest with candle wick only"; his 17 Aug words: "the W VWAP with the candle body is the same value. invalid retest").
- Shows on: 22 Sep NY 19:00 short (Quarterly-POC) and 17 Aug NY 15:55 long (Weekly-VWAP), both firing on the kept build.
- State B-231 (MEASURED): retest census on B229D/B230K cuts; counted retests penetrate 1-2pt under spec 2 row 1, so T-ANY DOES NOT SEPARATE; no diagnostic.
- State B-232 (MEASURED): setups rebound to own-session FROM (B231 cross-day carriers were census binding errors); EQ-A/EQ-B/EQ-AB all DOES NOT SEPARATE (keeps pass, 17 Aug no equality candle, 22 Sep 1pt wick + open-touch); no diagnostic; batch B-232
- State B-234 (RESTORED diagnostic): H2 NARROW-NEXT (A5 refused, N22SEP still fires); RECON GRADE RECON62-B234D: KEEP entries exact 7/8; KEEP exits exact 6/8; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7; EU GRADE EU0525TD-B234D: KEEP entries exact 13/14; KEEP exits exact 12/14; NEVER fires 7; MACHINE-ONLY ungraded 0; trades 20; R0 corrected B-232 17 Aug line value (1.15924 was the 17:30 KILL row; per-candle values 1.15917-1.15918, buffer 1.15918 at 15:50).
- State B-235 (KEPT): his NEXT-OPEN-EQUAL words banked (rules/52); A5 to NEVER; B-234 open-equal refusal installed (35f0c73f/a6d765f0); RECON GRADE RECON62-B235K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7; EU GRADE EU0525TD-B234D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 7; MACHINE-ONLY ungraded 0; trades 20; N17AUG and A5 silent; N22SEP fires (18:55 open on the Quarterly POC unchecked by the latest-touch walk).
- State B-236 (RESTORED D3): next-open-equal after the confirmation candle; RECON GRADE RECON62-B236D: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7; EU GRADE EU0525TD-B236D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 7; MACHINE-ONLY ungraded 0; trades 20; N22SEP FIRES; .B236K dc6c2b59/7f94ca81 on disk.

## 4. Where to look (symptom -> first rows)
- Fired although his never-take: FIRE, then FRESHCOUNT on each pass, then B177HZ, then CONFIRMPOLL.
- Refused although his take: A6REFUSED + B182DEC reason, then B201TO rule, then the seed's BORN/ALIVE rows.
- Wrong target: TP_ELECT (price, R, winner), then the line values at the entry candle.
- Wrong exit: MTEXIT (rule), EXITCENSUS (break verdict), the candle o/h/l/c (B196BAR).
- Wrong divergence: B196DIV / D130 latch / CQDRECHECK across the setup window.
- Wrong zone: ZONEPICK / XOBPROMO / INPLAYCOMMIT / B162ORIGIN / B182MID / B178ZL.
