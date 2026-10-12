# BUILDER SLICE B-192 - raw rows, spots, tables, K diff (under 600 lines)

Base: builder/B-192 cut at 32f311e (backup exact). W banked (Run economy 0->1). R0 one pass over Tester/logs/20261012.log (9027847962 bytes): 31 STARTs. R1c BROKER-TP -> [B192TF] ON. R2 only F2 moves. R3 BB-2 CLOSED. K: verified .B192K (3B5EE8D1) + 0/0 compile (EX5-K 75B12D19). T: 3 PASSED runs, one cut, tables 14/8/2. VERDICT KEPT.

## R0 table (every tester START; seg=start line, logt, run~attribution, ex5 bytes, window, inputs dbg/mode/n, n191/n190/nmid, tpe/mtx/trade)
```
0 43 04:48:14 B-190-trial#1 478384 2026.08.26-2026.09.10 t/1/28 0/0/0 0/0/20
1 1049692 04:54:05 #2 478384 2026.05.25-2026.06.13 t/1/28 0/0/0 0/0/16
2 2020098 05:00:55 #3 478384 2026.06.29-2026.07.18 t/1/28 0/0/0 1/1/8
3 2957929 05:55:50 #4 478300 2026.08.26-2026.09.10 t/1/28 0/0/0 0/0/20
4 4007376 06:01:53 #5 478300 2026.05.25-2026.06.13 t/1/28 0/0/0 0/0/16
5 4977331 06:08:25 #6 478300 2026.06.29-2026.07.18 t/1/28 0/0/0 1/1/3
6 5915328 06:53:28 #7 478300 2026.06.29-2026.07.18 t/1/28 0/0/0 1/1/3
7 6853326 11:03:46 #8 480396 2026.08.26-2026.09.10 t/1/28 0/0/477 0/0/20
8 7903518 11:19:47 #9 480396 2026.05.25-2026.06.13 t/1/28 0/0/593 0/0/16
9 8874379 11:55:52 #10 480396 2026.06.29-2026.07.18 t/1/28 0/0/605 1/1/3
10 9813324 14:30:09 #11 484998 2026.06.29-2026.07.18 t/1/28 0/0/605 1/1/3
11 10752640 14:42:50 #12 484998 2026.08.26-2026.09.10 t/1/28 0/0/477 0/0/20
12 11803663 14:53:42 #13 484998 2026.05.25-2026.06.13 t/1/28 0/0/593 0/0/16
13 12779156 15:58:39 #14 480396 2026.06.09-2026.06.29 t/1/28 0/0/561 0/0/0
14 13667766 16:07:32 #15 480396 2026.06.29-2026.07.18 t/1/28 0/0/605 1/1/3
15 14611230 16:52:15 #16 482302 2026.06.29-2026.07.18 t/1/28 0/0/605 1/1/3
16 15555006 17:04:11 #17 482302 2026.08.26-2026.09.10 t/1/28 0/0/477 0/0/20
17 16605437 17:12:02 #18 482302 2026.05.25-2026.06.13 t/1/28 0/0/593 0/0/16
18 17576642 18:04:58 #19 480396 2026.08.26-2026.09.10 t/1/28 0/0/477 0/0/25
19 18627195 18:40:26 RECON62-B190P 484544 2026.08.26-2026.09.10 t/1/28 0/1510/477 0/0/20
20 19678898 18:51:40 JUNE0525-B190P 484544 2026.05.25-2026.06.13 t/1/28 0/962/593 0/0/16
21 20650719 19:02:16 GBP0629-B190P 484544 2026.06.29-2026.07.18 t/1/28 0/992/605 1/1/3
22 21595173 19:20:18 B-190-trial#20 481274 2026.08.26-2026.09.10 t/1/28 0/0/477 0/0/20
23 22645357 19:30:22 #21 481274 2026.05.25-2026.06.13 t/1/28 0/0/593 0/0/16
24 23616208 19:44:19 #22 481274 2026.06.29-2026.07.18 t/1/28 0/0/605 1/1/3
25 24559688 20:16:07 RECON62-B191P 482006 2026.08.26-2026.09.10 t/1/28 155/0/477 0/0/20
26 25610027 20:31:41 JUNE0525-B191P 482006 2026.05.25-2026.06.13 t/1/28 111/0/593 0/0/16
27 26580989 20:48:55 GBP0629-B191P 482006 2026.06.29-2026.07.18 t/1/28 28/0/605 1/1/3
28 27524497 21:10:19 RECON62-B190 480944 2026.08.26-2026.09.10 t/1/28 0/0/477 0/0/20
29 28574687 21:27:46 JUNE0525-B190 480944 2026.05.25-2026.06.13 t/1/28 0/0/593 0/0/16
30 29545546 21:47:38 GBP0629-B190 480944 2026.06.29-2026.07.18 t/1/28 0/0/605 1/1/3
```
7 July TP_ELECT/MTEXIT: SEG24 tp=1.33630 R=3.03 (24459730) / MTEXIT 17:05 TP_TOUCH exit=1.33630 (24460934); SEG27 tp=1.33630 R=3.03 (27424511) / 17:05 exit=1.33630 (27425743); SEG30 tp=1.33747 R=1.51 (30389068) / 16:55 exit=1.33747 (30390184); all other GBP segs tp=1.33747/16:55. EA file every START: SRJ_FlowNexus_EA.ex5. Indicator 269867 bytes all B-191 segs (SEG19 271101 disclosed).

