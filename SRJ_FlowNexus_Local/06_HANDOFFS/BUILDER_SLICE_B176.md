# BUILDER SLICE B-176 - raw rows (print hunk, run tables, re-grade)

Base: builder/B-175 head 09478b2 on builder/B-176. Backups .preB176 (ind src 7842A02E, ex5 10880847, terminal.ini CF80083C, Profiles 23 files).
Edit verify: marker `[B-176 B176HZ]` count 1; brace-balance 0/0 vs .preB176; disk-vs-preB176 +191/-0 (one whitespace indent repair owned).
Compile: 0 errors, binary fresh (ex5 0921097E); 2 benign code-43 (pre-existing :1522 shifted + new mirrored :1737, same explicit-cast idiom).
Copies: .B176HZ src A22067AD / ex5 0921097E kept uncommitted. No include touched (diff file list: indicator only).

## K2 spots (located by text)
- Gap detection (read-only reference): ImbalanceMgr:115 bull `if(low[i] > srjH(high,i,2))`; :240-244 bear `if(high[i] < srjL(low,i,2))` + create (no minimum).
- Writer block indicator:1464-1599 (barClosed :1486; B152PR :1551/:1575; B162ORIGIN :1579/:1586; OHLC open/high/low/close/time[i] in scope).
- Zone loop promotionBar->time pattern :1249-1254; alive=isValid :1541; COrderblock fields low/high/startBar/objId/isPromoted/isValid/promotionBar all used in-file.
- K0 quotes: L41 FVG-validity; L127 SWEEP-TEST-STRICT (strict beyond); W3 L260 (no valid XOB, 06:30-06:40 gap); spec 3.5 L128-129 (leg tie, governed-over by W3 per canon 0); spec 3.6 FVG row (touch required, that-candle attribution). No conflict.

