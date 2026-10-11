# BUILDER SLICE B-174 - raw rows (touch-vs-promotion + latest-XOB on both roads; none separates)

Base: builder/B-173 head a51613a on builder/B-174. Gate per result (847 status, +6 skill lines ACCOUNTED + corrected, counts, SHAs, no terminal64). Kept B-170 packs (EA 794DD4B8) + Tester/logs/20261011.log. Relay skill: Day-log parsing section added post-B-170, working-tree-only (blob 98 lines/16507 B, disk 104/17672 B).

## Part B (verify-only)

- Skill L252 B2 2-July words ("if it's XOB from 16:20 why didn't it invalidated with the 17:40 candle closure over the midline invalidation, if its from the imbalance then it should not be valid since it is not an FVG"); L254-255 B4 ("I am saying the 2 july trade should not be executed or valid in the first place. wdym by 2405, which exact candle time is that?") + must-never consequence; L230-233 OB-LEVEL-HIS; L241-244 MOST-RECENT-XOB-TAG; L201-205 RETRACE-IS-IN-PLAY + NO-CASCADE.
- Spec 3.5 L131 ("Its zone, projected rightward from formation, has been penetrated by a bar's range or by a confirmed protective-side swing at any point within the current structural leg, and the XOB has not been invalidated."); 3.5.1 L147-152 (relevance -> retracement -> confirmation; unpromoted-at-confirmation invalid; promotion clears accumulated touch); 1.2 L54 (relevant = promoted).

## R1 walk text (EA:9426-9518, located by text `bool     t133_inPlay  = false;`)

- EA:9439 `if(haveXob && !haveFvg && s31_zHi > 0.0 && s31_zLo > 0.0)` gate; EA:9442 `t133_bounded = (t123_promoT > 0.0 && ...)`; EA:9469 `if(s3_haveStop)` live gate (EA:9468 superseded gate retained per P4); EA:9472 `if(t133_bounded) t133_bound = (datetime)t123_promoT;`; EA:9474-9475 `if(s31_barHi >= s31_zLo && s31_barLo <= s31_zHi) { t133_inPlay = true; t133_via = "BAR"; }`; EA:9480-9513 swing loop (EA:9484 `if(!s3_haveStop && t133_bt < t133_bound) break;` - dead under EA:9469, s3_haveStop never reassigned inside); EA:9506-9511 containment (`if(t133_v >= s31_zLo && t133_v <= s31_zHi)` + firstShift record EA:9509); EA:9515 `if(t133_hits > 0) t133_inPlay = true;`; EA:9518 `s31_inPlay = t133_inPlay;`; EA:9522-9542 INPLAYCOMMIT print (promoT/firstShift/firstVal/commitVia/committed); EA:9544 `if((haveFvg || haveXob) && s31_inPlay)` arm; EA:9630-9646 PREBIND jump (`CONFIRM_PREBIND` print EA:9640, no zone read).
- Verdict: NO - no line compares the penetrating candle's time to the promotion candle.

## R1 commit rows (pack:line + log file:line; touch = commit bar - firstShift x 5m)

