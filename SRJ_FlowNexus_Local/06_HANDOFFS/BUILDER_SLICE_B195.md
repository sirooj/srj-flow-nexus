# BUILDER SLICE B-195 - raw rows per R item (under 600 lines)

Base: builder/B-195 cut at cfcded0 (backup exact, = builder/B-194 head). Reads only (job_r_b195.py, packs + existing cut files + EA/include source text, never the day log). Verdict MEASURED.

## B banking greps (strategy skill, journal)
```
BANK-SEC 'His words 2026-10-13 (B-195)' count=0 -> APPEND
GU-0710-5M=0 GU-0710-ENTRY-1450=0 GU-0710-CODE-NOT-RULE=0 -> APPEND
PIN CONFIRMATION-BAR lines=[53] CQD-WORKED-BEFORE=[140,148,155] EU-7-NO-GAP-PROBLEM=[148,155]
FIX-NOT-REPLACE=[93,141,155] 5M-BIAS-AT-ENTRY=[139,151,154,161] 5M-FLIP-KILL=[113,116,139,174]
RETEST-DIES-BY-BODY-CLOSE-ONLY=[187] SAME-CANDLE-PERMITTED=[107] CANDLE-TIMES-ONLY=[261] Ruling 2026-10-07=[169,176,187,190,197,221]
JOURNAL '7/10/26' count=1 -> report only, append nothing
REGISTER F3 'entry 14:50' count=0 -> F3 note appended
```

## R1 candles + Y POC + confirms (kept GBP0629-B192/2026-07-10, EA 3B5EE8D1)
```
14:10 o/h/l/c NOT PRINTED (no B176HZ/B178ZL t= row)
14:15 pack 29439 B176HZ t=2026.07.10 14:15 o=1.34293 h=1.34300 l=1.34260 c=1.34286
14:20 pack 29471 B176HZ t=2026.07.10 14:20 o=1.34287 h=1.34295 l=1.34266 c=1.34269
14:25 pack 29511/29512 B176HZ + 29517 B178ZL t=2026.07.10 14:25 o=1.34269 h=1.34272 l=1.34215 c=1.34241
14:30 o/h/l/c NOT PRINTED
14:35 pack 29583 B176HZ + 29586/29587 B178ZL t=2026.07.10 14:35 o=1.34224 h=1.34228 l=1.34174 c=1.34179
14:40 o/h/l/c NOT PRINTED
14:45 pack 29638 B176HZ t=2026.07.10 14:45 o=1.34218 h=1.34246 l=1.34212 c=1.34238 (closes UP +20pts, NOT down)
14:50 pack 29665/29666 B176HZ t=2026.07.10 14:50 o=1.34239 h=1.34276 l=1.34233 c=1.34235 (14:50 open = 1.34239)
14:55 o/h/l/c NOT PRINTED
WINLINE Y-POC: pack 29416 14:15 WINLINE bar=2026.07.10 14:10 dir=SHORT action=OPEN line=Yearly-POC val=1.34296 (sole 14:10-15:00 print; later values NOT PRINTED)
B193D Y-POC all day = 1.34296 (ADD 09:00 pack 2612, KILL 09:05 pack 2646, ADD 09:15 pack 2713, KILL 09:40 pack 2889, ADD 10:10 pack 3073, OPEN 14:10 pack 4480)
Body-close-through vs 1.34296: 14:15 o1.34293/c1.34286 below (wick 1.34300 through 4pts, body holds) | 14:20 o1.34287/c1.34269 below | 14:25 o1.34269/c1.34241 below | 14:30 NOT PRINTED | 14:35 o1.34224/c1.34179 below | 14:40 NOT PRINTED | 14:45 o1.34218/c1.34238 below -> NONE printed closes through; verdict HIS-CHAIN-STANDS (14:30/14:40 unjudgeable)
CONFIRMPOLL kept 14:15-15:00: 29415 14:15 bar=14:10 Y-POC SHORT opp0/body0/7pts/doji0/touch1 confirm=0 | 29448 14:20 bar=14:15 Y-POC SHORT opp1/body1/7pts/touch1 confirm=1 | 29482 14:25 bar=14:20 Daily LONG confirm=0 | 29528 14:30 bar=14:25 Daily LONG confirm=0 | 29674 14:55 bar=14:50 Daily SHORT opp1/body1/4pts/touch0 confirm=0 | 29705 15:00 bar=14:55 Daily SHORT opp0/body0/24pts/touch1 confirm=0
CONFIRMPOLL B193D 14:15-15:00: 4479 14:15 bar=14:10 Y-POC SHORT confirm=0 | 4517 14:20 bar=14:15 Y-POC SHORT opp1/body1/7pts/touch1 confirm=1 | 4549 14:25 Daily LONG confirm=0 | 4597 14:30 Daily LONG confirm=0 | 4743 14:55 bar=14:50 Daily SHORT touch0 confirm=0 | 4785 15:00 bar=14:55 Daily SHORT confirm=0
```

