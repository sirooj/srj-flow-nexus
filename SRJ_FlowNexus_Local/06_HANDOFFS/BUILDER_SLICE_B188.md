# BUILDER SLICE B-188 - raw rows and spots (under 600 lines)

Base: builder/B-188 cut at 3f6fef4 (backup exact). Print-only EA edit (d8d43f84), one compile (0 errors 0 warnings), three runs, always restored. Verdict RESTORED, table SEPARATES.

## Runs (tester lines + counts + wall)
- GBP0629-B188P: GBPUSD 2026.06.29-2026.07.18, first replay 2026.06.29 00:00; 1386092 ticks / 4320 bars (B187 T1 identical); pass 0:04:19 (launch 16:49:05). Deals 2/2 SAME.
- RECON62-B188P: EURUSD window (replay verified 2026.08.28); 563338 ticks / 3168 bars; pass 0:03:33 (launch 17:01:44). Deals 14/14 SAME.
- JUNE0525-B188P: USDJPY window (replay verified 2026.05.27); 740873 ticks / 4320 bars; pass 0:03:57 (launch 17:08:51). Deals 8/8 SAME.
- Completion: direct 64KB day-log tail reads (watcher silent on run 1, disclosed; short-cycle polls only). Leftover terminals stopped by PID after each run (23004/9072/21456). Charts restored from .preB188 after each stop (4 files each time, 0 mismatch after).

## R1 candles (2026-07-10.csv GAP_TOUCH o/h/l/c; server times)
- 09:00 1.34268/1.34306/1.34267/1.34283 (42); 09:05 1.34283/1.34328/1.34283/1.34316 (75); 09:10 1.34314/1.34358/1.34312/1.34335 (109); 09:15 1.34337/1.34352/1.34278/1.34351 (142); 09:25 1.34325/1.34328/1.34272/1.34272 (213); 09:35 1.34303/1.34340/1.34294/1.34327 (278); 09:45 1.34267/1.34273/1.34239/1.34242 (353); 09:50 1.34240/1.34268/1.34239/1.34264 (387); 09:55 1.34262/1.34278/1.34255/1.34265 (416); 10:00 1.34266/1.34294/1.34235/1.34255 (445); 10:05 1.34255/1.34275/1.34253/1.34263 (474); 10:10 1.34264/1.34297/1.34252/1.34263 (504); 10:15 1.34264/1.34286/1.34246/1.34272 (534); 10:20 1.34274/1.34283/1.34243/1.34255 (564); 10:25 1.34255/1.34264/1.34233/1.34253 (592); 10:30 1.34253/1.34263/1.34235/1.34245 (620); 10:35 1.34246/1.34280/1.34242/1.34265 (648); 10:45 1.34284/1.34290/1.34231/1.34257 (707); 10:50 1.34255/1.34274/1.34233/1.34237 (735); 10:55 1.34236/1.34239/1.34201/1.34210 (765); 11:00 1.34211/1.34263/1.34189/1.34217 (795); 11:10 1.34207/1.34221/1.34171/1.34173 (863); 11:15 1.34174/1.34196/1.34156/1.34190 (895); 11:20 1.34190/1.34194/1.34149/1.34149 (927); 11:25 1.34148/1.34157/1.34124/1.34145 (963); 11:35 1.34158/1.34159/1.34123/1.34128 (1029); 11:40 1.34129/1.34139/1.34104/1.34129 (1063); 11:45 1.34128/1.34131/1.34104/1.34128 (1099); 11:50 1.34128/1.34130/1.34082/1.34105 (1139).
- 14:05 1.34353/1.34355/1.34281/1.34286 (1556); 14:15 1.34293/1.34300/1.34260/1.34286 (1623); 14:20 1.34287/1.34295/1.34266/1.34269 (1655).
- NOT PRINTED: 09:20, 09:30, 09:40, 10:40, 11:05, 11:30, 11:55, 13:30, 13:35, 13:40, 13:45, 13:50, 13:55, 14:00, 14:10.
- London high 1.34358 at 09:10 (pack 109); London low 1.34082 at 11:50 (pack 1139, his LD.L TP candle). First >=13:55 strictly above from printed rows: NONE (highest printed 1.34355 at 14:05). 13:55 sweeping candle high NOT PRINTED in candle rows (named 1.34363 by B188SWP machine scan + operator note).
- Raw high row (pack 109, jline 14539959): `GN	0	16:10:10.710	Core 04	2026.07.10 09:15:00   [SRJ-IND] B176HZ GAP_TOUCH side=S t=2026.07.10 09:10 o=1.34314 h=1.34358 l=1.34312 c=1.34335 remBefore=1.34346-1.34347 remAfter=EMPTY`
- Raw low row (pack 1139, jline 14543329): `KJ	0	16:10:10.710	Core 04	2026.07.10 11:55:00   [SRJ-IND] B176HZ GAP_TOUCH side=B t=2026.07.10 11:50 o=1.34128 h=1.34130 l=1.34082 c=1.34105 remBefore=EMPTY remAfter=EMPTY`

