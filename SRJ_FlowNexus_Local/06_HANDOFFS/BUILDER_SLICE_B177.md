# BUILDER SLICE B-177 - raw rows (gate hunk, run tables, proof, restore)

Base: builder/B-176 head fb5bbd5 on builder/B-177. Backups .preB177 (ind 7842A02E/ex5 10880847, EA 794DD4B8/ex5 3A55C566, terminal.ini CF80083C, Profiles 23).
K2 verify: .B176HZ re-applied byte-for-byte (A22067AD); [B-177 B177HZX] count 1; brace 0/0; compile 0 errors binary fresh (2 benign code-43). Trial ind src 2AF9C6D3 / ex5 40675BB3.
K3 verify: [B-177 B177HZ] count 1; brace 0/0; compile 0 errors 0 warnings binary fresh. Trial EA src EB18717E / ex5 60F6771E. .B177HZ copies kept uncommitted.
K3 spots: B60C computation ShadowConfirmPoll EA:2564 (IsConfirmationCandle EA:2609; B60C print EA:2693 rt via retestShift <- g_b61RetestTime EA:1121/8631 + iBarShift idiom EA:9576/9597/9786); PREBIND EA:9630-9646 (CONFIRM_PREBIND EA:9640; fall-through EA:9644); S3 arm EA:9544; S4 edge EA:9795; B153K EA:9941-9971 (refusal EA:9969 returns before NEXTOPEN EA:9973/TP/A6Fired/order); iCustom EA:11853-11858; bufs EA:211; ABORT define EA:429. Both roads pass S5-div before any order.
K0 quotes: spec 3.5 zone-required; spec 3.6 FVG touch row; spec 3.5.1 relevance-first; L41; W3 L260 (governs leg tie); W2 L259 + B4. No conflict.

