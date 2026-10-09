# BUILDER SLICE B-142 - raw R1 zone rows + R4 artifact rows (kept 585093BF; runs RECON62-B137 + JUNE0525-B137, Tester/logs/20261009.log)

## R1 raw rows (pack_line|server_time|tag|raw; day packs under ROWPACK/)

### A1 28 Aug SHORT (RECON62-B137/2026-08-28.csv)
649|10:00|ZONEPICK|LF	0	19:48:07.643	Core 04	2026.08.28 10:00:00   [SRJ-EA] ZONEPICK bar=2026.08.28 09:55 dir=SHORT haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0 downgraded=0 fvg=--- xob=1.16492-1.16507
650|10:00|INPLAYCOMMIT|DG	0	19:48:07.643	Core 04	2026.08.28 10:00:00   [SRJ-EA] INPLAYCOMMIT bar=2026.08.28 09:55 dir=SHORT zoneSrc=XOB zoneLo=1.16492 zoneHi=1.16507 promoT=2026.08.28 06:40 applied=1 bounded=1 scanned=41 swings=10 hits=0 firstShift=-1 firstVal=- commitVia=none legacy=0 legacyVia=none committed=0 changed=0 haveStop=1
655|10:05|ZONEPICK|IF	0	19:48:07.643	Core 04	2026.08.28 10:05:00   [SRJ-EA] ZONEPICK bar=2026.08.28 10:00 dir=SHORT haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0 downgraded=0 fvg=--- xob=1.16492-1.16507
656|10:05|INPLAYCOMMIT|OS	0	19:48:07.643	Core 04	2026.08.28 10:05:00   [SRJ-EA] INPLAYCOMMIT bar=2026.08.28 10:00 dir=SHORT zoneSrc=XOB zoneLo=1.16492 zoneHi=1.16507 promoT=2026.08.28 06:40 applied=1 bounded=1 scanned=42 swings=11 hits=0 firstShift=-1 firstVal=- commitVia=none legacy=0 legacyVia=none committed=0 changed=0 haveStop=1
657|10:05|B60C|MF	0	19:48:07.643	Core 04	2026.08.28 10:05:00   [SRJ-EA] B60C bar=2026.08.28 10:00 dir=SHORT poi=Daily-VWAP rt=2026.08.28 09:55 rSh=2 rBar=2026.08.28 09:55 cSrc=BOTH xt=0 zxob=1.16492-1.16507 xpromo=2026.08.28 06:40 - C satisfied by retest and prior candles ([B-61 C2][B-129 XT])
658|10:05|STATE|NM	0	19:48:07.643	Core 04	2026.08.28 10:05:00   [SRJ-EA] 2026.08.28 10:05:00 STATE S3_ZONE_WAIT->S5_GATE_CHECK dir=SHORT poi=Daily-VWAP
660|10:05|TP_ELECT|GI	0	19:48:07.643	Core 04	2026.08.28 10:05:00   [SRJ-EA] TP_ELECT shadow=true entry=1.16466 sl=1.16508 tp=1.16364 R=2.43 bar=2026.08.28 10:00 latchBar=2026.08.28 10:05
661|10:05|A6FIRED|LP	0	19:48:07.643	Core 04	2026.08.28 10:05:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.08.28 10:00 dir=SHORT tp=1.16364 r=2.43 sl=1.16508 mode=2SWING div=regular
662|10:05|DEAL|HF	0	19:48:07.643	Core 04	2026.08.28 10:05:00   deal #2 sell 2.38 EURUSD at 1.16466 done (based on order #2)

### A2 1 Sep LONG (RECON62-B137/2026-09-01.csv)
1529|17:35|ZONEPICK|IM	0	19:48:38.174	Core 04	2026.09.01 17:35:01   [SRJ-EA] ZONEPICK bar=2026.09.01 17:30 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=1.15975-1.16013
1530|17:35|INPLAYCOMMIT|CI	0	19:48:38.174	Core 04	2026.09.01 17:35:01   [SRJ-EA] INPLAYCOMMIT bar=2026.09.01 17:30 dir=LONG zoneSrc=XOB zoneLo=1.15975 zoneHi=1.16013 promoT=2026.09.01 17:25 applied=1 bounded=1 scanned=9 swings=3 hits=2 firstShift=7 firstVal=1.15980 commitVia=BAR legacy=1 legacyVia=BAR committed=1 changed=0 haveStop=1
1532|17:35|B60C|LO	0	19:48:38.174	Core 04	2026.09.01 17:35:01   [SRJ-EA] B60C bar=2026.09.01 17:30 dir=LONG poi=Monthly-VWAP rt=2026.09.01 16:45 rSh=10 rBar=2026.09.01 16:45 cSrc=BOTH xt=0 zxob=1.15975-1.16013 xpromo=2026.09.01 17:25 - C satisfied by retest and prior candles ([B-61 C2][B-129 XT])
1535|17:35|TP_ELECT|IE	0	19:48:38.174	Core 04	2026.09.01 17:35:01   [SRJ-EA] TP_ELECT shadow=true entry=1.16022 sl=1.15975 tp=1.16077 R=1.17 bar=2026.09.01 17:30 latchBar=2026.09.01 17:35
1536|17:35|A6FIRED|OH	0	19:48:38.174	Core 04	2026.09.01 17:35:01   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.09.01 17:30 dir=LONG tp=1.16077 r=1.17 sl=1.15975 mode=1SWING div=hidden
1537|17:35|DEAL|GK	0	19:48:38.174	Core 04	2026.09.01 17:35:01   deal #4 buy 2.04 EURUSD at 1.16024 done (based on order #4)

