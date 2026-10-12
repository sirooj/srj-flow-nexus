# BUILDER SLICE B-189 - raw rows, spots, full diff (under 600 lines)

Base: builder/B-189 cut at 036a622 (backup exact). One indicator hunk (a31259b5), one compile (0 errors, 3 pre-existing warnings), one trial run (RECON62-B189 pass 0:03:15, 563338/3168), K-3 STOP, restored at once. Verdict RESTORED.

## K-3 full path rows (RECON62-B189/2026-09-02.csv, raw)
- pack 665: `NI	0	18:06:55.298	Core 04	2026.09.02 10:25:01   [SRJ-EA] ANCHOR_ELECT bar=2026.09.02 10:20 action=SEED poi=FOMC-VWAP rank=1 tier=0 dir=LONG`
- pack 666: `QN	0	18:06:55.298	Core 04	2026.09.02 10:25:01   [SRJ-EA] REGIMECENSUS #113 bar=2026.09.02 10:20 dir=LONG votes=0 trendOk=0 sweepTag=2 mrOk=1 cumMR=12` (baseline same bar: votes=0 trendOk=0 sweepTag=0 mrOk=0)
- pack 298: `KP	0	18:06:49.177	Core 04	2026.09.02 09:40:02   [SRJ-IND] B182SWEEP tag=pAS.L bar=2026.09.02 09:35`
- pack 325: `MR	0	18:06:49.177	Core 04	2026.09.02 09:40:02   [SRJ-IND] B176HZ GAP_TOUCH side=B t=2026.09.02 09:35 o=1.15773 h=1.15776 l=1.15744 c=1.15751 remBefore=1.15754-1.15764 remAfter=EMPTY`
- pack 708: `[SRJ-EA] CONFIRMPOLL bar=2026.09.02 10:25 anchor=FOMC-VWAP dir=LONG oppCandle=1 bodyDir=1 body=8pts doji=0 touchAttr=1 confirm=1 shadow=true`
- pack 710/711: ZONEPICK/INPLAYCOMMIT zone XOB 1.15530-1.15548 promoT 2026.08.14 14:20 applied=1
- pack 721: `[SRJ-EA] B157SL bar=2026.09.02 10:25 side=LONG ... booked_stop_px=1.15614 R_at_open=1.57 reason=KEPT_PATH`
- pack 722: `[SRJ-EA] TP_ELECT shadow=true entry=1.15732 sl=1.15614 tp=1.15917 R=1.57 bar=2026.09.02 10:25 latchBar=2026.09.02 10:30`
- pack 723: `QS	0	18:06:55.298	Core 04	2026.09.02 10:30:02   [SRJ-EA] B182DEC bar=2026.09.02 10:30 dir=LONG anc=FOMC-VWAP out=FIRE reg=MEANREV latch=0 div=1 kind=regular dbar=2026.09.02 10:05`
- pack 724: `NK	0	18:06:55.298	Core 04	2026.09.02 10:30:02   [SRJ-EA] A6FIRED class=SELECTED state=FIRED bar=2026.09.02 10:25 dir=LONG tp=1.15917 r=1.57 sl=1.15614 mode=1SWING div=regular`
- pack 726-727: ENTRY_TICKET bar=10:25 ticket=6 deal=6; deal #6 buy 1.08 EURUSD at 1.15736 done (based on order #6)
- pack 2974: `[SRJ-EA] MTEXIT bar=2026.09.02 15:20 reason=TP_TOUCH line=- lineVal=- entry=1.15732 exit=1.15849 src=-`; deal #7 sell 15:21 at 1.15850
- pack 3128: `... [SRJ-EA] REGIMECENSUS #122 bar=2026.09.02 15:40 dir=SHORT votes=2 trendOk=1 sweepTag=3 mrOk=1 cumMR=13` (pLD.H 15:20 pack 2924 mapped; no fire)

## T2 delta rows (baseline 0 -> trial nonzero; mrOk 0->1 subset; file:pack)
- 8/27 10:15 LONG tag 2 mrOk=1 (632); 8/28 14:30 SHORT tag 3 mrOk=1 (2068); 8/28 16:05 LONG tag 4 mrOk=1 (2808); 8/31 10:00 LONG tag 2 mrOk=1 (445); 8/31 10:15 LONG tag 2 mrOk=1 (561); 9/01 10:10 LONG tag 2 mrOk=1 (604); 9/02 10:20 LONG tag 2 mrOk=1 (666, FIRED); 9/02 15:40 SHORT tag 3 mrOk=1 (3128); 9/03 18:00 SHORT tag 3 mrOk=1 (2801); 9/04 15:30 LONG tag 4 mrOk=1 (2258); 9/04 15:40 LONG tag 4 mrOk=1 (2365); 9/08 09:35 LONG tag 2 mrOk=1 (395); 9/08 14:00/14:45/15:15/16:45 LONG tag 4 mrOk=1 (1997/2331/2573/3310); 9/09 11:55 SHORT tag 1 mrOk=1 (1411). All tag-only or BOTH changes except 9/02 10:20 (NONE->MEANREV, fired). No other fire (K-2 CLEAR).

