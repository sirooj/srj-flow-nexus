# BUILDER SLICE B-182 - K2/K3 raw spots + diffs, T1 tables, T3 sample, R1 diff summary

Base: builder/B-182 cut at f907b38. One indicator edit + one EA edit (single marker set each), one compile each, three runs. No terminal64 at launches (17520/18144 closed after RECON62/June; 13844 left OPEN on GBP0629-B182 blind-test rule). Python 3.13.16 canonical path.

## K2 raw spots (live indicator, located by text, read-only)
- B178ZL PROMO site (:1905-1906): `PrintFormat("[SRJ-IND] B178ZL PROMO side=%s formT=%s promoT=%s range=%s kill=%s", (b178bull ? "B" : "S"), b178ft, b178pt, b178rg, b178kl);` with `b178kl` from `b178ob.invalidationLevel` (:1900/:1904), range from low/high (:1884), formT/promoT bar-time stamped at first sight (:1893-1898).
- OrderblockMgr kill-line code: :37 `double mid = (obHigh + obLow) / 2.0;` + :38-39 `[B159E1] record old line: double invLevel = isBull ? MathMin(mid,obOpen) : MathMax(mid,obOpen);` held as ob.midpoint / ob.invalidationLevel (SRJ_Types.mqh NewOrderblock :266/:267).
- Sweep-tag writer (:1261-1273, buffer 18) + setter SRJ_Sessions.mqh :518-521 (`g_s.freshSweepTag = chosenSweep; g_s.freshSweepBar = i;` - stamp IS the sweeping candle's bar). Export block runs in the same i-iteration (Sessions pass :1106 before export :1150); B182SWEEP fires only when `g_s.freshSweepBar == i`.
- K2 verify: brace 129/129 both files (zero-delta inserts); marker "[B-182 B182P]" once (:1261); compile 0 errors 3 warnings (pre-existing code-43); edited src F0924613 + ex5 717099E9; .B182P kept.

## K2 indicator diff vs .preB182 raw (+7/-0)
```
@@ -1258,6 +1258,9 @@
+         //--- [B-182 B182P] print-only identity prints (relay B-182; reads held fields only, no gate reads them).
+         if(!g_s.freshSweepExpired && !SrjIsNa(g_s.freshSweepTag) && g_s.freshSweepBar == i)
+            PrintFormat("[SRJ-IND] B182SWEEP tag=%s bar=%s", g_s.freshSweepTag, TimeToString(time[i], TIME_DATE|TIME_MINUTES));
@@ -1902,6 +1905,10 @@
+                   //--- B182P continued: zone middle + kill beside the B178ZL PROMO print (held fields only).
+                   string b182mid = (SrjIsNa(b178ob.midpoint) ? "NOT_HELD" : DoubleToString(b178ob.midpoint, _Digits));
+                   PrintFormat("[SRJ-IND] B182MID side=%s formT=%s promoT=%s range=%s mid=%s kill=%s",
+                               (b178bull ? "B" : "S"), b178ft, b178pt, b178rg, b182mid, b178kl);
```

## K3 raw spots (live EA, located by text, read-only)
- GoAbort :7052 (LogAbort call :7054, A6REFUSED row :7058-7060, ResetSequence :7085 clears dir/anchor/regime/latch); LogSignal fire call :11340 (print :1857); RegimeName :1812-1818; D130 newest-first walk :9831-9843 with the EA encoding :9839 `(MathAbs(v) == 1) ? "regular" : "hidden"` (same expression :7009).
- K3 verify: marker once (helper :7056); brace +2/+2 balanced (helper outer + for); compile 0 errors 0 warnings; edited src 67021D84 + ex5 7601D51A; .B182P kept.

## K3 EA diff vs .preB182 raw (+29/-0)
```
@@ -1838,6 +1838,8 @@
+//--- B182P prototype (definition with the marker sits before GoAbort).
+void B182DecPrint(const string outcome);
@@ -1866,6 +1868,8 @@
+    // B182P decision census (print-only; the firing pass).
+    B182DecPrint("FIRE");
@@ -7049,6 +7053,28 @@
+//--- [B-182 B182P] print-only decision census (relay B-182; reads held state + the CQD verdict buffer, no gate touched).
+void B182DecPrint(const string outcome)
+  { ... newest-first CQD walk from shift 1, quoted :9831-9843 ... }
@@ -7059,6 +7085,11 @@
+    // B182P decision census (print-only; held state read before ResetSequence clears it).
+    if(g_dir != DIR_NONE)
+       B182DecPrint("ABORT " + reason + " A6REFUSED " + reason);
+    else
+       B182DecPrint("ABORT " + reason);
```

## T1 filed-trade tables vs B-179 T1 (deal/side/date/time/price)
- RECON62-B182 14/14 SAME: 2 sell 8/28 10:05 1.16466; 3 buy 8/28 11:35 1.16467; 4 buy 9/01 17:35 1.16024; 5 sell 9/01 17:50 1.15987; 6 buy 9/04 16:00 1.16019; 7 sell 9/04 23:55 1.16129; 8 buy 9/07 09:20 1.16138; 9 sell 9/07 10:53 1.16201; 10 buy 9/07 16:45 1.16264; 11 sell 9/07 17:13 1.16315; 12 sell 9/08 10:10 1.16205; 13 buy 9/08 10:42 1.16102; 14 sell 9/08 17:00 1.16220; 15 buy 9/08 17:26 1.16275. Marker 563338/3168; passed 0:06:10.
- JUNE0525-B182 8/8 SAME, 4 June absent: 2 buy 5/27 15:35 159.344; 3 sell 5/27 20:08 159.535; 4 buy 6/03 09:10 159.932; 5 sell 6/03 09:59 159.983; 6 buy 6/05 16:15 160.065; 7 sell 6/05 19:16 160.298; 8 buy 6/11 14:40 160.530; 9 sell 6/11 15:23 160.588. Marker 740873/4320; passed 0:04:54.
- GBP0629-B182 2/2 SAME, 2 July absent, no new deal: 2 sell 7/07 14:45 1.33863; 3 buy 7/07 16:54 1.33747. Marker 1386092/4320; passed 0:06:46.

## T3 sample (PRINTPROOF_B182.csv, 2053 rows; all MATCH + 4 noted)
- MID==PROMO 1675/1675: e.g. 7/07 zone formT 11:45 promoT 12:25 range 1.33862-1.33936 mid=kill=1.33899 on both rows.
- DEC==outcome 261/261: e.g. 7/07 14:45 FIRE reg=TREND div=regular (SIGNAL row agrees); 7/02 18:15 ABORT HISZONE_NONE (B177HZ+ABORT+A6 rows agree).
- DEC-REG 53 MATCH + 4 notes (same bar+dir evaluated twice across passes; candidate holds seed-time verdict; no report cell changes).
- DEC-DIV 43/43 (divbar==D130 verdictBar); SWEEP 17/17 (nonzero-tag RC == latest B182SWEEP).
- MISS rows: 9/01 09:55 LONG LTF_MISALIGN reg=TREND div=1 regular @09:20; 7/08 15:35 SHORT HISZONE_NONE reg=TREND div=-1 regular @15:15.
- His 16:20 zone: B182MID formT 16:20 promoT 16:40 range 1.33562-1.33684 mid=kill=1.33623; KILL t=17:40 o=1.33634 h=1.33643 l=1.33564 c=1.33605.

## R1 diff summary (render_b182.py; 19/12/7 rows)
- Zero non-named cells on all three files; row counts equal; candidate identity intact. Named changes only: run/ea/source refs, 5 Part-W columns, htf fills, div fills on no-A6FIRED rows, MISS-row class (both TREND), 7/08 reject re-point (HISZONE_NONE W2:7415).
- Translation UNMAPPED 17/11/6 (all pre-existing B-162-era cells carried through, verified in diff).
- PromoT-convention finding: EA pick promoT vs indicator slot promoT differ on 5 EU rows (9/01 09:10: 07:30 vs 08:20; 9/08 rows: 9/03 21:35 vs 20:55); cells NOT PRINTED per the range+promoT rule with nearest slot named; never inferred.
(End of slice)
