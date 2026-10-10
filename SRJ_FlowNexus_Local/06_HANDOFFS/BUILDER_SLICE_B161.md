# BUILDER SLICE B-161 - R1/R2 raw, Part S (STOP before Part K: formation time not EA-readable; no edit, no runs)

Base: builder/B-160a head 6488586 on builder/B-161. Start gate per result (targeted diff EMPTY, SHAs match, records 1/1/1/1/1, pre-greps 0/0/0).

## Part B (ALREADY_BANKED)

- Skill grep "there can be multiple XOBs" = 1 (L242, "## Ruling 2026-10-10 (B-160a)" L241-244); appended nothing.

## R1 A2 hole (FOUND, quoted raw)

- ZONES_RECON62-B161 A2/2549 row: `register_row A2, confirm_bar 2026.09.01 17:30, zone_id 2549, zone_range EMPTY, formation_bar 2026.09.01 16:45, promo_bar EMPTY, in_play 1, is_most_recent_xob 1, origin_tag 2549, pack_lines EMPTY` (machine_tag `F=0/0 X=1/1 xob=1.15975-1.16013 @ROWPACK_RECON62-B160_W2.csv:3993`).
- In-play pack line at the confirmation (ROWPACK_RECON62-B160_W2.csv file line 3987; header `pack_line,run,ea_sha,journal_file,journal_line,server_date,server_time,tag,raw`):
- `3986,RECON62-B160,1617DC1ACCE6B50ED2D1359582A70A8B8503C569623EE90C18C6B33542796207,Tester/logs/20261010.log,5918337,2026-09-01,17:35,B152PR,"EI	0	21:32:18.489	Core 04	2026.09.01 17:35:01   [SRJ-IND] B152PR sym=EURUSD bar=2026.09.01 17:30 z1=2549,B,1.15975,1.16013,2026.09.01 17:25,1,2026.09.01 17:30,1.16031,1.16002"`
- Read: 2549 range 1.15975-1.16013, promo 2026.09.01 17:25, first post-promo touch 2026.09.01 17:30 (confirmation bar). Companion XOBPROMO row (file line 3993): `3991,...,5918470,2026-09-01,17:35,XOBPROMO,"II	0	21:32:18.489	Core 04	2026.09.01 17:35:01   [SRJ-EA] XOBPROMO bar=2026.09.01 17:30 site=S3PICK xobId=2549 raw=1788283500.0 promoT=2026.09.01 17:25"`. ZONEPICK row (file line 3993): `NH ... [SRJ-EA] ZONEPICK bar=2026.09.01 17:30 dir=LONG haveFvg=0 fvgInPlay=0 haveXob=1 xobInPlay=1 downgraded=0 fvg=--- xob=1.15975-1.16013`.
- Latest formation among A2 pack-line rows (2275 f08-31, 2286 f08-31, 2289 f08-31, 2549 f09-01 16:45, 305/405/435/484 f08-13/14, 975 f08-19) = 2549: committed origin STANDS. Text only; CSV never rewritten.

## R2 site (B153K check, pasted raw with real line numbers, EA:9822-9852)

- 9822: `//--- [B153K] PROMO-RETURN gate (relay B-153 K4; additive, OR'd onto nothing).`
- 9823: `//--- At the confirmation decision (S5, div decided above), read the`
- 9824: `//--- trade-direction PROMO-RETURN value at the confirmation candle's closed`
- 9825: `//--- bar via ReadFlow (settled-slot convention, same as buffers 22/23/33:`
- 9826: `//--- the slot describes the bar under evaluation). Zone source reuses the`
- 9827: `//--- EA's own idiom (XOBINPLAY line: haveFvg?"FVG":haveXob?"XOB":"none");`
- 9828: `//--- an FVG-sourced confirmation needs no promotion (spec 3.5), so only an`
- 9829: `//--- XOB-sourced confirmation with value 0 is refused. Every kept test below`
- 9830: `//--- stays byte-identical (B129-KEEP-THE-KEPT-TERM).`
- 9831: `{`
- 9832: `double b153pr = 0.0;`
- 9833: `int b153buf = (g_dir == DIR_LONG) ? FL_BUF_B150_BULL : FL_BUF_B150_BEAR;`
- 9834: `double b153zHi = 0.0, b153zLo = 0.0, b153fHi = 0.0, b153fLo = 0.0;`
- 9835: `bool b153haveXob = (ReadFlow(FL_BUF_XOB_ZONE_HIGH, b153zHi, barShift) && b153zHi != EMPTY_VALUE`
- 9836: `&& ReadFlow(FL_BUF_XOB_ZONE_LOW, b153zLo, barShift) && b153zLo != EMPTY_VALUE);`
- 9837: `bool b153haveFvg = (ReadFlow(FL_BUF_FVG_LEG_ZONE_HIGH, b153fHi, barShift) && b153fHi != EMPTY_VALUE`
- 9838: `&& ReadFlow(FL_BUF_FVG_LEG_ZONE_LOW, b153fLo, barShift) && b153fLo != EMPTY_VALUE);`
- 9839: `string b153zsrc = b153haveFvg ? "FVG" : (b153haveXob ? "XOB" : "none");`
- 9840: `bool b153ok = ReadFlow(b153buf, b153pr, barShift);`
- 9841: `if(InpDebugLog)`
- 9842: `PrintFormat("[SRJ-EA] B150GATE bar=%s dir=%s value=%s src=%s forbar=%s", ...);`
- 9848: `if(b153zsrc == "XOB" && b153ok && b153pr < 0.5)`
- 9850: `GoAbort(ABORT_PROMO_RETURN_NONE, g_state); return;`
- Buffer defines (EA:206-212,214): 22/23 XOB range, 24/25 FVG range, 31 XOB_OBJ_ID, 32 FVG_OBJ_ID, 33 XOB_PROMO_TIME, 48/49 PROMO-RETURN bull/bear, 50 2xOB, 30 STRUCT_LEG_TIME (structLegBoundary, indicator:1303/1427-1441), 39 OB swing time. No formation buffer.
- Per-zone verdicts at this site (`barShift` = confirmation candle): id NOT FOUND (buf 31 carries the single selected pick only, read at EA:6993/7618/8892; no id read here); side FOUND as g_dir/scalar only, NOT FOUND per zone; range NOT FOUND per zone (22/23 = selected pick only); promoted NOT FOUND per zone (48/49 scalar only); alive NOT FOUND per zone; post-promotion touch NOT FOUND per zone (g_b153cbT/H/L only in B152PR log, indicator:1522-1524, no buffer); formation candle time NOT FOUND (nothing carries `COrderblock.startBar`).