## K3 full diff against .preB176 raw (+191/-0)
```
--- SRJ_FlowLogic.mq5.preB176
+++ SRJ_FlowLogic.mq5.B176HZ
@@ -174,6 +174,24 @@
 double g_bufB150Bull[];
 double g_bufB150Bear[];
 double g_buf2xOB[];   // [B156SL] Buffer 50. 5m 2xOB state per closed bar (1 = strong 2xOB, 0 = not).
+
+//--- [B-176 B176HZ] His-rule gap store (relay B-176; print only). Separate from
+//--- g_imbalances/CImbalance bookkeeping (never read or written here): three-candle
+//--- strict-inequality detection mirrored beside it, remainder tracked per his L41
+//--- (wick coverage shrinks; far-edge-exact touch is no kill per SWEEP-TEST-STRICT;
+//--- strict wick-through or body-through kills). All times/prices saved at event
+//--- time, never a bar index read later. Slots appended on detection only;
+//--- every new slot fully initialized (B153-NEW-SLOTS-START-CLEAN). No buffer.
+bool     g_b176Bull[];
+datetime g_b176T1[];
+datetime g_b176T2[];
+datetime g_b176T3[];
+double   g_b176Top0[];
+double   g_b176Bot0[];
+double   g_b176SpanLo[];
+double   g_b176SpanHi[];
+bool     g_b176HasSpan[];
+bool     g_b176Dead[];
 
 // [P-SWINGIMB] Returns 0/1/2/3 only. apexBar is the confirmed fractal bar
 // (target=i-1 at the call site); bullish selects the HIGH (up-push) side.
@@ -1482,6 +1500,16 @@
          ArrayResize(g_b153cbT, 0);
          ArrayResize(g_b153cbH, 0);
          ArrayResize(g_b153cbL, 0);
+         ArrayResize(g_b176Bull, 0);        // B176HZ his-rule gap store: start empty
+         ArrayResize(g_b176T1, 0);
+         ArrayResize(g_b176T2, 0);
+         ArrayResize(g_b176T3, 0);
+         ArrayResize(g_b176Top0, 0);
+         ArrayResize(g_b176Bot0, 0);
+         ArrayResize(g_b176SpanLo, 0);
+         ArrayResize(g_b176SpanHi, 0);
+         ArrayResize(g_b176HasSpan, 0);
+         ArrayResize(g_b176Dead, 0);
         }
       if(barClosed)
         {
@@ -1590,6 +1618,169 @@
                      (b162nS > 0 ? (DoubleToString(b162lS, _Digits) + "-" + DoubleToString(b162hS, _Digits)) : "-"),
                      (b162nS > 0 ? SRJ_BarTimeStr(b162fS) : "-"),
                      (b162nS > 0 ? b162sS : "-"));
+          //--- B176HZ his-rule gaps + XOB reach (relay B-176; print only).
+          //--- Locals only: no buffer write, no write outside g_b176* slots,
+          //--- no include change, no threshold or count. Same gate/cadence as above.
+          if(i >= 2)
+            {
+             //--- existing gaps: touch/death on closed bar i (detected earlier only)
+             int b176n = ArraySize(g_b176Dead);
+             for(int b176k = 0; b176k < b176n; b176k++)
+               {
+                if(g_b176Dead[b176k]) continue;
+                if(g_b176T3[b176k] >= time[i]) continue;
+                double b176lo = g_b176Bot0[b176k], b176hi = g_b176Top0[b176k];
+                bool b176bull = g_b176Bull[b176k];
+                if(!(low[i] <= b176hi && high[i] >= b176lo)) continue;
+                string b176side = (b176bull ? "B" : "S");
+                string b176rb = "-";
+                if(g_b176HasSpan[b176k])
+                  {
+                   string b176p1 = "", b176p2 = "";
+                   if(g_b176SpanLo[b176k] > b176lo)
+                      b176p1 = DoubleToString(b176lo, _Digits) + "-" + DoubleToString(MathMin(b176hi, g_b176SpanLo[b176k]), _Digits);
+                   if(g_b176SpanHi[b176k] < b176hi)
+                      b176p2 = DoubleToString(MathMax(b176lo, g_b176SpanHi[b176k]), _Digits) + "-" + DoubleToString(b176hi, _Digits);
+                   if(b176p1 != "" && b176p2 != "") b176rb = b176p1 + "+" + b176p2;
+                   else if(b176p1 != "") b176rb = b176p1;
+                   else if(b176p2 != "") b176rb = b176p2;
+                   else b176rb = "EMPTY";
+                  }
+                else
+                   b176rb = DoubleToString(b176lo, _Digits) + "-" + DoubleToString(b176hi, _Digits);
+                double b176nlo = g_b176HasSpan[b176k] ? MathMin(g_b176SpanLo[b176k], low[i]) : low[i];
+                double b176nhi = g_b176HasSpan[b176k] ? MathMax(g_b176SpanHi[b176k], high[i]) : high[i];
+                g_b176SpanLo[b176k] = b176nlo; g_b176SpanHi[b176k] = b176nhi; g_b176HasSpan[b176k] = true;
+                string b176ra = "-";
+                  {
+                   string b176q1 = "", b176q2 = "";
+                   if(b176nlo > b176lo)
+                      b176q1 = DoubleToString(b176lo, _Digits) + "-" + DoubleToString(MathMin(b176hi, b176nlo), _Digits);
+                   if(b176nhi < b176hi)
+                      b176q2 = DoubleToString(MathMax(b176lo, b176nhi), _Digits) + "-" + DoubleToString(b176hi, _Digits);
+                   if(b176q1 != "" && b176q2 != "") b176ra = b176q1 + "+" + b176q2;
+                   else if(b176q1 != "") b176ra = b176q1;
+                   else if(b176q2 != "") b176ra = b176q2;
+                   else b176ra = "EMPTY";
+                  }
+                PrintFormat("[SRJ-IND] B176HZ GAP_TOUCH side=%s t=%s o=%s h=%s l=%s c=%s remBefore=%s remAfter=%s",
+                            b176side, TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                            DoubleToString(open[i], _Digits), DoubleToString(high[i], _Digits),
+                            DoubleToString(low[i], _Digits), DoubleToString(close[i], _Digits),
+                            b176rb, b176ra);
+                if(low[i] < b176lo && high[i] > b176hi)
+                  {
+                   g_b176Dead[b176k] = true;
+                   PrintFormat("[SRJ-IND] B176HZ GAP_DEAD side=%s t=%s o=%s h=%s l=%s c=%s kind=WICK_THROUGH",
+                               b176side, TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                               DoubleToString(open[i], _Digits), DoubleToString(high[i], _Digits),
+                               DoubleToString(low[i], _Digits), DoubleToString(close[i], _Digits));
+                  }
+                else if((!b176bull && close[i] > b176hi && close[i] > open[i]) ||
+                        (b176bull && close[i] < b176lo && close[i] < open[i]))
+                  {
+                   g_b176Dead[b176k] = true;
+                   PrintFormat("[SRJ-IND] B176HZ GAP_DEAD side=%s t=%s o=%s h=%s l=%s c=%s kind=BODY_THROUGH",
+                               b176side, TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                               DoubleToString(open[i], _Digits), DoubleToString(high[i], _Digits),
+                               DoubleToString(low[i], _Digits), DoubleToString(close[i], _Digits));
+                  }
+               }
+             //--- new detection on triple (i-2,i-1,i): strict inequality, no minimum
+             if(low[i] > high[i-2])
+               {
+                int b176m = ArraySize(g_b176Dead);
+                ArrayResize(g_b176Bull, b176m+1);   ArrayResize(g_b176T1, b176m+1);
+                ArrayResize(g_b176T2, b176m+1);     ArrayResize(g_b176T3, b176m+1);
+                ArrayResize(g_b176Top0, b176m+1);   ArrayResize(g_b176Bot0, b176m+1);
+                ArrayResize(g_b176SpanLo, b176m+1); ArrayResize(g_b176SpanHi, b176m+1);
+                ArrayResize(g_b176HasSpan, b176m+1); ArrayResize(g_b176Dead, b176m+1);
+                g_b176Bull[b176m] = true;
+                g_b176T1[b176m] = time[i-2]; g_b176T2[b176m] = time[i-1]; g_b176T3[b176m] = time[i];
+                g_b176Top0[b176m] = low[i]; g_b176Bot0[b176m] = high[i-2];
+                g_b176SpanLo[b176m] = 0.0; g_b176SpanHi[b176m] = 0.0;
+                g_b176HasSpan[b176m] = false; g_b176Dead[b176m] = false;
+                PrintFormat("[SRJ-IND] B176HZ GAP_FORM side=B t1=%s t2=%s t3=%s range=%s-%s",
+                            TimeToString(time[i-2], TIME_DATE|TIME_MINUTES),
+                            TimeToString(time[i-1], TIME_DATE|TIME_MINUTES),
+                            TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                            DoubleToString(high[i-2], _Digits), DoubleToString(low[i], _Digits));
+               }
+             if(high[i] < low[i-2])
+               {
+                int b176m = ArraySize(g_b176Dead);
+                ArrayResize(g_b176Bull, b176m+1);   ArrayResize(g_b176T1, b176m+1);
+                ArrayResize(g_b176T2, b176m+1);     ArrayResize(g_b176T3, b176m+1);
+                ArrayResize(g_b176Top0, b176m+1);   ArrayResize(g_b176Bot0, b176m+1);
+                ArrayResize(g_b176SpanLo, b176m+1); ArrayResize(g_b176SpanHi, b176m+1);
+                ArrayResize(g_b176HasSpan, b176m+1); ArrayResize(g_b176Dead, b176m+1);
+                g_b176Bull[b176m] = false;
+                g_b176T1[b176m] = time[i-2]; g_b176T2[b176m] = time[i-1]; g_b176T3[b176m] = time[i];
+                g_b176Top0[b176m] = low[i-2]; g_b176Bot0[b176m] = high[i];
+                g_b176SpanLo[b176m] = 0.0; g_b176SpanHi[b176m] = 0.0;
+                g_b176HasSpan[b176m] = false; g_b176Dead[b176m] = false;
+                PrintFormat("[SRJ-IND] B176HZ GAP_FORM side=S t1=%s t2=%s t3=%s range=%s-%s",
+                            TimeToString(time[i-2], TIME_DATE|TIME_MINUTES),
+                            TimeToString(time[i-1], TIME_DATE|TIME_MINUTES),
+                            TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                            DoubleToString(high[i], _Digits), DoubleToString(low[i-2], _Digits));
+               }
+             //--- XOB reach + latest promotion per side (candle overlap, inclusive)
+             int b176rn = g_orderblocks.Total();
+             int b176pbB = SRJ_NA_INT, b176pbS = SRJ_NA_INT;
+             int b176nB = 0, b176nS = 0;
+             for(int b176q = 0; b176q < b176rn; b176q++)
+               {
+                COrderblock *b176ob = GetOB(g_orderblocks, b176q);
+                if(b176ob == NULL) continue;
+                if(!b176ob.isPromoted) continue;
+                if(SrjIsNa(b176ob.promotionBar)) continue;
+                if(SrjIsNa(b176ob.low) || SrjIsNa(b176ob.high)) continue;
+                int b176pb = (int)b176ob.promotionBar;
+                if(b176pb < 0 || b176pb >= rates_total) continue;
+                string b176pt = "-";
+                  {
+                   datetime b176ptd = SRJ_BarTime(b176pb);
+                   if(b176ptd > 0) b176pt = TimeToString(b176ptd, TIME_DATE|TIME_MINUTES);
+                  }
+                if(b176ob.isBullish)
+                  {
+                   if(b176pbB == SRJ_NA_INT || b176pb > b176pbB) b176pbB = b176pb;
+                   if(!b176ob.isValid) continue;
+                   b176nB++;
+                   if(!(low[i] > b176ob.high || high[i] < b176ob.low))
+                      PrintFormat("[SRJ-IND] B176HZ XOB_REACH side=B bar=%s range=%s-%s promoT=%s",
+                                  TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                                  DoubleToString(b176ob.low, _Digits), DoubleToString(b176ob.high, _Digits), b176pt);
+                  }
+                else
+                  {
+                   if(b176pbS == SRJ_NA_INT || b176pb > b176pbS) b176pbS = b176pb;
+                   if(!b176ob.isValid) continue;
+                   b176nS++;
+                   if(!(low[i] > b176ob.high || high[i] < b176ob.low))
+                      PrintFormat("[SRJ-IND] B176HZ XOB_REACH side=S bar=%s range=%s-%s promoT=%s",
+                                  TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                                  DoubleToString(b176ob.low, _Digits), DoubleToString(b176ob.high, _Digits), b176pt);
+                  }
+               }
+             string b176lpB = "-";
+             if(b176pbB != SRJ_NA_INT)
+               {
+                datetime b176lpd = SRJ_BarTime(b176pbB);
+                if(b176lpd > 0) b176lpB = TimeToString(b176lpd, TIME_DATE|TIME_MINUTES);
+               }
+             string b176lpS = "-";
+             if(b176pbS != SRJ_NA_INT)
+               {
+                datetime b176lpd = SRJ_BarTime(b176pbS);
+                if(b176lpd > 0) b176lpS = TimeToString(b176lpd, TIME_DATE|TIME_MINUTES);
+               }
+             PrintFormat("[SRJ-IND] B176HZ LATEST side=B bar=%s nLive=%d latestPromoT=%s",
+                         TimeToString(time[i], TIME_DATE|TIME_MINUTES), b176nB, b176lpB);
+             PrintFormat("[SRJ-IND] B176HZ LATEST side=S bar=%s nLive=%d latestPromoT=%s",
+                         TimeToString(time[i], TIME_DATE|TIME_MINUTES), b176nS, b176lpS);
+            }
         }
 
       if(SRJ_InDebugWindow(i))
```