### A3 4 Sep LONG (RECON62-B137/2026-09-04.csv)
2240|15:45|ZONEPICK|FL	0	19:49:20.911	Core 04	2026.09.04 15:45:00   [SRJ-EA] ZONEPICK bar=2026.09.04 15:40 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=1.15907-1.15933
2241|15:45|INPLAYCOMMIT|CS	0	19:49:20.911	Core 04	2026.09.04 15:45:00   [SRJ-EA] INPLAYCOMMIT bar=2026.09.04 15:40 dir=LONG zoneSrc=XOB zoneLo=1.15907 zoneHi=1.15933 promoT=2026.09.03 06:10 applied=1 bounded=1 scanned=2 swings=1 hits=0 firstShift=-1 firstVal=- commitVia=BAR legacy=1 legacyVia=BAR committed=1 changed=0 haveStop=1
2248|15:50|ZONEPICK|CK	0	19:49:20.911	Core 04	2026.09.04 15:50:00   [SRJ-EA] ZONEPICK bar=2026.09.04 15:45 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=1.15907-1.15933
2249|15:50|INPLAYCOMMIT|CQ	0	19:49:20.911	Core 04	2026.09.04 15:50:00   [SRJ-EA] INPLAYCOMMIT bar=2026.09.04 15:45 dir=LONG zoneSrc=XOB zoneLo=1.15907 zoneHi=1.15933 promoT=2026.09.03 06:10 applied=1 bounded=1 scanned=3 swings=1 hits=0 firstShift=-1 firstVal=- commitVia=BAR legacy=1 legacyVia=BAR committed=1 changed=0 haveStop=1
2257|16:00|B60C|DN	0	19:49:20.911	Core 04	2026.09.04 16:00:00   [SRJ-EA] B60C bar=2026.09.04 15:55 dir=LONG poi=Yearly-POC rt=2026.09.04 15:40 rSh=4 rBar=2026.09.04 15:40 cSrc=BOTH xt=1 zxob=1.15907-1.15933 xpromo=2026.09.03 06:10 - C satisfied by retest and prior candles ([B-61 C2][B-129 XT])
2260|16:00|TP_ELECT|CH	0	19:49:20.911	Core 04	2026.09.04 16:00:00   [SRJ-EA] TP_ELECT shadow=true entry=1.16018 sl=1.15847 tp=1.16302 R=1.66 bar=2026.09.04 15:55 latchBar=2026.09.04 16:00
2261|16:00|A6FIRED|RE	0	19:49:20.911	Core 04	2026.09.04 16:00:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.09.04 15:55 dir=LONG tp=1.16302 r=1.66 sl=1.15847 mode=1SWING div=hidden
2262|16:00|DEAL|MI	0	19:49:20.911	Core 04	2026.09.04 16:00:00   deal #6 buy 0.57 EURUSD at 1.16019 done (based on order #6)

### A4 7 Sep LDN LONG (RECON62-B137/2026-09-07.csv)
2719|09:05|ZONEPICK|QR	0	19:49:33.118	Core 04	2026.09.07 09:05:00   [SRJ-EA] ZONEPICK bar=2026.09.07 09:00 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=1.16098-1.16109
2720|09:05|INPLAYCOMMIT|FS	0	19:49:33.118	Core 04	2026.09.07 09:05:00   [SRJ-EA] INPLAYCOMMIT bar=2026.09.07 09:00 dir=LONG zoneSrc=XOB zoneLo=1.16098 zoneHi=1.16109 promoT=2026.09.07 08:55 applied=1 bounded=1 scanned=4 swings=1 hits=1 firstShift=4 firstVal=1.16098 commitVia=BAR legacy=1 legacyVia=BAR committed=1 changed=0 haveStop=1
2730|09:20|B60C|FJ	0	19:49:33.118	Core 04	2026.09.07 09:20:00   [SRJ-EA] B60C bar=2026.09.07 09:15 dir=LONG poi=Weekly-POC rt=2026.09.07 09:00 rSh=4 rBar=2026.09.07 09:00 cSrc=BOTH xt=1 zxob=1.16098-1.16109 xpromo=2026.09.07 08:55 - C satisfied by retest and prior candles ([B-61 C2][B-129 XT])
2733|09:20|TP_ELECT|KQ	0	19:49:33.118	Core 04	2026.09.07 09:20:00   [SRJ-EA] TP_ELECT shadow=true entry=1.16135 sl=1.16098 tp=1.16200 R=1.76 bar=2026.09.07 09:15 latchBar=2026.09.07 09:20
2734|09:20|A6FIRED|MJ	0	19:49:33.118	Core 04	2026.09.07 09:20:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.09.07 09:15 dir=LONG tp=1.16200 r=1.76 sl=1.16098 mode=1SWING div=hidden
2735|09:20|DEAL|JR	0	19:49:33.118	Core 04	2026.09.07 09:20:00   deal #8 buy 2.49 EURUSD at 1.16138 done (based on order #8)

