# REVIEW_J2D_B204 - June-to-date takes rebuilt for his review (1 June-12 Oct; replaces REVIEW_J2D_B203 for his 2026-10-14 words; every field from a named row or NOT PRINTED with the tag that would carry it)

Order banked: his words 2026-10-14 (B-203 review), strategy skill lines 328-349. His rulings 0610-EU-INVALID, 0625-EU-INVALID, 0722-EU-INVALID are marked INVALID below and filed on the register. His 4 June, 29 June and 28 July questions are answered on their blocks, never filed as rulings. Candle times, prices and sessions only; no machine zone numbers.
Bias words: BULL=1, BEAR=-1, NEUTRAL=0, read from B201FROM ht (h4/h1/m15|ltf). R0: the B-203 sheet's 4H/1H/15m column was read from UJBARMAP line prices (CUT rows; e.g. 4 June mpoc=1.16490 wpoc=1.16490 dpoc=1.16089 ltf=1.0, day-log JL 24711322), never a direction. B201FROM ht carries direction votes on every one of the 38 takes below. KEYROWS from B-203: NOT FOUND on disk; all rows below are the committed B-202 day packs (EU0525TD-B202, GU0525TD-B202, UJ0525TD-B202) with pack_line (CUT line = journal_line JL).

## EURUSD: 21 takes

### EURUSD London 2026-06-04 10:05 buy 1.16117 - register NEW - his question answered (entry POI cause)
- (a) Entry line Daily-POC, line price 1.16089 at the retest candle (B201FROM PACK 608 JL 24713037; WINLINE PACK 297 JL 24711581 val=1.16089). Retest candle 09:55 o=1.16119 h=1.16121 l=1.16078 c=1.16107 (B196BAR PACK 538 JL 24712540): wick 11pts through the line, body above - reached. Line side tag at confirmation: Daily-POC=LHIT (UJDTTERMS PACK 535 JL 24712536, bar=09:55).
- (b) 4H BEAR, 1H BULL, 15m BULL, 5m BULL (ht=-1/1/1|1.0, PACK 608).
- (c) Setup class trend following (B182DEC reg=TREND PACK 604 JL 24713026). Reason: regime votes=2 trendOk=1 sweepTag=0 mrOk=0 (REGIMECENSUS PACK 541 JL 24712552); no fresh sweep (sw=NOTREACHED, PACK 608; nearest sweep tag pAS.H 09:15 PACK 144 JL 24711409, not counted).
- (d) Zone XOB 1.15967-1.15972, formed 01:25, promoted 01:40 (B162ORIGIN PACK 527 JL 24712524; XOBPROMO PACK 542 JL 24712558). Came into play by swing commit firstShift=97 firstVal=1.15968 (INPLAYCOMMIT PACK 547 JL 24712574, committed=1); B177HZ PASS xobWin=1.0 (PACK 597 JL 24712800). Mid/kill NOT PRINTED (no B182MID row for this range in the cut). Side against the stop: whole zone below the 1.16069 stop - far side of the stop from the entry.
- (e) In-bias OB/FVG per-candidate state NOT PRINTED in the cuts (no tag carries it; FRESHCOUNT carries global counts only and is filtered from the cuts). No FRESH abort on the fired 09:55 seed path (B196SLOT in window: DIV_FALLBACK abort at 09:55 PACK 494 JL 24712483 belongs to the 09:30 seed at S5). Opposite FVG validated: NOT PRINTED per-candidate.
- (f) Divergences seed to entry: regular-bearish 09:35 (B196DIV PACK 492 JL 24712479, latch=0; D130LATCH verdict=-1 PACK 491 JL 24712478), hidden-bullish 09:55 latched (B196DIV PACK 595 JL 24712798 latch=1; B182DEC div=2 kind=hidden dbar=09:55 PACK 604; D130LATCH verdict=2 oppPassed=-1 oppBar=09:35 PACK 594 JL 24712797). Latched = latest with-trade print.
- (g) Exit: stop, MTEXIT bar=10:20 reason=SL entry=1.16113 exit=1.16069 (PACK 790 JL 24713258); deal 10:21 1.16069 (PACK 742 JL 24713198).
- His answer: the entry POI cause is the Daily-POC at 1.16089, retested on the 09:55 candle (wick 11pts through, close above), seed born 09:55 (B200POT PACK 540 JL 24712544), confirmation 10:00 touchAttr=1 confirm=1 (CONFIRMPOLL PACK 590 JL 24712787), entry 10:05 open 1.16117.

### EURUSD New York 2026-06-10 16:15 buy 1.15551 - register INVALID (his words 0610-EU-INVALID)
- (a) Entry line Daily-VWAP, line price 1.15463 at the retest candle (B201FROM PACK 3019 JL 24776524). Retest candle 15:30 o=1.15464 h=1.15578 l=1.15424 c=1.15497 (B196BAR PACK 2562 JL 24774594): wick 39pts through, body above - reached. Line side tag at confirmation: Daily-VWAP=Lno-penetration/Sbody-above (UJDTTERMS PACK 2993 JL 24776112, bar=16:10).
- (b) 4H BULL, 1H BEAR, 15m BULL, 5m BULL (ht=1/-1/1|1.0, PACK 3019).
- (c) Setup class trend following (B182DEC reg=TREND PACK 3013 JL 24776511). Reason: regime votes=1 trendOk=0 at seed 15:30-15:40, votes=2 trendOk=1 from 15:45 (REGIMECENSUS PACK 2567/2618/2665/2718 JL 24774608/24774669/24774725/24774785); sweepTag=0 mrOk=0; no fresh sweep (sw=NOTREACHED; sweep tags pLD.L 14:00 PACK 1599 JL 24771224, pLD.H 15:40 PACK 2619 JL 24774676, not counted).
- (d) Zone XOB 1.15361-1.15401, formed 14:55, promoted 15:45 (B162ORIGIN side=B PACK 2977 JL 24775903 origin range 1.15399-1.15474 formT=14:25; XOBPROMO xobId=3866 promoT=15:45 PACK 2999 JL 24776121; B182MID mid=1.15381 kill=1.15381 PACK 2707 JL 24774770). Machine pick range differs from the most-recent origin tag (documentation only). Came into play: INPLAYCOMMIT committed=0 both polls (PACK 2943 JL 24775865; PACK 3001 JL 24776131); B177HZ PASS on xobWin=1.0 (PACK 3006 JL 24776140). Side against the stop: zone bottom 1.15361 is 2pts above the 1.15359 stop - between entry and stop.
- (e) FRESHCOUNT on the day log at 16:00/16:05/16:10 pre-confirmation: obDead=0 fvgDead=1 oppFvg=1 adverse=2 verdict=ABORT scope=pre (JL 24775588/24775851/24776116); at the S5 gate 16:10: same adverse=2 verdict=HOLD scope=post (JL 24776523/24776525). FRESHSKIP PRE_BINDING at 15:55/16:00 (PACK 2766 JL 24774855; PACK 2821 JL 24775119). No B196SLOT FRESH abort for the fired 15:30 seed in the cuts. His in-bias FVG invalidated + opposite FVG validated stands on his words; the machine's own counts agree adverse=2 and the S5 diagnostic HOLD let the order through (CheckFreshness EA:2770; pre-confirmation-only EA:2761-2768).
- (f) Divergences: opposing -1 at 15:45 (D130LATCH oppPassed=-1 oppBar=15:45 PACK 3003 JL 24776137); latched regular-bullish 16:05 (B196DIV PACK 3004 JL 24776138 latch=1; B182DEC div=1 kind=regular dbar=16:05 PACK 3013). No later divergence print before entry.
- (g) Exit: the 17:55 candle broke the Daily-POC with its body (o=1.15545 c=1.15522 through 1.15543; EXITCENSUS PACK 4067 JL 24777711 verdict=BREAK ownBrk=1); MTEXIT bar=17:55 reason=POI_BODY_BREAK line=Daily-POC lineVal=1.15543 entry=1.15546 exit=1.15523 src=OWNBODY (PACK 4073 JL 24777718); deal 18:00 1.15523 (PACK 4074 JL 24777720). Answers his 17:55 question: the run did exit there, on the higher-line break off the Daily-VWAP anchor.
- His ruling filed: not valid, must-never.