## T1 filed-trade tables (side/date/time/price vs DEALS_*-B137 + kept packs; -B170 DEALS NOT FOUND, substitution disclosed)
- RECON62-B176D: 14 deals #2-15: 8/28 sell 10:05 1.16466 / buy 11:35 1.16467; 9/01 buy 17:35 1.16024 / sell 17:50 1.15987; 9/04 buy 16:00 1.16019 / sell 23:55 1.16129; 9/07 buy 09:20 1.16138 / sell 11:15 1.16315; buy 16:45 1.16264 / sell 1.16315; 9/08 sell 10:10 1.16205 / buy 1.16102; sell 17:00 1.16220 / buy 1.16275. 14/14 SAME (volumes per kept: 4.05 #10/#11). Marker EURUSD 563338/3168 log 6120219. DONE PASSED 20:08:57. No STOP.
- JUNE0525-B176D: 8 deals #2-9: 5/27 buy 15:35 159.344 / sell 20:08 159.535; 6/03 buy 09:10 159.932 / sell 09:59 159.983; 6/05 buy 16:15 160.065 / sell 19:16 160.298; 6/11 buy 14:40 160.530 / sell 15:23 160.588 (4 June absent, PROMO gate holds). SAME (volumes 0.35/5.69 kept). Marker USDJPY 740873/4320 log 7015958. DONE PASSED 20:16:22. No STOP.
- GBP0629-B176D: 4 deals #2 buy 18:15 1.33716 / #3 sell 19:07 1.33564 0.65 / #4 sell 14:45 1.33863 / #5 buy 16:54 1.33747 1.28. SAME as B-170 (2 July still fires, expected). Marker GBPUSD 1386092/4320 log 7874195; window 6/29-7/17. DONE never written by watcher (graded from genuine marker, B-162 precedent). No STOP.

