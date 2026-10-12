# BUILDER SLICE B-179 - raw diffs vs .preB179, T1 tables, T3 rows

Base: builder/B-179 cut at d1d566f. Backups .preB179 (ind src 7842A02E/ex5 10880847, EA src 794DD4B8/ex5 3A55C566, terminal.ini CF80083C, GBP0629-B162.ini 9C88E21D, Profiles/Charts.preB179 23 files).
K2 verify: .B177HZ re-applied byte-for-byte (2AF9C6D3); markers [B-176 B176HZ]/[B-177 B177HZX]/[B-178 B178ZL]/[B-179 B179HZB] each exactly once; brace +31/+31 vs .preB179 (hunk delta, balanced 129/129); compile 0 errors binary fresh (3 code-43: :1570/:1792 shifted pre-existing + :1866 new startBar cast). Trial ind src 417728FD / ex5 04D88589.
K3 verify: EA .B177HZ re-applied byte-for-byte (EB18717E, no new EA hunk); marker [B-177 B177HZ] once; brace +2/+2 (B177HZ hunk delta, balanced 1218/1218); compile 0 errors 0 warnings binary fresh. Trial EA ex5 9CFC0B00. Copies .B179HZB kept uncommitted (ind 417728FD, EA EB18717E).
K2b grade convention (B-178 HZ_B): reach-after-own-promotion `$afterOwn = ($bar -gt $pt)` with inclusive overlap `(!(low[i] > zone.high || high[i] < zone.low))`, MQL `time[i] > b178ptd`; standing = PROMO on record with no KILL at/before C (ALIVE-n control).

