# BUILDER SLICE B-158 - R0 script, R1 lines, R2 self-proof, R3 tables, R4 selector (kept 1617DC1A)

Runs: RECON62-B157 + JUNE0525-B157 (EA 1617DC1ACCE6B50ED2D1359582A70A8B8503C569623EE90C18C6B33542796207, Tester/logs/20261010.log lines 2542403-2828855 + 2828855+). Bars: EU 2880 (8/26-9/08), UJ 4032 (5/25-6/11) UJBARMAP first-seen.

## Part B quotes (strategy skill, disk line numbers)

- L60 (section 2) NO-OVERFIT: "i am not trying to overfit this test window by having the best result or 100 percent winrate, i want you to apply my rules as is although it is a losing trade such as on the 9/8 NY session".
- L99-100 (section 6) SETTLED-RULES-RIDE-EVERY-REFINEMENT + REFINEMENT-PHASE SCOPE: "with every refinement, do not disregard the old fundamental rules..."; "i have said this is the refinement phase, so do not make a big revision on the overall code logic."
- L204-205 NO-CASCADE: "when i reexplain a rule, i do not want the other rule to cascade to be also wrong."
- L222 XOB-ABSENCE-FIRST: 4 June XOB absence ranked the bigger defect. L227 0908-NY-XOB-0920: "EU 8 Sep NY short in play responsible XOB was at 9:20..."
- L231-232 OB-LEVEL-HIS: "the midline of it, is not really the 0.5 level... If the body closure of the candle is more extreme—higher or lower respectively—then the invalidation level is not at the 0.5."
- L236-237 O1 KILL-FIRST: "BUT FIRST MAKE THIS INVALID 4 JUNE SETUP TO BE GONE AND NOT EXECUTED BY THE EA." + O4 ENFORCED-TIGHTLY: "the trading logic is not enforced tightly by the code. it takes a trade without it knows the logic behind it such as the UJ 4th June and EU on 8 Sept NY..."

## R0 B-147 pool defect (b147_r3.ps1 raw; b147_r2.ps1: BARMAP scan 09:20-16:55, level 1.16255, FIRST-BEYOND = 09:20 formation only)

- b147_r3.ps1:74-75: `if ($which -eq 'EU') { $pool = @($euT | Where-Object { $_.barT -eq $bt -and $_.dir -eq $dir -and $_.promoted -eq '1' }) }`
- b147_r3.ps1:86-87: `$kb = OldKill $map $valW $confW $lvl $isBull` / `if ($kb -eq $null) { $kill = 'ALIVE' }`
- b147_r3.ps1:89: `$tch = FirstTouch $map $prW $confW $lo $hi` (OldKill :27 `if ($b -le $fromW ...) continue` = strictly after validation wall)
- TARGETS grep: objId 3293 = 0 rows / 1446 lines. INCREMENTAL 3293 = 7 rows: `XOBDIAG;1788859500;3293;S;1.16256000;1.16230000;1788859200;1788859800;NA;1;1;0;1788859800;NA;1.16243000` ... `XOBDIAG;1788860100;3293;S;...;1788860400;0;1;1;1788859800;1788860400;1.16243000` (promo 09:40, kill 09:40, first on barT-09:35 row). Verdict: ACCOUNTED (candidate filter; OLD test never runs for 3293 in R3).

## R1 raw lines (kept build)