## T2 cuts (one Python pass; CRLF; renumbered per file; all <900KB)
- RECON62 W1 1993 / W2 1980 / W3 2501; JUNE W1 958 / W2 893 / W3 2119 / W4 1158 / W5 2183; GBP 2443. Cutter fix: first cut dropped GAP_FORM (date regex missed t1=/t2=/t3=); re-cut whole.

## T3 restore proof
- Indicator src 7842A02E + ex5 10880847 (from .preB176, re-hashed); terminal.ini CF80083C; Profiles/Charts 23 files from content copies. No terminal64.

## S re-grade (prints alone; pack lines are HISZONE_B176_* week files)
- A1: FORM W1:1235 + TOUCH 09:55 W1:1370 (remBefore FULL) + no DEAD + opp 09:55 -> MET-SAME.
- A2: FORM W2:651 + TOUCH 16:45 W2:654 (remBefore FULL) + opp 16:45 -> MET-SAME.
- A3: REACH 15:30/35/40 W2:1560-1575 in [13:50*,15:55]; LATEST 13:50 W2:1587 vs W-L2 09:05 DIFFERENCE (untouched promo, verdict SAME) -> MET-SAME.
- A4: REACH 09:00/09:05 W3:503/504/508/509 in [08:55,09:15]; LATEST 08:55 W3:521 -> MET-SAME.
- A5: FORM W3:846 + TOUCH 16:05 W3:882 (remBefore FULL) + opp 16:05 -> MET-SAME.
- A6: REACH 09:45/09:50/10:05 W3:1799/1804/1816 in [09:40,10:05]; LATEST 09:40 W3:1818 -> MET-SAME.
- A7: REACH 16:15 W3:2126 in [14:50,16:55]; LATEST 14:50 W3:2168 -> MET-SAME.
- B2: REACH 16:00 159.881-159.916 W4:733 in [15:40,16:10]; LATEST 15:40 W4:739 -> MET-SAME.
- B3: REACH 10:05 160.489-160.504 W5:1588 in [08:30,14:35]; LATEST 14:35 08:30 W5:1766 -> MET-SAME.
- C-05-27: REACH 15:25 159.264-159.290 W1:638 in [14:55,15:30]; LATEST 14:55 W1:641 -> MET-SAME (listed).
- C-06-03: FORM W3:337 + TOUCH 09:00 W3:348 (remBefore EMPTY, consumed 08:50) + REACH 09:05 W3:357 in [09:00,09:05]; LATEST 09:00 W3:358 -> MET-SAME.
- T0702: no B TOUCH at 18:10; no B REACH 17:15-18:10; LATEST 17:15 GBP:817 -> NOT MET-SAME.
- T0707: REACH 12:30 W:1816 + 14:00-14:40 in [13:05*,14:40]; LATEST 13:05 W:1960 vs W-L2 12:25 DIFFERENCE (verdict SAME, change detector) -> MET-SAME.
- 9 OTHER-GATE rows stay OTHER-GATE. Table still SEPARATES: REPRODUCED.
- Footnotes: print REACH 12:30 reproduces B152PR cbT 12:30 (packs cut out-of-window rows, prints do not); nLive counts live+promoted (B152PR nz adds post-promo touch) - definitional, not grading inputs.

## R spots
- R1: PREBIND EA:9630-9646 (CONFIRM_PREBIND EA:9640 bar/dir/poi, no rt); commit overwrite EA:9518 + arm EA:9544 (s31_inPlay only); S4 edge EA:9795; B60C print EA:2693 (bar/rt/rBar/cSrc, S5-div site only). rt/confirm-bar in scope ONLY at the B60C computation (S5-div pass); at NEITHER commit nor jump.
- R2: iCustom EA:11853-11858 (Symbol, Current, InpFlowLogicName, "", 1, lookback, H4/H1/M15, true, 60); buffers 51 (indicator L8). B-156 shape: index 51+ + SetIndexBuffer + ReadFlow at site. No edit.
- R3 roads -B176D: A1 JUMP (S3->S5 + PREBIND 10:00, log 5996426/5996427); B2 JUMP (S3->S5 + PREBIND 16:10, log 6929200/6929201); T0702 ARM (S3->S4 18:15, log 7751376; B-171 reroute needs its S4-block, absent); T0707 ARM (log 7777334); A2/A6/B3 ARM (S3->S4 rows); rest SIGNALs at kept times. No change.

(End of slice)
