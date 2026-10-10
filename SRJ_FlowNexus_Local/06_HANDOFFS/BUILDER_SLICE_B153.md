# BUILDER SLICE B-153 - R0 lines, K1 diffs, tables, R1/R2/R3, K3/K4 spots, census (KEPT)

## R0 raw (B152K store; flag set 1480-1504; key objId)
1480 isPromoted skip; 1481 SrjIsNa(promotionBar) skip; 1482 `i <= promotionBar` skip; 1485 NA-zone skip; 1486 overlap -> 1488-1501 flag[objId] (+1024 grow, NO init of new slots).
(a) FOUND: grow 1494-1495 assigns nothing to new elements (leftover-true flags = B-151 extras; leftover cb = B-152 bar-0/crash).
(b) NOT FOUND in code (lockstep resizes 1494-1495 + joint reset 1472-1473).
(c) FOUND: cb stored as bar index i (1500), indexed into time/high/low at print with no range check (crash live 1520:36).
(d) NOT FOUND: kept indicator has no ArrayResize; kept includes' grows are immediately filled/runtime-sized, never sparse flag stores.
Bar-0 rows (474/484/706): (a) explains flags-without-touch; (true,0) pairing mechanism UNKNOWN (paired assignment forbids it).

## K1 diffs (B153K src 78D3BFB1; ex5 E0E98A3D; compiles: 1 failed dup-decl owned+repaired, then 0 errors + 1 benign warning)
vs B152K: decl swap to touched + cbT/cbH/cbL; reset x4; grow x4 + explicit init loop (false/0/0.0/0.0); save time/high/low on transition; MET loop prints saved primitives; print split (summary bull/bear/nz + per-XOB z1= lines, same B152PR tag; journal truncates single lines ~537 chars).
vs kept 956BF3E3: +114/-1 (the -1 is B-150's buffer-count line). Buffers 48/49 meaning unchanged; indices 0-47/inputs/lifecycle untouched.

## K1c filed-trade tables (EA untouched; S1 + S1b repair pair; wrapper-shell killed post-verification, terminal+watcher survived)
RECON62-B153S1/S1b PASSED (563338 ticks, 3168 bars; S1b 126215 summaries + 88184 z1, 0 errors): 14/14 identical side/date/time/price/volumes (2.38/2.04/0.57/2.49/3.9/1.95).
sell 8/28 10:05 1.16466 | buy 8/28 11:35 1.16467 | buy 9/1 17:35 1.16024 | sell 9/1 17:50 1.15987 | buy 9/4 16:00 1.16019 | sell 9/4 23:55 1.16129 | buy 9/7 09:20 1.16138 | sell 9/7 10:53 1.16201 | buy 9/7 16:45 1.16264 | sell 9/7 17:13 1.16315 | sell 9/8 10:10 1.16205 | buy 9/8 10:42 1.16102 | sell 9/8 17:00 1.16220 | buy 9/8 17:26 1.16275
JUNE0525-B153S1/S1b PASSED (740873 ticks, 4320 bars; S1b 108057 summaries + 130505 z1, 0 errors): 10/10 identical.
buy 5/27 15:35 159.344 | sell 5/27 20:08 159.535 | buy 6/3 09:10 159.932 | sell 6/3 09:59 159.983 | sell 6/4 09:55 159.868 | buy 6/4 10:40 159.920 | buy 6/5 16:15 160.065 | sell 6/5 19:16 160.298 | buy 6/11 14:40 160.530 | sell 6/11 15:23 160.588

## R1 lines (B152PR summaries, Tester/logs/20261010.log:line)
A1 10:00 8/28 SHORT bull=1 bear=1 MET (1240387); A2 17:30 9/1 LONG bull=1 MET (1267470); A3 15:55 9/4 bull=1 MET (1298295); A4 09:15 9/7 bull=1 MET (1305875); A5 16:40 9/7 bull=1 MET (1310896); A6 10:05 9/8 bear=1 MET (1318114); A7 16:55 9/8 bear=1 MET (1322271); C-05-27 15:30 5/27 bull=1 beside (1506652); C-06-03 09:05 6/3 bull=1 MET (1557863); C-06-04 09:50 6/4 bear=0 NOT MET none (1570349); B2 16:10 6/5 bull=1 MET (1583808); B3 14:35 6/11 bull=1 MET (1634897). 12/12.

## R2 table (160 trade-direction segments; i=cb-after-promo, ii=overlap, iii=valid=1, iv=UJBARMAP match|n/a-window; 77 full PASS + 83 n/a-window, 0 FAIL)
 screaming-clean representative rows (full 160 in TEMP r_direct.txt):
 305 B 1.15201-1.15225 promo 8/13 10:45 cb 8/13 11:00 1.15264/1.15225 PASSx4 (boundary touch exact)
 975 B 1.15732-1.15775 promo 8/19 07:20 cb 8/31 00:00 1.15773/1.15758 PASSx4 (in-window UJBARMAP match)
 2149 S 1.16492-1.16507 promo 8/28 06:40 cb 8/28 14:00 1.16494/1.16471 PASSx4 (A6/A7 only; absent A1)
 2549 B 1.15975-1.16013 promo 9/1 17:25 cb 9/1 17:30 1.16031/1.16002 PASSx4 (confirmation candle included)
 2722/2787/2792/2793 B promos 9/03 cbs incl 9/04 15:30 1.16260/1.15847 PASSx4 (A3-A7)
 2566 B 159.382-159.407 promo 6/01 03:15 cb 6/03 11:30 159.790/159.368 PASSx4 (B2/B3 only; after C-06-03)
 65-group (12 UJ zones) promos 5/11-5/14 cbs 5/11-5/12 PASSx4 (pre-window, proved by saved primitives)
 Leftover purge confirmed absent everywhere: 474, 706, 2281, 2706, 2510, 3491, 3834 (0 rows across all 12 candles).

## R3 named cases (match by zone+promo, never number)
2510 (159.141-159.180 @5/29 19:10): NOT MET anywhere; B-150's flag was leftover-true (R0 explains: 64 pre-promo overlaps, none after).
2566 (159.382-159.407 @6/01 03:15): NOT MET at C-06-03; MET at B2/B3 (cb 11:30); R0 does not explain B-147's C-06-03 inclusion (first touch 11:30 > C; offline row irreproducible).
2149: MET at A6/A7, correctly absent A1 = B-147 MACH exactly.

## K3 spots (EA, located by text)
Confirmation decision: S5 block EA:9643 (`if(g_state == ST_S5_GATE_CHECK)`; IsConfirmationCandle 9623 -> S5 at 9631); B60C print in ShadowConfirmPoll EA:2568 (called 8387/8392); TP_ELECT shadow 10961 + A6Fired 11059 (B60C then TP_ELECT on every fired row).
Zone-source decision FOUND (FVG path exists): buffers 24/25 read EA:6957/8874; FVG-preferred tiebreak + downgrade rule; zoneSrc idiom `haveFvg?"FVG":haveXob?"XOB":"none"` EA:9121 (FVG-leg empty on kept runs per 9066 comment).
FL_BUF map EA:172-209 (#defines 2-25) + 2025-2066 (26-33); 48/49 were free. Closed-bar pattern ReadFlow = CopyBuffer(shift+FLOW_SHIFT_OFFSET) EA:1999-2071 (settled slot describes evaluated bar, Task-20 comment).

## K4 diff (EA 585093BF -> 5A5BD1F0; +37/-0 purely additive; 0 errors 0 warnings; ex5 AFCEC04D; .B153K kept)
+ FL_BUF_B150_BULL 48 + FL_BUF_B150_BEAR 49 defines; + ABORT_PROMO_RETURN_NONE define; + S5 gate block after div-decided (read trade-direction value at barShift via ReadFlow; zoneSrc by EA idiom; B150GATE print bar/side/value/src/forbar every S5-div-passed confirmation; XOB+0 -> GoAbort + return). Kept tests byte-identical (whitespace drift on 7 anchor lines owned + repaired same turn).

## T tables
T1 RECON62-B153 PASSED 13:03:03 (0:02:43, bal 10434.21): 14/14 identical (table above).
T2 bar match: EU 1837124/1864244/1895080/1902670/1907690/1914936/1919082 (all value=1.0 src=XOB forbar==candle); June 2103416/2154657/2167157(value=0.0)/2181912/2233047 (forbars equal). B-88 holds.
T3 JUNE0525-B153 PASSED 13:10:39 (0:03:21, bal 10505.22): #6/#7 absent; PROMO refusal quoted (B150GATE 2167157 09:50 SHORT 0.0 XOB; ABORT 2167158 + A6REFUSED 2167159 at 09:55 pass); others identical (deal# renumbered 6/7/8/9); no new deal; volumes 0.35/5.69 ACCOUNTED (higher balance, avoided 4 June loss).
T4 census: RECON62 zero PROMO rows. June (1) 09:50-conf Daily-POC SHORT (ABORT+A6REFUSED+STAND-DOWN 2167158-60, the ordered kill); (2) 11:00-conf Daily-VWAP SHORT (ABORT+A6REFUSED 2168220-21, removes nothing - kept never fired it).

## F2b packs (EA 5A5BD1F0, Tester/logs/20261010.log)
Week files: ROWPACK_RECON62-B153_W1 (6741 rows) / _W2 (10784) / _W3 (7558); ROWPACK_JUNE0525-B153_W1 (10062) / _W2 (12088) / _W3 (14302). DEALS_RECON62-B153 (14) + DEALS_JUNE0525-B153 (8). Day files 11 + 15. INDEX_B153 (22 rows, FILE:line). EXITS-B153 (11 trades, no C-06-04). REPORT/SETUPS_RECON62-B153 (28 rows, 7 EXEC) + SETUPS_JUNE0525-B153 (20 rows, 4 EXEC; C-06-04 REJECTED/NOT MET/PROMO_RETURN_NONE).

(End of slice)
