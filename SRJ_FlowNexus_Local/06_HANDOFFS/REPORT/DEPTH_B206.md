# REPORT/DEPTH_B206 - how far back the tester's ticks really go (trader words)

Verdict line: Yearly lines on the tester start from 25 May (this run's walk; the Yearly slot folds from 26 June off
the kept checkpoint, calendar 1 January unreachable); on his chart they start 1 January.

## R0a - first tick date per pair today
- Tick files on disk hold monthly ticks back to September 2023 for EURUSD, GBPUSD and USDJPY (202309.tkc onward,
  through 202610.tkc, updated today); the October month grew during this batch.
- The walk the tester actually serves today starts 25 May 2026 on the euro and pound windows
  ([POI][DEPTH] measured=2026.05.25 on RECON62-B206K/T and GBP0629-B206K/T) and at the window start on the June yen
  window ([POI][DEPTH] measured=0 at 2026.05.25 on JUNE0525-B206K/T).

## R0b - walk start and Yearly fold start per baseline run (EURUSD scope; yen/pound measured same day, held)
- RECON62-B206K: walk 2026.05.25; Yearly slot calendar 2026.01.01, checkpoint-adopted fold from 2026.06.26 10:00:00
  ([POI][SEED_SLOT] slot=Y kind=CALENDAR filePeriodStart=2026.01.01; [POI][FLOOR_SLOT] slot=Y trueStart=2026.01.01
  reachesFloor=NO adopted=YES foldFrom=2026.06.26 10:00:00).
- JUNE0525-B206K: walk at window start 2026.05.25 (measured=0); Yearly rows as above (same checkpoint).
  (Published for the walk number only; yen grades held.)
- GBP0629-B206K: walk 2026.05.25; Yearly rows as above. (Published for the walk number only; pound grades held.)
- Beside history: B-202's walk start 2026.06.01, B-205's 2026.05.25 (same as today - no drift between B-205 day and today).

## R0c - Yearly POC/VWAP at the first session candle (09:00 bar, 09:05 pass) on RECON62-B206K vs RECON62-B202
- 26 Aug: Yearly-POC=Lno-penetration/Sbody-above, Yearly-VWAP=Lno-penetration/Sbody-above, both builds identical.
- 1 Sep: Yearly-POC=Lbody-below/Sbody-above, Yearly-VWAP=Lbody-below/Sno-penetration, both builds identical.
- 7 Sep: Yearly-POC=Lno-penetration/Sbody-above, Yearly-VWAP=Lbody-below/Sno-penetration, both builds identical.
- Carried by UJDTTERMS (side tags, no prices); Yearly prices at those candles NOT PRINTED on any print.
  Nearest value evidence is the 7 September exit booking: Yearly-VWAP 1.16315 on B-202 day vs 1.16318 today.
