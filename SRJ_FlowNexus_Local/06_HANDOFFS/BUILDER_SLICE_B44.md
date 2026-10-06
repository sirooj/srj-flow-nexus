# BUILDER SLICE B-44 - raw rows behind P, j31 grade, j32 kills (line numbers; payloads only)
j31 = RECON62-B44_JOURNAL.log (diagnostic build); j32 = JUNE-B44-S5_JOURNAL.log (S5 window, diagnostic build). Diagnostic SHAs: EA 4643FDEB, OrderblockMgr 6E47429F, EA ex5 747055B9, FlowLogic ex5 36EA3224. XPOI_NA=0.

## P1 platform hits
59 - BLANK-FVG (his words 2026-09-22: blank FVG is the legacy PineScript meaning that the FVG anchor detection is faulty). Amended point: a blank FVG status on the pane means faulty anchor detection - treat as fault, never as valid-or-invalid. Pane color expectation: grey (2+ invalid terms) or lighter red (1 invalid term).

## P3 clock quote
2193     words only â€” "London session", "NY AM session" (his GMT+7: broker

## j31 filed rows
71389 A6FIRED class=SELECTED state=FIRED bar=2026.08.28 10:00 dir=SHORT tp=1.16364 r=2.43 sl=1.16508 mode=2SWING div=regular
71391 ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-VWAP | LONDON | R=2.43 SL 1.16508 TP 1.16364 spr=4
71405 ENTRY_TICKET bar=2026.08.28 10:00 ticket=2 deal=2 pid=2 ppid=2 magic=773001
71865 MTEXIT bar=2026.08.28 11:40 reason=POI_BODY_BREAK line=Daily-POC lineVal=1.16451 entry=1.16466 exit=1.16439
71873 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | POI_BODY_BREAK [Daily-POC] at 1.16439 (entry 1.16466)
90692 A6FIRED class=SELECTED state=FIRED bar=2026.09.01 17:30 dir=LONG tp=1.16077 r=1.17 sl=1.15975 mode=1SWING div=hidden
90694 ALERT SRJ SIGNAL LONG EURUSD M5 | Monthly-VWAP | NYAM | R=1.17 SL 1.15975 TP 1.16077 spr=2
90710 ENTRY_TICKET bar=2026.09.01 17:30 ticket=4 deal=4 pid=4 ppid=4 magic=773002
90812 MTEXIT bar=2026.09.01 17:50 reason=SL line=- lineVal=- entry=1.16022 exit=1.15975
90814 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | SL at 1.15975 (entry 1.16022)
108848 A6FIRED class=SELECTED state=FIRED bar=2026.09.04 15:55 dir=LONG tp=1.16302 r=1.66 sl=1.15847 mode=1SWING div=hidden
108850 ALERT SRJ SIGNAL LONG EURUSD M5 | Yearly-POC | NYAM | R=1.66 SL 1.15847 TP 1.16302 spr=1
108864 ENTRY_TICKET bar=2026.09.04 15:55 ticket=6 deal=6 pid=6 ppid=6 magic=773002
109689 UJRETARGET_BROKER bar=2026.09.04 19:00 ticket=6 oldTp=1.16302 newTp=1.16270 sl=1.15847 ok=1 rc=10009 action=SENT
110826 MTEXIT bar=2026.09.04 23:50 reason=DAY_CLOSE line=- lineVal=- entry=1.16018 exit=1.16129
110834 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | DAY_CLOSE at 1.16129 (entry 1.16018)
112296 A6FIRED class=SELECTED state=FIRED bar=2026.09.07 09:15 dir=LONG tp=1.16200 r=1.76 sl=1.16098 mode=1SWING div=hidden
112298 ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-POC | LONDON | R=1.76 SL 1.16098 TP 1.16200 spr=3
112312 ENTRY_TICKET bar=2026.09.07 09:15 ticket=8 deal=8 pid=8 ppid=8 magic=773001
112758 MTEXIT bar=2026.09.07 10:50 reason=TP_TOUCH line=- lineVal=- entry=1.16135 exit=1.16200
112760 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | TP_TOUCH at 1.16200 (entry 1.16135)
115631 A6FIRED class=SELECTED state=FIRED bar=2026.09.07 16:40 dir=LONG tp=1.16315 r=2.34 sl=1.16238 mode=1SWING div=hidden
115633 ALERT SRJ SIGNAL LONG EURUSD M5 | Weekly-POC | NYAM | R=2.34 SL 1.16238 TP 1.16315 spr=3
115647 ENTRY_TICKET bar=2026.09.07 16:40 ticket=10 deal=10 pid=10 ppid=10 magic=773002
115788 MTEXIT bar=2026.09.07 17:10 reason=TP_TOUCH line=- lineVal=- entry=1.16261 exit=1.16315
115790 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | TP_TOUCH at 1.16315 (entry 1.16261)
117984 A6FIRED class=SELECTED state=FIRED bar=2026.09.08 10:05 dir=SHORT tp=1.16102 r=1.94 sl=1.16258 mode=1SWING div=hidden
117986 ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | LONDON | R=1.94 SL 1.16258 TP 1.16102 spr=1
118002 ENTRY_TICKET bar=2026.09.08 10:05 ticket=12 deal=12 pid=12 ppid=12 magic=773001
118182 MTEXIT bar=2026.09.08 10:40 reason=TP_TOUCH line=- lineVal=- entry=1.16205 exit=1.16102
118184 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | TP_TOUCH at 1.16102 (entry 1.16205)
120581 A6FIRED class=SELECTED state=FIRED bar=2026.09.08 16:55 dir=SHORT tp=1.16114 r=1.96 sl=1.16274 mode=1SWING div=regular
120583 ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | NYAM | R=1.96 SL 1.16274 TP 1.16114 spr=3
120597 ENTRY_TICKET bar=2026.09.08 16:55 ticket=14 deal=14 pid=14 ppid=14 magic=773002
120789 MTEXIT bar=2026.09.08 17:30 reason=SL line=- lineVal=- entry=1.16220 exit=1.16274
120791 ALERT SRJ EXIT NONE EURUSD M5 | - | NONE | SL at 1.16274 (entry 1.16220)

## j31 A2RECLAIM
83774 A2RECLAIM bar=2026.08.31 16:10 anchor=Weekly-POC dir=SHORT c1=1.15978 L=1.15976 o0=1.15976 c0=1.15965 - prior close irrelevant (B38)
83782 A2RECLAIM bar=2026.08.31 16:10 anchor=Weekly-POC dir=SHORT c1=1.15978 L=1.15976 o0=1.15976 c0=1.15965 - prior close irrelevant (B38)
102251 A2RECLAIM bar=2026.09.03 14:05 anchor=Daily-POC dir=LONG c1=1.16030 L=1.16030 o0=1.16032 c0=1.16056 - prior close irrelevant (B38)
102255 A2RECLAIM bar=2026.09.03 14:05 anchor=Daily-POC dir=LONG c1=1.16030 L=1.16030 o0=1.16032 c0=1.16056 - prior close irrelevant (B38)
102256 A2RECLAIM bar=2026.09.03 14:05 anchor=Daily-POC dir=LONG c1=1.16030 L=1.16030 o0=1.16032 c0=1.16056 - prior close irrelevant (B38)
102263 A2RECLAIM bar=2026.09.03 14:05 anchor=Daily-POC dir=LONG c1=1.16030 L=1.16030 o0=1.16032 c0=1.16056 - prior close irrelevant (B38)
102286 A2RECLAIM bar=2026.09.03 14:05 anchor=Daily-POC dir=LONG c1=1.16030 L=1.16030 o0=1.16032 c0=1.16056 - prior close irrelevant (B38)
102291 A2RECLAIM bar=2026.09.03 14:05 anchor=Daily-POC dir=LONG c1=1.16030 L=1.16030 o0=1.16032 c0=1.16056 - prior close irrelevant (B38)

## j32 window+balance
17 GF	0	16:46:22.410	Tester	USDJPY,M5 (Dukascopy-demo-mt5-1): testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.06.05 00:00 to 2026.06.06 00:00
43 QS	0	16:46:29.773	Core 04	USDJPY,M5: testing of Experts\SRJ_FlowNexus_EA.ex5 from 2026.06.05 00:00 to 2026.06.06 00:00 started with inputs:
52273 DJ	0	16:46:41.220	Core 04	final balance 10044.42 USD

## j32 SRJ INV 07-10 (with levels)
49212 JK	0	16:46:29.773	Core 04	2026.06.05 07:25:45   SRJ INV t=2026.06.05 07:20 bar=106420 obStart=106414 obStartT=2026.06.05 06:50 obVal=106416 obInv=106420 obCreation=106415 isBull=0 bias=bearish ref=106409 refT=2026.06.05 06:25 refOk=1 sameBarValInv=0 top=159.965 bot=159.951 mid=159.958 killClose=159.960
49214 LN	0	16:46:29.773	Core 04	2026.06.05 07:25:45   SRJ INV t=2026.06.05 07:20 bar=106420 obStart=106395 obStartT=2026.06.05 05:15 obVal=106417 obInv=106420 obCreation=106396 isBull=0 bias=bearish ref=106409 refT=2026.06.05 06:25 refOk=1 sameBarValInv=0 top=159.971 bot=159.943 mid=159.957 killClose=159.960
49432 ID	0	16:46:35.849	Core 04	2026.06.05 08:10:00   SRJ INV t=2026.06.05 08:05 bar=106429 obStart=106423 obStartT=2026.06.05 07:35 obVal=106428 obInv=106429 obCreation=106424 isBull=1 bias=bullish ref=106420 refT=2026.06.05 07:20 refOk=1 sameBarValInv=0 top=159.968 bot=159.955 mid=159.962 killClose=159.959
49458 NQ	0	16:46:35.849	Core 04	2026.06.05 08:15:04   SRJ INV t=2026.06.05 08:10 bar=106430 obStart=106426 obStartT=2026.06.05 07:50 obVal=106428 obInv=106430 obCreation=106428 isBull=1 bias=bullish ref=106420 refT=2026.06.05 07:20 refOk=1 sameBarValInv=0 top=159.961 bot=159.955 mid=159.958 killClose=159.957
49510 IQ	0	16:46:35.849	Core 04	2026.06.05 08:25:00   SRJ INV t=2026.06.05 08:20 bar=106432 obStart=106413 obStartT=2026.06.05 06:45 obVal=106414 obInv=106432 obCreation=106414 isBull=1 bias=bearish ref=106430 refT=2026.06.05 08:10 refOk=1 sameBarValInv=0 top=159.954 bot=159.943 mid=159.949 killClose=159.929
49512 ED	0	16:46:35.849	Core 04	2026.06.05 08:25:00   SRJ INV t=2026.06.05 08:20 bar=106432 obStart=106393 obStartT=2026.06.05 05:05 obVal=106395 obInv=106432 obCreation=106395 isBull=1 bias=bearish ref=106430 refT=2026.06.05 08:10 refOk=1 sameBarValInv=0 top=159.954 bot=159.943 mid=159.949 killClose=159.929
49569 PL	0	16:46:35.849	Core 04	2026.06.05 08:35:12   SRJ INV t=2026.06.05 08:30 bar=106434 obStart=106383 obStartT=2026.06.05 04:15 obVal=106384 obInv=106434 obCreation=106384 isBull=1 bias=bearish ref=106430 refT=2026.06.05 08:10 refOk=1 sameBarValInv=0 top=159.936 bot=159.918 mid=159.927 killClose=159.922
49615 MS	0	16:46:35.849	Core 04	2026.06.05 08:45:01   SRJ INV t=2026.06.05 08:40 bar=106436 obStart=106387 obStartT=2026.06.05 04:35 obVal=106432 obInv=106436 obCreation=106389 isBull=0 bias=bearish ref=106430 refT=2026.06.05 08:10 refOk=1 sameBarValInv=0 top=159.949 bot=159.931 mid=159.940 killClose=159.943
49803 OH	0	16:46:35.849	Core 04	2026.06.05 09:15:00   SRJ INV t=2026.06.05 09:10 bar=106442 obStart=106439 obStartT=2026.06.05 08:55 obVal=106441 obInv=106442 obCreation=106441 isBull=0 bias=bullish ref=106439 refT=2026.06.05 08:55 refOk=1 sameBarValInv=0 top=159.962 bot=159.949 mid=159.956 killClose=159.961
50058 DO	0	16:46:35.849	Core 04	2026.06.05 09:25:04   SRJ INV t=2026.06.05 09:20 bar=106444 obStart=106440 obStartT=2026.06.05 09:00 obVal=106442 obInv=106444 obCreation=106442 isBull=1 bias=bullish ref=106439 refT=2026.06.05 08:55 refOk=1 sameBarValInv=0 top=159.968 bot=159.949 mid=159.959 killClose=159.952
50278 PI	0	16:46:35.849	Core 04	2026.06.05 09:55:00   SRJ INV t=2026.06.05 09:50 bar=106450 obStart=106432 obStartT=2026.06.05 08:20 obVal=106439 obInv=106450 obCreation=106433 isBull=1 bias=bullish ref=106439 refT=2026.06.05 08:55 refOk=1 sameBarValInv=0 top=159.957 bot=159.920 mid=159.938 killClose=159.932

## j32 09:40 refusal
50179 UJPOOLCOV req=2026.04.29 ach=2026.04.29 days=28 famRead=448 unavail=0 emptyValid=19 state=2 attempt=2 poolGen=2 cadence=no-rebuild
50208 2026.06.05 09:40:00 STATE IDLE->S1_REGIME dir=SHORT poi=Daily-POC
50219 2026.06.05 09:40:00 STATE S1_REGIME->S2_LTF_ALIGN dir=SHORT poi=Daily-POC
50222 2026.06.05 09:40:00 ABORT reason=SEEDBIAS_REFUSED state=S2_LTF_ALIGN poi=Daily-POC dir=SHORT
50223 A6REFUSED class=ABSENT_DECLINED bar=2026.06.05 09:40 state=S2_LTF_ALIGN dir=SHORT predicate=SEEDBIAS_REFUSED
50224 2026.06.05 09:40:00 STATE S2_LTF_ALIGN->ABORT dir=SHORT poi=Daily-POC

## j32 filed+deals
51541 A6FIRED class=SELECTED state=FIRED bar=2026.06.05 16:50 dir=LONG tp=160.723 r=1.56 sl=159.726 mode=1SWING div=regular
51552 NS	0	16:46:41.220	Core 04	2026.06.05 16:55:00   deal #2 buy 0.4 USDJPY at 160.120 done (based on order #2)
51557 ENTRY_TICKET bar=2026.06.05 16:50 ticket=2 deal=2 pid=2 ppid=2 magic=773002
51900 MG	0	16:46:41.220	Core 04	2026.06.05 19:16:32   deal #3 sell 0.4 USDJPY at 160.298 done (based on order #3)
51910 MTEXIT bar=2026.06.05 19:15 reason=TP_TOUCH line=- lineVal=- entry=160.115 exit=160.298

## j32 CLOCK rows
78 GN	0	16:46:29.773	Core 04	2026.06.05 00:00:00   [SRJ-EA][CLOCK] TimeCurrent=2026.06.05 00:00:00 TimeGMT=2026.06.05 00:00:00 srvMinusGmt=+0s gtc_serverGmtBase=+7200s offsetNow=+0.00h tester=YES
79 NI	0	16:46:29.773	Core 04	2026.06.05 00:00:00   [SRJ-EA][CLOCK] session windows resolved to SERVER frame from ET date 2026.06.05:  LONDON 02:00-05:00 ET = 2026.06.05 09:00 .. 2026.06.05 12:00   |   NYAM 07:00-12:00 ET = 2026.06.05 14:00 .. 2026.06.05 19:00
80 DH	0	16:46:29.773	Core 04	2026.06.05 00:00:00   [SRJ-EA][CLOCK] WARNING: TESTER RUN with TimeGMT()==TimeCurrent()...

## EA diff vs .preB44 (print args only)
                      //--- [P-UJIMPL-IMPL-1 v8 IE1] confirmed selection (F252
                      //--- inUseConfirmedHTFOnly; EU preservation sibling row
                      //--- grades the global effect).
-                     PERIOD_H4, PERIOD_H1, PERIOD_M15, true, 60);
+                     PERIOD_H4, PERIOD_H1, PERIOD_M15, true, 60,
+                     0, 0, 0, true, "2026.06.05 07:00", "2026.06.05 10:00");   //--- [B44DIAG] 0 = XPOI_NA (B-40 P1: ENUM_XPOI first member, FlowLogic 235); debug window for 5 June DEC rows
    PrintFormat("[SRJ-EA] Flow handle=%d err=%d", g_hFlow, GetLastError());
     if(g_hPoi == INVALID_HANDLE || g_hCqd == INVALID_HANDLE || g_hFlow == INVALID_HANDLE)
       { Print("[SRJ-EA] OnInit FAILED: one or more iCustom handles are invalid."); return INIT_FAILED; }