- T0702: INPLAYCOMMIT `bar=2026.07.02 18:10 ... zoneLo=1.32815 zoneHi=1.32832 promoT=2026.07.02 07:00 ... firstShift=137 firstVal=1.32815 commitVia=SWING ... committed=1` (GBP0629-B170_W1:7044); XOBPROMO `xobId=2405 ... promoT=2026.07.02 07:00` (W1:7036); ZONEPICK `xob=1.32815-1.32832 haveFvg=0` (W1:7037); touch 06:45 `UJBARMAP bar=2026.07.02 06:45 o=1.32830 h=1.32832 l=1.32815 c=1.32823` (20261011.log:5044012); formation NOT PRINTED (origin=2405: 0 hits). AT-OR-BEFORE-PROMO.
- A2: INPLAYCOMMIT `bar=2026.09.01 17:30 ... zoneLo=1.15975 zoneHi=1.16013 promoT=2026.09.01 17:25 ... firstShift=7 firstVal=1.15980 commitVia=BAR ... committed=1` (RECON62-B170_W2:4577); XOBPROMO `xobId=2549 ... promoT=2026.09.01 17:25` (W2:4572); touch 16:55 `UJBARMAP bar=2026.09.01 16:55 o=1.15996 h=1.16022 l=1.15980 c=1.16009` (log:4050698); f16:45. AT-OR-BEFORE-PROMO.
- A3: INPLAYCOMMIT `bar=2026.09.04 15:35/15:40/15:45 ... zoneLo=1.15907 zoneHi=1.15933 promoT=2026.09.03 06:10 ... firstShift=-1 ... commitVia=BAR ... committed=1` (W2:11424/11474/11509); XOBPROMO `xobId=2793 ... promoT=2026.09.03 06:10` (W2:11422/11469/11507); BAR touch 15:35 `o=1.15946 h=1.16018 l=1.15914 c=1.15964` (log:4083923); f09-03 05:55. AFTER-PROMO.
- A4: INPLAYCOMMIT `bar=2026.09.07 09:00 ... zoneLo=1.16098 zoneHi=1.16109 promoT=2026.09.07 08:55 ... firstShift=4 firstVal=1.16098 commitVia=BAR ... committed=1` (W3:69); XOBPROMO `xobId=3130 ... promoT=2026.09.07 08:55` (W3:64); touch 08:40 `o=1.16106 h=1.16109 l=1.16098 c=1.16104` (log:4092876); f08:40. AT-OR-BEFORE-PROMO.
- A5: INPLAYCOMMIT `bar=2026.09.07 16:15 ... zoneLo=1.16229 zoneHi=1.16253 promoT=2026.09.07 15:30 ... firstShift=2 firstVal=1.16238 commitVia=BAR ... committed=1` (W3:2246); XOBPROMO `xobId=3178 ... promoT=2026.09.07 15:30` (W3:2241); touch 16:05 `o=1.16247 h=1.16251 l=1.16238 c=1.16245` (log:4097960); f14:50. AFTER-PROMO.
- A6: INPLAYCOMMIT `bar=2026.09.08 10:00 ... zoneLo=1.16230 zoneHi=1.16256 promoT=2026.09.08 09:40 ... firstShift=2 firstVal=1.16251 commitVia=SWING ... committed=1` (W3:3793); XOBPROMO `xobId=3293 ... promoT=2026.09.08 09:40` (W3:3788); touch 09:50 `o=1.16238 h=1.16251 l=1.16227 c=1.16232` (log:4106855); f09:20. AFTER-PROMO.
- A7: INPLAYCOMMIT `bar=2026.09.08 16:50 ... zoneLo=1.16230 zoneHi=1.16256 promoT=2026.09.08 09:40 ... firstShift=-1 ... commitVia=BAR ... committed=1` (W3:5584); XOBPROMO `xobId=3293 ... promoT=2026.09.08 09:40` (W3:5579); BAR touch 16:50 `o=1.16218 h=1.16233 l=1.16208 c=1.16225` (log:4111523); f09:20. AFTER-PROMO.
- B3: INPLAYCOMMIT `bar=2026.06.11 14:35 ... zoneLo=160.489 zoneHi=160.504 promoT=2026.06.11 08:30 ... firstShift=40 firstVal=160.501 commitVia=SWING ... committed=1` (JUNE0525-B170_W3:11710); XOBPROMO `xobId=3913 ... promoT=2026.06.11 08:30` (W3:11708); touch 11:15 `o=160.509 h=160.512 l=160.501 c=160.508` (log:4648464); f05:20. AFTER-PROMO.
- C-06-03: INPLAYCOMMIT `bar=2026.06.03 09:00 ... zoneLo=159.906 zoneHi=159.913 promoT=2026.06.03 09:00 ... firstShift=-1 ... commitVia=BAR ... committed=1` (W2:5335); XOBPROMO `xobId=2930 ... promoT=2026.06.03 09:00` (W2:5330); BAR touch 09:00 `o=159.927 h=159.927 l=159.905 c=159.910` (log:4564726); f08:45. AT-OR-BEFORE-PROMO (AT).
- C-05-27: INPLAYCOMMIT `bar=2026.05.27 15:25 ... zoneLo=159.190 zoneHi=159.208 promoT=2026.05.27 06:40 ... firstShift=97 firstVal=159.197 commitVia=SWING ... committed=1` (W1:5447); XOBPROMO `xobId=2094 ... promoT=2026.05.27 06:40` (W1:5442); touch 07:20 `o=159.213 h=159.213 l=159.197 c=159.208` (log:4506196); f06:20. AFTER-PROMO.
- T0707: INPLAYCOMMIT `bar=2026.07.07 14:40 ... zoneLo=1.33862 zoneHi=1.33936 promoT=2026.07.07 12:25 ... firstShift=1 firstVal=1.33895 commitVia=BAR ... committed=1` (W2:3777); XOBPROMO `xobId=2974 ... promoT=2026.07.07 12:25` (W2:3769); touch 14:35 `o=1.33878 h=1.33895 l=1.33862 c=1.33886` (log:5068854); f11:45. AFTER-PROMO.
- A1: no commit (XOBPROMO `xobId=2149 ... promoT=2026.08.28 06:40` W1:5500; INPLAYCOMMIT commitVia=none committed=0 class; XOBINPLAY `bar=2026.08.28 10:00 ... hits=0` log:427538). B2: INPLAYCOMMIT `bar=2026.06.05 16:10 ... zoneLo=159.881 zoneHi=159.916 promoT=2026.06.05 15:40 ... commitVia=none ... committed=0` (W2:13279); XOBPROMO `xobId=3308 ... promoT=2026.06.05 15:40` (W2:13277); XOBINPLAY `bar=2026.06.05 16:10 ... hits=0` (log:997930).

