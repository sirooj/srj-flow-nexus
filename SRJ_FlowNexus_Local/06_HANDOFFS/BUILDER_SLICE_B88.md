# BUILDER SLICE B-88 - R1 raw code, R1c/R2 tables, R3 cells, R4 65-pass table, greps (pick-X reconcile, MEASURED)

Conventions: kept EA 137076D9; .B82C 55D91C7E (hunk C + B60C); .B87PICKXOB 5066BAB9. j43 8EDD1254 (kept EU) / j44 113541CF (kept June); j45 BF03B8A2 (diag EU) / j46 9B2F44B6 (diag June); jB87 8EA948C5/F19B32C5 (diag EU). Pick = latest ZONEPICK/INPLAYCOMMIT print at-or-before the candle (B-86/B-83-MACH method); zero tolerance (1pt counts). PX-touch = range overlaps pick zone + promoT ≤ candle. PX-retrace = closes AGAINST + pick in-play (ZONEPICK verdict) + promoT ≤ candle. BOTH: either MET.

## R1a ZoneInPlay WHOLE (kept EA :7118-7169)

```
 bool ZoneInPlay(int barShift, double zHi, double zLo,
                 double stopRef, bool haveStop)
   {
    if(!(zHi > 0.0 && zLo > 0.0)) return false;
    double bHi = iHigh(_Symbol, PERIOD_CURRENT, barShift);
    double bLo = iLow (_Symbol, PERIOD_CURRENT, barShift);
    if(bHi >= zLo && bLo <= zHi) return true;
    int    buf = (g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH;
    double sw1 = 0.0;
    int    sh1 = -1;
    if(!FindNearestSwing(buf, barShift, sw1, sh1)) return false;
    if(sw1 >= zLo && sw1 <= zHi) return true;
    //--- [STEP 1 / charter ruling 3] In-play depth is the SL LEG: every confirmed
    //--- protective-side swing from the evaluation bar back to the stop reference
    //--- chosen by ComputeSlReference. ... Without a stop
    //--- reference this bar, the measured two-swing depth (SWING2) remains the
    //--- bound, per council Part 1.1. ... (safety limits and structure, never thresholds)
    const int zip_limit = barShift + Bars(_Symbol, PERIOD_CURRENT);
    if(!haveStop)
      {
       for(int s = sh1 + 1; s <= sh1 + 500; s++)
         { double v2; if(!ReadFlow(buf, v2, s)) break;
           if(v2 == EMPTY_VALUE || v2 <= 0.0) continue;
           if(MathAbs(v2 - sw1) <= _Point) continue;
           return (v2 >= zLo && v2 <= zHi); }
       return false; }
    double prev = sw1;
    for(int s = sh1 + 1; s <= zip_limit; s++)
      { double v2; if(!ReadFlow(buf, v2, s)) break;
        if(v2 == EMPTY_VALUE || v2 <= 0.0) continue;
        if(MathAbs(v2 - prev) <= _Point) continue;
        prev = v2;
        if(v2 >= zLo && v2 <= zHi) return true;
        if((g_dir == DIR_LONG) ? (v2 <= stopRef) : (v2 >= stopRef)) break; }
    return false; }
```

Vs spec §3.5 (bar-range or confirmed protective swing at any point in leg; no recency/bar-count) + §9.10 (eval bar + two swings): shape SAME, depth DIFFERENT (as §9.10 itself names). 4th/5th args = SL-leg bound. Record only.

## R1b PRINTS + COMPUTATIONS (kept EA, by text)

- ZONEPICK :8873 `PrintFormat("[SRJ-EA] ZONEPICK bar=%s dir=%s haveFvg=%d fvgInPlay=%d "` + :8874 `"haveXob=%d xobInPlay=%d downgraded=%d fvg=%s-%s xob=%s-%s",` over :8867-8869 `s55_xobInPlay = ZoneInPlay(barShift, ..., s1_stopRef, s1_haveStop);` (S3 site; zone :8800-8801 buffers 22/23; promo :8790 buffer 33).
- INPLAYCOMMIT :9286-9289 (`... zoneLo=%s zoneHi=%s promoT=%s ... committed=%d ...`) over the t133 stop-leg walk :9260-9282 (own implementation; S3 site).
- RQZPICK :6928 (`... xobInPlay=%d ...`) over :6925-6926 `ZoneInPlay(barShift, ..., stopRef, haveStop)` (S4 re-read site).
- Vs B-87 `ZoneInPlay(b87_cntShift, hi, lo, 0.0, false)` (.B87PICKXOB, +24 at :2486-2509): zone source SAME (22/23); shift DIFFERENT (anchorBarTime shift vs eval barShift); stop args DIFFERENT (0.0/false vs s1/stop-leg). Three in-play implementations on disk.