## OrderblockMgr diff vs .preB44 (print fields only)
                   " obCreation=", ob.creationBar,  // NEW
                   " isBull=", (ob.isBullish ? 1 : 0),
                   " bias=", g_s.currentBias,
-                  " ref=", countReferenceBar,
-                  " refT=", SRJ_BarTimeStr(countReferenceBar),
-                  " refOk=", (refOk ? 1 : 0),
-                  " sameBarValInv=", (sameBarValInv ? 1 : 0));
+                   " ref=", countReferenceBar,
+                   " refT=", SRJ_BarTimeStr(countReferenceBar),
+                   " refOk=", (refOk ? 1 : 0),
+                   " sameBarValInv=", (sameBarValInv ? 1 : 0),
+                   " top=", DoubleToString(ob.high, _Digits),
+                   " bot=", DoubleToString(ob.low, _Digits),
+                   " mid=", DoubleToString(ob.invalidationLevel, _Digits),
+                   " killClose=", DoubleToString(barClose, _Digits));   //--- [B44DIAG] print-only
 
          if(refOk)
            {
@@ -534,10 +538,14 @@ void SRJ_OB_ActivationInvalidationPass(const double &open[],const double &high[]
                         " obCreation=", ob.creationBar,  // NEW debug output
                         " isBull=", (ob.isBullish ? 1 : 0),
                         " bias=", g_s.currentBias,
-                        " ref=", countReferenceBar,
-                        " refT=", SRJ_BarTimeStr(countReferenceBar),
-                        " refOk=", (refOk ? 1 : 0),
-                        " sameBarValInv=", (sameBarValInv ? 1 : 0));
+                         " ref=", countReferenceBar,
+                         " refT=", SRJ_BarTimeStr(countReferenceBar),
+                         " refOk=", (refOk ? 1 : 0),
+                         " sameBarValInv=", (sameBarValInv ? 1 : 0),
+                         " top=", DoubleToString(ob.high, _Digits),
+                         " bot=", DoubleToString(ob.low, _Digits),
+                         " mid=", DoubleToString(ob.invalidationLevel, _Digits),
+                         " killClose=", DoubleToString(liveClose, _Digits));   //--- [B44DIAG] print-only
                
                if(refOk)
                  {
@@ -806,8 +814,11 @@ void SRJ_DumpNearestOBCandidates(const int i,const string bias,const int boundar
             " act=", (ob.isActivated ? 1 : 0),
             " valid=", (ob.isValid ? 1 : 0),
             " isExtreme=", (ob.isExtreme ? 1 : 0),
-            " promoted=", (ob.isPromoted ? 1 : 0),
-            " reject=", reason);
+             " promoted=", (ob.isPromoted ? 1 : 0),
+             " reject=", reason,
+             " top=", DoubleToString(ob.high, _Digits),
+             " bot=", DoubleToString(ob.low, _Digits),
+             " mid=", DoubleToString(ob.invalidationLevel, _Digits));   //--- [B44DIAG] print-only
      }
   }
 
