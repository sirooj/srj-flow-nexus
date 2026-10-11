# BUILDER SLICE B-178 - raw rows (R0 hits, zone-lifecycle hunk, run tables, restore)

Base: builder/B-178 cut at 2cac14e. Backups .preB178 (ind src 7842A02E/ex5 10880847, terminal.ini CF80083C, Profiles/Charts.preB178 23 files).
K2 verify: .B176HZ re-applied byte-for-byte (A22067AD); [B-178 B178ZL] count 1; brace +8/+8 vs .B176HZ (balanced 120/120; +22 vs .preB178 = B176HZ +14 + hunk +8); compile 0 errors binary fresh (3 code-43: :1541/:1756 pre-existing shifted + :1817 new mirrored startBar cast). Trial ind src 9AD487F2 / ex5 EA4D9473.
K3 spots: reach loop indicator:1728-1766 (g_orderblocks/GetOB/isPromoted/promotionBar/isValid/isBullish) + LATEST :1779-1782; formation field = startBar (B162ORIGIN :1588/:1594 via SRJ_BarTimeStr); kill level = invalidationLevel/invalidationBar (SRJ_Types.mqh; OrderblockMgr:501-514 closedBeyondInvalidation test, B160K old line) FOUND, indicator-readable (includes SRJ_OrderblockMgr.mqh). KILL-LEVEL NOT FOUND not taken.
K0 quotes: spec 3.5 L131 in-play whole; spec 3.5.1 L147 order + L152 promo-clears-touch; spec 1.2 L54 relevant=promoted; spec 9.9 age; MOST-RECENT-XOB-TAG L244 documentation-only; W2 L259 + B4 L254 (2 July must-never). No conflict; print-only.
K5 stamp: rows carry time[i] of the closed bar, as B176HZ does (B145).

## R0 hits raw (PRESENT-MISREAD; two patterns agree; ZERO-COUNT guarded)
Committed HISZONE_B176_GBP0629.csv, B176HZ XOB_REACH side=B on 2026.07.02 17:15-18:10:
- pack 764 jl 7751066: [SRJ-IND] B176HZ XOB_REACH side=B bar=2026.07.02 17:20 range=1.33661-1.33767 promoT=2026.07.02 17:15
- pack 765 jl 7751067: [SRJ-IND] B176HZ XOB_REACH side=B bar=2026.07.02 17:20 range=1.33660-1.33766 promoT=2026.07.02 17:15
- pack 774 jl 7751122: [SRJ-IND] B176HZ XOB_REACH side=B bar=2026.07.02 17:30 range=1.33555-1.33697 promoT=2026.07.02 17:15
- pack 775 jl 7751123: [SRJ-IND] B176HZ XOB_REACH side=B bar=2026.07.02 17:30 range=1.33562-1.33684 promoT=2026.07.02 16:40
- pack 782 jl 7751151: [SRJ-IND] B176HZ XOB_REACH side=B bar=2026.07.02 17:35 range=1.33555-1.33697 promoT=2026.07.02 17:15
- pack 783 jl 7751152: [SRJ-IND] B176HZ XOB_REACH side=B bar=2026.07.02 17:35 range=1.33562-1.33684 promoT=2026.07.02 16:40
- pack 817 jl 7751326: [SRJ-IND] B176HZ LATEST side=B bar=2026.07.02 18:10 nLive=13 latestPromoT=2026.07.02 17:15
- No 17:15/17:25/17:40-18:10 REACH in cut (second-form regex count 0 at 17:25).
Day-log spans (20261011.log, one bounded pass 7750900-7751350 + 10467600-10468100, 32.1s, 63 hits): B176D lines 7751066/7751067/7751122/7751123/7751151/7751152 byte-identical to cut; B177 span 10467759/10467760 (17:20 pair) + 10467815/10467816 (17:30 pair) + 10467844/10467845 (17:35 pair), same ranges/promos; B177 LATEST B 18:10 at 10468019 nLive=13 latestPromoT 17:15 (identical to B176D 7751326); B177HZ gate row 10468078 bar=18:10 dir=LONG rt=18:10 gapTouch=0.0 xobWin=1.0 verdict=PASS.
Class: PRESENT-MISREAD (rows in the committed cut; B-176 Part S misread them). FVG half stands (GAP_TOUCH at 18:10 bar all t=18:05: log 7751301/7751302, 10467994/10467995).

