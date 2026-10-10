# BUILDER SLICE B-152 - R0 lines, K1 diffs, K1c crash + tables, restore (RESTORED)

## R0 raw (B150K export, flag set 1473-1494; key objId 1486-1491)
1478 NULL skip; 1480 `if(!b150ob.isPromoted) continue;`; 1481 SrjIsNa(promotionBar) skip; 1482 `if(i <= (int)b150ob.promotionBar) continue;`; 1483 NA-zone skip; 1484 overlap -> 1486-1491 flag[objId]=true (grow +1024).
(a) NOT FOUND: 1480 + strict 1482 exclude promo candle and earlier; isPromoted never cleared (Types.mqh:83 ctor only); stamp `= i` at OrderblockMgr.mqh:894 + :949.
(b) NOT FOUND: identity-keyed; ids unique/run (Types.mqh:25-31); restart only via StateInit at OnInit (:825, no flags) + prevCalc==0 block (:988, reset :1467-1472 covers).
(c) FOUND index-like-for-like: long (Types.mqh:59), stamp `= i`, compare vs loop `i` (1482). Detail: 1481 SrjIsNa hits the double overload for long - inert, harmless (1480 dominates); never index by promotionBar on its strength alone.

## K1 diffs (trial src 83289B4E; ex5 8367027F; 0 errors + 1 benign warning long->int 1481->1483)
vs B150K (+28/-11): + `long g_b152cb[]` (+comment); + reset line; + lockstep grow + first-touch record (cb=i); + detail segments `id,dir,lo,hi,promoT,valid,cbT,cbH,cbL` in MET loop; print B150PR -> B152PR `sym bar bull bear z=...`.
vs kept 956BF3E3 (+106/-1): above + B-150 hunk (buffers 48/49, touch flags, B150PR block); the -1 is B-150's buffer-count line.

## K1c RECON62-B152S1 (EA untouched; ini EURUSD 1787702400/1788998400 read back; watcher PID-verified)
Wrapper PASSED 12:11:11 (563338 ticks generated) BUT: day-log line 667236 `array out of range in 'SRJ_FlowLogic.mq5' (1520,36)` at tester bar 2026.08.27 19:55; last B152PR 2026.08.27 19:45 (123574 rows); 0 deals (BIASCENSUS bars=527 vs 3168); EA deal-less to 9/09. Filed-trade table: EMPTY vs 14 required -> K1c STOP.
Live line 1520 col 36 = `time[b152cbB]` (comeback index OOB). Pre-crash symptom in 12:09:30 heartbeat: 474/484/706 print cb 2025.01.02 00:00 (bar 0, h/l 1.03514/1.03503, no overlap) beside correct cbs (305 -> 8/13 11:00). Paired assignment cannot yield flag-without-comeback: desync mechanism UNKNOWN (suspects: file-scope array desync across calc calls; growth-path slot mismatch). Fix direction: store comeback primitives at flag time or verify index before indexing. JUNE0525-B152S1 never launched.

## T5 restore (verified from *.preB152)
Indicator src 956BF3E3 + ex5 27B5F272; EA 585093BF/AB159DE7; OrderblockMgr 5D14FCE2; terminal.ini AA4EA14B (20447 B); Charts 0 diffs; no terminal64 (leftover 4456 stopped pre-grade). .B152K (83289B4E/8367027F) + .preB152 kept uncommitted, never staged.

(End of slice)