### EURUSD London 2026-06-18 09:45 buy 1.15256 - register NEW - his questions answered (setup, biases, FOMC)
- (a) Entry line Daily-POC, line price 1.15217 at the retest candle (B201FROM PACK 408 JL 24880803; WINLINE PACK 343 JL 24880139 val=1.15217). Retest candle 09:35 o=1.15275 h=1.15277 l=1.15191 c=1.15224 (B196BAR PACK 342 JL 24880138): wick 26pts through, body above - reached. Line side tag at confirmation: Daily-POC=LHIT (UJDTTERMS PACK 389 JL 24880479, bar=09:40).
- (b) 4H BEAR, 1H BULL, 15m BULL, 5m BULL (ht=-1/1/1|1.0, PACK 408).
- (c) Setup class trend following (B182DEC reg=TREND PACK 404 JL 24880792). Reason: regime votes=2 trendOk=1 sweepTag=0 mrOk=0 (REGIMECENSUS PACK 346 JL 24880151); no fresh sweep (sw=NOTREACHED; sweep tag pAS.H 09:20 PACK 196 JL 24879971, not counted).
- (d) Zone XOB 1.15089-1.15112, formed 03:45, promoted 04:00 (B162ORIGIN PACK 378 JL 24880209; XOBPROMO PACK 347 JL 24880157). Came into play by swing commit firstShift=8 firstVal=1.15101 (INPLAYCOMMIT PACK 351 JL 24880173, committed=1); B177HZ PASS gapTouch=1.0 xobWin=1.0 (PACK 398 JL 24880495). Mid/kill NOT PRINTED (no B182MID row for this range in the cut). Side against the stop: the 1.15101 stop sits inside the zone top edge - straddles the stop.
- (e) No FRESH abort on the fired 09:35 seed path in the cuts; FRESHCOUNT NOT PRINTED for this date (not day-log scanned; tag FRESHCOUNT).
- (f) Latched hidden-bullish 09:35 (B196DIV PACK 396 JL 24880493 latch=1; B182DEC div=2 kind=hidden dbar=09:35 PACK 404; D130LATCH verdict=2 oppPassed=-1 oppBar=09:10 PACK 395 JL 24880492). Only divergence print in the window.
- (g) Exit: stop, MTEXIT bar=10:25 reason=SL entry=1.15254 exit=1.15101 (PACK 807 JL 24881274); deal 10:25 1.15101 (PACK 762 JL 24881221).
- FOMC answer: zero FOMC-POC/FOMC-VWAP prints on 18 June in any cut (the run's only FOMC anchor is 2026.07.29 21:00 server, after this date; first FOMC prints appear 30 July). His owed early exit on the FOMC POC at the 09:55 close / 10:00 open had no FOMC line on the run: at 09:55 the run prints only Daily/Weekly/Monthly lines (EXITCENSUS PACK 490-495 JL 24880907-24880912). FOMC-MULTI-ANCHOR order banked (skill line 348).

### EURUSD London 2026-06-25 10:45 sell 1.13540 - register INVALID (his words 0625-EU-INVALID)
- (a) Entry line Weekly-POC, line price 1.13548 at the retest candle (B201FROM PACK 1126 JL 24969081; WINLINE PACK 418 JL 24965876 val=1.13548). Retest candle 09:05 o=1.13614 h=1.13631 l=1.13590 c=1.13615 (B196BAR PACK 127 JL 24965527): wick 83pts through, body above - reached (B60C cSrc=PRIOR PACK 1109 JL 24968664). Line side tag at confirmation: Weekly-POC=Lbody-below/SHIT (UJDTTERMS PACK 1104 JL 24968653, bar=10:40).
- (b) 4H BEAR, 1H BULL, 15m BEAR, 5m BEAR (ht=-1/1/-1|-1.0, PACK 1126).
- (c) Setup class trend following (B182DEC reg=TREND PACK 1120 JL 24969068). Reason: regime votes=2 trendOk=1 sweepTag=0 mrOk=0 (REGIMECENSUS PACK 718 JL 24966221); no fresh sweep (sw=NOTREACHED; sweep tag pAS.L 10:15 PACK 782 JL 24966601, not counted).
- (d) Zone XOB 1.13524-1.13587, formed 10:00, promoted 10:20 (B162ORIGIN PACK 1091 JL 24968357; B182MID mid=1.13556 kill=1.13556 PACK 878 JL 24966981). Came into play: B177HZ PASS xobWin=1.0 (PACK 1113 JL 24968669); INPLAYCOMMIT row NOT PRINTED in the extract for this pick. The zone was killed 10:50 post-entry (B178ZL KILL t=10:50 PACK 1223 JL 24969197). Side against the stop: entry 1.13540 inside the zone, stop 1.13604 above - target side.
- (e) FRESHCOUNT on the day log at 10:35/10:40 pre (S4_ARMED): obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD (JL 24968313/24968368/24968657); S5 same adverse=1 HOLD (JL 24969080/24969082). His invalidated in-bias bearish OB (10:00) is obDead=0 on the machine's rows (chart-vs-machine split on the OB state); his invalidated FVG matches fvgDead=1. The 2-of-3 kill never saw 2 adverse terms on rows, so it held.
- (f) CQD type: machine latched regular-bearish 10:05 (B196DIV PACK 1111 JL 24968667 latch=0; B182DEC div=-1 kind=regular dbar=10:05 PACK 1120; D130LATCH verdict=-1 oppPassed=1 oppBar=09:35 PACK 1110 JL 24968666). Full 09:30-11:00 window: no bullish divergence printed after 09:35 on any print (UJPROBE latestNZ=-1 from 10:05; CQDRECHECK passA/B=-1.0); no bearish print 10:20-10:50 either. His hidden-bullish latest and his 10:20-10:50 bearish late divergence are not on the machine's rows. "Late" logic: NOT FOUND by text in EA, indicator or CQD sources; the D130 walk scans later shifts for opposing verdicts (EA:10334-10343) and printed oppPassed=1 oppBar=09:35 (older, not late).
- (g) Exit: stop, MTEXIT bar=11:00 reason=SL entry=1.13540 exit=1.13604 (PACK 1357 JL 24969356); deal 11:00 1.13606 (PACK 1298 JL 24969285).
- His ruling filed: not valid, must-never.

### EURUSD New York 2026-06-29 16:15 buy 1.14039 - register NEW - his question answered (entry line POI)
- (a) Entry line Weekly-POC, line price 1.14031 at the retest candle (B201FROM PACK 2871 JL 25002027; same price conjoined on Daily-POC, WINLINE PACK 2844 JL 25001501 line=Daily-POC val=1.14031). Retest candle 16:10 o=1.14033 h=1.14044 l=1.14029 c=1.14036 (B196BAR PACK 2843 JL 25001500): wick 2pts through, body above - reached, marginal. Line side tag at confirmation: Weekly-POC=LHIT (UJDTTERMS PACK 2840 JL 25001496, bar=16:10).
- (b) 4H BEAR, 1H BULL, 15m BULL, 5m BULL (ht=-1/1/1|1.0, PACK 2871).
- (c) Setup class trend following (B182DEC reg=TREND PACK 2866 JL 25002014). Reason: regime votes=2 trendOk=1 sweepTag=0 mrOk=0 (REGIMECENSUS PACK 2848 JL 25001514); no fresh sweep (sw=NOTREACHED).
- (d) Zone XOB 1.13928-1.13952, formed 09:00, promoted 09:40 (B162ORIGIN PACK 2832 JL 25001485; XOBPROMO PACK 2849 JL 25001520; B182MID mid=1.13940 kill=1.13940 PACK 408 JL 24997850). Came into play: INPLAYCOMMIT committed=0 (PACK 2854 JL 25001535, hits=0); B177HZ PASS gapTouch=1.0 xobWin=1.0 (PACK 2859 JL 25001544). Side against the stop: whole zone below the 1.13995 stop - far side.
- (e) No FRESH abort on the fired 16:10 seed path in the cuts; FRESHCOUNT NOT PRINTED (tag FRESHCOUNT).
- (f) Latched hidden-bullish 15:50 (B196DIV PACK 2857 JL 25001542 latch=0; B182DEC div=2 kind=hidden dbar=15:50 PACK 2866; D130LATCH verdict=2 oppPassed=-1 oppBar=14:55 PACK 2856 JL 25001541).
- (g) Exit: take-profit, MTEXIT bar=17:15 reason=TP_TOUCH entry=1.14035 exit=1.14149 (PACK 675 JL 25002812 in full cut); deal 17:19 1.14152 (PACK 3501 JL 25002749).
- His answer: the entry line is the Weekly-POC at 1.14031 (Daily-POC conjoined same price), retested on the 16:10 candle by a 2pt wick with the close above.

### EURUSD New York 2026-07-08 14:50 sell 1.14002 - register NEW - his question answered (CQD type)
- (a) Entry line Daily-POC, line price 1.14057 at the retest candle (B201FROM PACK 2372 JL 25144135; WINLINE PACK 2300 JL 25143278 val=1.14057). Retest candle 14:40 o=1.13946 h=1.14072 l=1.13930 c=1.14041 (B196BAR PACK 2299 JL 25143277): wick 15pts through, body below - reached. Line side tag at confirmation: Daily-POC=Lbody-below/Sno-penetration (UJDTTERMS PACK 2352 JL 25143720, bar=14:45).
- (b) 4H BEAR, 1H BEAR, 15m BEAR, 5m BEAR (ht=-1/-1/-1|-1.0, PACK 2372).
- (c) Setup class trend following (B182DEC reg=TREND PACK 2368 JL 25144125). Reason: regime votes=3 trendOk=1 sweepTag=0 mrOk=0 (REGIMECENSUS PACK 2303 JL 25143291); no fresh sweep (sw=NOTREACHED).
- (d) Zone XOB 1.14065-1.14095, formed 14:15, promoted 14:35 (B162ORIGIN PACK 2340 JL 25143351; XOBPROMO PACK 2304 JL 25143297; B182MID mid=1.14080 kill=1.14080 PACK 2246 JL 25143213). Came into play by bar commit (INPLAYCOMMIT PACK 2309 JL 25143312, committed=1 commitVia=BAR); B177HZ PASS xobWin=1.0 (PACK 2361 JL 25143734). The zone was killed 16:30 post-entry (B178ZL KILL t=16:30 PACK 3389 JL 25145287). Side against the stop: zone top 1.14095 equals the stop - between entry and stop.
- (e) No FRESH abort on the fired 14:40 seed path in the cuts; FRESHCOUNT NOT PRINTED (tag FRESHCOUNT).
- (f) CQD type: machine latched hidden-bearish 14:40 (B196DIV PACK 2359 JL 25143732 latch=1; B182DEC div=-2 kind=hidden dbar=14:40 PACK 2368; D130LATCH verdict=-2 oppPassed=1 oppBar=14:35 PACK 2358 JL 25143731; CQDRECHECK passA=-2.0 passB=-2.0 PACK 2351 JL 25143718). Full 13:45-14:50 window: machine prints hidden-bearish (UJPROBE latestNZ=-2) 14:00-14:25, bullish +2 at the 14:30 pass (bar 14:20), bullish +1 at the 14:45 pass (bar 14:35), bearish -2 at the 14:50 pass (bar 14:40, latest with-trade and latest overall on rows). His hidden-bullish 14:00-14:20 is the opposite side and kind from the machine's hidden-bearish same window (machine-vs-chart read split).
- (g) Exit: stop, MTEXIT bar=16:30 reason=SL entry=1.14002 exit=1.14095 (PACK 3406 JL 25145308); deal 16:32 1.14095 (PACK 3352 JL 25145241).

### EURUSD London 2026-07-15 10:35 buy 1.14227 - register NEW - his questions answered (setup type, biases)
- (a) Entry line Quarterly-VWAP, line price 1.14207 at the retest candle (B201FROM PACK 927 JL 25239209). Retest candle 09:55 o=1.14346 h=1.14359 l=1.14279 c=1.14286 (B196BAR PACK 565 JL 25237876): range sits 72pts above the line - NOT reached (B60C cSrc=PRIOR PACK 910 JL 25238708). Line side tag at confirmation: Quarterly-VWAP=LHIT (UJDTTERMS PACK 902 JL 25238687, bar=10:30).
- (b) 4H BULL, 1H BULL, 15m BEAR, 5m BULL (ht=1/1/-1|1.0, PACK 927).
- (c) Setup class trend following (B182DEC reg=TREND PACK 922 JL 25239198). Reason: regime votes=2 trendOk=1 sweepTag=0 mrOk=0 at the 10:25 seed (REGIMECENSUS PACK 857 JL 25238226); no fresh sweep (sw=NOTREACHED). Mean reversal never printed on any row near this take (sweepTag=0 mrOk=0; cumMR static 19). His mean-reversal-not-valid matches the rows: the machine never classified it MR.
- (d) Zone XOB 1.14042-1.14070, promoted 2026.07.14 15:30 (B201FROM zn PACK 927; XOBPROMO xobId=8053 promoT=14th 15:30 PACK 907 JL 25238695). Formation candle NOT PRINTED (no B162ORIGIN row for this pick in the cut; tag B162ORIGIN). Came into play by swing-leg commit firstShift=231 (INPLAYCOMMIT PACK 909 JL 25238704); B177HZ PASS gapTouch=1.0 (PACK 915 JL 25238718). Mid/kill NOT PRINTED (no B182MID row for this range in the cut). Side against the stop: whole zone below the 1.14190 stop - far side.
- (e) SEEDBIAS_REFUSED abort at 09:55 for the earlier 09:50 Quarterly-POC seed (B196SLOT PACK 514 JL 25237817, other seed); no FRESH abort on the fired 10:25 seed path; FRESHCOUNT NOT PRINTED (tag FRESHCOUNT).
- (f) Latched hidden-bullish 10:20 (B196DIV PACK 913 JL 25238716 latch=0; B182DEC div=2 kind=hidden dbar=10:20 PACK 922; D130LATCH verdict=2 oppPassed=-1 oppBar=09:25 PACK 912 JL 25238715).
- (g) Exit 12:32 1.14189 per deal (PACK 2022 JL 25240433); rule, line and candle NOT PRINTED (no MTEXIT row in the cut; tag MTEXIT).

### EURUSD New York 2026-07-22 14:55 sell 1.14048 - register INVALID (his words 0722-EU-INVALID)
- (a) Entry line Weekly-POC, line price 1.14065 at the retest candle (B201FROM PACK 2392 JL 25345039; WINLINE PACK 2310 JL 25343963 line=Daily-POC val=1.14065 conjoined). Retest candle 14:45 o=1.14050 h=1.14073 l=1.14037 c=1.14052 (B196BAR PACK 2309 JL 25343962): wick 8pts through, body below - reached. Line side tag at confirmation: Weekly-POC=Lbody-below/Sno-penetration (UJDTTERMS PACK 2367 JL 25344502, bar=14:50).
- (b) 4H BEAR, 1H BULL, 15m BEAR, 5m BEAR (ht=-1/1/-1|-1.0, PACK 2392).
- (c) Setup class trend following (B182DEC reg=TREND PACK 2386 JL 25345026). Reason: regime votes=2 trendOk=1 sweepTag=0 mrOk=0 (REGIMECENSUS PACK 2315 JL 25343977); no fresh sweep (sw=NOTREACHED; sweep tag pLD.L 14:00 PACK 1870 JL 25343484, not counted).
- (d) Zone XOB 1.14146-1.14194, formed 21st 17:10, promoted 21st 17:30 (B162ORIGIN PACK 2354 JL 25344037; XOBPROMO PACK 2372 JL 25344510). Came into play by swing-leg commit firstShift=52 firstVal=1.14181 at 14:50 (INPLAYCOMMIT PACK 2374 JL 25344519, committed=1; at 14:45 committed=0 PACK 2320 JL 25343998); B177HZ PASS gapTouch=1.0 xobWin=1.0 (PACK 2379 JL 25344529). The zone was killed 16:35 post-entry (B178ZL KILL t=16:35 PACK 3364 JL 25346133). Side against the stop: whole zone above the 1.14075 stop - far side.
- (e) FRESHCOUNT on the day log at 14:50 pre (S3) and S5: obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD both scopes (JL 25344506/25345038/25345040). His invalidated 5m in-bias OB is obDead=0 on rows (chart-vs-machine split); his invalidated FVG matches fvgDead=1. The kill needs 2 terms; rows carry 1, so it held.
- (f) Latched regular-bearish 14:45 (B196DIV PACK 2377 JL 25344527 latch=1; B182DEC div=-1 kind=regular dbar=14:45 PACK 2386; D130LATCH verdict=-1 oppPassed=2 oppBar=14:25 PACK 2376 JL 25344526).
- (g) Exit: stop, MTEXIT bar=15:00 reason=SL entry=1.14048 exit=1.14075 (PACK 2508 JL 25345183); deal 14:59 1.14075 (PACK 2396 JL 25345054).
- His ruling filed: not valid, must-never.

### EURUSD London 2026-07-28 10:45 sell 1.13689 - register NEW - his question answered (5m entry POI, exact candle)
- (a) Entry line Daily-VWAP, line price 1.13709 at the retest candle (B201FROM PACK 1072 JL 25431663; WINLINE PACK 748 JL 25429187 line=Daily-VWAP val=1.13709 at 10:10). Retest candle 10:10 o=1.13718 h=1.13734 l=1.13707 c=1.13729 (B196BAR PACK 747 JL 25429186): wick 25pts through, close above the line without a body close through - reached (B60C cSrc=BOTH PACK 1057 JL 25431067). Line side tag at confirmation: Daily-VWAP=Lbody-below/SHIT (UJDTTERMS PACK 1048 JL 25431049, bar=10:40).
- (b) 4H BEAR, 1H BEAR, 15m BULL, 5m BEAR (ht=-1/-1/1|-1.0, PACK 1072).
- (c) Setup class trend following (B182DEC reg=TREND PACK 1068 JL 25431651). Reason: regime votes=2 trendOk=1 sweepTag=0 mrOk=0 (REGIMECENSUS PACK 340/451/893 JL 25426684/25427327/25429365); no fresh sweep (sw=NOTREACHED).
- (d) Zone XOB 1.13775-1.13801, formed 06:30, promoted 06:45 (formT from the kill row PACK 1316 JL 25432109 t=17:40; B201FROM zn promo PACK 1072). Mid/kill at confirmation NOT PRINTED in the extract (no B182MID row for this range; tag B182MID); killed 17:40 post-entry. Came into play: B177HZ PASS on gapTouch=1.0 at the 10:10 retest (PACK 1061 JL 25431072, xobWin=0.0). Side against the stop: whole zone above the 1.13728 stop - far side.
- (e) FRESH_OB_DEAD abort at 09:55 for the earlier 09:40 Weekly-POC seed (B196SLOT PACK 548 JL 25427952, other seed) and LTF_MISALIGN abort at 10:10 for the 09:30 seed (PACK 698 JL 25429127); no FRESH abort on the fired 10:40 seed path; FRESHCOUNT NOT PRINTED (tag FRESHCOUNT).
- (f) Latched regular-bearish 10:10 (B196DIV PACK 1059 JL 25431070 latch=0; B182DEC div=-1 kind=regular dbar=10:10 PACK 1068; D130LATCH verdict=-1 oppPassed=2 oppBar=10:05 PACK 1058 JL 25431069).
- (g) Exit: the 11:20 candle broke the Daily-POC with its body; MTEXIT bar=11:20 reason=POI_BODY_BREAK line=Daily-POC lineVal=1.13702 entry=1.13689 exit=1.13713 src=OWNBODY (PACK 1479 JL 25432134); deal 11:25 1.13714 (PACK 1480 JL 25432136).
- His answer: the 5m entry zone is the XOB 1.13775-1.13801 (formed on the 06:30 candle, promoted 06:45), retested via the Daily-VWAP on the 10:10 candle; the 10:40 confirmation carries touchAttr=1 confirm=0 on the opposite LONG poll and the SHORT fired on the 10:45 pass (D130LATCH PACK 1058).

### EURUSD London 2026-08-05 11:20 buy 1.15409 - register NEW
- (a) Entry line Daily-POC 1.15363 at the 10:30 retest (B201FROM PACK 1517 JL 25599880). Retest 10:30 o=1.15339 h=1.15373 l=1.15339 c=1.15363 (B196BAR PACK 1009 JL 25595828): wick 24pts through - reached. Side tag at confirmation: Daily-POC=Lno-penetration/Sbody-above (UJDTTERMS PACK 1496 JL 25599202, bar=11:15).
- (b) 4H BULL, 1H BULL, 15m BEAR, 5m BULL (ht=1/1/-1|1.0).
- (c) Trend following (B182DEC PACK 1512 JL 25599868); votes=2 trendOk=1 (REGIMECENSUS PACK 1392 JL 25597957); sw=NOTREACHED.
- (d) Zone XOB 1.15318-1.15360 promo 08:35 (B201FROM zn); formation and mid/kill NOT PRINTED (tags B162ORIGIN/B182MID). B177HZ PASS xobWin=1.0 (PACK 1505 JL 25599217). Side: stop 1.15346 inside the zone - straddles the stop.
- (e) FRESH_OB_DEAD abort 09:20 for the 09:05 seed (B196SLOT PACK 243 JL 25591071, other seed); no FRESH abort on the fired 11:05 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bullish 11:10 (B196DIV PACK 1503 JL 25599215 latch=1; D130LATCH verdict=2 oppPassed=-2 oppBar=10:20 PACK 1502 JL 25599214). Confirmation 11:10 touchAttr=1 confirm=0 (POLL PACK 1447 JL 25598592); 11:15 touchAttr=1 confirm=1 (POLL PACK 1498 JL 25599204).
- (g) Exit: stop, MTEXIT bar=11:40 reason=SL exit=1.15346 (PACK 1806 JL 25600216); deal 11:41 1.15346 (PACK 1747 JL 25600145).

### EURUSD New York 2026-08-17 15:55 buy 1.15947 - register NEW
- (a) Entry line Weekly-VWAP 1.15917 at the 15:00 retest (B201FROM PACK 3056 JL 25805156). Retest 15:00 o=1.15921 h=1.15954 l=1.15915 c=1.15953 (B196BAR PACK 2501 JL 25802515): wick 2pts through - reached, marginal. Side tag at confirmation: Weekly-VWAP=LHIT (UJDTTERMS PACK 3035 JL 25804424, bar=15:50).
- (b) 4H BULL, 1H BEAR, 15m BULL, 5m BULL (ht=1/-1/1|1.0).
- (c) Trend following (B182DEC PACK 3051 JL 25805144); votes=1 trendOk=0 until 15:45 votes=2 trendOk=1 (REGIMECENSUS PACK 2506/2979 JL 25802529/25803716); sw=NOTREACHED.
- (d) Zone XOB 1.15784-1.15796 promo 06:45; formation/mid NOT PRINTED (tags B162ORIGIN/B182MID). INPLAYCOMMIT SWING committed=1 at 15:50 (PACK 2985 JL 25803737); B177HZ PASS xobWin=1.0 (PACK 3044 JL 25804440). Side: whole zone below the 1.15835 stop - far side.
- (e) No FRESH abort on the fired 15:00 seed path (B196SLOT in window: RESEED H1 15:30 PACK 2808 JL 25802872, other road); FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bullish 15:45 (B196DIV PACK 3042 JL 25804438 latch=1; D130LATCH verdict=2 oppPassed=-2 oppBar=15:25 PACK 3041 JL 25804437). Confirmation 15:45 touchAttr=1 confirm=0 (POLL PACK 2974 JL 25803710); 15:50 touchAttr=1 confirm=1 (POLL PACK 3037 JL 25804426).
- (g) Exit: the 17:10 candle broke the Weekly-POC; MTEXIT bar=17:10 reason=POI_BODY_BREAK line=Weekly-POC lineVal=1.15957 entry=1.15946 exit=1.15961 src=NEXTOPEN (PACK 4024 JL 25806231); deal 17:15 1.15961 (PACK 4025 JL 25806233).

### EURUSD London 2026-08-28 10:05 sell 1.16466 - register A1
- (a) Entry line Daily-VWAP 1.16490 at the 09:55 retest (B201FROM PACK 743 JL 26090747; WINLINE PACK 662 JL 26089179 val=1.16490). Retest 09:55 o=1.16473 h=1.16491 l=1.16473 c=1.16482 (B196BAR PACK 661 JL 26089178): wick 1pt through - reached, marginal. Side tag at confirmation: Daily-VWAP=Lbody-below/Sno-penetration (UJDTTERMS PACK 721 JL 26089966, bar=10:00).
- (b) 4H BEAR, 1H BEAR, 15m BEAR, 5m BEAR (ht=-1/-1/-1|-1.0).
- (c) Trend following (B182DEC PACK 739 JL 26090736); votes=3 trendOk=1 (REGIMECENSUS PACK 666 JL 26089193); sw=NOTREACHED.
- (d) Zone XOB 1.16492-1.16507 promo 06:40; formation/mid NOT PRINTED (tags B162ORIGIN/B182MID). INPLAYCOMMIT committed=0 both polls; B177HZ PASS gapTouch=1.0 (PACK 733 JL 26089992). Side: zone bottom 1.16492 below the 1.16508 stop... zone 1.16492-1.16507 vs stop 1.16508: whole zone under the stop by 1pt - between entry and stop. (His zone for this trade is the 06:30-06:40 FVG, register section A note; the machine reads no FVG on any deal.)
- (e) No FRESH abort on the fired 09:55 seed path in the cuts; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bearish 09:25 (B196DIV PACK 731 JL 26089990 latch=0; B182DEC div=-1 kind=regular dbar=09:25 PACK 739; D130LATCH verdict=-1 oppPassed=2 oppBar=09:15 PACK 730 JL 26089989). Confirmation 09:55 touchAttr=0 confirm=0 (POLL PACK 660 JL 26089177); 10:00 touchAttr=1 confirm=1 (POLL PACK 723 JL 26089968).
- (g) Exit: the 11:30 candle broke the Daily-POC; MTEXIT bar=11:30 reason=POI_BODY_BREAK line=Daily-POC lineVal=1.16451 entry=1.16466 exit=1.16464 src=OWNBODY (PACK 1844 JL 26091959); deal 11:35 1.16467 (PACK 1845 JL 26091961). His exit is the 11:35 open (register section A note).

### EURUSD New York 2026-09-01 17:35 buy 1.16024 - register A2
- (a) Entry line Monthly-VWAP 1.16007 at the 16:50 retest (B201FROM PACK 4422 JL 26171998). Retest 16:50 o=1.15989 h=1.16006 l=1.15986 c=1.15995 (B196BAR PACK 3929 JL 26164925): high 1pt short of the line - NOT reached, marginal 1pt. Side tag at confirmation: Monthly-VWAP=LHIT (UJDTTERMS PACK 4400 JL 26171225, bar=17:30).
- (b) 4H BEAR, 1H BEAR, 15m BULL, 5m BULL (ht=-1/-1/1|1.0).
- (c) Trend following (B182DEC PACK 4416 JL 26171985); latest regime rows before entry: votes=0 trendOk=0 at 14:30-14:55 (REGIMECENSUS PACK 2423-2676 JL 26160207-26160492); sw=NOTREACHED.
- (d) Zone XOB 1.15975-1.16013 promo 17:25 (B201FROM zn); formation NOT PRINTED (tag B162ORIGIN); B182MID mid=1.15994 kill=1.15994 (PACK 4332 JL 26169712). B177HZ PASS xobWin=1.0 (PACK 4409 JL 26171242). Side: zone bottom equals the 1.15975 stop - between entry and stop.
- (e) No FRESH abort on the fired 17:00 seed path (B196SLOT in window: RESEED/PREEMPT on other seeds PACK 2723/3014 JL 26160549/26163057); FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bullish 17:15 (B196DIV PACK 4407 JL 26171240 latch=1; D130LATCH verdict=2 oppPassed=-1 oppBar=17:00 PACK 4406 JL 26171239). Confirmation 17:25 touchAttr=0 confirm=0 (POLL PACK 4343 JL 26170441); 17:30 touchAttr=1 confirm=1 (POLL PACK 4402 JL 26171227).
- (g) Exit: stop, MTEXIT bar=17:50 reason=SL entry=1.16022 exit=1.15975 (PACK 4678 JL 26172294); deal 17:51 1.15975 (PACK 4617 JL 26172227).

### EURUSD London 2026-09-02 14:45 sell 1.15747 - register NEW
- (a) Entry line Daily-VWAP 1.15785 at the 14:35 retest (B201FROM PACK 2633 JL 26187097; WINLINE PACK 2549 JL 26185474 val=1.15785). Retest 14:35 o=1.15759 h=1.15791 l=1.15746 c=1.15783 (B196BAR PACK 2548 JL 26185473): wick 6pts through - reached. Side tag at confirmation: Daily-VWAP=Lbody-below/Sno-penetration (UJDTTERMS PACK 2609 JL 26186279, bar=14:40).
- (b) 4H BEAR, 1H BEAR, 15m BULL, 5m BEAR (ht=-1/-1/1|-1.0).
- (c) Trend following (B182DEC PACK 2629 JL 26187087); votes=2 trendOk=1 (REGIMECENSUS PACK 2553 JL 26185488); sw=NOTREACHED.
- (d) Zone XOB 1.15788-1.15818 promo 11:55 (B201FROM zn); formation NOT PRINTED (tag B162ORIGIN); B182MID mid=1.15803 kill=1.15803 (PACK 2066 JL 26183770). INPLAYCOMMIT SWING committed=1 (PACK 2616 JL 26186296); B177HZ PASS xobWin=1.0 (PACK 2622 JL 26186310). Side: zone top 1.15818 under the 1.15822 stop - between entry and stop.
- (e) No FRESH abort on the fired 14:35 seed path in the cuts; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bearish 14:35 (B196DIV PACK 2620 JL 26186308 latch=1; D130LATCH verdict=-1 oppPassed=2 oppBar=14:30 PACK 2619 JL 26186307). Confirmation 14:35 touchAttr=0 confirm=0 (POLL PACK 2547 JL 26185472); 14:40 touchAttr=1 confirm=1 (POLL PACK 2611 JL 26186281). B60C BOTH xt=1 (PACK 2617 JL 26186300).
- (g) Exit: stop, MTEXIT bar=15:20 reason=SL entry=1.15747 exit=1.15822 (PACK 3152 JL 26187675); deal 15:20 1.15822 (PACK 3083 JL 26187595).

### EURUSD London 2026-09-04 09:30 buy 1.16296 - register NEW
- (a) Entry line Daily-POC 1.16283 at the 09:15 retest (B201FROM PACK 381 JL 26239188; WINLINE PACK 245 JL 26236705 val=1.16283). Retest 09:15 o=1.16297 h=1.16298 l=1.16279 c=1.16290 (B196BAR PACK 244 JL 26236704): wick 4pts through - reached. Side tag at confirmation: Daily-POC=LHIT (UJDTTERMS PACK 361 JL 26238349, bar=09:25).
- (b) 4H BULL, 1H BEAR, 15m BULL, 5m BULL (ht=1/-1/1|1.0).
- (c) Trend following (B182DEC PACK 377 JL 26239177); votes=2 trendOk=1 (REGIMECENSUS PACK 248 JL 26236717); sw=NOTREACHED.
- (d) Zone XOB 1.16249-1.16269 promo 09:05 (B201FROM zn); formation NOT PRINTED (tag B162ORIGIN); B182MID mid=1.16259 kill=1.16259 (PACK 134 JL 26236579). B177HZ PASS xobWin=1.0 (PACK 370 JL 26238365). Side: zone bottom equals the 1.16249 stop - between entry and stop.
- (e) No FRESH abort on the fired 09:15 seed path in the cuts; FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bullish 09:15 (B196DIV PACK 368 JL 26238363 latch=1; D130LATCH verdict=2 oppPassed=-1 oppBar=09:05 PACK 367 JL 26238362). Confirmation 09:20 touchAttr=1 confirm=0 (POLL PACK 308 JL 26237543); 09:25 touchAttr=1 confirm=1 (POLL PACK 363 JL 26238351). B60C BOTH (PACK 366 JL 26238360).
- (g) Exit: stop, MTEXIT bar=10:50 reason=SL entry=1.16290 exit=1.16249 (PACK 1430 JL 26240365); deal 10:51 1.16249 (PACK 1370 JL 26240295).

### EURUSD London 2026-09-07 09:20 buy 1.16138 - register A4
- (a) Entry line Weekly-POC 1.16105 at the 09:00 retest (B201FROM PACK 333 JL 26262308). Retest 09:00 o=1.16143 h=1.16143 l=1.16103 c=1.16116 (B196BAR PACK 114 JL 26258934): wick 2pts through - reached, marginal. Side tag at confirmation: Weekly-POC=LHIT (UJDTTERMS PACK 312 JL 26261442, bar=09:15).
- (b) 4H BULL, 1H BULL, 15m BULL, 5m BULL (ht=1/1/1|1.0).
- (c) Trend following (B182DEC PACK 328 JL 26262296); votes=3 trendOk=1 (REGIMECENSUS PACK 119 JL 26258948); sw=NOTREACHED.
- (d) Zone XOB 1.16098-1.16109 promo 08:55 (B201FROM zn); formation NOT PRINTED (tag B162ORIGIN); B182MID mid=1.16104 kill=1.16104 (PACK 51 JL 26258861). B177HZ PASS xobWin=1.0 (PACK 321 JL 26261458). Side: zone bottom equals the 1.16098 stop - between entry and stop. FOMC states present in the confirmation row (post-29-July anchor live).
- (e) No FRESH abort on the fired 09:00 seed path in the cuts; FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bullish 09:10 (B196DIV PACK 319 JL 26261456 latch=1; D130LATCH verdict=2 oppPassed=-2 oppBar=08:55 PACK 318 JL 26261455). Confirmation 09:10 touchAttr=1 confirm=0 (POLL PACK 249 JL 26260616); 09:15 touchAttr=1 confirm=1 (POLL PACK 314 JL 26261444). B60C BOTH xt=1 (PACK 317 JL 26261453).
- (g) Exit: take-profit, MTEXIT bar=10:50 reason=TP_TOUCH entry=1.16135 exit=1.16200 (PACK 1628 JL 26263729); deal 10:53 1.16201 (PACK 1557 JL 26263648).

### EURUSD New York 2026-09-07 16:45 buy 1.16264 - register A5
- (a) Entry line Weekly-POC 1.16229 at the 14:55 retest (B201FROM PACK 4486 JL 26284103; WINLINE PACK 3098 JL 26266588 line=Daily-POC val=1.16229 conjoined). Retest 14:55 o=1.16229 h=1.16236 l=1.16218 c=1.16229 (B196BAR PACK 3097 JL 26266587): wick 11pts through - reached. Side tag at confirmation: Weekly-POC=Lno-penetration/Sbody-above (UJDTTERMS PACK 4465 JL 26283257, bar=16:40).
- (b) 4H BULL, 1H BULL, 15m BULL, 5m BULL (ht=1/1/1|1.0).
- (c) Trend following (B182DEC PACK 4481 JL 26284091); votes=2 trendOk=1 at the 14:55 seed (REGIMECENSUS PACK 3102 JL 26266601); sw=NOTREACHED.
- (d) Zone XOB 1.16229-1.16253 promo 15:30 (B201FROM zn); formation NOT PRINTED (tag B162ORIGIN); B182MID mid=1.16241 kill=1.16241 (PACK 3540 JL 26270887). B60C cSrc=PRIOR (PACK 4470 JL 26283267). B177HZ PASS xobWin=1.0 (PACK 4474 JL 26283272). Side: the 1.16239 stop sits inside the zone - straddles the stop.
- (e) PREEMPT S2X at 15:05 for the 15:05 seed (B196SLOT PACK 3224 JL 26268237, other seed); no FRESH abort on the fired 14:55 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bullish 16:30 (B196DIV PACK 4472 JL 26283270 latch=1; D130LATCH verdict=2 oppPassed=-2 oppBar=16:10 PACK 4471 JL 26283269). Confirmation 16:35 touchAttr=1 confirm=0 (POLL PACK 4404 JL 26282435); 16:40 touchAttr=1 confirm=1 (POLL PACK 4467 JL 26283259).
- (g) Exit 21:25 1.16239 per deal (PACK 8111 JL 26288020); rule, line and candle NOT PRINTED (no MTEXIT row in the cut; tag MTEXIT). B-203 filed it as stop R -1.0, correcting the BACKTEST market-close cell.

### EURUSD London 2026-09-08 10:10 sell 1.16205 - register A6
- (a) Entry line Monthly-POC 1.16229 at the 09:40 retest (B201FROM PACK 1004 JL 26299208). Retest 09:40 o=1.16230 h=1.16258 l=1.16230 c=1.16248 (B196BAR PACK 659 JL 26297222): wick 29pts through - reached (B60C cSrc=PRIOR PACK 987 JL 26298399). Side tag at confirmation: Monthly-POC=Lbody-below/Sno-penetration (UJDTTERMS PACK 978 JL 26298377, bar=10:05).
- (b) 4H BULL, 1H BEAR, 15m BEAR, 5m BEAR (ht=1/-1/-1|-1.0).
- (c) Trend following (B182DEC PACK 998 JL 26299193); votes=0 trendOk=0 until 10:00 votes=2 trendOk=1 (REGIMECENSUS PACK 506-913 JL 26296196-26297523); sw=NOTREACHED.
- (d) Zone XOB 1.16230-1.16256 promo 09:40 - his 9:20 XOB (B201FROM zn; B60C zxob PACK 987; INPLAYCOMMIT BAR committed=1 PACK 986 JL 26298396); B182MID mid=1.16243 kill=1.16243 (PACK 651 JL 26297209). B177HZ PASS gapTouch=1.0 xobWin=1.0 (PACK 991 JL 26298405). Side: zone top 1.16256 under the 1.16258 stop - between entry and stop.
- (e) PREEMPT S2X at 09:35 for the 09:35 seed (B196SLOT PACK 566 JL 26296266, other seed); no FRESH abort on the fired 10:05 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bearish 09:40 (B196DIV PACK 989 JL 26298403 latch=1; D130LATCH verdict=-2 oppPassed=2 oppBar=09:20 PACK 988 JL 26298402). Confirmation 10:00 touchAttr=0 confirm=0 (POLL PACK 910 JL 26297519); 10:05 touchAttr=1 confirm=1 (POLL PACK 980 JL 26298379).
- (g) Exit: take-profit, MTEXIT bar=10:40 reason=TP_TOUCH entry=1.16205 exit=1.16102 (PACK 1489 JL 26299765); deal 10:42 1.16102 (PACK 1420 JL 26299688).

### EURUSD New York 2026-09-08 17:00 sell 1.16220 - register A7
- (a) Entry line Monthly-POC 1.16229 at the 16:45 retest (B201FROM PACK 4501 JL 26310603). Retest 16:45 o=1.16213 h=1.16225 l=1.16197 c=1.16217 (B196BAR PACK 4357 JL 26308846): high 4pts short of the line - NOT reached (B60C cSrc=PRIOR PACK 4486 JL 26309791). Side tag at confirmation: Monthly-POC=Lbody-below/SHIT (UJDTTERMS PACK 4481 JL 26309780, bar=16:55).
- (b) 4H BEAR, 1H BEAR, 15m BULL, 5m BEAR (ht=-1/-1/1|-1.0).
- (c) Trend following (B182DEC PACK 4497 JL 26310592); votes=2 trendOk=1 (REGIMECENSUS PACK 3832/4156/4419 JL 26303513/26306186/26308930); sw=NOTREACHED.
- (d) Zone XOB 1.16230-1.16256 promo 09:40 - his 9:20 XOB (INPLAYCOMMIT BAR committed=1 PACK 4425 JL 26308951); B182MID mid=1.16243 kill=1.16243 (PACK 651 JL 26297209). B177HZ PASS xobWin=1.0 (PACK 4490 JL 26309796). Side: zone top under the 1.16274 stop - between entry and stop.
- (e) PREEMPT S2X at 16:15 (B196SLOT PACK 3952 JL 26305166) and TP_RR_FAIL abort at 16:45 for the 16:30 seed (PACK 4299 JL 26308778, other seed); no FRESH abort on the fired 16:50 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bearish 16:20 (B196DIV PACK 4488 JL 26309794 latch=0; B182DEC div=-1 kind=regular dbar=16:20 PACK 4497; D130LATCH verdict=-1 oppPassed=2 oppBar=15:45 PACK 4487 JL 26309793). Confirmation 16:50 touchAttr=1 confirm=0 (POLL PACK 4416 JL 26308926); 16:55 touchAttr=1 confirm=1 (POLL PACK 4483 JL 26309782).
- (g) Exit: stop, MTEXIT bar=17:30 reason=SL entry=1.16220 exit=1.16274 (PACK 4965 JL 26311155); deal 17:26 1.16275 (PACK 4833 JL 26311005).

### EURUSD New York 2026-09-22 19:00 sell 1.14314 - register NEW
- (a) Entry line Quarterly-POC 1.14334 at the 14:30 retest (B201FROM PACK 4751 JL 26612201). Retest 14:30 o=1.14612 h=1.14624 l=1.14589 c=1.14602 (B196BAR PACK 2174 JL 26590089): range sits 255pts above the line - NOT reached (B60C cSrc=PRIOR PACK 4734 JL 26611274). Side tag at confirmation: Quarterly-POC=Lbody-below/Sno-penetration (UJDTTERMS PACK 4729 JL 26611265, bar=18:55).
- (b) 4H BEAR, 1H BEAR, 15m BEAR, 5m BEAR (ht=-1/-1/-1|-1.0).
- (c) Trend following (B182DEC PACK 4745 JL 26612189); votes=3 trendOk=1 (REGIMECENSUS PACK 4627 JL 26609400); sw=NOTREACHED.
- (d) Zone XOB 1.14555-1.14602 promo 16:30 (B201FROM zn); formation NOT PRINTED (tag B162ORIGIN); B182MID mid=1.14579 kill=1.14579 (PACK 3353 JL 26606231). B177HZ PASS xobWin=1.0 (PACK 4738 JL 26611279). Side: whole zone above the 1.14440 stop - far side.
- (e) FRESH_OPP_FVG abort at 16:45 for the earlier 14:10 Daily-POC seed (B196SLOT PACK 3461 JL 26608084, other seed); no FRESH abort on the fired 18:45 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bearish 18:20 (B196DIV PACK 4736 JL 26611277 latch=0; B182DEC div=-1 kind=regular dbar=18:20 PACK 4745; D130LATCH verdict=-1 oppPassed=2 oppBar=17:30 PACK 4735 JL 26611276). Confirmation 18:50 touchAttr=1 confirm=0 (POLL PACK 4681 JL 26610345); 18:55 touchAttr=1 confirm=1 (POLL PACK 4731 JL 26611267).
- (g) Exit: take-profit touch, MTEXIT bar=19:00 reason=TP_TOUCH entry=1.14314 exit=1.14307 (PACK 4812 JL 26612279); deal 19:13 1.14306 (PACK 4856 JL 26612330).

### EURUSD London 2026-10-08 11:35 sell 1.11884 - register NEW
- (a) Entry line Daily-VWAP 1.11975 at the 11:20 retest (B201FROM PACK 1938 JL 27020908). Retest 11:20 o=1.11973 h=1.11978 l=1.11949 c=1.11949 (B196BAR PACK 1788 JL 27018676): wick 3pts through - reached. Side tag at confirmation: Daily-VWAP=Lbody-below/SHIT (UJDTTERMS PACK 1917 JL 27019804, bar=11:30).
- (b) 4H BEAR, 1H BEAR, 15m BEAR, 5m BEAR (ht=-1/-1/-1|-1.0).
- (c) Trend following (B182DEC PACK 1934 JL 27020897); votes=3 trendOk=1 (REGIMECENSUS PACK 902-1855 JL 27010832-27018759); sw=NOTREACHED.
- (d) Zone XOB 1.12058-1.12075 promo 08:30 (B201FROM zn); formation/mid NOT PRINTED (tags B162ORIGIN/B182MID). INPLAYCOMMIT SWING committed=1 at 11:30 (PACK 1861 JL 27018780; at 11:20 a different zone read none); B177HZ PASS gapTouch=1.0 (PACK 1927 JL 27019821). Side: whole zone above the 1.12039 stop - far side.
- (e) LTF_MISALIGN aborts x4 plus YIELD on earlier seeds (B196SLOT PACK 971/1099/1282/1466/1657 JL 27011893-27016582); no FRESH abort on the fired 11:20 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bearish 11:15 (B196DIV PACK 1925 JL 27019819 latch=0; B182DEC div=-1 kind=regular dbar=11:15 PACK 1934; D130LATCH verdict=-1 oppPassed=2 oppBar=11:00 PACK 1924 JL 27019818). Confirmation 11:25 touchAttr=1 confirm=0 (POLL PACK 1852 JL 27018755); 11:30 touchAttr=1 confirm=1 (POLL PACK 1919 JL 27019806). B60C BOTH (PACK 1923 JL 27019816).
- (g) Exit 12:13 1.11819 per deal (PACK 2387 JL 27021422); rule, line and candle NOT PRINTED (no MTEXIT row in the cut; tag MTEXIT).

## GBPUSD: 8 takes

### GBPUSD New York 2026-06-10 18:55 buy 1.33880 - register NEW
- (a) Entry line Weekly-POC 1.33849 at the 17:35 retest (B201FROM PACK 3043 JL 28055684). Retest 17:35 o=1.34077 h=1.34081 l=1.34034 c=1.34051 (B196BAR PACK 2555 JL 28054589): range sits 185pts above the line - NOT reached (B60C cSrc=PRIOR PACK 3027 JL 28055400). Side tag at confirmation: Weekly-POC=LHIT (UJDTTERMS PACK 3022 JL 28055388, bar=18:50).
- (b) 4H BEAR, 1H BULL, 15m BULL, 5m BULL (ht=-1/1/1|1.0).
- (c) Trend following (B182DEC PACK 3038 JL 28055673); votes=1 trendOk=0 until 16:45 votes=2 trendOk=1 (REGIMECENSUS PACK 2031-2983 JL 28052545-28055122); sw=NOTREACHED.
- (d) Zone XOB 1.33776-1.33825 promo 15:15 (B201FROM zn); B182MID mid=1.33800 kill=1.33800 (PACK 1600 JL 28049951); formation NOT PRINTED (tag B162ORIGIN). INPLAYCOMMIT at 18:50 reads a different zone 1.33900-1.33987 committed=1 (PACK 2989 JL 28055147) - the pick's own commit NOT PRINTED (tag INPLAYCOMMIT); B177HZ PASS xobWin=1.0 (PACK 3031 JL 28055405). Side: zone top 1.33825 above the 1.33679 stop, below the entry - between entry and stop.
- (e) RESEED/LTF_MISALIGN on other seeds (B196SLOT PACK 2111/2445 JL 28052645/28054459); no FRESH abort on the fired 18:45 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bullish 18:45 (B196DIV PACK 3029 JL 28055403 latch=1; D130LATCH verdict=1 oppPassed=-2 oppBar=18:25 PACK 3028 JL 28055402). Confirmation 18:45 touchAttr=0 confirm=0 (POLL PACK 2978 JL 28055117); 18:50 touchAttr=1 confirm=1 (POLL PACK 3024 JL 28055390).
- (g) Exit 23:12 1.33677 per deal (PACK 4516 JL 28057403); rule, line and candle NOT PRINTED (no MTEXIT row in the cut; tag MTEXIT).

### GBPUSD New York 2026-07-07 14:45 sell 1.33863 - register F2
- (a) Entry line Daily-POC 1.33890 at the 14:40 retest (B201FROM PACK 1939 JL 28329668). Retest 14:40 o=1.33886 h=1.33892 l=1.33860 c=1.33865 (B196BAR PACK 1912 JL 28329207): wick 2pts through - reached, marginal. Side tag at confirmation: Daily-POC=Lbody-below/SHIT (UJDTTERMS PACK 1909 JL 28329203, bar=14:40).
- (b) 4H BULL, 1H BEAR, 15m BEAR, 5m BEAR (ht=1/-1/-1|-1.0).
- (c) Trend following (B182DEC PACK 1934 JL 28329655); votes=2 trendOk=1 (REGIMECENSUS PACK 1719-1916 JL 28328927-28329220); sw=NOTREACHED.
- (d) Zone XOB 1.33862-1.33936 promo 12:25 (B201FROM zn); formation/mid NOT PRINTED (tags B162ORIGIN/B182MID). INPLAYCOMMIT BAR committed=1 (PACK 1922 JL 28329241); B177HZ PASS gapTouch=1.0 xobWin=1.0 (PACK 1927 JL 28329251). B60C BOTH xt=1 (PACK 1923 JL 28329245). Side: zone top 1.33936 under the 1.33940 stop by 4pts - between entry and stop.
- (e) SEEDBIAS_REFUSED aborts x4 on earlier seeds 14:20-14:35 (B196SLOT PACK 1720/1770/1821/1868 JL 28328932-28329150); no FRESH abort on the fired 14:40 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bearish 14:20 (B196DIV PACK 1925 JL 28329249 latch=0; B182DEC div=-1 kind=regular dbar=14:20 PACK 1934; D130LATCH verdict=-1 oppPassed=2 oppBar=14:00 PACK 1924 JL 28329248). Confirmation 14:35 touchAttr=1 confirm=0 (POLL PACK 1863 JL 28329132); 14:40 touchAttr=1 confirm=1 (POLL PACK 1911 JL 28329206).
- (g) Exit: take-profit touch at the booked 1.33630, MTEXIT bar=17:00 reason=TP_TOUCH entry=1.33863 exit=1.33649 (PACK 3237 JL 28331197); deal 17:03 1.33649 (PACK 3190 JL 28331138). His exit is the Weekly-VWAP value (register section F note; exit defect open).

### GBPUSD London 2026-07-21 09:25 buy 1.34498 - register NEW
- (a) Entry line Weekly-VWAP 1.34474 at the 09:15 retest (B201FROM PACK 266 JL 28492706; WINLINE PACK 103 JL 28491015 val=1.34474). Retest 09:15 o=1.34481 h=1.34488 l=1.34459 c=1.34475 (B196BAR PACK 199 JL 28491624): wick 15pts through - reached. Side tag at confirmation: Weekly-VWAP=LHIT (UJDTTERMS PACK 243 JL 28492159, bar=09:20).
- (b) 4H BEAR, 1H BULL, 15m BULL, 5m BULL (ht=-1/1/1|1.0).
- (c) Trend following (B182DEC PACK 262 JL 28492696); votes=2 trendOk=1 (REGIMECENSUS PACK 106/202 JL 28491027/28491636); sw=NOTREACHED.
- (d) Zone XOB 1.34364-1.34375 promo 08:05 (B201FROM zn); formation/mid NOT PRINTED (tags B162ORIGIN/B182MID). INPLAYCOMMIT committed=0 all polls; B177HZ PASS gapTouch=1.0 (PACK 255 JL 28492185). Side: whole zone below the 1.34413 stop - far side.
- (e) HISZONE_NONE abort at 09:15 for the 09:05 seed (B196SLOT PACK 160 JL 28491579, other seed); no FRESH abort on the fired 09:15 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bullish 09:00 (B196DIV PACK 253 JL 28492183 latch=0; B182DEC div=1 kind=regular dbar=09:00 PACK 262; D130LATCH verdict=1 oppPassed=-1 oppBar=08:40 PACK 252 JL 28492182). Confirmation 09:10 touchAttr=1 confirm=1 same-bar (POLL PACK 149 JL 28491553); 09:20 touchAttr=1 confirm=1 (POLL PACK 245 JL 28492161). B60C BOTH (PACK 251 JL 28492178).
- (g) Exit: the 10:10 candle broke the Weekly-POC; MTEXIT bar=10:10 reason=POI_BODY_BREAK line=Weekly-POC lineVal=1.34488 entry=1.34492 exit=1.34485 src=OWNBODY (PACK 673 JL 28493183); deal 10:15 1.34485 (PACK 674 JL 28493185).

### GBPUSD London 2026-07-29 10:15 sell 1.32966 - register NEW
- (a) Entry line Weekly-POC 1.32997 at the 09:10 retest (B201FROM PACK 654 JL 28606613; WINLINE PACK 586 JL 28605375 val=1.32997). Retest 09:10 o=1.32983 h=1.33018 l=1.32969 c=1.33017 (B196BAR PACK 138 JL 28604834): wick 21pts through - reached. Side tag at confirmation: Weekly-POC=Lbody-below/Sno-penetration (UJDTTERMS PACK 634 JL 28605967, bar=10:10).
- (b) 4H BEAR, 1H BULL, 15m BEAR, 5m BEAR (ht=-1/1/-1|-1.0).
- (c) Trend following (B182DEC PACK 650 JL 28606603); votes=2 trendOk=1 (REGIMECENSUS PACK 587 JL 28605376); sw=NOTREACHED.
- (d) Zone XOB 1.32969-1.33018 promo 09:30 (B201FROM zn); B182MID mid=1.32993 kill=1.32993 (PACK 290 JL 28605019); formation NOT PRINTED (tag B162ORIGIN). INPLAYCOMMIT at 10:10 reads a different zone 1.32948-1.32988 (PACK 593 JL 28605400) - the pick's own commit NOT PRINTED; B177HZ PASS xobWin=1.0 (PACK 643 JL 28605983). B60C BOTH (PACK 639 JL 28605978). Side: zone top 1.33018 under the 1.33039 stop - between entry and stop.
- (e) No FRESH abort on the fired 10:05 seed path in the cuts; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bearish 10:05 (B196DIV PACK 641 JL 28605981 latch=1; D130LATCH verdict=-1 oppPassed=2 oppBar=09:55 PACK 640 JL 28605980). Confirmation 10:05 touchAttr=1 confirm=0 (POLL PACK 583 JL 28605371); 10:10 touchAttr=1 confirm=1 (POLL PACK 636 JL 28605969).
- (g) Exit: stop, MTEXIT bar=10:35 reason=SL entry=1.32966 exit=1.33039 (PACK 885 JL 28606889); deal 10:33 1.33039 (PACK 789 JL 28606780).

### GBPUSD London 2026-08-12 11:10 buy 1.35085 - register NEW
- (a) Entry line Weekly-POC 1.35067 at the 09:05 retest (B201FROM PACK 1312 JL 28806446). Retest 09:05 o=1.35049 h=1.35054 l=1.35042 c=1.35045 (B196BAR PACK 149 JL 28794570): high 13pts short of the line - NOT reached (B60C cSrc=PRIOR PACK 1294 JL 28805706). Side tag at confirmation: Weekly-POC=LHIT (UJDTTERMS PACK 1289 JL 28805696, bar=11:05).
- (b) 4H BEAR, 1H BULL, 15m BULL, 5m BULL (ht=-1/1/1|1.0).
- (c) Trend following (B182DEC PACK 1305 JL 28806433); votes=1 trendOk=0 until 10:05 votes=2 trendOk=1 (REGIMECENSUS PACK 153-747 JL 28794583-28797792); sw=NOTREACHED. FOMC states present in the rows (post-29-July anchor live).
- (d) Zone XOB 1.35004-1.35030 promo 01:05 (B201FROM zn); formation/mid NOT PRINTED (tags B162ORIGIN/B182MID). INPLAYCOMMIT NOT PRINTED for the pick in the extract; B177HZ PASS gapTouch=1.0 (PACK 1298 JL 28805711). Side: whole zone below the 1.35042 stop - far side.
- (e) RESEEDs on other seeds (B196SLOT PACK 283/439 JL 28794737/28795555); no FRESH abort on the fired 10:55 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bullish 10:55 (B196DIV PACK 1296 JL 28805709 latch=1; D130LATCH verdict=2 oppPassed=-1 oppBar=10:00 PACK 1295 JL 28805708). Confirmation 11:00 touchAttr=1 confirm=0 (POLL PACK 1247 JL 28805041); 11:05 touchAttr=1 confirm=1 (POLL PACK 1291 JL 28805698).
- (g) Exit 12:04 1.35156 per deal (PACK 1800 JL 28807005); rule, line and candle NOT PRINTED (no MTEXIT row in the cut; tag MTEXIT).

### GBPUSD New York 2026-08-25 17:05 sell 1.36372 - register NEW
- (a) Entry line Monthly-POC 1.36432 at the 16:00 retest (B201FROM PACK 3312 JL 29052812). Retest 16:00 o=1.36354 h=1.36371 l=1.36339 c=1.36359 (B196BAR PACK 2708 JL 29042989): high 61pts short of the line - NOT reached (B60C cSrc=PRIOR PACK 3295 JL 29051991). Side tag at confirmation: Monthly-POC=Lbody-below/SHIT (UJDTTERMS PACK 3280 JL 29051958, bar=17:00).
- (b) 4H BULL, 1H BULL, 15m BULL, 5m BEAR (ht=1/1/1|-1.0).
- (c) Trend following at fire (B182DEC reg=TREND PACK 3307 JL 29052799). Reason: regime prints sweepTag=3 mrOk=1 (mean-reversal verdict PRINTED) with trendOk=0 at 14:00-15:50 (REGIMECENSUS PACK 1630/2224/2610 JL 29038244/29039616/29042847); no REGIMECENSUS row printed at the 17:00 seed; no fresh sweep counted (sw=NOTREACHED). Only take in 38 with mrOk=1 on any row.
- (d) Zone XOB 1.36513-1.36576 promo 21st 15:40 (B201FROM zn); formation/mid NOT PRINTED (tags B162ORIGIN/B182MID). INPLAYCOMMIT at 17:00 reads a different zone 1.36309-1.36347 none (PACK 3241 JL 29051222) - the pick's own commit NOT PRINTED; B177HZ PASS xobWin=1.0 (PACK 3300 JL 29052001). Side: the 1.36528 stop sits inside the zone - straddles the stop.
- (e) R2 VOID at 14:05 and DIV_FALLBACK aborts at 15:35/15:55 on earlier Daily-POC seeds (B196SLOT PACK 1684/2427/2621 JL 29039005/29042630/29042880); no FRESH abort on the fired 17:00 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bearish 16:10 (B196DIV PACK 3298 JL 29051999 latch=0; B182DEC div=-1 kind=regular dbar=16:10 PACK 3307; D130LATCH verdict=-1 oppPassed=2 oppBar=15:30 PACK 3297 JL 29051998). Earlier hidden-bullish prints 15:10/15:30 latch=0 (PACK 2425/2619 JL 29042626/29042876).
- (g) Exit 22:54 1.36528 per deal (PACK 6419 JL 29056293); rule, line and candle NOT PRINTED (no MTEXIT row in the cut; tag MTEXIT).

### GBPUSD New York 2026-08-28 15:10 sell 1.35829 - register NEW
- (a) Entry line Daily-POC 1.35853 at the 15:00 retest (B201FROM PACK 2565 JL 29133712; WINLINE PACK 2490 JL 29131943 val=1.35853). Retest 15:00 o=1.35849 h=1.35858 l=1.35841 c=1.35852 (B196BAR PACK 2489 JL 29131942): wick 5pts through - reached. Side tag at confirmation: Daily-POC=Lbody-below/SHIT (UJDTTERMS PACK 2545 JL 29132744, bar=15:05).
- (b) 4H BEAR, 1H BULL, 15m BEAR, 5m BEAR (ht=-1/1/-1|-1.0).
- (c) Trend following (B182DEC PACK 2561 JL 29133702); votes=2 trendOk=1 sweepTag=4 mrOk=0 (REGIMECENSUS PACK 2493 JL 29131955); sw=NOTREACHED.
- (d) Zone XOB 1.35909-1.35932 promo 10:05 (B201FROM zn); B182MID mid=1.35921 kill=1.35921 (PACK 740 JL 29121747); formation NOT PRINTED (tag B162ORIGIN). INPLAYCOMMIT SWING committed=1 (PACK 2499 JL 29131976); B177HZ PASS xobWin=1.0 (PACK 2554 JL 29132759). B60C BOTH (PACK 2550 JL 29132754). Side: the 1.35917 stop sits inside the zone - straddles the stop.
- (e) FRESH_OB_DEAD abort at 14:50 for the opposite-side LONG seed (B196SLOT PACK 2330 JL 29131720, other side); no FRESH abort on the fired 15:00 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bearish 15:00 (B196DIV PACK 2552 JL 29132757 latch=1; D130LATCH verdict=-2 oppPassed=1 oppBar=14:20 PACK 2551 JL 29132756). Confirmation 15:00 touchAttr=1 confirm=0 (POLL PACK 2488 JL 29131941); 15:05 touchAttr=1 confirm=1 (POLL PACK 2547 JL 29132746).
- (g) Exit rows disagree and are carried both: MTEXIT bar=17:00 reason=SL entry=1.35829 exit=1.35917 (PACK 3802 JL 29135085) vs deal 17:00 buy at 1.35694 (PACK 3730 JL 29134999, profit side) - UNRECONCILED on rows, 22pts apart, never smoothed.

### GBPUSD New York 2026-09-04 14:50 buy 1.35348 - register NEW
- (a) Entry line Daily-VWAP 1.35322 at the 14:40 retest (B201FROM PACK 2188 JL 29270574; B200POT px=1.35322 PACK 2115 JL 29268850). Retest 14:40 o=1.35342 h=1.35349 l=1.35318 c=1.35341 (B196BAR PACK 2113 JL 29268846): wick 4pts through - reached. Side tag at confirmation: Daily-VWAP=Lno-penetration/Sbody-above (UJDTTERMS PACK 2168 JL 29269688, bar=14:45).
- (b) 4H BULL, 1H BEAR, 15m BULL, 5m BULL (ht=1/-1/1|1.0).
- (c) Trend following (B182DEC PACK 2184 JL 29270564); votes=2 trendOk=1 (REGIMECENSUS PACK 1795/2117 JL 29267706/29268859); sw=NOTREACHED.
- (d) Zone XOB 1.35310-1.35335 promo 14:20 (B201FROM zn); B182MID mid=1.35323 kill=1.35323 (PACK 1940 JL 29268652); formation NOT PRINTED (tag B162ORIGIN). INPLAYCOMMIT BAR committed=1 (PACK 2123 JL 29268880); B177HZ PASS xobWin=1.0 (PACK 2177 JL 29269702). B60C BOTH xt=1 (PACK 2173 JL 29269697). Side: zone bottom equals the 1.35310 stop - between entry and stop.
- (e) HISZONE_NONE abort at 14:15 for the 14:05 seed (B196SLOT PACK 1856 JL 29268557, other seed); no FRESH abort on the fired 14:40 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bullish 14:40 (B196DIV PACK 2175 JL 29269700 latch=1; D130LATCH verdict=2 oppPassed=-1 oppBar=14:10 PACK 2174 JL 29269699; earlier hidden-bullish 13:25 latch=0 PACK 1853 JL 29268553). Confirmation 14:40 touchAttr=1 confirm=0 (POLL PACK 2112 JL 29268845); 14:45 touchAttr=1 confirm=1 (POLL PACK 2170 JL 29269690).
- (g) Exit: stop at the Daily-POC, MTEXIT bar=15:05 reason=SL line=Daily-POC lineVal=1.35315 entry=1.35344 exit=1.35310 (PACK 2401 JL 29270825); deal 15:06 1.35310 (PACK 2347 JL 29270765).

## USDJPY: 9 takes

### USDJPY London 2026-06-03 09:10 buy 159.932 - register C-06-03
- (a) Entry line Daily-VWAP 159.907 at the 09:00 retest (B201FROM PACK 136 JL 30989883; WINLINE PACK 68 JL 30989445 val=159.907). Retest 09:00 o=159.927 h=159.927 l=159.905 c=159.910 (B196BAR PACK 67 JL 30989444): wick 2pts through - reached. Side tag at confirmation: Daily-VWAP=LHIT (UJDTTERMS PACK 116 JL 30989671, bar=09:05).
- (b) 4H BULL, 1H BEAR, 15m BULL, 5m BULL (ht=1/-1/1|1.0).
- (c) Trend following (B182DEC PACK 132 JL 30989872); votes=2 trendOk=1 (REGIMECENSUS PACK 71 JL 30989457); sw=NOTREACHED.
- (d) Zone XOB 159.906-159.913 promo 09:00 (B201FROM zn); B182MID mid=159.910 kill=159.910 (PACK 58 JL 30989430); formation NOT PRINTED (tag B162ORIGIN). INPLAYCOMMIT BAR committed=1 (PACK 77 JL 30989479); B177HZ PASS gapTouch=1.0 xobWin=1.0 (PACK 125 JL 30989687). B60C BOTH (PACK 121 JL 30989682). Side: zone bottom 159.906 above the 159.889 stop - between entry and stop.
- (e) No FRESH abort on the fired 09:00 seed path in the cuts; FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bullish 09:00 (B196DIV PACK 123 JL 30989685 latch=1; D130LATCH verdict=2 oppPassed=-2 oppBar=08:55 PACK 122 JL 30989684). Confirmation 09:00 touchAttr=0 confirm=0 (POLL PACK 66 JL 30989443); 09:05 touchAttr=1 confirm=1 (POLL PACK 118 JL 30989673).
- (g) Exit: take-profit, MTEXIT bar=09:55 reason=TP_TOUCH entry=159.929 exit=159.983 (PACK 527 JL 30990337); deal 09:59 159.983 (PACK 485 JL 30990288).

### USDJPY New York 2026-06-05 16:15 buy 160.065 - register B2
- (a) Entry line Monthly-POC 159.885 at the 16:00 retest (B201FROM PACK 2892 JL 31024732). Retest 16:00 o=160.216 h=160.262 l=159.726 c=160.034 (B196BAR PACK 2766 JL 31024018): range contains the line - reached (B60C cSrc=RETEST xt=1 PACK 2872 JL 31024329). Side tag at confirmation: Monthly-POC=Lno-penetration/Sbody-above (UJDTTERMS PACK 2864 JL 31024309, bar=16:10).
- (b) 4H BULL, 1H BULL, 15m BULL, 5m BULL (ht=1/1/1|1.0).
- (c) Trend following (B182DEC PACK 2883 JL 31024716); votes=1 trendOk=0 until 15:45 votes=2 trendOk=1, 16:05 votes=3 (REGIMECENSUS PACK 2379-2819 JL 31023056-31024089); sw=NOTREACHED.
- (d) Zone XOB 159.881-159.916 promo 15:40 (B201FROM zn); B182MID mid=159.899 kill=159.899 (PACK 2554 JL 31023268); formation NOT PRINTED (tag B162ORIGIN). INPLAYCOMMIT committed=0 all polls; B177HZ PASS xobWin=1.0 (PACK 2876 JL 31024336). Side: zone bottom 159.881 above the 159.598 stop - between entry and stop.
- (e) LTF_MISALIGN abort at 16:05 for the 15:20 seed (B196SLOT PACK 2772 JL 31024028, other seed); no FRESH abort on the fired 16:00 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bullish 16:00 (B196DIV PACK 2874 JL 31024334 latch=1; D130LATCH verdict=1 oppPassed=-1 oppBar=15:55 PACK 2873 JL 31024333). Confirmation 15:55 touchAttr=1 confirm=0 (POLL PACK 2703 JL 31023774); 16:05 touchAttr=1 confirm=0 (POLL PACK 2816 JL 31024086); 16:10 touchAttr=0 confirm=0 (POLL PACK 2866 JL 31024311) - fired on the retest carry (B60C RETEST, B201TO tc=C_TOUCH PACK 2893 JL 31024734).
- (g) Exit 19:16 160.298 per deal (PACK 4528 JL 31026565, closed NY AM session-high retarget per register section B note); rule, line and candle NOT PRINTED (no MTEXIT row in the cut; tag MTEXIT).

### USDJPY New York 2026-06-11 14:40 buy 160.530 - register B3
- (a) Entry line Daily-POC 160.523 at the 14:05 retest (B201FROM PACK 2291 JL 31089124). Retest 14:05 o=160.515 h=160.534 l=160.514 c=160.527 (B196BAR PACK 1957 JL 31087868): range contains the line - reached. Side tag at confirmation: Daily-POC=LHIT (UJDTTERMS PACK 2265 JL 31088786, bar=14:35).
- (b) 4H BULL, 1H BULL, 15m BEAR, 5m BULL (ht=1/1/-1|1.0).
- (c) Trend following (B182DEC PACK 2286 JL 31089112); votes=2 trendOk=1 (REGIMECENSUS PACK 2111 JL 31088050); sw=NOTREACHED.
- (d) Zone XOB 160.489-160.504 promo 08:30 (B201FROM zn); formation/mid NOT PRINTED (tags B162ORIGIN/B182MID). INPLAYCOMMIT committed=1 at 14:40 (PACK 2273 JL 31088808); B177HZ PASS xobWin=1.0 (PACK 2279 JL 31088824). B60C BOTH (PACK 2274 JL 31088813). Side: the 160.501 stop sits inside the zone - straddles the stop.
- (e) No FRESH abort on the fired 14:20 seed path in the cuts; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bullish 14:00 (B196DIV PACK 2277 JL 31088822 latch=0; B182DEC div=1 kind=regular dbar=14:00 PACK 2286; D130LATCH verdict=1 oppPassed=-1 oppBar=13:20 PACK 2276 JL 31088821). Confirmation 14:30 touchAttr=1 confirm=0 (POLL PACK 2215 JL 31088540); 14:35 touchAttr=1 confirm=1 (POLL PACK 2267 JL 31088788).
- (g) Exit: take-profit, MTEXIT bar=15:20 reason=TP_TOUCH entry=160.524 exit=160.587 (PACK 2789 JL 31089688); deal 15:23 160.588 (PACK 2730 JL 31089619).

### USDJPY London 2026-06-15 10:50 buy 160.102 - register NEW
- (a) Entry line Monthly-VWAP 160.068 at the 09:00 retest (B201FROM PACK 1120 JL 31115585; WINLINE PACK 85/184/1047 JL 31111513/31111641/31115008 val=160.068). Retest 09:00 o=160.049 h=160.077 l=160.044 c=160.047 (B196BAR PACK 84 JL 31111512): range contains the line - reached. Side tag at confirmation: Monthly-VWAP=Lno-penetration/Sbody-above (UJDTTERMS PACK 1097 JL 31115294, bar=10:45).
- (b) 4H BULL, 1H BULL, 15m BULL, 5m BULL (ht=1/1/1|1.0).
- (c) Trend following (B182DEC PACK 1116 JL 31115575); votes=2-3 trendOk=1 (REGIMECENSUS PACK 185/806/1048 JL 31111642/31114503/31115009); sw=NOTREACHED.
- (d) Zone XOB 159.999-160.027 promo 09:00 (B201FROM zn); B182MID mid=160.013 kill=160.013 (PACK 75 JL 31111498); formation NOT PRINTED (tag B162ORIGIN). INPLAYCOMMIT SWING committed=1 at 10:50 (PACK 1104 JL 31115311; a different zone read none at 10:45); B177HZ PASS xobWin=1.0 (PACK 1109 JL 31115321). B60C BOTH (PACK 1105 JL 31115315). Side: whole zone below the 160.044 stop - far side.
- (e) LTF_MISALIGN aborts at 10:05/10:25 on earlier seeds (B196SLOT PACK 669/862 JL 31114344/31114798); no FRESH abort on the fired 10:40 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bullish 10:15 (B196DIV PACK 1107 JL 31115319 latch=0; B182DEC div=1 kind=regular dbar=10:15 PACK 1116; D130LATCH verdict=1 oppPassed=-2 oppBar=09:55 PACK 1106 JL 31115318). Confirmation 10:40 touchAttr=0 confirm=0 (POLL PACK 1044 JL 31115004); 10:45 touchAttr=1 confirm=1 (POLL PACK 1099 JL 31115296).
- (g) Exit: take-profit, MTEXIT bar=14:20 reason=TP_TOUCH entry=160.100 exit=160.159 (PACK 3196 JL 31118161); deal 14:23 160.159 (PACK 3144 JL 31118103).

### USDJPY New York 2026-06-22 15:55 buy 161.744 - register NEW
- (a) Entry line Weekly-POC 161.736 at the 14:00 retest (B201FROM PACK 2964 JL 31209113; WINLINE PACK 1808/2213/2774 JL 31206682/31207158/31207786 line=Daily-POC val=161.736 conjoined). Retest 14:00 o=161.725 h=161.744 l=161.711 c=161.723 (B196BAR PACK 1807 JL 31206681): range contains the line - reached (B60C cSrc=RETEST PACK 2948 JL 31208765). Side tag at confirmation: Weekly-POC=LHIT (UJDTTERMS PACK 2943 JL 31208754, bar=15:50).
- (b) 4H BULL, 1H BULL, 15m BULL, 5m BULL (ht=1/1/1|1.0).
- (c) Trend following (B182DEC PACK 2959 JL 31209101); votes=3 trendOk=1 (REGIMECENSUS PACK 2776 JL 31207788); sw=NOTREACHED.
- (d) Zone XOB 161.707-161.740 promo 15:00 (B201FROM zn); B182MID mid=161.724 kill=161.724 (PACK 2406 JL 31207373); formation NOT PRINTED (tag B162ORIGIN). B177HZ PASS gapTouch=1.0 xobWin=1.0 (PACK 2952 JL 31208770). Side: the 161.721 stop sits inside the zone - straddles the stop.
- (e) No FRESH abort on the fired 15:35 seed path in the cuts; FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bullish 15:30 (B196DIV PACK 2950 JL 31208768 latch=0; B182DEC div=2 kind=hidden dbar=15:30 PACK 2959; D130LATCH verdict=2 oppPassed=-2 oppBar=14:55 PACK 2949 JL 31208767). Confirmation 15:45 touchAttr=1 confirm=0 (POLL PACK 2890 JL 31208441); 15:50 touchAttr=1 confirm=1 (POLL PACK 2945 JL 31208756).
- (g) Exit: take-profit, MTEXIT bar=16:00 reason=TP_TOUCH entry=161.741 exit=161.786 (PACK 3081 JL 31209257); deal 16:01 161.787 (PACK 3022 JL 31209189).

### USDJPY New York 2026-06-23 16:05 sell 161.550 - register NEW
- (a) Entry line Weekly-POC 161.563 at the 15:55 retest (B201FROM PACK 3100 JL 31224649). Retest 15:55 o=161.554 h=161.562 l=161.536 c=161.555 (B196BAR PACK 3006 JL 31223939): high 1pt short of the line - NOT reached, marginal 1pt (B60C cSrc=PRIOR PACK 3083 JL 31224334). Side tag at confirmation: Weekly-POC=Lbody-below/Sbody-above (UJDTTERMS PACK 3069 JL 31224300, bar=16:00).
- (b) 4H BULL, 1H BULL, 15m BULL, 5m BEAR (ht=1/1/1|-1.0).
- (c) Trend following (B182DEC PACK 3095 JL 31224635); latest regime rows: votes=0 trendOk=0 at 15:05-15:40 (REGIMECENSUS PACK 2470-2836 JL 31223007-31223460), no later REGIMECENSUS printed; sw=NOTREACHED.
- (d) Zone XOB 161.577-161.602 promo 15:10 (B201FROM zn); B182MID mid=161.589 kill=161.589 (PACK 2513 JL 31223054); formation NOT PRINTED (tag B162ORIGIN). INPLAYCOMMIT none at 16:00, BAR committed=1 at 16:05 (PACK 3016/3082 JL 31223976/31224330); B177HZ PASS gapTouch=1.0 xobWin=1.0 (PACK 3088 JL 31224344). Side: zone bottom 161.577 under the 161.613 stop - between entry and stop.
- (e) RESEED H1 at 15:15 and FRESH_OPP_FVG abort at 15:20 for the LONG seed (B196SLOT PACK 2519/2579 JL 31223065/31223156, other side/seed); RESEED at 15:45 (PACK 2882 JL 31223513); no FRESH abort on the fired 16:00 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bearish 13:45 (B196DIV PACK 3086 JL 31224342 latch=0; B182DEC div=-2 kind=hidden dbar=13:45 PACK 3095; D130LATCH verdict=-2 walkShift=28 oppPassed=1 oppBar=13:35 PACK 3085 JL 31224341).
- (g) Exit 20:21 161.613 per deal (PACK 5934 JL 31227802, stop side); rule, line and candle NOT PRINTED (no MTEXIT row in the cut; tag MTEXIT).

### USDJPY London 2026-07-23 09:20 buy 163.089 - register NEW
- (a) Entry line Daily-VWAP 163.075 at the 09:10 retest (B201FROM PACK 326 JL 31671303; WINLINE PACK 235 JL 31670119 val=163.075). Retest 09:10 o=163.102 h=163.102 l=163.072 c=163.076 (B196BAR PACK 234 JL 31670118): wick 3pts through - reached. Side tag at confirmation: Daily-VWAP=Lno-penetration/Sbody-above (UJDTTERMS PACK 306 JL 31670663, bar=09:15).
- (b) 4H BULL, 1H BULL, 15m BULL, 5m BULL (ht=1/1/1|1.0).
- (c) Trend following (B182DEC PACK 322 JL 31671292); votes=3 trendOk=1 (REGIMECENSUS PACK 239 JL 31670132); sw=NOTREACHED.
- (d) Zone XOB 162.674-163.133 promo 22nd 17:30 (B201FROM zn); formation/mid NOT PRINTED (tags B162ORIGIN/B182MID). INPLAYCOMMIT BAR committed=1 (PACK 245 JL 31670153); B177HZ PASS xobWin=1.0 (PACK 315 JL 31670678). B60C BOTH xt=1 (PACK 311 JL 31670673). Side: the 163.066 stop sits inside the wide zone - straddles the stop.
- (e) No FRESH abort on the fired 09:10 seed path in the cuts; FRESHCOUNT NOT PRINTED.
- (f) Latched hidden-bullish 09:00 (B196DIV PACK 313 JL 31670676 latch=0; B182DEC div=2 kind=hidden dbar=09:00 PACK 322; D130LATCH verdict=2 oppPassed=-1 oppBar=07:45 PACK 312 JL 31670675). Confirmation 09:10 touchAttr=0 confirm=0 (POLL PACK 233 JL 31670117); 09:15 touchAttr=1 confirm=1 (POLL PACK 308 JL 31670665).
- (g) Exit: the 09:30 candle broke the Daily-POC; MTEXIT bar=09:30 reason=POI_BODY_BREAK line=Daily-POC lineVal=163.071 entry=163.087 exit=163.075 src=NEXTOPEN (PACK 531 JL 31671535); deal 09:35 163.075 (PACK 532 JL 31671537).

### USDJPY New York 2026-08-05 16:30 sell 157.542 - register NEW
- (a) Entry line Daily-POC 157.631 at the 16:20 retest (B201FROM PACK 1864 JL 31899241). Retest 16:20 o=157.566 h=157.647 l=157.561 c=157.617 (B196BAR PACK 1809 JL 31897929): wick 16pts through - reached. Side tag at confirmation: Daily-POC=Lbody-below/Sno-penetration (UJDTTERMS PACK 1844 JL 31898588, bar=16:25).
- (b) 4H BULL, 1H BEAR, 15m BEAR, 5m BEAR (ht=1/-1/-1|-1.0).
- (c) Trend following (B182DEC PACK 1860 JL 31899231); votes=2 trendOk=1 (REGIMECENSUS PACK 1632/1701/1812 JL 31897077/31897777/31897941); sw=NOTREACHED.
- (d) Zone XOB 157.728-157.771 promo 14:05 (B201FROM zn); B182MID mid=157.750 kill=157.750 (PACK 1155 JL 31896489); formation NOT PRINTED (tag B162ORIGIN). INPLAYCOMMIT SWING committed=1 (PACK 1817 JL 31897962); B177HZ PASS gapTouch=1.0 (PACK 1853 JL 31898602). B60C BOTH (PACK 1849 JL 31898597). Side: zone top equals the 157.771 stop - between entry and stop.
- (e) LTF_MISALIGN abort at 16:00 for the 15:50 FOMC-POC seed (B196SLOT PACK 1669 JL 31897736, other seed - a FOMC-anchored seed existed) and S54_POI_BREAK abort at 16:05 (PACK 1709 JL 31897805); no FRESH abort on the fired 16:20 seed path; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bearish 16:20 (B196DIV PACK 1851 JL 31898600 latch=1; D130LATCH verdict=-1 oppPassed=1 oppBar=15:20 PACK 1850 JL 31898599). Confirmation 16:20 touchAttr=0 confirm=0 (POLL PACK 1808 JL 31897928); 16:25 touchAttr=1 confirm=1 (POLL PACK 1846 JL 31898590).
- (g) Exit: the 18:45 candle broke the Weekly-POC; MTEXIT bar=18:45 reason=POI_BODY_BREAK line=Weekly-POC lineVal=157.604 entry=157.542 exit=157.649 src=OWNBODY (PACK 2779 JL 31900325); deal 18:50 157.651 (PACK 2780 JL 31900327).

### USDJPY New York 2026-09-01 18:40 buy 160.082 - register NEW
- (a) Entry line Monthly-POC 160.074 at the 17:55 retest (B201FROM PACK 3045 JL 32316713; WINLINE PACK 2692/2986 JL 32310227/32315080 val=160.074). Retest 17:55 o=160.041 h=160.090 l=160.041 c=160.074 (B196BAR PACK 2691 JL 32310226): range contains the line - reached. Side tag at confirmation: Monthly-POC=LHIT (UJDTTERMS PACK 3024 JL 32315875, bar=18:35).
- (b) 4H BULL, 1H BULL, 15m BULL, 5m BULL (ht=1/1/1|1.0).
- (c) Trend following (B182DEC PACK 3040 JL 32316702); votes=2 trendOk=1 (REGIMECENSUS PACK 2738 JL 32310292); sw=NOTREACHED.
- (d) Zone XOB 160.036-160.082 promo 18:30 (B201FROM zn); B182MID mid=160.059 kill=160.059 (PACK 2972 JL 32314316); formation NOT PRINTED (tag B162ORIGIN). B177HZ PASS xobWin=1.0 (PACK 3033 JL 32315891). Side: zone top equals the 160.082 entry, bottom above the 159.891 stop - between entry and stop.
- (e) No FRESH abort on the fired 18:00 seed path in the cuts; FRESHCOUNT NOT PRINTED.
- (f) Latched regular-bullish 17:25 (B196DIV PACK 3031 JL 32315889 latch=0; B182DEC div=1 kind=regular dbar=17:25 PACK 3040; D130LATCH verdict=1 walkShift=15 oppPassed=-1 oppBar=16:50 PACK 3030 JL 32315888). Confirmation 18:30 touchAttr=1 confirm=0 (POLL PACK 2983 JL 32315077); 18:35 touchAttr=1 confirm=1 (POLL PACK 3026 JL 32315877). B60C BOTH (PACK 3029 JL 32315886).
- (g) Exit 20:25 160.208 per deal (PACK 3874 JL 32317660); rule, line and candle NOT PRINTED (no MTEXIT row in the cut; tag MTEXIT).

## R0 - where the B-203 bias column came from
- The B-203 4H/1H/15m/5m column was read from UJBARMAP Monthly/Weekly/Daily POC prices plus ltf (CUT day-log rows, filtered from the packs; 4 June bar=09:15 mpoc=1.16490 wpoc=1.16490 dpoc=1.16089 ltf=1.0, day-log JL 24711322), never a bias. B201FROM ht carries direction votes (-1/0/1 + ltf) on all 38 takes above; UJPROBE carries the same h4/h1/m15/ltf per bar.