### A5 7 Sep NY LONG (RECON62-B137/2026-09-07.csv)
3022|16:20|ZONEID|NJ	0	19:49:39.224	Core 04	2026.09.07 16:20:03   [SRJ-EA] ZONEID bar=2026.09.07 16:15 site=S3PICK xobId=3178 fvgId=0
3023|16:20|XOBPROMO|IF	0	19:49:39.224	Core 04	2026.09.07 16:20:03   [SRJ-EA] XOBPROMO bar=2026.09.07 16:15 site=S3PICK xobId=3178 raw=1788795000.0 promoT=2026.09.07 15:30
3024|16:20|ZONEPICK|OI	0	19:49:39.224	Core 04	2026.09.07 16:20:03   [SRJ-EA] ZONEPICK bar=2026.09.07 16:15 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=1.16229-1.16253
3025|16:20|INPLAYCOMMIT|ED	0	19:49:39.224	Core 04	2026.09.07 16:20:03   [SRJ-EA] INPLAYCOMMIT bar=2026.09.07 16:15 dir=LONG zoneSrc=XOB zoneLo=1.16229 zoneHi=1.16253 promoT=2026.09.07 15:30 applied=1 bounded=1 scanned=12 swings=3 hits=2 firstShift=2 firstVal=1.16238 commitVia=BAR legacy=1 legacyVia=BAR committed=1 changed=0 haveStop=1
3039|16:45|B60C|FQ	0	19:49:39.224	Core 04	2026.09.07 16:45:00   [SRJ-EA] B60C bar=2026.09.07 16:40 dir=LONG poi=Weekly-POC rt=2026.09.07 16:05 rSh=8 rBar=2026.09.07 16:05 cSrc=BOTH xt=1 zxob=1.16229-1.16253 xpromo=2026.09.07 15:30 - C satisfied by retest and prior candles ([B-61 C2][B-129 XT])
3042|16:45|TP_ELECT|QN	0	19:49:39.224	Core 04	2026.09.07 16:45:00   [SRJ-EA] TP_ELECT shadow=true entry=1.16261 sl=1.16238 tp=1.16315 R=2.34 bar=2026.09.07 16:40 latchBar=2026.09.07 16:45
3043|16:45|A6FIRED|RS	0	19:49:39.224	Core 04	2026.09.07 16:45:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.09.07 16:40 dir=LONG tp=1.16315 r=2.34 sl=1.16238 mode=1SWING div=hidden
3044|16:45|DEAL|HI	0	19:49:39.224	Core 04	2026.09.07 16:45:00   deal #10 buy 3.9 EURUSD at 1.16264 done (based on order #10)