## R2 gate rows (B150GATE value=1.0 src=XOB at every deal pass; carries no zone/comeback)

- T0702 `B150GATE bar=2026.07.02 18:10 dir=LONG value=1.0 src=XOB forbar=2026.07.02 18:10` (W1:7049); B152PR summary `bar=2026.07.02 18:10 bull=1 bear=1 nz=9` (W1:7019); longs MET: 1582/1869/1875/1899/1909/1941/1943/2367 (z1 W1:7011-7018, e.g. 2367 promo 07-02 03:10 cbT 03:15); pick 2405: no z1 row (0 hits all packs).
- A1 `B150GATE bar=2026.08.28 10:00 dir=SHORT value=1.0 src=XOB forbar=2026.08.28 10:00` (W1:5506); pick 2149: no z1 row in 8/28 set (rides 2109 promo 05:05 cbT 05:55 W1:5492 + 8).
- B2 `B150GATE bar=2026.06.05 16:10 dir=LONG value=1.0 src=XOB forbar=2026.06.05 16:10` (W2:13283); pick 3308 z1 cbT 16:00 promo 15:40 (W2:13268).
- A2 gate (W2:4582); pick 2549 z1 cbT 17:30 promo 17:25 (W2:4562). A3 gate (W2:11575); pick 2793 z1 cbT 09-04 15:30 promo 09-03 06:10 (W2:11560). A4 gate (W3:171); pick 3130 z1 cbT 09:00 promo 08:55 (W3:159). A5 gate (W3:2417); pick 3178 z1 cbT 15:50 promo 15:30 (W3:2406). A6 gate (W3:3837); A7 gate (W3:5619); pick 3293 z1 cbT 09:45 promo 09:40 (W3:3820/5607). B3 gate (W3:11716); pick 3913 z1 cbT 10:05 promo 08:30 (W3:11696). C-05-27 gate (W1:5478); pick 2094 z1 cbT 06:50 promo 06:40 (W1:5467). C-06-03 gate (W2:5369); pick 2930 z1 cbT 09:05 promo 09:00 (W2:5357). T0707 gate (W2:3782); pick 2974 z1 cbT 12:30 promo 12:25 (W2:3752). Refused: 6/04 09:50 value=0.0 (W2:8529); 6/10 src=none. Every comeback after its promotion.
- What let T0702 pass: the direction scalar (bull=1), carried by the 8 older zones - never the pick.

## R3 census (trade-side z1 sets; heads = B162ORIGIN origin changes; kills: no kill row anywhere - FRESHCOUNT only non-deal dates, ABORTs zone-id-free; FVG: haveFvg=1 rows = 0 all packs)