## R2 held Y-POC SHORT per pass (K=kept B192 pack, D=B193D pack, CUT=cut ref)
```
14:15 K: 29412 UJPROBE bar_key=14:10 h4=1/h1=-1/m15=1 ltf=1 div=OPPOSING regular | 29415 CONFIRM0 | 29417 ANCHOR SEED Y-POC SHORT | 29418 REGIME #195 1/0/0/0
14:15 D: 4476 UJPROBE ltf=1 | 4479 CONFIRM0 | 4481 ANCHOR SEED | 4482 REGIME #176 1/0/3/1 MEANREV | j3841688 ANCHOR | j3841690 SIDE1V_BIRTH bar=14:10 SHORT tf=0 mr=1 confShort=A_OPP | j3841697 STATE S1->S2 Y-POC SHORT | j3841699 S2WAIT bar=14:10 RETAINED
14:20 K: 29445 UJPROBE bar_key=14:15 ltf=1 div=ALIGNED | 29448 CONFIRM1 (7pts) | 29450 REGIME #196 1/0/0/0 | j2897968 SIDE1V_BIRTH bar=14:10 A_OPP | j2898009 SUPPRESSED bar=14:15 Y-POC SHORT heldState=S1_REGIME action=HELD
14:20 D: 4509 UJPROBE ltf=1 | 4510 FRESHSKIP S2_LTF_ALIGN PRE_BINDING (j3841731) | 4517 CONFIRM1 (j3841904) | j3841900 SUPPRESSED bar=14:15 HELD heldState=S2_LTF_ALIGN | j3841906 STATE S2->IDLE SHORT poi=-
14:25 K: 29477 UJPROBE bar_key=14:20 ltf=1 | 29482 CONFIRM bar=14:20 Daily LONG confirm=0 | 29483 REGIME #197 LONG 2/1/0/0 | j2898050 SIDE1H_WOULDPREEMPT wouldPreempt=0 | j2898051 UJOPCONF opConf=0 heldConf=0 | j2898052 UJRESEED Daily-LONG over holder al=1 | j2898060/61 LONG S1->S2->S3 | j2898124 UJDEFERABORT LONG S3
14:25 D: 4545 UJPROBE ltf=1 | 4549 CONFIRM Daily LONG 0 | 4550 ANCHOR Daily LONG | 4552 REGIME #177 LONG 2/1/3/0 | j3841946 IDLE->S1 LONG Daily | j3841949 SIDE1V_BIRTH bar=14:20 SHORT A_OPP | j3841957/58 LONG S1->S2->S3 | j3842021 UJDEFERABORT LONG S3
14:30 K+D: UJPROBE bar_key=14:25 ltf=-1.0 (K29520/D4589) | FRESHSKIP S3 PRE_BINDING LONG (K29521/D4590) | CONFIRM LONG 0 (K29528/D4597) | ABORT LTF_MISALIGN LONG S3 (K29530/D4599) + A6REFUSED + B182DEC (K29532/D4601) | NO Y-POC SHORT ROWS either build
14:35 K: 29561 UJPROBE bar_key=14:30 ltf=-1 | D: 4630 same | NO seed rows either build
14:40 K: 29590 UJPROBE bar_key=14:35 ltf=-1 | D: 4659 same | NO seed rows either build
14:45 K: 29616 UJPROBE bar_key=14:40 h4=1/h1=-1/m15=1 ltf=-1 div=OPPOSING regular | D: 4685 same | NO seed rows either build
14:50 K: 29643 UJPROBE bar_key=14:45 ltf=-1 | D: 4712 same | NO Y-POC SHORT rows (14:50 Daily seed is other-anchor: see 14:55)
14:55 K: 29671 UJPROBE bar_key=14:50 ltf=-1 | 29674 CONFIRM bar=14:50 Daily SHORT touch0 confirm=0 | 29677 ANCHOR 14:50 Daily SHORT | 29678 REGIME #198 1/0/0/0 | j2898475 SIDE1V bar=14:50 C_TOUCH
14:55 D: 4740 UJPROBE | 4743 CONFIRM Daily 0 | 4746 ANCHOR Daily | 4747 REGIME #178 0/0/3/1 | j3842372 SIDE1V bar=14:50 C_TOUCH
15:00 K: 29702 UJPROBE bar_key=14:55 ltf=-1 | 29705 CONFIRM bar=14:55 Daily SHORT confirm=0 | 29707 REGIME #199 1/0/0/0
15:00 D: 4778 UJPROBE | 4785 CONFIRM Daily 0
NO-POLL: Y-POC SHORT CONFIRMPOLL/ANCHOR 14:30-14:50 count=0 both builds. Last hold rows: kept j2898009 (SUPPRESSED HELD S1, 14:20:06; displaced j2898052 UJRESEED 14:25:01); B193D j3841900 (SUPPRESSED HELD S2, 14:20:06; cleared j3841906 S2->IDLE 14:20:06) + j3841949 (SIDE1V bar=14:20, 14:25:01).
Later Y-POC activity (other seeds): kept confirm=1 15:20 bar=15:15 (pack 29828) -> B182DEC 15:55 FRESH_OPP_FVG (pack 30042); B193D SIDE1V 15:10 B_BODY (j3842919) + STATE S1->S2->S3 15:15 (j3842927/28); B193D D130LATCH 15:05 verdict=1 verdictBar=14:15 (pack 4820, Daily seed).
```