### A6 8 Sep LDN SHORT (RECON62-B137/2026-09-08.csv)
3183|10:05|ZONEPICK|HQ	0	19:49:45.329	Core 04	2026.09.08 10:05:00   [SRJ-EA] ZONEPICK bar=2026.09.08 10:00 dir=SHORT haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0 downgraded=0 fvg=--- xob=1.16362-1.16377
3184|10:05|INPLAYCOMMIT|MG	0	19:49:45.329	Core 04	2026.09.08 10:05:00   [SRJ-EA] INPLAYCOMMIT bar=2026.09.08 10:00 dir=SHORT zoneSrc=XOB zoneLo=1.16362 zoneHi=1.16377 promoT=2026.09.03 21:35 applied=1 bounded=1 scanned=737 swings=134 hits=1 firstShift=727 firstVal=1.16364 commitVia=SWING legacy=0 legacyVia=none committed=1 changed=1 haveStop=1
3191|10:10|ZONEPICK|DM	0	19:49:45.329	Core 04	2026.09.08 10:10:00   [SRJ-EA] ZONEPICK bar=2026.09.08 10:05 dir=SHORT haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=1.16362-1.16377
3192|10:10|INPLAYCOMMIT|FS	0	19:49:45.329	Core 04	2026.09.08 10:10:00   [SRJ-EA] INPLAYCOMMIT bar=2026.09.08 10:05 dir=SHORT zoneSrc=XOB zoneLo=1.16362 zoneHi=1.16377 promoT=2026.09.03 21:35 applied=1 bounded=1 scanned=738 swings=134 hits=1 firstShift=728 firstVal=1.16364 commitVia=SWING legacy=1 legacyVia=SWINGLEG committed=1 changed=0 haveStop=1
3194|10:10|B60C|IF	0	19:49:45.329	Core 04	2026.09.08 10:10:00   [SRJ-EA] B60C bar=2026.09.08 10:05 dir=SHORT poi=Monthly-POC rt=2026.09.08 09:40 rSh=6 rBar=2026.09.08 09:40 cSrc=PRIOR xt=0 zxob=1.16362-1.16377 xpromo=2026.09.03 21:35 - C satisfied by the prior candle ([B-61 C2][B-129 XT])
3197|10:10|TP_ELECT|GJ	0	19:49:45.329	Core 04	2026.09.08 10:10:00   [SRJ-EA] TP_ELECT shadow=true entry=1.16205 sl=1.16258 tp=1.16102 R=1.94 bar=2026.09.08 10:05 latchBar=2026.09.08 10:10
3198|10:10|A6FIRED|QJ	0	19:49:45.329	Core 04	2026.09.08 10:10:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.09.08 10:05 dir=SHORT tp=1.16102 r=1.94 sl=1.16258 mode=1SWING div=hidden
3199|10:10|DEAL|FH	0	19:49:45.329	Core 04	2026.09.08 10:10:00   deal #12 sell 1.95 EURUSD at 1.16205 done (based on order #12)

### A7 8 Sep NY SHORT (RECON62-B137/2026-09-08.csv)
3391|16:55|ZONEPICK|CN	0	19:49:51.437	Core 04	2026.09.08 16:55:00   [SRJ-EA] ZONEPICK bar=2026.09.08 16:50 dir=SHORT haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0 downgraded=0 fvg=--- xob=1.16362-1.16377
3392|16:55|INPLAYCOMMIT|RQ	0	19:49:51.437	Core 04	2026.09.08 16:55:00   [SRJ-EA] INPLAYCOMMIT bar=2026.09.08 16:50 dir=SHORT zoneSrc=XOB zoneLo=1.16362 zoneHi=1.16377 promoT=2026.09.03 21:35 applied=1 bounded=1 scanned=819 swings=149 hits=1 firstShift=809 firstVal=1.16364 commitVia=SWING legacy=0 legacyVia=none committed=1 changed=1 haveStop=1
3395|17:00|CONFIRMPOLL|QI	0	19:49:51.437	Core 04	2026.09.08 17:00:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.08 16:55 anchor=Monthly-POC dir=SHORT oppCandle=1 bodyDir=1 body=6pts doji=0 touchAttr=1 confirm=1 shadow=true
3396|17:00|ZONEID|GN	0	19:49:51.437	Core 04	2026.09.08 17:00:00   [SRJ-EA] ZONEID bar=2026.09.08 16:55 site=S4RQZ xobId=2898 fvgId=0
3397|17:00|B60C|ND	0	19:49:51.437	Core 04	2026.09.08 17:00:00   [SRJ-EA] B60C bar=2026.09.08 16:55 dir=SHORT poi=Monthly-POC rt=2026.09.08 16:45 rSh=3 rBar=2026.09.08 16:45 cSrc=PRIOR xt=0 zxob=1.16362-1.16377 xpromo=2026.09.03 21:35 - C satisfied by the prior candle ([B-61 C2][B-129 XT])
3400|17:00|TP_ELECT|GK	0	19:49:51.437	Core 04	2026.09.08 17:00:00   [SRJ-EA] TP_ELECT shadow=true entry=1.16220 sl=1.16274 tp=1.16114 R=1.96 bar=2026.09.08 16:55 latchBar=2026.09.08 17:00
3401|17:00|A6FIRED|PF	0	19:49:51.437	Core 04	2026.09.08 17:00:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.09.08 16:55 dir=SHORT tp=1.16114 r=1.96 sl=1.16274 mode=1SWING div=regular
3402|17:00|DEAL|DR	0	19:49:51.437	Core 04	2026.09.08 17:00:00   deal #14 sell 1.95 EURUSD at 1.16220 done (based on order #14)