## Indicator diff vs .preB179 raw (+372/-4; shell preamble cut)
```
diff --git a/Indicators/SRJ_FlowLogic.mq5.preB179 b/Indicators/SRJ_FlowLogic.mq5
index a121e70..37b0ffd 100644
--- a/Indicators/SRJ_FlowLogic.mq5.preB179
+++ b/Indicators/SRJ_FlowLogic.mq5
@@ -5,7 +5,7 @@
 #property copyright "SRJ Flow Logic Auto ΓÇö Pine v6 port"
 #property version   "1.00"
 #property indicator_chart_window
-#property indicator_buffers 51  // [B156SL] Was 50. Added 50 (5m 2xOB flag). [B150PR] Was 48. Added 48 (bull PROMO-RETURN), 49 (bear PROMO-RETURN). [P-SWINGIMB-2 E5] Was 39. Added 39 (OB swing-bar time). [P-SWINGIMB] Was 37. Added 37 (swing-high imbalance code), 38 (swing-low imbalance code). [Task 113] Was 33. Added 33 (selected XOB promotionTime). [Task 102] Was 31. Added 31 (selected XOB objId), 32 (selected FVG objId). [Task 155] Was 34. Added 34 (tickOBIsValid provenance), 35 (tickFVGIsValid provenance, population deferred), 36 (hasPersistedOpposingFVG provenance, population deferred). [TP-DATA-SOURCE-COMPLETE-001] Was 40. Added 40-47 (prev-day session H/L shadow).
+#property indicator_buffers 55  // [B177HZX] Was 51. Added 51 (bull gap-touched), 52 (bear gap-touched), 53 (bull XOBWIN), 54 (bear XOBWIN). [B156SL] Was 50. Added 50 (5m 2xOB flag). [B150PR] Was 48. Added 48 (bull PROMO-RETURN), 49 (bear PROMO-RETURN). [P-SWINGIMB-2 E5] Was 39. Added 39 (OB swing-bar time). [P-SWINGIMB] Was 37. Added 37 (swing-high imbalance code), 38 (swing-low imbalance code). [Task 113] Was 33. Added 33 (selected XOB promotionTime). [Task 102] Was 31. Added 31 (selected XOB objId), 32 (selected FVG objId). [Task 155] Was 34. Added 34 (tickOBIsValid provenance), 35 (tickFVGIsValid provenance, population deferred), 36 (hasPersistedOpposingFVG provenance, population deferred). [TP-DATA-SOURCE-COMPLETE-001] Was 40. Added 40-47 (prev-day session H/L shadow).
 #property indicator_plots   2
 
 #property indicator_label1  "Fractal High"
@@ -175,6 +175,50 @@ double g_bufB150Bull[];
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
+//--- [B-177 B177HZX] His-zone export values (relay B-177; additive export, no gate).
+//--- Four buffers (B-156 shape): 51 bull gap-touched, 52 bear gap-touched,
+//--- 53 bull XOBWIN, 54 bear XOBWIN, per closed bar. Window state is two
+//--- datetimes + two flags, start-empty, reset on full recalculation.
+double   g_bufHzGapBull[];
+double   g_bufHzGapBear[];
+double   g_bufHzWinBull[];
+double   g_bufHzWinBear[];
+datetime g_b177WinPromoB;
+datetime g_b177WinPromoS;
+bool     g_b177WinHitB;
+bool     g_b177WinHitS;
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
+datetime g_b178ReachT[];   // B179HZB reach field: last closed-bar reach at/after own promotion
+
 // [P-SWINGIMB] Returns 0/1/2/3 only. apexBar is the confirmed fractal bar
 // (target=i-1 at the call site); bullish selects the HIGH (up-push) side.
 int SrjSwingImbCode(const int apexBar, const bool bullish)
@@ -755,7 +799,13 @@ int OnInit()
    // [B150PR] Append-only. Indices 48/49 = previous buffer count (was 48 buffers, 0..47).
    SetIndexBuffer(48, g_bufB150Bull, INDICATOR_CALCULATIONS);
    SetIndexBuffer(49, g_bufB150Bear, INDICATOR_CALCULATIONS);
-   SetIndexBuffer(50, g_buf2xOB,     INDICATOR_CALCULATIONS);   // [B156SL]
+    SetIndexBuffer(50, g_buf2xOB,     INDICATOR_CALCULATIONS);   // [B156SL]
+
+    // [B177HZX] Append-only. Indices 51-54 = previous buffer count (was 51 buffers, 0..50).
+    SetIndexBuffer(51, g_bufHzGapBull, INDICATOR_CALCULATIONS);
+    SetIndexBuffer(52, g_bufHzGapBear, INDICATOR_CALCULATIONS);
+    SetIndexBuffer(53, g_bufHzWinBull, INDICATOR_CALCULATIONS);
+    SetIndexBuffer(54, g_bufHzWinBear, INDICATOR_CALCULATIONS);
 
    ArraySetAsSeries(g_bufBias,         false);
    ArraySetAsSeries(g_bufOBValid,      false);
@@ -826,8 +876,14 @@ int OnInit()
    ArraySetAsSeries(g_bufB150Bull, false);
    ArraySetAsSeries(g_bufB150Bear, false);
 
-   // [B156SL]
-   ArraySetAsSeries(g_buf2xOB, false);
+    // [B156SL]
+    ArraySetAsSeries(g_buf2xOB, false);
+
+    // [B177HZX]
+    ArraySetAsSeries(g_bufHzGapBull, false);
+    ArraySetAsSeries(g_bufHzGapBear, false);
+    ArraySetAsSeries(g_bufHzWinBull, false);
+    ArraySetAsSeries(g_bufHzWinBear, false);
 
    SRJ_BindInputs(); 
    SRJ_Glyph_Init(); 
@@ -1482,6 +1538,26 @@ int OnCalculate(const int rates_total,
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
+         ArrayResize(g_b178ReachT, 0);      // B179HZB reach field: start empty
+         g_b177WinPromoB = 0; g_b177WinPromoS = 0;   // B177HZX window state: start empty
+         g_b177WinHitB = false; g_b177WinHitS = false;
         }
       if(barClosed)
         {
@@ -1590,6 +1666,298 @@ int OnCalculate(const int rates_total,
                      (b162nS > 0 ? (DoubleToString(b162lS, _Digits) + "-" + DoubleToString(b162hS, _Digits)) : "-"),
                      (b162nS > 0 ? SRJ_BarTimeStr(b162fS) : "-"),
                      (b162nS > 0 ? b162sS : "-"));
+          //--- B176HZ his-rule gaps + XOB reach (relay B-176; print only).
+          //--- Locals only: no buffer write, no write outside g_b176* slots,
+          //--- no include change, no threshold or count. Same gate/cadence as above.
+          if(i >= 2)
+            {
+             //--- existing gaps: touch/death on closed bar i (detected earlier only)
+             bool b177gtB = false, b177gtS = false;   // B177HZX: touched-not-killed this bar, per side
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
+                bool b177killed = false;   // B177HZX: this bar kills this gap
+                if(low[i] < b176lo && high[i] > b176hi)
+                  {
+                   g_b176Dead[b176k] = true;
+                   b177killed = true;
+                   PrintFormat("[SRJ-IND] B176HZ GAP_DEAD side=%s t=%s o=%s h=%s l=%s c=%s kind=WICK_THROUGH",
+                               b176side, TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                               DoubleToString(open[i], _Digits), DoubleToString(high[i], _Digits),
+                               DoubleToString(low[i], _Digits), DoubleToString(close[i], _Digits));
+                  }
+                else if((!b176bull && close[i] > b176hi && close[i] > open[i]) ||
+                        (b176bull && close[i] < b176lo && close[i] < open[i]))
+                  {
+                   g_b176Dead[b176k] = true;
+                   b177killed = true;
+                   PrintFormat("[SRJ-IND] B176HZ GAP_DEAD side=%s t=%s o=%s h=%s l=%s c=%s kind=BODY_THROUGH",
+                               b176side, TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                               DoubleToString(open[i], _Digits), DoubleToString(high[i], _Digits),
+                               DoubleToString(low[i], _Digits), DoubleToString(close[i], _Digits));
+                  }
+                if(!b177killed)   // B177HZX: touched without being killed on this bar
+                  { if(b176bull) b177gtB = true; else b177gtS = true; }
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
+             bool b177reachB = false, b177reachS = false;   // B177HZX: reach printed this bar
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
+                     {
+                      b177reachB = true;
+                      PrintFormat("[SRJ-IND] B176HZ XOB_REACH side=B bar=%s range=%s-%s promoT=%s",
+                                  TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                                  DoubleToString(b176ob.low, _Digits), DoubleToString(b176ob.high, _Digits), b176pt);
+                     }
+                  }
+                else
+                  {
+                   if(b176pbS == SRJ_NA_INT || b176pb > b176pbS) b176pbS = b176pb;
+                   if(!b176ob.isValid) continue;
+                   b176nS++;
+                   if(!(low[i] > b176ob.high || high[i] < b176ob.low))
+                     {
+                      b177reachS = true;
+                      PrintFormat("[SRJ-IND] B176HZ XOB_REACH side=S bar=%s range=%s-%s promoT=%s",
+                                  TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                                  DoubleToString(b176ob.low, _Digits), DoubleToString(b176ob.high, _Digits), b176pt);
+                     }
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
+             //--- B177HZX latest promotion per side (kept; feeds the B179HZB value).
+             datetime b177curB = 0, b177curS = 0;
+             if(b176pbB != SRJ_NA_INT)
+               { datetime b177d = SRJ_BarTime(b176pbB); if(b177d > 0) b177curB = b177d; }
+             if(b176pbS != SRJ_NA_INT)
+               { datetime b177d = SRJ_BarTime(b176pbS); if(b177d > 0) b177curS = b177d; }
+             //--- [B-178 B178ZL] Zone lifecycle per promoted XOB (relay B-178; print only).
+             //--- Slots appended on first sight with every field set; event times saved
+             //--- when seen, never a bar index read later. PROMO once, KILL once,
+             //--- ALIVE every closed bar inside the session windows. Same cadence as above.
+             MqlDateTime b178ts;
+             TimeToStruct(time[i], b178ts);
+             int b178tod = b178ts.hour * 60 + b178ts.min;
+             bool b178inWin = ((b178tod >= 540 && b178tod <= 720) || (b178tod >= 840 && b178tod <= 1140));
+             //--- [B-179 B179HZB] Standing-zone window value (relay B-179; additive export value only).
+             bool b179winB = false, b179winS = false;   // B179HZB standing-zone value per side
+             int b179firstB = -1, b179firstS = -1;      // first carrying slot per side, slot order
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
+                   ArrayResize(g_b178ReachT, b178m+1);
+                   datetime b178ftd = 0;
+                   int b178fb = (int)b178ob.startBar;
+                   if(b178fb >= 0 && b178fb < rates_total) b178ftd = SRJ_BarTime(b178fb);
+                   g_b178Bull[b178m] = b178bull;
+                   g_b178FormT[b178m] = b178ftd;
+                   g_b178PromoT[b178m] = b178ptd;
+                   g_b178Lo[b178m] = b178ob.low; g_b178Hi[b178m] = b178ob.high;
+                   g_b178Kill[b178m] = b178ob.invalidationLevel;
+                   g_b178Dead[b178m] = false;
+                   g_b178ReachT[b178m] = 0;
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
+                if(b178ob.isValid && !(low[i] > b178ob.high || high[i] < b178ob.low) && time[i] > b178ptd)
+                   g_b178ReachT[b178slot] = time[i];   // B179HZB reach-after-own-promotion (grade: $bar -gt $pt)
+                if(b178ob.isValid && g_b178ReachT[b178slot] > 0)   // B179HZB standing-zone value
+                  {
+                   datetime b179lp = (b178bull ? b177curB : b177curS);
+                   if(b179lp > 0 && g_b178ReachT[b178slot] >= b179lp)
+                     {
+                      if(b178bull) { b179winB = true; if(b179firstB < 0 || b178slot < b179firstB) b179firstB = b178slot; }
+                      else { b179winS = true; if(b179firstS < 0 || b178slot < b179firstS) b179firstS = b178slot; }
+                     }
+                  }
+               }
+             string b179txtB = "-", b179txtS = "-";
+             if(b179firstB >= 0)
+               {
+                string b179ft = (g_b178FormT[b179firstB] > 0 ? TimeToString(g_b178FormT[b179firstB], TIME_DATE|TIME_MINUTES) : "-");
+                b179txtB = b179ft + "/" + TimeToString(g_b178PromoT[b179firstB], TIME_DATE|TIME_MINUTES) + "/" + DoubleToString(g_b178Lo[b179firstB], _Digits) + "-" + DoubleToString(g_b178Hi[b179firstB], _Digits) + "/" + TimeToString(g_b178ReachT[b179firstB], TIME_DATE|TIME_MINUTES);
+               }
+             if(b179firstS >= 0)
+               {
+                string b179ft = (g_b178FormT[b179firstS] > 0 ? TimeToString(g_b178FormT[b179firstS], TIME_DATE|TIME_MINUTES) : "-");
+                b179txtS = b179ft + "/" + TimeToString(g_b178PromoT[b179firstS], TIME_DATE|TIME_MINUTES) + "/" + DoubleToString(g_b178Lo[b179firstS], _Digits) + "-" + DoubleToString(g_b178Hi[b179firstS], _Digits) + "/" + TimeToString(g_b178ReachT[b179firstS], TIME_DATE|TIME_MINUTES);
+               }
+             if(b178inWin)
+               {
+                PrintFormat("[SRJ-IND] B179HZB side=B bar=%s latest=%s win=%d first=%s",
+                            TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                            (b177curB > 0 ? TimeToString(b177curB, TIME_DATE|TIME_MINUTES) : "-"),
+                            (b179winB ? 1 : 0), b179txtB);
+                PrintFormat("[SRJ-IND] B179HZB side=S bar=%s latest=%s win=%d first=%s",
+                            TimeToString(time[i], TIME_DATE|TIME_MINUTES),
+                            (b177curS > 0 ? TimeToString(b177curS, TIME_DATE|TIME_MINUTES) : "-"),
+                            (b179winS ? 1 : 0), b179txtS);
+               }
+             if(target >= 0)
+               {
+                g_bufHzGapBull[target] = (b177gtB ? 1.0 : 0.0);
+                g_bufHzGapBear[target] = (b177gtS ? 1.0 : 0.0);
+                g_bufHzWinBull[target] = (b179winB ? 1.0 : 0.0);
+                g_bufHzWinBear[target] = (b179winS ? 1.0 : 0.0);
+               }
+            }
         }
 
       if(SRJ_InDebugWindow(i))
```

