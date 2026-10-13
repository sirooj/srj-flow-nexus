# BUILDER SLICE B-203 - raw side-by-side rows (under 600 lines)

Base: builder/B-203 cut at 6c75b79 (= builder/B-202 head). Source rows: B-202 cuts on disk (RECON62/EU0525TD-B202) via one script per job (b203_r14, b203_r123, b203_key with CUT line numbers + full raws in KEYROWS_B203_*.txt, on disk unstaged); committed SETUPS/JOURNAL/DEALS/BACKTEST for R5/register. Relay B-203 + his hold words. Verdict MEASURED (read-only).

## Start gate
```
log-1 6c75b79 (backup exact). Branch builder/B-203 cut here. Push via backup, never origin.
diff 6c75b79 EMPTY on pointer/RESULT_B202/SLICE_B202/BACKTEST/INDEX/register/both skills/CONTEXT/HANDOFF/ledger. Journal row 336 bytes 164885 ACCOUNTED. Profiles 581 chart-touch gap carried. Terminal.ini restored a5834591 (B-198 class). Terminal64 PID 20200 his review untouched. D: 126.1 now. Python 3.13.16.
Disk B-202 final: EA 7c392767, ex5 B2EF6E4C, IND a8201128/c82f175e, SESS 16573a5b. Ledger ^1348.=1 ^1349.=0 pre.
```

## Part B banking (skill lines 325-326)
```
"i want to hold the year till date test run because i want to make sure the trades are all correct and valid, i want to manually review them before i let it go. please list me the taken or valid trades only from EU GU UJ."
HOLD-YTD (marked so): 1 January held until he reviews June-to-date takes; no year-start ordered. Journal row 337 unstaged (164885 -> 165359).
```

## R1a A3 16:00 absent EU (first differing row EU 15:35 ABORT; M/W/D identical; 5m seedbias detail NOT PRINTED)
```
RECON 995320: TP_ELECT not yet (09:30 ref for R1b; 15:35 path below)
RECON 998602/998604 (15:40:00): CONFIRMPOLL bar=2026.09.04 15:35 anchor=Monthly-POC dir=LONG oppCandle=1 bodyDir=1 body=18pts doji=0 touchAttr=1 confirm=1 shadow=true
RECON 15:40 ALIVE (Monthly-POC LONG S3_ZONE_WAIT TREND ALIGN PASS div=regular-bull dbar=15:30 zone=1.15907-1.15933 promo=2026.09.03 06:10)
RECON 15:30/15:35 UJBARMAP: mpoc=1.15935 mvwap=1.16026 wpoc=1.15935 wvwap=1.16020 dpoc=1.16284 dvwap=1.16220 (15:30) / mvwap=1.16025 wvwap=1.16020 dvwap=1.16204 (15:35)
EU 2414711/2414712 (15:35:00): A6REFUSED bar=2026.09.04 15:35 state=S2_LTF_ALIGN dir=LONG predicate=SEEDBIAS_REFUSED / B182DEC out=ABORT SEEDBIAS_REFUSED reg=TREND latch=0 div=-1
EU 2414713/2414715 (15:35:00): B200POT ev=END rule=5M-BIAS-AT-ENTRY|139 ltf=MISALIGN div=regular-bear dbar=15:25 zone=1.16284-1.16302 promo=09:50 / B201TO to=15:30|SEEDBIAS_REFUSED rl=5M-BIAS-AT-ENTRY|139 lt=MISALIGN
EU 15:30/15:35 UJBARMAP: mpoc=1.15935 mvwap=1.16026 wpoc=1.15935 wvwap=1.16020 dpoc=1.16284 dvwap=1.16220 (identical to RECON at both candles); ltf=-1.0 both runs both candles.
S2SEEDBIAS_KILL/seedbiasAl rows NOT PRINTED (tag filtered from these scans; full CUT rows available).
```

## R1b 09:30 London fires EU not RECON (first differing row TP_ELECT target+R; names NOT PRINTED)
```
RECON 995320 (09:30:01): TP_ELECT entry=1.16290 sl=1.16249 tp=1.16316 R=0.63 bar=09:25
RECON 995327/995328 (09:30:01): A6REFUSED predicate=TP_RR_FAIL / B182DEC out=ABORT TP_RR_FAIL / END rule=1R-FLOOR|61 (refused)
EU 2410562 (09:30:01): TP_ELECT entry=1.16290 sl=1.16249 tp=1.16331 R=1.00 bar=09:25
EU 2410565/2410574 (09:30:01): B182DEC out=FIRE / ORDER entry=1.16290 sl=1.16249 tp=1.16331 R=1.00 (fires; deal 09:30 1.16296)
Target line names NOT PRINTED (TP_ELECT carries price only). 09:00 M/W/D identical (mvwap 1.16011 both); 09:25-09:30 UJBARMAP filtered from this scan (NOT PRINTED, tag UJBARMAP).
```