## Indicator diff vs .preB178 raw (shell preamble lines cut; diff starts at diff --git)
```
diff --git a/Indicators/SRJ_FlowLogic.mq5.preB178 b/Indicators/SRJ_FlowLogic.mq5.B178ZL
index a121e70..9da3042 100644
--- a/Indicators/SRJ_FlowLogic.mq5.preB178
+++ b/Indicators/SRJ_FlowLogic.mq5.B178ZL
@@ -175,6 +175,36 @@ double g_bufB150Bull[];
 double g_bufB150Bear[];
 double g_buf2xOB[];   // [B156SL] Buffer 50. 5m 2xOB state per closed bar (1 = strong 2xOB, 0 = not).

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
+
+//--- B178ZL zone-lifecycle store (relay B-178; print only). One slot per
+//--- promoted XOB on first sight, keyed by side + range + promotion candle
+//--- (never a number). Every new slot fully initialized; exact-size growth;
+//--- event times and prices saved when seen, never a bar index read later.
+bool     g_b178Bull[];
+datetime g_b178FormT[];
+datetime g_b178PromoT[];
+double   g_b178Lo[];
+double   g_b178Hi[];
+double   g_b178Kill[];
+bool     g_b178Dead[];
+
 // [P-SWINGIMB] Returns 0/1/2/3 only. apexBar is the confirmed fractal bar
 // (target=i-1 at the call site); bullish selects the HIGH (up-push) side.
 int SrjSwingImbCode(const int apexBar, const bool bullish)
@@ -1482,6 +1512,23 @@ int OnCalculate(const int rates_total,
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
+         ArrayResize(g_b178Bull, 0);        // B178ZL zone-lifecycle store: start empty
+         ArrayResize(g_b178FormT, 0);
+         ArrayResize(g_b178PromoT, 0);
+         ArrayResize(g_b178Lo, 0);
+         ArrayResize(g_b178Hi, 0);
+         ArrayResize(g_b178Kill, 0);
+         ArrayResize(g_b178Dead, 0);
          }
        if(barClosed)
          {
@@ -1590,6 +1637,250 @@ int OnCalculate(const int rates_total,
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
+             //--- [B-178 B178ZL] Zone lifecycle per promoted XOB (relay B-178; print only).
+             //--- Slots appended on first sight with every field set; event times saved
+             //--- when seen, never a bar index read later. PROMO once, KILL once,
+             //--- ALIVE every closed bar inside the session windows. Same cadence as above.
+             MqlDateTime b178ts;
+             TimeToStruct(time[i], b178ts);
+             int b178tod = b178ts.hour * 60 + b178ts.min;
+             bool b178inWin = ((b178tod >= 540 && b178tod <= 720) || (b178tod >= 840 && b178tod <= 1140));
+             int b178nzB = 0, b178nzS = 0;
+             string b178listB = "", b178listS = "";
+             for(int b178q = 0; b178q < b176rn; b178q++)
+               {
+                COrderblock *b178ob = GetOB(g_orderblocks, b178q);
+                if(b178ob == NULL) continue;
+                if(!b178ob.isPromoted) continue;
+                if(SrjIsNa(b178ob.promotionBar)) continue;
+                if(SrjIsNa(b178ob.low) || SrjIsNa(b178ob.high)) continue;
+                int b178pb = (int)b178ob.promotionBar;
+                if(b178pb < 0 || b178pb >= rates_total) continue;
+                datetime b178ptd = SRJ_BarTime(b178pb);
+                if(b178ptd <= 0) continue;
+                bool b178bull = b178ob.isBullish;
+                int b178slot = -1;
+                int b178n = ArraySize(g_b178Dead);
+                for(int b178k = 0; b178k < b178n; b178k++)
+                  {
+                   if(g_b178Bull[b178k] != b178bull) continue;
+                   if(g_b178Lo[b178k] != b178ob.low) continue;
+                   if(g_b178Hi[b178k] != b178ob.high) continue;
+                   if(g_b178PromoT[b178k] != b178ptd) continue;
+                   b178slot = b178k; break;
+                  }
+                string b178pt = TimeToString(b178ptd, TIME_DATE|TIME_MINUTES);
+                string b178rg = DoubleToString(b178ob.low, _Digits) + "-" + DoubleToString(b178ob.high, _Digits);
+                if(b178slot < 0)
+                  {
+                   int b178m = ArraySize(g_b178Dead);
+                   ArrayResize(g_b178Bull, b178m+1);   ArrayResize(g_b178FormT, b178m+1);
+                   ArrayResize(g_b178PromoT, b178m+1); ArrayResize(g_b178Lo, b178m+1);
+                   ArrayResize(g_b178Hi, b178m+1);     ArrayResize(g_b178Kill, b178m+1);
+                   ArrayResize(g_b178Dead, b178m+1);
+                   datetime b178ftd = 0;
+                   int b178fb = (int)b178ob.startBar;
+                   if(b178fb >= 0 && b178fb < rates_total) b178ftd = SRJ_BarTime(b178fb);
+                   g_b178Bull[b178m] = b178bull;
+                   g_b178FormT[b178m] = b178ftd;
+                   g_b178PromoT[b178m] = b178ptd;
+                   g_b178Lo[b178m] = b178ob.low; g_b178Hi[b178m] = b178ob.high;
+                   g_b178Kill[b178m] = b178ob.invalidationLevel;
+                   g_b178Dead[b178m] = false;
+                   string b178ft = (b178ftd > 0 ? TimeToString(b178ftd, TIME_DATE|TIME_MINUTES) : "-");
+                   string b178kl = (SrjIsNa(b178ob.invalidationLevel) ? "NOT_FOUND" : DoubleToString(b178ob.invalidationLevel, _Digits));
+                   PrintFormat("[SRJ-IND] B178ZL PROMO side=%s formT=%s promoT=%s range=%s kill=%s",
+                               (b178bull ? "B" : "S"), b178ft, b178pt, b178rg, b178kl);
+                   b178slot = b178m;
+                  }
+                if(!b178ob.isValid && !g_b178Dead[b178slot])
+                  {
+                   g_b178Dead[b178slot] = true;
+                   string b178ft = (g_b178FormT[b178slot] > 0 ? TimeToString(g_b178FormT[b178slot], TIME_DATE|TIME_MINUTES) : "-");
+                   PrintFormat("[SRJ-IND] B178ZL KILL side=%s formT=%s promoT=%s range=%s t=%s o=%s h=%s l=%s c=%s",
+                               (b178bull ? "B" : "S"), b178ft, b178pt, b178rg,
+                               TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                               DoubleToString(open[i], _Digits), DoubleToString(high[i], _Digits),
+                               DoubleToString(low[i], _Digits), DoubleToString(close[i], _Digits));
+                  }
+                if(b178ob.isValid)
+                  {
+                   string b178ft = (g_b178FormT[b178slot] > 0 ? TimeToString(g_b178FormT[b178slot], TIME_DATE|TIME_MINUTES) : "-");
+                   string b178seg = b178ft + "/" + b178pt + "/" + b178rg;
+                   if(b178bull) { b178nzB++; b178listB += (b178listB == "" ? "" : ";") + b178seg; }
+                   else { b178nzS++; b178listS += (b178listS == "" ? "" : ";") + b178seg; }
+                  }
+               }
+             if(b178inWin)
+               {
+                PrintFormat("[SRJ-IND] B178ZL ALIVE side=B bar=%s n=%d list=%s",
+                            TimeToString(time[i], TIME_DATE|TIME_MINUTES), b178nzB, (b178listB == "" ? "-" : b178listB));
+                PrintFormat("[SRJ-IND] B178ZL ALIVE side=S bar=%s n=%d list=%s",
+                            TimeToString(time[i], TIME_DATE|TIME_MINUTES), b178nzS, (b178listS == "" ? "-" : b178listS));
+               }
+            }
+         }
+
+       if(SRJ_InDebugWindow(i))
+```
(Full diff raw: 00_CURRENT_WORKING/work_b178_diff_ind.txt 326 lines; shell preamble cut, diff starts at diff --git; transcription verified line-for-line against work_b178_diff_ind_utf8.txt.)
Trial re-appliable from .B178ZL copies (src 9AD487F2 uncommitted; ex5 EA4D9473 superseded by restore).
K4 window: tod 540-720/840-1140 (server 09:00-12:00, 14:00-19:00). No buffer/export/include/threshold/count.
ALIVE defect owned: journal message cap ~255 chars truncates long ALIVE lists (n= counts stand, lists cut); grading carried by PROMO+KILL rows, ALIVE-n as control.