## R2 raw rows (2026-07-10.csv; relay 1407/1435 are B152PR 12:45/12:50 - stale numbers, disclosed)
- Requested pack 1407 (jline 14543973, B152PR): `RI	0	16:10:10.710	Core 04	2026.07.10 12:45:01   [SRJ-IND] B152PR sym=GBPUSD bar=2026.07.10 12:40 z1=3426,B,1.34083,1.34101,2026.07.10 03:45,1,2026.07.10 11:50,1.34130,1.34082`
- Requested pack 1435 (jline 14544006, B152PR): `DN	0	16:10:10.710	Core 04	2026.07.10 12:50:00   [SRJ-IND] B152PR sym=GBPUSD bar=2026.07.10 12:45 z1=3168,B,1.33397,1.33564,2026.07.08 16:30,1,2026.07.08 18:15,1.33621,1.33564`
- Actual LD.H (pack 1477, jline 14544427): `RE	0	16:10:10.710	Core 04	2026.07.10 14:00:00   [SRJ-IND] B182SWEEP tag=LD.H bar=2026.07.10 13:55`
- Actual pLD.H (pack 1505, jline 14544464): `NN	0	16:10:10.710	Core 04	2026.07.10 14:05:00   [SRJ-IND] B182SWEEP tag=pLD.H bar=2026.07.10 14:00`
- REGIMECENSUS 14:15-15:50 (relay range 1526-2078 stale; actual packs 1602-2192, fields: pack/run/ea_sha/journal_file/journal_line/server_date/server_time/tag/raw):
- pack 1602 (jline 14544584): `RN	0	16:10:16.815	Core 04	2026.07.10 14:15:02   [SRJ-EA] REGIMECENSUS #195 bar=2026.07.10 14:10 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 1634 (jline 14544625): `HI	0	16:10:16.815	Core 04	2026.07.10 14:20:06   [SRJ-EA] REGIMECENSUS #196 bar=2026.07.10 14:15 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 1667 (jline 14544669): `MJ	0	16:10:16.815	Core 04	2026.07.10 14:25:01   [SRJ-EA] REGIMECENSUS #197 bar=2026.07.10 14:20 dir=LONG votes=2 trendOk=1 sweepTag=0 mrOk=0 cumMR=0`
- pack 1862 (jline 14545091): `EN	0	16:10:16.815	Core 04	2026.07.10 14:55:00   [SRJ-EA] REGIMECENSUS #198 bar=2026.07.10 14:50 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 1891 (jline 14545129): `JQ	0	16:10:16.815	Core 04	2026.07.10 15:00:00   [SRJ-EA] REGIMECENSUS #199 bar=2026.07.10 14:55 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 1919 (jline 14545166): `IL	0	16:10:16.815	Core 04	2026.07.10 15:05:00   [SRJ-EA] REGIMECENSUS #200 bar=2026.07.10 15:00 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 1948 (jline 14545200): `FF	0	16:10:16.815	Core 04	2026.07.10 15:10:01   [SRJ-EA] REGIMECENSUS #201 bar=2026.07.10 15:05 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 1983 (jline 14545247): `GL	0	16:10:16.815	Core 04	2026.07.10 15:15:00   [SRJ-EA] REGIMECENSUS #202 bar=2026.07.10 15:10 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 2014 (jline 14545288): `GD	0	16:10:16.815	Core 04	2026.07.10 15:20:00   [SRJ-EA] REGIMECENSUS #203 bar=2026.07.10 15:15 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 2043 (jline 14545321): `KQ	0	16:10:16.815	Core 04	2026.07.10 15:25:00   [SRJ-EA] REGIMECENSUS #204 bar=2026.07.10 15:20 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 2075 (jline 14545362): `CO	0	16:10:16.815	Core 04	2026.07.10 15:30:00   [SRJ-EA] REGIMECENSUS #205 bar=2026.07.10 15:25 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 2103 (jline 14545394): `EF	0	16:10:16.815	Core 04	2026.07.10 15:35:00   [SRJ-EA] REGIMECENSUS #206 bar=2026.07.10 15:30 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 2133 (jline 14545429): `DN	0	16:10:16.815	Core 04	2026.07.10 15:40:07   [SRJ-EA] REGIMECENSUS #207 bar=2026.07.10 15:35 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 2162 (jline 14545463): `MQ	0	16:10:16.815	Core 04	2026.07.10 15:45:00   [SRJ-EA] REGIMECENSUS #208 bar=2026.07.10 15:40 dir=SHORT votes=1 trendOk=0 sweepTag=0 mrOk=0 cumMR=0`
- pack 2192 (jline 14545497): `ME	0	16:10:16.815	Core 04	2026.07.10 15:50:00   [SRJ-EA] REGIMECENSUS #209 bar=2026.07.10 15:45 dir=SHORT votes=2 trendOk=1 sweepTag=0 mrOk=0 cumMR=0`
- Passes 14:30/14:35/14:40/14:45/14:50 absent (no S1 candidate alive; shadow confirms 14:20/15:20 only).