### B2 5 Jun NY LONG (JUNE0525-B137/2026-06-05.csv)
1651|16:00|ZONEPICK|ND	0	19:54:23.538	Core 04	2026.06.05 16:00:00   [SRJ-EA] ZONEPICK bar=2026.06.05 15:55 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=159.881-159.916
1652|16:00|INPLAYCOMMIT|JM	0	19:54:23.538	Core 04	2026.06.05 16:00:00   [SRJ-EA] INPLAYCOMMIT bar=2026.06.05 15:55 dir=LONG zoneSrc=XOB zoneLo=159.881 zoneHi=159.916 promoT=2026.06.05 15:40 applied=1 bounded=1 scanned=12 swings=1 hits=0 firstShift=-1 firstVal=- commitVia=none legacy=1 legacyVia=SWINGLEG committed=0 changed=1 haveStop=1
1673|16:15|ZONEPICK|EP	0	19:54:23.538	Core 04	2026.06.05 16:15:00   [SRJ-EA] ZONEPICK bar=2026.06.05 16:10 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0 downgraded=0 fvg=--- xob=159.881-159.916
1674|16:15|INPLAYCOMMIT|KD	0	19:54:23.538	Core 04	2026.06.05 16:15:00   [SRJ-EA] INPLAYCOMMIT bar=2026.06.05 16:10 dir=LONG zoneSrc=XOB zoneLo=159.881 zoneHi=159.916 promoT=2026.06.05 15:40 applied=1 bounded=1 scanned=2 swings=1 hits=0 firstShift=-1 firstVal=- commitVia=none legacy=0 legacyVia=none committed=0 changed=0 haveStop=1
1675|16:15|B60C|QO	0	19:54:23.538	Core 04	2026.06.05 16:15:00   [SRJ-EA] B60C bar=2026.06.05 16:10 dir=LONG poi=Monthly-POC rt=2026.06.05 16:00 rSh=3 rBar=2026.06.05 16:00 cSrc=RETEST xt=1 zxob=159.881-159.916 xpromo=2026.06.05 15:40 - C satisfied by the retest candle ([B-61 C2][B-129 XT])
1678|16:15|TP_ELECT|JE	0	19:54:23.538	Core 04	2026.06.05 16:15:00   [SRJ-EA] TP_ELECT shadow=true entry=160.059 sl=159.598 tp=160.723 R=1.44 bar=2026.06.05 16:10 latchBar=2026.06.05 16:15
1679|16:15|A6FIRED|QI	0	19:54:23.538	Core 04	2026.06.05 16:15:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.05 16:10 dir=LONG tp=160.723 r=1.44 sl=159.598 mode=1SWING div=regular
1680|16:15|DEAL|KL	0	19:54:23.538	Core 04	2026.06.05 16:15:00   deal #8 buy 0.34 USDJPY at 160.065 done (based on order #8)

### B3 11 Jun NY LONG (JUNE0525-B137/2026-06-11.csv)
2603|14:40|ZONEPICK|IH	0	19:54:23.538	Core 04	2026.06.11 14:40:22   [SRJ-EA] ZONEPICK bar=2026.06.11 14:35 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=160.489-160.504
2604|14:40|INPLAYCOMMIT|GD	0	19:54:23.538	Core 04	2026.06.11 14:40:22   [SRJ-EA] INPLAYCOMMIT bar=2026.06.11 14:35 dir=LONG zoneSrc=XOB zoneLo=160.489 zoneHi=160.504 promoT=2026.06.11 08:30 applied=1 bounded=1 scanned=110 swings=20 hits=8 firstShift=40 firstVal=160.501 commitVia=SWING legacy=1 legacyVia=SWINGLEG committed=1 changed=0 haveStop=1
2606|14:40|B60C|JI	0	19:55:18.488	Core 04	2026.06.11 14:40:22   [SRJ-EA] B60C bar=2026.06.11 14:35 dir=LONG poi=Daily-POC rt=2026.06.11 14:05 rSh=7 rBar=2026.06.11 14:05 cSrc=BOTH xt=0 zxob=160.489-160.504 xpromo=2026.06.11 08:30 - C satisfied by retest and prior candles ([B-61 C2][B-129 XT])
2611|14:40|TP_ELECT|PN	0	19:55:18.488	Core 04	2026.06.11 14:40:22   [SRJ-EA] TP_ELECT shadow=true entry=160.524 sl=160.501 tp=160.587 R=2.74 bar=2026.06.11 14:35 latchBar=2026.06.11 14:40
2612|14:40|A6FIRED|IJ	0	19:55:18.488	Core 04	2026.06.11 14:40:22   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.11 14:35 dir=LONG tp=160.587 r=2.74 sl=160.501 mode=1SWING div=regular
2613|14:40|DEAL|OJ	0	19:55:18.488	Core 04	2026.06.11 14:40:22   deal #10 buy 5.63 USDJPY at 160.530 done (based on order #10)