## R5 target candle (2026-07-07.csv)
- pack 94 (jline 14508061): `... [SRJ-IND] B176HZ GAP_TOUCH side=B t=2026.07.07 09:10 o=1.33777 h=1.33779 l=1.33747 c=1.33769 ...` (London 09:00-11:55 full 36/36 candles; low 1.33747 here). NY 14:00-14:40 all 9 candles printed, none low.

## R1/R2 code spots (raw, real line numbers)
- Include/SRJ/SRJ_Sessions.mqh:284-291 risingLondon caches Asia (`g_s.prevAsiaHigh = g_s.asiaHigh;` :287, `g_s.prevAsiaLow = g_s.asiaLow;` :288); :293-300 risingNY caches London (`g_s.prevLondonHigh = g_s.londonHigh;` :296, `g_s.prevLondonLow = g_s.londonLow;` :297); :340 `double liquiditySweepBuffer = g_liquiditySweepBufferPoints * g_mintick;`; :381-388 pLD.H/pLD.L tests on prevLondonHigh/Low; :448-456 LD.H/LD.L tests on effLondonHigh/Low (:449 eff = londonHigh else prevLondonHigh); :505-535 best-overshoot pick -> freshSweepTag/Bar + expiry chain (AS->NY, LD->PM, NY->Asia, PM->London, else SRJ_NA_STR - p-tags never expire).
- Indicators/SRJ_FlowLogic.mq5:377-380 inputs (inAsiaSession 2000-0000, inLondonSession 0200-0500, inNYSession 0700-1200, inPMSession 1330-1600); :25 `#include <SRJ/SRJ_Sessions.mqh>`; :1261-1263 B182SWEEP print (unchanged); :1264-1276 sweepVal map (edit site); Sessions.mqh:155 `bool SRJ_InSession(datetime nyTime,const SSessionDef &d)`; :175-181 SRJ_GetSessionId (0 Asia, 1 London, 2 NY, 3 PM).
- Experts/SRJ_FlowNexus_EA.mq5:237 `enum ENUM_SRJ_REGIME { REGIME_NONE=0, REGIME_TREND=1, REGIME_MEANREV=2, REGIME_BOTH=3 };`; :2731 sweepTag read; :2743-2746 regimeOut; :8712 `if(r2_touch && g_regime == REGIME_MEANREV)` (void; BOTH exempt); :8772-8773 s1v census (print-only SIDE1V_BIRTH); :12812-12813 HTF exit TREND||BOTH (same leg); :1817-1818 RegimeName (print-only).

## K4/compile/restore SHAs
- .preB189: ind mq5 f0924613 (braces 129/129), ind ex5 717099E9, EA ex5 7601D51A, terminal.ini 78d143fa, Charts 19. Edited ind mq5 a31259b5 (braces 130/130 = +1 delta, balanced); B189PMAP x1. Compile 0 errors + 3 pre-existing long-to-int warnings (:1582/:1804/:1878); binary fresh; new ex5 fb2cf12e. Edited copy .B189PMAP kept (a31259b5, never committed).
- Restored + verified: ind mq5 f0924613 + ex5 717099E9; EA 67021D84 + ex5 7601D51A; terminal.ini 78d143fa; Charts 19/19 0 mismatch; seeds/ckpt identical; no terminal64.

## Full diff .preB189 vs .B189PMAP (raw)
--- Indicators/SRJ_FlowLogic.mq5.preB189
+++ Indicators/SRJ_FlowLogic.mq5.B189PMAP
@@ -1273,6 +1273,15 @@
             else if(g_s.freshSweepTag == "PM.H") sweepVal = 7;
             else if(g_s.freshSweepTag == "PM.L") sweepVal = 8;
+            //--- [B189PMAP] cached prior-session tags read their session value only inside that session (spec 3.2 + FRESH-SWEEP; sweep test, buffer, expiry and prints untouched)
+            else if(g_s.freshSweepTag == "pLD.H" || g_s.freshSweepTag == "pLD.L" || g_s.freshSweepTag == "pAS.H" || g_s.freshSweepTag == "pAS.L")
+              {
+               datetime b189_ny = SRJ_BrokerToNY(time[i]);
+               if((g_s.freshSweepTag == "pLD.H" || g_s.freshSweepTag == "pLD.L") && SRJ_InSession(b189_ny, g_defNY))
+                  sweepVal = (g_s.freshSweepTag == "pLD.H" ? 3 : 4);
+               else if((g_s.freshSweepTag == "pAS.H" || g_s.freshSweepTag == "pAS.L") && SRJ_InSession(b189_ny, g_defLondon))
+                  sweepVal = (g_s.freshSweepTag == "pAS.H" ? 1 : 2);
+              }
            }
           g_bufSweepTag[target] = (double)sweepVal;
(End of slice)