## R1a raw spots (kept EA SRJ_FlowNexus_EA.mq5)
- :13 `CTrade g_trade;` :19 `enum ENUM_SRJ_MODE { MODE_ALERT_ONLY = 0, MODE_EXECUTE = 1 };`
- :11561 `tradeResult = g_trade.Buy(lots, _Symbol, entryPrice, slRef, tpTarget, comment);`
- :11563 `tradeResult = g_trade.Sell(lots, _Symbol, entryPrice, slRef, tpTarget, comment);`
- :12573 `bool ok = g_trade.PositionClose(ticket);` (in MtCloseBrokerPosition :12550; SKIP-NO-SEND unless MODE_EXECUTE+tester :12552; called only :12881 for BREAK/DAY_CLOSE)
- :12699 `bool uj_rbOk = g_trade.PositionModify(uj_rbT, uj_rbSl, uj_rbNew);` (in [B-37 BROKER-RETARGET], gated :12674-12675 UjClosedSessionTarget tighter-only; UJRETARGET writer :12707 prints only)
- :12863 `g_mtrade.exitPrice = g_mtrade.tpRef` / :12868 MTEXIT PrintFormat (writes only); :12876 comment SL/TP broker-owned, only BREAK/DAY_CLOSE close.
- NOT FOUND: TRADE_ACTION_SLTP, TRADE_ACTION_DEAL, ".Buy(", ".Sell(" (all sends via g_trade).

## R1b trade events (R0 pass; close mechanism + order tp/sl)
```
SEG27 P-GBP: deal #2 sell 14:45 1.33863; take profit triggered #2 ... sl: 1.33940 tp: 1.33630 [#3 buy 1.33630] 17:04:13; deal #3 buy 17:04:13 1.33629 (TP-ORDER, no modify)
SEG30 T-GBP: deal #2 sell 14:45 1.33863; take profit triggered #2 ... tp: 1.33747 [#3 buy 1.33747] 16:54:59; deal #3 buy 16:54:59 1.33747 (TP-ORDER, no modify)
SEG24 B190trial-GBP: same as SEG27 at tp 1.33630 (TP-ORDER, no modify)
SEG25 P-RECON: A1 #2/#3 11:35 1.16467 MARKET (no trigger, BREAK); A2 #4/#5 17:50 1.15987 MARKET (no trigger); A3 #6 +modify tp->1.16270 19:05 +#7 23:55 1.16129 MARKET (DAY_CLOSE); A4 trigger tp:1.16200 fill 1.16201 (TP-ORDER); A5 trigger tp:1.16315 fill 1.16315 (TP-ORDER); A6 trigger tp:1.16102 fill 1.16102 (TP-ORDER); A7 stop loss triggered sl:1.16274 fill 1.16275 (SL-ORDER)
SEG26 P-JUNE: 27May trigger tp:159.535 (TP-ORDER); C-06-03 trigger tp:159.983 (TP-ORDER); B2 modify tp->160.298 19:05 + trigger tp:160.298 (TP-ORDER at modified); B3 trigger tp:160.587 fill 160.588 (TP-ORDER)
```

## R2 predictions (live/candle from B191LXP or EXITCENSUS ownO; ahead = LONG v>open / SHORT v<open)
- A2 L booked 1.16077: 17:35 live 1.16077 open 1.16022 ahead, ==TP hold; 17:40 live 1.16077 open 1.16015 ahead, ==TP hold; 17:45 relocated live 1.15987 (B-190 EXITCENSUS pack 3408) vs open 1.16002 behind -> BLOCKED. TP UNCHANGED, EXIT SAME.
- A5 L booked 1.16315: 16:45-17:10 live static ==TP every candle (packs 3597-3851), ahead throughout. TP UNCHANGED, EXIT SAME (17:13).
- A7 S booked 1.16114: 17:00-17:30 live static ==TP (B191LXP matched), price 1.16189+ never near. TP UNCHANGED, EXIT SAME (SL 17:26).
- F2 S booked 1.33630: 14:45 v1.33630 o1.33863; 15:50 v1.33639 o1.33830; 16:50 v1.33648 o1.33812; 16:55 v1.33649 o1.33740; 17:00 v1.33649 o1.33704 c1.33632, side behind (touch). Ahead every live candle; differs from TP from 14:50 on. TP MOVES, EXIT MOVES to 17:00 @ live.
- June: no POI bookings (session only). No non-F2 exit move: K proceeds.