### C-06-03 3 Jun LONG (JUNE0525-B137/2026-06-03.csv)
1103|09:05|ZONEPICK|RR	0	19:53:46.907	Core 04	2026.06.03 09:05:05   [SRJ-EA] ZONEPICK bar=2026.06.03 09:00 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=159.906-159.913
1104|09:05|INPLAYCOMMIT|DP	0	19:53:46.907	Core 04	2026.06.03 09:05:05   [SRJ-EA] INPLAYCOMMIT bar=2026.06.03 09:00 dir=LONG zoneSrc=XOB zoneLo=159.906 zoneHi=159.913 promoT=2026.06.03 09:00 applied=1 bounded=1 scanned=2 swings=1 hits=0 firstShift=-1 firstVal=- commitVia=BAR legacy=1 legacyVia=BAR committed=1 changed=0 haveStop=1
1110|09:10|B60C|QN	0	19:53:46.907	Core 04	2026.06.03 09:10:00   [SRJ-EA] B60C bar=2026.06.03 09:05 dir=LONG poi=Daily-VWAP rt=2026.06.03 09:00 rSh=2 rBar=2026.06.03 09:00 cSrc=BOTH xt=0 zxob=159.906-159.913 xpromo=2026.06.03 09:00 - C satisfied by retest and prior candles ([B-61 C2][B-129 XT])
1113|09:10|TP_ELECT|QP	0	19:53:46.907	Core 04	2026.06.03 09:10:00   [SRJ-EA] TP_ELECT shadow=true entry=159.929 sl=159.889 tp=159.983 R=1.35 bar=2026.06.03 09:05 latchBar=2026.06.03 09:10
1114|09:10|A6FIRED|MM	0	19:53:46.907	Core 04	2026.06.03 09:10:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.03 09:05 dir=LONG tp=159.983 r=1.35 sl=159.889 mode=1SWING div=hidden
1115|09:10|DEAL|OQ	0	19:53:46.907	Core 04	2026.06.03 09:10:00   deal #4 buy 3.75 USDJPY at 159.932 done (based on order #4)

### C-06-04 4 Jun SHORT (JUNE0525-B137/2026-06-04.csv)
1388|09:50|ZONEID|JJ	0	19:54:05.225	Core 04	2026.06.04 09:50:00   [SRJ-EA] ZONEID bar=2026.06.04 09:45 site=S3PICK xobId=3052 fvgId=0
1389|09:50|XOBPROMO|KF	0	19:54:05.225	Core 04	2026.06.04 09:50:00   [SRJ-EA] XOBPROMO bar=2026.06.04 09:45 site=S3PICK xobId=3052 raw=1780548600.0 promoT=2026.06.04 04:50
1390|09:50|ZONEPICK|ND	0	19:54:05.225	Core 04	2026.06.04 09:50:00   [SRJ-EA] ZONEPICK bar=2026.06.04 09:45 dir=SHORT haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0 downgraded=0 fvg=--- xob=160.001-160.012
1391|09:50|INPLAYCOMMIT|GI	0	19:54:05.225	Core 04	2026.06.04 09:50:00   [SRJ-EA] INPLAYCOMMIT bar=2026.06.04 09:45 dir=SHORT zoneSrc=XOB zoneLo=160.001 zoneHi=160.012 promoT=2026.06.04 04:50 applied=1 bounded=1 scanned=97 swings=20 hits=2 firstShift=95 firstVal=160.011 commitVia=SWING legacy=0 legacyVia=none committed=1 changed=1 haveStop=1
1397|09:55|B60C|GG	0	19:54:05.225	Core 04	2026.06.04 09:55:00   [SRJ-EA] B60C bar=2026.06.04 09:50 dir=SHORT poi=Daily-POC rt=2026.06.04 09:10 rSh=9 rBar=2026.06.04 09:10 cSrc=BOTH xt=0 zxob=160.001-160.012 xpromo=2026.06.04 04:50 - C satisfied by retest and prior candles ([B-61 C2][B-129 XT])
1400|09:55|TP_ELECT|QS	0	19:54:05.225	Core 04	2026.06.04 09:55:00   [SRJ-EA] TP_ELECT shadow=true entry=159.868 sl=159.920 tp=159.748 R=2.31 bar=2026.06.04 09:50 latchBar=2026.06.04 09:55
1401|09:55|A6FIRED|GQ	0	19:54:05.225	Core 04	2026.06.04 09:55:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.06.04 09:50 dir=SHORT tp=159.748 r=2.31 sl=159.920 mode=1SWING div=hidden
1402|09:55|DEAL|NI	0	19:54:05.225	Core 04	2026.06.04 09:55:00   deal #6 sell 3.15 USDJPY at 159.868 done (based on order #6)