## R1c B60C CODE (.B82C :2541-2557) + cntBar TABLE

```
     double uj60_hR = h1, uj60_lR = l1;
     if(retestShift >= 0 && retestShift != barShift + 1)
       { uj60_hR = iHigh(...retestShift); uj60_lR = iLow(...retestShift); }
     bool uj60_tR = (uj60_hR > 0.0 && uj60_hR >= L && uj60_lR <= L);
     bool uj60_tP = (h1 >= L && l1 <= L);
     touch = (uj60_tR || uj60_tP);
     string uj60_cSrc = (uj60_tR && uj60_tP) ? "BOTH" : (uj60_tR ? "RETEST" : "PRIOR");
     ...(B60C print: bar/dir/poi/rt=rBar time/rSh/cSrc)...
```
retestShift sites .B82C :9392/:9413/:9602 (`iBarShift(..., g_b61RetestTime, true)`).

| take | conf bar | B87 cntBar (jB87 rows) | B83 counted (j45/j46) | verdict |
|---|---|---|---|---|
| A1 | 08-28 10:00 | 09:55 (2 rows, REFUSE) | 09:55 | SAME |
| A2 | 09-01 17:30 | 17:30 (2 rows, PASS) | 16:45 + 17:25 | DIFFERENT |
| A3 | 09-04 15:55 | 15:45 (2 rows, PASS) | 15:40 + 15:50 | DIFFERENT |
| A4 | 09-07 09:15 | 09:00 (2 rows, PASS) | 09:00 + 09:10 | SAME-first |
| A5 | 09-07 16:40 | 16:15 (2 rows, PASS) | 16:05 + 16:35 | DIFFERENT |
| A6 | 09-08 10:05 | 10:05 (8 rows, REFUSE) | 10:00 | DIFFERENT |
| A7 | 09-08 16:55 | 16:30 (2 rows, REFUSE) | 16:45 + 16:50 | DIFFERENT |

## R2 LOST TAKES (jB87 5066BAB9 beside j43 137076D9; MACH cells SLICE_B83 R3)

- A1 8/28 SHORT: jB87 REFUSE bar=10:00 cntBar=09:55 xob=1.16492-1.16507 inPlay=0. B83 09:55: 2149 same zone P-MACH MET (T NOT MET: h 1.16491 vs lo 1.16492). Cause: TEST (same candle).
- A2 9/1 LONG: jB87 REFUSE 15:55-16:05 (xob 1.15855-1.15862 inPlay=0); conf 17:30 PASS (xob 1.15975-1.16013 inPlay=1) but NO FIRE (S2 SHORT holder jB87 17:30). B83 MACH MET (touch via 2549 at 17:25). Cause: CASCADE + CANDLE.
- A6 9/8L SHORT: jB87 REFUSE bar=10:05 cntBar=10:05 xob=1.16362-1.16377 inPlay=0. B83 10:00: 2898 same zone P-MACH MET. Cause: CANDLE + TEST.
- A7 9/8NY SHORT: jB87 REFUSE bar=16:55 cntBar=16:30 xob=1.16362-1.16377 inPlay=0. B83 16:45/16:50: 2898 same zone P-MACH MET. Cause: CANDLE + TEST.

## R3 CELLS (pick latest≤candle; promo; touch/retrace/px; MACH X beside)