## R3 code spots (Experts/SRJ_FlowNexus_EA.mq5, read-only)
```
CheckLtfAlign EA:2752-2758: reads FL_BUF_LTF_BIAS at barShift; aligned = round(ltf)==(LONG?1:-1)
FRESHSKIP/PRE_BINDING EA:8095-8100: prints when state in [S2_LTF_ALIGN,S4_ARMED)
SUPPRESSED EA:8595-8604: prints HELD/SUPERSEDED when a new retest is detected behind a holder (record-only census)
Shadow CONFIRMPOLL EA:8612-8630: LOG ONLY, assigns no state; held anchor polled (EA:8621-8622), IDLE polls bar retest (EA:8623-8628)
S1->S2 EA:8961-8969: ClassifyRegime; NONE -> S1WAIT RETAINED (EA:8964-8965); else g_state=ST_S2_LTF_ALIGN (EA:8968)
S2 EA:8972-8995: CheckLtfAlign; !aligned -> S2PROMOTE_M15 print / S2SEEDBIAS_KILL+abort (EA:8989) / S2WAIT RETAINED+return (EA:8991); aligned -> S2->S3 (EA:8993-8995)
S1 transfer EA:8427-8463: t78_opConf/t78_heldConf via IsConfirmationCandle (EA:8431-8432); UJRESEED when !opConf&&!heldConf at S1 (EA:8434-8444); cross-dir preempt at S2 or S1+opConf&!heldConf (EA:8463+)
SIDE1V_BIRTH EA:8813-8816: seed-bar probe, tf/mr/confShort (N1 save/restore EA:8810-8811)
SIDE1T_SEEDBIAS EA:8764-8777: seed-bar CheckLtfAlign reuse -> s1g_seedBiasAl
Confirm latch: grep confirmLatch/g_confirmed/CONFIRM_ONCE = 0 hits; latch vars g_latchedEntry/Sl/Tp/R cleared on every reseed (EA:8451-8454, EA:8477-8480, EA:9020) set at fire only
IsConfirmationCandle live callsites: EA:8003,8431,8432,8810,8836,8905,8928,8935,9006,9007,9649,9670,9859
Release rows: STATE S2->S3 j3837137 (09:20), j3838520 (11:05 B193D), j3842928 (15:15 B193D), j2894798/j2898889 (11:05/15:50 kept)
(a) keeps the RETEST (seed state advances/holds); opposed-5m confirm=1 is shadow-only (shadow=true), never latched
(b) needs a NEW confirmation (live IsConfirmationCandle at S4/S5 later bar); old confirm never read back; no new retest (anchor persists: S2WAIT retain EA:8991; B60C cSrc EA:2700-2714)
(c) NO ROW on 14:30-14:50; exits predate window: B193D j3841906 (S2->IDLE 14:20:06, poi=-, no ABORT print; silent-IDLE call site UNRESOLVED: sole silent IDLE write EA:8749 is SEEDVOID which prints); kept j2898052 (UJRESEED displacement 14:25:01)
```