- OrderblockMgr.mqh:37 `double mid = (obHigh + obLow) / 2.0;` :38-39 charter-9 comment (level IS pure midline) :40 `double invLevel = mid;` :62-70 NewOrderblock(mid, invLevel passed together).
- Replay kill :122 `if(ob.isActivated && ob.isValid && !didActivate)` :124-128 strict pair (`barClose < level` bull / `barClose > level` bear) :130-133 kill sets isValid=false, invalidationBar=replayBar.
- Live kill :500 `if(ob.isActivated && ob.isValid)` :502-506 same strict pair (liveClose) :509-512 guards (`wouldBeSameBarValInv`, `isCreationBar`) :514-515 kill.
- Count on the SAME event :575-588 (bullish/bearishOBInvalidationsThisBar += 1 inside kill block) :616-646 aggregation (CounterAggregationPass into bullish/bearishOBInvalidationCount, in-bias + opposing).
- BiasEngine.mqh:157-165 (opposing/in-bias counts read) :214-223 (doRenewal -> isDoubleOB=true :221) :264-299 (doStrongFlip -> isDoubleOB=true :276; weak -> false :281).
- Indicator publish :1236 `int xobIdx = SRJ_NearestPromotedOBIndex(g_s.currentBias);` :1242-1244 same-pointer zone+objId (Task 102) :1249-1254 promoTime same branch (Task 113); 2xOB export :1553 `g_buf2xOB[target] = (g_s.isDoubleOB ? 1.0 : 0.0);`
- Selector OrderblockMgr:1095-1103 (side match; :1098 must be XOB; :1099 still valid; :1100 still activated; :1102 `better = (bestIdx < 0) || (ob.startBar > bestStart)`).
- EA ZONEPICK :8982-8988 (haveFvg/haveXob + ZoneInPlay + downgrade) :9003-9004 FVG-first (`if(haveFvg){...} else if(haveXob){...}`); engineering-tiebreak comment :8971-8974.
- EA in-play :9013-9025 (bar + SWING1/2/SWINGLEG walk to stop ref).
- EA B129 XT :2551-2552 (uj60_tR/tP) :2558-2561 (uj129 zone+promo from buffers 22/23/33) :2566 (`uj129_promo < retestTime && retest range overlaps XOB`) :2569 (`touch || (tR && xt)`).
- EA B153 gate :206/:207 buffer 22/23 defines; :211-214 buffers 48/49/50 defines; :9833-9836 trade-direction buffer read; :9827 zoneSrc idiom comment; :10790 buffer-50 2xOB read.
- HTF SRJ_HTFEngine.mqh:191-192 (`rc[j] < level` bull / `rc[j] > level` bear on HTF records). Spec 1.1 L47 (LTF bias driven by OB invalidation counts).
- Deciding: SHARED (same objects, same line; one event invalidates + counts; no separate bias copy).

## R2 self-proof rows

- R2a lineage: kept indicator 1009A4EFEA10D96D7AEAFF26E3489ED80F40C891940D783D77EF34331C9FF6BF; export build .B101FULLWINDOW 45682CAB1666773D8C02D315D8ED0FA5B0DC8E985B502B862AE2640BFC332E55; normalized diff 124+/104- in header/decl/OnInit/OnDeinit/export regions, zero lifecycle-keyword +/- lines; pass calls identical (A:1121-1153 vs kept:1047-1079); OrderblockMgr live = .preB150 = 5D14FCE25D18A1ED6BF5053584071FDAB7090FC7D9D0130011E2C594C7C2B11F.
- 3293: promo 1788860400 (09:40) + kill 1788860400 (09:40) = B-144; first row barT 1788860100 (09:35 stamp rule).
- B-157 B152PR trade-direction verdicts (20261010.log): A1 bear=1; A2 bull=1 (bar 17:25); A3 bull=1 (15:50); A4 bull=1 (09:10); A5 bull=1 (16:35); A6 bear=1 (10:00); A7 bear=1 (16:50); B2 bull=1 (16:05); B3 bull=1 (14:30); C-06-03 bull=1 (09:00); C-06-04 bear=0 (09:45); C-05-27 bull=1 beside (15:25). 12/12 = B-153 R1.
- z1 zone-for-zone at A6 bar (09:55) S = {1389,1481,1484,1516,1704,1728,1784,2109,2149,2896} = R3 MID set + pre-window touchers; 2217 absent (promo-candle-only touch, exclusive bound); 3293 absent (MID-dead). No miss.

## R3 register table (sets: promoted + alive at C + touch in (promo, C]; pack lines INDEX_B157)