## EA diff vs .preB179 raw (+42/-5; the B177HZ hunk re-applied; shell preamble cut)
```
diff --git a/Experts/SRJ_FlowNexus_EA.mq5.preB179 b/Experts/SRJ_FlowNexus_EA.mq5
index 3ca9b8b..169c027 100644
--- a/Experts/SRJ_FlowNexus_EA.mq5.preB179
+++ b/Experts/SRJ_FlowNexus_EA.mq5
@@ -212,6 +212,11 @@ MT_EXIT_DAY_CLOSE   = 8
 #define FL_BUF_B150_BEAR         49
 //--- [B157K] 5m 2xOB flag export (relay B-156 K1, re-applied B-157; next free index).
 #define FL_BUF_B156_2XOB         50
+//--- [B177HZ] His-zone export values (relay B-177 K2; additive, next free indices).
+#define FL_BUF_HZ_GAP_BULL       51
+#define FL_BUF_HZ_GAP_BEAR       52
+#define FL_BUF_HZ_WIN_BULL       53
+#define FL_BUF_HZ_WIN_BEAR       54
 
 #define SWEEP_NONE        0
 #define SWEEP_ASIA_HIGH   1
@@ -425,6 +430,8 @@ void MtReset()
 #define ABORT_HOLDER_EXPIRED   "HOLDER_EXPIRED"
 //--- [B153K] PROMO-RETURN refusal (relay B-153 K4; additive diagnostic string only).
 #define ABORT_PROMO_RETURN_NONE "PROMO_RETURN_NONE"
+//--- [B177HZ] His-zone refusal (relay B-177 K3; additive diagnostic string only).
+#define ABORT_HISZONE_NONE "HISZONE_NONE"
 
 //====================== [Task 160] Migration data contracts ==========
 // Twelve data contracts as an INERT ARCHITECTURE SHELL. Types only.
@@ -9964,11 +9971,41 @@ void EvaluateClosedBar(int barShift, datetime barTime)
                          (b153ok ? DoubleToString(b153pr, 1) : "READFAIL"),
                          b153zsrc,
                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES));
-          if(b153zsrc == "XOB" && b153ok && b153pr < 0.5)
-            {
-             GoAbort(ABORT_PROMO_RETURN_NONE, g_state); return;
-            }
-         }
+           if(b153zsrc == "XOB" && b153ok && b153pr < 0.5)
+             {
+              GoAbort(ABORT_PROMO_RETURN_NONE, g_state); return;
+             }
+          }
+
+        //--- [B-177 B177HZ] His-zone gate (relay B-177 K3; additive, OR'd onto nothing).
+        //--- At the confirmation decision (S5, div decided above, beside B153K):
+        //--- read the trade-side GAPTOUCH at the opposing candle's bar (B60C rt via
+        //--- g_b61RetestTime with the iBarShift idiom) and the trade-side XOBWIN at
+        //--- the confirmation bar via ReadFlow on the live handle only (settled-slot
+        //--- convention, same as B153K). Refuse when both read 0. Every pass prints
+        //--- one row. Both roads (S4-arm EA:9795 and PREBIND-jump EA:9637 fall-through)
+        //--- reach this S5-div block before any order.
+          {
+           double b177gt = 0.0, b177xw = 0.0;
+           int b177gtBuf = (g_dir == DIR_LONG) ? FL_BUF_HZ_GAP_BULL : FL_BUF_HZ_GAP_BEAR;
+           int b177xwBuf = (g_dir == DIR_LONG) ? FL_BUF_HZ_WIN_BULL : FL_BUF_HZ_WIN_BEAR;
+           int b177rtSh = (g_b61RetestTime > 0 ? iBarShift(_Symbol, PERIOD_CURRENT, g_b61RetestTime, true) : -1);
+           bool b177gtOk = (b177rtSh >= 0 && ReadFlow(b177gtBuf, b177gt, b177rtSh));
+           bool b177xwOk = ReadFlow(b177xwBuf, b177xw, barShift);
+           string b177rtS = (g_b61RetestTime > 0 ? TimeToString(g_b61RetestTime, TIME_DATE|TIME_MINUTES) : "-");
+           string b177verdict = ((b177gtOk && b177gt >= 0.5) || (b177xwOk && b177xw >= 0.5)) ? "PASS" : "HISZONE_NONE";
+           if(InpDebugLog)
+              PrintFormat("[SRJ-EA] B177HZ bar=%s dir=%s rt=%s gapTouch=%s xobWin=%s verdict=%s",
+                          TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
+                          DirName(g_dir), b177rtS,
+                          (b177gtOk ? DoubleToString(b177gt, 1) : "READFAIL"),
+                          (b177xwOk ? DoubleToString(b177xw, 1) : "READFAIL"),
+                          b177verdict);
+           if(b177verdict == "HISZONE_NONE")
+             {
+              GoAbort(ABORT_HISZONE_NONE, g_state); return;
+             }
+          }
 
       //--- [P-NEXTOPEN 2026-09-09, operator directive] The entry reference is
       //--- the NEXT candle's OPEN (the forming bar's open at this evaluation
```

