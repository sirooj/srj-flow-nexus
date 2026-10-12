# BUILDER SLICE B-180 - K2 hunk quotes (R1), R2/R3 rows raw, A4-date proof

Base: builder/B-180 cut at 0529351. Read-only relay: no source/inis touched, no compile, no run. Terminal 20720 absent at gate (he closed it; .preB179 restore carried to B-181, not done here). Python 3.13.16 canonical path.

## K2 hunk lines quoted for R1 (live Indicators/SRJ_FlowLogic.mq5, SHA 417728FD)
- Promotion stamp: `1870: datetime b178ptd = SRJ_BarTime(b178pb);` (+ `1895: ... b178ftd = SRJ_BarTime(b178fb);` for formT; `1898: g_b178PromoT[b178m] = b178ptd;`). Both stamps are bar-time lookups at first sight (B153: saved when seen, never an index read later); B145: rows carry time[i] of the closed bar.
- New-slot init: `1902: g_b178ReachT[b178m] = 0;`
- Reach rule: `1919: if(b178ob.isValid && !(low[i] > b178ob.high || high[i] < b178ob.low) && time[i] > b178ptd)` / `1920: g_b178ReachT[b178slot] = time[i];   // B179HZB reach-after-own-promotion (grade: $bar -gt $pt)`
- Standing value: `1923: datetime b179lp = (b178bull ? b177curB : b177curS);` / `1924: if(b179lp > 0 && g_b178ReachT[b178slot] >= b179lp)` (+ first-carrier min-slot tracking :1926).
- Why the relay's shorthand looked paradoxical: the prints carry FULL dates (formT/promoT/reachT all `yyyy.mm.dd hh:mm`). B2 first = 2026.06.04 15:50 / 2026.06.04 16:05 / 159.820-159.853 / 2026.06.05 16:00 (promo 6/04, reach 6/05: lawful). A5 first = 2026.09.04 15:30 / 2026.09.07 11:10 / 1.15847-1.16260 / 2026.09.07 16:40 (formed 9/04, promoted 9/07: lawful). The "16:00 before 16:05" / "15:30 after 11:10" readings dropped the dates.
- B178ZL PROMO/KILL prints (:1905/:1913) byte-for-byte from .B178ZL; B179HZB row (:1944/:1948) carries bar/latest/win/first.

## R2 rows raw - 1 July 11:05 LONG, Quarterly-POC, retest 10:50 (B-177 log 20261011.log)
- `10456421 [SRJ-EA] CONFIRMPOLL bar=2026.07.01 11:05 anchor=Quarterly-POC dir=LONG oppCandle=1 bodyDir=1 body=24pts doji=0 touchAttr=1 confirm=1 shadow=true`
- `10456422 [SRJ-EA] ZONEPICK bar=2026.07.01 11:05 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0 downgraded=0 fvg=--- xob=1.32097-1.32138`
- `10456423 [SRJ-EA] INPLAYCOMMIT bar=2026.07.01 11:05 dir=LONG zoneSrc=XOB zoneLo=1.32097 zoneHi=1.32138 promoT=2026.06.29 13:55 applied=1 bounded=1 scanned=9 swings=2 hits=0 firstShift=-1 firstVal=- commitVia=none legacy=0 legacyVia=none committed=0 changed=0 haveStop=1`
- `10456424 [SRJ-EA] B60C bar=2026.07.01 11:05 dir=LONG poi=Quarterly-POC rt=2026.07.01 10:50 rSh=4 rBar=2026.07.01 10:50 cSrc=RETEST xt=0 zxob=1.32097-1.32138 xpromo=2026.06.29 13:55 - C satisfied by the retest candle ([B-61 C2][B-129 XT])`
- `10456426 [SRJ-EA] 2026.07.01 11:10:02 STATE S3_ZONE_WAIT->S5_GATE_CHECK dir=LONG poi=Quarterly-POC`
- `10456429 [SRJ-EA] B150GATE bar=2026.07.01 11:05 dir=LONG value=1.0 src=XOB forbar=2026.07.01 11:05`
- `10456430 [SRJ-EA] B177HZ bar=2026.07.01 11:05 dir=LONG rt=2026.07.01 10:50 gapTouch=0.0 xobWin=0.0 verdict=HISZONE_NONE`
- `10456431 [SRJ-EA] 2026.07.01 11:10:02 ABORT reason=HISZONE_NONE state=S5_GATE_CHECK poi=Quarterly-POC dir=LONG`
- UJPROBE both runs at 11:05 identical: h4=1.0 h1=-1.0 m15=1.0 confirmedFeed=1 ltf=1.0 div=ALIGNED kind=regular latestNZ=1 (B177 log 10456291; B179 log 5777240).