## R3 BB-2 table (B190TKP WIN rows at decision bars; first = first candle strictly beyond or NONE)
```
A1 8/28 PDL 1.16364 NONE (pack 465) | A3 9/04 LOH 1.16302 NONE (2524) | A4 9/07 ASH 1.16200 NONE (224) | A6 9/08 YLOL 1.16102 NONE (683)
W27MAY DH20260430 160.723 NONE (2047) | C-06-03 ASH 159.983 NONE (109) | B2 DH20260430 160.723 NONE (3125) | B3 LOH 160.587 NONE (2677)
F2 7/07 YLOL 1.33747 first=13:00@1.33707 (pack 1593) -- the only taken+booked session line
POI bookings, mechanical pre-entry touches, not the BB-2 class: A2 Y-POC 06:35@1.16079; A5 Y-VWAP 11:15@1.16338; A7 Y-POC 14:05@1.16106
```
Ruling: BB-2 CLOSED (pound-only session misbooking; fix rides all pairs).

## K diff raw (.preB192 -> .B192K, +100/-5; a 35/2, b 32/3, c +2/0, d +31/0)
```
--- preB192
+++ B192K
@@ struct: +   int          tpPoi;             // booked POI line index (-1 = session/pool)
@@ B190TK: +//--- [B190TK] taken-on-candles ... +bool B190TakenBad(...) [33 lines]
@@ booking walks x2: -   if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask))
+   if(ReadFlow(sessbufs[i], v, barShift) && !TpSessionLevelFiltered(i, s39_mask) && !B190TakenBad(i, v, dir, barShift))
@@ latch: +      g_mtrade.tpPoi             = -1;
+      for(int b191_li = 0; bi<POI_NLINES; b191_li++) { if(g_lineCode[b191_li] == uj_winnerSource) { g_mtrade.tpPoi = b191_li; break; } }
@@ OnInit: +   PrintFormat("[SRJ-EA] B192TAG build=B192K tk=1 lx=1 tf=1"); //--- [B192TAG] build tag (print-only)
@@ retarget: +           g_mtrade.tpPoi = -1; //--- POI memo cleared on session retarget (B-192, REVISION-SOURCE-ONLY)
@@ touch: -    bool tpBookedTouch = false; [kept context] +    //--- [B191LX] live-line touch ... + live block (open-ahead gate) + else booked test
@@ -12711 booked-touch lines (2): -   if(g_mtrade.dir == DIR_LONG  && h >= g_mtrade.tpRef) tpBookedTouch = true;
-   if(g_mtrade.dir == DIR_SHORT && l <= g_mtrade.tpRef) tpBookedTouch = true;
@@ TF (new, +30): +    //--- [B192TF] ... +    if(g_mtrade.tpPoi >= 0 && ...) + ReadBuf1(g_hPoi, tpPoi, v, 0) + open-ahead + Bid/Ask-ahead + PositionModify + B192TF print / MODIFY_FAIL print
@@ exit: -    else if(vTP)    { g_mtrade.exitReason = MT_EXIT_TP_TOUCH;       g_mtrade.exitPrice = g_mtrade.tpRef; }
+    else if(vTP) { live read; exitPrice = live or tpRef; }
```
(Exact +100/-5 verified in job: markers x1 each, b190_=73 b191_=23, braces 1235/1235.)

## Filed-trade tables (cuts only; journal lines)
- RECON62-B192 14 deals: entries 10:05/1.16466 17:35/1.16024 16:00/1.16019 09:20/1.16138 16:45/1.16264 10:10/1.16205 17:00/1.16220 (all baseline-identical). Exits: 11:35/1.16467 BREAK; 17:50/1.15987 BREAK (+TF modify tp->1.15987 same pass, exit same); 23:55/1.16129 DAY_CLOSE; 10:53:07/1.16201 TP tp:1.16200; 17:13:30/1.16315 TP; 10:42:46/1.16102 TP; 17:26:29/1.16275 SL sl:1.16274. K-1/K-2/K-3 clear.
- JUNE0525-B192 8 deals: entries 15:35/159.344 09:10/159.932 16:15/160.065 14:40/160.530 (identical). Exits 20:08:14/159.535 TP; 09:59:40/159.983 TP; 19:16:32/160.298 TP (retarget-modified); 15:23:06/160.588 TP tp:160.587. Zero TF moves. Clear.
- GBP0629-B192 2 deals: #2 sell 14:45 1.33863 (identical); 19 TF modifies 1.33630->1.33649 (sl 1.33940 untouched); trigger 17:03:51 tp:1.33649; #3 buy 17:03:51 1.33649; MTEXIT 17:00 TP_TOUCH exit=1.33649. K-4 graded. No 7/02 deal.
- B192TAG one per segment tf=1 (j77/1050263/2021113). EX5-K all six reads 75B12D19. K-5 clear.