## R3 code spots (raw, real line numbers)
- Indicators/SRJ_FlowLogic.mq5:1262 `if(!g_s.freshSweepExpired && !SrjIsNa(g_s.freshSweepTag) && g_s.freshSweepBar == i)` / :1263 `PrintFormat("[SRJ-IND] B182SWEEP tag=%s bar=%s", g_s.freshSweepTag, TimeToString(time[i], TIME_DATE|TIME_MINUTES));` / :1264-1276 sweepVal map (AS.H=1 AS.L=2 LD.H=3 LD.L=4 NY.H=5 NY.L=6 PM.H=7 PM.L=8; p-tags unmapped -> 0) + `g_bufSweepTag[target] = (double)sweepVal;`
- Include/SRJ/SRJ_Sessions.mqh:293-300 risingNY caches londonHigh -> prevLondonHigh (+expire NY); :381-388 pLD.H test (`high[i] > g_s.prevLondonHigh + liquiditySweepBuffer`, tag "pLD.H"); :448-456 LD.H test (`high[i] > effLondonHigh + liquiditySweepBuffer` where :449 `effLondonHigh = !SrjIsNa(g_s.londonHigh) ? g_s.londonHigh : g_s.prevLondonHigh`, tag "LD.H"); :505-535 best-overshoot pick -> freshSweepTag/freshSweepBar + expiry (LD.H/LD.L -> "PM"); :340 `liquiditySweepBuffer = g_liquiditySweepBufferPoints * g_mintick` (1.0pt input, FlowLogic:414).
- Experts/SRJ_FlowNexus_EA.mq5:221-228 SWEEP_NONE=0 ASIA_HIGH=1 ASIA_LOW=2 LONDON_HIGH=3 LONDON_LOW=4 NY_HIGH=5 NY_LOW=6 PM_HIGH=7 PM_LOW=8; :2718-2748 ClassifyRegime (:2724-2729 votes/trendOk; :2730-2742 sweepTag/mrOk incl. :2734 `if(tag != SWEEP_NONE)`; :2743-2746 regimeOut BOTH/TREND/MEANREV/NONE).
- R3c zero proof: 14 SHORT-dir rows sweepTag=0 (above) + single pLD.H overwrite row (pack 1505). Failing condition: EA:2734 tag==SWEEP_NONE.