### C-05-27 BESIDE (JUNE0525-B137/2026-05-27.csv, never graded)
86|15:30|ZONEPICK|FQ	0	19:52:39.743	Core 04	2026.05.27 15:30:00   [SRJ-EA] ZONEPICK bar=2026.05.27 15:25 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=0 downgraded=0 fvg=--- xob=159.190-159.208
87|15:30|INPLAYCOMMIT|JL	0	19:52:39.743	Core 04	2026.05.27 15:30:00   [SRJ-EA] INPLAYCOMMIT bar=2026.05.27 15:25 dir=LONG zoneSrc=XOB zoneLo=159.190 zoneHi=159.208 promoT=2026.05.27 06:40 applied=1 bounded=1 scanned=108 swings=19 hits=2 firstShift=97 firstVal=159.197 commitVia=SWING legacy=0 legacyVia=none committed=1 changed=1 haveStop=1
92|15:35|B60C|KF	0	19:52:39.743	Core 04	2026.05.27 15:35:00   [SRJ-EA] B60C bar=2026.05.27 15:30 dir=LONG poi=Daily-POC rt=2026.05.27 15:25 rSh=2 rBar=2026.05.27 15:25 cSrc=BOTH xt=0 zxob=159.190-159.208 xpromo=2026.05.27 06:40 - C satisfied by retest and prior candles ([B-61 C2][B-129 XT])
95|15:35|TP_ELECT|JJ	0	19:52:39.743	Core 04	2026.05.27 15:35:00   [SRJ-EA] TP_ELECT shadow=true entry=159.340 sl=159.197 tp=160.723 R=9.67 bar=2026.05.27 15:30 latchBar=2026.05.27 15:35
96|15:35|A6FIRED|PK	0	19:52:39.743	Core 04	2026.05.27 15:35:00   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.05.27 15:30 dir=LONG tp=160.723 r=9.67 sl=159.197 mode=1SWING div=regular
97|15:35|DEAL|DN	0	19:52:39.743	Core 04	2026.05.27 15:35:00   deal #2 buy 1.08 USDJPY at 159.344 done (based on order #2)

### OTHER-GATE killing rows
B1|1609|09:30|ABORT|MQ	0	19:54:17.433	Core 04	2026.06.05 09:30:00   [SRJ-EA] 2026.06.05 09:30:00 ABORT reason=SEEDBIAS_REFUSED state=S2_LTF_ALIGN poi=Daily-POC dir=SHORT
C-06-02|984|15:35|CONFIRMPOLL|DJ	0	19:53:40.806	Core 04	2026.06.02 15:35:08   [SRJ-EA] CONFIRMPOLL bar=2026.06.02 15:30 anchor=Monthly-POC dir=LONG oppCandle=1 bodyDir=1 body=13pts doji=0 touchAttr=0 confirm=0 shadow=true
C-06-10|2441|16:10|S54KILL|JD	0	19:55:06.276	Core 04	2026.06.10 16:10:00   [SRJ-EA] S54KILL bar=2026.06.10 15:45 line=Daily-POC lineVal=160.354 o=160.394 c=160.351 rt=2026.06.10 15:30 - pre-confirmation POI body-break death ([B-68 hunk S])
C-08-27|505|17:05|CONFIRMPOLL|KH	0	19:47:55.434	Core 04	2026.08.27 17:05:00   [SRJ-EA] CONFIRMPOLL bar=2026.08.27 17:00 anchor=Weekly-VWAP dir=SHORT oppCandle=1 bodyDir=1 body=12pts doji=0 touchAttr=0 confirm=0 shadow=true
C-09-01-1530|1414|15:30|ABORT|FL	0	19:48:38.174	Core 04	2026.09.01 15:30:00   [SRJ-EA] 2026.09.01 15:30:00 ABORT reason=LTF_MISALIGN state=S5_GATE_CHECK poi=Monthly-POC dir=SHORT
C-09-04-1040|2131|10:45|CONFIRMPOLL|HO	0	19:49:20.911	Core 04	2026.09.04 10:45:00   [SRJ-EA] CONFIRMPOLL bar=2026.09.04 10:40 anchor=Daily-POC dir=SHORT oppCandle=0 bodyDir=0 body=18pts doji=0 touchAttr=1 confirm=0 shadow=true
C-08-28-1625|970|16:25|ABORT|RE	0	19:48:07.643	Core 04	2026.08.28 16:25:00   [SRJ-EA] 2026.08.28 16:25:00 ABORT reason=TP_RR_FAIL state=S5_GATE_CHECK poi=Daily-POC dir=SHORT
C-09-08-1645|3379|16:45|ABORT|KN	0	19:49:51.437	Core 04	2026.09.08 16:45:01   [SRJ-EA] 2026.09.08 16:45:01 ABORT reason=TP_RR_FAIL state=S5_GATE_CHECK poi=Monthly-POC dir=SHORT