## T1 tables (print-only; vs B-177 T1 baseline; side/date/time/price; volumes shown never a STOP)
- RECON62-B178P 14/14 SAME: #2 sell 8/28 10:05 1.16466 2.38; #3 buy 11:35 1.16467; #4 buy 9/01 17:35 1.16024 2.04; #5 sell 17:50 1.15987; #6 buy 9/04 16:00 1.16019 0.57; #7 sell 23:55 1.16129; #8 buy 9/07 09:20 1.16138 2.49; #9 sell 10:53:07 1.16201; #10 buy 16:45 1.16264 4.05; #11 sell 17:13:30 1.16315; #12 sell 9/08 10:10 1.16205 1.95; #13 buy 10:42:46 1.16102; #14 sell 17:00 1.16220; #15 buy 17:26:29 1.16275. Marker 563338/3168. DONE PASSED.
- JUNE0525-B178P 8/8 SAME: #2 buy 5/27 15:35 159.344 1.08; #3 sell 20:08 159.535; #4 buy 6/03 09:10 159.932 3.75; #5 sell 09:59 159.983; #6 buy 6/05 16:15 160.065 0.35; #7 sell 19:16 160.298; #8 buy 6/11 14:40 160.530 5.69; #9 sell 15:23 160.588 (4 June absent). Marker 740873/4320. DONE PASSED.
- GBP0629-B178P 4 deals SAME: #2 buy 7/02 18:15 1.33716 0.65; #3 sell 19:07:53 1.33564; #4 sell 7/07 14:45 1.33863 1.28; #5 buy 16:54:59 1.33747. 2 JULY STILL FIRES (print-only, expected). Marker 1386092/4320. DONE PASSED.
- STOPs: S1 pass all runs (no side/date/time/price diff, no deal added/lost); S2 pass (14/8/4 deals, no halt/error); S3 pass (windows verified at each launch).

## T3 restore proof
- EA src 794DD4B8 + ex5 3A55C566 (untouched); ind src 7842A02E + ex5 10880847; ini CF80083C; Profiles/Charts 23 files; no terminal64. Kept pair live.
(End of slice)