## R4 record hits (grep-first, one fixed pattern at a time)
- `13:55` in journal: count 0. In skill: none (panel label LD.H-to-NA only, skill:106).
- `LD.H` journal: 12 NY/MR rows (e.g. journal:169 row 168 NY MR bear-bull-bull LD.H; journal:229 row 228 NY MR LD.H W AVP) - LD.H = London-high sweep source for NY mean-reversion. `LD.L` journal: 13 NY/MR rows (e.g. journal:133 row 132 NY MR LD.L W AVP) - London-low sweep source.
- FRESH-SWEEP skill:82 (verbatim quoted in result). SESSION-BOUNDARY clock text ("London begins 9:00, 8:55 earliest"): count 0 in skill (never banked there - defect owned, pointer added). Register F3 (BUILDER_REGISTER_VALID_TRADES.md:94): his "Mean reversal LD.H sweep ... TP at LD.L at 11:50 swing low" + operator note with relay (LD.H = 9:10 high swept by 13:55 high).
- Ruling: R4 FOUND (his setup words + operator note tie the 13:55 sweep to his NY setup); code-window-strict auxiliary kept.

## R5 HTF (NY passes 14:15-15:50)
- Machine votes/trendOk per R2 rows (SHORT 1/0 throughout; LONG 14:25 2/1; SHORT 15:50 2/1). B182DEC: pack 1716 bar=14:30 dir=LONG reg=TREND; pack 2226 bar=15:55 dir=SHORT reg=TREND out=FRESH_OPP_FVG. 4H/1H/15m individual reads NOT PRINTED (votes only). Trend NONE for SHORT = own majority read. His 10 July HTF not on record.

## R6 + P2 rows (7 July 1.33747)
- TP_ELECT (B187 pack 1573, jline 14511288): `LH	0	16:09:34.058	Core 04	2026.07.07 14:45:00   [SRJ-EA] TP_ELECT shadow=true entry=1.33863 sl=1.33940 tp=1.33747 R=1.51 bar=2026.07.07 14:40 latchBar=2026.07.07 14:45` (source NOT PRINTED here).
- XOB-2855 value match (B187 pack 88): `B152PR ... bar=2026.07.07 09:10 z1=2855,B,1.33747,1.33764,2026.07.06 20:30,1,2026.07.07 09:10,1.33779,1.33747` (zone low, not a target source).
- B188TPSRC (B188P pack 1581): `LD	0	16:54:30.532	Core 04	2026.07.07 14:45:00   [SRJ-EA] B188TPSRC bar=2026.07.07 14:40 dir=SHORT w=1.33747 wsrc=YLOL wday=2026.07.07 n2=1.33630/Weekly-VWAP/2026.07.07 n3=1.33542/Monthly-POC/2026.07.07` -> FOUND: session buffer YLOL (prev-day London low).
- B188SWP 14:15 (B188P pack 1623): `RP	0	16:55:13.296	Core 04	2026.07.10 14:15:02   [SRJ-EA] B188SWP side=S prior=LDN day=2026.07.10 ph=1.34358 pl=1.34082 cur=NYAM first=2026.07.10 13:55@1.34363 tag=0 fail=TAG_NONE`

## P3/compile/restore SHAs
- .preB188 EA 67021D84 (braces 1220/1220); edited d8d43f84 (braces 1235/1235 = +15 hunk delta, balanced); B188SWP x1, B188TPSRC x1. Compile 0 errors 0 warnings, binary fresh. Edited copy .B188P kept (d8d43f84, never committed).
- Restored: EA 67021D84, ex5 7601D51A (via .ex5.preB185 byte-match; no .preB188 ex5 taken, disclosed), indicator F0924613 + ex5 717099E9, terminal.ini 78d143fa, Charts 19/19 0 mismatch, seeds/ckpt identical, no terminal64.

## Full diff .preB188 vs .B188P (raw)
--- SRJ_FlowNexus_EA.mq5.preB188
+++ SRJ_FlowNexus_EA.mq5.B188P
@@ -340,6 +340,8 @@
 string   uj_winnerSource = "";
 string   uj_winnerDayKey = "";
 int      uj_winnerPoolGen = -1;
+//--- print-only top-3 target ranking (B-188 diagnostic; no gate reads these)
+string b188tp_src[3]; string b188tp_day[3]; double b188tp_val[3]; double b188tp_dist[3];
 long     uj_tradeSeqNext = 1;
 //--- prototypes (definitions sit before OnTick; callers precede them)
 bool   SrjUjAssert1R(double entry, double sl, double tp, string barKey, string src, double &riskOut, double &rewardOut, double &ROut);