## Indicator diff vs .preB177 raw
```
git : warning: in the working copy of 'Indicators/SRJ_FlowLogic.mq5.preB177', LF will be replaced by CRLF the next 
time Git touches it
At line:1 char:1
+ git diff --no-index -- Indicators/SRJ_FlowLogic.mq5.preB177 Indicator ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (warning: in the... Git touches it:String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 
warning: in the working copy of 'Indicators/SRJ_FlowLogic.mq5.B177HZ', LF will be replaced by CRLF the next time Git 
touches it
diff --git a/Indicators/SRJ_FlowLogic.mq5.preB177 b/Indicators/SRJ_FlowLogic.mq5.B177HZ
index a121e70..439b144 100644
--- a/Indicators/SRJ_FlowLogic.mq5.preB177
+++ b/Indicators/SRJ_FlowLogic.mq5.B177HZ
@@ -5,7 +5,7 @@
 #property copyright "SRJ Flow Logic Auto ΓÇö Pine v6 port"
 #property version   "1.00"
 #property indicator_chart_window
-#property indicator_buffers 51  // [B156SL] Was 50. Added 50 (5m 2xOB flag). [B150PR] Was 48. Added 48 (bull PROMO-RETURN), 49 (bear PROMO-RETURN). [P-SWINGIMB-2 E5] Was 39. Added 39 (OB swing-bar time). [P-SWINGIMB] Was 37. Added 37 (swing-high imbalance code), 38 (swing-low imbalance code). [Task 113] Was 33. Added 33 (selected XOB promotionTime). [Task 102] Was 31. Added 31 (selected XOB objId), 32 (selected FVG objId). [Task 155] Was 34. Added 34 (tickOBIsValid provenance), 35 (tickFVGIsValid provenance, population deferred), 36 (hasPersistedOpposingFVG provenance, population deferred). [TP-DATA-SOURCE-COMPLETE-001] Was 40. Added 40-47 (prev-day session H/L shadow).
+#property indicator_buffers 55  // [B177HZX] Was 51. Added 51 (bull gap-touched), 52 (bear gap-touched), 53 (bull XOBWIN), 54 (bear XOBWIN). [B156SL] Was 50. Added 50 (5m 2xOB flag). [B150PR] Was 48. Added 48 (bull PROMO-RETURN), 49 (bear PROMO-RETURN). [P-SWINGIMB-2 E5] Was 39. Added 39 (OB swing-bar time). [P-SWINGIMB] Was 37. Added 37 (swing-high imbalance code), 38 (swing-low imbalance code). [Task 113] Was 33. Added 33 (selected XOB promotionTime). [Task 102] Was 31. Added 31 (selected XOB objId), 32 (selected FVG objId). [Task 155] Was 34. Added 34 (tickOBIsValid provenance), 35 (tickFVGIsValid provenance, population deferred), 36 (hasPersistedOpposingFVG provenance, population deferred). [TP-DATA-SOURCE-COMPLETE-001] Was 40. Added 40-47 (prev-day session H/L shadow).
 #property indicator_plots   2
 
 #property indicator_label1  "Fractal High"
@@ -175,6 +175,37 @@ double g_bufB150Bull[];
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
 // [P-SWINGIMB] Returns 0/1/2/3 only. apexBar is the confirmed fractal bar
 // (target=i-1 at the call site); bullish selects the HIGH (up-push) side.
 int SrjSwingImbCode(const int apexBar, const bool bullish)
@@ -755,7 +786,13 @@ int OnInit()
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
@@ -826,8 +863,14 @@ int OnInit()
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
@@ -1482,6 +1525,18 @@ int OnCalculate(const int rates_total,
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
+         g_b177WinPromoB = 0; g_b177WinPromoS = 0;   // B177HZX window state: start empty
+         g_b177WinHitB = false; g_b177WinHitS = false;
         }
       if(barClosed)
         {
@@ -1590,6 +1645,199 @@ int OnCalculate(const int rates_total,
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
+             //--- B177HZX export values: window restarts at each new trade-side promotion.
+             datetime b177curB = 0, b177curS = 0;
+             if(b176pbB != SRJ_NA_INT)
+               { datetime b177d = SRJ_BarTime(b176pbB); if(b177d > 0) b177curB = b177d; }
+             if(b176pbS != SRJ_NA_INT)
+               { datetime b177d = SRJ_BarTime(b176pbS); if(b177d > 0) b177curS = b177d; }
+             if(b177curB != g_b177WinPromoB) { g_b177WinPromoB = b177curB; g_b177WinHitB = false; }
+             if(b177curS != g_b177WinPromoS) { g_b177WinPromoS = b177curS; g_b177WinHitS = false; }
+             if(b177reachB) g_b177WinHitB = true;
+             if(b177reachS) g_b177WinHitS = true;
+             if(target >= 0)
+               {
+                g_bufHzGapBull[target] = (b177gtB ? 1.0 : 0.0);
+                g_bufHzGapBear[target] = (b177gtS ? 1.0 : 0.0);
+                g_bufHzWinBull[target] = ((g_b177WinPromoB > 0 && g_b177WinHitB) ? 1.0 : 0.0);
+                g_bufHzWinBear[target] = ((g_b177WinPromoS > 0 && g_b177WinHitS) ? 1.0 : 0.0);
+               }
+            }
         }
 
       if(SRJ_InDebugWindow(i))
```

