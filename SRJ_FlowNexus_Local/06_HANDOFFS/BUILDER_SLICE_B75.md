# BUILDER SLICE B-75 - R1 census tables per row, R2 table, R3 raws (records only; kept EA 6CFE8F8B; diag 4C6D560E; no edit/compile/run)

Conventions: line numbers are 1-based file lines (j37 = RECON62-B66K_JOURNAL.log 77F454AB; j38 = JUNE0525-B66K_JOURNAL.log 6019A461; j39 = RECON62-B69_JOURNAL.log 408E5073; j40 = JUNE0525-B69_JOURNAL.log 1D968931; EA kept 6CFE8F8B unless noted, diag 4C6D560E for j39/j40). W-P = promoT candle through confirmation candle. W-F = candle after formation through candle before promoT. Entry = ENTERS or EQUAL-EDGE; OUTSIDE-through = open-close full crossing (reported, never graded). Formation bar listed, never counted. NO ROW / NOT FOUND legal everywhere. Zones: ZONEID+ZONEPICK adjacency, else census-unique promoT joined to an INPLAYCOMMIT/XOBINPLAY zone (both resolutions agree wherever both exist); unzoned XOBs = NOROW (no reconstruction). Kills: OBPROV code=4 rows with EA bar-time; bulk kills at 2026.08.26 00:00 are genuine lifecycle ends (0 picks of 562 bulk-killed ids after run start; 0 overlap with 643 live-killed ids).

## R1 census tables (every trade-direction XOB with promoT at or before confirmation; status LIVE = no kill before conf)