## R2 bar rows (Tester/logs/20261009.log UJBARMAP; commit-candle triples + deciding ranges)
A2-commit|2026.09.01 16:55 o=1.15996 h=1.16022 l=1.15980 c=1.16009 ltf=1.0 (triple 16:50 l=1.15986 / 17:00 l=1.15989)
A4-commit|2026.09.07 08:40 o=1.16106 h=1.16109 l=1.16098 c=1.16104 ltf=1.0
A5-commit|2026.09.07 16:05 o=1.16247 h=1.16251 l=1.16238 c=1.16245 ltf=1.0
A6/A7-commit|2026.09.03 21:25 h=1.16364 l=1.16336 ltf=-1.0 (triple 21:20 h=1.16352 / 21:30 h=1.16352)
B3-commit|2026.06.11 11:15 o=160.509 h=160.512 l=160.501 c=160.510 ltf=1.0 (neighbors 11:10 l=160.503 / 11:20 l=160.504)
C-06-04-commit|2026.06.04 01:50 o=160.028 h=160.011 l=159.993 c=160.005 ltf=-1.0 (neighbors 01:45 h=160.010 / 01:55 h=159.995)
C-06-04-stop|2026.06.04 09:20 o=159.909 h=159.920 l=159.900 c=159.903 ltf=1.0 (triple 09:15 h=159.910 / 09:25 h=159.906)
C-05-27-commit|2026.05.27 07:20 o=159.208 h=159.213 l=159.197 c=159.221 ltf=-1.0 (neighbors 07:15 l=159.201 / 07:25 l=159.207)
C4-0950|2026.06.04 09:50 o=159.884 h=159.886 l=159.860 c=159.868 ltf=-1.0
C4-0955|2026.06.04 09:55 o=159.868 h=159.906 l=159.867 c=159.901 ltf=-1.0
A7-1655|2026.09.08 16:55 o=1.16226 h=1.16230 l=1.16210 c=1.16220 ltf=-1.0
A7-1650|2026.09.08 16:50 o=1.16218 h=1.16233 l=1.16208 c=1.16225 ltf=-1.0
A6-1005|2026.09.08 10:05 o=1.16222 h=1.16232 l=1.16206 c=1.16207 ltf=-1.0

## R4 artifact rows (00_CURRENT_WORKING; epochs are server = UTC)

### June 09:55 beside (XOBDIAG_JUNE_TARGETS.csv barT 1780566900; INCREMENTAL build 2026.10.08 21:25:54 pass 2)
3038|S hi=160.08700000 lo=160.07500000 startT=1780530600 createT=1780531200 promoT=1780531500 valid=1 active=1 promoted=1 invalT=NA
3046|S hi=160.07400000 lo=159.99400000 startT=1780534800 createT=1780535100 promoT=1780548600 valid=1 active=1 promoted=1 invalT=NA
3052|S hi=160.01200000 lo=160.00100000 startT=1780537200 createT=1780537500 promoT=1780548600 valid=1 active=1 promoted=1 invalT=NA
3053|S hi=160.01000000 lo=160.00100000 promoT=NA valid=1 active=1 promoted=0 invalT=NA
3083|S hi=159.94400000 lo=159.91700000 promoT=NA valid=1 active=1 promoted=0 invalT=NA
3089|S hi=159.98700000 lo=159.98000000 promoT=NA valid=1 active=1 promoted=0 invalT=NA
3095|S hi=159.98200000 lo=159.97700000 promoT=NA valid=1 active=1 promoted=0 invalT=NA
3103|S hi=159.92700000 lo=159.90900000 promoT=NA valid=1 active=1 promoted=0 invalT=NA

### EU 16:50 beside (XOBDIAG_RECON62_EU_TARGETS.csv barT 1788886200; INCREMENTAL build 2026.10.08 20:34:34 pass 2; promoted-live only)
1389|S 1.17107-1.17072 promo=1787320500 NA | 1401|S 1.17006-1.16975 promo=1787326800 NA | 1403|S 1.16978-1.16950 promo=1787326500 NA | 1481|S 1.16871-1.16836 promo=1787544600 NA | 1484|S 1.16855-1.16822 promo=1787545200 NA | 1495|S 1.16839-1.16830 promo=1787549700 NA | 1516|S 1.16817-1.16800 promo=1787561100 NA | 1704|S 1.16647-1.16580 promo=1787760000 NA | 1728|S 1.16624-1.16596 promo=1787760000 NA | 1784|S 1.16787-1.16754 promo=1787701200 NA | 1891|S 1.16640-1.16612 promo=1787760000 NA | 2109|S 1.16537-1.16505 promo=1787893500 NA | 2149|S 1.16507-1.16492 promo=1787899200 NA | 2217|S 1.16436-1.16415 promo=1787936400 NA | 2896|S 1.16381-1.16362 promo=1788468600 NA | 2898|S 1.16377-1.16362 promo=1788471300 NA startT=1788467400 (machine pick)
(+ 20 unpromoted-live short incl 3334 1.16250-1.16219 touched by 16:55 range but relevance fails)

### EU 10:00 beside (barT 1788861600; promoted-live only)
1389,1401,1403,1481,1484,1495,1516,1704,1728,1784,1891,2109,2149,2217,2896,2898 (same zones as 16:50 list; + 19 unpromoted-live)

(End of slice)