- A1 28 Aug 10:00 S conf W1:4577|4580 pick 2149: MID MET {1704,1728,1784,2109} OLD MET {1866,2109} HIS MET {1866,2054,2109}. 3293 n/a.
- A2 1 Sep 17:30 B conf W2:3815|3818 pick 2549: MID/OLD/HIS MET {2275,2286,2289,2549} (+975 MID only, pre-map formation).
- A3 4 Sep 15:55 B conf W2:9619|9622 pick 2793: MID/OLD MET {2722,2787,2792,2793} HIS +{2693,2740}.
- A4 7 Sep 09:15 B conf W3:129|132 pick 3130: MID/OLD MET 6 {2722,2787,2792,2793,3126,3130} HIS +{2693,2740}.
- A5 7 Sep 16:40 B conf W3:2026|2029 pick 3178: MID/OLD MET 10 HIS +{2693,2740} (12).
- A6 8 Sep 10:05 S conf W3:3234|3237 pick 2898: MID MET {1704,1728,1784,2109,2149,2896} OLD MET {1866,2109,2149,2896,3293} HIS MET {1866,2054,2109,2149,2896,3293}. 3293: MID NO, OLD YES, HIS YES (touch 09:45).
- A7 8 Sep 16:55 S conf W3:4587+4670|4590+4673 pick 2898: same sets as A6. 3293: MID NO, OLD YES, HIS YES.
- B2 5 Jun 16:10 B conf W2:11052|11055 pick 3308: MID 11 (incl 1405,2566) OLD/HIS 10 (1405 pre-map formation, UNGRADED). MET all.
- B3 11 Jun 14:35 B conf W3:9956+9957|9960 pick 3913: MID 18 / OLD/HIS 17 (1405 UNGRADED). MET all.
- C-06-03 3 Jun 09:05 B conf W2:4406|4409 pick 2930: MID 8 (incl 1405) OLD/HIS 7. 2566 correctly absent (first touch 11:30 > C). MET all.
- C-06-04 4 Jun 09:50 S conf W2:7018|7021|7022 pick 3052 (alive all lines, untouched): MID/OLD/HIS NOT MET (empty). UNGRADED boundary: 6 pre-map S touchers (1720,1629,1748,1733,1558,1616, all MID-dead) whose OLD/HIS kills need pre-5/25 bars outside B-157 source.
- C-05-27 27 May 15:30 B conf W1:4705|4708 pick 2094: MID 6 / OLD 5 / HIS 6. Beside, never graded.
- OTHER-GATE (B-157 pack lines): B1 W2:9305+9411+9445+9507 SEEDBIAS_REFUSED; C-06-02 W2:3492 confirm=0; C-06-10 W3:7376|7377 S54KILL; C-08-27 W1:3704 confirm=0; C-09-01-1530 W2:3217|3220|3223 LTF_MISALIGN; C-09-04-1040 W2:8778 confirm=0; C-08-28-1625 W1:5971|5974|5977 TP_RR_FAIL; C-09-08-1645 W3:4593 TP_RR_FAIL.
- Verdicts: MID SEPARATES (unconditional). OLD SEPARATES graded-universe + 3293-in-A7 (boundary above). HIS SEPARATES (same boundary).
- Cascade: EU 1236 objs (1008 graded / 24 NOVAL / 204 NO-FORMATION) MID-OLD diff 35, MID-HIS 384; UJ 1672 (1461/23/188) diff 44/484.
- Named alive-where-MID-dead: 1866 S 1.16738-1.16723 f8/26 11:45 p8/26 12:00 kM8/26 15:15 kO/kH ALIVE; 2054 S 1.16578-1.16515 f8/27 17:05 p8/27 17:30 kM=kO8/28 04:35 kH ALIVE; 2693 B 1.15782-1.15749 f9/02 14:40 p9/02 15:25 kM=kO9/02 15:40 kH ALIVE; 2740 B 1.15878-1.15845 f9/02 21:40 p9/02 23:10 kM=kO9/03 00:00 kH ALIVE; 3293 S 1.16256-1.16230 f9/08 09:20 p9/08 09:40 kM9/08 09:40 kO=kH9/08 17:25; 2798 B 159.740-159.703 f6/02 12:25 p6/02 13:05 kM=kO6/02 13:50 kH6/03 10:40; 2120 B 159.351-159.306 f5/27 10:30 p5/27 10:55 kM=kO5/27 12:15 kH5/28 17:10. (All MID kills = machine invalT.)
- Pick census (arming/confirm alive M/O/H, vs MID): A1 2149 Y/Y/Y SAME/SAME; A2 2549 SAME/SAME; A3 2793 SAME/SAME; A4 3130 SAME/SAME; A5 3178 SAME/SAME; A6 2898 SAME/SAME; A7 2898 SAME/SAME; B2 3308 SAME/SAME; B3 3913 SAME/SAME; C-06-03 2930 SAME/SAME; C-06-04 3052 SAME/SAME; C-05-27 2094 SAME/SAME; B1 3160 SAME/SAME; C-06-10 3780 SAME/SAME; C-08-27 1891 SAME/SAME; C-09-01-1530 2289 SAME/SAME; C-09-08-1645 2898 SAME/SAME. 17/17 SAME.

## R4 selector lines

- Indicator:1227 comment (nearest valid+activated+promoted in-bias OB, ANY age) :1236 `SRJ_NearestPromotedOBIndex(g_s.currentBias)`; OrderblockMgr:1098-1103 (XOB + valid + activated filters, max startBar wins).
- Simulation on measured universe: A6/A7 MID -> 2898 (1.16362-1.16377, start 9/03 20:30) = machine pick; A6/A7 OLD/HIS -> 3293 (1.1623-1.16256, start 9/08 09:20). No newer qualifier (3296/3334 unpromoted; 3298 OLD-dead 16:00 at A7, unpromoted at A6; 3324 OLD-dead 15:30). FOUND.

## R5 conditions

- OLD: R0 MET; R1 NOT MET (SHARED); R3 MET-bounded + 3293-in-A7 MET; picks MET. Not a candidate.
- HIS: R0 MET; R1 NOT MET (SHARED); R3 MET-bounded + 3293-in-A7 MET; picks MET. Not a candidate.

(End of slice)