## T1 tables (trial vs B-178 T1; side/date/time/price; volumes shown never a STOP)
- RECON62-B179 14/14 SAME: #2 sell 8/28 10:05 1.16466 2.38; #3 buy 11:35 1.16467; #4 buy 9/01 17:35 1.16024 2.04; #5 sell 17:50 1.15987; #6 buy 9/04 16:00 1.16019 0.57; #7 sell 23:55 1.16129; #8 buy 9/07 09:20 1.16138 2.49; #9 sell 10:53:07 1.16201; #10 buy 16:45 1.16264 4.05; #11 sell 17:13:30 1.16315; #12 sell 9/08 10:10 1.16205 1.95; #13 buy 10:42:46 1.16102; #14 sell 17:00 1.16220; #15 buy 17:26:29 1.16275. Marker 563338/3168. DONE PASSED 05:58:55.
- JUNE0525-B179 8/8 SAME: #2 buy 5/27 15:35 159.344 1.08; #3 sell 20:08 159.535; #4 buy 6/03 09:10 159.932 3.75; #5 sell 09:59 159.983; #6 buy 6/05 16:15 160.065 0.35; #7 sell 19:16 160.298; #8 buy 6/11 14:40 160.530 5.69; #9 sell 15:23 160.588 (4 June absent). Marker 740873/4320. DONE PASSED 06:06:14.
- GBP0629-B179 2 deals: #2 sell 7/07 14:45 1.33863 1.29; #3 buy 7/07 16:54:59 1.33747 1.29 (pair SAME side/date/time/price; vol re-sized by balance). 2 JULY ABSENT (refused HISZONE_NONE at 18:10). Marker 1386092/4320. DONE PASSED 06:13:47.
- GBP0629-B179R stability confirm: SAME 2 deals + marker + DONE PASSED 06:58:09; MT5 report minted (Files/MT5_GBP0629-B179.htm 34826 B). Terminal 20720 left OPEN on the R run (blind-test rule).
- STOPs: S1/S2/S3/S4/S5 pass all runs (S2: 2 July long refused on both GBP runs).