## R2 rows raw - same candidate on B-179 (log 20261012.log, identical EA EB18717E)
- `5777373 [SRJ-EA] B60C bar=2026.07.01 11:05 dir=LONG poi=Quarterly-POC rt=2026.07.01 10:50 rSh=4 rBar=2026.07.01 10:50 cSrc=RETEST xt=0 zxob=1.32097-1.32138 xpromo=2026.06.29 13:55 - C satisfied by the retest candle ([B-61 C2][B-129 XT])` (byte-identical to B-177 10456424 short of the prefix)
- `5777375 [SRJ-EA] 2026.07.01 11:10:02 STATE S3_ZONE_WAIT->S5_GATE_CHECK dir=LONG poi=Quarterly-POC`
- `5777378 [SRJ-EA] B150GATE bar=2026.07.01 11:05 dir=LONG value=1.0 src=XOB forbar=2026.07.01 11:05`
- `5777238 [SRJ-IND] B179HZB side=B bar=2026.07.01 11:05 latest=2026.06.29 14:30 win=1 first=2026.06.29 13:30/2026.06.29 13:55/1.32097-1.32138/2026.06.30 16:05`
- `5777379 [SRJ-EA] B177HZ bar=2026.07.01 11:05 dir=LONG rt=2026.07.01 10:50 gapTouch=0.0 xobWin=1.0 verdict=PASS`
- `5777551 [SRJ-EA] 2026.07.01 11:10:02 ABORT reason=TP_RR_FAIL state=S5_GATE_CHECK poi=Quarterly-POC dir=LONG`
- CONFIRMPOLL/ZONEPICK/INPLAYCOMMIT byte-identical to B-177 (confirm=1 touchAttr=1; xob=1.32097-1.32138 xobInPlay=0; scanned 8->9 swings=2 hits=0).

## R3 rows raw - B-177 gate rows + the step that ended each candidate there
- 9/01 15:25 SHORT: `B177HZ bar=2026.09.01 15:25 dir=SHORT rt=2026.09.01 15:25 gapTouch=0.0 xobWin=1.0 verdict=PASS` then `8742744 [SRJ-EA] UJ5MENTRY_REFUSE bar=2026.09.01 15:25 dir=SHORT anchor=Monthly-POC ltf=1.0` (kept 5m rule; C-09-01-1530 stays refused).
- 6/03 18:00 LONG: `B177HZ bar=2026.06.03 18:00 dir=LONG rt=2026.06.03 18:00 gapTouch=0.0 xobWin=1.0 verdict=PASS` then `9621102 [SRJ-EA] TP_RR_FAIL_LATCH bar=2026.06.03 18:00 dir=LONG entry=159.979 sl=159.897 tp=159.995 R=0.20` (kept 1R gate).
- 6/10 10:25 LONG: `B177HZ bar=2026.06.10 10:25 dir=LONG rt=2026.06.10 10:20 gapTouch=0.0 xobWin=1.0 verdict=PASS` then `9687346 [SRJ-EA] UJ5MENTRY_REFUSE bar=2026.06.10 10:25 dir=LONG anchor=Daily-POC ltf=-1.0` (kept 5m rule).
- B-179 ends all three at the gate with xobWin=0.0 HISZONE_NONE (T4 census). Same no-fire both ways.

## A4-date proof (B-178 CSV typo, verdicts unaffected)
- Register A4 = 7 Sep London entry 09:20. B-176 A4 evidence = HISZONE_B176_RECON62_W3 (9/07+9/08 file) packs 504-521, all 2026.09.07. B-177 A4 row = 20261011.log line 8789920 `bar=2026.09.07 09:15 dir=LONG rt=2026.09.07 09:00`. B-179 A4 row = HZB_B179_RECON62_D20260907 B177HZ bar=09:15 identical values. SEPARATOR_B178 A4 confirm_candle cell "2026.09.04 09:15" is a transcription typo; SEPARATOR_B179 carries 2026.09.07 09:15.
(End of slice)