## R4 later gates (kept rows)
```
Regime at 14:15: NOT MET - REGIMECENSUS #195/#196 1/0/0/0 (packs 29418/29450); B182SWEEP LD.H@13:55 (29293) + pLD.H@14:00 (29321) map to 0 in NY on kept (B193D reads 1/0/3/1 pack 4482, diagnostic only)
Zone at 14:45: 7:10-formed zone NOT PRINTED (B182MID/B178ZL/XOBPROMO/ZONEPICK/INPLAYCOMMIT whole-day 7:10 count=0); S window: B176HZ LATEST S nLive=4 latestPromoT=07:25 (29613), B179HZB S win=1 first=07:10/07:25/1.34353-1.34374/14:05 (29615); B win=0 (29588/29614/29612); HISZONE/B177HZ 14:35-14:55 count=0
CQD by 14:45: NOT MET - CQDRECHECK divLatch=0 (29320/29350/29383/29478 S1_REGIME); D130LATCH kept count=0 (B193D sole row 15:05 verdict=1 verdictBar=14:15 pack 4820, other seed); UJPROBE 14:45 div=OPPOSING kind=regular (29616); B182DEC 14:30 LONG latch=0 div=1 regular dbar=14:15 (29532); his type-2 UNMAPPED
Stop: SHORT walk NOT PRINTED (no election; LONG-only SLSRC/SL_REF slRef=1.34174 packs 29487/29488/29524/29525); his 14:00 swing high value 1.34372 FOUND as SWINGPICK haveHigh (29486 atShift=4 / 29523 atShift=5 -> 14:00 candle); as his stop NOT PRINTED
Target: LD.L 11:50 value NOT PRINTED (TP_ELECT 14:00-15:00 count=0; B182SWEEP tag+bar only; value in indicator session cache per B-194 R6); 11:50-timestamp rows are B152PR bar stamps, not the low
R at 14:50 open: NOT PRINTED (no election)
4H/1H/15m at 14:45: 1.0/-1.0/1.0 (pack 29616) -> majority against SHORT
First gate after hold: REGIME (S1WAIT retention EA:8964-8965, packs 29418/29450); proximate displacement j2898052 (kept) / clear j3841906 (B193D); spec 9.4: 14:45 poll, zone, CQD, stop, target, R all unreached
```