- A1 09:55: Z@09:55 1.16492-1.16507 inplay=0 com=0 promo 06:40 | t NOT MET r NOT MET px NOT MET | MACH MET | DIFFERENT
- A2 16:45: Z@16:05 1.16081-1.16100 inplay=0 com=1 promo 09:15 | t NOT MET r NOT MET px NOT MET | (17:25: same pick rows) | MACH MET | DIFFERENT (caveat: next 17:30 print carries 2549 1.15975-1.16013 promoT 17:25, touched by 17:25 - same-candle-promotion edge, reported not ruled)
- A3 15:40: Z@15:40 1.15907-1.15933 inplay=1 com=1 promo 09-03 | t MET r NOT MET | 15:50: Z@15:45 same zone inplay=1 | t NOT MET r MET | px MET | MACH MET | SAME
- A4 09:00: Z@09:00 1.16098-1.16109 inplay=1 com=1 promo 08:55 | t MET r MET | 09:10: Z@09:00 same | t MET r MET | px MET | MACH MET | SAME
- A5 16:05: Z@15:05 1.16362-1.16377 inplay=0 (next 16:15 differs - noted) | px NOT MET | 16:35: Z@16:15 1.16229-1.16253 inplay=1 com=1 promo 15:30 | t MET r MET | px MET | MACH MET | SAME
- A6 10:00: Z@10:00 1.16362-1.16377 inplay=0 com=1 promo 09-03 | t NOT MET r NOT MET px NOT MET | MACH MET | DIFFERENT
- A7 16:50: Z@16:50 1.16362-1.16377 inplay=0 com=1 promo 09-03 | t NOT MET r NOT MET px NOT MET | MACH MET | DIFFERENT
- B3 14:05: Z@11:05 160.489-160.504 inplay=1 com=1 promo 08:30 (next 14:35 same) | t NOT MET r NOT MET | 14:30: same pick | t NOT MET r MET | px MET | MACH MET | SAME
- C3 09:00: Z@09:00 159.906-159.913 inplay=1 com=1 promo 09:00 | t MET r MET px MET | MACH MET | SAME
- B2 16:00: Z@15:55 159.881-159.916 inplay=1 com=0 promo 15:40 (next 16:05 same) | t MET r MET px MET | MACH MET | SAME
- F1 14:20: Z@11:55 159.679-159.694 inplay=0 com=0 promo 11:30 (unchanged thru 14:55+) | t NOT MET r NOT MET px NOT MET | MACH NOT MET | SAME
- F2 16:25: Z@11:55 1.16612-1.16640 inplay=0 com=0 promo 08-26 (next 17:00 same) | t NOT MET r NOT MET px NOT MET | MACH MET | DIFFERENT
- F3 09:10: Z@06-03 18:50 159.861-159.913 inplay=0 com=1 promo 06-03 16:00 (stale 14h; next 09:45 differs - flagged) | t MET | 09:45: Z@09:45 160.001-160.012 inplay=0 | px MET | MACH MET | SAME*
- F4 15:30: latest 10:25 haveXob=0 (empty; next 15:50 differs) | UNKNOWN | MACH MET | DIFFERENT

## R4 65-PASS TABLE (pass: MACH X vs PX; cell candles with Z@ bar)

EU 08-26 09:10 SHORT: NOT MET vs NOT MET SAME (NO-DECIDER) | 15:10 LONG: MET vs MET SAME (POLL 0.26 FAIL) | 16:20 SHORT: NO ROW vs MET DIFFERENT (POLL 0.78 FAIL) | 16:50 SHORT: NO ROW vs MET DIFFERENT (POLL 0.45 FAIL) | 17:40 SHORT: NO ROW vs MET DIFFERENT (POLL 0.92 FAIL) | 17:55 SHORT: NO ROW vs MET DIFFERENT (POLL 0.63 FAIL) | 08-27 11:45 SHORT: MET vs MET SAME | 11:55 SHORT: MET vs MET SAME | 17:00 SHORT: MET vs NOT MET DIFFERENT (F2 row) | 17:10 SHORT: MET vs NOT MET DIFFERENT | 17:20 SHORT: MET vs NOT MET DIFFERENT | 08-28 10:00 SHORT: MET vs NOT MET DIFFERENT FIRE r2.43 (A1) | 16:20 SHORT: MET vs MET SAME | 16:55 SHORT: NOT MET vs NOT MET SAME | 18:45 SHORT: NOT MET vs NOT MET SAME | 08-31 10:30 LONG: NOT MET vs NOT MET SAME | 16:35 LONG: MET vs MET SAME | 09-01 09:10 SHORT: MET vs MET SAME | 09:45 SHORT: MET vs MET SAME | 15:25 SHORT: NOT MET vs NOT MET SAME | 16:00 SHORT: NOT MET vs NOT MET SAME REFUSAL LTF_MISALIGN | 16:10 SHORT: MET vs NOT MET DIFFERENT | 17:30 LONG: MET vs NOT MET DIFFERENT FIRE r1.17 (A2) | 09-02 14:40 SHORT: MET vs MET SAME | 16:30 SHORT: MET vs NOT MET DIFFERENT | 17:45 LONG: NOT MET vs NOT MET SAME | 09-03 10:55 SHORT: MET vs MET SAME | 14:05 LONG: NOT MET vs MET DIFFERENT | 18:25 LONG: NOT MET vs NOT MET SAME REFUSAL LTF_MISALIGN | 09-04 09:25 LONG: MET vs MET SAME | 09-40 LONG: MET vs MET SAME REFUSAL FRESH_OB_DEAD | 11:05 SHORT: NOT MET vs MET DIFFERENT | 11:20 SHORT: NOT MET vs MET DIFFERENT | 11:30 SHORT: NOT MET vs MET DIFFERENT | 15:35 LONG: MET vs MET SAME | 15:55 LONG: MET vs MET SAME FIRE r1.66 (A3) | 09-07 09:15 LONG: MET vs MET SAME FIRE r1.76 (A4) | 16:40 LONG: MET vs MET SAME FIRE r2.34 (A5) | 09-08 09:35 LONG: MET vs MET SAME | 10:05 SHORT: MET vs NOT MET DIFFERENT FIRE r1.94 (A6) | 16:20 LONG: MET vs MET SAME | 16:40 SHORT: MET vs NOT MET DIFFERENT | 16:55 SHORT: MET vs NOT MET DIFFERENT FIRE r1.96 (A7)
UJ 05-27 15:30 LONG: MET vs NOT MET DIFFERENT FIRE r9.67 | 05-29 10:45 LONG: NOT MET vs NOT MET SAME | 14:05 LONG: MET vs MET SAME | 15:05 SHORT: MET vs MET SAME | 06-01 10:40 LONG: MET vs NOT MET DIFFERENT | 11:05 SHORT: NOT MET vs MET DIFFERENT | 15:00 LONG: MET vs MET SAME | 06-02 15:30 LONG: NOT MET vs NOT MET SAME FIRE r25.73 (F1) | 06-03 09:05 LONG: MET vs MET SAME FIRE r1.35 (C3) | 14:55 LONG: MET vs NOT MET DIFFERENT | 16:05 LONG: MET vs NOT MET DIFFERENT | 06-04 09:50 SHORT: MET vs MET SAME FIRE r2.31 (F3) | 17:05 LONG: MET vs MET SAME | 06-05 09:15 SHORT: NOT MET vs MET DIFFERENT | 16:10 LONG: MET vs MET SAME FIRE r1.44 (B2) | 06-09 15:20 SHORT: MET vs NOT MET DIFFERENT REFUSAL LTF_MISALIGN | 17:55 LONG: MET vs NOT MET DIFFERENT | 06-10 09:55 LONG: MET vs MET SAME | 10:25 LONG: MET vs UNKNOWN DIFFERENT REFUSAL LTF_MISALIGN | 16:05 LONG: MET vs UNKNOWN DIFFERENT (F4 row) | 06-11 11:20 LONG: MET vs MET SAME | 14:35 LONG: MET vs MET SAME FIRE r2.74 (B3)