## --- A1 SHORT conf=2026.08.28 10:00 pick=2149
COUNT live-candidate=143
id=5 obst=2026.08.11 14:25 prot=2026.08.11 14:50 mode=nearest census=243 zone=NOROW inval=[kill line 244 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=42 obst=2026.08.11 19:05 prot=2026.08.11 19:25 mode=nearest census=283 zone=NOROW inval=[none before confirmation] LIVE
id=46 obst=2026.08.11 19:35 prot=2026.08.11 20:00 mode=nearest census=286 zone=NOROW inval=[kill line 297 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=89 obst=2026.08.12 02:05 prot=2026.08.12 02:20 mode=nearest census=324 zone=NOROW inval=[none before confirmation] LIVE
id=101 obst=2026.08.12 03:55 prot=2026.08.12 04:10 mode=nearest census=338 zone=NOROW inval=[none before confirmation] LIVE
id=111 obst=2026.08.12 05:05 prot=2026.08.12 05:20 mode=nearest census=346 zone=NOROW inval=[none before confirmation] LIVE
id=124 obst=2026.08.12 06:35 prot=2026.08.12 06:50 mode=nearest census=357 zone=NOROW inval=[kill line 382 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=118 obst=2026.08.12 05:55 prot=2026.08.12 07:15 mode=all census=363 zone=NOROW inval=[kill line 387 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=120 obst=2026.08.12 06:05 prot=2026.08.12 07:15 mode=all census=364 zone=NOROW inval=[kill line 386 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=137 obst=2026.08.12 07:55 prot=2026.08.12 08:10 mode=nearest census=375 zone=NOROW inval=[kill line 381 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=170 obst=2026.08.12 13:25 prot=2026.08.12 13:50 mode=all census=429 zone=NOROW inval=[kill line 433 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=168 obst=2026.08.12 13:00 prot=2026.08.12 13:55 mode=nearest census=430 zone=NOROW inval=[none before confirmation] LIVE
id=187 obst=2026.08.12 16:05 prot=2026.08.12 16:20 mode=nearest census=445 zone=NOROW inval=[kill line 763 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=203 obst=2026.08.12 18:20 prot=2026.08.12 19:20 mode=all census=465 zone=NOROW inval=[kill line 599 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=219 obst=2026.08.12 20:25 prot=2026.08.12 20:45 mode=nearest census=472 zone=NOROW inval=[kill line 494 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=267 obst=2026.08.13 04:30 prot=2026.08.13 04:50 mode=nearest census=511 zone=NOROW inval=[kill line 568 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=263 obst=2026.08.13 03:55 prot=2026.08.13 04:50 mode=all census=513 zone=NOROW inval=[none before confirmation] LIVE
id=286 obst=2026.08.13 07:55 prot=2026.08.13 09:15 mode=nearest census=537 zone=NOROW inval=[kill line 552 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=297 obst=2026.08.13 09:15 prot=2026.08.13 09:35 mode=nearest census=540 zone=NOROW inval=[kill line 544 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=309 obst=2026.08.13 10:50 prot=2026.08.13 11:10 mode=nearest census=556 zone=NOROW inval=[none before confirmation] LIVE
id=330 obst=2026.08.13 13:35 prot=2026.08.13 13:55 mode=nearest census=574 zone=NOROW inval=[none before confirmation] LIVE
id=336 obst=2026.08.13 14:45 prot=2026.08.13 15:00 mode=nearest census=584 zone=NOROW inval=[none before confirmation] LIVE
id=339 obst=2026.08.13 15:05 prot=2026.08.13 15:40 mode=all census=592 zone=NOROW inval=[none before confirmation] LIVE
id=347 obst=2026.08.13 15:55 prot=2026.08.13 16:30 mode=nearest census=610 zone=NOROW inval=[none before confirmation] LIVE
id=367 obst=2026.08.13 18:35 prot=2026.08.13 19:00 mode=nearest census=627 zone=NOROW inval=[kill line 684 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=353 obst=2026.08.13 16:50 prot=2026.08.13 19:15 mode=all census=632 zone=NOROW inval=[kill line 682 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=364 obst=2026.08.13 18:20 prot=2026.08.13 19:15 mode=all census=633 zone=NOROW inval=[kill line 685 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=370 obst=2026.08.13 19:00 prot=2026.08.13 19:20 mode=nearest census=634 zone=NOROW inval=[none before confirmation] LIVE
id=392 obst=2026.08.13 22:25 prot=2026.08.13 22:45 mode=all census=653 zone=NOROW inval=[kill line 680 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=387 obst=2026.08.13 21:35 prot=2026.08.13 22:50 mode=nearest census=654 zone=NOROW inval=[kill line 674 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=395 obst=2026.08.13 23:00 prot=2026.08.13 23:15 mode=nearest census=659 zone=NOROW inval=[none before confirmation] LIVE
id=442 obst=2026.08.14 05:40 prot=2026.08.14 05:55 mode=nearest census=699 zone=NOROW inval=[none before confirmation] LIVE
id=490 obst=2026.08.14 12:20 prot=2026.08.14 12:40 mode=nearest census=749 zone=NOROW inval=[none before confirmation] LIVE
id=513 obst=2026.08.14 15:30 prot=2026.08.14 15:45 mode=nearest census=776 zone=NOROW inval=[kill line 783 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=515 obst=2026.08.14 15:45 prot=2026.08.14 16:05 mode=nearest census=780 zone=NOROW inval=[none before confirmation] LIVE
id=542 obst=2026.08.14 19:15 prot=2026.08.14 19:35 mode=nearest census=802 zone=NOROW inval=[kill line 854 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=539 obst=2026.08.14 18:45 prot=2026.08.14 20:45 mode=all census=808 zone=NOROW inval=[kill line 872 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=557 obst=2026.08.14 21:05 prot=2026.08.14 21:20 mode=nearest census=813 zone=NOROW inval=[none before confirmation] LIVE
id=622 obst=2026.08.17 05:25 prot=2026.08.17 05:40 mode=nearest census=880 zone=NOROW inval=[kill line 893 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=625 obst=2026.08.17 05:35 prot=2026.08.17 06:00 mode=nearest census=883 zone=NOROW inval=[kill line 889 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=677 obst=2026.08.17 12:25 prot=2026.08.17 12:50 mode=all census=931 zone=NOROW inval=[kill line 1302 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=709 obst=2026.08.17 16:30 prot=2026.08.17 16:40 mode=all census=965 zone=NOROW inval=[none before confirmation] LIVE
id=735 obst=2026.08.17 19:35 prot=2026.08.17 20:00 mode=nearest census=994 zone=NOROW inval=[kill line 1290 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=737 obst=2026.08.17 20:00 prot=2026.08.17 20:20 mode=nearest census=997 zone=NOROW inval=[kill line 1289 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=740 obst=2026.08.17 20:25 prot=2026.08.17 20:40 mode=all census=1003 zone=NOROW inval=[kill line 1048 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=747 obst=2026.08.17 21:10 prot=2026.08.17 21:30 mode=nearest census=1007 zone=NOROW inval=[kill line 1010 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=796 obst=2026.08.18 03:15 prot=2026.08.18 03:30 mode=nearest census=1054 zone=NOROW inval=[kill line 1061 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=794 obst=2026.08.18 03:00 prot=2026.08.18 03:30 mode=all census=1056 zone=NOROW inval=[kill line 1062 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=800 obst=2026.08.18 03:35 prot=2026.08.18 05:05 mode=all census=1072 zone=NOROW inval=[kill line 1160 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=811 obst=2026.08.18 04:50 prot=2026.08.18 05:05 mode=all census=1073 zone=NOROW inval=[kill line 1158 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=756 obst=2026.08.17 22:00 prot=2026.08.18 06:45 mode=nearest census=1089 zone=NOROW inval=[kill line 1100 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=752 obst=2026.08.17 21:35 prot=2026.08.18 07:20 mode=nearest census=1096 zone=NOROW inval=[none before confirmation] LIVE
id=850 obst=2026.08.18 10:45 prot=2026.08.18 11:05 mode=nearest census=1118 zone=NOROW inval=[none before confirmation] LIVE
id=858 obst=2026.08.18 11:55 prot=2026.08.18 12:10 mode=nearest census=1124 zone=NOROW inval=[kill line 1125 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=871 obst=2026.08.18 13:55 prot=2026.08.18 14:50 mode=all census=1134 zone=NOROW inval=[none before confirmation] LIVE
id=875 obst=2026.08.18 14:35 prot=2026.08.18 15:40 mode=nearest census=1151 zone=NOROW inval=[none before confirmation] LIVE
id=909 obst=2026.08.18 19:40 prot=2026.08.18 20:05 mode=nearest census=1185 zone=NOROW inval=[kill line 1255 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=900 obst=2026.08.18 18:35 prot=2026.08.18 20:15 mode=nearest census=1188 zone=NOROW inval=[kill line 1201 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=926 obst=2026.08.18 22:10 prot=2026.08.18 23:05 mode=nearest census=1209 zone=NOROW inval=[kill line 1219 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=948 obst=2026.08.19 00:30 prot=2026.08.19 00:50 mode=nearest census=1224 zone=NOROW inval=[kill line 1230 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=968 obst=2026.08.19 03:10 prot=2026.08.19 03:40 mode=nearest census=1239 zone=NOROW inval=[kill line 1253 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=973 obst=2026.08.19 03:50 prot=2026.08.19 04:05 mode=nearest census=1248 zone=NOROW inval=[kill line 1250 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=998 obst=2026.08.19 06:25 prot=2026.08.19 06:40 mode=nearest census=1268 zone=NOROW inval=[kill line 1277 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=996 obst=2026.08.19 06:10 prot=2026.08.19 07:00 mode=nearest census=1271 zone=NOROW inval=[none before confirmation] LIVE
id=1045 obst=2026.08.19 13:40 prot=2026.08.19 14:00 mode=nearest census=1318 zone=NOROW inval=[kill line 1330 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1050 obst=2026.08.19 14:30 prot=2026.08.19 14:45 mode=nearest census=1323 zone=NOROW inval=[kill line 1325 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1077 obst=2026.08.19 17:35 prot=2026.08.19 17:55 mode=nearest census=1344 zone=NOROW inval=[kill line 1374 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1081 obst=2026.08.19 18:10 prot=2026.08.19 18:30 mode=nearest census=1350 zone=NOROW inval=[none before confirmation] LIVE
id=1092 obst=2026.08.19 19:30 prot=2026.08.19 20:15 mode=nearest census=1360 zone=NOROW inval=[kill line 1367 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1099 obst=2026.08.19 21:10 prot=2026.08.19 21:25 mode=nearest census=1370 zone=NOROW inval=[none before confirmation] LIVE
id=1127 obst=2026.08.20 01:00 prot=2026.08.20 02:20 mode=nearest census=1395 zone=NOROW inval=[none before confirmation] LIVE
id=1168 obst=2026.08.20 07:05 prot=2026.08.20 07:25 mode=nearest census=1440 zone=NOROW inval=[kill line 1455 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1217 obst=2026.08.20 13:25 prot=2026.08.20 13:45 mode=nearest census=1485 zone=NOROW inval=[kill line 1667 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1212 obst=2026.08.20 12:50 prot=2026.08.20 13:50 mode=nearest census=1488 zone=NOROW inval=[kill line 1666 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1223 obst=2026.08.20 13:55 prot=2026.08.20 14:15 mode=nearest census=1491 zone=NOROW inval=[kill line 1610 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1202 obst=2026.08.20 11:50 prot=2026.08.20 14:45 mode=all census=1498 zone=NOROW inval=[kill line 1615 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1229 obst=2026.08.20 14:30 prot=2026.08.20 14:50 mode=nearest census=1499 zone=NOROW inval=[kill line 1609 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1244 obst=2026.08.20 16:15 prot=2026.08.20 16:30 mode=nearest census=1509 zone=NOROW inval=[kill line 1524 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1248 obst=2026.08.20 16:50 prot=2026.08.20 17:15 mode=all census=1517 zone=NOROW inval=[none before confirmation] LIVE
id=1255 obst=2026.08.20 18:00 prot=2026.08.20 18:40 mode=all census=1536 zone=NOROW inval=[kill line 1583 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1258 obst=2026.08.20 18:25 prot=2026.08.20 18:45 mode=nearest census=1537 zone=NOROW inval=[none before confirmation] LIVE
id=1352 obst=2026.08.21 08:10 prot=2026.08.21 08:25 mode=nearest census=1632 zone=NOROW inval=[none before confirmation] LIVE
id=1369 obst=2026.08.21 10:30 prot=2026.08.21 10:50 mode=nearest census=1658 zone=NOROW inval=[none before confirmation] LIVE
id=1389 obst=2026.08.21 13:35 prot=2026.08.21 13:55 mode=nearest census=1681 zone=NOROW inval=[none before confirmation] LIVE
id=1403 obst=2026.08.21 15:20 prot=2026.08.21 15:35 mode=nearest census=1697 zone=NOROW inval=[none before confirmation] LIVE
id=1401 obst=2026.08.21 14:55 prot=2026.08.21 15:40 mode=all census=1698 zone=NOROW inval=[none before confirmation] LIVE
id=1320 obst=2026.08.21 04:00 prot=2026.08.21 16:30 mode=nearest census=1706 zone=NOROW inval=[none before confirmation] LIVE
id=1416 obst=2026.08.21 17:10 prot=2026.08.21 17:30 mode=nearest census=1719 zone=NOROW inval=[kill line 1727 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1299 obst=2026.08.21 01:00 prot=2026.08.21 17:35 mode=all census=1721 zone=NOROW inval=[kill line 1728 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1414 obst=2026.08.21 16:50 prot=2026.08.21 17:35 mode=all census=1722 zone=NOROW inval=[kill line 1732 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1430 obst=2026.08.21 19:20 prot=2026.08.21 20:10 mode=nearest census=1741 zone=NOROW inval=[kill line 1787 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1450 obst=2026.08.21 21:55 prot=2026.08.21 22:15 mode=nearest census=1759 zone=NOROW inval=[kill line 1786 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1468 obst=2026.08.24 01:25 prot=2026.08.24 01:45 mode=nearest census=1777 zone=NOROW inval=[kill line 1783 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1481 obst=2026.08.24 03:20 prot=2026.08.24 04:10 mode=all census=1794 zone=NOROW inval=[none before confirmation] LIVE
id=1484 obst=2026.08.24 03:55 prot=2026.08.24 04:20 mode=nearest census=1796 zone=NOROW inval=[none before confirmation] LIVE
id=1495 obst=2026.08.24 05:20 prot=2026.08.24 05:35 mode=nearest census=1799 zone=NOROW inval=[none before confirmation] LIVE
id=1503 obst=2026.08.24 06:20 prot=2026.08.24 06:50 mode=nearest census=1807 zone=NOROW inval=[kill line 1814 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1506 obst=2026.08.24 06:50 prot=2026.08.24 07:10 mode=nearest census=1811 zone=NOROW inval=[none before confirmation] LIVE
id=1516 obst=2026.08.24 08:15 prot=2026.08.24 08:45 mode=nearest census=1823 zone=NOROW inval=[none before confirmation] LIVE
id=1508 obst=2026.08.24 07:10 prot=2026.08.24 09:30 mode=nearest census=1835 zone=NOROW inval=[none before confirmation] LIVE
id=1552 obst=2026.08.24 13:15 prot=2026.08.24 14:05 mode=all census=1878 zone=NOROW inval=[none before confirmation] LIVE
id=1589 obst=2026.08.24 18:45 prot=2026.08.24 19:00 mode=nearest census=1917 zone=NOROW inval=[none before confirmation] LIVE
id=1594 obst=2026.08.24 19:35 prot=2026.08.24 20:05 mode=all census=1926 zone=NOROW inval=[none before confirmation] LIVE
id=1591 obst=2026.08.24 19:00 prot=2026.08.24 20:25 mode=all census=1930 zone=NOROW inval=[none before confirmation] LIVE
id=1626 obst=2026.08.24 23:45 prot=2026.08.25 00:10 mode=nearest census=1962 zone=NOROW inval=[none before confirmation] LIVE
id=1644 obst=2026.08.25 02:15 prot=2026.08.25 02:35 mode=nearest census=1975 zone=NOROW inval=[none before confirmation] LIVE
id=1658 obst=2026.08.25 04:35 prot=2026.08.25 04:55 mode=nearest census=1989 zone=NOROW inval=[kill line 2046 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1664 obst=2026.08.25 05:35 prot=2026.08.25 06:00 mode=nearest census=1993 zone=NOROW inval=[kill line 2027 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1672 obst=2026.08.25 06:55 prot=2026.08.25 07:10 mode=nearest census=1998 zone=NOROW inval=[kill line 2024 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1656 obst=2026.08.25 04:25 prot=2026.08.25 08:50 mode=all census=2010 zone=NOROW inval=[kill line 2047 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1660 obst=2026.08.25 05:05 prot=2026.08.25 08:50 mode=all census=2011 zone=NOROW inval=[none before confirmation] LIVE
id=1670 obst=2026.08.25 06:40 prot=2026.08.25 08:50 mode=all census=2012 zone=NOROW inval=[kill line 2025 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1714 obst=2026.08.25 12:30 prot=2026.08.25 15:00 mode=all census=2078 zone=NOROW inval=[kill line 2086 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1715 obst=2026.08.25 12:45 prot=2026.08.25 15:00 mode=all census=2079 zone=NOROW inval=[kill line 2085 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1752 obst=2026.08.25 18:30 prot=2026.08.25 19:25 mode=nearest census=2113 zone=NOROW inval=[kill line 2118 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1768 obst=2026.08.25 21:05 prot=2026.08.25 22:35 mode=all census=2143 zone=NOROW inval=[none before confirmation] LIVE
id=1765 obst=2026.08.25 20:35 prot=2026.08.25 22:45 mode=nearest census=2146 zone=NOROW inval=[none before confirmation] LIVE
id=1784 obst=2026.08.25 23:05 prot=2026.08.25 23:40 mode=nearest census=2152 zone=NOROW inval=[none before confirmation] LIVE
id=1796 obst=2026.08.26 01:00 prot=2026.08.26 05:25 mode=all census=2466 zone=NOROW inval=[kill line 4687 t=2026.08.26 11:10] DEAD(2026.08.26 11:10)
id=1821 obst=2026.08.26 05:00 prot=2026.08.26 05:25 mode=all census=2467 zone=NOROW inval=[kill line 4064 t=2026.08.26 10:40] DEAD(2026.08.26 10:40)
id=1822 obst=2026.08.26 05:10 prot=2026.08.26 05:25 mode=all census=2468 zone=NOROW inval=[kill line 4686 t=2026.08.26 11:10] DEAD(2026.08.26 11:10)
id=1825 obst=2026.08.26 05:40 prot=2026.08.26 06:00 mode=nearest census=2497 zone=NOROW inval=[kill line 3626 t=2026.08.26 10:20] DEAD(2026.08.26 10:20)
id=1835 obst=2026.08.26 06:35 prot=2026.08.26 06:55 mode=nearest census=2544 zone=NOROW inval=[kill line 2629 t=2026.08.26 08:35] DEAD(2026.08.26 08:35)
id=1833 obst=2026.08.26 06:25 prot=2026.08.26 08:55 mode=nearest census=2657 zone=1.16660-1.16682 [census promoT=2026.08.26 08:55 unique + XOBINPLAY line 2712] inval=[kill line 3407 t=2026.08.26 10:05] DEAD(2026.08.26 10:05)
  WP/WF: WProws=590 WProvs=26 WFrows=29 WFovs=8 FIRST_WP=line 3386 bar=2026.08.26 09:55 o=1.16652 h=1.16674 l=1.16641 c=1.16668 [ENTERS] | FIRST_WF=line 2525 bar=2026.08.26 06:30 o=1.16661 h=1.16662 l=1.16636 c=1.16641 [ENTERS] | FORM=line 2517 bar=2026.08.26 06:25 o=1.1666 h=1.16682 l=1.1666 c=1.16663 | WIT=INPLAYCOMMIT line 2726 bar=2026.08.26 09:10 firstShift=6 firstVal=1.16667 (n=1)
id=1866 obst=2026.08.26 11:45 prot=2026.08.26 12:00 mode=nearest census=5353 zone=NOROW inval=[kill line 5838 t=2026.08.26 15:20] DEAD(2026.08.26 15:20)
id=1871 obst=2026.08.26 12:30 prot=2026.08.26 14:25 mode=all census=5510 zone=NOROW inval=[kill line 5562 t=2026.08.26 14:50] DEAD(2026.08.26 14:50)
id=1881 obst=2026.08.26 14:10 prot=2026.08.26 14:25 mode=all census=5511 zone=NOROW inval=[none before confirmation] LIVE
id=1704 obst=2026.08.25 11:20 prot=2026.08.26 16:00 mode=all census=6312 zone=NOROW inval=[none before confirmation] LIVE
id=1728 obst=2026.08.25 15:00 prot=2026.08.26 16:00 mode=all census=6313 zone=NOROW inval=[none before confirmation] LIVE
id=1891 obst=2026.08.26 15:45 prot=2026.08.26 16:00 mode=all census=6314 zone=1.16612-1.16640 [ZONEID 13317 + ZONEPICK 13319] inval=[none before confirmation] LIVE
  WP/WF: WProws=505 WProvs=0 WFrows=2 WFovs=2 FIRST_WP=NONE | FIRST_WF=line 6271 bar=2026.08.26 15:50 o=1.1664 h=1.16652 l=1.16578 c=1.16607 [ENTERS] | FORM=line 6262 bar=2026.08.26 15:45 o=1.16635 h=1.1664 l=1.16612 c=1.16638 | WIT=zero-only(n=76)
id=1072 obst=2026.08.19 16:50 prot=2026.08.26 17:10 mode=nearest census=7786 zone=NOROW inval=[none before confirmation] LIVE
id=1937 obst=2026.08.26 22:55 prot=2026.08.27 00:05 mode=nearest census=9572 zone=NOROW inval=[none before confirmation] LIVE
id=1992 obst=2026.08.27 08:40 prot=2026.08.27 09:00 mode=nearest census=10056 zone=NOROW inval=[kill line 11105 t=2026.08.27 11:05] DEAD(2026.08.27 11:05)
id=2003 obst=2026.08.27 10:10 prot=2026.08.27 10:30 mode=nearest census=10985 zone=1.16544-1.16560 [census promoT=2026.08.27 10:30 unique + XOBINPLAY line 11022] inval=[kill line 11104 t=2026.08.27 11:05] DEAD(2026.08.27 11:05)
  WP/WF: WProws=283 WProvs=23 WFrows=3 WFovs=2 FIRST_WP=line 10997 bar=2026.08.27 10:35 o=1.1652 h=1.16546 l=1.1652 c=1.1653 [ENTERS] | FIRST_WF=line 10853 bar=2026.08.27 10:15 o=1.16555 h=1.16555 l=1.16544 c=1.16555 [EQUAL-EDGE] | FORM=line 10801 bar=2026.08.27 10:10 o=1.16547 h=1.1656 l=1.16544 c=1.16555 | WIT=INPLAYCOMMIT line 11035 bar=2026.08.27 10:35 firstShift=5 firstVal=1.16560 (n=1)
id=2054 obst=2026.08.27 17:05 prot=2026.08.27 17:30 mode=nearest census=13333 zone=1.16515-1.16578 [census promoT=2026.08.27 17:30 unique + XOBINPLAY line 13443] inval=[kill line 15134 t=2026.08.28 04:40] DEAD(2026.08.28 04:40)
  WP/WF: WProws=199 WProvs=87 WFrows=4 WFovs=3 FIRST_WP=line 13335 bar=2026.08.27 17:30 o=1.1649 h=1.16519 l=1.16488 c=1.16519 [ENTERS] | FIRST_WF=line 12862 bar=2026.08.27 17:10 o=1.16556 h=1.16557 l=1.16504 c=1.16515 [ENTERS] | FORM=line 12736 bar=2026.08.27 17:05 o=1.16524 h=1.16578 l=1.16515 c=1.16557 | WIT=INPLAYCOMMIT line 13450 bar=2026.08.27 17:30 firstShift=5 firstVal=1.16578 (n=1)
id=2077 obst=2026.08.27 20:20 prot=2026.08.27 20:40 mode=all census=14701 zone=NOROW inval=[kill line 14833 t=2026.08.27 23:10] DEAD(2026.08.27 23:10)
id=2088 obst=2026.08.27 22:15 prot=2026.08.27 22:55 mode=nearest census=14818 zone=NOROW inval=[kill line 14825 t=2026.08.27 23:05] DEAD(2026.08.27 23:05)
id=2105 obst=2026.08.28 00:35 prot=2026.08.28 00:50 mode=nearest census=14924 zone=NOROW inval=[kill line 14945 t=2026.08.28 01:15] DEAD(2026.08.28 01:15)
id=2109 obst=2026.08.28 01:00 prot=2026.08.28 05:05 mode=nearest census=15173 zone=NOROW inval=[none before confirmation] LIVE
id=2136 obst=2026.08.28 05:05 prot=2026.08.28 05:20 mode=nearest census=15187 zone=NOROW inval=[none before confirmation] LIVE
id=2149 obst=2026.08.28 06:25 prot=2026.08.28 06:40 mode=nearest census=15270 zone=1.16492-1.16507 [ZONEID 15634 + ZONEPICK 15636] inval=[none before confirmation] [PICK] LIVE
  WP/WF: WProws=41 WProvs=0 WFrows=2 WFovs=2 FIRST_WP=NONE | FIRST_WF=line 15256 bar=2026.08.28 06:30 o=1.16506 h=1.16508 l=1.16491 c=1.16494 [ENTERS] | FORM=line 15253 bar=2026.08.28 06:25 o=1.16492 h=1.16507 l=1.16492 c=1.16507 | WIT=XOBINPLAY line 17770 bar=2026.08.28 15:30 firstShift=18 firstVal=1.16494 (n=6) [PICK]
id=2155 obst=2026.08.28 07:15 prot=2026.08.28 07:35 mode=nearest census=15319 zone=NOROW inval=[kill line 15436 t=2026.08.28 09:30] DEAD(2026.08.28 09:30)
id=2162 obst=2026.08.28 08:15 prot=2026.08.28 08:40 mode=all census=15376 zone=NOROW inval=[none before confirmation] LIVE
## --- A6 SHORT conf=2026.09.08 10:05 pick=2898
COUNT live-candidate=219
id=5 obst=2026.08.11 14:25 prot=2026.08.11 14:50 mode=nearest census=243 zone=NOROW inval=[kill line 244 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=42 obst=2026.08.11 19:05 prot=2026.08.11 19:25 mode=nearest census=283 zone=NOROW inval=[none before confirmation] LIVE
id=46 obst=2026.08.11 19:35 prot=2026.08.11 20:00 mode=nearest census=286 zone=NOROW inval=[kill line 297 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=89 obst=2026.08.12 02:05 prot=2026.08.12 02:20 mode=nearest census=324 zone=NOROW inval=[none before confirmation] LIVE
id=101 obst=2026.08.12 03:55 prot=2026.08.12 04:10 mode=nearest census=338 zone=NOROW inval=[none before confirmation] LIVE
id=111 obst=2026.08.12 05:05 prot=2026.08.12 05:20 mode=nearest census=346 zone=NOROW inval=[none before confirmation] LIVE
id=124 obst=2026.08.12 06:35 prot=2026.08.12 06:50 mode=nearest census=357 zone=NOROW inval=[kill line 382 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=118 obst=2026.08.12 05:55 prot=2026.08.12 07:15 mode=all census=363 zone=NOROW inval=[kill line 387 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=120 obst=2026.08.12 06:05 prot=2026.08.12 07:15 mode=all census=364 zone=NOROW inval=[kill line 386 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=137 obst=2026.08.12 07:55 prot=2026.08.12 08:10 mode=nearest census=375 zone=NOROW inval=[kill line 381 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=170 obst=2026.08.12 13:25 prot=2026.08.12 13:50 mode=all census=429 zone=NOROW inval=[kill line 433 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=168 obst=2026.08.12 13:00 prot=2026.08.12 13:55 mode=nearest census=430 zone=NOROW inval=[none before confirmation] LIVE
id=187 obst=2026.08.12 16:05 prot=2026.08.12 16:20 mode=nearest census=445 zone=NOROW inval=[kill line 763 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=203 obst=2026.08.12 18:20 prot=2026.08.12 19:20 mode=all census=465 zone=NOROW inval=[kill line 599 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=219 obst=2026.08.12 20:25 prot=2026.08.12 20:45 mode=nearest census=472 zone=NOROW inval=[kill line 494 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=267 obst=2026.08.13 04:30 prot=2026.08.13 04:50 mode=nearest census=511 zone=NOROW inval=[kill line 568 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=263 obst=2026.08.13 03:55 prot=2026.08.13 04:50 mode=all census=513 zone=NOROW inval=[none before confirmation] LIVE
id=286 obst=2026.08.13 07:55 prot=2026.08.13 09:15 mode=nearest census=537 zone=NOROW inval=[kill line 552 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=297 obst=2026.08.13 09:15 prot=2026.08.13 09:35 mode=nearest census=540 zone=NOROW inval=[kill line 544 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=309 obst=2026.08.13 10:50 prot=2026.08.13 11:10 mode=nearest census=556 zone=NOROW inval=[none before confirmation] LIVE
id=330 obst=2026.08.13 13:35 prot=2026.08.13 13:55 mode=nearest census=574 zone=NOROW inval=[none before confirmation] LIVE
id=336 obst=2026.08.13 14:45 prot=2026.08.13 15:00 mode=nearest census=584 zone=NOROW inval=[none before confirmation] LIVE
id=339 obst=2026.08.13 15:05 prot=2026.08.13 15:40 mode=all census=592 zone=NOROW inval=[none before confirmation] LIVE
id=347 obst=2026.08.13 15:55 prot=2026.08.13 16:30 mode=nearest census=610 zone=NOROW inval=[none before confirmation] LIVE
id=367 obst=2026.08.13 18:35 prot=2026.08.13 19:00 mode=nearest census=627 zone=NOROW inval=[kill line 684 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=353 obst=2026.08.13 16:50 prot=2026.08.13 19:15 mode=all census=632 zone=NOROW inval=[kill line 682 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=364 obst=2026.08.13 18:20 prot=2026.08.13 19:15 mode=all census=633 zone=NOROW inval=[kill line 685 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=370 obst=2026.08.13 19:00 prot=2026.08.13 19:20 mode=nearest census=634 zone=NOROW inval=[none before confirmation] LIVE
id=392 obst=2026.08.13 22:25 prot=2026.08.13 22:45 mode=all census=653 zone=NOROW inval=[kill line 680 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=387 obst=2026.08.13 21:35 prot=2026.08.13 22:50 mode=nearest census=654 zone=NOROW inval=[kill line 674 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=395 obst=2026.08.13 23:00 prot=2026.08.13 23:15 mode=nearest census=659 zone=NOROW inval=[none before confirmation] LIVE
id=442 obst=2026.08.14 05:40 prot=2026.08.14 05:55 mode=nearest census=699 zone=NOROW inval=[none before confirmation] LIVE
id=490 obst=2026.08.14 12:20 prot=2026.08.14 12:40 mode=nearest census=749 zone=NOROW inval=[none before confirmation] LIVE
id=513 obst=2026.08.14 15:30 prot=2026.08.14 15:45 mode=nearest census=776 zone=NOROW inval=[kill line 783 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=515 obst=2026.08.14 15:45 prot=2026.08.14 16:05 mode=nearest census=780 zone=NOROW inval=[none before confirmation] LIVE
id=542 obst=2026.08.14 19:15 prot=2026.08.14 19:35 mode=nearest census=802 zone=NOROW inval=[kill line 854 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=539 obst=2026.08.14 18:45 prot=2026.08.14 20:45 mode=all census=808 zone=NOROW inval=[kill line 872 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=557 obst=2026.08.14 21:05 prot=2026.08.14 21:20 mode=nearest census=813 zone=NOROW inval=[none before confirmation] LIVE
id=622 obst=2026.08.17 05:25 prot=2026.08.17 05:40 mode=nearest census=880 zone=NOROW inval=[kill line 893 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=625 obst=2026.08.17 05:35 prot=2026.08.17 06:00 mode=nearest census=883 zone=NOROW inval=[kill line 889 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=677 obst=2026.08.17 12:25 prot=2026.08.17 12:50 mode=all census=931 zone=NOROW inval=[kill line 1302 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=709 obst=2026.08.17 16:30 prot=2026.08.17 16:40 mode=all census=965 zone=NOROW inval=[none before confirmation] LIVE
id=735 obst=2026.08.17 19:35 prot=2026.08.17 20:00 mode=nearest census=994 zone=NOROW inval=[kill line 1290 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=737 obst=2026.08.17 20:00 prot=2026.08.17 20:20 mode=nearest census=997 zone=NOROW inval=[kill line 1289 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=740 obst=2026.08.17 20:25 prot=2026.08.17 20:40 mode=all census=1003 zone=NOROW inval=[kill line 1048 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=747 obst=2026.08.17 21:10 prot=2026.08.17 21:30 mode=nearest census=1007 zone=NOROW inval=[kill line 1010 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=796 obst=2026.08.18 03:15 prot=2026.08.18 03:30 mode=nearest census=1054 zone=NOROW inval=[kill line 1061 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=794 obst=2026.08.18 03:00 prot=2026.08.18 03:30 mode=all census=1056 zone=NOROW inval=[kill line 1062 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=800 obst=2026.08.18 03:35 prot=2026.08.18 05:05 mode=all census=1072 zone=NOROW inval=[kill line 1160 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=811 obst=2026.08.18 04:50 prot=2026.08.18 05:05 mode=all census=1073 zone=NOROW inval=[kill line 1158 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=756 obst=2026.08.17 22:00 prot=2026.08.18 06:45 mode=nearest census=1089 zone=NOROW inval=[kill line 1100 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=752 obst=2026.08.17 21:35 prot=2026.08.18 07:20 mode=nearest census=1096 zone=NOROW inval=[none before confirmation] LIVE
id=850 obst=2026.08.18 10:45 prot=2026.08.18 11:05 mode=nearest census=1118 zone=NOROW inval=[none before confirmation] LIVE
id=858 obst=2026.08.18 11:55 prot=2026.08.18 12:10 mode=nearest census=1124 zone=NOROW inval=[kill line 1125 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=871 obst=2026.08.18 13:55 prot=2026.08.18 14:50 mode=all census=1134 zone=NOROW inval=[none before confirmation] LIVE
id=875 obst=2026.08.18 14:35 prot=2026.08.18 15:40 mode=nearest census=1151 zone=NOROW inval=[none before confirmation] LIVE
id=909 obst=2026.08.18 19:40 prot=2026.08.18 20:05 mode=nearest census=1185 zone=NOROW inval=[kill line 1255 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=900 obst=2026.08.18 18:35 prot=2026.08.18 20:15 mode=nearest census=1188 zone=NOROW inval=[kill line 1201 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=926 obst=2026.08.18 22:10 prot=2026.08.18 23:05 mode=nearest census=1209 zone=NOROW inval=[kill line 1219 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=948 obst=2026.08.19 00:30 prot=2026.08.19 00:50 mode=nearest census=1224 zone=NOROW inval=[kill line 1230 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=968 obst=2026.08.19 03:10 prot=2026.08.19 03:40 mode=nearest census=1239 zone=NOROW inval=[kill line 1253 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=973 obst=2026.08.19 03:50 prot=2026.08.19 04:05 mode=nearest census=1248 zone=NOROW inval=[kill line 1250 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=998 obst=2026.08.19 06:25 prot=2026.08.19 06:40 mode=nearest census=1268 zone=NOROW inval=[kill line 1277 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=996 obst=2026.08.19 06:10 prot=2026.08.19 07:00 mode=nearest census=1271 zone=NOROW inval=[none before confirmation] LIVE
id=1045 obst=2026.08.19 13:40 prot=2026.08.19 14:00 mode=nearest census=1318 zone=NOROW inval=[kill line 1330 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1050 obst=2026.08.19 14:30 prot=2026.08.19 14:45 mode=nearest census=1323 zone=NOROW inval=[kill line 1325 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1077 obst=2026.08.19 17:35 prot=2026.08.19 17:55 mode=nearest census=1344 zone=NOROW inval=[kill line 1374 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1081 obst=2026.08.19 18:10 prot=2026.08.19 18:30 mode=nearest census=1350 zone=NOROW inval=[none before confirmation] LIVE
id=1092 obst=2026.08.19 19:30 prot=2026.08.19 20:15 mode=nearest census=1360 zone=NOROW inval=[kill line 1367 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1099 obst=2026.08.19 21:10 prot=2026.08.19 21:25 mode=nearest census=1370 zone=NOROW inval=[none before confirmation] LIVE
id=1127 obst=2026.08.20 01:00 prot=2026.08.20 02:20 mode=nearest census=1395 zone=NOROW inval=[none before confirmation] LIVE
id=1168 obst=2026.08.20 07:05 prot=2026.08.20 07:25 mode=nearest census=1440 zone=NOROW inval=[kill line 1455 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1217 obst=2026.08.20 13:25 prot=2026.08.20 13:45 mode=nearest census=1485 zone=NOROW inval=[kill line 1667 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1212 obst=2026.08.20 12:50 prot=2026.08.20 13:50 mode=nearest census=1488 zone=NOROW inval=[kill line 1666 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1223 obst=2026.08.20 13:55 prot=2026.08.20 14:15 mode=nearest census=1491 zone=NOROW inval=[kill line 1610 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1202 obst=2026.08.20 11:50 prot=2026.08.20 14:45 mode=all census=1498 zone=NOROW inval=[kill line 1615 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1229 obst=2026.08.20 14:30 prot=2026.08.20 14:50 mode=nearest census=1499 zone=NOROW inval=[kill line 1609 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1244 obst=2026.08.20 16:15 prot=2026.08.20 16:30 mode=nearest census=1509 zone=NOROW inval=[kill line 1524 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1248 obst=2026.08.20 16:50 prot=2026.08.20 17:15 mode=all census=1517 zone=NOROW inval=[none before confirmation] LIVE
id=1255 obst=2026.08.20 18:00 prot=2026.08.20 18:40 mode=all census=1536 zone=NOROW inval=[kill line 1583 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1258 obst=2026.08.20 18:25 prot=2026.08.20 18:45 mode=nearest census=1537 zone=NOROW inval=[none before confirmation] LIVE
id=1352 obst=2026.08.21 08:10 prot=2026.08.21 08:25 mode=nearest census=1632 zone=NOROW inval=[none before confirmation] LIVE
id=1369 obst=2026.08.21 10:30 prot=2026.08.21 10:50 mode=nearest census=1658 zone=NOROW inval=[none before confirmation] LIVE
id=1389 obst=2026.08.21 13:35 prot=2026.08.21 13:55 mode=nearest census=1681 zone=NOROW inval=[none before confirmation] LIVE
id=1403 obst=2026.08.21 15:20 prot=2026.08.21 15:35 mode=nearest census=1697 zone=NOROW inval=[none before confirmation] LIVE
id=1401 obst=2026.08.21 14:55 prot=2026.08.21 15:40 mode=all census=1698 zone=NOROW inval=[none before confirmation] LIVE
id=1320 obst=2026.08.21 04:00 prot=2026.08.21 16:30 mode=nearest census=1706 zone=NOROW inval=[none before confirmation] LIVE
id=1416 obst=2026.08.21 17:10 prot=2026.08.21 17:30 mode=nearest census=1719 zone=NOROW inval=[kill line 1727 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1299 obst=2026.08.21 01:00 prot=2026.08.21 17:35 mode=all census=1721 zone=NOROW inval=[kill line 1728 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1414 obst=2026.08.21 16:50 prot=2026.08.21 17:35 mode=all census=1722 zone=NOROW inval=[kill line 1732 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1430 obst=2026.08.21 19:20 prot=2026.08.21 20:10 mode=nearest census=1741 zone=NOROW inval=[kill line 1787 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1450 obst=2026.08.21 21:55 prot=2026.08.21 22:15 mode=nearest census=1759 zone=NOROW inval=[kill line 1786 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1468 obst=2026.08.24 01:25 prot=2026.08.24 01:45 mode=nearest census=1777 zone=NOROW inval=[kill line 1783 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1481 obst=2026.08.24 03:20 prot=2026.08.24 04:10 mode=all census=1794 zone=NOROW inval=[none before confirmation] LIVE
id=1484 obst=2026.08.24 03:55 prot=2026.08.24 04:20 mode=nearest census=1796 zone=NOROW inval=[none before confirmation] LIVE
id=1495 obst=2026.08.24 05:20 prot=2026.08.24 05:35 mode=nearest census=1799 zone=NOROW inval=[none before confirmation] LIVE
id=1503 obst=2026.08.24 06:20 prot=2026.08.24 06:50 mode=nearest census=1807 zone=NOROW inval=[kill line 1814 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1506 obst=2026.08.24 06:50 prot=2026.08.24 07:10 mode=nearest census=1811 zone=NOROW inval=[none before confirmation] LIVE
id=1516 obst=2026.08.24 08:15 prot=2026.08.24 08:45 mode=nearest census=1823 zone=NOROW inval=[none before confirmation] LIVE
id=1508 obst=2026.08.24 07:10 prot=2026.08.24 09:30 mode=nearest census=1835 zone=NOROW inval=[none before confirmation] LIVE
id=1552 obst=2026.08.24 13:15 prot=2026.08.24 14:05 mode=all census=1878 zone=NOROW inval=[none before confirmation] LIVE
id=1589 obst=2026.08.24 18:45 prot=2026.08.24 19:00 mode=nearest census=1917 zone=NOROW inval=[none before confirmation] LIVE
id=1594 obst=2026.08.24 19:35 prot=2026.08.24 20:05 mode=all census=1926 zone=NOROW inval=[none before confirmation] LIVE
id=1591 obst=2026.08.24 19:00 prot=2026.08.24 20:25 mode=all census=1930 zone=NOROW inval=[none before confirmation] LIVE
id=1626 obst=2026.08.24 23:45 prot=2026.08.25 00:10 mode=nearest census=1962 zone=NOROW inval=[none before confirmation] LIVE
id=1644 obst=2026.08.25 02:15 prot=2026.08.25 02:35 mode=nearest census=1975 zone=NOROW inval=[none before confirmation] LIVE
id=1658 obst=2026.08.25 04:35 prot=2026.08.25 04:55 mode=nearest census=1989 zone=NOROW inval=[kill line 2046 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1664 obst=2026.08.25 05:35 prot=2026.08.25 06:00 mode=nearest census=1993 zone=NOROW inval=[kill line 2027 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1672 obst=2026.08.25 06:55 prot=2026.08.25 07:10 mode=nearest census=1998 zone=NOROW inval=[kill line 2024 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1656 obst=2026.08.25 04:25 prot=2026.08.25 08:50 mode=all census=2010 zone=NOROW inval=[kill line 2047 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1660 obst=2026.08.25 05:05 prot=2026.08.25 08:50 mode=all census=2011 zone=NOROW inval=[none before confirmation] LIVE
id=1670 obst=2026.08.25 06:40 prot=2026.08.25 08:50 mode=all census=2012 zone=NOROW inval=[kill line 2025 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1714 obst=2026.08.25 12:30 prot=2026.08.25 15:00 mode=all census=2078 zone=NOROW inval=[kill line 2086 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1715 obst=2026.08.25 12:45 prot=2026.08.25 15:00 mode=all census=2079 zone=NOROW inval=[kill line 2085 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1752 obst=2026.08.25 18:30 prot=2026.08.25 19:25 mode=nearest census=2113 zone=NOROW inval=[kill line 2118 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1768 obst=2026.08.25 21:05 prot=2026.08.25 22:35 mode=all census=2143 zone=NOROW inval=[none before confirmation] LIVE
id=1765 obst=2026.08.25 20:35 prot=2026.08.25 22:45 mode=nearest census=2146 zone=NOROW inval=[none before confirmation] LIVE
id=1784 obst=2026.08.25 23:05 prot=2026.08.25 23:40 mode=nearest census=2152 zone=NOROW inval=[none before confirmation] LIVE
id=1796 obst=2026.08.26 01:00 prot=2026.08.26 05:25 mode=all census=2466 zone=NOROW inval=[kill line 4687 t=2026.08.26 11:10] DEAD(2026.08.26 11:10)
id=1821 obst=2026.08.26 05:00 prot=2026.08.26 05:25 mode=all census=2467 zone=NOROW inval=[kill line 4064 t=2026.08.26 10:40] DEAD(2026.08.26 10:40)
id=1822 obst=2026.08.26 05:10 prot=2026.08.26 05:25 mode=all census=2468 zone=NOROW inval=[kill line 4686 t=2026.08.26 11:10] DEAD(2026.08.26 11:10)
id=1825 obst=2026.08.26 05:40 prot=2026.08.26 06:00 mode=nearest census=2497 zone=NOROW inval=[kill line 3626 t=2026.08.26 10:20] DEAD(2026.08.26 10:20)
id=1835 obst=2026.08.26 06:35 prot=2026.08.26 06:55 mode=nearest census=2544 zone=NOROW inval=[kill line 2629 t=2026.08.26 08:35] DEAD(2026.08.26 08:35)
id=1833 obst=2026.08.26 06:25 prot=2026.08.26 08:55 mode=nearest census=2657 zone=1.16660-1.16682 [census promoT=2026.08.26 08:55 unique + XOBINPLAY line 2712] inval=[kill line 3407 t=2026.08.26 10:05] DEAD(2026.08.26 10:05)
  WP/WF: WProws=2607 WProvs=26 WFrows=29 WFovs=8 FIRST_WP=line 3386 bar=2026.08.26 09:55 o=1.16652 h=1.16674 l=1.16641 c=1.16668 [ENTERS] | FIRST_WF=line 2525 bar=2026.08.26 06:30 o=1.16661 h=1.16662 l=1.16636 c=1.16641 [ENTERS] | FORM=line 2517 bar=2026.08.26 06:25 o=1.1666 h=1.16682 l=1.1666 c=1.16663 | WIT=INPLAYCOMMIT line 2726 bar=2026.08.26 09:10 firstShift=6 firstVal=1.16667 (n=1)
id=1866 obst=2026.08.26 11:45 prot=2026.08.26 12:00 mode=nearest census=5353 zone=NOROW inval=[kill line 5838 t=2026.08.26 15:20] DEAD(2026.08.26 15:20)
id=1871 obst=2026.08.26 12:30 prot=2026.08.26 14:25 mode=all census=5510 zone=NOROW inval=[kill line 5562 t=2026.08.26 14:50] DEAD(2026.08.26 14:50)
id=1881 obst=2026.08.26 14:10 prot=2026.08.26 14:25 mode=all census=5511 zone=NOROW inval=[none before confirmation] LIVE
id=1704 obst=2026.08.25 11:20 prot=2026.08.26 16:00 mode=all census=6312 zone=NOROW inval=[none before confirmation] LIVE
id=1728 obst=2026.08.25 15:00 prot=2026.08.26 16:00 mode=all census=6313 zone=NOROW inval=[none before confirmation] LIVE
id=1891 obst=2026.08.26 15:45 prot=2026.08.26 16:00 mode=all census=6314 zone=1.16612-1.16640 [ZONEID 13317 + ZONEPICK 13319] inval=[none before confirmation] LIVE
  WP/WF: WProws=2522 WProvs=0 WFrows=2 WFovs=2 FIRST_WP=NONE | FIRST_WF=line 6271 bar=2026.08.26 15:50 o=1.1664 h=1.16652 l=1.16578 c=1.16607 [ENTERS] | FORM=line 6262 bar=2026.08.26 15:45 o=1.16635 h=1.1664 l=1.16612 c=1.16638 | WIT=zero-only(n=76)
id=1072 obst=2026.08.19 16:50 prot=2026.08.26 17:10 mode=nearest census=7786 zone=NOROW inval=[none before confirmation] LIVE
id=1937 obst=2026.08.26 22:55 prot=2026.08.27 00:05 mode=nearest census=9572 zone=NOROW inval=[none before confirmation] LIVE
id=1992 obst=2026.08.27 08:40 prot=2026.08.27 09:00 mode=nearest census=10056 zone=NOROW inval=[kill line 11105 t=2026.08.27 11:05] DEAD(2026.08.27 11:05)
id=2003 obst=2026.08.27 10:10 prot=2026.08.27 10:30 mode=nearest census=10985 zone=1.16544-1.16560 [census promoT=2026.08.27 10:30 unique + XOBINPLAY line 11022] inval=[kill line 11104 t=2026.08.27 11:05] DEAD(2026.08.27 11:05)
  WP/WF: WProws=2300 WProvs=24 WFrows=3 WFovs=2 FIRST_WP=line 10997 bar=2026.08.27 10:35 o=1.1652 h=1.16546 l=1.1652 c=1.1653 [ENTERS] | FIRST_WF=line 10853 bar=2026.08.27 10:15 o=1.16555 h=1.16555 l=1.16544 c=1.16555 [EQUAL-EDGE] | FORM=line 10801 bar=2026.08.27 10:10 o=1.16547 h=1.1656 l=1.16544 c=1.16555 | WIT=INPLAYCOMMIT line 11035 bar=2026.08.27 10:35 firstShift=5 firstVal=1.16560 (n=1)
id=2054 obst=2026.08.27 17:05 prot=2026.08.27 17:30 mode=nearest census=13333 zone=1.16515-1.16578 [census promoT=2026.08.27 17:30 unique + XOBINPLAY line 13443] inval=[kill line 15134 t=2026.08.28 04:40] DEAD(2026.08.28 04:40)
  WP/WF: WProws=2216 WProvs=88 WFrows=4 WFovs=3 FIRST_WP=line 13335 bar=2026.08.27 17:30 o=1.1649 h=1.16519 l=1.16488 c=1.16519 [ENTERS] | FIRST_WF=line 12862 bar=2026.08.27 17:10 o=1.16556 h=1.16557 l=1.16504 c=1.16515 [ENTERS] | FORM=line 12736 bar=2026.08.27 17:05 o=1.16524 h=1.16578 l=1.16515 c=1.16557 | WIT=INPLAYCOMMIT line 13450 bar=2026.08.27 17:30 firstShift=5 firstVal=1.16578 (n=1)
id=2077 obst=2026.08.27 20:20 prot=2026.08.27 20:40 mode=all census=14701 zone=NOROW inval=[kill line 14833 t=2026.08.27 23:10] DEAD(2026.08.27 23:10)
id=2088 obst=2026.08.27 22:15 prot=2026.08.27 22:55 mode=nearest census=14818 zone=NOROW inval=[kill line 14825 t=2026.08.27 23:05] DEAD(2026.08.27 23:05)
id=2105 obst=2026.08.28 00:35 prot=2026.08.28 00:50 mode=nearest census=14924 zone=NOROW inval=[kill line 14945 t=2026.08.28 01:15] DEAD(2026.08.28 01:15)
id=2109 obst=2026.08.28 01:00 prot=2026.08.28 05:05 mode=nearest census=15173 zone=NOROW inval=[none before confirmation] LIVE
id=2136 obst=2026.08.28 05:05 prot=2026.08.28 05:20 mode=nearest census=15187 zone=NOROW inval=[none before confirmation] LIVE
id=2149 obst=2026.08.28 06:25 prot=2026.08.28 06:40 mode=nearest census=15270 zone=1.16492-1.16507 [census promoT=2026.08.28 06:40 unique + XOBINPLAY line 15512] inval=[none before confirmation] LIVE
  WP/WF: WProws=2058 WProvs=4 WFrows=2 WFovs=2 FIRST_WP=line 16375 bar=2026.08.28 14:00 o=1.1649 h=1.16494 l=1.16471 c=1.16474 [ENTERS] | FIRST_WF=line 15256 bar=2026.08.28 06:30 o=1.16506 h=1.16508 l=1.16491 c=1.16494 [ENTERS] | FORM=line 15253 bar=2026.08.28 06:25 o=1.16492 h=1.16507 l=1.16492 c=1.16507 | WIT=XOBINPLAY line 17770 bar=2026.08.28 15:30 firstShift=18 firstVal=1.16494 (n=6)
id=2155 obst=2026.08.28 07:15 prot=2026.08.28 07:35 mode=nearest census=15319 zone=NOROW inval=[kill line 15436 t=2026.08.28 09:30] DEAD(2026.08.28 09:30)
id=2162 obst=2026.08.28 08:15 prot=2026.08.28 08:40 mode=all census=15376 zone=NOROW inval=[none before confirmation] LIVE
id=2172 obst=2026.08.28 09:40 prot=2026.08.28 10:15 mode=nearest census=15854 zone=NOROW inval=[kill line 15983 t=2026.08.28 10:50] DEAD(2026.08.28 10:50)
id=2166 obst=2026.08.28 08:45 prot=2026.08.28 10:25 mode=nearest census=15898 zone=NOROW inval=[none before confirmation] LIVE
id=2184 obst=2026.08.28 11:30 prot=2026.08.28 11:50 mode=nearest census=16245 zone=NOROW inval=[kill line 16348 t=2026.08.28 13:40] DEAD(2026.08.28 13:40)
id=2187 obst=2026.08.28 11:50 prot=2026.08.28 12:15 mode=all census=16273 zone=NOROW inval=[kill line 16334 t=2026.08.28 13:30] DEAD(2026.08.28 13:30)
id=2191 obst=2026.08.28 12:30 prot=2026.08.28 12:45 mode=nearest census=16297 zone=NOROW inval=[kill line 16332 t=2026.08.28 13:30] DEAD(2026.08.28 13:30)
id=2217 obst=2026.08.28 16:25 prot=2026.08.28 17:00 mode=all census=18863 zone=1.16415-1.16436 [ZONEID 39589 + ZONEPICK 39591] inval=[none before confirmation] LIVE
  WP/WF: WProws=1934 WProvs=1 WFrows=6 WFovs=6 FIRST_WP=line 18865 bar=2026.08.28 17:00 o=1.16377 h=1.16589 l=1.16166 c=1.16198 [ENTERS] | FIRST_WF=line 18772 bar=2026.08.28 16:30 o=1.16433 h=1.16442 l=1.16426 c=1.1643 [ENTERS] | FORM=line 18766 bar=2026.08.28 16:25 o=1.1643 h=1.16436 l=1.16415 c=1.16432 | WIT=zero-only(n=20)
id=2224 obst=2026.08.28 17:30 prot=2026.08.28 18:45 mode=nearest census=20633 zone=1.16010-1.16103 [ZONEID 23797 + ZONEPICK 23799] inval=[kill line 24864 t=2026.08.31 17:40] DEAD(2026.08.31 17:40)
  WP/WF: WProws=1913 WProvs=251 WFrows=14 WFovs=11 FIRST_WP=line 20635 bar=2026.08.28 18:45 o=1.16003 h=1.16026 l=1.15971 c=1.1598 [ENTERS] | FIRST_WF=line 19716 bar=2026.08.28 17:35 o=1.16103 h=1.16116 l=1.16047 c=1.16053 [ENTERS] | FORM=line 19599 bar=2026.08.28 17:30 o=1.16017 h=1.16103 l=1.1601 c=1.16103 | WIT=INPLAYCOMMIT line 20753 bar=2026.08.28 18:45 firstShift=4 firstVal=1.16084 (n=1)
id=2233 obst=2026.08.28 18:40 prot=2026.08.28 19:10 mode=nearest census=21007 zone=1.15962-1.16003 [ZONEID 22102 + ZONEPICK 22104] inval=[kill line 22635 t=2026.08.31 10:45] DEAD(2026.08.31 10:45)
  WP/WF: WProws=1908 WProvs=168 WFrows=5 WFovs=4 FIRST_WP=line 22392 bar=2026.08.31 10:30 o=1.15942 h=1.15969 l=1.15937 c=1.15966 [ENTERS] | FIRST_WF=line 20635 bar=2026.08.28 18:45 o=1.16003 h=1.16026 l=1.15971 c=1.1598 [ENTERS] | FORM=line 20508 bar=2026.08.28 18:40 o=1.15994 h=1.16003 l=1.15962 c=1.16002 | WIT=zero-only(n=4)
id=2250 obst=2026.08.28 21:05 prot=2026.08.28 21:45 mode=nearest census=21141 zone=NOROW inval=[none before confirmation] LIVE
id=2268 obst=2026.08.28 23:25 prot=2026.08.28 23:40 mode=nearest census=21255 zone=NOROW inval=[kill line 21358 t=2026.08.31 01:40] DEAD(2026.08.31 01:40)
id=2262 obst=2026.08.28 22:35 prot=2026.08.28 23:40 mode=all census=21257 zone=NOROW inval=[kill line 21393 t=2026.08.31 02:25] DEAD(2026.08.31 02:25)
id=2264 obst=2026.08.28 22:50 prot=2026.08.28 23:40 mode=all census=21258 zone=NOROW inval=[kill line 21404 t=2026.08.31 02:35] DEAD(2026.08.31 02:35)
id=2333 obst=2026.08.31 08:25 prot=2026.08.31 08:40 mode=nearest census=21740 zone=NOROW inval=[none before confirmation] LIVE
id=2362 obst=2026.08.31 12:10 prot=2026.08.31 12:30 mode=nearest census=23623 zone=NOROW inval=[kill line 23637 t=2026.08.31 12:55] DEAD(2026.08.31 12:55)
id=2370 obst=2026.08.31 13:25 prot=2026.08.31 13:45 mode=nearest census=23684 zone=NOROW inval=[kill line 23734 t=2026.08.31 14:25] DEAD(2026.08.31 14:25)
id=2381 obst=2026.08.31 14:40 prot=2026.08.31 14:50 mode=nearest census=23821 zone=1.15994-1.16021 [census promoT=2026.08.31 14:50 unique + XOBINPLAY line 24025] inval=[kill line 24821 t=2026.08.31 17:15] DEAD(2026.08.31 17:15)
  WP/WF: WProws=1672 WProvs=93 WFrows=1 WFovs=1 FIRST_WP=line 23823 bar=2026.08.31 14:50 o=1.15978 h=1.15998 l=1.15972 c=1.1598 [ENTERS] | FIRST_WF=line 23773 bar=2026.08.31 14:45 o=1.16001 h=1.16002 l=1.15973 c=1.15977 [ENTERS] | FORM=line 23764 bar=2026.08.31 14:40 o=1.15994 h=1.16021 l=1.15994 c=1.15999 | WIT=zero-only(n=2)
id=2390 obst=2026.08.31 16:35 prot=2026.08.31 16:50 mode=nearest census=24780 zone=NOROW inval=[kill line 24787 t=2026.08.31 17:00] DEAD(2026.08.31 17:00)
id=2403 obst=2026.08.31 18:45 prot=2026.08.31 21:35 mode=nearest census=25129 zone=NOROW inval=[kill line 25436 t=2026.09.01 03:10] DEAD(2026.09.01 03:10)
id=2435 obst=2026.08.31 23:25 prot=2026.09.01 01:55 mode=nearest census=25367 zone=NOROW inval=[none before confirmation] LIVE
id=2451 obst=2026.09.01 01:55 prot=2026.09.01 02:10 mode=nearest census=25380 zone=NOROW inval=[none before confirmation] LIVE
id=2460 obst=2026.09.01 03:05 prot=2026.09.01 04:10 mode=nearest census=25497 zone=NOROW inval=[kill line 39270 t=2026.09.03 15:35] DEAD(2026.09.03 15:35)
id=2455 obst=2026.09.01 02:40 prot=2026.09.01 04:55 mode=all census=25535 zone=NOROW inval=[kill line 39271 t=2026.09.03 15:35] DEAD(2026.09.03 15:35)
id=2470 obst=2026.09.01 04:40 prot=2026.09.01 07:30 mode=all census=25658 zone=1.16100-1.16129 [census promoT=2026.09.01 07:30 unique + XOBINPLAY line 25778] inval=[none before confirmation] LIVE
  WP/WF: WProws=1472 WProvs=137 WFrows=33 WFovs=7 FIRST_WP=line 25732 bar=2026.09.01 08:45 o=1.16085 h=1.161 l=1.16081 c=1.16095 [ENTERS] | FIRST_WF=line 25527 bar=2026.09.01 04:45 o=1.16128 h=1.1613 l=1.16102 c=1.16103 [ENTERS] | FORM=line 25523 bar=2026.09.01 04:40 o=1.16106 h=1.16129 l=1.161 c=1.16129 | WIT=XOBINPLAY line 25778 bar=2026.09.01 09:05 firstShift=4 firstVal=1.16100 (n=2)
id=2495 obst=2026.09.01 08:45 prot=2026.09.01 09:15 mode=all census=26096 zone=1.16081-1.16100 [ZONEID 35102 + ZONEPICK 35104] inval=[none before confirmation] LIVE
  WP/WF: WProws=1451 WProvs=76 WFrows=5 WFovs=4 FIRST_WP=line 26098 bar=2026.09.01 09:15 o=1.16066 h=1.16081 l=1.16056 c=1.16057 [ENTERS] | FIRST_WF=line 25735 bar=2026.09.01 08:50 o=1.16095 h=1.16098 l=1.16077 c=1.16097 [ENTERS] | FORM=line 25732 bar=2026.09.01 08:45 o=1.16085 h=1.161 l=1.16081 c=1.16095 | WIT=INPLAYCOMMIT line 26140 bar=2026.09.01 09:15 firstShift=4 firstVal=1.16099 (n=7)
id=2395 obst=2026.08.31 17:35 prot=2026.09.01 09:35 mode=nearest census=26544 zone=NOROW inval=[none before confirmation] LIVE
id=2494 obst=2026.09.01 08:35 prot=2026.09.01 10:20 mode=all census=27281 zone=NOROW inval=[none before confirmation] LIVE
id=2510 obst=2026.09.01 10:45 prot=2026.09.01 11:15 mode=nearest census=27396 zone=NOROW inval=[none before confirmation] LIVE
id=2529 obst=2026.09.01 13:45 prot=2026.09.01 15:10 mode=nearest census=27886 zone=NOROW inval=[none before confirmation] LIVE
id=2554 obst=2026.09.01 18:05 prot=2026.09.01 18:20 mode=nearest census=30055 zone=NOROW inval=[none before confirmation] LIVE
id=2559 obst=2026.09.01 18:55 prot=2026.09.01 19:25 mode=nearest census=30161 zone=NOROW inval=[none before confirmation] LIVE
id=2571 obst=2026.09.01 21:00 prot=2026.09.01 21:20 mode=nearest census=30273 zone=NOROW inval=[kill line 30272 t=2026.09.01 21:25] DEAD(2026.09.01 21:25)
id=2606 obst=2026.09.02 02:10 prot=2026.09.02 02:30 mode=nearest census=30540 zone=NOROW inval=[kill line 33704 t=2026.09.02 16:30] DEAD(2026.09.02 16:30)
id=2593 obst=2026.09.02 00:25 prot=2026.09.02 03:15 mode=nearest census=30579 zone=NOROW inval=[none before confirmation] LIVE
id=2615 obst=2026.09.02 03:20 prot=2026.09.02 03:35 mode=nearest census=30599 zone=NOROW inval=[kill line 33689 t=2026.09.02 16:25] DEAD(2026.09.02 16:25)
id=2620 obst=2026.09.02 03:50 prot=2026.09.02 04:05 mode=nearest census=30627 zone=1.15844-1.15857 [census promoT=2026.09.02 04:05 unique + XOBINPLAY line 32654] inval=[kill line 33687 t=2026.09.02 16:25] DEAD(2026.09.02 16:25)
  WP/WF: WProws=1225 WProvs=54 WFrows=2 WFovs=1 FIRST_WP=line 30940 bar=2026.09.02 09:10 o=1.15827 h=1.15849 l=1.1582 c=1.15824 [ENTERS] | FIRST_WF=line 30619 bar=2026.09.02 03:55 o=1.15854 h=1.1586 l=1.1583 c=1.15831 [ENTERS] | FORM=line 30614 bar=2026.09.02 03:50 o=1.15851 h=1.15857 l=1.15844 c=1.15853 | WIT=XOBINPLAY line 32654 bar=2026.09.02 15:40 firstShift=4 firstVal=1.15856 (n=2)
id=2284 obst=2026.08.31 01:45 prot=2026.09.02 04:35 mode=all census=30659 zone=NOROW inval=[kill line 33691 t=2026.09.02 16:25] DEAD(2026.09.02 16:25)
id=2345 obst=2026.08.31 09:55 prot=2026.09.02 04:35 mode=all census=30660 zone=NOROW inval=[kill line 33690 t=2026.09.02 16:25] DEAD(2026.09.02 16:25)
id=2636 obst=2026.09.02 05:55 prot=2026.09.02 06:55 mode=all census=30796 zone=NOROW inval=[kill line 30930 t=2026.09.02 09:10] DEAD(2026.09.02 09:10)
id=2638 obst=2026.09.02 06:45 prot=2026.09.02 07:15 mode=nearest census=30817 zone=NOROW inval=[kill line 30885 t=2026.09.02 08:30] DEAD(2026.09.02 08:30)
id=2640 obst=2026.09.02 07:10 prot=2026.09.02 07:25 mode=nearest census=30827 zone=NOROW inval=[none before confirmation] LIVE
id=2652 obst=2026.09.02 09:00 prot=2026.09.02 09:40 mode=all census=31010 zone=NOROW inval=[kill line 31592 t=2026.09.02 11:40] DEAD(2026.09.02 11:40)
id=2657 obst=2026.09.02 09:20 prot=2026.09.02 09:40 mode=all census=31011 zone=NOROW inval=[kill line 31192 t=2026.09.02 11:05] DEAD(2026.09.02 11:05)
id=2659 obst=2026.09.02 09:40 prot=2026.09.02 09:55 mode=nearest census=31044 zone=NOROW inval=[kill line 31132 t=2026.09.02 10:40] DEAD(2026.09.02 10:40)
id=2674 obst=2026.09.02 11:35 prot=2026.09.02 11:55 mode=nearest census=31815 zone=1.15788-1.15818 [census promoT=2026.09.02 11:55 unique + XOBINPLAY line 32337] inval=[none before confirmation] LIVE
  WP/WF: WProws=1131 WProvs=18 WFrows=3 WFovs=3 FIRST_WP=line 32173 bar=2026.09.02 14:35 o=1.15759 h=1.15791 l=1.15746 c=1.15783 [ENTERS] | FIRST_WF=line 31604 bar=2026.09.02 11:40 o=1.15814 h=1.15822 l=1.15802 c=1.15807 [ENTERS] | FORM=line 31595 bar=2026.09.02 11:35 o=1.15791 h=1.15818 l=1.15788 c=1.15816 | WIT=XOBINPLAY line 32337 bar=2026.09.02 14:40 firstShift=1 firstVal=1.15791 (n=2)
id=2682 obst=2026.09.02 12:25 prot=2026.09.02 13:00 mode=nearest census=32018 zone=NOROW inval=[kill line 32114 t=2026.09.02 14:15] DEAD(2026.09.02 14:15)
id=2697 obst=2026.09.02 15:20 prot=2026.09.02 15:45 mode=nearest census=32677 zone=NOROW inval=[none before confirmation] LIVE
id=2726 obst=2026.09.02 19:10 prot=2026.09.02 19:30 mode=nearest census=37124 zone=NOROW inval=[kill line 37618 t=2026.09.03 04:35] DEAD(2026.09.03 04:35)
id=2724 obst=2026.09.02 18:55 prot=2026.09.02 20:15 mode=nearest census=37163 zone=NOROW inval=[kill line 37611 t=2026.09.03 04:30] DEAD(2026.09.03 04:30)
id=2710 obst=2026.09.02 16:40 prot=2026.09.02 21:45 mode=all census=37236 zone=NOROW inval=[kill line 37619 t=2026.09.03 04:35] DEAD(2026.09.03 04:35)
id=2769 obst=2026.09.03 01:50 prot=2026.09.03 02:10 mode=all census=37485 zone=NOROW inval=[kill line 37549 t=2026.09.03 03:25] DEAD(2026.09.03 03:25)
id=2825 obst=2026.09.03 10:30 prot=2026.09.03 10:45 mode=nearest census=38505 zone=1.16044-1.16063 [census promoT=2026.09.03 10:45 unique + XOBINPLAY line 38549] inval=[none before confirmation] LIVE
  WP/WF: WProws=857 WProvs=34 WFrows=2 WFovs=1 FIRST_WP=line 38507 bar=2026.09.03 10:45 o=1.16023 h=1.1605 l=1.16018 c=1.16027 [ENTERS] | FIRST_WF=line 38490 bar=2026.09.03 10:35 o=1.16054 h=1.16081 l=1.16018 c=1.1603 [ENTERS] | FORM=line 38482 bar=2026.09.03 10:30 o=1.16048 h=1.16063 l=1.16044 c=1.16054 | WIT=zero-only(n=2)
id=2845 obst=2026.09.03 13:20 prot=2026.09.03 13:40 mode=nearest census=39046 zone=NOROW inval=[none before confirmation] LIVE
id=2868 obst=2026.09.03 16:10 prot=2026.09.03 16:50 mode=all census=39401 zone=NOROW inval=[none before confirmation] LIVE
id=2896 obst=2026.09.03 20:20 prot=2026.09.03 20:50 mode=all census=39926 zone=NOROW inval=[none before confirmation] LIVE
id=2898 obst=2026.09.03 20:30 prot=2026.09.03 21:35 mode=all census=39972 zone=1.16362-1.16377 [ZONEID 52292 + ZONEPICK 52294] inval=[none before confirmation] [PICK] LIVE
  WP/WF: WProws=727 WProvs=0 WFrows=12 WFovs=5 FIRST_WP=NONE | FIRST_WF=line 39914 bar=2026.09.03 20:35 o=1.16373 h=1.16379 l=1.16363 c=1.16365 [ENTERS] | FORM=line 39910 bar=2026.09.03 20:30 o=1.1637 h=1.16377 l=1.16362 c=1.16371 | WIT=INPLAYCOMMIT line 48794 bar=2026.09.07 15:05 firstShift=500 firstVal=1.16364 (n=5) [PICK]
id=2920 obst=2026.09.03 23:45 prot=2026.09.04 00:05 mode=nearest census=40109 zone=NOROW inval=[none before confirmation] LIVE
id=2965 obst=2026.09.04 06:10 prot=2026.09.04 06:35 mode=nearest census=40470 zone=NOROW inval=[kill line 40571 t=2026.09.04 08:35] DEAD(2026.09.04 08:35)
id=2939 obst=2026.09.04 02:30 prot=2026.09.04 06:50 mode=nearest census=40486 zone=NOROW inval=[none before confirmation] LIVE
id=2973 obst=2026.09.04 07:35 prot=2026.09.04 11:00 mode=nearest census=41526 zone=1.16245-1.16275 [census promoT=2026.09.04 11:00 unique + XOBINPLAY line 41544] inval=[kill line 48135 t=2026.09.07 11:10] DEAD(2026.09.07 11:10)
  WP/WF: WProws=566 WProvs=169 WFrows=40 WFovs=30 FIRST_WP=line 42873 bar=2026.09.04 11:45 o=1.16236 h=1.16248 l=1.16233 c=1.16241 [ENTERS] | FIRST_WF=line 40533 bar=2026.09.04 07:40 o=1.16274 h=1.16274 l=1.16265 c=1.1627 [ENTERS] | FORM=line 40528 bar=2026.09.04 07:35 o=1.16246 h=1.16275 l=1.16245 c=1.16273 | WIT=INPLAYCOMMIT line 43378 bar=2026.09.04 15:30 firstShift=58 firstVal=1.16260 (n=1)
id=2971 obst=2026.09.04 07:00 prot=2026.09.04 11:15 mode=nearest census=41890 zone=NOROW inval=[none before confirmation] LIVE
id=2998 obst=2026.09.04 11:55 prot=2026.09.04 14:20 mode=all census=43204 zone=NOROW inval=[kill line 43310 t=2026.09.04 15:30] DEAD(2026.09.04 15:30)
id=3021 obst=2026.09.04 15:25 prot=2026.09.04 15:40 mode=nearest census=43801 zone=NOROW inval=[kill line 48133 t=2026.09.07 11:10] DEAD(2026.09.07 11:10)
id=3041 obst=2026.09.04 17:40 prot=2026.09.04 17:55 mode=nearest census=45106 zone=NOROW inval=[kill line 45168 t=2026.09.04 18:15] DEAD(2026.09.04 18:15)
id=3056 obst=2026.09.04 20:15 prot=2026.09.04 20:30 mode=nearest census=45680 zone=NOROW inval=[kill line 46611 t=2026.09.07 03:30] DEAD(2026.09.07 03:30)
id=3061 obst=2026.09.04 20:50 prot=2026.09.04 21:00 mode=nearest census=45786 zone=NOROW inval=[kill line 46066 t=2026.09.04 22:25] DEAD(2026.09.04 22:25)
id=3073 obst=2026.09.04 22:50 prot=2026.09.04 23:15 mode=nearest census=46264 zone=NOROW inval=[kill line 46540 t=2026.09.07 02:15] DEAD(2026.09.07 02:15)
id=3079 obst=2026.09.04 23:50 prot=2026.09.07 00:25 mode=all census=46448 zone=NOROW inval=[none before confirmation] LIVE
id=3096 obst=2026.09.07 02:40 prot=2026.09.07 02:55 mode=nearest census=46583 zone=NOROW inval=[none before confirmation] LIVE
id=3137 obst=2026.09.07 09:30 prot=2026.09.07 10:05 mode=nearest census=47894 zone=NOROW inval=[kill line 47999 t=2026.09.07 10:35] DEAD(2026.09.07 10:35)
id=3173 obst=2026.09.07 14:05 prot=2026.09.07 14:15 mode=all census=48362 zone=NOROW inval=[none before confirmation] LIVE
id=3195 obst=2026.09.07 17:35 prot=2026.09.07 17:55 mode=nearest census=50737 zone=NOROW inval=[none before confirmation] LIVE
id=3199 obst=2026.09.07 17:55 prot=2026.09.07 18:15 mode=nearest census=50780 zone=NOROW inval=[none before confirmation] LIVE
id=3186 obst=2026.09.07 16:30 prot=2026.09.07 21:30 mode=nearest census=50980 zone=NOROW inval=[kill line 51176 t=2026.09.08 01:30] DEAD(2026.09.08 01:30)
id=3226 obst=2026.09.07 23:30 prot=2026.09.08 00:05 mode=all census=51109 zone=NOROW inval=[none before confirmation] LIVE
id=3256 obst=2026.09.08 04:05 prot=2026.09.08 05:40 mode=nearest census=51420 zone=NOROW inval=[kill line 51599 t=2026.09.08 08:50] DEAD(2026.09.08 08:50)
id=3293 obst=2026.09.08 09:20 prot=2026.09.08 09:40 mode=nearest census=52008 zone=NOROW inval=[none before confirmation] LIVE
## --- A7 SHORT conf=2026.09.08 16:55 pick=2898
COUNT live-candidate=222
id=5 obst=2026.08.11 14:25 prot=2026.08.11 14:50 mode=nearest census=243 zone=NOROW inval=[kill line 244 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=42 obst=2026.08.11 19:05 prot=2026.08.11 19:25 mode=nearest census=283 zone=NOROW inval=[none before confirmation] LIVE
id=46 obst=2026.08.11 19:35 prot=2026.08.11 20:00 mode=nearest census=286 zone=NOROW inval=[kill line 297 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=89 obst=2026.08.12 02:05 prot=2026.08.12 02:20 mode=nearest census=324 zone=NOROW inval=[none before confirmation] LIVE
id=101 obst=2026.08.12 03:55 prot=2026.08.12 04:10 mode=nearest census=338 zone=NOROW inval=[none before confirmation] LIVE
id=111 obst=2026.08.12 05:05 prot=2026.08.12 05:20 mode=nearest census=346 zone=NOROW inval=[none before confirmation] LIVE
id=124 obst=2026.08.12 06:35 prot=2026.08.12 06:50 mode=nearest census=357 zone=NOROW inval=[kill line 382 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=118 obst=2026.08.12 05:55 prot=2026.08.12 07:15 mode=all census=363 zone=NOROW inval=[kill line 387 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=120 obst=2026.08.12 06:05 prot=2026.08.12 07:15 mode=all census=364 zone=NOROW inval=[kill line 386 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=137 obst=2026.08.12 07:55 prot=2026.08.12 08:10 mode=nearest census=375 zone=NOROW inval=[kill line 381 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=170 obst=2026.08.12 13:25 prot=2026.08.12 13:50 mode=all census=429 zone=NOROW inval=[kill line 433 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=168 obst=2026.08.12 13:00 prot=2026.08.12 13:55 mode=nearest census=430 zone=NOROW inval=[none before confirmation] LIVE
id=187 obst=2026.08.12 16:05 prot=2026.08.12 16:20 mode=nearest census=445 zone=NOROW inval=[kill line 763 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=203 obst=2026.08.12 18:20 prot=2026.08.12 19:20 mode=all census=465 zone=NOROW inval=[kill line 599 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=219 obst=2026.08.12 20:25 prot=2026.08.12 20:45 mode=nearest census=472 zone=NOROW inval=[kill line 494 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=267 obst=2026.08.13 04:30 prot=2026.08.13 04:50 mode=nearest census=511 zone=NOROW inval=[kill line 568 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=263 obst=2026.08.13 03:55 prot=2026.08.13 04:50 mode=all census=513 zone=NOROW inval=[none before confirmation] LIVE
id=286 obst=2026.08.13 07:55 prot=2026.08.13 09:15 mode=nearest census=537 zone=NOROW inval=[kill line 552 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=297 obst=2026.08.13 09:15 prot=2026.08.13 09:35 mode=nearest census=540 zone=NOROW inval=[kill line 544 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=309 obst=2026.08.13 10:50 prot=2026.08.13 11:10 mode=nearest census=556 zone=NOROW inval=[none before confirmation] LIVE
id=330 obst=2026.08.13 13:35 prot=2026.08.13 13:55 mode=nearest census=574 zone=NOROW inval=[none before confirmation] LIVE
id=336 obst=2026.08.13 14:45 prot=2026.08.13 15:00 mode=nearest census=584 zone=NOROW inval=[none before confirmation] LIVE
id=339 obst=2026.08.13 15:05 prot=2026.08.13 15:40 mode=all census=592 zone=NOROW inval=[none before confirmation] LIVE
id=347 obst=2026.08.13 15:55 prot=2026.08.13 16:30 mode=nearest census=610 zone=NOROW inval=[none before confirmation] LIVE
id=367 obst=2026.08.13 18:35 prot=2026.08.13 19:00 mode=nearest census=627 zone=NOROW inval=[kill line 684 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=353 obst=2026.08.13 16:50 prot=2026.08.13 19:15 mode=all census=632 zone=NOROW inval=[kill line 682 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=364 obst=2026.08.13 18:20 prot=2026.08.13 19:15 mode=all census=633 zone=NOROW inval=[kill line 685 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=370 obst=2026.08.13 19:00 prot=2026.08.13 19:20 mode=nearest census=634 zone=NOROW inval=[none before confirmation] LIVE
id=392 obst=2026.08.13 22:25 prot=2026.08.13 22:45 mode=all census=653 zone=NOROW inval=[kill line 680 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=387 obst=2026.08.13 21:35 prot=2026.08.13 22:50 mode=nearest census=654 zone=NOROW inval=[kill line 674 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=395 obst=2026.08.13 23:00 prot=2026.08.13 23:15 mode=nearest census=659 zone=NOROW inval=[none before confirmation] LIVE
id=442 obst=2026.08.14 05:40 prot=2026.08.14 05:55 mode=nearest census=699 zone=NOROW inval=[none before confirmation] LIVE
id=490 obst=2026.08.14 12:20 prot=2026.08.14 12:40 mode=nearest census=749 zone=NOROW inval=[none before confirmation] LIVE
id=513 obst=2026.08.14 15:30 prot=2026.08.14 15:45 mode=nearest census=776 zone=NOROW inval=[kill line 783 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=515 obst=2026.08.14 15:45 prot=2026.08.14 16:05 mode=nearest census=780 zone=NOROW inval=[none before confirmation] LIVE
id=542 obst=2026.08.14 19:15 prot=2026.08.14 19:35 mode=nearest census=802 zone=NOROW inval=[kill line 854 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=539 obst=2026.08.14 18:45 prot=2026.08.14 20:45 mode=all census=808 zone=NOROW inval=[kill line 872 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=557 obst=2026.08.14 21:05 prot=2026.08.14 21:20 mode=nearest census=813 zone=NOROW inval=[none before confirmation] LIVE
id=622 obst=2026.08.17 05:25 prot=2026.08.17 05:40 mode=nearest census=880 zone=NOROW inval=[kill line 893 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=625 obst=2026.08.17 05:35 prot=2026.08.17 06:00 mode=nearest census=883 zone=NOROW inval=[kill line 889 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=677 obst=2026.08.17 12:25 prot=2026.08.17 12:50 mode=all census=931 zone=NOROW inval=[kill line 1302 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=709 obst=2026.08.17 16:30 prot=2026.08.17 16:40 mode=all census=965 zone=NOROW inval=[none before confirmation] LIVE
id=735 obst=2026.08.17 19:35 prot=2026.08.17 20:00 mode=nearest census=994 zone=NOROW inval=[kill line 1290 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=737 obst=2026.08.17 20:00 prot=2026.08.17 20:20 mode=nearest census=997 zone=NOROW inval=[kill line 1289 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=740 obst=2026.08.17 20:25 prot=2026.08.17 20:40 mode=all census=1003 zone=NOROW inval=[kill line 1048 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=747 obst=2026.08.17 21:10 prot=2026.08.17 21:30 mode=nearest census=1007 zone=NOROW inval=[kill line 1010 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=796 obst=2026.08.18 03:15 prot=2026.08.18 03:30 mode=nearest census=1054 zone=NOROW inval=[kill line 1061 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=794 obst=2026.08.18 03:00 prot=2026.08.18 03:30 mode=all census=1056 zone=NOROW inval=[kill line 1062 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=800 obst=2026.08.18 03:35 prot=2026.08.18 05:05 mode=all census=1072 zone=NOROW inval=[kill line 1160 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=811 obst=2026.08.18 04:50 prot=2026.08.18 05:05 mode=all census=1073 zone=NOROW inval=[kill line 1158 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=756 obst=2026.08.17 22:00 prot=2026.08.18 06:45 mode=nearest census=1089 zone=NOROW inval=[kill line 1100 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=752 obst=2026.08.17 21:35 prot=2026.08.18 07:20 mode=nearest census=1096 zone=NOROW inval=[none before confirmation] LIVE
id=850 obst=2026.08.18 10:45 prot=2026.08.18 11:05 mode=nearest census=1118 zone=NOROW inval=[none before confirmation] LIVE
id=858 obst=2026.08.18 11:55 prot=2026.08.18 12:10 mode=nearest census=1124 zone=NOROW inval=[kill line 1125 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=871 obst=2026.08.18 13:55 prot=2026.08.18 14:50 mode=all census=1134 zone=NOROW inval=[none before confirmation] LIVE
id=875 obst=2026.08.18 14:35 prot=2026.08.18 15:40 mode=nearest census=1151 zone=NOROW inval=[none before confirmation] LIVE
id=909 obst=2026.08.18 19:40 prot=2026.08.18 20:05 mode=nearest census=1185 zone=NOROW inval=[kill line 1255 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=900 obst=2026.08.18 18:35 prot=2026.08.18 20:15 mode=nearest census=1188 zone=NOROW inval=[kill line 1201 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=926 obst=2026.08.18 22:10 prot=2026.08.18 23:05 mode=nearest census=1209 zone=NOROW inval=[kill line 1219 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=948 obst=2026.08.19 00:30 prot=2026.08.19 00:50 mode=nearest census=1224 zone=NOROW inval=[kill line 1230 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=968 obst=2026.08.19 03:10 prot=2026.08.19 03:40 mode=nearest census=1239 zone=NOROW inval=[kill line 1253 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=973 obst=2026.08.19 03:50 prot=2026.08.19 04:05 mode=nearest census=1248 zone=NOROW inval=[kill line 1250 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=998 obst=2026.08.19 06:25 prot=2026.08.19 06:40 mode=nearest census=1268 zone=NOROW inval=[kill line 1277 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=996 obst=2026.08.19 06:10 prot=2026.08.19 07:00 mode=nearest census=1271 zone=NOROW inval=[none before confirmation] LIVE
id=1045 obst=2026.08.19 13:40 prot=2026.08.19 14:00 mode=nearest census=1318 zone=NOROW inval=[kill line 1330 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1050 obst=2026.08.19 14:30 prot=2026.08.19 14:45 mode=nearest census=1323 zone=NOROW inval=[kill line 1325 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1077 obst=2026.08.19 17:35 prot=2026.08.19 17:55 mode=nearest census=1344 zone=NOROW inval=[kill line 1374 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1081 obst=2026.08.19 18:10 prot=2026.08.19 18:30 mode=nearest census=1350 zone=NOROW inval=[none before confirmation] LIVE
id=1092 obst=2026.08.19 19:30 prot=2026.08.19 20:15 mode=nearest census=1360 zone=NOROW inval=[kill line 1367 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1099 obst=2026.08.19 21:10 prot=2026.08.19 21:25 mode=nearest census=1370 zone=NOROW inval=[none before confirmation] LIVE
id=1127 obst=2026.08.20 01:00 prot=2026.08.20 02:20 mode=nearest census=1395 zone=NOROW inval=[none before confirmation] LIVE
id=1168 obst=2026.08.20 07:05 prot=2026.08.20 07:25 mode=nearest census=1440 zone=NOROW inval=[kill line 1455 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1217 obst=2026.08.20 13:25 prot=2026.08.20 13:45 mode=nearest census=1485 zone=NOROW inval=[kill line 1667 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1212 obst=2026.08.20 12:50 prot=2026.08.20 13:50 mode=nearest census=1488 zone=NOROW inval=[kill line 1666 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1223 obst=2026.08.20 13:55 prot=2026.08.20 14:15 mode=nearest census=1491 zone=NOROW inval=[kill line 1610 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1202 obst=2026.08.20 11:50 prot=2026.08.20 14:45 mode=all census=1498 zone=NOROW inval=[kill line 1615 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1229 obst=2026.08.20 14:30 prot=2026.08.20 14:50 mode=nearest census=1499 zone=NOROW inval=[kill line 1609 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1244 obst=2026.08.20 16:15 prot=2026.08.20 16:30 mode=nearest census=1509 zone=NOROW inval=[kill line 1524 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1248 obst=2026.08.20 16:50 prot=2026.08.20 17:15 mode=all census=1517 zone=NOROW inval=[none before confirmation] LIVE
id=1255 obst=2026.08.20 18:00 prot=2026.08.20 18:40 mode=all census=1536 zone=NOROW inval=[kill line 1583 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1258 obst=2026.08.20 18:25 prot=2026.08.20 18:45 mode=nearest census=1537 zone=NOROW inval=[none before confirmation] LIVE
id=1352 obst=2026.08.21 08:10 prot=2026.08.21 08:25 mode=nearest census=1632 zone=NOROW inval=[none before confirmation] LIVE
id=1369 obst=2026.08.21 10:30 prot=2026.08.21 10:50 mode=nearest census=1658 zone=NOROW inval=[none before confirmation] LIVE
id=1389 obst=2026.08.21 13:35 prot=2026.08.21 13:55 mode=nearest census=1681 zone=NOROW inval=[none before confirmation] LIVE
id=1403 obst=2026.08.21 15:20 prot=2026.08.21 15:35 mode=nearest census=1697 zone=NOROW inval=[none before confirmation] LIVE
id=1401 obst=2026.08.21 14:55 prot=2026.08.21 15:40 mode=all census=1698 zone=NOROW inval=[none before confirmation] LIVE
id=1320 obst=2026.08.21 04:00 prot=2026.08.21 16:30 mode=nearest census=1706 zone=NOROW inval=[none before confirmation] LIVE
id=1416 obst=2026.08.21 17:10 prot=2026.08.21 17:30 mode=nearest census=1719 zone=NOROW inval=[kill line 1727 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1299 obst=2026.08.21 01:00 prot=2026.08.21 17:35 mode=all census=1721 zone=NOROW inval=[kill line 1728 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1414 obst=2026.08.21 16:50 prot=2026.08.21 17:35 mode=all census=1722 zone=NOROW inval=[kill line 1732 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1430 obst=2026.08.21 19:20 prot=2026.08.21 20:10 mode=nearest census=1741 zone=NOROW inval=[kill line 1787 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1450 obst=2026.08.21 21:55 prot=2026.08.21 22:15 mode=nearest census=1759 zone=NOROW inval=[kill line 1786 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1468 obst=2026.08.24 01:25 prot=2026.08.24 01:45 mode=nearest census=1777 zone=NOROW inval=[kill line 1783 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1481 obst=2026.08.24 03:20 prot=2026.08.24 04:10 mode=all census=1794 zone=NOROW inval=[none before confirmation] LIVE
id=1484 obst=2026.08.24 03:55 prot=2026.08.24 04:20 mode=nearest census=1796 zone=NOROW inval=[none before confirmation] LIVE
id=1495 obst=2026.08.24 05:20 prot=2026.08.24 05:35 mode=nearest census=1799 zone=NOROW inval=[none before confirmation] LIVE
id=1503 obst=2026.08.24 06:20 prot=2026.08.24 06:50 mode=nearest census=1807 zone=NOROW inval=[kill line 1814 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1506 obst=2026.08.24 06:50 prot=2026.08.24 07:10 mode=nearest census=1811 zone=NOROW inval=[none before confirmation] LIVE
id=1516 obst=2026.08.24 08:15 prot=2026.08.24 08:45 mode=nearest census=1823 zone=NOROW inval=[none before confirmation] LIVE
id=1508 obst=2026.08.24 07:10 prot=2026.08.24 09:30 mode=nearest census=1835 zone=NOROW inval=[none before confirmation] LIVE
id=1552 obst=2026.08.24 13:15 prot=2026.08.24 14:05 mode=all census=1878 zone=NOROW inval=[none before confirmation] LIVE
id=1589 obst=2026.08.24 18:45 prot=2026.08.24 19:00 mode=nearest census=1917 zone=NOROW inval=[none before confirmation] LIVE
id=1594 obst=2026.08.24 19:35 prot=2026.08.24 20:05 mode=all census=1926 zone=NOROW inval=[none before confirmation] LIVE
id=1591 obst=2026.08.24 19:00 prot=2026.08.24 20:25 mode=all census=1930 zone=NOROW inval=[none before confirmation] LIVE
id=1626 obst=2026.08.24 23:45 prot=2026.08.25 00:10 mode=nearest census=1962 zone=NOROW inval=[none before confirmation] LIVE
id=1644 obst=2026.08.25 02:15 prot=2026.08.25 02:35 mode=nearest census=1975 zone=NOROW inval=[none before confirmation] LIVE
id=1658 obst=2026.08.25 04:35 prot=2026.08.25 04:55 mode=nearest census=1989 zone=NOROW inval=[kill line 2046 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1664 obst=2026.08.25 05:35 prot=2026.08.25 06:00 mode=nearest census=1993 zone=NOROW inval=[kill line 2027 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1672 obst=2026.08.25 06:55 prot=2026.08.25 07:10 mode=nearest census=1998 zone=NOROW inval=[kill line 2024 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1656 obst=2026.08.25 04:25 prot=2026.08.25 08:50 mode=all census=2010 zone=NOROW inval=[kill line 2047 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1660 obst=2026.08.25 05:05 prot=2026.08.25 08:50 mode=all census=2011 zone=NOROW inval=[none before confirmation] LIVE
id=1670 obst=2026.08.25 06:40 prot=2026.08.25 08:50 mode=all census=2012 zone=NOROW inval=[kill line 2025 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1714 obst=2026.08.25 12:30 prot=2026.08.25 15:00 mode=all census=2078 zone=NOROW inval=[kill line 2086 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1715 obst=2026.08.25 12:45 prot=2026.08.25 15:00 mode=all census=2079 zone=NOROW inval=[kill line 2085 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1752 obst=2026.08.25 18:30 prot=2026.08.25 19:25 mode=nearest census=2113 zone=NOROW inval=[kill line 2118 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1768 obst=2026.08.25 21:05 prot=2026.08.25 22:35 mode=all census=2143 zone=NOROW inval=[none before confirmation] LIVE
id=1765 obst=2026.08.25 20:35 prot=2026.08.25 22:45 mode=nearest census=2146 zone=NOROW inval=[none before confirmation] LIVE
id=1784 obst=2026.08.25 23:05 prot=2026.08.25 23:40 mode=nearest census=2152 zone=NOROW inval=[none before confirmation] LIVE
id=1796 obst=2026.08.26 01:00 prot=2026.08.26 05:25 mode=all census=2466 zone=NOROW inval=[kill line 4687 t=2026.08.26 11:10] DEAD(2026.08.26 11:10)
id=1821 obst=2026.08.26 05:00 prot=2026.08.26 05:25 mode=all census=2467 zone=NOROW inval=[kill line 4064 t=2026.08.26 10:40] DEAD(2026.08.26 10:40)
id=1822 obst=2026.08.26 05:10 prot=2026.08.26 05:25 mode=all census=2468 zone=NOROW inval=[kill line 4686 t=2026.08.26 11:10] DEAD(2026.08.26 11:10)
id=1825 obst=2026.08.26 05:40 prot=2026.08.26 06:00 mode=nearest census=2497 zone=NOROW inval=[kill line 3626 t=2026.08.26 10:20] DEAD(2026.08.26 10:20)
id=1835 obst=2026.08.26 06:35 prot=2026.08.26 06:55 mode=nearest census=2544 zone=NOROW inval=[kill line 2629 t=2026.08.26 08:35] DEAD(2026.08.26 08:35)
id=1833 obst=2026.08.26 06:25 prot=2026.08.26 08:55 mode=nearest census=2657 zone=1.16660-1.16682 [census promoT=2026.08.26 08:55 unique + XOBINPLAY line 2712] inval=[kill line 3407 t=2026.08.26 10:05] DEAD(2026.08.26 10:05)
  WP/WF: WProws=2689 WProvs=26 WFrows=29 WFovs=8 FIRST_WP=line 3386 bar=2026.08.26 09:55 o=1.16652 h=1.16674 l=1.16641 c=1.16668 [ENTERS] | FIRST_WF=line 2525 bar=2026.08.26 06:30 o=1.16661 h=1.16662 l=1.16636 c=1.16641 [ENTERS] | FORM=line 2517 bar=2026.08.26 06:25 o=1.1666 h=1.16682 l=1.1666 c=1.16663 | WIT=INPLAYCOMMIT line 2726 bar=2026.08.26 09:10 firstShift=6 firstVal=1.16667 (n=1)
id=1866 obst=2026.08.26 11:45 prot=2026.08.26 12:00 mode=nearest census=5353 zone=NOROW inval=[kill line 5838 t=2026.08.26 15:20] DEAD(2026.08.26 15:20)
id=1871 obst=2026.08.26 12:30 prot=2026.08.26 14:25 mode=all census=5510 zone=NOROW inval=[kill line 5562 t=2026.08.26 14:50] DEAD(2026.08.26 14:50)
id=1881 obst=2026.08.26 14:10 prot=2026.08.26 14:25 mode=all census=5511 zone=NOROW inval=[none before confirmation] LIVE
id=1704 obst=2026.08.25 11:20 prot=2026.08.26 16:00 mode=all census=6312 zone=NOROW inval=[none before confirmation] LIVE
id=1728 obst=2026.08.25 15:00 prot=2026.08.26 16:00 mode=all census=6313 zone=NOROW inval=[none before confirmation] LIVE
id=1891 obst=2026.08.26 15:45 prot=2026.08.26 16:00 mode=all census=6314 zone=1.16612-1.16640 [ZONEID 13317 + ZONEPICK 13319] inval=[none before confirmation] LIVE
  WP/WF: WProws=2604 WProvs=0 WFrows=2 WFovs=2 FIRST_WP=NONE | FIRST_WF=line 6271 bar=2026.08.26 15:50 o=1.1664 h=1.16652 l=1.16578 c=1.16607 [ENTERS] | FORM=line 6262 bar=2026.08.26 15:45 o=1.16635 h=1.1664 l=1.16612 c=1.16638 | WIT=zero-only(n=76)
id=1072 obst=2026.08.19 16:50 prot=2026.08.26 17:10 mode=nearest census=7786 zone=NOROW inval=[none before confirmation] LIVE
id=1937 obst=2026.08.26 22:55 prot=2026.08.27 00:05 mode=nearest census=9572 zone=NOROW inval=[none before confirmation] LIVE
id=1992 obst=2026.08.27 08:40 prot=2026.08.27 09:00 mode=nearest census=10056 zone=NOROW inval=[kill line 11105 t=2026.08.27 11:05] DEAD(2026.08.27 11:05)
id=2003 obst=2026.08.27 10:10 prot=2026.08.27 10:30 mode=nearest census=10985 zone=1.16544-1.16560 [census promoT=2026.08.27 10:30 unique + XOBINPLAY line 11022] inval=[kill line 11104 t=2026.08.27 11:05] DEAD(2026.08.27 11:05)
  WP/WF: WProws=2382 WProvs=24 WFrows=3 WFovs=2 FIRST_WP=line 10997 bar=2026.08.27 10:35 o=1.1652 h=1.16546 l=1.1652 c=1.1653 [ENTERS] | FIRST_WF=line 10853 bar=2026.08.27 10:15 o=1.16555 h=1.16555 l=1.16544 c=1.16555 [EQUAL-EDGE] | FORM=line 10801 bar=2026.08.27 10:10 o=1.16547 h=1.1656 l=1.16544 c=1.16555 | WIT=INPLAYCOMMIT line 11035 bar=2026.08.27 10:35 firstShift=5 firstVal=1.16560 (n=1)
id=2054 obst=2026.08.27 17:05 prot=2026.08.27 17:30 mode=nearest census=13333 zone=1.16515-1.16578 [census promoT=2026.08.27 17:30 unique + XOBINPLAY line 13443] inval=[kill line 15134 t=2026.08.28 04:40] DEAD(2026.08.28 04:40)
  WP/WF: WProws=2298 WProvs=88 WFrows=4 WFovs=3 FIRST_WP=line 13335 bar=2026.08.27 17:30 o=1.1649 h=1.16519 l=1.16488 c=1.16519 [ENTERS] | FIRST_WF=line 12862 bar=2026.08.27 17:10 o=1.16556 h=1.16557 l=1.16504 c=1.16515 [ENTERS] | FORM=line 12736 bar=2026.08.27 17:05 o=1.16524 h=1.16578 l=1.16515 c=1.16557 | WIT=INPLAYCOMMIT line 13450 bar=2026.08.27 17:30 firstShift=5 firstVal=1.16578 (n=1)
id=2077 obst=2026.08.27 20:20 prot=2026.08.27 20:40 mode=all census=14701 zone=NOROW inval=[kill line 14833 t=2026.08.27 23:10] DEAD(2026.08.27 23:10)
id=2088 obst=2026.08.27 22:15 prot=2026.08.27 22:55 mode=nearest census=14818 zone=NOROW inval=[kill line 14825 t=2026.08.27 23:05] DEAD(2026.08.27 23:05)
id=2105 obst=2026.08.28 00:35 prot=2026.08.28 00:50 mode=nearest census=14924 zone=NOROW inval=[kill line 14945 t=2026.08.28 01:15] DEAD(2026.08.28 01:15)
id=2109 obst=2026.08.28 01:00 prot=2026.08.28 05:05 mode=nearest census=15173 zone=NOROW inval=[none before confirmation] LIVE
id=2136 obst=2026.08.28 05:05 prot=2026.08.28 05:20 mode=nearest census=15187 zone=NOROW inval=[none before confirmation] LIVE
id=2149 obst=2026.08.28 06:25 prot=2026.08.28 06:40 mode=nearest census=15270 zone=1.16492-1.16507 [census promoT=2026.08.28 06:40 unique + XOBINPLAY line 15512] inval=[none before confirmation] LIVE
  WP/WF: WProws=2140 WProvs=4 WFrows=2 WFovs=2 FIRST_WP=line 16375 bar=2026.08.28 14:00 o=1.1649 h=1.16494 l=1.16471 c=1.16474 [ENTERS] | FIRST_WF=line 15256 bar=2026.08.28 06:30 o=1.16506 h=1.16508 l=1.16491 c=1.16494 [ENTERS] | FORM=line 15253 bar=2026.08.28 06:25 o=1.16492 h=1.16507 l=1.16492 c=1.16507 | WIT=XOBINPLAY line 17770 bar=2026.08.28 15:30 firstShift=18 firstVal=1.16494 (n=6)
id=2155 obst=2026.08.28 07:15 prot=2026.08.28 07:35 mode=nearest census=15319 zone=NOROW inval=[kill line 15436 t=2026.08.28 09:30] DEAD(2026.08.28 09:30)
id=2162 obst=2026.08.28 08:15 prot=2026.08.28 08:40 mode=all census=15376 zone=NOROW inval=[none before confirmation] LIVE
id=2172 obst=2026.08.28 09:40 prot=2026.08.28 10:15 mode=nearest census=15854 zone=NOROW inval=[kill line 15983 t=2026.08.28 10:50] DEAD(2026.08.28 10:50)
id=2166 obst=2026.08.28 08:45 prot=2026.08.28 10:25 mode=nearest census=15898 zone=NOROW inval=[none before confirmation] LIVE
id=2184 obst=2026.08.28 11:30 prot=2026.08.28 11:50 mode=nearest census=16245 zone=NOROW inval=[kill line 16348 t=2026.08.28 13:40] DEAD(2026.08.28 13:40)
id=2187 obst=2026.08.28 11:50 prot=2026.08.28 12:15 mode=all census=16273 zone=NOROW inval=[kill line 16334 t=2026.08.28 13:30] DEAD(2026.08.28 13:30)
id=2191 obst=2026.08.28 12:30 prot=2026.08.28 12:45 mode=nearest census=16297 zone=NOROW inval=[kill line 16332 t=2026.08.28 13:30] DEAD(2026.08.28 13:30)
id=2217 obst=2026.08.28 16:25 prot=2026.08.28 17:00 mode=all census=18863 zone=1.16415-1.16436 [ZONEID 39589 + ZONEPICK 39591] inval=[none before confirmation] LIVE
  WP/WF: WProws=2016 WProvs=1 WFrows=6 WFovs=6 FIRST_WP=line 18865 bar=2026.08.28 17:00 o=1.16377 h=1.16589 l=1.16166 c=1.16198 [ENTERS] | FIRST_WF=line 18772 bar=2026.08.28 16:30 o=1.16433 h=1.16442 l=1.16426 c=1.1643 [ENTERS] | FORM=line 18766 bar=2026.08.28 16:25 o=1.1643 h=1.16436 l=1.16415 c=1.16432 | WIT=zero-only(n=20)
id=2224 obst=2026.08.28 17:30 prot=2026.08.28 18:45 mode=nearest census=20633 zone=1.16010-1.16103 [ZONEID 23797 + ZONEPICK 23799] inval=[kill line 24864 t=2026.08.31 17:40] DEAD(2026.08.31 17:40)
  WP/WF: WProws=1995 WProvs=271 WFrows=14 WFovs=11 FIRST_WP=line 20635 bar=2026.08.28 18:45 o=1.16003 h=1.16026 l=1.15971 c=1.1598 [ENTERS] | FIRST_WF=line 19716 bar=2026.08.28 17:35 o=1.16103 h=1.16116 l=1.16047 c=1.16053 [ENTERS] | FORM=line 19599 bar=2026.08.28 17:30 o=1.16017 h=1.16103 l=1.1601 c=1.16103 | WIT=INPLAYCOMMIT line 20753 bar=2026.08.28 18:45 firstShift=4 firstVal=1.16084 (n=1)
id=2233 obst=2026.08.28 18:40 prot=2026.08.28 19:10 mode=nearest census=21007 zone=1.15962-1.16003 [ZONEID 22102 + ZONEPICK 22104] inval=[kill line 22635 t=2026.08.31 10:45] DEAD(2026.08.31 10:45)
  WP/WF: WProws=1990 WProvs=168 WFrows=5 WFovs=4 FIRST_WP=line 22392 bar=2026.08.31 10:30 o=1.15942 h=1.15969 l=1.15937 c=1.15966 [ENTERS] | FIRST_WF=line 20635 bar=2026.08.28 18:45 o=1.16003 h=1.16026 l=1.15971 c=1.1598 [ENTERS] | FORM=line 20508 bar=2026.08.28 18:40 o=1.15994 h=1.16003 l=1.15962 c=1.16002 | WIT=zero-only(n=4)
id=2250 obst=2026.08.28 21:05 prot=2026.08.28 21:45 mode=nearest census=21141 zone=NOROW inval=[none before confirmation] LIVE
id=2268 obst=2026.08.28 23:25 prot=2026.08.28 23:40 mode=nearest census=21255 zone=NOROW inval=[kill line 21358 t=2026.08.31 01:40] DEAD(2026.08.31 01:40)
id=2262 obst=2026.08.28 22:35 prot=2026.08.28 23:40 mode=all census=21257 zone=NOROW inval=[kill line 21393 t=2026.08.31 02:25] DEAD(2026.08.31 02:25)
id=2264 obst=2026.08.28 22:50 prot=2026.08.28 23:40 mode=all census=21258 zone=NOROW inval=[kill line 21404 t=2026.08.31 02:35] DEAD(2026.08.31 02:35)
id=2333 obst=2026.08.31 08:25 prot=2026.08.31 08:40 mode=nearest census=21740 zone=NOROW inval=[none before confirmation] LIVE
id=2362 obst=2026.08.31 12:10 prot=2026.08.31 12:30 mode=nearest census=23623 zone=NOROW inval=[kill line 23637 t=2026.08.31 12:55] DEAD(2026.08.31 12:55)
id=2370 obst=2026.08.31 13:25 prot=2026.08.31 13:45 mode=nearest census=23684 zone=NOROW inval=[kill line 23734 t=2026.08.31 14:25] DEAD(2026.08.31 14:25)
id=2381 obst=2026.08.31 14:40 prot=2026.08.31 14:50 mode=nearest census=23821 zone=1.15994-1.16021 [census promoT=2026.08.31 14:50 unique + XOBINPLAY line 24025] inval=[kill line 24821 t=2026.08.31 17:15] DEAD(2026.08.31 17:15)
  WP/WF: WProws=1754 WProvs=93 WFrows=1 WFovs=1 FIRST_WP=line 23823 bar=2026.08.31 14:50 o=1.15978 h=1.15998 l=1.15972 c=1.1598 [ENTERS] | FIRST_WF=line 23773 bar=2026.08.31 14:45 o=1.16001 h=1.16002 l=1.15973 c=1.15977 [ENTERS] | FORM=line 23764 bar=2026.08.31 14:40 o=1.15994 h=1.16021 l=1.15994 c=1.15999 | WIT=zero-only(n=2)
id=2390 obst=2026.08.31 16:35 prot=2026.08.31 16:50 mode=nearest census=24780 zone=NOROW inval=[kill line 24787 t=2026.08.31 17:00] DEAD(2026.08.31 17:00)
id=2403 obst=2026.08.31 18:45 prot=2026.08.31 21:35 mode=nearest census=25129 zone=NOROW inval=[kill line 25436 t=2026.09.01 03:10] DEAD(2026.09.01 03:10)
id=2435 obst=2026.08.31 23:25 prot=2026.09.01 01:55 mode=nearest census=25367 zone=NOROW inval=[none before confirmation] LIVE
id=2451 obst=2026.09.01 01:55 prot=2026.09.01 02:10 mode=nearest census=25380 zone=NOROW inval=[none before confirmation] LIVE
id=2460 obst=2026.09.01 03:05 prot=2026.09.01 04:10 mode=nearest census=25497 zone=NOROW inval=[kill line 39270 t=2026.09.03 15:35] DEAD(2026.09.03 15:35)
id=2455 obst=2026.09.01 02:40 prot=2026.09.01 04:55 mode=all census=25535 zone=NOROW inval=[kill line 39271 t=2026.09.03 15:35] DEAD(2026.09.03 15:35)
id=2470 obst=2026.09.01 04:40 prot=2026.09.01 07:30 mode=all census=25658 zone=1.16100-1.16129 [census promoT=2026.09.01 07:30 unique + XOBINPLAY line 25778] inval=[none before confirmation] LIVE
  WP/WF: WProws=1554 WProvs=190 WFrows=33 WFovs=7 FIRST_WP=line 25732 bar=2026.09.01 08:45 o=1.16085 h=1.161 l=1.16081 c=1.16095 [ENTERS] | FIRST_WF=line 25527 bar=2026.09.01 04:45 o=1.16128 h=1.1613 l=1.16102 c=1.16103 [ENTERS] | FORM=line 25523 bar=2026.09.01 04:40 o=1.16106 h=1.16129 l=1.161 c=1.16129 | WIT=XOBINPLAY line 25778 bar=2026.09.01 09:05 firstShift=4 firstVal=1.16100 (n=2)
id=2495 obst=2026.09.01 08:45 prot=2026.09.01 09:15 mode=all census=26096 zone=1.16081-1.16100 [ZONEID 35102 + ZONEPICK 35104] inval=[none before confirmation] LIVE
  WP/WF: WProws=1533 WProvs=93 WFrows=5 WFovs=4 FIRST_WP=line 26098 bar=2026.09.01 09:15 o=1.16066 h=1.16081 l=1.16056 c=1.16057 [ENTERS] | FIRST_WF=line 25735 bar=2026.09.01 08:50 o=1.16095 h=1.16098 l=1.16077 c=1.16097 [ENTERS] | FORM=line 25732 bar=2026.09.01 08:45 o=1.16085 h=1.161 l=1.16081 c=1.16095 | WIT=INPLAYCOMMIT line 26140 bar=2026.09.01 09:15 firstShift=4 firstVal=1.16099 (n=7)
id=2395 obst=2026.08.31 17:35 prot=2026.09.01 09:35 mode=nearest census=26544 zone=NOROW inval=[none before confirmation] LIVE
id=2494 obst=2026.09.01 08:35 prot=2026.09.01 10:20 mode=all census=27281 zone=NOROW inval=[none before confirmation] LIVE
id=2510 obst=2026.09.01 10:45 prot=2026.09.01 11:15 mode=nearest census=27396 zone=NOROW inval=[none before confirmation] LIVE
id=2529 obst=2026.09.01 13:45 prot=2026.09.01 15:10 mode=nearest census=27886 zone=NOROW inval=[none before confirmation] LIVE
id=2554 obst=2026.09.01 18:05 prot=2026.09.01 18:20 mode=nearest census=30055 zone=NOROW inval=[none before confirmation] LIVE
id=2559 obst=2026.09.01 18:55 prot=2026.09.01 19:25 mode=nearest census=30161 zone=NOROW inval=[none before confirmation] LIVE
id=2571 obst=2026.09.01 21:00 prot=2026.09.01 21:20 mode=nearest census=30273 zone=NOROW inval=[kill line 30272 t=2026.09.01 21:25] DEAD(2026.09.01 21:25)
id=2606 obst=2026.09.02 02:10 prot=2026.09.02 02:30 mode=nearest census=30540 zone=NOROW inval=[kill line 33704 t=2026.09.02 16:30] DEAD(2026.09.02 16:30)
id=2593 obst=2026.09.02 00:25 prot=2026.09.02 03:15 mode=nearest census=30579 zone=NOROW inval=[none before confirmation] LIVE
id=2615 obst=2026.09.02 03:20 prot=2026.09.02 03:35 mode=nearest census=30599 zone=NOROW inval=[kill line 33689 t=2026.09.02 16:25] DEAD(2026.09.02 16:25)
id=2620 obst=2026.09.02 03:50 prot=2026.09.02 04:05 mode=nearest census=30627 zone=1.15844-1.15857 [census promoT=2026.09.02 04:05 unique + XOBINPLAY line 32654] inval=[kill line 33687 t=2026.09.02 16:25] DEAD(2026.09.02 16:25)
  WP/WF: WProws=1307 WProvs=54 WFrows=2 WFovs=1 FIRST_WP=line 30940 bar=2026.09.02 09:10 o=1.15827 h=1.15849 l=1.1582 c=1.15824 [ENTERS] | FIRST_WF=line 30619 bar=2026.09.02 03:55 o=1.15854 h=1.1586 l=1.1583 c=1.15831 [ENTERS] | FORM=line 30614 bar=2026.09.02 03:50 o=1.15851 h=1.15857 l=1.15844 c=1.15853 | WIT=XOBINPLAY line 32654 bar=2026.09.02 15:40 firstShift=4 firstVal=1.15856 (n=2)
id=2284 obst=2026.08.31 01:45 prot=2026.09.02 04:35 mode=all census=30659 zone=NOROW inval=[kill line 33691 t=2026.09.02 16:25] DEAD(2026.09.02 16:25)
id=2345 obst=2026.08.31 09:55 prot=2026.09.02 04:35 mode=all census=30660 zone=NOROW inval=[kill line 33690 t=2026.09.02 16:25] DEAD(2026.09.02 16:25)
id=2636 obst=2026.09.02 05:55 prot=2026.09.02 06:55 mode=all census=30796 zone=NOROW inval=[kill line 30930 t=2026.09.02 09:10] DEAD(2026.09.02 09:10)
id=2638 obst=2026.09.02 06:45 prot=2026.09.02 07:15 mode=nearest census=30817 zone=NOROW inval=[kill line 30885 t=2026.09.02 08:30] DEAD(2026.09.02 08:30)
id=2640 obst=2026.09.02 07:10 prot=2026.09.02 07:25 mode=nearest census=30827 zone=NOROW inval=[none before confirmation] LIVE
id=2652 obst=2026.09.02 09:00 prot=2026.09.02 09:40 mode=all census=31010 zone=NOROW inval=[kill line 31592 t=2026.09.02 11:40] DEAD(2026.09.02 11:40)
id=2657 obst=2026.09.02 09:20 prot=2026.09.02 09:40 mode=all census=31011 zone=NOROW inval=[kill line 31192 t=2026.09.02 11:05] DEAD(2026.09.02 11:05)
id=2659 obst=2026.09.02 09:40 prot=2026.09.02 09:55 mode=nearest census=31044 zone=NOROW inval=[kill line 31132 t=2026.09.02 10:40] DEAD(2026.09.02 10:40)
id=2674 obst=2026.09.02 11:35 prot=2026.09.02 11:55 mode=nearest census=31815 zone=1.15788-1.15818 [census promoT=2026.09.02 11:55 unique + XOBINPLAY line 32337] inval=[none before confirmation] LIVE
  WP/WF: WProws=1213 WProvs=18 WFrows=3 WFovs=3 FIRST_WP=line 32173 bar=2026.09.02 14:35 o=1.15759 h=1.15791 l=1.15746 c=1.15783 [ENTERS] | FIRST_WF=line 31604 bar=2026.09.02 11:40 o=1.15814 h=1.15822 l=1.15802 c=1.15807 [ENTERS] | FORM=line 31595 bar=2026.09.02 11:35 o=1.15791 h=1.15818 l=1.15788 c=1.15816 | WIT=XOBINPLAY line 32337 bar=2026.09.02 14:40 firstShift=1 firstVal=1.15791 (n=2)
id=2682 obst=2026.09.02 12:25 prot=2026.09.02 13:00 mode=nearest census=32018 zone=NOROW inval=[kill line 32114 t=2026.09.02 14:15] DEAD(2026.09.02 14:15)
id=2697 obst=2026.09.02 15:20 prot=2026.09.02 15:45 mode=nearest census=32677 zone=NOROW inval=[none before confirmation] LIVE
id=2726 obst=2026.09.02 19:10 prot=2026.09.02 19:30 mode=nearest census=37124 zone=NOROW inval=[kill line 37618 t=2026.09.03 04:35] DEAD(2026.09.03 04:35)
id=2724 obst=2026.09.02 18:55 prot=2026.09.02 20:15 mode=nearest census=37163 zone=NOROW inval=[kill line 37611 t=2026.09.03 04:30] DEAD(2026.09.03 04:30)
id=2710 obst=2026.09.02 16:40 prot=2026.09.02 21:45 mode=all census=37236 zone=NOROW inval=[kill line 37619 t=2026.09.03 04:35] DEAD(2026.09.03 04:35)
id=2769 obst=2026.09.03 01:50 prot=2026.09.03 02:10 mode=all census=37485 zone=NOROW inval=[kill line 37549 t=2026.09.03 03:25] DEAD(2026.09.03 03:25)
id=2825 obst=2026.09.03 10:30 prot=2026.09.03 10:45 mode=nearest census=38505 zone=1.16044-1.16063 [census promoT=2026.09.03 10:45 unique + XOBINPLAY line 38549] inval=[none before confirmation] LIVE
  WP/WF: WProws=939 WProvs=34 WFrows=2 WFovs=1 FIRST_WP=line 38507 bar=2026.09.03 10:45 o=1.16023 h=1.1605 l=1.16018 c=1.16027 [ENTERS] | FIRST_WF=line 38490 bar=2026.09.03 10:35 o=1.16054 h=1.16081 l=1.16018 c=1.1603 [ENTERS] | FORM=line 38482 bar=2026.09.03 10:30 o=1.16048 h=1.16063 l=1.16044 c=1.16054 | WIT=zero-only(n=2)
id=2845 obst=2026.09.03 13:20 prot=2026.09.03 13:40 mode=nearest census=39046 zone=NOROW inval=[none before confirmation] LIVE
id=2868 obst=2026.09.03 16:10 prot=2026.09.03 16:50 mode=all census=39401 zone=NOROW inval=[none before confirmation] LIVE
id=2896 obst=2026.09.03 20:20 prot=2026.09.03 20:50 mode=all census=39926 zone=NOROW inval=[none before confirmation] LIVE
id=2898 obst=2026.09.03 20:30 prot=2026.09.03 21:35 mode=all census=39972 zone=1.16362-1.16377 [census promoT=2026.09.03 21:35 unique + XOBINPLAY line 48781] inval=[none before confirmation] [PICK] LIVE
  WP/WF: WProws=809 WProvs=0 WFrows=12 WFovs=5 FIRST_WP=NONE | FIRST_WF=line 39914 bar=2026.09.03 20:35 o=1.16373 h=1.16379 l=1.16363 c=1.16365 [ENTERS] | FORM=line 39910 bar=2026.09.03 20:30 o=1.1637 h=1.16377 l=1.16362 c=1.16371 | WIT=INPLAYCOMMIT line 48794 bar=2026.09.07 15:05 firstShift=500 firstVal=1.16364 (n=5) [PICK]
id=2920 obst=2026.09.03 23:45 prot=2026.09.04 00:05 mode=nearest census=40109 zone=NOROW inval=[none before confirmation] LIVE
id=2965 obst=2026.09.04 06:10 prot=2026.09.04 06:35 mode=nearest census=40470 zone=NOROW inval=[kill line 40571 t=2026.09.04 08:35] DEAD(2026.09.04 08:35)
id=2939 obst=2026.09.04 02:30 prot=2026.09.04 06:50 mode=nearest census=40486 zone=NOROW inval=[none before confirmation] LIVE
id=2973 obst=2026.09.04 07:35 prot=2026.09.04 11:00 mode=nearest census=41526 zone=1.16245-1.16275 [census promoT=2026.09.04 11:00 unique + XOBINPLAY line 41544] inval=[kill line 48135 t=2026.09.07 11:10] DEAD(2026.09.07 11:10)
  WP/WF: WProws=648 WProvs=173 WFrows=40 WFovs=30 FIRST_WP=line 42873 bar=2026.09.04 11:45 o=1.16236 h=1.16248 l=1.16233 c=1.16241 [ENTERS] | FIRST_WF=line 40533 bar=2026.09.04 07:40 o=1.16274 h=1.16274 l=1.16265 c=1.1627 [ENTERS] | FORM=line 40528 bar=2026.09.04 07:35 o=1.16246 h=1.16275 l=1.16245 c=1.16273 | WIT=INPLAYCOMMIT line 43378 bar=2026.09.04 15:30 firstShift=58 firstVal=1.16260 (n=1)
id=2971 obst=2026.09.04 07:00 prot=2026.09.04 11:15 mode=nearest census=41890 zone=NOROW inval=[none before confirmation] LIVE
id=2998 obst=2026.09.04 11:55 prot=2026.09.04 14:20 mode=all census=43204 zone=NOROW inval=[kill line 43310 t=2026.09.04 15:30] DEAD(2026.09.04 15:30)
id=3021 obst=2026.09.04 15:25 prot=2026.09.04 15:40 mode=nearest census=43801 zone=NOROW inval=[kill line 48133 t=2026.09.07 11:10] DEAD(2026.09.07 11:10)
id=3041 obst=2026.09.04 17:40 prot=2026.09.04 17:55 mode=nearest census=45106 zone=NOROW inval=[kill line 45168 t=2026.09.04 18:15] DEAD(2026.09.04 18:15)
id=3056 obst=2026.09.04 20:15 prot=2026.09.04 20:30 mode=nearest census=45680 zone=NOROW inval=[kill line 46611 t=2026.09.07 03:30] DEAD(2026.09.07 03:30)
id=3061 obst=2026.09.04 20:50 prot=2026.09.04 21:00 mode=nearest census=45786 zone=NOROW inval=[kill line 46066 t=2026.09.04 22:25] DEAD(2026.09.04 22:25)
id=3073 obst=2026.09.04 22:50 prot=2026.09.04 23:15 mode=nearest census=46264 zone=NOROW inval=[kill line 46540 t=2026.09.07 02:15] DEAD(2026.09.07 02:15)
id=3079 obst=2026.09.04 23:50 prot=2026.09.07 00:25 mode=all census=46448 zone=NOROW inval=[none before confirmation] LIVE
id=3096 obst=2026.09.07 02:40 prot=2026.09.07 02:55 mode=nearest census=46583 zone=NOROW inval=[none before confirmation] LIVE
id=3137 obst=2026.09.07 09:30 prot=2026.09.07 10:05 mode=nearest census=47894 zone=NOROW inval=[kill line 47999 t=2026.09.07 10:35] DEAD(2026.09.07 10:35)
id=3173 obst=2026.09.07 14:05 prot=2026.09.07 14:15 mode=all census=48362 zone=NOROW inval=[none before confirmation] LIVE
id=3195 obst=2026.09.07 17:35 prot=2026.09.07 17:55 mode=nearest census=50737 zone=NOROW inval=[none before confirmation] LIVE
id=3199 obst=2026.09.07 17:55 prot=2026.09.07 18:15 mode=nearest census=50780 zone=NOROW inval=[none before confirmation] LIVE
id=3186 obst=2026.09.07 16:30 prot=2026.09.07 21:30 mode=nearest census=50980 zone=NOROW inval=[kill line 51176 t=2026.09.08 01:30] DEAD(2026.09.08 01:30)
id=3226 obst=2026.09.07 23:30 prot=2026.09.08 00:05 mode=all census=51109 zone=NOROW inval=[none before confirmation] LIVE
id=3256 obst=2026.09.08 04:05 prot=2026.09.08 05:40 mode=nearest census=51420 zone=NOROW inval=[kill line 51599 t=2026.09.08 08:50] DEAD(2026.09.08 08:50)
id=3293 obst=2026.09.08 09:20 prot=2026.09.08 09:40 mode=nearest census=52008 zone=NOROW inval=[none before confirmation] LIVE
id=3298 obst=2026.09.08 10:00 prot=2026.09.08 10:20 mode=nearest census=52567 zone=NOROW inval=[kill line 53183 t=2026.09.08 16:05] DEAD(2026.09.08 16:05)
id=3302 obst=2026.09.08 10:25 prot=2026.09.08 10:45 mode=nearest census=52677 zone=NOROW inval=[kill line 52750 t=2026.09.08 11:35] DEAD(2026.09.08 11:35)
id=3324 obst=2026.09.08 14:35 prot=2026.09.08 14:50 mode=nearest census=53034 zone=NOROW inval=[none before confirmation] LIVE
## --- B2 LONG conf=2026.06.05 16:10 pick=3308
COUNT live-candidate=270
id=18 obst=2026.05.08 16:40 prot=2026.05.08 18:05 mode=all census=222 zone=NOROW inval=[kill line 273 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=29 obst=2026.05.08 18:05 prot=2026.05.08 18:45 mode=all census=227 zone=NOROW inval=[kill line 270 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=40 obst=2026.05.08 19:45 prot=2026.05.08 20:05 mode=nearest census=239 zone=NOROW inval=[none before confirmation] LIVE
id=58 obst=2026.05.08 22:10 prot=2026.05.08 22:30 mode=nearest census=250 zone=NOROW inval=[none before confirmation] LIVE
id=56 obst=2026.05.08 21:45 prot=2026.05.08 23:05 mode=all census=254 zone=NOROW inval=[kill line 261 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=78 obst=2026.05.11 00:25 prot=2026.05.11 00:35 mode=nearest census=281 zone=NOROW inval=[none before confirmation] LIVE
id=65 obst=2026.05.08 22:55 prot=2026.05.11 04:10 mode=all census=302 zone=NOROW inval=[none before confirmation] LIVE
id=107 obst=2026.05.11 05:00 prot=2026.05.11 05:50 mode=nearest census=311 zone=NOROW inval=[kill line 320 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=147 obst=2026.05.11 10:35 prot=2026.05.11 10:55 mode=nearest census=343 zone=NOROW inval=[kill line 347 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=162 obst=2026.05.11 12:00 prot=2026.05.11 12:20 mode=nearest census=360 zone=NOROW inval=[kill line 392 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=172 obst=2026.05.11 13:30 prot=2026.05.11 14:00 mode=all census=375 zone=NOROW inval=[none before confirmation] LIVE
id=181 obst=2026.05.11 14:45 prot=2026.05.11 15:00 mode=nearest census=383 zone=NOROW inval=[none before confirmation] LIVE
id=212 obst=2026.05.11 18:50 prot=2026.05.11 19:20 mode=nearest census=417 zone=NOROW inval=[none before confirmation] LIVE
id=221 obst=2026.05.11 20:30 prot=2026.05.11 21:30 mode=nearest census=433 zone=NOROW inval=[kill line 450 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=256 obst=2026.05.12 01:10 prot=2026.05.12 01:25 mode=nearest census=460 zone=NOROW inval=[none before confirmation] LIVE
id=261 obst=2026.05.12 02:00 prot=2026.05.12 03:00 mode=all census=468 zone=NOROW inval=[none before confirmation] LIVE
id=302 obst=2026.05.12 08:25 prot=2026.05.12 08:40 mode=nearest census=497 zone=NOROW inval=[none before confirmation] LIVE
id=313 obst=2026.05.12 09:30 prot=2026.05.12 10:00 mode=nearest census=514 zone=NOROW inval=[none before confirmation] LIVE
id=327 obst=2026.05.12 11:45 prot=2026.05.12 12:10 mode=nearest census=524 zone=NOROW inval=[none before confirmation] LIVE
id=352 obst=2026.05.12 16:20 prot=2026.05.12 16:40 mode=nearest census=556 zone=NOROW inval=[none before confirmation] LIVE
id=354 obst=2026.05.12 16:40 prot=2026.05.12 16:55 mode=nearest census=558 zone=NOROW inval=[none before confirmation] LIVE
id=348 obst=2026.05.12 15:50 prot=2026.05.12 18:05 mode=all census=566 zone=NOROW inval=[kill line 605 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=350 obst=2026.05.12 16:00 prot=2026.05.12 18:05 mode=all census=567 zone=NOROW inval=[kill line 620 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=364 obst=2026.05.12 18:05 prot=2026.05.12 18:20 mode=nearest census=570 zone=NOROW inval=[kill line 596 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=361 obst=2026.05.12 17:30 prot=2026.05.12 19:50 mode=all census=581 zone=NOROW inval=[kill line 597 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=402 obst=2026.05.12 22:50 prot=2026.05.12 23:05 mode=nearest census=613 zone=NOROW inval=[kill line 618 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=415 obst=2026.05.13 00:30 prot=2026.05.13 00:45 mode=nearest census=626 zone=NOROW inval=[kill line 627 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=414 obst=2026.05.13 00:15 prot=2026.05.13 01:10 mode=all census=633 zone=NOROW inval=[none before confirmation] LIVE
id=424 obst=2026.05.13 01:25 prot=2026.05.13 01:40 mode=nearest census=635 zone=NOROW inval=[none before confirmation] LIVE
id=440 obst=2026.05.13 03:35 prot=2026.05.13 03:55 mode=nearest census=667 zone=NOROW inval=[none before confirmation] LIVE
id=449 obst=2026.05.13 05:00 prot=2026.05.13 05:15 mode=nearest census=675 zone=NOROW inval=[none before confirmation] LIVE
id=447 obst=2026.05.13 04:45 prot=2026.05.13 06:20 mode=all census=678 zone=NOROW inval=[none before confirmation] LIVE
id=460 obst=2026.05.13 06:40 prot=2026.05.13 07:05 mode=nearest census=686 zone=NOROW inval=[none before confirmation] LIVE
id=463 obst=2026.05.13 07:00 prot=2026.05.13 07:35 mode=nearest census=689 zone=NOROW inval=[none before confirmation] LIVE
id=474 obst=2026.05.13 09:30 prot=2026.05.13 09:55 mode=nearest census=704 zone=NOROW inval=[none before confirmation] LIVE
id=445 obst=2026.05.13 04:20 prot=2026.05.13 10:40 mode=all census=713 zone=NOROW inval=[none before confirmation] LIVE
id=480 obst=2026.05.13 10:20 prot=2026.05.13 10:45 mode=nearest census=714 zone=NOROW inval=[kill line 817 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=492 obst=2026.05.13 11:45 prot=2026.05.13 12:25 mode=nearest census=722 zone=NOROW inval=[none before confirmation] LIVE
id=490 obst=2026.05.13 11:25 prot=2026.05.13 13:30 mode=all census=730 zone=NOROW inval=[kill line 736 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=502 obst=2026.05.13 13:20 prot=2026.05.13 13:35 mode=nearest census=731 zone=NOROW inval=[none before confirmation] LIVE
id=513 obst=2026.05.13 15:00 prot=2026.05.13 15:20 mode=nearest census=745 zone=NOROW inval=[none before confirmation] LIVE
id=526 obst=2026.05.13 16:40 prot=2026.05.13 17:25 mode=nearest census=764 zone=NOROW inval=[kill line 776 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=559 obst=2026.05.13 22:25 prot=2026.05.13 22:45 mode=nearest census=800 zone=NOROW inval=[none before confirmation] LIVE
id=566 obst=2026.05.13 23:35 prot=2026.05.13 23:50 mode=all census=808 zone=NOROW inval=[none before confirmation] LIVE
id=594 obst=2026.05.14 02:50 prot=2026.05.14 03:05 mode=nearest census=836 zone=NOROW inval=[none before confirmation] LIVE
id=603 obst=2026.05.14 03:45 prot=2026.05.14 04:10 mode=nearest census=841 zone=NOROW inval=[kill line 869 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=578 obst=2026.05.14 00:55 prot=2026.05.14 04:30 mode=all census=845 zone=NOROW inval=[kill line 877 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=601 obst=2026.05.14 03:35 prot=2026.05.14 04:30 mode=all census=846 zone=NOROW inval=[kill line 870 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=552 obst=2026.05.13 21:00 prot=2026.05.14 05:15 mode=all census=852 zone=NOROW inval=[kill line 867 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=556 obst=2026.05.13 21:50 prot=2026.05.14 05:15 mode=all census=853 zone=NOROW inval=[kill line 866 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=612 obst=2026.05.14 05:00 prot=2026.05.14 05:20 mode=nearest census=854 zone=NOROW inval=[kill line 864 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=637 obst=2026.05.14 07:45 prot=2026.05.14 08:05 mode=nearest census=891 zone=NOROW inval=[none before confirmation] LIVE
id=660 obst=2026.05.14 10:40 prot=2026.05.14 11:00 mode=all census=913 zone=NOROW inval=[none before confirmation] LIVE
id=673 obst=2026.05.14 12:45 prot=2026.05.14 13:05 mode=nearest census=925 zone=NOROW inval=[none before confirmation] LIVE
id=676 obst=2026.05.14 13:10 prot=2026.05.14 14:40 mode=all census=933 zone=NOROW inval=[none before confirmation] LIVE
id=681 obst=2026.05.14 14:05 prot=2026.05.14 15:00 mode=all census=939 zone=NOROW inval=[kill line 940 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=701 obst=2026.05.14 17:45 prot=2026.05.14 18:00 mode=nearest census=971 zone=NOROW inval=[none before confirmation] LIVE
id=696 obst=2026.05.14 16:40 prot=2026.05.14 18:05 mode=nearest census=973 zone=NOROW inval=[none before confirmation] LIVE
id=698 obst=2026.05.14 17:00 prot=2026.05.14 19:25 mode=all census=981 zone=NOROW inval=[none before confirmation] LIVE
id=714 obst=2026.05.14 19:15 prot=2026.05.14 19:30 mode=nearest census=982 zone=NOROW inval=[none before confirmation] LIVE
id=706 obst=2026.05.14 18:10 prot=2026.05.14 19:35 mode=nearest census=984 zone=NOROW inval=[none before confirmation] LIVE
id=724 obst=2026.05.14 20:45 prot=2026.05.14 21:00 mode=nearest census=994 zone=NOROW inval=[none before confirmation] LIVE
id=731 obst=2026.05.14 21:40 prot=2026.05.14 22:25 mode=nearest census=1003 zone=NOROW inval=[none before confirmation] LIVE
id=753 obst=2026.05.15 00:55 prot=2026.05.15 02:15 mode=all census=1023 zone=NOROW inval=[none before confirmation] LIVE
id=775 obst=2026.05.15 04:30 prot=2026.05.15 05:05 mode=nearest census=1042 zone=NOROW inval=[none before confirmation] LIVE
id=802 obst=2026.05.15 08:50 prot=2026.05.15 09:10 mode=nearest census=1067 zone=NOROW inval=[none before confirmation] LIVE
id=816 obst=2026.05.15 10:30 prot=2026.05.15 10:50 mode=nearest census=1082 zone=NOROW inval=[kill line 1110 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=815 obst=2026.05.15 10:20 prot=2026.05.15 10:55 mode=nearest census=1084 zone=NOROW inval=[kill line 1111 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=820 obst=2026.05.15 10:50 prot=2026.05.15 11:20 mode=nearest census=1089 zone=NOROW inval=[none before confirmation] LIVE
id=825 obst=2026.05.15 11:30 prot=2026.05.15 12:00 mode=nearest census=1095 zone=NOROW inval=[kill line 1105 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=841 obst=2026.05.15 13:30 prot=2026.05.15 14:25 mode=nearest census=1125 zone=NOROW inval=[none before confirmation] LIVE
id=851 obst=2026.05.15 14:45 prot=2026.05.15 15:00 mode=nearest census=1130 zone=NOROW inval=[none before confirmation] LIVE
id=861 obst=2026.05.15 16:10 prot=2026.05.15 16:25 mode=nearest census=1139 zone=NOROW inval=[kill line 1200 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=878 obst=2026.05.15 18:35 prot=2026.05.15 18:50 mode=nearest census=1158 zone=NOROW inval=[none before confirmation] LIVE
id=888 obst=2026.05.15 20:20 prot=2026.05.15 21:05 mode=all census=1171 zone=NOROW inval=[none before confirmation] LIVE
id=881 obst=2026.05.15 18:55 prot=2026.05.15 21:10 mode=nearest census=1172 zone=NOROW inval=[none before confirmation] LIVE
id=908 obst=2026.05.15 23:05 prot=2026.05.15 23:25 mode=nearest census=1187 zone=NOROW inval=[none before confirmation] LIVE
id=913 obst=2026.05.15 23:40 prot=2026.05.15 23:55 mode=nearest census=1195 zone=NOROW inval=[none before confirmation] LIVE
id=923 obst=2026.05.18 00:30 prot=2026.05.18 00:50 mode=nearest census=1210 zone=NOROW inval=[none before confirmation] LIVE
id=911 obst=2026.05.15 23:30 prot=2026.05.18 02:05 mode=all census=1218 zone=NOROW inval=[kill line 1322 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=936 obst=2026.05.18 02:15 prot=2026.05.18 02:35 mode=nearest census=1221 zone=NOROW inval=[none before confirmation] LIVE
id=930 obst=2026.05.18 01:20 prot=2026.05.18 03:35 mode=all census=1229 zone=NOROW inval=[kill line 1321 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=934 obst=2026.05.18 01:55 prot=2026.05.18 03:35 mode=all census=1230 zone=NOROW inval=[kill line 1318 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=945 obst=2026.05.18 03:25 prot=2026.05.18 03:45 mode=nearest census=1233 zone=NOROW inval=[none before confirmation] LIVE
id=954 obst=2026.05.18 04:45 prot=2026.05.18 05:05 mode=nearest census=1243 zone=NOROW inval=[none before confirmation] LIVE
id=964 obst=2026.05.18 06:25 prot=2026.05.18 06:40 mode=nearest census=1249 zone=NOROW inval=[kill line 1261 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=967 obst=2026.05.18 06:40 prot=2026.05.18 06:55 mode=nearest census=1251 zone=NOROW inval=[kill line 1260 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=958 obst=2026.05.18 05:05 prot=2026.05.18 07:15 mode=all census=1255 zone=NOROW inval=[kill line 1263 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=993 obst=2026.05.18 09:50 prot=2026.05.18 10:10 mode=nearest census=1279 zone=NOROW inval=[none before confirmation] LIVE
id=991 obst=2026.05.18 09:30 prot=2026.05.18 10:15 mode=all census=1281 zone=NOROW inval=[none before confirmation] LIVE
id=1013 obst=2026.05.18 12:30 prot=2026.05.18 12:55 mode=nearest census=1305 zone=NOROW inval=[none before confirmation] LIVE
id=1038 obst=2026.05.18 16:05 prot=2026.05.18 16:25 mode=nearest census=1334 zone=NOROW inval=[none before confirmation] LIVE
id=1047 obst=2026.05.18 17:15 prot=2026.05.18 17:40 mode=nearest census=1349 zone=NOROW inval=[none before confirmation] LIVE
id=1060 obst=2026.05.18 18:50 prot=2026.05.18 19:30 mode=all census=1369 zone=NOROW inval=[kill line 1402 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1055 obst=2026.05.18 18:10 prot=2026.05.18 19:35 mode=nearest census=1371 zone=NOROW inval=[none before confirmation] LIVE
id=980 obst=2026.05.18 08:00 prot=2026.05.18 21:30 mode=nearest census=1379 zone=NOROW inval=[none before confirmation] LIVE
id=1081 obst=2026.05.18 21:30 prot=2026.05.18 21:50 mode=all census=1383 zone=NOROW inval=[none before confirmation] LIVE
id=1103 obst=2026.05.19 00:30 prot=2026.05.19 01:15 mode=nearest census=1415 zone=NOROW inval=[none before confirmation] LIVE
id=1116 obst=2026.05.19 01:45 prot=2026.05.19 02:00 mode=nearest census=1418 zone=NOROW inval=[none before confirmation] LIVE
id=1120 obst=2026.05.19 02:25 prot=2026.05.19 02:50 mode=nearest census=1424 zone=NOROW inval=[kill line 1577 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1096 obst=2026.05.18 23:40 prot=2026.05.19 03:00 mode=nearest census=1428 zone=NOROW inval=[kill line 1580 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1154 obst=2026.05.19 06:35 prot=2026.05.19 06:50 mode=nearest census=1454 zone=NOROW inval=[none before confirmation] LIVE
id=1162 obst=2026.05.19 07:15 prot=2026.05.19 07:30 mode=nearest census=1460 zone=NOROW inval=[kill line 1567 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1164 obst=2026.05.19 07:35 prot=2026.05.19 07:50 mode=nearest census=1466 zone=NOROW inval=[kill line 1566 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1167 obst=2026.05.19 07:50 prot=2026.05.19 08:05 mode=nearest census=1470 zone=NOROW inval=[none before confirmation] LIVE
id=1083 obst=2026.05.18 22:00 prot=2026.05.19 10:05 mode=nearest census=1481 zone=NOROW inval=[kill line 1570 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1192 obst=2026.05.19 11:30 prot=2026.05.19 12:00 mode=nearest census=1492 zone=NOROW inval=[none before confirmation] LIVE
id=1208 obst=2026.05.19 13:20 prot=2026.05.19 13:40 mode=nearest census=1504 zone=NOROW inval=[none before confirmation] LIVE
id=1188 obst=2026.05.19 10:45 prot=2026.05.19 15:00 mode=all census=1517 zone=NOROW inval=[none before confirmation] LIVE
id=1226 obst=2026.05.19 16:50 prot=2026.05.19 17:30 mode=nearest census=1549 zone=NOROW inval=[kill line 1564 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1235 obst=2026.05.19 18:15 prot=2026.05.19 18:30 mode=nearest census=1555 zone=NOROW inval=[kill line 1561 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1257 obst=2026.05.19 21:40 prot=2026.05.19 21:55 mode=nearest census=1588 zone=NOROW inval=[kill line 1606 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1263 obst=2026.05.19 22:10 prot=2026.05.19 22:30 mode=nearest census=1593 zone=NOROW inval=[none before confirmation] LIVE
id=1288 obst=2026.05.20 01:05 prot=2026.05.20 01:25 mode=nearest census=1616 zone=NOROW inval=[kill line 1620 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1336 obst=2026.05.20 08:30 prot=2026.05.20 09:00 mode=nearest census=1665 zone=NOROW inval=[none before confirmation] LIVE
id=1350 obst=2026.05.20 10:25 prot=2026.05.20 10:45 mode=nearest census=1677 zone=NOROW inval=[kill line 1703 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1353 obst=2026.05.20 10:50 prot=2026.05.20 11:20 mode=nearest census=1682 zone=NOROW inval=[none before confirmation] LIVE
id=1368 obst=2026.05.20 13:45 prot=2026.05.20 14:10 mode=nearest census=1698 zone=NOROW inval=[kill line 1702 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1382 obst=2026.05.20 15:55 prot=2026.05.20 16:15 mode=all census=1712 zone=NOROW inval=[none before confirmation] LIVE
id=1387 obst=2026.05.20 16:40 prot=2026.05.20 17:05 mode=nearest census=1724 zone=NOROW inval=[none before confirmation] LIVE
id=1397 obst=2026.05.20 18:00 prot=2026.05.20 18:15 mode=nearest census=1750 zone=NOROW inval=[none before confirmation] LIVE
id=1405 obst=2026.05.20 18:45 prot=2026.05.20 19:00 mode=nearest census=1757 zone=NOROW inval=[none before confirmation] LIVE
id=1432 obst=2026.05.20 22:35 prot=2026.05.20 22:55 mode=nearest census=1785 zone=NOROW inval=[kill line 2196 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1448 obst=2026.05.21 00:40 prot=2026.05.21 01:10 mode=nearest census=1802 zone=NOROW inval=[kill line 1799 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1452 obst=2026.05.21 01:10 prot=2026.05.21 02:30 mode=nearest census=1811 zone=NOROW inval=[kill line 1823 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1465 obst=2026.05.21 02:45 prot=2026.05.21 03:05 mode=nearest census=1815 zone=NOROW inval=[none before confirmation] LIVE
id=1475 obst=2026.05.21 04:30 prot=2026.05.21 04:50 mode=nearest census=1836 zone=NOROW inval=[kill line 2195 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1482 obst=2026.05.21 05:30 prot=2026.05.21 05:55 mode=nearest census=1845 zone=NOROW inval=[kill line 1970 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1495 obst=2026.05.21 08:00 prot=2026.05.21 08:20 mode=nearest census=1853 zone=NOROW inval=[kill line 1878 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1493 obst=2026.05.21 07:25 prot=2026.05.21 09:20 mode=all census=1858 zone=NOROW inval=[kill line 1883 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1501 obst=2026.05.21 08:50 prot=2026.05.21 09:20 mode=all census=1859 zone=NOROW inval=[kill line 1877 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1503 obst=2026.05.21 09:05 prot=2026.05.21 09:40 mode=all census=1864 zone=NOROW inval=[kill line 1876 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1505 obst=2026.05.21 09:20 prot=2026.05.21 09:45 mode=nearest census=1865 zone=NOROW inval=[kill line 1871 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1526 obst=2026.05.21 12:45 prot=2026.05.21 13:00 mode=nearest census=1899 zone=NOROW inval=[kill line 1968 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1531 obst=2026.05.21 13:10 prot=2026.05.21 13:25 mode=all census=1908 zone=NOROW inval=[kill line 1961 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1514 obst=2026.05.21 10:30 prot=2026.05.21 13:35 mode=nearest census=1911 zone=NOROW inval=[kill line 1959 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1537 obst=2026.05.21 14:20 prot=2026.05.21 14:45 mode=nearest census=1916 zone=NOROW inval=[kill line 1958 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1543 obst=2026.05.21 15:00 prot=2026.05.21 15:25 mode=all census=1923 zone=NOROW inval=[none before confirmation] LIVE
id=1548 obst=2026.05.21 15:45 prot=2026.05.21 16:10 mode=all census=1929 zone=NOROW inval=[none before confirmation] LIVE
id=1614 obst=2026.05.22 00:10 prot=2026.05.22 00:35 mode=nearest census=1994 zone=NOROW inval=[kill line 2192 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1630 obst=2026.05.22 02:45 prot=2026.05.22 03:55 mode=all census=2003 zone=NOROW inval=[kill line 2015 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1631 obst=2026.05.22 03:05 prot=2026.05.22 03:55 mode=all census=2004 zone=NOROW inval=[kill line 2013 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1641 obst=2026.05.22 04:50 prot=2026.05.22 05:05 mode=nearest census=2008 zone=NOROW inval=[none before confirmation] LIVE
id=1654 obst=2026.05.22 07:15 prot=2026.05.22 07:30 mode=nearest census=2026 zone=NOROW inval=[kill line 2092 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1669 obst=2026.05.22 09:25 prot=2026.05.22 10:40 mode=all census=2043 zone=NOROW inval=[none before confirmation] LIVE
id=1679 obst=2026.05.22 11:35 prot=2026.05.22 12:25 mode=nearest census=2061 zone=NOROW inval=[none before confirmation] LIVE
id=1691 obst=2026.05.22 13:15 prot=2026.05.22 13:35 mode=nearest census=2069 zone=NOROW inval=[none before confirmation] LIVE
id=1706 obst=2026.05.22 16:05 prot=2026.05.22 17:05 mode=all census=2103 zone=NOROW inval=[kill line 2188 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1717 obst=2026.05.22 18:25 prot=2026.05.22 18:40 mode=nearest census=2117 zone=NOROW inval=[kill line 2128 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1575 obst=2026.05.21 19:25 prot=2026.05.22 18:45 mode=nearest census=2119 zone=NOROW inval=[none before confirmation] LIVE
id=1734 obst=2026.05.22 20:35 prot=2026.05.22 21:30 mode=all census=2138 zone=NOROW inval=[kill line 2184 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1769 obst=2026.05.25 02:35 prot=2026.05.25 02:50 mode=nearest census=2339 zone=NOROW inval=[none before confirmation] LIVE
id=1780 obst=2026.05.25 04:35 prot=2026.05.25 04:50 mode=nearest census=2461 zone=NOROW inval=[none before confirmation] LIVE
id=1779 obst=2026.05.25 04:25 prot=2026.05.25 06:45 mode=all census=2557 zone=NOROW inval=[none before confirmation] LIVE
id=1785 obst=2026.05.25 05:05 prot=2026.05.25 06:45 mode=all census=2558 zone=NOROW inval=[none before confirmation] LIVE
id=1788 obst=2026.05.25 05:35 prot=2026.05.25 06:45 mode=all census=2559 zone=NOROW inval=[kill line 3816 t=2026.05.26 00:05] DEAD(2026.05.26 00:05)
id=1794 obst=2026.05.25 06:35 prot=2026.05.25 06:50 mode=nearest census=2565 zone=NOROW inval=[none before confirmation] LIVE
id=1819 obst=2026.05.25 09:55 prot=2026.05.25 10:10 mode=nearest census=2789 zone=NOROW inval=[kill line 2959 t=2026.05.25 12:05] DEAD(2026.05.25 12:05)
id=1812 obst=2026.05.25 09:00 prot=2026.05.25 10:15 mode=nearest census=2802 zone=NOROW inval=[kill line 2936 t=2026.05.25 11:50] DEAD(2026.05.25 11:50)
id=1841 obst=2026.05.25 12:40 prot=2026.05.25 13:15 mode=all census=3032 zone=NOROW inval=[kill line 3131 t=2026.05.25 14:40] DEAD(2026.05.25 14:40)
id=1863 obst=2026.05.25 16:30 prot=2026.05.25 16:55 mode=nearest census=3332 zone=NOROW inval=[none before confirmation] LIVE
id=1857 obst=2026.05.25 15:20 prot=2026.05.25 18:05 mode=all census=3448 zone=NOROW inval=[none before confirmation] LIVE
id=1865 obst=2026.05.25 17:00 prot=2026.05.25 18:05 mode=all census=3449 zone=NOROW inval=[none before confirmation] LIVE
id=1874 obst=2026.05.25 18:50 prot=2026.05.25 19:10 mode=nearest census=3548 zone=NOROW inval=[none before confirmation] LIVE
id=1892 obst=2026.05.25 22:35 prot=2026.05.25 22:55 mode=nearest census=3742 zone=NOROW inval=[kill line 3804 t=2026.05.26 00:00] DEAD(2026.05.26 00:00)
id=1878 obst=2026.05.25 19:55 prot=2026.05.25 23:00 mode=nearest census=3749 zone=NOROW inval=[kill line 3807 t=2026.05.26 00:00] DEAD(2026.05.26 00:00)
id=1897 obst=2026.05.25 23:10 prot=2026.05.25 23:30 mode=nearest census=3777 zone=NOROW inval=[kill line 3803 t=2026.05.26 00:00] DEAD(2026.05.26 00:00)
id=1905 obst=2026.05.26 00:20 prot=2026.05.26 02:25 mode=all census=3944 zone=NOROW inval=[none before confirmation] LIVE
id=1918 obst=2026.05.26 02:15 prot=2026.05.26 02:30 mode=nearest census=3950 zone=NOROW inval=[kill line 4159 t=2026.05.26 06:25] DEAD(2026.05.26 06:25)
id=1925 obst=2026.05.26 03:00 prot=2026.05.26 03:25 mode=nearest census=4000 zone=NOROW inval=[kill line 4102 t=2026.05.26 05:25] DEAD(2026.05.26 05:25)
id=1935 obst=2026.05.26 04:45 prot=2026.05.26 05:50 mode=nearest census=4131 zone=NOROW inval=[none before confirmation] LIVE
id=1949 obst=2026.05.26 06:45 prot=2026.05.26 07:25 mode=nearest census=4217 zone=NOROW inval=[none before confirmation] LIVE
id=1958 obst=2026.05.26 08:15 prot=2026.05.26 09:35 mode=all census=4351 zone=NOROW inval=[none before confirmation] LIVE
id=1965 obst=2026.05.26 09:20 prot=2026.05.26 10:00 mode=all census=4391 zone=NOROW inval=[none before confirmation] LIVE
id=1971 obst=2026.05.26 10:10 prot=2026.05.26 11:05 mode=all census=4485 zone=NOROW inval=[kill line 4625 t=2026.05.26 13:00] DEAD(2026.05.26 13:00)
id=1973 obst=2026.05.26 10:45 prot=2026.05.26 11:05 mode=all census=4486 zone=NOROW inval=[kill line 4588 t=2026.05.26 12:20] DEAD(2026.05.26 12:20)
id=1978 obst=2026.05.26 11:35 prot=2026.05.26 16:10 mode=nearest census=4877 zone=NOROW inval=[kill line 5535 t=2026.05.27 02:45] DEAD(2026.05.27 02:45)
id=2014 obst=2026.05.26 18:10 prot=2026.05.26 18:25 mode=nearest census=5082 zone=NOROW inval=[none before confirmation] LIVE
id=2050 obst=2026.05.26 23:25 prot=2026.05.26 23:40 mode=all census=5374 zone=NOROW inval=[none before confirmation] LIVE
id=2075 obst=2026.05.27 03:40 prot=2026.05.27 03:55 mode=all census=5613 zone=NOROW inval=[kill line 5727 t=2026.05.27 06:05] DEAD(2026.05.27 06:05)
id=2070 obst=2026.05.27 03:00 prot=2026.05.27 04:00 mode=nearest census=5620 zone=NOROW inval=[kill line 5636 t=2026.05.27 04:25] DEAD(2026.05.27 04:25)
id=2083 obst=2026.05.27 04:40 prot=2026.05.27 05:00 mode=nearest census=5672 zone=NOROW inval=[none before confirmation] LIVE
id=2094 obst=2026.05.27 06:20 prot=2026.05.27 06:40 mode=nearest census=5760 zone=159.190-159.208 [census promoT=2026.05.27 06:40 unique + XOBINPLAY line 6475] inval=[none before confirmation] LIVE
  WP/WF: WProws=2131 WProvs=67 WFrows=3 WFovs=3 FIRST_WP=line 5763 bar=2026.05.27 06:40 o=159.221 h=159.226 l=159.204 c=159.212 [ENTERS] | FIRST_WF=line 5750 bar=2026.05.27 06:25 o=159.191 h=159.203 l=159.186 c=159.198 [ENTERS] | FORM=line 5746 bar=2026.05.27 06:20 o=159.205 h=159.208 l=159.19 c=159.19 | WIT=XOBINPLAY line 6475 bar=2026.05.27 15:25 firstShift=97 firstVal=159.197 (n=2)
id=2088 obst=2026.05.27 05:30 prot=2026.05.27 08:40 mode=nearest census=5869 zone=NOROW inval=[kill line 8843 t=2026.05.28 17:20] DEAD(2026.05.28 17:20)
id=2120 obst=2026.05.27 10:30 prot=2026.05.27 10:55 mode=nearest census=6061 zone=NOROW inval=[none before confirmation] LIVE
id=2125 obst=2026.05.27 11:00 prot=2026.05.27 11:20 mode=nearest census=6102 zone=NOROW inval=[none before confirmation] LIVE
id=2148 obst=2026.05.27 14:10 prot=2026.05.27 14:30 mode=nearest census=6305 zone=NOROW inval=[kill line 6404 t=2026.05.27 15:25] DEAD(2026.05.27 15:25)
id=2138 obst=2026.05.27 12:40 prot=2026.05.27 14:55 mode=all census=6344 zone=NOROW inval=[kill line 6408 t=2026.05.27 15:25] DEAD(2026.05.27 15:25)
id=2146 obst=2026.05.27 14:00 prot=2026.05.27 14:55 mode=all census=6345 zone=NOROW inval=[kill line 6405 t=2026.05.27 15:25] DEAD(2026.05.27 15:25)
id=2171 obst=2026.05.27 17:25 prot=2026.05.27 17:40 mode=nearest census=7092 zone=NOROW inval=[kill line 8413 t=2026.05.28 12:25] DEAD(2026.05.28 12:25)
id=2228 obst=2026.05.28 01:35 prot=2026.05.28 01:55 mode=nearest census=7685 zone=NOROW inval=[kill line 8140 t=2026.05.28 09:40] DEAD(2026.05.28 09:40)
id=2226 obst=2026.05.28 01:20 prot=2026.05.28 02:25 mode=all census=7712 zone=NOROW inval=[kill line 8141 t=2026.05.28 09:40] DEAD(2026.05.28 09:40)
id=2231 obst=2026.05.28 01:55 prot=2026.05.28 02:30 mode=nearest census=7717 zone=NOROW inval=[kill line 8139 t=2026.05.28 09:40] DEAD(2026.05.28 09:40)
id=2235 obst=2026.05.28 02:30 prot=2026.05.28 02:55 mode=all census=7741 zone=NOROW inval=[kill line 7869 t=2026.05.28 05:25] DEAD(2026.05.28 05:25)
id=2288 obst=2026.05.28 10:00 prot=2026.05.28 10:30 mode=all census=8244 zone=NOROW inval=[kill line 8301 t=2026.05.28 11:10] DEAD(2026.05.28 11:10)
id=2290 obst=2026.05.28 10:20 prot=2026.05.28 10:35 mode=nearest census=8252 zone=NOROW inval=[kill line 8293 t=2026.05.28 11:05] DEAD(2026.05.28 11:05)
id=2314 obst=2026.05.28 13:25 prot=2026.05.28 13:45 mode=nearest census=8494 zone=NOROW inval=[kill line 8641 t=2026.05.28 15:35] DEAD(2026.05.28 15:35)
id=2319 obst=2026.05.28 14:15 prot=2026.05.28 14:30 mode=all census=8551 zone=NOROW inval=[none before confirmation] LIVE
id=2330 obst=2026.05.28 16:00 prot=2026.05.28 16:20 mode=nearest census=8718 zone=NOROW inval=[none before confirmation] LIVE
id=2334 obst=2026.05.28 16:40 prot=2026.05.28 17:05 mode=nearest census=8805 zone=NOROW inval=[none before confirmation] LIVE
id=2355 obst=2026.05.28 19:40 prot=2026.05.28 21:25 mode=all census=9182 zone=NOROW inval=[kill line 9315 t=2026.05.29 00:05] DEAD(2026.05.29 00:05)
id=2361 obst=2026.05.28 21:15 prot=2026.05.28 21:35 mode=nearest census=9192 zone=NOROW inval=[kill line 9314 t=2026.05.29 00:05] DEAD(2026.05.29 00:05)
id=2376 obst=2026.05.28 23:05 prot=2026.05.28 23:30 mode=nearest census=9284 zone=NOROW inval=[none before confirmation] LIVE
id=2385 obst=2026.05.29 00:25 prot=2026.05.29 00:35 mode=nearest census=9348 zone=159.180-159.194 [ZONEID 10093 + ZONEPICK 10095] inval=[kill line 11652 t=2026.05.29 18:05] DEAD(2026.05.29 18:05)
  WP/WF: WProws=1628 WProvs=16 WFrows=1 WFovs=1 FIRST_WP=line 11635 bar=2026.05.29 17:50 o=159.301 h=159.305 l=159.181 c=159.204 [ENTERS] | FIRST_WF=line 9346 bar=2026.05.29 00:30 o=159.197 h=159.206 l=159.189 c=159.206 [ENTERS] | FORM=line 9343 bar=2026.05.29 00:25 o=159.191 h=159.194 l=159.18 c=159.188 | WIT=INPLAYCOMMIT line 10111 bar=2026.05.29 10:45 firstShift=124 firstVal=159.180 (n=1)
id=2390 obst=2026.05.29 00:40 prot=2026.05.29 02:45 mode=all census=9453 zone=NOROW inval=[kill line 9913 t=2026.05.29 10:00] DEAD(2026.05.29 10:00)
id=2398 obst=2026.05.29 02:00 prot=2026.05.29 02:45 mode=all census=9454 zone=NOROW inval=[none before confirmation] LIVE
id=2420 obst=2026.05.29 05:25 prot=2026.05.29 06:05 mode=nearest census=9625 zone=NOROW inval=[kill line 9719 t=2026.05.29 08:00] DEAD(2026.05.29 08:00)
id=2466 obst=2026.05.29 11:40 prot=2026.05.29 12:00 mode=nearest census=10281 zone=NOROW inval=[none before confirmation] LIVE
id=2475 obst=2026.05.29 12:40 prot=2026.05.29 13:05 mode=nearest census=10349 zone=NOROW inval=[kill line 10371 t=2026.05.29 13:35] DEAD(2026.05.29 13:35)
id=2473 obst=2026.05.29 12:25 prot=2026.05.29 13:55 mode=all census=10397 zone=159.235-159.288 [census promoT=2026.05.29 13:55 unique + XOBINPLAY line 10434] inval=[kill line 10762 t=2026.05.29 15:00] DEAD(2026.05.29 15:00)
  WP/WF: WProws=1468 WProvs=95 WFrows=17 WFovs=16 FIRST_WP=line 10400 bar=2026.05.29 13:55 o=159.285 h=159.291 l=159.284 c=159.285 [ENTERS] | FIRST_WF=line 10312 bar=2026.05.29 12:30 o=159.246 h=159.269 l=159.236 c=159.265 [ENTERS] | FORM=line 10309 bar=2026.05.29 12:25 o=159.285 h=159.288 l=159.235 c=159.248 | WIT=INPLAYCOMMIT line 10448 bar=2026.05.29 14:00 firstShift=3 firstVal=159.262 (n=3)
id=2493 obst=2026.05.29 15:05 prot=2026.05.29 15:40 mode=nearest census=11055 zone=159.252-159.275 [census promoT=2026.05.29 15:40 unique + XOBINPLAY line 11092] inval=[none before confirmation] LIVE
  WP/WF: WProws=1447 WProvs=53 WFrows=6 WFovs=5 FIRST_WP=line 11066 bar=2026.05.29 15:45 o=159.285 h=159.287 l=159.27 c=159.278 [ENTERS] | FIRST_WF=line 10968 bar=2026.05.29 15:10 o=159.262 h=159.274 l=159.251 c=159.265 [ENTERS] | FORM=line 10821 bar=2026.05.29 15:05 o=159.268 h=159.275 l=159.252 c=159.262 | WIT=zero-only(n=2)
id=2501 obst=2026.05.29 17:00 prot=2026.05.29 17:20 mode=nearest census=11582 zone=NOROW inval=[none before confirmation] LIVE
id=2509 obst=2026.05.29 18:20 prot=2026.05.29 19:10 mode=all census=11754 zone=NOROW inval=[none before confirmation] LIVE
id=2510 obst=2026.05.29 18:30 prot=2026.05.29 19:10 mode=all census=11755 zone=NOROW inval=[none before confirmation] LIVE
id=2523 obst=2026.05.29 20:05 prot=2026.05.29 20:20 mode=nearest census=11817 zone=NOROW inval=[none before confirmation] LIVE
id=2516 obst=2026.05.29 19:20 prot=2026.05.29 20:30 mode=nearest census=11828 zone=NOROW inval=[none before confirmation] LIVE
id=2530 obst=2026.05.29 20:45 prot=2026.05.29 21:00 mode=nearest census=11855 zone=NOROW inval=[none before confirmation] LIVE
id=2561 obst=2026.06.01 01:10 prot=2026.06.01 01:35 mode=nearest census=12111 zone=NOROW inval=[none before confirmation] LIVE
id=2566 obst=2026.06.01 01:50 prot=2026.06.01 03:15 mode=nearest census=12205 zone=159.382-159.407 [ZONEID 17434 + ZONEPICK 17436] inval=[none before confirmation] LIVE
  WP/WF: WProws=1308 WProvs=2 WFrows=16 WFovs=10 FIRST_WP=line 12207 bar=2026.06.01 03:15 o=159.409 h=159.422 l=159.4 c=159.416 [ENTERS] | FIRST_WF=line 12130 bar=2026.06.01 01:55 o=159.383 h=159.387 l=159.371 c=159.386 [ENTERS] | FORM=line 12126 bar=2026.06.01 01:50 o=159.407 h=159.407 l=159.382 c=159.385 | WIT=zero-only(n=40)
id=2617 obst=2026.06.01 10:35 prot=2026.06.01 10:45 mode=nearest census=15010 zone=159.443-159.462 [census promoT=2026.06.01 10:45 unique + XOBINPLAY line 15040] inval=[none before confirmation] LIVE
  WP/WF: WProws=1218 WProvs=46 WFrows=1 WFovs=1 FIRST_WP=line 15354 bar=2026.06.01 11:00 o=159.464 h=159.469 l=159.454 c=159.466 [ENTERS] | FIRST_WF=line 14851 bar=2026.06.01 10:40 o=159.45 h=159.476 l=159.449 c=159.469 [ENTERS] | FORM=line 14711 bar=2026.06.01 10:35 o=159.458 h=159.462 l=159.443 c=159.447 | WIT=INPLAYCOMMIT line 15053 bar=2026.06.01 10:45 firstShift=2 firstVal=159.443 (n=1)
id=2626 obst=2026.06.01 11:55 prot=2026.06.01 12:15 mode=nearest census=15748 zone=NOROW inval=[kill line 15834 t=2026.06.01 13:50] DEAD(2026.06.01 13:50)
id=2634 obst=2026.06.01 13:05 prot=2026.06.01 13:20 mode=nearest census=15809 zone=NOROW inval=[none before confirmation] LIVE
id=2648 obst=2026.06.01 15:40 prot=2026.06.01 16:00 mode=all census=17761 zone=NOROW inval=[none before confirmation] LIVE
id=2687 obst=2026.06.01 20:25 prot=2026.06.01 21:55 mode=nearest census=18228 zone=NOROW inval=[kill line 18330 t=2026.06.02 00:05] DEAD(2026.06.02 00:05)
id=2720 obst=2026.06.02 00:50 prot=2026.06.02 01:05 mode=nearest census=18398 zone=159.586-159.605 [ZONEID 20430 + ZONEPICK 20432] inval=[none before confirmation] LIVE
  WP/WF: WProws=1046 WProvs=4 WFrows=2 WFovs=1 FIRST_WP=line 26128 bar=2026.06.03 10:35 o=159.77 h=159.787 l=159.55 c=159.771 [ENTERS] | FIRST_WF=line 18388 bar=2026.06.02 00:55 o=159.595 h=159.674 l=159.577 c=159.617 [ENTERS] | FORM=line 18384 bar=2026.06.02 00:50 o=159.6 h=159.605 l=159.586 c=159.592 | WIT=zero-only(n=2)
id=2733 obst=2026.06.02 02:55 prot=2026.06.02 03:10 mode=all census=18509 zone=NOROW inval=[kill line 18567 t=2026.06.02 04:15] DEAD(2026.06.02 04:15)
id=2743 obst=2026.06.02 04:30 prot=2026.06.02 04:55 mode=nearest census=18608 zone=159.664-159.677 [ZONEID 19259 + ZONEPICK 19261] inval=[kill line 19940 t=2026.06.02 11:05] DEAD(2026.06.02 11:05)
  WP/WF: WProws=1000 WProvs=16 WFrows=4 WFovs=2 FIRST_WP=line 19943 bar=2026.06.02 11:00 o=159.693 h=159.698 l=159.66 c=159.669 [ENTERS] | FIRST_WF=line 18591 bar=2026.06.02 04:35 o=159.667 h=159.68 l=159.657 c=159.678 [ENTERS] | FORM=line 18586 bar=2026.06.02 04:30 o=159.671 h=159.677 l=159.664 c=159.67 | WIT=zero-only(n=6)
id=2789 obst=2026.06.02 11:15 prot=2026.06.02 11:30 mode=all census=20446 zone=159.679-159.694 [ZONEID 23809 + ZONEPICK 23811] inval=[kill line 26136 t=2026.06.03 10:45] DEAD(2026.06.03 10:45)
  WP/WF: WProws=921 WProvs=13 WFrows=2 WFovs=2 FIRST_WP=line 26128 bar=2026.06.03 10:35 o=159.77 h=159.787 l=159.55 c=159.771 [ENTERS] | FIRST_WF=line 20132 bar=2026.06.02 11:20 o=159.684 h=159.7 l=159.678 c=159.695 [ENTERS] | FORM=line 19984 bar=2026.06.02 11:15 o=159.691 h=159.694 l=159.679 c=159.684 | WIT=zero-only(n=38)
id=2786 obst=2026.06.02 10:40 prot=2026.06.02 12:05 mode=nearest census=21417 zone=NOROW inval=[none before confirmation] LIVE
id=2798 obst=2026.06.02 12:25 prot=2026.06.02 13:05 mode=nearest census=21475 zone=NOROW inval=[kill line 21514 t=2026.06.02 13:55] DEAD(2026.06.02 13:55)
id=2812 obst=2026.06.02 15:25 prot=2026.06.02 16:20 mode=all census=24201 zone=NOROW inval=[kill line 26135 t=2026.06.03 10:45] DEAD(2026.06.03 10:45)
id=2815 obst=2026.06.02 16:10 prot=2026.06.02 16:35 mode=nearest census=24246 zone=NOROW inval=[none before confirmation] LIVE
id=2820 obst=2026.06.02 16:55 prot=2026.06.02 17:10 mode=nearest census=24346 zone=NOROW inval=[none before confirmation] LIVE
id=2832 obst=2026.06.02 18:20 prot=2026.06.02 18:35 mode=nearest census=24590 zone=NOROW inval=[kill line 24985 t=2026.06.03 00:10] DEAD(2026.06.03 00:10)
id=2826 obst=2026.06.02 17:25 prot=2026.06.02 22:40 mode=all census=24896 zone=NOROW inval=[kill line 25234 t=2026.06.03 04:45] DEAD(2026.06.03 04:45)
id=2868 obst=2026.06.02 22:40 prot=2026.06.02 22:55 mode=nearest census=24912 zone=NOROW inval=[none before confirmation] LIVE
id=2879 obst=2026.06.03 00:30 prot=2026.06.03 02:05 mode=all census=25084 zone=NOROW inval=[kill line 25216 t=2026.06.03 04:30] DEAD(2026.06.03 04:30)
id=2856 obst=2026.06.02 21:20 prot=2026.06.03 02:40 mode=all census=25112 zone=NOROW inval=[none before confirmation] LIVE
id=2925 obst=2026.06.03 08:10 prot=2026.06.03 08:25 mode=all census=25450 zone=NOROW inval=[none before confirmation] LIVE
id=2928 obst=2026.06.03 08:30 prot=2026.06.03 08:50 mode=nearest census=25472 zone=NOROW inval=[none before confirmation] LIVE
id=2930 obst=2026.06.03 08:45 prot=2026.06.03 09:00 mode=nearest census=25483 zone=159.906-159.913 [census promoT=2026.06.03 09:00 unique + XOBINPLAY line 25513] inval=[none before confirmation] LIVE
  WP/WF: WProws=663 WProvs=82 WFrows=2 WFovs=1 FIRST_WP=line 25485 bar=2026.06.03 09:00 o=159.927 h=159.927 l=159.905 c=159.91 [ENTERS] | FIRST_WF=NONE (first-any-overlap: line 25474 bar=2026.06.03 08:50 [OUTSIDE-through]) | FORM=line 25469 bar=2026.06.03 08:45 o=159.913 h=159.913 l=159.906 c=159.907 | WIT=zero-only(n=2)
id=2945 obst=2026.06.03 10:50 prot=2026.06.03 11:15 mode=all census=26203 zone=159.579-159.675 [census promoT=2026.06.03 11:15 unique + XOBINPLAY line 26469] inval=[none before confirmation] LIVE
  WP/WF: WProws=636 WProvs=5 WFrows=4 WFovs=4 FIRST_WP=line 26225 bar=2026.06.03 11:25 o=159.719 h=159.727 l=159.674 c=159.687 [ENTERS] | FIRST_WF=line 26173 bar=2026.06.03 10:55 o=159.614 h=159.702 l=159.612 c=159.7 [ENTERS] | FORM=line 26165 bar=2026.06.03 10:50 o=159.675 h=159.675 l=159.579 c=159.613 | WIT=XOBINPLAY line 26469 bar=2026.06.03 14:30 firstShift=17 firstVal=159.666 (n=4)
id=2976 obst=2026.06.03 15:10 prot=2026.06.03 15:40 mode=nearest census=26959 zone=159.806-159.855 [ZONEID 27171 + ZONEPICK 27173] inval=[none before confirmation] LIVE
  WP/WF: WProws=583 WProvs=59 WFrows=5 WFovs=3 FIRST_WP=line 28251 bar=2026.06.04 01:55 o=159.995 h=159.995 l=159.829 c=159.916 [ENTERS] | FIRST_WF=line 26923 bar=2026.06.03 15:15 o=159.806 h=159.852 l=159.8 c=159.852 [ENTERS] | FORM=line 26917 bar=2026.06.03 15:10 o=159.853 h=159.855 l=159.806 c=159.806 | WIT=zero-only(n=4)
id=2979 obst=2026.06.03 15:40 prot=2026.06.03 16:00 mode=nearest census=27187 zone=159.861-159.913 [census promoT=2026.06.03 16:00 unique + XOBINPLAY line 27340] inval=[kill line 28389 t=2026.06.04 04:50] DEAD(2026.06.04 04:50)
  WP/WF: WProws=579 WProvs=166 WFrows=3 WFovs=3 FIRST_WP=line 27189 bar=2026.06.03 16:00 o=159.914 h=159.926 l=159.891 c=159.899 [ENTERS] | FIRST_WF=line 26969 bar=2026.06.03 15:45 o=159.876 h=159.903 l=159.874 c=159.89 [ENTERS] | FORM=line 26962 bar=2026.06.03 15:40 o=159.904 h=159.913 l=159.861 c=159.876 | WIT=INPLAYCOMMIT line 27347 bar=2026.06.03 16:00 firstShift=4 firstVal=159.861 (n=3)
id=3010 obst=2026.06.03 20:05 prot=2026.06.03 20:20 mode=nearest census=27948 zone=NOROW inval=[kill line 28245 t=2026.06.04 02:00] DEAD(2026.06.04 02:00)
id=3003 obst=2026.06.03 19:20 prot=2026.06.03 21:00 mode=all census=27986 zone=NOROW inval=[kill line 28031 t=2026.06.03 21:50] DEAD(2026.06.03 21:50)
id=3015 obst=2026.06.03 20:50 prot=2026.06.03 21:35 mode=all census=28017 zone=NOROW inval=[kill line 28029 t=2026.06.03 21:50] DEAD(2026.06.03 21:50)
id=3025 obst=2026.06.03 22:00 prot=2026.06.03 22:35 mode=nearest census=28080 zone=NOROW inval=[none before confirmation] LIVE
id=3045 obst=2026.06.04 00:55 prot=2026.06.04 01:10 mode=nearest census=28208 zone=NOROW inval=[kill line 28244 t=2026.06.04 02:00] DEAD(2026.06.04 02:00)
id=3074 obst=2026.06.04 04:45 prot=2026.06.04 05:20 mode=all census=28428 zone=NOROW inval=[none before confirmation] LIVE
id=3061 obst=2026.06.04 02:30 prot=2026.06.04 06:40 mode=nearest census=28502 zone=NOROW inval=[none before confirmation] LIVE
id=3093 obst=2026.06.04 07:05 prot=2026.06.04 07:25 mode=nearest census=28541 zone=NOROW inval=[none before confirmation] LIVE
id=3099 obst=2026.06.04 07:40 prot=2026.06.04 08:15 mode=nearest census=28600 zone=NOROW inval=[kill line 29650 t=2026.06.04 14:20] DEAD(2026.06.04 14:20)
id=3108 obst=2026.06.04 09:00 prot=2026.06.04 09:25 mode=nearest census=28703 zone=NOROW inval=[none before confirmation] LIVE
id=3150 obst=2026.06.04 15:50 prot=2026.06.04 16:05 mode=nearest census=29846 zone=159.820-159.853 [census promoT=2026.06.04 16:05 unique + XOBINPLAY line 30022] inval=[none before confirmation] LIVE
  WP/WF: WProws=290 WProvs=9 WFrows=2 WFovs=1 FIRST_WP=line 29888 bar=2026.06.04 16:15 o=159.889 h=159.889 l=159.852 c=159.862 [ENTERS] | FIRST_WF=line 29810 bar=2026.06.04 15:55 o=159.832 h=159.864 l=159.832 c=159.864 [ENTERS] | FORM=line 29799 bar=2026.06.04 15:50 o=159.853 h=159.853 l=159.82 c=159.831 | WIT=XOBINPLAY line 30022 bar=2026.06.04 17:00 firstShift=5 firstVal=159.847 (n=2)
id=3121 obst=2026.06.04 11:00 prot=2026.06.04 17:00 mode=nearest census=30000 zone=NOROW inval=[kill line 32164 t=2026.06.05 14:40] DEAD(2026.06.05 14:40)
id=3160 obst=2026.06.04 17:00 prot=2026.06.04 18:00 mode=all census=30512 zone=159.878-159.916 [ZONEID 31478 + ZONEPICK 31480] inval=[kill line 32163 t=2026.06.05 14:40] DEAD(2026.06.05 14:40)
  WP/WF: WProws=267 WProvs=33 WFrows=11 WFovs=4 FIRST_WP=line 31115 bar=2026.06.05 04:05 o=159.927 h=159.93 l=159.899 c=159.922 [ENTERS] | FIRST_WF=line 30047 bar=2026.06.04 17:05 o=159.901 h=159.919 l=159.9 c=159.915 [ENTERS] | FORM=line 30002 bar=2026.06.04 17:00 o=159.916 h=159.916 l=159.878 c=159.901 | WIT=zero-only(n=2)
id=3178 obst=2026.06.04 19:25 prot=2026.06.04 19:40 mode=nearest census=30647 zone=NOROW inval=[kill line 30934 t=2026.06.05 00:55] DEAD(2026.06.05 00:55)
id=3176 obst=2026.06.04 19:05 prot=2026.06.04 19:45 mode=nearest census=30654 zone=NOROW inval=[kill line 30935 t=2026.06.05 00:55] DEAD(2026.06.05 00:55)
id=3173 obst=2026.06.04 18:45 prot=2026.06.04 20:25 mode=nearest census=30692 zone=NOROW inval=[none before confirmation] LIVE
id=3192 obst=2026.06.04 21:10 prot=2026.06.04 21:35 mode=nearest census=30759 zone=NOROW inval=[kill line 30925 t=2026.06.05 00:50] DEAD(2026.06.05 00:50)
id=3190 obst=2026.06.04 21:00 prot=2026.06.04 21:40 mode=nearest census=30765 zone=NOROW inval=[kill line 30926 t=2026.06.05 00:50] DEAD(2026.06.05 00:50)
id=3201 obst=2026.06.04 22:30 prot=2026.06.04 23:20 mode=nearest census=30853 zone=NOROW inval=[none before confirmation] LIVE
id=3240 obst=2026.06.05 04:15 prot=2026.06.05 04:30 mode=nearest census=31140 zone=NOROW inval=[kill line 31371 t=2026.06.05 08:35] DEAD(2026.06.05 08:35)
id=3243 obst=2026.06.05 04:30 prot=2026.06.05 05:00 mode=nearest census=31170 zone=NOROW inval=[none before confirmation] LIVE
id=3247 obst=2026.06.05 05:00 prot=2026.06.05 06:00 mode=all census=31224 zone=NOROW inval=[kill line 31272 t=2026.06.05 06:50] DEAD(2026.06.05 06:50)
id=3253 obst=2026.06.05 05:35 prot=2026.06.05 06:05 mode=nearest census=31231 zone=NOROW inval=[kill line 31260 t=2026.06.05 06:40] DEAD(2026.06.05 06:40)
id=3262 obst=2026.06.05 06:45 prot=2026.06.05 07:25 mode=all census=31311 zone=NOROW inval=[kill line 31358 t=2026.06.05 08:25] DEAD(2026.06.05 08:25)
id=3281 obst=2026.06.05 10:45 prot=2026.06.05 11:05 mode=nearest census=31922 zone=NOROW inval=[none before confirmation] LIVE
id=3308 obst=2026.06.05 14:35 prot=2026.06.05 15:40 mode=nearest census=32303 zone=159.881-159.916 [ZONEID 33106 + ZONEPICK 33108] inval=[none before confirmation] [PICK] LIVE
  WP/WF: WProws=7 WProvs=1 WFrows=12 WFovs=6 FIRST_WP=line 32719 bar=2026.06.05 16:00 o=160.216 h=160.262 l=159.726 c=160.034 [ENTERS] | FIRST_WF=line 32176 bar=2026.06.05 14:40 o=159.892 h=159.892 l=159.884 c=159.886 [ENTERS] | FORM=line 32167 bar=2026.06.05 14:35 o=159.907 h=159.916 l=159.881 c=159.892 | WIT=zero-only(n=10) [PICK]
## --- F1a LONG conf=2026.06.02 15:30 pick=2789
COUNT live-candidate=230
id=18 obst=2026.05.08 16:40 prot=2026.05.08 18:05 mode=all census=222 zone=NOROW inval=[kill line 273 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=29 obst=2026.05.08 18:05 prot=2026.05.08 18:45 mode=all census=227 zone=NOROW inval=[kill line 270 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=40 obst=2026.05.08 19:45 prot=2026.05.08 20:05 mode=nearest census=239 zone=NOROW inval=[none before confirmation] LIVE
id=58 obst=2026.05.08 22:10 prot=2026.05.08 22:30 mode=nearest census=250 zone=NOROW inval=[none before confirmation] LIVE
id=56 obst=2026.05.08 21:45 prot=2026.05.08 23:05 mode=all census=254 zone=NOROW inval=[kill line 261 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=78 obst=2026.05.11 00:25 prot=2026.05.11 00:35 mode=nearest census=281 zone=NOROW inval=[none before confirmation] LIVE
id=65 obst=2026.05.08 22:55 prot=2026.05.11 04:10 mode=all census=302 zone=NOROW inval=[none before confirmation] LIVE
id=107 obst=2026.05.11 05:00 prot=2026.05.11 05:50 mode=nearest census=311 zone=NOROW inval=[kill line 320 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=147 obst=2026.05.11 10:35 prot=2026.05.11 10:55 mode=nearest census=343 zone=NOROW inval=[kill line 347 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=162 obst=2026.05.11 12:00 prot=2026.05.11 12:20 mode=nearest census=360 zone=NOROW inval=[kill line 392 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=172 obst=2026.05.11 13:30 prot=2026.05.11 14:00 mode=all census=375 zone=NOROW inval=[none before confirmation] LIVE
id=181 obst=2026.05.11 14:45 prot=2026.05.11 15:00 mode=nearest census=383 zone=NOROW inval=[none before confirmation] LIVE
id=212 obst=2026.05.11 18:50 prot=2026.05.11 19:20 mode=nearest census=417 zone=NOROW inval=[none before confirmation] LIVE
id=221 obst=2026.05.11 20:30 prot=2026.05.11 21:30 mode=nearest census=433 zone=NOROW inval=[kill line 450 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=256 obst=2026.05.12 01:10 prot=2026.05.12 01:25 mode=nearest census=460 zone=NOROW inval=[none before confirmation] LIVE
id=261 obst=2026.05.12 02:00 prot=2026.05.12 03:00 mode=all census=468 zone=NOROW inval=[none before confirmation] LIVE
id=302 obst=2026.05.12 08:25 prot=2026.05.12 08:40 mode=nearest census=497 zone=NOROW inval=[none before confirmation] LIVE
id=313 obst=2026.05.12 09:30 prot=2026.05.12 10:00 mode=nearest census=514 zone=NOROW inval=[none before confirmation] LIVE
id=327 obst=2026.05.12 11:45 prot=2026.05.12 12:10 mode=nearest census=524 zone=NOROW inval=[none before confirmation] LIVE
id=352 obst=2026.05.12 16:20 prot=2026.05.12 16:40 mode=nearest census=556 zone=NOROW inval=[none before confirmation] LIVE
id=354 obst=2026.05.12 16:40 prot=2026.05.12 16:55 mode=nearest census=558 zone=NOROW inval=[none before confirmation] LIVE
id=348 obst=2026.05.12 15:50 prot=2026.05.12 18:05 mode=all census=566 zone=NOROW inval=[kill line 605 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=350 obst=2026.05.12 16:00 prot=2026.05.12 18:05 mode=all census=567 zone=NOROW inval=[kill line 620 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=364 obst=2026.05.12 18:05 prot=2026.05.12 18:20 mode=nearest census=570 zone=NOROW inval=[kill line 596 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=361 obst=2026.05.12 17:30 prot=2026.05.12 19:50 mode=all census=581 zone=NOROW inval=[kill line 597 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=402 obst=2026.05.12 22:50 prot=2026.05.12 23:05 mode=nearest census=613 zone=NOROW inval=[kill line 618 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=415 obst=2026.05.13 00:30 prot=2026.05.13 00:45 mode=nearest census=626 zone=NOROW inval=[kill line 627 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=414 obst=2026.05.13 00:15 prot=2026.05.13 01:10 mode=all census=633 zone=NOROW inval=[none before confirmation] LIVE
id=424 obst=2026.05.13 01:25 prot=2026.05.13 01:40 mode=nearest census=635 zone=NOROW inval=[none before confirmation] LIVE
id=440 obst=2026.05.13 03:35 prot=2026.05.13 03:55 mode=nearest census=667 zone=NOROW inval=[none before confirmation] LIVE
id=449 obst=2026.05.13 05:00 prot=2026.05.13 05:15 mode=nearest census=675 zone=NOROW inval=[none before confirmation] LIVE
id=447 obst=2026.05.13 04:45 prot=2026.05.13 06:20 mode=all census=678 zone=NOROW inval=[none before confirmation] LIVE
id=460 obst=2026.05.13 06:40 prot=2026.05.13 07:05 mode=nearest census=686 zone=NOROW inval=[none before confirmation] LIVE
id=463 obst=2026.05.13 07:00 prot=2026.05.13 07:35 mode=nearest census=689 zone=NOROW inval=[none before confirmation] LIVE
id=474 obst=2026.05.13 09:30 prot=2026.05.13 09:55 mode=nearest census=704 zone=NOROW inval=[none before confirmation] LIVE
id=445 obst=2026.05.13 04:20 prot=2026.05.13 10:40 mode=all census=713 zone=NOROW inval=[none before confirmation] LIVE
id=480 obst=2026.05.13 10:20 prot=2026.05.13 10:45 mode=nearest census=714 zone=NOROW inval=[kill line 817 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=492 obst=2026.05.13 11:45 prot=2026.05.13 12:25 mode=nearest census=722 zone=NOROW inval=[none before confirmation] LIVE
id=490 obst=2026.05.13 11:25 prot=2026.05.13 13:30 mode=all census=730 zone=NOROW inval=[kill line 736 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=502 obst=2026.05.13 13:20 prot=2026.05.13 13:35 mode=nearest census=731 zone=NOROW inval=[none before confirmation] LIVE
id=513 obst=2026.05.13 15:00 prot=2026.05.13 15:20 mode=nearest census=745 zone=NOROW inval=[none before confirmation] LIVE
id=526 obst=2026.05.13 16:40 prot=2026.05.13 17:25 mode=nearest census=764 zone=NOROW inval=[kill line 776 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=559 obst=2026.05.13 22:25 prot=2026.05.13 22:45 mode=nearest census=800 zone=NOROW inval=[none before confirmation] LIVE
id=566 obst=2026.05.13 23:35 prot=2026.05.13 23:50 mode=all census=808 zone=NOROW inval=[none before confirmation] LIVE
id=594 obst=2026.05.14 02:50 prot=2026.05.14 03:05 mode=nearest census=836 zone=NOROW inval=[none before confirmation] LIVE
id=603 obst=2026.05.14 03:45 prot=2026.05.14 04:10 mode=nearest census=841 zone=NOROW inval=[kill line 869 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=578 obst=2026.05.14 00:55 prot=2026.05.14 04:30 mode=all census=845 zone=NOROW inval=[kill line 877 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=601 obst=2026.05.14 03:35 prot=2026.05.14 04:30 mode=all census=846 zone=NOROW inval=[kill line 870 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=552 obst=2026.05.13 21:00 prot=2026.05.14 05:15 mode=all census=852 zone=NOROW inval=[kill line 867 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=556 obst=2026.05.13 21:50 prot=2026.05.14 05:15 mode=all census=853 zone=NOROW inval=[kill line 866 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=612 obst=2026.05.14 05:00 prot=2026.05.14 05:20 mode=nearest census=854 zone=NOROW inval=[kill line 864 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=637 obst=2026.05.14 07:45 prot=2026.05.14 08:05 mode=nearest census=891 zone=NOROW inval=[none before confirmation] LIVE
id=660 obst=2026.05.14 10:40 prot=2026.05.14 11:00 mode=all census=913 zone=NOROW inval=[none before confirmation] LIVE
id=673 obst=2026.05.14 12:45 prot=2026.05.14 13:05 mode=nearest census=925 zone=NOROW inval=[none before confirmation] LIVE
id=676 obst=2026.05.14 13:10 prot=2026.05.14 14:40 mode=all census=933 zone=NOROW inval=[none before confirmation] LIVE
id=681 obst=2026.05.14 14:05 prot=2026.05.14 15:00 mode=all census=939 zone=NOROW inval=[kill line 940 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=701 obst=2026.05.14 17:45 prot=2026.05.14 18:00 mode=nearest census=971 zone=NOROW inval=[none before confirmation] LIVE
id=696 obst=2026.05.14 16:40 prot=2026.05.14 18:05 mode=nearest census=973 zone=NOROW inval=[none before confirmation] LIVE
id=698 obst=2026.05.14 17:00 prot=2026.05.14 19:25 mode=all census=981 zone=NOROW inval=[none before confirmation] LIVE
id=714 obst=2026.05.14 19:15 prot=2026.05.14 19:30 mode=nearest census=982 zone=NOROW inval=[none before confirmation] LIVE
id=706 obst=2026.05.14 18:10 prot=2026.05.14 19:35 mode=nearest census=984 zone=NOROW inval=[none before confirmation] LIVE
id=724 obst=2026.05.14 20:45 prot=2026.05.14 21:00 mode=nearest census=994 zone=NOROW inval=[none before confirmation] LIVE
id=731 obst=2026.05.14 21:40 prot=2026.05.14 22:25 mode=nearest census=1003 zone=NOROW inval=[none before confirmation] LIVE
id=753 obst=2026.05.15 00:55 prot=2026.05.15 02:15 mode=all census=1023 zone=NOROW inval=[none before confirmation] LIVE
id=775 obst=2026.05.15 04:30 prot=2026.05.15 05:05 mode=nearest census=1042 zone=NOROW inval=[none before confirmation] LIVE
id=802 obst=2026.05.15 08:50 prot=2026.05.15 09:10 mode=nearest census=1067 zone=NOROW inval=[none before confirmation] LIVE
id=816 obst=2026.05.15 10:30 prot=2026.05.15 10:50 mode=nearest census=1082 zone=NOROW inval=[kill line 1110 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=815 obst=2026.05.15 10:20 prot=2026.05.15 10:55 mode=nearest census=1084 zone=NOROW inval=[kill line 1111 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=820 obst=2026.05.15 10:50 prot=2026.05.15 11:20 mode=nearest census=1089 zone=NOROW inval=[none before confirmation] LIVE
id=825 obst=2026.05.15 11:30 prot=2026.05.15 12:00 mode=nearest census=1095 zone=NOROW inval=[kill line 1105 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=841 obst=2026.05.15 13:30 prot=2026.05.15 14:25 mode=nearest census=1125 zone=NOROW inval=[none before confirmation] LIVE
id=851 obst=2026.05.15 14:45 prot=2026.05.15 15:00 mode=nearest census=1130 zone=NOROW inval=[none before confirmation] LIVE
id=861 obst=2026.05.15 16:10 prot=2026.05.15 16:25 mode=nearest census=1139 zone=NOROW inval=[kill line 1200 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=878 obst=2026.05.15 18:35 prot=2026.05.15 18:50 mode=nearest census=1158 zone=NOROW inval=[none before confirmation] LIVE
id=888 obst=2026.05.15 20:20 prot=2026.05.15 21:05 mode=all census=1171 zone=NOROW inval=[none before confirmation] LIVE
id=881 obst=2026.05.15 18:55 prot=2026.05.15 21:10 mode=nearest census=1172 zone=NOROW inval=[none before confirmation] LIVE
id=908 obst=2026.05.15 23:05 prot=2026.05.15 23:25 mode=nearest census=1187 zone=NOROW inval=[none before confirmation] LIVE
id=913 obst=2026.05.15 23:40 prot=2026.05.15 23:55 mode=nearest census=1195 zone=NOROW inval=[none before confirmation] LIVE
id=923 obst=2026.05.18 00:30 prot=2026.05.18 00:50 mode=nearest census=1210 zone=NOROW inval=[none before confirmation] LIVE
id=911 obst=2026.05.15 23:30 prot=2026.05.18 02:05 mode=all census=1218 zone=NOROW inval=[kill line 1322 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=936 obst=2026.05.18 02:15 prot=2026.05.18 02:35 mode=nearest census=1221 zone=NOROW inval=[none before confirmation] LIVE
id=930 obst=2026.05.18 01:20 prot=2026.05.18 03:35 mode=all census=1229 zone=NOROW inval=[kill line 1321 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=934 obst=2026.05.18 01:55 prot=2026.05.18 03:35 mode=all census=1230 zone=NOROW inval=[kill line 1318 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=945 obst=2026.05.18 03:25 prot=2026.05.18 03:45 mode=nearest census=1233 zone=NOROW inval=[none before confirmation] LIVE
id=954 obst=2026.05.18 04:45 prot=2026.05.18 05:05 mode=nearest census=1243 zone=NOROW inval=[none before confirmation] LIVE
id=964 obst=2026.05.18 06:25 prot=2026.05.18 06:40 mode=nearest census=1249 zone=NOROW inval=[kill line 1261 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=967 obst=2026.05.18 06:40 prot=2026.05.18 06:55 mode=nearest census=1251 zone=NOROW inval=[kill line 1260 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=958 obst=2026.05.18 05:05 prot=2026.05.18 07:15 mode=all census=1255 zone=NOROW inval=[kill line 1263 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=993 obst=2026.05.18 09:50 prot=2026.05.18 10:10 mode=nearest census=1279 zone=NOROW inval=[none before confirmation] LIVE
id=991 obst=2026.05.18 09:30 prot=2026.05.18 10:15 mode=all census=1281 zone=NOROW inval=[none before confirmation] LIVE
id=1013 obst=2026.05.18 12:30 prot=2026.05.18 12:55 mode=nearest census=1305 zone=NOROW inval=[none before confirmation] LIVE
id=1038 obst=2026.05.18 16:05 prot=2026.05.18 16:25 mode=nearest census=1334 zone=NOROW inval=[none before confirmation] LIVE
id=1047 obst=2026.05.18 17:15 prot=2026.05.18 17:40 mode=nearest census=1349 zone=NOROW inval=[none before confirmation] LIVE
id=1060 obst=2026.05.18 18:50 prot=2026.05.18 19:30 mode=all census=1369 zone=NOROW inval=[kill line 1402 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1055 obst=2026.05.18 18:10 prot=2026.05.18 19:35 mode=nearest census=1371 zone=NOROW inval=[none before confirmation] LIVE
id=980 obst=2026.05.18 08:00 prot=2026.05.18 21:30 mode=nearest census=1379 zone=NOROW inval=[none before confirmation] LIVE
id=1081 obst=2026.05.18 21:30 prot=2026.05.18 21:50 mode=all census=1383 zone=NOROW inval=[none before confirmation] LIVE
id=1103 obst=2026.05.19 00:30 prot=2026.05.19 01:15 mode=nearest census=1415 zone=NOROW inval=[none before confirmation] LIVE
id=1116 obst=2026.05.19 01:45 prot=2026.05.19 02:00 mode=nearest census=1418 zone=NOROW inval=[none before confirmation] LIVE
id=1120 obst=2026.05.19 02:25 prot=2026.05.19 02:50 mode=nearest census=1424 zone=NOROW inval=[kill line 1577 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1096 obst=2026.05.18 23:40 prot=2026.05.19 03:00 mode=nearest census=1428 zone=NOROW inval=[kill line 1580 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1154 obst=2026.05.19 06:35 prot=2026.05.19 06:50 mode=nearest census=1454 zone=NOROW inval=[none before confirmation] LIVE
id=1162 obst=2026.05.19 07:15 prot=2026.05.19 07:30 mode=nearest census=1460 zone=NOROW inval=[kill line 1567 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1164 obst=2026.05.19 07:35 prot=2026.05.19 07:50 mode=nearest census=1466 zone=NOROW inval=[kill line 1566 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1167 obst=2026.05.19 07:50 prot=2026.05.19 08:05 mode=nearest census=1470 zone=NOROW inval=[none before confirmation] LIVE
id=1083 obst=2026.05.18 22:00 prot=2026.05.19 10:05 mode=nearest census=1481 zone=NOROW inval=[kill line 1570 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1192 obst=2026.05.19 11:30 prot=2026.05.19 12:00 mode=nearest census=1492 zone=NOROW inval=[none before confirmation] LIVE
id=1208 obst=2026.05.19 13:20 prot=2026.05.19 13:40 mode=nearest census=1504 zone=NOROW inval=[none before confirmation] LIVE
id=1188 obst=2026.05.19 10:45 prot=2026.05.19 15:00 mode=all census=1517 zone=NOROW inval=[none before confirmation] LIVE
id=1226 obst=2026.05.19 16:50 prot=2026.05.19 17:30 mode=nearest census=1549 zone=NOROW inval=[kill line 1564 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1235 obst=2026.05.19 18:15 prot=2026.05.19 18:30 mode=nearest census=1555 zone=NOROW inval=[kill line 1561 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1257 obst=2026.05.19 21:40 prot=2026.05.19 21:55 mode=nearest census=1588 zone=NOROW inval=[kill line 1606 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1263 obst=2026.05.19 22:10 prot=2026.05.19 22:30 mode=nearest census=1593 zone=NOROW inval=[none before confirmation] LIVE
id=1288 obst=2026.05.20 01:05 prot=2026.05.20 01:25 mode=nearest census=1616 zone=NOROW inval=[kill line 1620 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1336 obst=2026.05.20 08:30 prot=2026.05.20 09:00 mode=nearest census=1665 zone=NOROW inval=[none before confirmation] LIVE
id=1350 obst=2026.05.20 10:25 prot=2026.05.20 10:45 mode=nearest census=1677 zone=NOROW inval=[kill line 1703 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1353 obst=2026.05.20 10:50 prot=2026.05.20 11:20 mode=nearest census=1682 zone=NOROW inval=[none before confirmation] LIVE
id=1368 obst=2026.05.20 13:45 prot=2026.05.20 14:10 mode=nearest census=1698 zone=NOROW inval=[kill line 1702 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1382 obst=2026.05.20 15:55 prot=2026.05.20 16:15 mode=all census=1712 zone=NOROW inval=[none before confirmation] LIVE
id=1387 obst=2026.05.20 16:40 prot=2026.05.20 17:05 mode=nearest census=1724 zone=NOROW inval=[none before confirmation] LIVE
id=1397 obst=2026.05.20 18:00 prot=2026.05.20 18:15 mode=nearest census=1750 zone=NOROW inval=[none before confirmation] LIVE
id=1405 obst=2026.05.20 18:45 prot=2026.05.20 19:00 mode=nearest census=1757 zone=NOROW inval=[none before confirmation] LIVE
id=1432 obst=2026.05.20 22:35 prot=2026.05.20 22:55 mode=nearest census=1785 zone=NOROW inval=[kill line 2196 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1448 obst=2026.05.21 00:40 prot=2026.05.21 01:10 mode=nearest census=1802 zone=NOROW inval=[kill line 1799 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1452 obst=2026.05.21 01:10 prot=2026.05.21 02:30 mode=nearest census=1811 zone=NOROW inval=[kill line 1823 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1465 obst=2026.05.21 02:45 prot=2026.05.21 03:05 mode=nearest census=1815 zone=NOROW inval=[none before confirmation] LIVE
id=1475 obst=2026.05.21 04:30 prot=2026.05.21 04:50 mode=nearest census=1836 zone=NOROW inval=[kill line 2195 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1482 obst=2026.05.21 05:30 prot=2026.05.21 05:55 mode=nearest census=1845 zone=NOROW inval=[kill line 1970 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1495 obst=2026.05.21 08:00 prot=2026.05.21 08:20 mode=nearest census=1853 zone=NOROW inval=[kill line 1878 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1493 obst=2026.05.21 07:25 prot=2026.05.21 09:20 mode=all census=1858 zone=NOROW inval=[kill line 1883 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1501 obst=2026.05.21 08:50 prot=2026.05.21 09:20 mode=all census=1859 zone=NOROW inval=[kill line 1877 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1503 obst=2026.05.21 09:05 prot=2026.05.21 09:40 mode=all census=1864 zone=NOROW inval=[kill line 1876 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1505 obst=2026.05.21 09:20 prot=2026.05.21 09:45 mode=nearest census=1865 zone=NOROW inval=[kill line 1871 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1526 obst=2026.05.21 12:45 prot=2026.05.21 13:00 mode=nearest census=1899 zone=NOROW inval=[kill line 1968 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1531 obst=2026.05.21 13:10 prot=2026.05.21 13:25 mode=all census=1908 zone=NOROW inval=[kill line 1961 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1514 obst=2026.05.21 10:30 prot=2026.05.21 13:35 mode=nearest census=1911 zone=NOROW inval=[kill line 1959 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1537 obst=2026.05.21 14:20 prot=2026.05.21 14:45 mode=nearest census=1916 zone=NOROW inval=[kill line 1958 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1543 obst=2026.05.21 15:00 prot=2026.05.21 15:25 mode=all census=1923 zone=NOROW inval=[none before confirmation] LIVE
id=1548 obst=2026.05.21 15:45 prot=2026.05.21 16:10 mode=all census=1929 zone=NOROW inval=[none before confirmation] LIVE
id=1614 obst=2026.05.22 00:10 prot=2026.05.22 00:35 mode=nearest census=1994 zone=NOROW inval=[kill line 2192 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1630 obst=2026.05.22 02:45 prot=2026.05.22 03:55 mode=all census=2003 zone=NOROW inval=[kill line 2015 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1631 obst=2026.05.22 03:05 prot=2026.05.22 03:55 mode=all census=2004 zone=NOROW inval=[kill line 2013 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1641 obst=2026.05.22 04:50 prot=2026.05.22 05:05 mode=nearest census=2008 zone=NOROW inval=[none before confirmation] LIVE
id=1654 obst=2026.05.22 07:15 prot=2026.05.22 07:30 mode=nearest census=2026 zone=NOROW inval=[kill line 2092 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1669 obst=2026.05.22 09:25 prot=2026.05.22 10:40 mode=all census=2043 zone=NOROW inval=[none before confirmation] LIVE
id=1679 obst=2026.05.22 11:35 prot=2026.05.22 12:25 mode=nearest census=2061 zone=NOROW inval=[none before confirmation] LIVE
id=1691 obst=2026.05.22 13:15 prot=2026.05.22 13:35 mode=nearest census=2069 zone=NOROW inval=[none before confirmation] LIVE
id=1706 obst=2026.05.22 16:05 prot=2026.05.22 17:05 mode=all census=2103 zone=NOROW inval=[kill line 2188 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1717 obst=2026.05.22 18:25 prot=2026.05.22 18:40 mode=nearest census=2117 zone=NOROW inval=[kill line 2128 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1575 obst=2026.05.21 19:25 prot=2026.05.22 18:45 mode=nearest census=2119 zone=NOROW inval=[none before confirmation] LIVE
id=1734 obst=2026.05.22 20:35 prot=2026.05.22 21:30 mode=all census=2138 zone=NOROW inval=[kill line 2184 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1769 obst=2026.05.25 02:35 prot=2026.05.25 02:50 mode=nearest census=2339 zone=NOROW inval=[none before confirmation] LIVE
id=1780 obst=2026.05.25 04:35 prot=2026.05.25 04:50 mode=nearest census=2461 zone=NOROW inval=[none before confirmation] LIVE
id=1779 obst=2026.05.25 04:25 prot=2026.05.25 06:45 mode=all census=2557 zone=NOROW inval=[none before confirmation] LIVE
id=1785 obst=2026.05.25 05:05 prot=2026.05.25 06:45 mode=all census=2558 zone=NOROW inval=[none before confirmation] LIVE
id=1788 obst=2026.05.25 05:35 prot=2026.05.25 06:45 mode=all census=2559 zone=NOROW inval=[kill line 3816 t=2026.05.26 00:05] DEAD(2026.05.26 00:05)
id=1794 obst=2026.05.25 06:35 prot=2026.05.25 06:50 mode=nearest census=2565 zone=NOROW inval=[none before confirmation] LIVE
id=1819 obst=2026.05.25 09:55 prot=2026.05.25 10:10 mode=nearest census=2789 zone=NOROW inval=[kill line 2959 t=2026.05.25 12:05] DEAD(2026.05.25 12:05)
id=1812 obst=2026.05.25 09:00 prot=2026.05.25 10:15 mode=nearest census=2802 zone=NOROW inval=[kill line 2936 t=2026.05.25 11:50] DEAD(2026.05.25 11:50)
id=1841 obst=2026.05.25 12:40 prot=2026.05.25 13:15 mode=all census=3032 zone=NOROW inval=[kill line 3131 t=2026.05.25 14:40] DEAD(2026.05.25 14:40)
id=1863 obst=2026.05.25 16:30 prot=2026.05.25 16:55 mode=nearest census=3332 zone=NOROW inval=[none before confirmation] LIVE
id=1857 obst=2026.05.25 15:20 prot=2026.05.25 18:05 mode=all census=3448 zone=NOROW inval=[none before confirmation] LIVE
id=1865 obst=2026.05.25 17:00 prot=2026.05.25 18:05 mode=all census=3449 zone=NOROW inval=[none before confirmation] LIVE
id=1874 obst=2026.05.25 18:50 prot=2026.05.25 19:10 mode=nearest census=3548 zone=NOROW inval=[none before confirmation] LIVE
id=1892 obst=2026.05.25 22:35 prot=2026.05.25 22:55 mode=nearest census=3742 zone=NOROW inval=[kill line 3804 t=2026.05.26 00:00] DEAD(2026.05.26 00:00)
id=1878 obst=2026.05.25 19:55 prot=2026.05.25 23:00 mode=nearest census=3749 zone=NOROW inval=[kill line 3807 t=2026.05.26 00:00] DEAD(2026.05.26 00:00)
id=1897 obst=2026.05.25 23:10 prot=2026.05.25 23:30 mode=nearest census=3777 zone=NOROW inval=[kill line 3803 t=2026.05.26 00:00] DEAD(2026.05.26 00:00)
id=1905 obst=2026.05.26 00:20 prot=2026.05.26 02:25 mode=all census=3944 zone=NOROW inval=[none before confirmation] LIVE
id=1918 obst=2026.05.26 02:15 prot=2026.05.26 02:30 mode=nearest census=3950 zone=NOROW inval=[kill line 4159 t=2026.05.26 06:25] DEAD(2026.05.26 06:25)
id=1925 obst=2026.05.26 03:00 prot=2026.05.26 03:25 mode=nearest census=4000 zone=NOROW inval=[kill line 4102 t=2026.05.26 05:25] DEAD(2026.05.26 05:25)
id=1935 obst=2026.05.26 04:45 prot=2026.05.26 05:50 mode=nearest census=4131 zone=NOROW inval=[none before confirmation] LIVE
id=1949 obst=2026.05.26 06:45 prot=2026.05.26 07:25 mode=nearest census=4217 zone=NOROW inval=[none before confirmation] LIVE
id=1958 obst=2026.05.26 08:15 prot=2026.05.26 09:35 mode=all census=4351 zone=NOROW inval=[none before confirmation] LIVE
id=1965 obst=2026.05.26 09:20 prot=2026.05.26 10:00 mode=all census=4391 zone=NOROW inval=[none before confirmation] LIVE
id=1971 obst=2026.05.26 10:10 prot=2026.05.26 11:05 mode=all census=4485 zone=NOROW inval=[kill line 4625 t=2026.05.26 13:00] DEAD(2026.05.26 13:00)
id=1973 obst=2026.05.26 10:45 prot=2026.05.26 11:05 mode=all census=4486 zone=NOROW inval=[kill line 4588 t=2026.05.26 12:20] DEAD(2026.05.26 12:20)
id=1978 obst=2026.05.26 11:35 prot=2026.05.26 16:10 mode=nearest census=4877 zone=NOROW inval=[kill line 5535 t=2026.05.27 02:45] DEAD(2026.05.27 02:45)
id=2014 obst=2026.05.26 18:10 prot=2026.05.26 18:25 mode=nearest census=5082 zone=NOROW inval=[none before confirmation] LIVE
id=2050 obst=2026.05.26 23:25 prot=2026.05.26 23:40 mode=all census=5374 zone=NOROW inval=[none before confirmation] LIVE
id=2075 obst=2026.05.27 03:40 prot=2026.05.27 03:55 mode=all census=5613 zone=NOROW inval=[kill line 5727 t=2026.05.27 06:05] DEAD(2026.05.27 06:05)
id=2070 obst=2026.05.27 03:00 prot=2026.05.27 04:00 mode=nearest census=5620 zone=NOROW inval=[kill line 5636 t=2026.05.27 04:25] DEAD(2026.05.27 04:25)
id=2083 obst=2026.05.27 04:40 prot=2026.05.27 05:00 mode=nearest census=5672 zone=NOROW inval=[none before confirmation] LIVE
id=2094 obst=2026.05.27 06:20 prot=2026.05.27 06:40 mode=nearest census=5760 zone=159.190-159.208 [census promoT=2026.05.27 06:40 unique + XOBINPLAY line 6475] inval=[none before confirmation] LIVE
  WP/WF: WProws=1259 WProvs=67 WFrows=3 WFovs=3 FIRST_WP=line 5763 bar=2026.05.27 06:40 o=159.221 h=159.226 l=159.204 c=159.212 [ENTERS] | FIRST_WF=line 5750 bar=2026.05.27 06:25 o=159.191 h=159.203 l=159.186 c=159.198 [ENTERS] | FORM=line 5746 bar=2026.05.27 06:20 o=159.205 h=159.208 l=159.19 c=159.19 | WIT=XOBINPLAY line 6475 bar=2026.05.27 15:25 firstShift=97 firstVal=159.197 (n=2)
id=2088 obst=2026.05.27 05:30 prot=2026.05.27 08:40 mode=nearest census=5869 zone=NOROW inval=[kill line 8842 t=2026.05.28 17:20] DEAD(2026.05.28 17:20)
id=2120 obst=2026.05.27 10:30 prot=2026.05.27 10:55 mode=nearest census=6061 zone=NOROW inval=[none before confirmation] LIVE
id=2125 obst=2026.05.27 11:00 prot=2026.05.27 11:20 mode=nearest census=6102 zone=NOROW inval=[none before confirmation] LIVE
id=2148 obst=2026.05.27 14:10 prot=2026.05.27 14:30 mode=nearest census=6305 zone=NOROW inval=[kill line 6404 t=2026.05.27 15:25] DEAD(2026.05.27 15:25)
id=2138 obst=2026.05.27 12:40 prot=2026.05.27 14:55 mode=all census=6344 zone=NOROW inval=[kill line 6408 t=2026.05.27 15:25] DEAD(2026.05.27 15:25)
id=2146 obst=2026.05.27 14:00 prot=2026.05.27 14:55 mode=all census=6345 zone=NOROW inval=[kill line 6405 t=2026.05.27 15:25] DEAD(2026.05.27 15:25)
id=2171 obst=2026.05.27 17:25 prot=2026.05.27 17:40 mode=nearest census=7091 zone=NOROW inval=[kill line 8412 t=2026.05.28 12:25] DEAD(2026.05.28 12:25)
id=2228 obst=2026.05.28 01:35 prot=2026.05.28 01:55 mode=nearest census=7684 zone=NOROW inval=[kill line 8139 t=2026.05.28 09:40] DEAD(2026.05.28 09:40)
id=2226 obst=2026.05.28 01:20 prot=2026.05.28 02:25 mode=all census=7711 zone=NOROW inval=[kill line 8140 t=2026.05.28 09:40] DEAD(2026.05.28 09:40)
id=2231 obst=2026.05.28 01:55 prot=2026.05.28 02:30 mode=nearest census=7716 zone=NOROW inval=[kill line 8138 t=2026.05.28 09:40] DEAD(2026.05.28 09:40)
id=2235 obst=2026.05.28 02:30 prot=2026.05.28 02:55 mode=all census=7740 zone=NOROW inval=[kill line 7868 t=2026.05.28 05:25] DEAD(2026.05.28 05:25)
id=2288 obst=2026.05.28 10:00 prot=2026.05.28 10:30 mode=all census=8243 zone=NOROW inval=[kill line 8300 t=2026.05.28 11:10] DEAD(2026.05.28 11:10)
id=2290 obst=2026.05.28 10:20 prot=2026.05.28 10:35 mode=nearest census=8251 zone=NOROW inval=[kill line 8292 t=2026.05.28 11:05] DEAD(2026.05.28 11:05)
id=2314 obst=2026.05.28 13:25 prot=2026.05.28 13:45 mode=nearest census=8493 zone=NOROW inval=[kill line 8640 t=2026.05.28 15:35] DEAD(2026.05.28 15:35)
id=2319 obst=2026.05.28 14:15 prot=2026.05.28 14:30 mode=all census=8550 zone=NOROW inval=[none before confirmation] LIVE
id=2330 obst=2026.05.28 16:00 prot=2026.05.28 16:20 mode=nearest census=8717 zone=NOROW inval=[none before confirmation] LIVE
id=2334 obst=2026.05.28 16:40 prot=2026.05.28 17:05 mode=nearest census=8804 zone=NOROW inval=[none before confirmation] LIVE
id=2355 obst=2026.05.28 19:40 prot=2026.05.28 21:25 mode=all census=9181 zone=NOROW inval=[kill line 9314 t=2026.05.29 00:05] DEAD(2026.05.29 00:05)
id=2361 obst=2026.05.28 21:15 prot=2026.05.28 21:35 mode=nearest census=9191 zone=NOROW inval=[kill line 9313 t=2026.05.29 00:05] DEAD(2026.05.29 00:05)
id=2376 obst=2026.05.28 23:05 prot=2026.05.28 23:30 mode=nearest census=9283 zone=NOROW inval=[none before confirmation] LIVE
id=2385 obst=2026.05.29 00:25 prot=2026.05.29 00:35 mode=nearest census=9347 zone=159.180-159.194 [ZONEID 10385 + ZONEPICK 10387] inval=[kill line 11921 t=2026.05.29 18:05] DEAD(2026.05.29 18:05)
  WP/WF: WProws=756 WProvs=16 WFrows=1 WFovs=1 FIRST_WP=line 11904 bar=2026.05.29 17:50 o=159.301 h=159.305 l=159.181 c=159.204 [ENTERS] | FIRST_WF=line 9345 bar=2026.05.29 00:30 o=159.197 h=159.206 l=159.189 c=159.206 [ENTERS] | FORM=line 9342 bar=2026.05.29 00:25 o=159.191 h=159.194 l=159.18 c=159.188 | WIT=INPLAYCOMMIT line 10110 bar=2026.05.29 10:45 firstShift=124 firstVal=159.180 (n=1)
id=2390 obst=2026.05.29 00:40 prot=2026.05.29 02:45 mode=all census=9452 zone=NOROW inval=[kill line 9912 t=2026.05.29 10:00] DEAD(2026.05.29 10:00)
id=2398 obst=2026.05.29 02:00 prot=2026.05.29 02:45 mode=all census=9453 zone=NOROW inval=[none before confirmation] LIVE
id=2420 obst=2026.05.29 05:25 prot=2026.05.29 06:05 mode=nearest census=9624 zone=NOROW inval=[kill line 9718 t=2026.05.29 08:00] DEAD(2026.05.29 08:00)
id=2466 obst=2026.05.29 11:40 prot=2026.05.29 12:00 mode=nearest census=10551 zone=NOROW inval=[none before confirmation] LIVE
id=2475 obst=2026.05.29 12:40 prot=2026.05.29 13:05 mode=nearest census=10620 zone=NOROW inval=[kill line 10642 t=2026.05.29 13:35] DEAD(2026.05.29 13:35)
id=2473 obst=2026.05.29 12:25 prot=2026.05.29 13:55 mode=all census=10668 zone=159.235-159.288 [census promoT=2026.05.29 13:55 unique + XOBINPLAY line 10705] inval=[kill line 11032 t=2026.05.29 15:00] DEAD(2026.05.29 15:00)
  WP/WF: WProws=596 WProvs=95 WFrows=17 WFovs=16 FIRST_WP=line 10671 bar=2026.05.29 13:55 o=159.285 h=159.291 l=159.284 c=159.285 [ENTERS] | FIRST_WF=line 10583 bar=2026.05.29 12:30 o=159.246 h=159.269 l=159.236 c=159.265 [ENTERS] | FORM=line 10580 bar=2026.05.29 12:25 o=159.285 h=159.288 l=159.235 c=159.248 | WIT=INPLAYCOMMIT line 10719 bar=2026.05.29 14:00 firstShift=3 firstVal=159.262 (n=3)
id=2493 obst=2026.05.29 15:05 prot=2026.05.29 15:40 mode=nearest census=11324 zone=159.252-159.275 [census promoT=2026.05.29 15:40 unique + XOBINPLAY line 11361] inval=[none before confirmation] LIVE
  WP/WF: WProws=575 WProvs=53 WFrows=6 WFovs=5 FIRST_WP=line 11335 bar=2026.05.29 15:45 o=159.285 h=159.287 l=159.27 c=159.278 [ENTERS] | FIRST_WF=line 11237 bar=2026.05.29 15:10 o=159.262 h=159.274 l=159.251 c=159.265 [ENTERS] | FORM=line 11091 bar=2026.05.29 15:05 o=159.268 h=159.275 l=159.252 c=159.262 | WIT=zero-only(n=2)
id=2501 obst=2026.05.29 17:00 prot=2026.05.29 17:20 mode=nearest census=11851 zone=NOROW inval=[none before confirmation] LIVE
id=2509 obst=2026.05.29 18:20 prot=2026.05.29 19:10 mode=all census=12023 zone=NOROW inval=[none before confirmation] LIVE
id=2510 obst=2026.05.29 18:30 prot=2026.05.29 19:10 mode=all census=12024 zone=NOROW inval=[none before confirmation] LIVE
id=2523 obst=2026.05.29 20:05 prot=2026.05.29 20:20 mode=nearest census=12086 zone=NOROW inval=[none before confirmation] LIVE
id=2516 obst=2026.05.29 19:20 prot=2026.05.29 20:30 mode=nearest census=12097 zone=NOROW inval=[none before confirmation] LIVE
id=2530 obst=2026.05.29 20:45 prot=2026.05.29 21:00 mode=nearest census=12124 zone=NOROW inval=[none before confirmation] LIVE
id=2561 obst=2026.06.01 01:10 prot=2026.06.01 01:35 mode=nearest census=12380 zone=NOROW inval=[none before confirmation] LIVE
id=2566 obst=2026.06.01 01:50 prot=2026.06.01 03:15 mode=nearest census=12474 zone=159.382-159.407 [ZONEID 18416 + ZONEPICK 18418] inval=[none before confirmation] LIVE
  WP/WF: WProws=436 WProvs=1 WFrows=16 WFovs=10 FIRST_WP=line 12476 bar=2026.06.01 03:15 o=159.409 h=159.422 l=159.4 c=159.416 [ENTERS] | FIRST_WF=line 12399 bar=2026.06.01 01:55 o=159.383 h=159.387 l=159.371 c=159.386 [ENTERS] | FORM=line 12395 bar=2026.06.01 01:50 o=159.407 h=159.407 l=159.382 c=159.385 | WIT=zero-only(n=48)
id=2617 obst=2026.06.01 10:35 prot=2026.06.01 10:45 mode=nearest census=15272 zone=159.443-159.462 [census promoT=2026.06.01 10:45 unique + XOBINPLAY line 15419] inval=[none before confirmation] LIVE
  WP/WF: WProws=346 WProvs=45 WFrows=1 WFovs=1 FIRST_WP=line 15729 bar=2026.06.01 11:00 o=159.464 h=159.469 l=159.454 c=159.466 [ENTERS] | FIRST_WF=line 15117 bar=2026.06.01 10:40 o=159.45 h=159.476 l=159.449 c=159.469 [ENTERS] | FORM=line 14977 bar=2026.06.01 10:35 o=159.458 h=159.462 l=159.443 c=159.447 | WIT=INPLAYCOMMIT line 15426 bar=2026.06.01 10:45 firstShift=2 firstVal=159.443 (n=1)
id=2626 obst=2026.06.01 11:55 prot=2026.06.01 12:15 mode=nearest census=16124 zone=NOROW inval=[kill line 16210 t=2026.06.01 13:50] DEAD(2026.06.01 13:50)
id=2634 obst=2026.06.01 13:05 prot=2026.06.01 13:20 mode=nearest census=16185 zone=NOROW inval=[none before confirmation] LIVE
id=2648 obst=2026.06.01 15:40 prot=2026.06.01 16:00 mode=all census=18671 zone=NOROW inval=[none before confirmation] LIVE
id=2687 obst=2026.06.01 20:25 prot=2026.06.01 21:55 mode=nearest census=19138 zone=NOROW inval=[kill line 19240 t=2026.06.02 00:05] DEAD(2026.06.02 00:05)
id=2720 obst=2026.06.02 00:50 prot=2026.06.02 01:05 mode=nearest census=19308 zone=159.586-159.605 [ZONEID 21342 + ZONEPICK 21344] inval=[none before confirmation] LIVE
  WP/WF: WProws=174 WProvs=0 WFrows=2 WFovs=1 FIRST_WP=NONE | FIRST_WF=line 19298 bar=2026.06.02 00:55 o=159.595 h=159.674 l=159.577 c=159.617 [ENTERS] | FORM=line 19294 bar=2026.06.02 00:50 o=159.6 h=159.605 l=159.586 c=159.592 | WIT=zero-only(n=2)
id=2733 obst=2026.06.02 02:55 prot=2026.06.02 03:10 mode=all census=19419 zone=NOROW inval=[kill line 19477 t=2026.06.02 04:15] DEAD(2026.06.02 04:15)
id=2743 obst=2026.06.02 04:30 prot=2026.06.02 04:55 mode=nearest census=19518 zone=159.664-159.677 [ZONEID 20169 + ZONEPICK 20171] inval=[kill line 20852 t=2026.06.02 11:05] DEAD(2026.06.02 11:05)
  WP/WF: WProws=128 WProvs=3 WFrows=4 WFovs=2 FIRST_WP=line 20855 bar=2026.06.02 11:00 o=159.693 h=159.698 l=159.66 c=159.669 [ENTERS] | FIRST_WF=line 19501 bar=2026.06.02 04:35 o=159.667 h=159.68 l=159.657 c=159.678 [ENTERS] | FORM=line 19496 bar=2026.06.02 04:30 o=159.671 h=159.677 l=159.664 c=159.67 | WIT=zero-only(n=6)
id=2789 obst=2026.06.02 11:15 prot=2026.06.02 11:30 mode=all census=21358 zone=159.679-159.694 [ZONEID 24721 + ZONEPICK 24723] inval=[none before confirmation] [PICK] LIVE
  WP/WF: WProws=49 WProvs=0 WFrows=2 WFovs=2 FIRST_WP=NONE | FIRST_WF=line 21044 bar=2026.06.02 11:20 o=159.684 h=159.7 l=159.678 c=159.695 [ENTERS] | FORM=line 20896 bar=2026.06.02 11:15 o=159.691 h=159.694 l=159.679 c=159.684 | WIT=zero-only(n=56) [PICK]
id=2786 obst=2026.06.02 10:40 prot=2026.06.02 12:05 mode=nearest census=22329 zone=NOROW inval=[none before confirmation] LIVE
id=2798 obst=2026.06.02 12:25 prot=2026.06.02 13:05 mode=nearest census=22387 zone=NOROW inval=[kill line 22426 t=2026.06.02 13:55] DEAD(2026.06.02 13:55)
## --- F1b LONG conf=2026.06.02 15:30 pick=2789
COUNT live-candidate=230
id=18 obst=2026.05.08 16:40 prot=2026.05.08 18:05 mode=all census=222 zone=NOROW inval=[kill line 273 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=29 obst=2026.05.08 18:05 prot=2026.05.08 18:45 mode=all census=227 zone=NOROW inval=[kill line 270 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=40 obst=2026.05.08 19:45 prot=2026.05.08 20:05 mode=nearest census=239 zone=NOROW inval=[none before confirmation] LIVE
id=58 obst=2026.05.08 22:10 prot=2026.05.08 22:30 mode=nearest census=250 zone=NOROW inval=[none before confirmation] LIVE
id=56 obst=2026.05.08 21:45 prot=2026.05.08 23:05 mode=all census=254 zone=NOROW inval=[kill line 261 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=78 obst=2026.05.11 00:25 prot=2026.05.11 00:35 mode=nearest census=281 zone=NOROW inval=[none before confirmation] LIVE
id=65 obst=2026.05.08 22:55 prot=2026.05.11 04:10 mode=all census=302 zone=NOROW inval=[none before confirmation] LIVE
id=107 obst=2026.05.11 05:00 prot=2026.05.11 05:50 mode=nearest census=311 zone=NOROW inval=[kill line 320 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=147 obst=2026.05.11 10:35 prot=2026.05.11 10:55 mode=nearest census=343 zone=NOROW inval=[kill line 347 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=162 obst=2026.05.11 12:00 prot=2026.05.11 12:20 mode=nearest census=360 zone=NOROW inval=[kill line 392 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=172 obst=2026.05.11 13:30 prot=2026.05.11 14:00 mode=all census=375 zone=NOROW inval=[none before confirmation] LIVE
id=181 obst=2026.05.11 14:45 prot=2026.05.11 15:00 mode=nearest census=383 zone=NOROW inval=[none before confirmation] LIVE
id=212 obst=2026.05.11 18:50 prot=2026.05.11 19:20 mode=nearest census=417 zone=NOROW inval=[none before confirmation] LIVE
id=221 obst=2026.05.11 20:30 prot=2026.05.11 21:30 mode=nearest census=433 zone=NOROW inval=[kill line 450 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=256 obst=2026.05.12 01:10 prot=2026.05.12 01:25 mode=nearest census=460 zone=NOROW inval=[none before confirmation] LIVE
id=261 obst=2026.05.12 02:00 prot=2026.05.12 03:00 mode=all census=468 zone=NOROW inval=[none before confirmation] LIVE
id=302 obst=2026.05.12 08:25 prot=2026.05.12 08:40 mode=nearest census=497 zone=NOROW inval=[none before confirmation] LIVE
id=313 obst=2026.05.12 09:30 prot=2026.05.12 10:00 mode=nearest census=514 zone=NOROW inval=[none before confirmation] LIVE
id=327 obst=2026.05.12 11:45 prot=2026.05.12 12:10 mode=nearest census=524 zone=NOROW inval=[none before confirmation] LIVE
id=352 obst=2026.05.12 16:20 prot=2026.05.12 16:40 mode=nearest census=556 zone=NOROW inval=[none before confirmation] LIVE
id=354 obst=2026.05.12 16:40 prot=2026.05.12 16:55 mode=nearest census=558 zone=NOROW inval=[none before confirmation] LIVE
id=348 obst=2026.05.12 15:50 prot=2026.05.12 18:05 mode=all census=566 zone=NOROW inval=[kill line 605 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=350 obst=2026.05.12 16:00 prot=2026.05.12 18:05 mode=all census=567 zone=NOROW inval=[kill line 620 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=364 obst=2026.05.12 18:05 prot=2026.05.12 18:20 mode=nearest census=570 zone=NOROW inval=[kill line 596 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=361 obst=2026.05.12 17:30 prot=2026.05.12 19:50 mode=all census=581 zone=NOROW inval=[kill line 597 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=402 obst=2026.05.12 22:50 prot=2026.05.12 23:05 mode=nearest census=613 zone=NOROW inval=[kill line 618 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=415 obst=2026.05.13 00:30 prot=2026.05.13 00:45 mode=nearest census=626 zone=NOROW inval=[kill line 627 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=414 obst=2026.05.13 00:15 prot=2026.05.13 01:10 mode=all census=633 zone=NOROW inval=[none before confirmation] LIVE
id=424 obst=2026.05.13 01:25 prot=2026.05.13 01:40 mode=nearest census=635 zone=NOROW inval=[none before confirmation] LIVE
id=440 obst=2026.05.13 03:35 prot=2026.05.13 03:55 mode=nearest census=667 zone=NOROW inval=[none before confirmation] LIVE
id=449 obst=2026.05.13 05:00 prot=2026.05.13 05:15 mode=nearest census=675 zone=NOROW inval=[none before confirmation] LIVE
id=447 obst=2026.05.13 04:45 prot=2026.05.13 06:20 mode=all census=678 zone=NOROW inval=[none before confirmation] LIVE
id=460 obst=2026.05.13 06:40 prot=2026.05.13 07:05 mode=nearest census=686 zone=NOROW inval=[none before confirmation] LIVE
id=463 obst=2026.05.13 07:00 prot=2026.05.13 07:35 mode=nearest census=689 zone=NOROW inval=[none before confirmation] LIVE
id=474 obst=2026.05.13 09:30 prot=2026.05.13 09:55 mode=nearest census=704 zone=NOROW inval=[none before confirmation] LIVE
id=445 obst=2026.05.13 04:20 prot=2026.05.13 10:40 mode=all census=713 zone=NOROW inval=[none before confirmation] LIVE
id=480 obst=2026.05.13 10:20 prot=2026.05.13 10:45 mode=nearest census=714 zone=NOROW inval=[kill line 817 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=492 obst=2026.05.13 11:45 prot=2026.05.13 12:25 mode=nearest census=722 zone=NOROW inval=[none before confirmation] LIVE
id=490 obst=2026.05.13 11:25 prot=2026.05.13 13:30 mode=all census=730 zone=NOROW inval=[kill line 736 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=502 obst=2026.05.13 13:20 prot=2026.05.13 13:35 mode=nearest census=731 zone=NOROW inval=[none before confirmation] LIVE
id=513 obst=2026.05.13 15:00 prot=2026.05.13 15:20 mode=nearest census=745 zone=NOROW inval=[none before confirmation] LIVE
id=526 obst=2026.05.13 16:40 prot=2026.05.13 17:25 mode=nearest census=764 zone=NOROW inval=[kill line 776 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=559 obst=2026.05.13 22:25 prot=2026.05.13 22:45 mode=nearest census=800 zone=NOROW inval=[none before confirmation] LIVE
id=566 obst=2026.05.13 23:35 prot=2026.05.13 23:50 mode=all census=808 zone=NOROW inval=[none before confirmation] LIVE
id=594 obst=2026.05.14 02:50 prot=2026.05.14 03:05 mode=nearest census=836 zone=NOROW inval=[none before confirmation] LIVE
id=603 obst=2026.05.14 03:45 prot=2026.05.14 04:10 mode=nearest census=841 zone=NOROW inval=[kill line 869 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=578 obst=2026.05.14 00:55 prot=2026.05.14 04:30 mode=all census=845 zone=NOROW inval=[kill line 877 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=601 obst=2026.05.14 03:35 prot=2026.05.14 04:30 mode=all census=846 zone=NOROW inval=[kill line 870 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=552 obst=2026.05.13 21:00 prot=2026.05.14 05:15 mode=all census=852 zone=NOROW inval=[kill line 867 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=556 obst=2026.05.13 21:50 prot=2026.05.14 05:15 mode=all census=853 zone=NOROW inval=[kill line 866 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=612 obst=2026.05.14 05:00 prot=2026.05.14 05:20 mode=nearest census=854 zone=NOROW inval=[kill line 864 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=637 obst=2026.05.14 07:45 prot=2026.05.14 08:05 mode=nearest census=891 zone=NOROW inval=[none before confirmation] LIVE
id=660 obst=2026.05.14 10:40 prot=2026.05.14 11:00 mode=all census=913 zone=NOROW inval=[none before confirmation] LIVE
id=673 obst=2026.05.14 12:45 prot=2026.05.14 13:05 mode=nearest census=925 zone=NOROW inval=[none before confirmation] LIVE
id=676 obst=2026.05.14 13:10 prot=2026.05.14 14:40 mode=all census=933 zone=NOROW inval=[none before confirmation] LIVE
id=681 obst=2026.05.14 14:05 prot=2026.05.14 15:00 mode=all census=939 zone=NOROW inval=[kill line 940 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=701 obst=2026.05.14 17:45 prot=2026.05.14 18:00 mode=nearest census=971 zone=NOROW inval=[none before confirmation] LIVE
id=696 obst=2026.05.14 16:40 prot=2026.05.14 18:05 mode=nearest census=973 zone=NOROW inval=[none before confirmation] LIVE
id=698 obst=2026.05.14 17:00 prot=2026.05.14 19:25 mode=all census=981 zone=NOROW inval=[none before confirmation] LIVE
id=714 obst=2026.05.14 19:15 prot=2026.05.14 19:30 mode=nearest census=982 zone=NOROW inval=[none before confirmation] LIVE
id=706 obst=2026.05.14 18:10 prot=2026.05.14 19:35 mode=nearest census=984 zone=NOROW inval=[none before confirmation] LIVE
id=724 obst=2026.05.14 20:45 prot=2026.05.14 21:00 mode=nearest census=994 zone=NOROW inval=[none before confirmation] LIVE
id=731 obst=2026.05.14 21:40 prot=2026.05.14 22:25 mode=nearest census=1003 zone=NOROW inval=[none before confirmation] LIVE
id=753 obst=2026.05.15 00:55 prot=2026.05.15 02:15 mode=all census=1023 zone=NOROW inval=[none before confirmation] LIVE
id=775 obst=2026.05.15 04:30 prot=2026.05.15 05:05 mode=nearest census=1042 zone=NOROW inval=[none before confirmation] LIVE
id=802 obst=2026.05.15 08:50 prot=2026.05.15 09:10 mode=nearest census=1067 zone=NOROW inval=[none before confirmation] LIVE
id=816 obst=2026.05.15 10:30 prot=2026.05.15 10:50 mode=nearest census=1082 zone=NOROW inval=[kill line 1110 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=815 obst=2026.05.15 10:20 prot=2026.05.15 10:55 mode=nearest census=1084 zone=NOROW inval=[kill line 1111 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=820 obst=2026.05.15 10:50 prot=2026.05.15 11:20 mode=nearest census=1089 zone=NOROW inval=[none before confirmation] LIVE
id=825 obst=2026.05.15 11:30 prot=2026.05.15 12:00 mode=nearest census=1095 zone=NOROW inval=[kill line 1105 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=841 obst=2026.05.15 13:30 prot=2026.05.15 14:25 mode=nearest census=1125 zone=NOROW inval=[none before confirmation] LIVE
id=851 obst=2026.05.15 14:45 prot=2026.05.15 15:00 mode=nearest census=1130 zone=NOROW inval=[none before confirmation] LIVE
id=861 obst=2026.05.15 16:10 prot=2026.05.15 16:25 mode=nearest census=1139 zone=NOROW inval=[kill line 1200 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=878 obst=2026.05.15 18:35 prot=2026.05.15 18:50 mode=nearest census=1158 zone=NOROW inval=[none before confirmation] LIVE
id=888 obst=2026.05.15 20:20 prot=2026.05.15 21:05 mode=all census=1171 zone=NOROW inval=[none before confirmation] LIVE
id=881 obst=2026.05.15 18:55 prot=2026.05.15 21:10 mode=nearest census=1172 zone=NOROW inval=[none before confirmation] LIVE
id=908 obst=2026.05.15 23:05 prot=2026.05.15 23:25 mode=nearest census=1187 zone=NOROW inval=[none before confirmation] LIVE
id=913 obst=2026.05.15 23:40 prot=2026.05.15 23:55 mode=nearest census=1195 zone=NOROW inval=[none before confirmation] LIVE
id=923 obst=2026.05.18 00:30 prot=2026.05.18 00:50 mode=nearest census=1210 zone=NOROW inval=[none before confirmation] LIVE
id=911 obst=2026.05.15 23:30 prot=2026.05.18 02:05 mode=all census=1218 zone=NOROW inval=[kill line 1322 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=936 obst=2026.05.18 02:15 prot=2026.05.18 02:35 mode=nearest census=1221 zone=NOROW inval=[none before confirmation] LIVE
id=930 obst=2026.05.18 01:20 prot=2026.05.18 03:35 mode=all census=1229 zone=NOROW inval=[kill line 1321 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=934 obst=2026.05.18 01:55 prot=2026.05.18 03:35 mode=all census=1230 zone=NOROW inval=[kill line 1318 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=945 obst=2026.05.18 03:25 prot=2026.05.18 03:45 mode=nearest census=1233 zone=NOROW inval=[none before confirmation] LIVE
id=954 obst=2026.05.18 04:45 prot=2026.05.18 05:05 mode=nearest census=1243 zone=NOROW inval=[none before confirmation] LIVE
id=964 obst=2026.05.18 06:25 prot=2026.05.18 06:40 mode=nearest census=1249 zone=NOROW inval=[kill line 1261 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=967 obst=2026.05.18 06:40 prot=2026.05.18 06:55 mode=nearest census=1251 zone=NOROW inval=[kill line 1260 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=958 obst=2026.05.18 05:05 prot=2026.05.18 07:15 mode=all census=1255 zone=NOROW inval=[kill line 1263 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=993 obst=2026.05.18 09:50 prot=2026.05.18 10:10 mode=nearest census=1279 zone=NOROW inval=[none before confirmation] LIVE
id=991 obst=2026.05.18 09:30 prot=2026.05.18 10:15 mode=all census=1281 zone=NOROW inval=[none before confirmation] LIVE
id=1013 obst=2026.05.18 12:30 prot=2026.05.18 12:55 mode=nearest census=1305 zone=NOROW inval=[none before confirmation] LIVE
id=1038 obst=2026.05.18 16:05 prot=2026.05.18 16:25 mode=nearest census=1334 zone=NOROW inval=[none before confirmation] LIVE
id=1047 obst=2026.05.18 17:15 prot=2026.05.18 17:40 mode=nearest census=1349 zone=NOROW inval=[none before confirmation] LIVE
id=1060 obst=2026.05.18 18:50 prot=2026.05.18 19:30 mode=all census=1369 zone=NOROW inval=[kill line 1402 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1055 obst=2026.05.18 18:10 prot=2026.05.18 19:35 mode=nearest census=1371 zone=NOROW inval=[none before confirmation] LIVE
id=980 obst=2026.05.18 08:00 prot=2026.05.18 21:30 mode=nearest census=1379 zone=NOROW inval=[none before confirmation] LIVE
id=1081 obst=2026.05.18 21:30 prot=2026.05.18 21:50 mode=all census=1383 zone=NOROW inval=[none before confirmation] LIVE
id=1103 obst=2026.05.19 00:30 prot=2026.05.19 01:15 mode=nearest census=1415 zone=NOROW inval=[none before confirmation] LIVE
id=1116 obst=2026.05.19 01:45 prot=2026.05.19 02:00 mode=nearest census=1418 zone=NOROW inval=[none before confirmation] LIVE
id=1120 obst=2026.05.19 02:25 prot=2026.05.19 02:50 mode=nearest census=1424 zone=NOROW inval=[kill line 1577 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1096 obst=2026.05.18 23:40 prot=2026.05.19 03:00 mode=nearest census=1428 zone=NOROW inval=[kill line 1580 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1154 obst=2026.05.19 06:35 prot=2026.05.19 06:50 mode=nearest census=1454 zone=NOROW inval=[none before confirmation] LIVE
id=1162 obst=2026.05.19 07:15 prot=2026.05.19 07:30 mode=nearest census=1460 zone=NOROW inval=[kill line 1567 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1164 obst=2026.05.19 07:35 prot=2026.05.19 07:50 mode=nearest census=1466 zone=NOROW inval=[kill line 1566 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1167 obst=2026.05.19 07:50 prot=2026.05.19 08:05 mode=nearest census=1470 zone=NOROW inval=[none before confirmation] LIVE
id=1083 obst=2026.05.18 22:00 prot=2026.05.19 10:05 mode=nearest census=1481 zone=NOROW inval=[kill line 1570 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1192 obst=2026.05.19 11:30 prot=2026.05.19 12:00 mode=nearest census=1492 zone=NOROW inval=[none before confirmation] LIVE
id=1208 obst=2026.05.19 13:20 prot=2026.05.19 13:40 mode=nearest census=1504 zone=NOROW inval=[none before confirmation] LIVE
id=1188 obst=2026.05.19 10:45 prot=2026.05.19 15:00 mode=all census=1517 zone=NOROW inval=[none before confirmation] LIVE
id=1226 obst=2026.05.19 16:50 prot=2026.05.19 17:30 mode=nearest census=1549 zone=NOROW inval=[kill line 1564 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1235 obst=2026.05.19 18:15 prot=2026.05.19 18:30 mode=nearest census=1555 zone=NOROW inval=[kill line 1561 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1257 obst=2026.05.19 21:40 prot=2026.05.19 21:55 mode=nearest census=1588 zone=NOROW inval=[kill line 1606 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1263 obst=2026.05.19 22:10 prot=2026.05.19 22:30 mode=nearest census=1593 zone=NOROW inval=[none before confirmation] LIVE
id=1288 obst=2026.05.20 01:05 prot=2026.05.20 01:25 mode=nearest census=1616 zone=NOROW inval=[kill line 1620 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1336 obst=2026.05.20 08:30 prot=2026.05.20 09:00 mode=nearest census=1665 zone=NOROW inval=[none before confirmation] LIVE
id=1350 obst=2026.05.20 10:25 prot=2026.05.20 10:45 mode=nearest census=1677 zone=NOROW inval=[kill line 1703 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1353 obst=2026.05.20 10:50 prot=2026.05.20 11:20 mode=nearest census=1682 zone=NOROW inval=[none before confirmation] LIVE
id=1368 obst=2026.05.20 13:45 prot=2026.05.20 14:10 mode=nearest census=1698 zone=NOROW inval=[kill line 1702 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1382 obst=2026.05.20 15:55 prot=2026.05.20 16:15 mode=all census=1712 zone=NOROW inval=[none before confirmation] LIVE
id=1387 obst=2026.05.20 16:40 prot=2026.05.20 17:05 mode=nearest census=1724 zone=NOROW inval=[none before confirmation] LIVE
id=1397 obst=2026.05.20 18:00 prot=2026.05.20 18:15 mode=nearest census=1750 zone=NOROW inval=[none before confirmation] LIVE
id=1405 obst=2026.05.20 18:45 prot=2026.05.20 19:00 mode=nearest census=1757 zone=NOROW inval=[none before confirmation] LIVE
id=1432 obst=2026.05.20 22:35 prot=2026.05.20 22:55 mode=nearest census=1785 zone=NOROW inval=[kill line 2196 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1448 obst=2026.05.21 00:40 prot=2026.05.21 01:10 mode=nearest census=1802 zone=NOROW inval=[kill line 1799 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1452 obst=2026.05.21 01:10 prot=2026.05.21 02:30 mode=nearest census=1811 zone=NOROW inval=[kill line 1823 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1465 obst=2026.05.21 02:45 prot=2026.05.21 03:05 mode=nearest census=1815 zone=NOROW inval=[none before confirmation] LIVE
id=1475 obst=2026.05.21 04:30 prot=2026.05.21 04:50 mode=nearest census=1836 zone=NOROW inval=[kill line 2195 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1482 obst=2026.05.21 05:30 prot=2026.05.21 05:55 mode=nearest census=1845 zone=NOROW inval=[kill line 1970 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1495 obst=2026.05.21 08:00 prot=2026.05.21 08:20 mode=nearest census=1853 zone=NOROW inval=[kill line 1878 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1493 obst=2026.05.21 07:25 prot=2026.05.21 09:20 mode=all census=1858 zone=NOROW inval=[kill line 1883 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1501 obst=2026.05.21 08:50 prot=2026.05.21 09:20 mode=all census=1859 zone=NOROW inval=[kill line 1877 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1503 obst=2026.05.21 09:05 prot=2026.05.21 09:40 mode=all census=1864 zone=NOROW inval=[kill line 1876 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1505 obst=2026.05.21 09:20 prot=2026.05.21 09:45 mode=nearest census=1865 zone=NOROW inval=[kill line 1871 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1526 obst=2026.05.21 12:45 prot=2026.05.21 13:00 mode=nearest census=1899 zone=NOROW inval=[kill line 1968 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1531 obst=2026.05.21 13:10 prot=2026.05.21 13:25 mode=all census=1908 zone=NOROW inval=[kill line 1961 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1514 obst=2026.05.21 10:30 prot=2026.05.21 13:35 mode=nearest census=1911 zone=NOROW inval=[kill line 1959 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1537 obst=2026.05.21 14:20 prot=2026.05.21 14:45 mode=nearest census=1916 zone=NOROW inval=[kill line 1958 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1543 obst=2026.05.21 15:00 prot=2026.05.21 15:25 mode=all census=1923 zone=NOROW inval=[none before confirmation] LIVE
id=1548 obst=2026.05.21 15:45 prot=2026.05.21 16:10 mode=all census=1929 zone=NOROW inval=[none before confirmation] LIVE
id=1614 obst=2026.05.22 00:10 prot=2026.05.22 00:35 mode=nearest census=1994 zone=NOROW inval=[kill line 2192 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1630 obst=2026.05.22 02:45 prot=2026.05.22 03:55 mode=all census=2003 zone=NOROW inval=[kill line 2015 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1631 obst=2026.05.22 03:05 prot=2026.05.22 03:55 mode=all census=2004 zone=NOROW inval=[kill line 2013 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1641 obst=2026.05.22 04:50 prot=2026.05.22 05:05 mode=nearest census=2008 zone=NOROW inval=[none before confirmation] LIVE
id=1654 obst=2026.05.22 07:15 prot=2026.05.22 07:30 mode=nearest census=2026 zone=NOROW inval=[kill line 2092 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1669 obst=2026.05.22 09:25 prot=2026.05.22 10:40 mode=all census=2043 zone=NOROW inval=[none before confirmation] LIVE
id=1679 obst=2026.05.22 11:35 prot=2026.05.22 12:25 mode=nearest census=2061 zone=NOROW inval=[none before confirmation] LIVE
id=1691 obst=2026.05.22 13:15 prot=2026.05.22 13:35 mode=nearest census=2069 zone=NOROW inval=[none before confirmation] LIVE
id=1706 obst=2026.05.22 16:05 prot=2026.05.22 17:05 mode=all census=2103 zone=NOROW inval=[kill line 2188 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1717 obst=2026.05.22 18:25 prot=2026.05.22 18:40 mode=nearest census=2117 zone=NOROW inval=[kill line 2128 t=2026.05.25 00:00] DEAD(2026.05.25 00:00)
id=1575 obst=2026.05.21 19:25 prot=2026.05.22 18:45 mode=nearest census=2119 zone=NOROW inval=[none before confirmation] LIVE
id=1734 obst=2026.05.22 20:35 prot=2026.05.22 21:30 mode=all census=2138 zone=NOROW inval=[kill line 2184 t=2026.05.25 00:05] DEAD(2026.05.25 00:05)
id=1769 obst=2026.05.25 02:35 prot=2026.05.25 02:50 mode=nearest census=2339 zone=NOROW inval=[none before confirmation] LIVE
id=1780 obst=2026.05.25 04:35 prot=2026.05.25 04:50 mode=nearest census=2461 zone=NOROW inval=[none before confirmation] LIVE
id=1779 obst=2026.05.25 04:25 prot=2026.05.25 06:45 mode=all census=2557 zone=NOROW inval=[none before confirmation] LIVE
id=1785 obst=2026.05.25 05:05 prot=2026.05.25 06:45 mode=all census=2558 zone=NOROW inval=[none before confirmation] LIVE
id=1788 obst=2026.05.25 05:35 prot=2026.05.25 06:45 mode=all census=2559 zone=NOROW inval=[kill line 3816 t=2026.05.26 00:05] DEAD(2026.05.26 00:05)
id=1794 obst=2026.05.25 06:35 prot=2026.05.25 06:50 mode=nearest census=2565 zone=NOROW inval=[none before confirmation] LIVE
id=1819 obst=2026.05.25 09:55 prot=2026.05.25 10:10 mode=nearest census=2789 zone=NOROW inval=[kill line 2959 t=2026.05.25 12:05] DEAD(2026.05.25 12:05)
id=1812 obst=2026.05.25 09:00 prot=2026.05.25 10:15 mode=nearest census=2802 zone=NOROW inval=[kill line 2936 t=2026.05.25 11:50] DEAD(2026.05.25 11:50)
id=1841 obst=2026.05.25 12:40 prot=2026.05.25 13:15 mode=all census=3032 zone=NOROW inval=[kill line 3131 t=2026.05.25 14:40] DEAD(2026.05.25 14:40)
id=1863 obst=2026.05.25 16:30 prot=2026.05.25 16:55 mode=nearest census=3332 zone=NOROW inval=[none before confirmation] LIVE
id=1857 obst=2026.05.25 15:20 prot=2026.05.25 18:05 mode=all census=3448 zone=NOROW inval=[none before confirmation] LIVE
id=1865 obst=2026.05.25 17:00 prot=2026.05.25 18:05 mode=all census=3449 zone=NOROW inval=[none before confirmation] LIVE
id=1874 obst=2026.05.25 18:50 prot=2026.05.25 19:10 mode=nearest census=3548 zone=NOROW inval=[none before confirmation] LIVE
id=1892 obst=2026.05.25 22:35 prot=2026.05.25 22:55 mode=nearest census=3742 zone=NOROW inval=[kill line 3804 t=2026.05.26 00:00] DEAD(2026.05.26 00:00)
id=1878 obst=2026.05.25 19:55 prot=2026.05.25 23:00 mode=nearest census=3749 zone=NOROW inval=[kill line 3807 t=2026.05.26 00:00] DEAD(2026.05.26 00:00)
id=1897 obst=2026.05.25 23:10 prot=2026.05.25 23:30 mode=nearest census=3777 zone=NOROW inval=[kill line 3803 t=2026.05.26 00:00] DEAD(2026.05.26 00:00)
id=1905 obst=2026.05.26 00:20 prot=2026.05.26 02:25 mode=all census=3944 zone=NOROW inval=[none before confirmation] LIVE
id=1918 obst=2026.05.26 02:15 prot=2026.05.26 02:30 mode=nearest census=3950 zone=NOROW inval=[kill line 4159 t=2026.05.26 06:25] DEAD(2026.05.26 06:25)
id=1925 obst=2026.05.26 03:00 prot=2026.05.26 03:25 mode=nearest census=4000 zone=NOROW inval=[kill line 4102 t=2026.05.26 05:25] DEAD(2026.05.26 05:25)
id=1935 obst=2026.05.26 04:45 prot=2026.05.26 05:50 mode=nearest census=4131 zone=NOROW inval=[none before confirmation] LIVE
id=1949 obst=2026.05.26 06:45 prot=2026.05.26 07:25 mode=nearest census=4217 zone=NOROW inval=[none before confirmation] LIVE
id=1958 obst=2026.05.26 08:15 prot=2026.05.26 09:35 mode=all census=4351 zone=NOROW inval=[none before confirmation] LIVE
id=1965 obst=2026.05.26 09:20 prot=2026.05.26 10:00 mode=all census=4391 zone=NOROW inval=[none before confirmation] LIVE
id=1971 obst=2026.05.26 10:10 prot=2026.05.26 11:05 mode=all census=4485 zone=NOROW inval=[kill line 4625 t=2026.05.26 13:00] DEAD(2026.05.26 13:00)
id=1973 obst=2026.05.26 10:45 prot=2026.05.26 11:05 mode=all census=4486 zone=NOROW inval=[kill line 4588 t=2026.05.26 12:20] DEAD(2026.05.26 12:20)
id=1978 obst=2026.05.26 11:35 prot=2026.05.26 16:10 mode=nearest census=4877 zone=NOROW inval=[kill line 5535 t=2026.05.27 02:45] DEAD(2026.05.27 02:45)
id=2014 obst=2026.05.26 18:10 prot=2026.05.26 18:25 mode=nearest census=5082 zone=NOROW inval=[none before confirmation] LIVE
id=2050 obst=2026.05.26 23:25 prot=2026.05.26 23:40 mode=all census=5374 zone=NOROW inval=[none before confirmation] LIVE
id=2075 obst=2026.05.27 03:40 prot=2026.05.27 03:55 mode=all census=5613 zone=NOROW inval=[kill line 5727 t=2026.05.27 06:05] DEAD(2026.05.27 06:05)
id=2070 obst=2026.05.27 03:00 prot=2026.05.27 04:00 mode=nearest census=5620 zone=NOROW inval=[kill line 5636 t=2026.05.27 04:25] DEAD(2026.05.27 04:25)
id=2083 obst=2026.05.27 04:40 prot=2026.05.27 05:00 mode=nearest census=5672 zone=NOROW inval=[none before confirmation] LIVE
id=2094 obst=2026.05.27 06:20 prot=2026.05.27 06:40 mode=nearest census=5760 zone=159.190-159.208 [census promoT=2026.05.27 06:40 unique + XOBINPLAY line 6475] inval=[none before confirmation] LIVE
  WP/WF: WProws=1259 WProvs=67 WFrows=3 WFovs=3 FIRST_WP=line 5763 bar=2026.05.27 06:40 o=159.221 h=159.226 l=159.204 c=159.212 [ENTERS] | FIRST_WF=line 5750 bar=2026.05.27 06:25 o=159.191 h=159.203 l=159.186 c=159.198 [ENTERS] | FORM=line 5746 bar=2026.05.27 06:20 o=159.205 h=159.208 l=159.19 c=159.19 | WIT=XOBINPLAY line 6475 bar=2026.05.27 15:25 firstShift=97 firstVal=159.197 (n=2)
id=2088 obst=2026.05.27 05:30 prot=2026.05.27 08:40 mode=nearest census=5869 zone=NOROW inval=[kill line 8843 t=2026.05.28 17:20] DEAD(2026.05.28 17:20)
id=2120 obst=2026.05.27 10:30 prot=2026.05.27 10:55 mode=nearest census=6061 zone=NOROW inval=[none before confirmation] LIVE
id=2125 obst=2026.05.27 11:00 prot=2026.05.27 11:20 mode=nearest census=6102 zone=NOROW inval=[none before confirmation] LIVE
id=2148 obst=2026.05.27 14:10 prot=2026.05.27 14:30 mode=nearest census=6305 zone=NOROW inval=[kill line 6404 t=2026.05.27 15:25] DEAD(2026.05.27 15:25)
id=2138 obst=2026.05.27 12:40 prot=2026.05.27 14:55 mode=all census=6344 zone=NOROW inval=[kill line 6408 t=2026.05.27 15:25] DEAD(2026.05.27 15:25)
id=2146 obst=2026.05.27 14:00 prot=2026.05.27 14:55 mode=all census=6345 zone=NOROW inval=[kill line 6405 t=2026.05.27 15:25] DEAD(2026.05.27 15:25)
id=2171 obst=2026.05.27 17:25 prot=2026.05.27 17:40 mode=nearest census=7092 zone=NOROW inval=[kill line 8413 t=2026.05.28 12:25] DEAD(2026.05.28 12:25)
id=2228 obst=2026.05.28 01:35 prot=2026.05.28 01:55 mode=nearest census=7685 zone=NOROW inval=[kill line 8140 t=2026.05.28 09:40] DEAD(2026.05.28 09:40)
id=2226 obst=2026.05.28 01:20 prot=2026.05.28 02:25 mode=all census=7712 zone=NOROW inval=[kill line 8141 t=2026.05.28 09:40] DEAD(2026.05.28 09:40)
id=2231 obst=2026.05.28 01:55 prot=2026.05.28 02:30 mode=nearest census=7717 zone=NOROW inval=[kill line 8139 t=2026.05.28 09:40] DEAD(2026.05.28 09:40)
id=2235 obst=2026.05.28 02:30 prot=2026.05.28 02:55 mode=all census=7741 zone=NOROW inval=[kill line 7869 t=2026.05.28 05:25] DEAD(2026.05.28 05:25)
id=2288 obst=2026.05.28 10:00 prot=2026.05.28 10:30 mode=all census=8244 zone=NOROW inval=[kill line 8301 t=2026.05.28 11:10] DEAD(2026.05.28 11:10)
id=2290 obst=2026.05.28 10:20 prot=2026.05.28 10:35 mode=nearest census=8252 zone=NOROW inval=[kill line 8293 t=2026.05.28 11:05] DEAD(2026.05.28 11:05)
id=2314 obst=2026.05.28 13:25 prot=2026.05.28 13:45 mode=nearest census=8494 zone=NOROW inval=[kill line 8641 t=2026.05.28 15:35] DEAD(2026.05.28 15:35)
id=2319 obst=2026.05.28 14:15 prot=2026.05.28 14:30 mode=all census=8551 zone=NOROW inval=[none before confirmation] LIVE
id=2330 obst=2026.05.28 16:00 prot=2026.05.28 16:20 mode=nearest census=8718 zone=NOROW inval=[none before confirmation] LIVE
id=2334 obst=2026.05.28 16:40 prot=2026.05.28 17:05 mode=nearest census=8805 zone=NOROW inval=[none before confirmation] LIVE
id=2355 obst=2026.05.28 19:40 prot=2026.05.28 21:25 mode=all census=9182 zone=NOROW inval=[kill line 9315 t=2026.05.29 00:05] DEAD(2026.05.29 00:05)
id=2361 obst=2026.05.28 21:15 prot=2026.05.28 21:35 mode=nearest census=9192 zone=NOROW inval=[kill line 9314 t=2026.05.29 00:05] DEAD(2026.05.29 00:05)
id=2376 obst=2026.05.28 23:05 prot=2026.05.28 23:30 mode=nearest census=9284 zone=NOROW inval=[none before confirmation] LIVE
id=2385 obst=2026.05.29 00:25 prot=2026.05.29 00:35 mode=nearest census=9348 zone=159.180-159.194 [ZONEID 10093 + ZONEPICK 10095] inval=[kill line 11652 t=2026.05.29 18:05] DEAD(2026.05.29 18:05)
  WP/WF: WProws=756 WProvs=16 WFrows=1 WFovs=1 FIRST_WP=line 11635 bar=2026.05.29 17:50 o=159.301 h=159.305 l=159.181 c=159.204 [ENTERS] | FIRST_WF=line 9346 bar=2026.05.29 00:30 o=159.197 h=159.206 l=159.189 c=159.206 [ENTERS] | FORM=line 9343 bar=2026.05.29 00:25 o=159.191 h=159.194 l=159.18 c=159.188 | WIT=INPLAYCOMMIT line 10111 bar=2026.05.29 10:45 firstShift=124 firstVal=159.180 (n=1)
id=2390 obst=2026.05.29 00:40 prot=2026.05.29 02:45 mode=all census=9453 zone=NOROW inval=[kill line 9913 t=2026.05.29 10:00] DEAD(2026.05.29 10:00)
id=2398 obst=2026.05.29 02:00 prot=2026.05.29 02:45 mode=all census=9454 zone=NOROW inval=[none before confirmation] LIVE
id=2420 obst=2026.05.29 05:25 prot=2026.05.29 06:05 mode=nearest census=9625 zone=NOROW inval=[kill line 9719 t=2026.05.29 08:00] DEAD(2026.05.29 08:00)
id=2466 obst=2026.05.29 11:40 prot=2026.05.29 12:00 mode=nearest census=10281 zone=NOROW inval=[none before confirmation] LIVE
id=2475 obst=2026.05.29 12:40 prot=2026.05.29 13:05 mode=nearest census=10349 zone=NOROW inval=[kill line 10371 t=2026.05.29 13:35] DEAD(2026.05.29 13:35)
id=2473 obst=2026.05.29 12:25 prot=2026.05.29 13:55 mode=all census=10397 zone=159.235-159.288 [census promoT=2026.05.29 13:55 unique + XOBINPLAY line 10434] inval=[kill line 10762 t=2026.05.29 15:00] DEAD(2026.05.29 15:00)
  WP/WF: WProws=596 WProvs=95 WFrows=17 WFovs=16 FIRST_WP=line 10400 bar=2026.05.29 13:55 o=159.285 h=159.291 l=159.284 c=159.285 [ENTERS] | FIRST_WF=line 10312 bar=2026.05.29 12:30 o=159.246 h=159.269 l=159.236 c=159.265 [ENTERS] | FORM=line 10309 bar=2026.05.29 12:25 o=159.285 h=159.288 l=159.235 c=159.248 | WIT=INPLAYCOMMIT line 10448 bar=2026.05.29 14:00 firstShift=3 firstVal=159.262 (n=3)
id=2493 obst=2026.05.29 15:05 prot=2026.05.29 15:40 mode=nearest census=11055 zone=159.252-159.275 [census promoT=2026.05.29 15:40 unique + XOBINPLAY line 11092] inval=[none before confirmation] LIVE
  WP/WF: WProws=575 WProvs=53 WFrows=6 WFovs=5 FIRST_WP=line 11066 bar=2026.05.29 15:45 o=159.285 h=159.287 l=159.27 c=159.278 [ENTERS] | FIRST_WF=line 10968 bar=2026.05.29 15:10 o=159.262 h=159.274 l=159.251 c=159.265 [ENTERS] | FORM=line 10821 bar=2026.05.29 15:05 o=159.268 h=159.275 l=159.252 c=159.262 | WIT=zero-only(n=2)
id=2501 obst=2026.05.29 17:00 prot=2026.05.29 17:20 mode=nearest census=11582 zone=NOROW inval=[none before confirmation] LIVE
id=2509 obst=2026.05.29 18:20 prot=2026.05.29 19:10 mode=all census=11754 zone=NOROW inval=[none before confirmation] LIVE
id=2510 obst=2026.05.29 18:30 prot=2026.05.29 19:10 mode=all census=11755 zone=NOROW inval=[none before confirmation] LIVE
id=2523 obst=2026.05.29 20:05 prot=2026.05.29 20:20 mode=nearest census=11817 zone=NOROW inval=[none before confirmation] LIVE
id=2516 obst=2026.05.29 19:20 prot=2026.05.29 20:30 mode=nearest census=11828 zone=NOROW inval=[none before confirmation] LIVE
id=2530 obst=2026.05.29 20:45 prot=2026.05.29 21:00 mode=nearest census=11855 zone=NOROW inval=[none before confirmation] LIVE
id=2561 obst=2026.06.01 01:10 prot=2026.06.01 01:35 mode=nearest census=12111 zone=NOROW inval=[none before confirmation] LIVE
id=2566 obst=2026.06.01 01:50 prot=2026.06.01 03:15 mode=nearest census=12205 zone=159.382-159.407 [ZONEID 17434 + ZONEPICK 17436] inval=[none before confirmation] LIVE
  WP/WF: WProws=436 WProvs=1 WFrows=16 WFovs=10 FIRST_WP=line 12207 bar=2026.06.01 03:15 o=159.409 h=159.422 l=159.4 c=159.416 [ENTERS] | FIRST_WF=line 12130 bar=2026.06.01 01:55 o=159.383 h=159.387 l=159.371 c=159.386 [ENTERS] | FORM=line 12126 bar=2026.06.01 01:50 o=159.407 h=159.407 l=159.382 c=159.385 | WIT=zero-only(n=40)
id=2617 obst=2026.06.01 10:35 prot=2026.06.01 10:45 mode=nearest census=15010 zone=159.443-159.462 [census promoT=2026.06.01 10:45 unique + XOBINPLAY line 15040] inval=[none before confirmation] LIVE
  WP/WF: WProws=346 WProvs=45 WFrows=1 WFovs=1 FIRST_WP=line 15354 bar=2026.06.01 11:00 o=159.464 h=159.469 l=159.454 c=159.466 [ENTERS] | FIRST_WF=line 14851 bar=2026.06.01 10:40 o=159.45 h=159.476 l=159.449 c=159.469 [ENTERS] | FORM=line 14711 bar=2026.06.01 10:35 o=159.458 h=159.462 l=159.443 c=159.447 | WIT=INPLAYCOMMIT line 15053 bar=2026.06.01 10:45 firstShift=2 firstVal=159.443 (n=1)
id=2626 obst=2026.06.01 11:55 prot=2026.06.01 12:15 mode=nearest census=15748 zone=NOROW inval=[kill line 15834 t=2026.06.01 13:50] DEAD(2026.06.01 13:50)
id=2634 obst=2026.06.01 13:05 prot=2026.06.01 13:20 mode=nearest census=15809 zone=NOROW inval=[none before confirmation] LIVE
id=2648 obst=2026.06.01 15:40 prot=2026.06.01 16:00 mode=all census=17761 zone=NOROW inval=[none before confirmation] LIVE
id=2687 obst=2026.06.01 20:25 prot=2026.06.01 21:55 mode=nearest census=18228 zone=NOROW inval=[kill line 18330 t=2026.06.02 00:05] DEAD(2026.06.02 00:05)
id=2720 obst=2026.06.02 00:50 prot=2026.06.02 01:05 mode=nearest census=18398 zone=159.586-159.605 [ZONEID 20430 + ZONEPICK 20432] inval=[none before confirmation] LIVE
  WP/WF: WProws=174 WProvs=0 WFrows=2 WFovs=1 FIRST_WP=NONE | FIRST_WF=line 18388 bar=2026.06.02 00:55 o=159.595 h=159.674 l=159.577 c=159.617 [ENTERS] | FORM=line 18384 bar=2026.06.02 00:50 o=159.6 h=159.605 l=159.586 c=159.592 | WIT=zero-only(n=2)
id=2733 obst=2026.06.02 02:55 prot=2026.06.02 03:10 mode=all census=18509 zone=NOROW inval=[kill line 18567 t=2026.06.02 04:15] DEAD(2026.06.02 04:15)
id=2743 obst=2026.06.02 04:30 prot=2026.06.02 04:55 mode=nearest census=18608 zone=159.664-159.677 [ZONEID 19259 + ZONEPICK 19261] inval=[kill line 19940 t=2026.06.02 11:05] DEAD(2026.06.02 11:05)
  WP/WF: WProws=128 WProvs=3 WFrows=4 WFovs=2 FIRST_WP=line 19943 bar=2026.06.02 11:00 o=159.693 h=159.698 l=159.66 c=159.669 [ENTERS] | FIRST_WF=line 18591 bar=2026.06.02 04:35 o=159.667 h=159.68 l=159.657 c=159.678 [ENTERS] | FORM=line 18586 bar=2026.06.02 04:30 o=159.671 h=159.677 l=159.664 c=159.67 | WIT=zero-only(n=6)
id=2789 obst=2026.06.02 11:15 prot=2026.06.02 11:30 mode=all census=20446 zone=159.679-159.694 [ZONEID 23809 + ZONEPICK 23811] inval=[none before confirmation] [PICK] LIVE
  WP/WF: WProws=49 WProvs=0 WFrows=2 WFovs=2 FIRST_WP=NONE | FIRST_WF=line 20132 bar=2026.06.02 11:20 o=159.684 h=159.7 l=159.678 c=159.695 [ENTERS] | FORM=line 19984 bar=2026.06.02 11:15 o=159.691 h=159.694 l=159.679 c=159.684 | WIT=zero-only(n=38) [PICK]
id=2786 obst=2026.06.02 10:40 prot=2026.06.02 12:05 mode=nearest census=21417 zone=NOROW inval=[none before confirmation] LIVE
id=2798 obst=2026.06.02 12:25 prot=2026.06.02 13:05 mode=nearest census=21475 zone=NOROW inval=[kill line 21514 t=2026.06.02 13:55] DEAD(2026.06.02 13:55)
## --- F2 SHORT conf=2026.08.27 17:00 pick=1891
COUNT live-candidate=134
id=5 obst=2026.08.11 14:25 prot=2026.08.11 14:50 mode=nearest census=243 zone=NOROW inval=[kill line 244 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=42 obst=2026.08.11 19:05 prot=2026.08.11 19:25 mode=nearest census=283 zone=NOROW inval=[none before confirmation] LIVE
id=46 obst=2026.08.11 19:35 prot=2026.08.11 20:00 mode=nearest census=286 zone=NOROW inval=[kill line 297 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=89 obst=2026.08.12 02:05 prot=2026.08.12 02:20 mode=nearest census=324 zone=NOROW inval=[none before confirmation] LIVE
id=101 obst=2026.08.12 03:55 prot=2026.08.12 04:10 mode=nearest census=338 zone=NOROW inval=[none before confirmation] LIVE
id=111 obst=2026.08.12 05:05 prot=2026.08.12 05:20 mode=nearest census=346 zone=NOROW inval=[none before confirmation] LIVE
id=124 obst=2026.08.12 06:35 prot=2026.08.12 06:50 mode=nearest census=357 zone=NOROW inval=[kill line 382 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=118 obst=2026.08.12 05:55 prot=2026.08.12 07:15 mode=all census=363 zone=NOROW inval=[kill line 387 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=120 obst=2026.08.12 06:05 prot=2026.08.12 07:15 mode=all census=364 zone=NOROW inval=[kill line 386 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=137 obst=2026.08.12 07:55 prot=2026.08.12 08:10 mode=nearest census=375 zone=NOROW inval=[kill line 381 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=170 obst=2026.08.12 13:25 prot=2026.08.12 13:50 mode=all census=429 zone=NOROW inval=[kill line 433 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=168 obst=2026.08.12 13:00 prot=2026.08.12 13:55 mode=nearest census=430 zone=NOROW inval=[none before confirmation] LIVE
id=187 obst=2026.08.12 16:05 prot=2026.08.12 16:20 mode=nearest census=445 zone=NOROW inval=[kill line 763 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=203 obst=2026.08.12 18:20 prot=2026.08.12 19:20 mode=all census=465 zone=NOROW inval=[kill line 599 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=219 obst=2026.08.12 20:25 prot=2026.08.12 20:45 mode=nearest census=472 zone=NOROW inval=[kill line 494 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=267 obst=2026.08.13 04:30 prot=2026.08.13 04:50 mode=nearest census=511 zone=NOROW inval=[kill line 568 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=263 obst=2026.08.13 03:55 prot=2026.08.13 04:50 mode=all census=513 zone=NOROW inval=[none before confirmation] LIVE
id=286 obst=2026.08.13 07:55 prot=2026.08.13 09:15 mode=nearest census=537 zone=NOROW inval=[kill line 552 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=297 obst=2026.08.13 09:15 prot=2026.08.13 09:35 mode=nearest census=540 zone=NOROW inval=[kill line 544 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=309 obst=2026.08.13 10:50 prot=2026.08.13 11:10 mode=nearest census=556 zone=NOROW inval=[none before confirmation] LIVE
id=330 obst=2026.08.13 13:35 prot=2026.08.13 13:55 mode=nearest census=574 zone=NOROW inval=[none before confirmation] LIVE
id=336 obst=2026.08.13 14:45 prot=2026.08.13 15:00 mode=nearest census=584 zone=NOROW inval=[none before confirmation] LIVE
id=339 obst=2026.08.13 15:05 prot=2026.08.13 15:40 mode=all census=592 zone=NOROW inval=[none before confirmation] LIVE
id=347 obst=2026.08.13 15:55 prot=2026.08.13 16:30 mode=nearest census=610 zone=NOROW inval=[none before confirmation] LIVE
id=367 obst=2026.08.13 18:35 prot=2026.08.13 19:00 mode=nearest census=627 zone=NOROW inval=[kill line 684 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=353 obst=2026.08.13 16:50 prot=2026.08.13 19:15 mode=all census=632 zone=NOROW inval=[kill line 682 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=364 obst=2026.08.13 18:20 prot=2026.08.13 19:15 mode=all census=633 zone=NOROW inval=[kill line 685 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=370 obst=2026.08.13 19:00 prot=2026.08.13 19:20 mode=nearest census=634 zone=NOROW inval=[none before confirmation] LIVE
id=392 obst=2026.08.13 22:25 prot=2026.08.13 22:45 mode=all census=653 zone=NOROW inval=[kill line 680 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=387 obst=2026.08.13 21:35 prot=2026.08.13 22:50 mode=nearest census=654 zone=NOROW inval=[kill line 674 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=395 obst=2026.08.13 23:00 prot=2026.08.13 23:15 mode=nearest census=659 zone=NOROW inval=[none before confirmation] LIVE
id=442 obst=2026.08.14 05:40 prot=2026.08.14 05:55 mode=nearest census=699 zone=NOROW inval=[none before confirmation] LIVE
id=490 obst=2026.08.14 12:20 prot=2026.08.14 12:40 mode=nearest census=749 zone=NOROW inval=[none before confirmation] LIVE
id=513 obst=2026.08.14 15:30 prot=2026.08.14 15:45 mode=nearest census=776 zone=NOROW inval=[kill line 783 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=515 obst=2026.08.14 15:45 prot=2026.08.14 16:05 mode=nearest census=780 zone=NOROW inval=[none before confirmation] LIVE
id=542 obst=2026.08.14 19:15 prot=2026.08.14 19:35 mode=nearest census=802 zone=NOROW inval=[kill line 854 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=539 obst=2026.08.14 18:45 prot=2026.08.14 20:45 mode=all census=808 zone=NOROW inval=[kill line 872 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=557 obst=2026.08.14 21:05 prot=2026.08.14 21:20 mode=nearest census=813 zone=NOROW inval=[none before confirmation] LIVE
id=622 obst=2026.08.17 05:25 prot=2026.08.17 05:40 mode=nearest census=880 zone=NOROW inval=[kill line 893 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=625 obst=2026.08.17 05:35 prot=2026.08.17 06:00 mode=nearest census=883 zone=NOROW inval=[kill line 889 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=677 obst=2026.08.17 12:25 prot=2026.08.17 12:50 mode=all census=931 zone=NOROW inval=[kill line 1302 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=709 obst=2026.08.17 16:30 prot=2026.08.17 16:40 mode=all census=965 zone=NOROW inval=[none before confirmation] LIVE
id=735 obst=2026.08.17 19:35 prot=2026.08.17 20:00 mode=nearest census=994 zone=NOROW inval=[kill line 1290 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=737 obst=2026.08.17 20:00 prot=2026.08.17 20:20 mode=nearest census=997 zone=NOROW inval=[kill line 1289 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=740 obst=2026.08.17 20:25 prot=2026.08.17 20:40 mode=all census=1003 zone=NOROW inval=[kill line 1048 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=747 obst=2026.08.17 21:10 prot=2026.08.17 21:30 mode=nearest census=1007 zone=NOROW inval=[kill line 1010 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=796 obst=2026.08.18 03:15 prot=2026.08.18 03:30 mode=nearest census=1054 zone=NOROW inval=[kill line 1061 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=794 obst=2026.08.18 03:00 prot=2026.08.18 03:30 mode=all census=1056 zone=NOROW inval=[kill line 1062 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=800 obst=2026.08.18 03:35 prot=2026.08.18 05:05 mode=all census=1072 zone=NOROW inval=[kill line 1160 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=811 obst=2026.08.18 04:50 prot=2026.08.18 05:05 mode=all census=1073 zone=NOROW inval=[kill line 1158 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=756 obst=2026.08.17 22:00 prot=2026.08.18 06:45 mode=nearest census=1089 zone=NOROW inval=[kill line 1100 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=752 obst=2026.08.17 21:35 prot=2026.08.18 07:20 mode=nearest census=1096 zone=NOROW inval=[none before confirmation] LIVE
id=850 obst=2026.08.18 10:45 prot=2026.08.18 11:05 mode=nearest census=1118 zone=NOROW inval=[none before confirmation] LIVE
id=858 obst=2026.08.18 11:55 prot=2026.08.18 12:10 mode=nearest census=1124 zone=NOROW inval=[kill line 1125 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=871 obst=2026.08.18 13:55 prot=2026.08.18 14:50 mode=all census=1134 zone=NOROW inval=[none before confirmation] LIVE
id=875 obst=2026.08.18 14:35 prot=2026.08.18 15:40 mode=nearest census=1151 zone=NOROW inval=[none before confirmation] LIVE
id=909 obst=2026.08.18 19:40 prot=2026.08.18 20:05 mode=nearest census=1185 zone=NOROW inval=[kill line 1255 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=900 obst=2026.08.18 18:35 prot=2026.08.18 20:15 mode=nearest census=1188 zone=NOROW inval=[kill line 1201 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=926 obst=2026.08.18 22:10 prot=2026.08.18 23:05 mode=nearest census=1209 zone=NOROW inval=[kill line 1219 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=948 obst=2026.08.19 00:30 prot=2026.08.19 00:50 mode=nearest census=1224 zone=NOROW inval=[kill line 1230 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=968 obst=2026.08.19 03:10 prot=2026.08.19 03:40 mode=nearest census=1239 zone=NOROW inval=[kill line 1253 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=973 obst=2026.08.19 03:50 prot=2026.08.19 04:05 mode=nearest census=1248 zone=NOROW inval=[kill line 1250 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=998 obst=2026.08.19 06:25 prot=2026.08.19 06:40 mode=nearest census=1268 zone=NOROW inval=[kill line 1277 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=996 obst=2026.08.19 06:10 prot=2026.08.19 07:00 mode=nearest census=1271 zone=NOROW inval=[none before confirmation] LIVE
id=1045 obst=2026.08.19 13:40 prot=2026.08.19 14:00 mode=nearest census=1318 zone=NOROW inval=[kill line 1330 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1050 obst=2026.08.19 14:30 prot=2026.08.19 14:45 mode=nearest census=1323 zone=NOROW inval=[kill line 1325 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1077 obst=2026.08.19 17:35 prot=2026.08.19 17:55 mode=nearest census=1344 zone=NOROW inval=[kill line 1374 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1081 obst=2026.08.19 18:10 prot=2026.08.19 18:30 mode=nearest census=1350 zone=NOROW inval=[none before confirmation] LIVE
id=1092 obst=2026.08.19 19:30 prot=2026.08.19 20:15 mode=nearest census=1360 zone=NOROW inval=[kill line 1367 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1099 obst=2026.08.19 21:10 prot=2026.08.19 21:25 mode=nearest census=1370 zone=NOROW inval=[none before confirmation] LIVE
id=1127 obst=2026.08.20 01:00 prot=2026.08.20 02:20 mode=nearest census=1395 zone=NOROW inval=[none before confirmation] LIVE
id=1168 obst=2026.08.20 07:05 prot=2026.08.20 07:25 mode=nearest census=1440 zone=NOROW inval=[kill line 1455 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1217 obst=2026.08.20 13:25 prot=2026.08.20 13:45 mode=nearest census=1485 zone=NOROW inval=[kill line 1667 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1212 obst=2026.08.20 12:50 prot=2026.08.20 13:50 mode=nearest census=1488 zone=NOROW inval=[kill line 1666 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1223 obst=2026.08.20 13:55 prot=2026.08.20 14:15 mode=nearest census=1491 zone=NOROW inval=[kill line 1610 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1202 obst=2026.08.20 11:50 prot=2026.08.20 14:45 mode=all census=1498 zone=NOROW inval=[kill line 1615 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1229 obst=2026.08.20 14:30 prot=2026.08.20 14:50 mode=nearest census=1499 zone=NOROW inval=[kill line 1609 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1244 obst=2026.08.20 16:15 prot=2026.08.20 16:30 mode=nearest census=1509 zone=NOROW inval=[kill line 1524 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1248 obst=2026.08.20 16:50 prot=2026.08.20 17:15 mode=all census=1517 zone=NOROW inval=[none before confirmation] LIVE
id=1255 obst=2026.08.20 18:00 prot=2026.08.20 18:40 mode=all census=1536 zone=NOROW inval=[kill line 1583 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1258 obst=2026.08.20 18:25 prot=2026.08.20 18:45 mode=nearest census=1537 zone=NOROW inval=[none before confirmation] LIVE
id=1352 obst=2026.08.21 08:10 prot=2026.08.21 08:25 mode=nearest census=1632 zone=NOROW inval=[none before confirmation] LIVE
id=1369 obst=2026.08.21 10:30 prot=2026.08.21 10:50 mode=nearest census=1658 zone=NOROW inval=[none before confirmation] LIVE
id=1389 obst=2026.08.21 13:35 prot=2026.08.21 13:55 mode=nearest census=1681 zone=NOROW inval=[none before confirmation] LIVE
id=1403 obst=2026.08.21 15:20 prot=2026.08.21 15:35 mode=nearest census=1697 zone=NOROW inval=[none before confirmation] LIVE
id=1401 obst=2026.08.21 14:55 prot=2026.08.21 15:40 mode=all census=1698 zone=NOROW inval=[none before confirmation] LIVE
id=1320 obst=2026.08.21 04:00 prot=2026.08.21 16:30 mode=nearest census=1706 zone=NOROW inval=[none before confirmation] LIVE
id=1416 obst=2026.08.21 17:10 prot=2026.08.21 17:30 mode=nearest census=1719 zone=NOROW inval=[kill line 1727 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1299 obst=2026.08.21 01:00 prot=2026.08.21 17:35 mode=all census=1721 zone=NOROW inval=[kill line 1728 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1414 obst=2026.08.21 16:50 prot=2026.08.21 17:35 mode=all census=1722 zone=NOROW inval=[kill line 1732 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1430 obst=2026.08.21 19:20 prot=2026.08.21 20:10 mode=nearest census=1741 zone=NOROW inval=[kill line 1787 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1450 obst=2026.08.21 21:55 prot=2026.08.21 22:15 mode=nearest census=1759 zone=NOROW inval=[kill line 1786 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1468 obst=2026.08.24 01:25 prot=2026.08.24 01:45 mode=nearest census=1777 zone=NOROW inval=[kill line 1783 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1481 obst=2026.08.24 03:20 prot=2026.08.24 04:10 mode=all census=1794 zone=NOROW inval=[none before confirmation] LIVE
id=1484 obst=2026.08.24 03:55 prot=2026.08.24 04:20 mode=nearest census=1796 zone=NOROW inval=[none before confirmation] LIVE
id=1495 obst=2026.08.24 05:20 prot=2026.08.24 05:35 mode=nearest census=1799 zone=NOROW inval=[none before confirmation] LIVE
id=1503 obst=2026.08.24 06:20 prot=2026.08.24 06:50 mode=nearest census=1807 zone=NOROW inval=[kill line 1814 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1506 obst=2026.08.24 06:50 prot=2026.08.24 07:10 mode=nearest census=1811 zone=NOROW inval=[none before confirmation] LIVE
id=1516 obst=2026.08.24 08:15 prot=2026.08.24 08:45 mode=nearest census=1823 zone=NOROW inval=[none before confirmation] LIVE
id=1508 obst=2026.08.24 07:10 prot=2026.08.24 09:30 mode=nearest census=1835 zone=NOROW inval=[none before confirmation] LIVE
id=1552 obst=2026.08.24 13:15 prot=2026.08.24 14:05 mode=all census=1878 zone=NOROW inval=[none before confirmation] LIVE
id=1589 obst=2026.08.24 18:45 prot=2026.08.24 19:00 mode=nearest census=1917 zone=NOROW inval=[none before confirmation] LIVE
id=1594 obst=2026.08.24 19:35 prot=2026.08.24 20:05 mode=all census=1926 zone=NOROW inval=[none before confirmation] LIVE
id=1591 obst=2026.08.24 19:00 prot=2026.08.24 20:25 mode=all census=1930 zone=NOROW inval=[none before confirmation] LIVE
id=1626 obst=2026.08.24 23:45 prot=2026.08.25 00:10 mode=nearest census=1962 zone=NOROW inval=[none before confirmation] LIVE
id=1644 obst=2026.08.25 02:15 prot=2026.08.25 02:35 mode=nearest census=1975 zone=NOROW inval=[none before confirmation] LIVE
id=1658 obst=2026.08.25 04:35 prot=2026.08.25 04:55 mode=nearest census=1989 zone=NOROW inval=[kill line 2046 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1664 obst=2026.08.25 05:35 prot=2026.08.25 06:00 mode=nearest census=1993 zone=NOROW inval=[kill line 2027 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1672 obst=2026.08.25 06:55 prot=2026.08.25 07:10 mode=nearest census=1998 zone=NOROW inval=[kill line 2024 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1656 obst=2026.08.25 04:25 prot=2026.08.25 08:50 mode=all census=2010 zone=NOROW inval=[kill line 2047 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1660 obst=2026.08.25 05:05 prot=2026.08.25 08:50 mode=all census=2011 zone=NOROW inval=[none before confirmation] LIVE
id=1670 obst=2026.08.25 06:40 prot=2026.08.25 08:50 mode=all census=2012 zone=NOROW inval=[kill line 2025 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1714 obst=2026.08.25 12:30 prot=2026.08.25 15:00 mode=all census=2078 zone=NOROW inval=[kill line 2086 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1715 obst=2026.08.25 12:45 prot=2026.08.25 15:00 mode=all census=2079 zone=NOROW inval=[kill line 2085 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1752 obst=2026.08.25 18:30 prot=2026.08.25 19:25 mode=nearest census=2113 zone=NOROW inval=[kill line 2118 t=2026.08.26 00:00 (bulk)] DEAD(2026.08.26 00:00)
id=1768 obst=2026.08.25 21:05 prot=2026.08.25 22:35 mode=all census=2143 zone=NOROW inval=[none before confirmation] LIVE
id=1765 obst=2026.08.25 20:35 prot=2026.08.25 22:45 mode=nearest census=2146 zone=NOROW inval=[none before confirmation] LIVE
id=1784 obst=2026.08.25 23:05 prot=2026.08.25 23:40 mode=nearest census=2152 zone=NOROW inval=[none before confirmation] LIVE
id=1796 obst=2026.08.26 01:00 prot=2026.08.26 05:25 mode=all census=2466 zone=NOROW inval=[kill line 4111 t=2026.08.26 11:10] DEAD(2026.08.26 11:10)
id=1821 obst=2026.08.26 05:00 prot=2026.08.26 05:25 mode=all census=2467 zone=NOROW inval=[kill line 3488 t=2026.08.26 10:40] DEAD(2026.08.26 10:40)
id=1822 obst=2026.08.26 05:10 prot=2026.08.26 05:25 mode=all census=2468 zone=NOROW inval=[kill line 4110 t=2026.08.26 11:10] DEAD(2026.08.26 11:10)
id=1825 obst=2026.08.26 05:40 prot=2026.08.26 06:00 mode=nearest census=2497 zone=NOROW inval=[kill line 3050 t=2026.08.26 10:20] DEAD(2026.08.26 10:20)
id=1835 obst=2026.08.26 06:35 prot=2026.08.26 06:55 mode=nearest census=2544 zone=NOROW inval=[kill line 2629 t=2026.08.26 08:35] DEAD(2026.08.26 08:35)
id=1833 obst=2026.08.26 06:25 prot=2026.08.26 08:55 mode=nearest census=2657 zone=1.16660-1.16682 [ZONEID 2708 + ZONEPICK 2710] inval=[kill line 2831 t=2026.08.26 10:05] DEAD(2026.08.26 10:05)
  WP/WF: WProws=386 WProvs=26 WFrows=29 WFovs=8 FIRST_WP=line 2810 bar=2026.08.26 09:55 o=1.16652 h=1.16674 l=1.16641 c=1.16668 [ENTERS] | FIRST_WF=line 2525 bar=2026.08.26 06:30 o=1.16661 h=1.16662 l=1.16636 c=1.16641 [ENTERS] | FORM=line 2517 bar=2026.08.26 06:25 o=1.1666 h=1.16682 l=1.1666 c=1.16663 | WIT=INPLAYCOMMIT line 2726 bar=2026.08.26 09:10 firstShift=6 firstVal=1.16667 (n=1)
id=1866 obst=2026.08.26 11:45 prot=2026.08.26 12:00 mode=nearest census=4782 zone=NOROW inval=[kill line 5275 t=2026.08.26 15:20] DEAD(2026.08.26 15:20)
id=1871 obst=2026.08.26 12:30 prot=2026.08.26 14:25 mode=all census=4939 zone=NOROW inval=[kill line 4991 t=2026.08.26 14:50] DEAD(2026.08.26 14:50)
id=1881 obst=2026.08.26 14:10 prot=2026.08.26 14:25 mode=all census=4940 zone=NOROW inval=[none before confirmation] LIVE
id=1704 obst=2026.08.25 11:20 prot=2026.08.26 16:00 mode=all census=5379 zone=NOROW inval=[none before confirmation] LIVE
id=1728 obst=2026.08.25 15:00 prot=2026.08.26 16:00 mode=all census=5380 zone=NOROW inval=[none before confirmation] LIVE
id=1891 obst=2026.08.26 15:45 prot=2026.08.26 16:00 mode=all census=5381 zone=1.16612-1.16640 [ZONEID 11684 + ZONEPICK 11686] inval=[none before confirmation] [PICK] LIVE
  WP/WF: WProws=301 WProvs=0 WFrows=2 WFovs=2 FIRST_WP=NONE | FIRST_WF=line 5338 bar=2026.08.26 15:50 o=1.1664 h=1.16652 l=1.16578 c=1.16607 [ENTERS] | FORM=line 5329 bar=2026.08.26 15:45 o=1.16635 h=1.1664 l=1.16612 c=1.16638 | WIT=zero-only(n=66) [PICK]
id=1072 obst=2026.08.19 16:50 prot=2026.08.26 17:10 mode=nearest census=6863 zone=NOROW inval=[none before confirmation] LIVE
id=1937 obst=2026.08.26 22:55 prot=2026.08.27 00:05 mode=nearest census=8659 zone=NOROW inval=[none before confirmation] LIVE
id=1992 obst=2026.08.27 08:40 prot=2026.08.27 09:00 mode=nearest census=9143 zone=NOROW inval=[kill line 10062 t=2026.08.27 11:05] DEAD(2026.08.27 11:05)
id=2003 obst=2026.08.27 10:10 prot=2026.08.27 10:30 mode=nearest census=9944 zone=1.16544-1.16560 [census promoT=2026.08.27 10:30 unique + XOBINPLAY line 9979] inval=[kill line 10061 t=2026.08.27 11:05] DEAD(2026.08.27 11:05)
  WP/WF: WProws=79 WProvs=14 WFrows=3 WFovs=2 FIRST_WP=line 9959 bar=2026.08.27 10:35 o=1.1652 h=1.16546 l=1.1652 c=1.1653 [ENTERS] | FIRST_WF=line 9908 bar=2026.08.27 10:15 o=1.16555 h=1.16555 l=1.16544 c=1.16555 [EQUAL-EDGE] | FORM=line 9892 bar=2026.08.27 10:10 o=1.16547 h=1.1656 l=1.16544 c=1.16555 | WIT=INPLAYCOMMIT line 9992 bar=2026.08.27 10:35 firstShift=5 firstVal=1.16560 (n=1)

## R1 coverage and gaps

- First census row time (coverage start): j37 2026.08.11 14:50; j39 2026.08.11 14:50; j38 2026.05.08 17:45; j40 2026.05.08 17:45.
- UJBARMAP printed-row spans and gaps over 60 minutes (market-closed weekends, never filled): A1 620 rows, no gaps; A6 2637 rows, gaps 2026.08.28 23:55 -> 2026.08.31 00:00 and 2026.09.04 23:55 -> 2026.09.07 00:00; A7 2719 rows, same two gaps; B2 2135 rows, gap 2026.05.29 23:55 -> 2026.06.01 00:00; F1a/F1b 1263 rows each, same 5/29-6/1 gap; F2 416 rows, no gaps.
- Counts: A1 143 tot (60 live, 83 dead; live-zoned 2); A6 219 (93 live, 126 dead; live-zoned 8); A7 222 (94 live, 128 dead; live-zoned 8); B2 270 (145 live, 125 dead; live-zoned 10); F1a 230 (126 live, 104 dead; live-zoned 6); F1b 230 (126 live, 104 dead; live-zoned 6); F2 134 (56 live, 78 dead; live-zoned 1).
- Sole OUTSIDE-through in the corpus: B2 XOB 2930 W-F bar 08:50 (j40:25474 o=159.905 h=159.921 l=159.905 c=159.919 vs zone 159.906-159.913: open below, close above), pre-promotion, ungraded; its W-P 09:00 (j40:25485 o=159.927 h=159.927 l=159.905 c=159.910) is ENTERS.
- Spot verification reads: j37:16375 UJBARMAP 8/28 14:00 o=1.16490 h=1.16494 l=1.16471 c=1.16474; j37:15256 06:30 o=1.16506 h=1.16508 l=1.16491 c=1.16494; j37:18865 17:00 o=1.16377 h=1.16589 l=1.16166 c=1.16198; j37:25732 9/1 08:45 o=1.16085 h=1.16100 l=1.16081 c=1.16095; j37:26098 9/1 09:15 o=1.16066 h=1.16081 l=1.16056 c=1.16057; j37:32173 9/2 14:35 o=1.15759 h=1.15791 l=1.15746 c=1.15783; j37:38507 9/3 10:45 o=1.16023 h=1.16050 l=1.16018 c=1.16027; j38:12476 6/1 03:15 o=159.409 h=159.422 l=159.400 c=159.416; j39:5338 8/26 15:50 o=1.16640 h=1.16652 l=1.16578 c=1.16607; j39:11686 ZONEPICK 17:00 xob=1.16612-1.16640 xobInPlay=0; j40:32719 6/5 16:00 o=160.216 h=160.262 l=159.726 c=160.034; j40:33108 ZONEPICK 16:10 xob=159.881-159.916 xobInPlay=0; j40:25474/25485 above; j40:26225 6/3 11:25 o=159.719 h=159.727 l=159.674 c=159.687; j40:28251 6/4 01:55 o=159.995 h=159.995 l=159.829 c=159.916; j40:29888 6/4 16:15 o=159.889 h=159.889 l=159.852 c=159.862.

## R2 PARTING TABLE (rows x readings; MET = at least one LIVE listed XOB with an entry in the reading's window)

- A1 28 Aug LDN SHORT conf 10:00 (j37): MP NOT MET (pick 2149 WP NONE, 41 rows); AP NOT MET (live-zoned 1891 WP NONE 505 rows + 2149 WP NONE); AF MET (1891 WF j37:6271 8/26 15:50 ENTERS o=1.16640 h=1.16652 l=1.16578 c=1.16607; 2149 WF j37:15256 06:30 ENTERS).
- A6 8 Sep LDN SHORT conf 10:05 (j37): MP NOT MET (pick 2898 WP NONE, 727 rows); AP MET (2149 WP j37:16375 8/28 14:00 ENTERS; 2217 WP j37:18865 8/28 17:00 ENTERS; 2470 WP j37:25732 9/1 08:45 ENTERS; 2495 WP j37:26098 9/1 09:15 ENTERS; 2674 WP j37:32173 9/2 14:35 ENTERS; 2825 WP j37:38507 9/3 10:45 ENTERS); AF MET.
- A7 8 Sep NY SHORT conf 16:55 (j37): MP NOT MET (pick 2898 WP NONE, 809 rows); AP MET (same six first entries as A6, windows extended); AF MET.
- B2 5 June NY LONG conf 16:10 (j40): MP MET (pick 3308 WP j40:32719 16:00 ENTERS o=160.216 h=160.262 l=159.726 c=160.034); AP MET (2094 WP 5/27 06:40; 2493 WP 5/29 15:45; 2566 WP 6/1 03:15; 2617 WP 6/1 11:00; 2720 WP 6/3 10:35; 2930 WP 6/3 09:00; 2945 WP j40:26225 6/3 11:25 ENTERS; 2976 WP j40:28251 6/4 01:55 ENTERS; 3150 WP j40:29888 6/4 16:15 ENTERS; 3308 WP 16:00); AF MET.
- F1 2 June NY LONG conf 15:30 (j38): MP NOT MET (pick 2789 WP NONE, 49 rows); AP MET (2094 WP 5/27 06:40 ENTERS; 2493 WP 5/29 15:45 ENTERS; 2566 WP j38:12476 6/1 03:15 ENTERS; 2617 WP 6/1 11:00 ENTERS); AF MET (2789 WF j38:21044 11:20 ENTERS; 2720 WF 00:55 ENTERS).
- F1 2 June NY LONG conf 15:30 (j40): MP NOT MET (pick 2789 WP NONE, 49 rows); AP MET (2094/2493/2566/2617 same bars on j40); AF MET (2789 WF j40:20132 11:20 ENTERS o=159.684 h=159.700 l=159.678 c=159.695; 2720 WF 00:55 ENTERS).
- F2 27 Aug NY SHORT conf 17:00 (j39, reported only): MP NOT MET (pick 1891 WP NONE, 301 rows); AP NOT MET (sole live-zoned 1891 WP NONE); AF MET (1891 WF j39:5338 8/26 15:50 ENTERS).
- Verdicts: MP DOES NOT SEPARATE (A1, A6, A7 NOT MET; B2 MET; F1/F2 NOT MET). AP DOES NOT SEPARATE (A1 NOT MET; A6, A7, B2 MET; F1 MET on both journals). AF DOES NOT SEPARATE (every row MET, F1 included on both journals; F2 reported).

## R3 RAWS

R3.1 his words (strategy skill, verbatim excerpts with line cites):
- W1 (skill:130): "27 aug NY: Skip cause the nearest target is the D VWAP which is less than 1R. i assume you or the EA behave like this because the nuance rule on the POC gap that the hierarchy is higher than VWAP, that is only when the VWAP jump or change the bias from the break of candle body closure. so please separate this nuance rule. also why did it exit on 17:15? the D VWAP has not been retested. if this is due to your SL, where did you put it? is it not at 16:25 high? i journaled this trade as invalid. is this due to your wiggle room because the candle almost nearly but not yet touch the D VWAP."
- 8/27-NY-INVALID (skill:136): the 8/27 17:05 NY SHORT off the Daily POC is INVALID by his journal. Amended point: the nearest valid target was the D VWAP, below 1R, so the setup is skipped - an instance of NEAREST-ONLY-TP plus the 1R floor at entry.
- POC-OVER-VWAP-SCOPE (skill:137): POC outranks VWAP ONLY in the gap case - when the VWAP jumps or the bias changes by a break with a candle body close. Outside that case POC rank never removes a VWAP from the target race; a VWAP that is the nearest valid line is the booked target (and refuses below 1R). Amends the second half of OWN-SOURCE-EXCLUSION; his own-source half stands.
- 8/27-NY-ORDINARY (skill:147): on 27 Aug New York, the Daily VWAP sat about 1.16500 under his 1.16524 short entry from 17:00 to the 17:10 exit. No candle body closed through it and its bias never flipped, so it is NOT a gap. It stays in the ordinary target race, and POC rank never removes it.
- OWN-SOURCE-EXCLUSION (skill:94): "the 6/11 NY setup entry POC is both from POC and VWAP. logically, it can't target it's own source of POI with also the nuance of POC is a higher hierarchy over VWAP on the gapped scenario." Amended point: a trade never books a target at its own origin lines.
- NEAREST-ONLY-TP (skill:89): "there is no such thing as no profit target, there is only target there is closer than 1R to then rejected." Amended point: book the nearest line and refuse ONLY below 1R.
- Spec v4.2 Step 6 (spec copy lines 185/187): "Pre-entry: the nearest valid take-profit target in the trade direction must imply at least 1R, or the setup is not taken. Targets are the nearest of: nearest relevant session-liquidity level, the same-tier VWAP/POC on the opposite side, or a higher-tier VWAP/POC. VWAP and POC on one anchor are the same tier. Evaluated continuously - targets move." / "A target is valid unless (a) already swept as session liquidity, or (b) closed over. A target lying inside the entry zone is not a target."

R3.2 j39 rows at the 17:00 decision (diag EA 4C6D560E):
- UJBARMAP 17:00 (j39:11579): o=1.16538 h=1.16542 l=1.16514 c=1.16526, dpoc=1.16541, dvwap=1.16498. The Daily VWAP appears at 1.16498.
- TPCENSUS #60 (j39:11660): bar=17:00 dir=SHORT ref=1.16524 winner=Yearly-VWAP best=1.16322 distPts=202, admitted = PDL:105 LOL:49 NYL:160 PML:24 YLOL:49 YNYL:105 YPML:24 LIVE/PD numbered lines (full row in slice head file r32.txt). No Daily-VWAP in the admitted list.
- UJPOISKIP (j39:11658-11659): line=Weekly-VWAP anchor=Weekly-VWAP (own-source exclusion prints; no Daily-line skip prints anywhere in 11640-11700).
- UJ1R POLL (j39:11672): entry=1.16524 sl=1.16652 tp=1.16322 R=1.58 PASS. TP_ELECT (j39:11913): entry=1.16524 sl=1.16598 tp=1.16322 R=2.73. A6FIRED (j39:11916): SHORT tp=1.16322 r=2.73 sl=1.16598. B60C (j39:11697): 17:00 SHORT Weekly-VWAP rt=16:25 cSrc=RETEST. RETESTBOOK (j39:11677): 17:00 hits=1 Daily-POC:r10:dS.
- Daily-VWAP R on printed values: entry ref 1.16524 (j39:11913), booked stop 1.16598 (j39:11913/j39:11916), target 1.16498 (j39:11579). R = (1.16524 - 1.16498) / (1.16598 - 1.16524) = 0.00026 / 0.00074 = 0.35, below 1R. (S2POLL stop 1.16652 at j39:11664 would give 0.17; the booked FIRE stop governs the fired trade.)

R3.3 code branch (kept EA 6CFE8F8B, located by text "tier-rank filter POI lines only"):
- 2705: for(int kf = 0; kf < POI_NLINES; kf++)
- 2706:   {
- 2707:    if(!UjPoiTargetValid(kf, g_anchorLine))
- 2708:      { if(InpDebugLog) PrintFormat("[SRJ-EA] UJPOISKIP bar=%s line=%s anchor=%s", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), g_lineCode[kf], (g_anchorLine >= 0 ? g_lineCode[g_anchorLine] : "none")); continue; }
- 2709:    if((g_authorityRank[kf] / 2) > (anchorRank / 2)) continue;
- 2710:    double vf;
- 2711:    if(!ReadBuf1(g_hPoi, kf, vf, barShift)) continue;
- 2712:     TpTargetUpdateBest(vf, dir, currentPrice, best, haveBest, g_lineCode[kf], uj_dk, -1);
- With anchor Weekly-VWAP (rank 9, tier 4) the Daily-VWAP (rank 11, tier 5) trips line 2709 (5 > 4) on a silent continue: no print exists on this path, which is why no Daily-line skip row prints on j39. SAME on .B69DIAG (lines 2727-2734 byte-identical modulo hunk-C offset; hunk C never touches the target race).

R3.4 j37 report (kept EA 6CFE8F8B):
- (a) The tier-skip (kept EA:2709) prints on no booking pass: NO ROW for all of A1-A7 (silent continue by code, R3.3). The printed skip at every booking pass is the own-source UJPOISKIP: A1 D-VWAP j37:15613/15614 + 15730/15731; A2 M-VWAP j37:29845/29846; A3 Y-POC j37:44320/44321 + 44473/44474; A4 W-POC j37:47421/47422 + 47583/47584; A5 W-POC j37:50274/50275 + 50434/50435; A6 W-POC + M-POC j37:52262/52263 + 52449/52450; A7 M-POC j37:54702/54703 + 54875/54876 (16:40 pass 54166/54167 + 54340/54341). Booking rows: A1 TP_ELECT j37:15787 + A6FIRED j37:15790; A2 29882 + 29885; A3 44604 + 44607; A4 47682 + 47685; A5 50511 + 50514; A6 52489 + 52492; A7 54478 (16:40 R0.68) then 54925 + 54928 (17:00 R1.96).
- (b) Kept-build 27 Aug 17:00 candidate death row: CONFIRM_PREBIND_FAIL bar=17:00 dir=SHORT term=C_TOUCH (j37:12731); TPCENSUS #71 at 17:00 (j37:12693, winner Yearly-VWAP 1.16322) and SUPPRESSED Daily-POC-held row (j37:12709) beside it.

R3.5 one-liner: his words name the Daily VWAP (~1.16500) as the nearest target, below 1R; on j39 rows the machine never admits it (absent from TPCENSUS #60, no skip print - silent tier filter) and books Yearly-VWAP 1.16322 at R2.73; on printed values the D VWAP gives R 0.35 with the booked entry and stop. No proposal.

(End of slice)