## R5 HELD-RECONFIRM census inputs
```
Reading: a seed held only by the 5m alignment keeps its retest as a potential (Ruling 2026-10-07 lines 169-174; line 187; SAME-CANDLE-PERMITTED line 107) and is judged at the first confirmation candle after the 5m lines up with it; the confirmation taken under the opposed 5m never enters (5M-BIAS-AT-ENTRY lines 139-140; spec 3.3)
Hold populations (FRESHSKIP-S2/SEEDBIAS/LTF-ABORT rows): RECON62-B192 8/26,8/27,8/28,8/31,9/01,9/02,9/03,9/07,9/08,9/09 day files; JUNE0525-B192 5/27,5/29,6/01,6/02,6/03,6/04,6/05,6/08,6/09,6/10,6/11,6/12; GBP0629-B192 6/29,6/30,7/01,7/03,7/06,7/07,7/08,7/09,7/10,7/13,7/14,7/15,7/16,7/17 (full per-seed tables in job_r_b195_out.txt)
A1 SAME (conf 10:00 SHORT pack 8628, ltf -1.0 pack 8621 aligned; no pre-conf hold)
A2 SAME (conf 17:30 LONG pack 19669, ltf +1.0 pack 19661 aligned)
A3 SAME (fire conf 15:55 Yearly LONG pack 30969, ltf +1.0 pack 30962 aligned; 15:35 Monthly confirm=1 pack 30779 died other-gate, kills untouched)
A4 SAME (conf 09:15 LONG pack 33362, ltf +1.0 pack 33354 aligned; no hold)
A5 SAME (fire conf 16:40 LONG pack 36655, ltf +1.0 pack 36648 aligned; 16:30 confirm=1 pack 36565 died pre-fire, later gates preserved -> entry 16:45 unchanged)
A6 SAME (conf 10:05 SHORT pack 38878, ltf -1.0 pack 38871 aligned)
A7 SAME (conf 16:55 Monthly SHORT pack 41602, ltf -1.0 pack 41595 aligned; FIRE 17:00 pack 41613)
B1 SAME-silent NOT VALID (09:40 SEEDBIAS refusal packs 36990/36992; sole later Daily-SHORT poll 09:35-bar confirm=0 pack 36986; no post-lineup confirmation)
B2 SAME (conf 16:10 LONG pack 39711 shadow-0, ltf +1.0 pack 39703 aligned; 16:05 abort pack 39622 did not kill; FIRE 16:15 pack 39725)
B3 SAME (conf 14:35 LONG pack 59460, ltf +1.0 pack 59452 aligned; S2 hold same seed 14:25/14:30 packs 59351/59403; FIRE 14:40 pack 59476)
C-06-03 SAME fires (conf 09:05 LONG pack 27572, ltf +1.0 pack 27564 aligned; deal #4)
4JUN-0955 SAME-silent (conf 09:50 confirm=1 pack 32408 dies PROMO_RETURN_NONE pack 32414 OTHER-GATE; no deal on kept B192)
2JUN-1535 SAME-silent (all confirms 0 touchAttr=0 packs 25648/25686/25724/25762; never confirms)
10JUN-1610 SAME-silent (confirms 0 + S54_POI_BREAK pack 54819; never confirms)
4SEP-1040 SAME-silent (confirm=1 10:35 pack 29219 never reaches decision, no B182DEC; later gates preserved)
1SEP-1530 SAME-silent (confirm=1 15:25 pack 18745 dies HISZONE_NONE pack 18760 OTHER-GATE)
8SEP-1645 SAME-silent (refused R0.68 per register; 1R gate preserved; no deal)
27AUG-1705 SAME-silent (INVALID W1; nearest target D VWAP below 1R per register; 1R gate preserved; no deal)
28AUG-1625 / 8/28-NEWS SAME-silent (no takes on kept deals)
9JUN-1120 SAME-silent HIS-DECLINED (kept regime NONE pack 47610 per B-194 R3c; diagnostic fire is regime-map, untouched)
F2 SAME (conf 14:40 SHORT pack 19225, ltf -1.0 pack 19222 aligned; FIRE 14:45 pack 19245; earlier SEEDBIAS refusals are seed-gate, untouched)
F3 SAME-silent (held confirm opposed pack 29448/4517 void; NO post-lineup poll; 15:15-seed confirm 15:20 pack 29828 dies FRESH_OPP_FVG pack 30042 OTHER-GATE; his 14:50 NOT added)
Must-never added: NONE. Must-keep moved: NONE (B194-MOVED-TAKE-IS-A-BREAKER named, untriggered).
Buildability (B-84): held identity (g_anchorLine/g_dir/g_state, EA file-scope, S2 block EA:8972) YES; opposed-confirm flag (IsConfirmationCandle + CheckLtfAlign EA:2752, live per bar) YES; first post-lineup confirmation (same live calls) YES; retest persistence (anchor retain EA:8991; B60C cSrc EA:2700) YES. No new export.
```