## R3 (STOP)

- Formation time NOT FOUND EA-side: STOP before Part K. Formation lives only in indicator memory (`COrderblock.startBar`; OrderblockMgr `obStart=`/`obStartT=` prints; ranked OrderblockMgr:1101 `ob.startBar > bestStart`; B152PR z1 segment indicator:1538-1543 has no formation field). Zones never ordered by id. No K (no K0/K1/K2/K3), no T, no W.

## Part S (from committed ZONES rows)

- A1 2026.08.28 10:00 S [9] 1389,1481,1484,1516,1704,1728,1784,1866,2109 | origin 2109 | tag 2149 1.16492-1.16507 @RECON62-B160_W1:4733.
- A2 2026.09.01 17:30 B [9] 2275,2286,2289,2549,305,405,435,484,975 | origin 2549 (R1) | tag 2549 1.15975-1.16013 @RECON62-B160_W2:3993.
- A3 2026.09.04 15:55 B [8] 2722,2787,2792,2793,305,405,435,484 | origin 2793 | tag NOT PRINTED.
- A4 2026.09.07 09:15 B [10] 2722,2787,2792,2793,305,3126,3130,405,435,484 | origin 3130 | tag NOT PRINTED.
- A5 2026.09.07 16:40 B [14] 2722,2787,2792,2793,3022,305,3126,3130,3132,3139,3178,405,435,484 | origin 3178 | tag NOT PRINTED.
- A6 2026.09.08 10:05 S [13] 1389,1481,1484,1516,1704,1728,1784,1866,2109,2149,2896,2898,3293 | origin 3293 | tag 3293 1.16230-1.16256 @RECON62-B160_W3:3490.
- A7 2026.09.08 16:55 S [13] same ids | origin 3293 | tag SETUPS 3293 + 16:30/16:50 ZONEPICK rows.
- B2 2026.06.05 16:10 B [25] ids 1405,1779,1780,1949,212,2509,256,2566,261,2648,2716,2720,2945,313,3150,3308,414,447,449,460,65,696,714,724,78 | origin 3308 | tag 159.881-159.916 @JUNE0525-B160_W2:11743.
- B3 2026.06.11 14:35 B [33] ids 1405,1779,1780,1949,212,2509,256,2566,261,2648,2716,2720,2945,313,3150,3308,3486,3672,3686,3705,3780,3836,3910,3913,414,447,449,460,65,696,714,724,78 | origin 3913 | tag 160.489-160.504 @JUNE0525-B160_W3:10690.
- C-06-03 2026.06.03 09:05 B [21] ids 1405,1779,1780,1949,212,2509,256,261,2820,2928,2930,313,414,447,449,460,65,696,714,724,78 | origin 2930 | tag NOT PRINTED.
- C-05-27 2026.05.27 15:30 B [19] ids 1405,1779,1780,1949,2088,2094,212,256,261,313,414,447,449,460,65,696,714,724,78 | origin 2094 | tag NOT PRINTED.
- C-06-04: no ZONES rows (REJECTED, empty set); origin none.

## X records

- CONTEXT X1/X2 (verbatim relay texts, counts 1/1); HANDOFF X3 (B-161 line, STOP); ledger 1307 tag B161-ORIGIN-TAG-PRINT ("^1307." = 1); pointer B-161 STOP, Lane XOB-DETECT-920 (first relay B-160a, 2 of 6); register unchanged.

(End of slice)