## BB-3 fill table (fill vs reference; booked; live@exit; candle o/h/l/c; mechanism + order price)
```
A1 S entry 1.16466 vs open 1.16466 exact | exit 1.16467 vs MTEXIT 1.16464 +3 | booked 1.16364 | live n/a (session) | 11:30 o1.16440 c1.16463 (body; trial EXITCENSUS) | MARKET BREAK (no trigger)
A2 L entry 1.16024 vs open 1.16022 +2 | exit 1.15987 vs 1.15987 exact | booked 1.16077 | live 1.15987 (TF new) | 17:45 o1.16002 c1.15985 (trial EXITCENSUS) | MARKET BREAK (no trigger)
A3 L entry 1.16019 vs open 1.16018 +1 | exit 1.16129 vs 1.16129 exact | booked 1.16302 | live n/a | 23:55 open fill (day-close next-open) | MARKET DAY_CLOSE
A4 L entry 1.16138 vs open exact | exit 1.16201 vs 1.16200 +1 | booked 1.16200 | live n/a | 10:50 o1.16165 c1.16203 | TP-ORDER tp 1.16200
A5 L entry 1.16264 vs open exact | exit 1.16315 vs 1.16315 exact | booked 1.16315 | live 1.16315 static | 17:10 o1.16294 h1.16320 l1.16294 c1.16311 (trial GAP_TOUCH) | TP-ORDER tp 1.16315
A6 S entry 1.16205 vs open exact | exit 1.16102 vs 1.16102 exact | booked 1.16102 | live n/a | 10:40 o1.16122 c1.16124 | TP-ORDER tp 1.16102
A7 S entry 1.16220 vs open exact | exit 1.16275 vs MTEXIT 1.16274 +1 | booked 1.16114 | live 1.16114 static | 17:30 o1.16258 h1.16280 l1.16258 c1.16276 (trial GAP_TOUCH) | SL-ORDER sl 1.16274
W27 L entry 159.344 vs open exact | exit 159.535 vs 159.535 exact | booked 160.723 | live n/a | 20:05 o/c NOT PRINTED trial rows | TP-ORDER tp 159.535
C-06-03 L entry 159.932 vs open exact | exit 159.983 vs 159.983 exact | booked 159.983 | live n/a | 09:55 o159.960 c159.976 | TP-ORDER tp 159.983
B2 L entry 160.065 vs open exact | exit 160.298 vs 160.298 exact | booked 160.723->retarget 160.298 | live n/a | 19:15 o160.276 c160.303 | TP-ORDER tp 160.298 (modified 19:05)
B3 L entry 160.530 vs open exact | exit 160.588 vs 160.587 +1 | booked 160.587 | live n/a | 15:20 o160.543 c160.570 | TP-ORDER tp 160.587
F2 S entry 1.33863 vs open 1.33863 exact | exit 1.33649 vs 1.33649 exact | booked 1.33630 | live 1.33649 | 17:00 o1.33704 h1.33742 l1.33625 c1.33632 (trial GAP_TOUCH pack 20282) | TP-ORDER tp 1.33649 (19 TF moves)
```
h/l NOT PRINTED on trial rows except GAP_TOUCH candles (F2/A5/A7 above); B191P same-candle cross-ref where needed (labeled at grade). Deviations measured with candles, never smoothed.

## BB-1 timings (W shape: WMI / terminal start / first replay / pass / cut / grade)
- RECON62-B192: 00:18:23 / ~00:18:5x / 00:19:11 / 00:22:15 PASSED / cut ~00:35 / grade ~00:36. Slow start noted (fresh-log wrapper).
- JUNE0525-B192: ~00:23:3x / 00:23:40 / ~00:25 / 00:28:19 PASSED / cut / grade same batch.
- GBP0629-B192: ~00:28:4x / 00:29:00 / 00:29:51 / 00:33:36 PASSED / cut / grade same batch.
- Dead 23:21:25 launch: wrapper died pre-flight (9 GB log); relaunched post-midnight. Launchers killed post-verify (11860/7620/7036); watchers (10560/17668/12756) wrote DONEs; terminals stopped by PID (8548/9092/12196). D: 164.3 GiB -> 158.9 GiB.
(End of slice)