## R6 print list (cell -> carrier tag -> home, B-194 R6 shape)
```
14:10/14:30/14:40/14:55 o/h/l/c -> B176HZ GAP_TOUCH (touch-only) / B178ZL KILL -> indicator gap/zone loop per-candle values (unwritten when untouched)
Y-POC 14:15-15:00 values -> WINLINE (action-only; OPEN 14:10 1.34296 sole print) -> indicator POI value store
S2 SUPPRESSED/SIDE1V/STATE/FRESHSKIP-CUT rows -> outside day-pack tag set -> existing CUT journal refs (j3841900/j3841949/j3841906/j2898009/j2898052)
7:10 XOB formation/middle/kill -> B182MID/B178ZL (none) -> indicator zone loop at promotion (B179HZB road first=07:10 pack 29615 exists)
CQD latch by 14:45 -> D130LATCH (absent kept) / CQDRECHECK divLatch -> EA CQD latch print
14:00 swing high -> SWINGPICK (poll bars only; SH=1.34372 packs 29486/29523) -> EA swing walk
LD.L 11:50 value -> no tag (B182SWEEP tag+bar only) -> indicator session cache (prevLondonLow)
Target/stop/R at 14:50 -> TP_ELECT/SL_REF (absent, no election) -> EA booking/stop walk
```

## Part S table
```
SEPARATES (gate letter met: every A row and owed B/F row SAME, no C row added) + substance note: reading is SAFE but NOT F3's fix - his 14:50 candle is unadded (NO POLL); next relay works the earlier proximate deaths (kept regime NONE / S1-displacement j2898052 / S2-clear j3841906), never reconfirm timing alone. No Part K.
```

## Start gate + banking + timing
```
Gate: log-1 cfcded0 (backup exact); branch builder/B-195 cut there (rev-parse HEAD=cfcded0 + branch builder/B-195 after cut, re-checked pre-commit); status 969 (dirty tree as B-194 + work files ACCOUNTED); diff cfcded0 EMPTY on pointer/RESULT_B194/SLICE_B194/register/skills/CONTEXT/HANDOFF/ledger; SHAs EA 3B5EE8D1/ex5 75B12D19/ind F0924613/ex5 717099E9/.B193D 8CF44FA6/.B189PMAP a31259b5 (match); terminal.ini MISMATCH-ACCOUNTED (disk 72b6708b vs 87e07a33: 5 counter bytes, same 20447 length, B-193 class); Charts MISMATCH-ACCOUNTED; ledger ^1340.=1 ^1341.=0 pre; Python 3.13.16 (py absent, recorded); Dukascopy terminal64 PID 1920 running (operator terminal, no tester launch in scope) ACCOUNTED.
Banking: grep-first 0 -> appended strategy section + F3 note + ledger 1341; journal 7/10/26 count=1, appended nothing.
Timing: gate + Part-0 reads ~60m; job_r_b195.py build + 2 runs ~25m; R grades + code reads ~95m; records + push follow.
Disk: kept pair untouched (no edit/compile/run); script + out files unstaged in 00_CURRENT_WORKING.
```
(End of slice)