@@ -2740,6 +2742,42 @@
       if(dir == DIR_SHORT && sweptHigh) mrOk = true;
       if(dir == DIR_LONG  && sweptLow)  mrOk = true;
      }
+   //--- print-only sweep inputs (relay B-188 P1; reads only, no gate reads this)
+   if(InpDebugLog)
+     {
+      string b188swp_prior = "NONE";
+      int b188swp_pHi = -1, b188swp_pLo = -1;
+      if(g_sessionAtEntry == SESSION_NYAM) { b188swp_prior = "LDN"; b188swp_pHi = FL_BUF_LONDON_HIGH; b188swp_pLo = FL_BUF_LONDON_LOW; }
+      else if(g_sessionAtEntry == SESSION_LONDON) { b188swp_prior = "ASIA"; b188swp_pHi = FL_BUF_ASIA_HIGH; b188swp_pLo = FL_BUF_ASIA_LOW; }
+      else if(tag == SWEEP_ASIA_HIGH || tag == SWEEP_ASIA_LOW) { b188swp_prior = "ASIA"; b188swp_pHi = FL_BUF_ASIA_HIGH; b188swp_pLo = FL_BUF_ASIA_LOW; }
+      else if(tag == SWEEP_NY_HIGH || tag == SWEEP_NY_LOW) { b188swp_prior = "NY"; b188swp_pHi = FL_BUF_NY_HIGH; b188swp_pLo = FL_BUF_NY_LOW; }
+      else if(tag == SWEEP_PM_HIGH || tag == SWEEP_PM_LOW) { b188swp_prior = "PM"; b188swp_pHi = FL_BUF_PM_HIGH; b188swp_pLo = FL_BUF_PM_LOW; }
+      else if(tag == SWEEP_LONDON_HIGH || tag == SWEEP_LONDON_LOW) { b188swp_prior = "LDN"; b188swp_pHi = FL_BUF_LONDON_HIGH; b188swp_pLo = FL_BUF_LONDON_LOW; }
+      double b188swp_ph = EMPTY_VALUE, b188swp_pl = EMPTY_VALUE;
+      if(b188swp_pHi >= 0) ReadFlow(b188swp_pHi, b188swp_ph, barShift);
+      if(b188swp_pLo >= 0) ReadFlow(b188swp_pLo, b188swp_pl, barShift);
+      datetime b188swp_bt = iTime(_Symbol, PERIOD_CURRENT, barShift);
+      string b188swp_first = "NONE";
+      if(b188swp_ph != EMPTY_VALUE || b188swp_pl != EMPTY_VALUE)
+        {
+         for(int b188swp_k = barShift + 72; b188swp_k >= barShift; b188swp_k--)
+           {
+            double b188swp_kh = iHigh(_Symbol, PERIOD_CURRENT, b188swp_k);
+            double b188swp_kl = iLow(_Symbol, PERIOD_CURRENT, b188swp_k);
+            if(dir == DIR_SHORT && b188swp_ph != EMPTY_VALUE && b188swp_ph > 0.0 && b188swp_kh > 0.0 && b188swp_kh > b188swp_ph)
+              { b188swp_first = StringFormat("%s@%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, b188swp_k), TIME_DATE|TIME_MINUTES), DoubleToString(b188swp_kh, _Digits)); break; }
+            if(dir == DIR_LONG && b188swp_pl != EMPTY_VALUE && b188swp_pl > 0.0 && b188swp_kl > 0.0 && b188swp_kl < b188swp_pl)
+              { b188swp_first = StringFormat("%s@%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, b188swp_k), TIME_DATE|TIME_MINUTES), DoubleToString(b188swp_kl, _Digits)); break; }
+           }
+        }
+      string b188swp_fail = (tag == SWEEP_NONE) ? "TAG_NONE" : (mrOk ? "MR_OK" : "DIR_MISMATCH");
+      PrintFormat("[SRJ-EA] B188SWP side=%s prior=%s day=%s ph=%s pl=%s cur=%s first=%s tag=%d fail=%s",
+                  (dir == DIR_SHORT ? "S" : "L"), b188swp_prior,
+                  TimeToString(b188swp_bt, TIME_DATE),
+                  (b188swp_ph == EMPTY_VALUE ? "-" : DoubleToString(b188swp_ph, _Digits)),
+                  (b188swp_pl == EMPTY_VALUE ? "-" : DoubleToString(b188swp_pl, _Digits)),
+                  SessionName(g_sessionAtEntry), b188swp_first, tag, b188swp_fail);
+     }
    if(InpDebugLog) { static int s_rc91 = 0; static int s_rcMR91 = 0; s_rc91++; if(mrOk) s_rcMR91++; PrintFormat("[SRJ-EA] REGIMECENSUS #%d bar=%s dir=%s votes=%d trendOk=%d sweepTag=%d mrOk=%d cumMR=%d", s_rc91, TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(dir), votes, (int)trendOk, tag, (int)mrOk, s_rcMR91); } if(trendOk && mrOk) regimeOut = REGIME_BOTH;
    else if(trendOk)    regimeOut = REGIME_TREND;
    else if(mrOk)       regimeOut = REGIME_MEANREV;
@@ -2804,6 +2842,18 @@
    if(!haveBest || dist < MathAbs(best - currentPrice))
      { best = v; haveBest = true;
        uj_winnerSource = src; uj_winnerDayKey = dayKey; uj_winnerPoolGen = poolGen; }
+   //--- print-only top-3 rank (diagnostic; feeds the TP_ELECT print only)
+   double b188tp_d = dist;
+   for(int b188tp_k = 0; b188tp_k < 3; b188tp_k++)
+     {
+      if(b188tp_val[b188tp_k] == EMPTY_VALUE || b188tp_val[b188tp_k] <= 0.0 || b188tp_d < b188tp_dist[b188tp_k])
+        {
+         for(int b188tp_j = 2; b188tp_j > b188tp_k; b188tp_j--)
+           { b188tp_val[b188tp_j] = b188tp_val[b188tp_j-1]; b188tp_dist[b188tp_j] = b188tp_dist[b188tp_j-1]; b188tp_src[b188tp_j] = b188tp_src[b188tp_j-1]; b188tp_day[b188tp_j] = b188tp_day[b188tp_j-1]; }
+         b188tp_val[b188tp_k] = v; b188tp_dist[b188tp_k] = b188tp_d; b188tp_src[b188tp_k] = src; b188tp_day[b188tp_k] = dayKey;
+         break;
+        }
+     }
    }

 bool UjPoiTargetValid(int k, int anchor)
@@ -2846,6 +2896,8 @@
    {
     double best = 0.0;
     bool   haveBest = false;
+   //--- print-only rank reset (diagnostic)
+   for(int b188tp_r = 0; b188tp_r < 3; b188tp_r++) { b188tp_val[b188tp_r] = EMPTY_VALUE; b188tp_dist[b188tp_r] = 0.0; b188tp_src[b188tp_r] = "-"; b188tp_day[b188tp_r] = "-"; }
    //--- [P-UJIMPL-IMPL-1 v8 IE5c] election-day key for winner provenance
    string uj_dk = UjDayKey(iTime(_Symbol, PERIOD_CURRENT, barShift));
    //--- [S1-TP-PROMOTION-001] live promotion: prev-day session H/L join the
@@ -11282,6 +11334,15 @@
                      TimeToString(iTime(_Symbol, PERIOD_CURRENT,
                                    (barShift >= 1 ? barShift - 1 : 0)),
                                   TIME_DATE|TIME_MINUTES));
+      //--- print-only winner plus next two (relay B-188 P2; reads only, no gate reads this)
+      if(InpDebugLog && SHADOW_TP_ELECT)
+         PrintFormat("[SRJ-EA] B188TPSRC bar=%s dir=%s w=%s wsrc=%s wday=%s n2=%s/%s/%s n3=%s/%s/%s",
+                     TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
+                     DirName(g_dir),
+                     DoubleToString(tpTarget, _Digits),
+                     uj_winnerSource, uj_winnerDayKey,
+                     (b188tp_val[1] == EMPTY_VALUE ? "-" : DoubleToString(b188tp_val[1], _Digits)), b188tp_src[1], b188tp_day[1],
+                     (b188tp_val[2] == EMPTY_VALUE ? "-" : DoubleToString(b188tp_val[2], _Digits)), b188tp_src[2], b188tp_day[2]);
(End of slice)
