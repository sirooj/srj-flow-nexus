# BUILDER SLICE B-162 - R1/R2 raw, diff, G rows (KEPT: deals identical, origins = Part S)

Base: builder/B-161 head 5dcfa17 on builder/B-162. Start gate per result (targeted diff EMPTY, SHAs match, records 1/1/1/1, pre-greps 0/0/0). Run SHAs: EA 1617DC1ACCE6B50ED2D1359582A70A8B8503C569623EE90C18C6B33542796207; ind ex5 10880847EE593CB7E4D99E2FAE38F7F9DDEB519C23B373145CF7BACFC6292B21. Log Tester/logs/20261011.log.

## Part B (ALREADY_BANKED)

- Skill grep "there can be multiple XOBs" = 1 (L242); appended nothing.

## R1 loop (raw, indicator:1529-1548; segment :1538-1543)

- 1529: `int b150bull = 0, b150bear = 0, b153nz = 0;`
- 1530: `for(int b150k = 0; b150k < b150n; b150k++)` (b150n = g_orderblocks.Total(), :1488)
- 1532: `COrderblock *b150ob = GetOB(g_orderblocks, b150k);`
- 1533: `if(b150ob == NULL) continue;`
- 1534: `if(!b150ob.isPromoted || !b150ob.isValid) continue;` (promoted + alive)
- 1535: `long b150id = b150ob.objId;`
- 1536: `bool b150t = (b150id > 0 && (int)b150id < ArraySize(g_b150Touched)) ? g_b150Touched[(int)b150id] : false;` (comeback flag)
- 1537: `if(!b150t) continue;`
- 1538-1543: z1 segment = id + (isBullish?"B":"S") + low,high + promoT(time[promotionBar]) + isValid + comebackT/H/L (no formation field).
- 1544: unconditional `PrintFormat("[SRJ-IND] B152PR sym=%s bar=%s z1=%s", ...)`; 1555 summary row. Gate: no InpDebugLog (0 hits in indicator); cadence: per closed bar (`if(barClosed)` :1486).
- startBar reachable: FOUND (`b150ob.startBar`, int per SRJ_Types.mqh:40; cf OrderblockMgr:1101 ranking).

## R2 (B-152 lesson)

- New code touches only b150ob fields + g_b150Touched/g_b153cbT/H/L at the id this loop already indexes (:1536/:1542). No new array, no new index: proceed.

## K2 diff (+41/-0 vs .preB162, zero-minus)

- Declarations before the loop (b162nB/nS counts, b162fB/fS = SRJ_NA_INT best formation, b162oB/oS ids, b162l/h ranges, b162sB/sS id sets); per-side latest-startBar track inside the loop; two B162ORIGIN prints after the summary (side=B then S; `origin=NONE n=0 range=- formT=- set=-` when empty; formT via SRJ_BarTimeStr(startBar), indicator:657). Full hunk in result F2. No buffer write, no state change, no new input/array.

## K3 compile

- 0 errors; 1 pre-existing code-43 warning (line 1494 `(int)b150id`, untouched). Src 7842A02E; ex5 10880847 fresh. EA ex5 187A7202 unchanged.

## T1 RECON62-B162 (Test passed 00:03:20, 563338 ticks/3168 bars, log:541696, PRE=541700)

- G1 deals (log deal rows, all SAME as DEALS_RECON62-B160): #2 sell 8/28 10:05 1.16466 2.38; #3 buy 8/28 11:35 1.16467 2.38; #4 buy 9/01 17:35 1.16024 2.04; #5 sell 9/01 17:50 1.15987 2.04; #6 buy 9/04 16:00 1.16019 0.57; #7 sell 9/04 23:55 1.16129 0.57; #8 buy 9/07 09:20 1.16138 2.49; #9 sell 9/07 10:53 1.16201 2.49; #10 buy 9/07 16:45 1.16264 4.05; #11 sell 9/07 17:13 1.16315 4.05; #12 sell 9/08 10:10 1.16205 1.95; #13 buy 9/08 10:42 1.16102 1.95; #14 sell 9/08 17:00 1.16220 1.95; #15 buy 9/08 17:26 1.16275 1.95. A5 A6FIRED sl=1.16239; 7 A6FIRED total (H3 refused, no C fires); no deal past #15; no halt rows.
- G2 B162ORIGIN trade-side (log B162ORIGIN rows): A1 S 2109 1.16505-1.16537 f2026.08.28 01:00; A2 B 2549 1.15975-1.16013 f2026.09.01 16:45; A3 B 2793; A4 B 3130; A5 B 3178; A6 S 3293 1.16230-1.16256 f2026.09.08 09:20; A7 S 3293. All = Part S.
- G3 sets = Part S id lists (A1 [9], A2 [9], A3 [8], A4 [10], A5 [14], A6/A7 [13]; order ignored).
- G4 silent (27 Aug, 28 Aug 16:25, 1 Sep 15:30, 4 Sep 10:40, 8 Sep 16:45); ZONEPICK A1 still xob=1.16492-1.16507 (pick untouched).

## T2 JUNE0525-B162 (Test passed 00:10:24, 740873 ticks/4320 bars)

- G1 deals SAME as DEALS_JUNE0525-B160: #2 buy 5/27 15:35 159.344 1.08; #3 sell 5/27 20:08 159.535 1.08; #4 buy 6/03 09:10 159.932 3.75; #5 sell 6/03 09:59 159.983 3.75; #6 buy 6/05 16:15 160.065 0.35; #7 sell 6/05 19:16 160.298 0.35; #8 buy 6/11 14:40 160.530 5.69; #9 sell 6/11 15:23 160.588 5.69.
- G2 B162ORIGIN: B2 16:10 B 3308 159.881-159.916 f2026.06.05 14:35; B3 14:35 B 3913 160.489-160.504 f2026.06.11 05:20; C-06-03 09:05 B 2930; C-05-27 15:30 B 2094; 4 June 09:50 S origin=NONE n=0 + 09:55 ABORT/A6REFUSED PROMO_RETURN_NONE (+11:00 same pair).
- G3 sets SAME as Part S (B2 [25], B3 [33], C-06-03 [21], C-05-27 [19]). G4 B1/2-June/10-June silent.

## X records

- CONTEXT X1/X2 (1/1); HANDOFF X3 (B-162 KEPT); ledger 1308 ("^1308." = 1); pointer B-162 KEPT, Lane XOB-DETECT-920 CLOSED KEPT B-162; register +3 NOTEs.

## F2b packs

- ROWPACK_RECON62-B162_W1..W3 (7572/14727/8738) + JUNE0525-B162_W1..W3 (11864/13948/16346); DEALS x2 (above); 26 day files; INDEX_B162 (UNMAPPED=0); SETUPS x2 (28 + 20 rows, Part W columns, 2 NOT-PRINTED rows have no confirm bar).

(End of slice)