- T0702: 13 longs (8 alive: 1582/1869/1875/1899/1909/1941/1943/2367; dead: 2432 last 14:40 W1:6386, 2473 last 17:35 W1:6917, 2475 last 17:35 W1:6918, 2478/2481 last 17:20 W1:6868/6869). LATEST 2473/2478 (promotion key p17:15, NOT PRINTED): dead, N. 2475 f16:20 promo 16:40, heads 17:00-17:35 (W1:6806/6822/6839/6854/6888/6904/6920), head->2367 at 17:40 (W1:6934): dead, left at 17:40 close. Heads: 2367->2432 14:40 (W1:6389)->2367->2475 17:00->2481 17:20 (W1:6871)->2475 17:25-17:35->2367 17:40+.
- A1: 10 shorts (9 alive + 2155 f07:15/p07:35/cb07:40, heads 08:55-09:20 W1:5176-5298, last 09:20 W1:5295, head->2109 09:25 W1:5322). LATEST 2155 (formation key): dead, N. Head at 10:00: 2109 (W1:5495).
- A2: 13 longs (9 alive + 2386/2488/2501/2515 dead older). LATEST 2549 (f16:45, head W2:4564): Y. Heads oscillate 2289<->singles, end 2549 17:30.
- A3: dead 2861 (f09-03 15:10)/2963 (f09-04 05:55)/2982 (f09-04 08:50, heads 09:30-10:45, last 10:45 W2:10550, head->2793 15:30 W2:11374). LATEST 2982 (formation key): N.
- A4: all 10 alive. LATEST 3126 (promotion key p08:55, NEVER headed; 3130 f08:40): Y. Head 3130 from 09:00 (W3:54).
- A5: dead 3051/3166 older. LATEST 3178 (f14:50, head from 15:50 W3:2080): Y.
- A6: all 13 alive. LATEST 3293 (f09:20, head from 09:45 W3:3688): Y.
- A7: dead 3298 (f10:00)/3302 (f10:25)/3324 (f14:35, heads 15:00-15:25 W3:4900-class, last 15:25 W3:5038, head->3293 W3:5070/5236). LATEST 3324 (formation key): N.
- B2: 28 longs (25 alive + 3121/3160/3281 dead older). LATEST 3308 (f14:35, head from 16:00 W2:13189, head==pick): Y. Heads: 3160->3281 11:10 (W2:12082)->3160->3150 14:35->3308 16:00.
- B3: dead 3924 (f08:15, head 08:55 W3:9959, last 10:00, head->3913 10:05 W3:10463). LATEST 3910 (promotion key p08:30, NEVER headed, alive W3:11695): Y.
- C-05-27 (listed): LATEST 2138/2146 (promotion key p14:55, NEVER headed, last 15:15 W1:5367/5368): N. Heads end 2094 15:20 (W1:5401).
- C-06-03: all 21 alive. LATEST 2930 (f08:45, head at 09:05 W2:5359, head==pick): Y. Heads 2820->2928 09:00 (W2:5321)->2930 09:05.
- T0707: dead 2935/2938/2940/2965 older. LATEST 2974 (f11:45, head from 13:55 W2:3550): Y.
- S3-reach refused rows: C-06-04 (S3 ran, PROMO_RETURN_NONE W2:8529), C-08-28-1625 (S3 ran, TP_RR_FAIL W1:7136), C-09-04-1040 (confirm=0); rest die pre-S3 (B-172 R2). All OTHER-GATE.

## R4 roads (kept; ARM = S3->S4->S5, JUMP = S3->S5 direct, no S4)

- A1 JUMP (STATE S3_ZONE_WAIT->S5_GATE_CHECK W1:5504). B2 JUMP (STATE S3_ZONE_WAIT->S5_GATE_CHECK W2:13281). T0702-kept ARM (STATE S3->S4 W1:7045, S4->S5 W1:7047); T0702-trial JUMP (B-171 j5046700). A2-A7/B3/C-05-27/C-06-03/T0707 ARM (B-172 R2 per-entry roads; T0707 STATE S3->S4 W2:3778, S4->S5 W2:3780, SIGNAL W2:3807; C-05-27 STATE S3->S4 W1:5448, S4->S5 W1:5476).
- (a) bites at S3 commit (EA:9518-9544); no walk on jump road (commitVia=none; hits=0 logs 427538/997930). (b) bites at NEITHER site (indicator prints only; B-161 R2; B-84).

## S (REPORT/SEPARATOR_B174.csv, 66 rows)

- PROMO-ORDER: MET A3/A5/A6/A7/B3/C-05-27/T0707; NOT MET T0702 + A1/A2/A4/B2/C-06-03 -> DOES NOT SEPARATE.
- LATEST-ALIVE: MET A2/A4/A5/A6/B2/B3/C-06-03/T0707; NOT MET T0702 + A1/A3/A7 (+C-05-27 listed) -> DOES NOT SEPARATE.
- A-AND-B: MET A5/A6/B3/T0707 only -> DOES NOT SEPARATE.

## R5

- None separates. Breakers: (a) A1/A2/A4/B2/C-06-03; (b) A1/A3/A7; (c) A1/A2/A3/A4/A7/B2/C-06-03. Lane to 4 of 6 (B-175 measurements, no trial). Blockers: jump road runs no walk (a); latest-zone liveness needs an additive per-zone export proven row-for-row first (b).

(End of slice)