Counts: 65 passes, 28 PX!=MACH. Fires 13: PX MET 7 / NOT MET 6 (A1, A2, A6, A7, 5/27, F1). Refusals 5: MET 1 / NOT MET 3 / UNKNOWN 1.

## R6 INPUTS (EA line by text + counted candle on .B82C)

- Pick zone @shift (22/23): EA :6911/:8800 `ReadFlow(FL_BUF_XOB_ZONE_HIGH, ...)` FOUND; candle .B82C :9392/:9413/:9602 FOUND.
- Pick promo @shift (33): EA :8790 `ReadFlow(FL_BUF_XOB_PROMO_TIME, ...)` FOUND; same candle FOUND.
- OHLC @shift: EA :2289+ `iOpen/iHigh/...` FOUND; same candle FOUND.
- Verdict @shift: fn :7118 shift-callable FOUND (B-87 proved runtime); same candle FOUND.
- Verdict: BUILDABLE-PX. Caveats: prints only at evaluated bars (145/107 vs 3168/4320); carry print-invisible (A2-17:25 measured); B-87 ran the verdict and refused 4 valid takes.
- Buffers written (indicator): bind :708; publish :1206-1230 (EMPTY default; nearest valid+activated+promoted in-bias OB; selector :1098-1100 skips !isValid/!isActivated). Post-invalidation publish NOT FOUND (2149 held 06:40-15:30+ through touches).

## GREPS (before/after)

- B1 skill phrase = 1 (ALREADY pattern); operator message = B-87 reply only → no new words.
- X1 `B-88-GATE-MATCHES-READING` 0→1; `relay B-88` §5 0→1. X2 `B-88` §3 0→1. X3 `B88-PICKX-RECONCILE` 0→1; `^1233.` 0→1. X4 pointer 30→16 lines; `1231 (B86` 1→0; `NO .B84X cut` 1→0.
- Gate: `git diff c5fa75c --stat -- <paths>` EMPTY on all 0.3 files + ledger + register + skills (+ spec + SLICE_B84 re-check). Journal 1066. terminal.ini 5F0336A0 + 3 charts ACCOUNTED re-save noise (diffed vs .preB87; no launch; writes forbidden).

(End of slice)