## R2 1 Sep exit (RECON BREAK vs EU absent; EU Y-POC + candle NOT PRINTED in scan)
```
RECON 958203 (17:50:00): MTEXIT bar=2026.09.01 17:45 reason=POI_BODY_BREAK line=Yearly-POC lineVal=1.15987 entry=1.16022 exit=1.15987 src=OWNBODY
RECON 958205 (17:50:00): deal #5 sell 2.04 EURUSD at 1.15987 (his break exit)
EU 2343615 (17:51:04): deal #31 sell 1.97 EURUSD at 1.15975
EU 2343682 (17:55:01): MTEXIT bar=2026.09.01 17:50 reason=SL line=- lineVal=- entry=1.16022 exit=1.15975 src=- (stop)
EU Yearly-POC 17:45 NOT PRINTED (no Y-POC row in EU r2 span; SL carries line=-). 17:45 candle NOT PRINTED (UJBARMAP filtered from this scan).
```

## R3 7 Sep 16:45 (booked tp differs; names NOT PRINTED; M/W/D at entry NOT PRINTED in scan)
```
RECON 1017255/1017259/1017268 (16:45:00): TP_ELECT tp=1.16315 R=2.45 / A6FIRED tp=1.16315 / ORDER entry=1.16261 sl=1.16239 tp=1.16315 R=2.45
RECON 1017563/1017625: deal #11 sell 17:13 1.16315 + MTEXIT bar=17:10 reason=TP_TOUCH exit=1.16315 (take-profit)
EU 2455476/2455480/2455489 (16:45:00): TP_ELECT tp=1.16358 R=4.41 / A6FIRED tp=1.16358 / ORDER entry=1.16261 sl=1.16239 tp=1.16358 R=4.41
EU 2459408/2459479: deal #39 sell 21:25 1.16239 + MTEXIT bar=21:25 reason=SL exit=1.16239 (stop order; BACKTEST market-close cell stands corrected in R5 blocks)
```

## R4 census (09:00 UJBARMAP first session candle; Yearly NOT PRINTED both - UJBARMAP carries M/W/D only)
```
26 Aug 09:00: M-poc SAME (1.15424 both); M-vwap DIFFERENT (1.15789 vs 1.15893); W DIFFERENT (1.16721/1.16699 vs 1.16700/1.16685); D-poc SAME (1.16721); D-vwap DIFFERENT 1pt (1.16699 vs 1.16700)
27-28 Aug 09:00: M/W DIFFERENT (e.g. 27 Aug mvwap 1.15830 vs 1.15925; wpoc 1.16555 vs 1.16642); D SAME-ish
31 Aug-9 Sep 09:00: M/W/D SAME every day (e.g. 1 Sep mvwap 1.16124 both; 4 Sep mvwap 1.16011 both; 7 Sep mvwap 1.16041 both; 8 Sep 1.16069 both; 9 Sep 1.16092 both)
Start-date cause (rows only, B-55/B-56): 26 Aug start carries shallow Monthly/Weekly history vs 25 May full; converged by September on rows. A3/R1 cause is 5m seedbias + target race at decision (M/W/D identical there), not line-map.
```

## R5 review sheet (38 blocks in REPORT/REVIEW_J2D_B203.md: EU 21, GU 8, UJ 9; A5 corrected)
```
EU 7 Sep 16:45 A5: stop 1.16239 target 1.16358 R 4.41; exit 21:25 1.16239 stop order (correcting BACKTEST market-close -0.15 to stop R -1.0)
Method: long CUTs + DEALS register mapping; time-based ORDER matching (server_time + side; fixes signal-fill gaps A2/A4/A5 and same-day collisions A5/A7); committed SETUPS/JOURNALS simplified/colliding for same-day takes (file defects named, not fixed - read-only).
```

## Records
```
X1 CONTEXT-4 B203 0->1; X1b Brain B-203 0->1 (2026-10-14). X2 HANDOFF-3 B-203 0->1 MEASURED. X3 ledger 1349 0->1 (165359). X4 pointer 30 lines.
F5 stage: result, slice, REVIEW, strategy skill, ledger, pointer, CONTEXT, HANDOFF. Never EA/includes/indicators/ex5/journals/logs/inis/profiles/scripts/backups/CUTs/KEYROWS.
Final disk unchanged B-202 (EA 7c392767, ex5 B2EF6E4C).
```
(End of slice)