## EA diff vs .preB177 raw
```
git : warning: in the working copy of 'Experts/SRJ_FlowNexus_EA.mq5.preB177', LF will be replaced by CRLF the next 
time Git touches it
At line:1 char:185
+ ... ind-rc=$?"; git diff --no-index -- Experts/SRJ_FlowNexus_EA.mq5.preB1 ...
+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : NotSpecified: (warning: in the... Git touches it:String) [], RemoteException
    + FullyQualifiedErrorId : NativeCommandError
 
warning: in the working copy of 'Experts/SRJ_FlowNexus_EA.mq5.B177HZ', LF will be replaced by CRLF the next time Git 
touches it
diff --git a/Experts/SRJ_FlowNexus_EA.mq5.preB177 b/Experts/SRJ_FlowNexus_EA.mq5.B177HZ
index 3ca9b8b..169c027 100644
--- a/Experts/SRJ_FlowNexus_EA.mq5.preB177
+++ b/Experts/SRJ_FlowNexus_EA.mq5.B177HZ
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

## T1 tables (trial vs B-176D baseline = DEALS_*-B137 proven identical to kept; -B170 DEALS NOT FOUND)
- RECON62-B177 14/14 SAME: #2 sell 8/28 10:05 1.16466 2.38; #3 buy 11:35 1.16467; #4 buy 9/01 17:35 1.16024 2.04; #5 sell 17:50 1.15987; #6 buy 9/04 16:00 1.16019 0.57; #7 sell 23:55 1.16129; #8 buy 9/07 09:20 1.16138 2.49; #9 sell 10:53:07 1.16201; #10 buy 16:45 1.16264 4.05; #11 sell 17:13:30 1.16315; #12 sell 9/08 10:10 1.16205 1.95; #13 buy 10:42:46 1.16102; #14 sell 17:00 1.16220; #15 buy 17:26:29 1.16275. Marker 563338/3168. DONE PASSED. CORRECTION vs B-176 slice T1 text (which wrote A4 exit 11:15/1.16315 from R51): kept exit is 10:53:07/1.16201 per B137 + both runs; programmatic 14/14-SAME stands; no verdict rested on that cell.
- JUNE0525-B177 8/8 SAME: #2 buy 5/27 15:35 159.344 1.08; #3 sell 20:08 159.535; #4 buy 6/03 09:10 159.932 3.75; #5 sell 09:59 159.983; #6 buy 6/05 16:15 160.065 0.35; #7 sell 19:16 160.298; #8 buy 6/11 14:40 160.530 5.69; #9 sell 15:23 160.588 (4 June absent). Marker 740873/4320. DONE PASSED.
- GBP0629-B177 4 deals: #2 buy 7/02 18:15 1.33716 0.65; #3 sell 19:07:53 1.33564; #4 sell 7/07 14:45 1.33863 1.28; #5 buy 16:54:59 1.33747. 2 JULY STILL FIRES: STOP S2. Marker 1386092/4320; window 6/29-7/17; DONE never written (genuine marker direct).
- STOPs: S1 pass all runs; S2 HIT on GBP (2 July fires); S3 no new deals anywhere; S4 no halt (14/8/4 deals); S5 windows verified at each launch.

## T3/T4/R3 compacts
- T3 SEPARATOR_B177.csv 22 rows: 21 SAME (PASS rows backed by same-run print lines; OTHER-GATEs stay); T0702 DIFFERENT (B177HZ 18:10 PASS gt=0.0 xw=1.0 log 10468078; backing REACH 17:20-17:35 trial logs incl 10467657-10467845; B-175 offline covered only the 8 confirm-set zones).
- T4 refusals: 7/01 11:05 LONG (log 10456430, ABORT 10456431, Quarterly-POC) + 7/08 15:30 SHORT (log 10504536, ABORT 10504537, Quarterly-POC); neither a register row. EU 0, June 0.
- R3 roads on trial runs: A1 JUMP (S3->S5 + PREBIND 10:00, log 5996426/5996427); B2 JUMP (S3->S5 + PREBIND 16:10, log 6929200/6929201); T0702 ARM (S3->S4 18:15, log 10468069); T0707 ARM; A2/A6/B3 ARM (S3->S4 rows); rest SIGNALs at kept times. No change.
- Reconciliation notes: A3 print-LATEST 13:50 vs W-L2 09:05 and T0707 13:05 vs 12:25 (untouched promos in store; verdicts SAME); print REACH 12:30 reproduces B152PR cbT 12:30 (packs cut out-of-window rows); FVG touch = range entry (print) vs remainder overlap (B-175 offline): A6 09:40 + T0707 14:40 cases (verdicts unaffected, XOB carries); nLive counts live+promoted (B152PR nz adds post-promo touch).

## Environment notes (unowned)
- Python interpreter vanished mid-session (last success ~21:05, gone by ~21:15; Programs/Python dir absent, no launcher/PATH/venv/Store copy). All log scans redone as lazy forward-only PowerShell streams (bounded PRE-to-marker, ~20s each, counts filed). No full-file Get-Content.
- terminal.ini text round-trip defect owned same turn (.NET ReadAllText/WriteAllText dropped 2 lines/51 bytes); restored from .preB177, dates set by same-length byte-splice (20447 B preserved), read back.
- Post-run external revert: sources+binaries back to kept with backdated mtimes after the GBP run (trial rows prove trial binaries ran 21:06-21:37). Verified byte-identical kept by SHA (EA 794DD4B8/3A55C566, ind 7842A02E/10880847, ini CF80083C, Profiles 23). .B177HZ/.preB177 intact; trial re-appliable; nothing lost.

## T3 restore proof
- EA src 794DD4B8 + ex5 3A55C566; ind src 7842A02E + ex5 10880847; ini CF80083C; Profiles 23 files; no terminal64. Kept pair live.

- Full diffs raw (K3, B-153 precedent: filed as work files, summaries above): 00_CURRENT_WORKING/work_b177_diff_ind.txt (312 lines, indicator) + work_b177_diff_ea.txt (82 lines, EA); trial re-appliable from .B177HZ copies (ind A22067AD, EA EB18717E).
(End of slice)