## T3 rows (trial B177HZ + B179HZB behind xobWin; all 13 graded SAME; A4 at true 09.07)
- A1 8/28 10:00 EA gt=1.0 xw=0.0 PASS | HZB latest=07:35 win=0 (MET via gap_half).
- A2 9/01 17:30 EA gt=1.0 xw=1.0 PASS (rt=16:45) | HZB latest=17:25 win=1 first=16:45/17:25/1.15975-1.16013/17:30.
- A3 9/04 15:55 EA gt=0.0 xw=1.0 PASS (rt=15:40) | HZB latest=13:50 win=1 first=05:05/05:25/1.15864-1.15873/15:30.
- A4 9/07 09:15 EA gt=0.0 xw=1.0 PASS (rt=09:00; identical to B-177 log 8789920) | HZB latest=08:55 win=1 first=08:05/08:55/1.16098-1.16116/09:15.
- A5 9/07 16:40 EA gt=1.0 xw=1.0 PASS (rt=16:05) | HZB latest=15:30 win=1 first=15:30/11:10/1.15847-1.16260/16:40.
- A6 9/08 10:05 EA gt=1.0 xw=1.0 PASS (rt=09:40) | HZB latest=09:40 win=1 first=09:20/09:40/1.16230-1.16256/10:05 (his 9:20 zone).
- A7 9/08 16:55 EA gt=0.0 xw=1.0 PASS (rt=16:45) | HZB latest=14:50 win=1 first=09:20/09:40/1.16230-1.16256/16:55.
- B2 6/05 16:10 EA gt=0.0 xw=1.0 PASS (rt=16:00) | HZB latest=15:40 win=1 first=15:50/16:05/159.820-159.853/16:00.
- B3 6/11 14:35 EA gt=0.0 xw=1.0 PASS (rt=14:05) | HZB latest=08:30 win=1 first=05:05/08:30/160.494-160.510/14:30.
- C-05-27 5/27 15:30 EA gt=0.0 xw=1.0 PASS (rt=15:25) | HZB latest=14:55 win=1 (listed-only).
- C-06-03 6/03 09:05 EA gt=1.0 xw=1.0 PASS (rt=09:00) | HZB latest=09:00 win=1 first=08:30/08:50/159.894-159.912/09:05.
- T0702 7/02 18:10 EA gt=0.0 xw=0.0 HISZONE_NONE (rt=18:10) | HZB latest=17:15 win=0 first=-.
- T0707 7/07 14:40 EA gt=1.0 xw=1.0 PASS (rt=14:40) | HZB latest=13:05 win=1 first=11:45/12:25/1.33862-1.33936/14:40 (change detector).
- T4 refusals (full-span census, 5): 9/01 15:25 SHORT (C-09-01-1530, still refused); 6/03 18:00 LONG; 6/10 10:25 LONG; 7/02 18:10 LONG (must-never); 7/08 15:30 SHORT (B-177 refusal, still refused). None a register A/B row or section-A deal.

## Final disk state (KEPT; trial live, terminal open)
- EA EB18717E + ex5 9CFC0B00 (pair matches; = .B177HZ re-apply, no new EA hunk); indicator 417728FD + ex5 04D88589 (pair matches); OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; ImbalanceMgr 568F4CE9 untouched; terminal.ini CF80083C (GBP window as-run); inis 1AAD5FF0/0C9D97D3/9C88E21D (+ untracked GBP0629-B179.ini, Report keys under [Tester]); Profiles live (terminal open); terminal64 PID 20720 OPEN on GBP0629-B179R (ACCOUNTED next gate; .preB179 restore owed then). CONTEXT +2; HANDOFF +1; ledger +1 (1325); pointer rewritten; result + slice + separator + 15 HZB cuts + packs + DEALS + INDEX + SETUPS + blind sheet + MT5 report + register note new; helpers + launchers + STATUS/DONE + work files unstaged. No source/ex5 committed.
(End of slice)
