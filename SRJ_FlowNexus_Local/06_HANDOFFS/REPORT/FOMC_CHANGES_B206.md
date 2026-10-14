# REPORT/FOMC_CHANGES_B206 - every FOMC-traced change, baseline vs trial (trader words; EURUSD scope)

Builds: baseline = kept build (POI marker 79859edc, single 29 July anchor, no FOMC lines inside the June window);
trial = .B205K (POI marker 5AF5E035, fresh FOMC lines on every decision: 29 April, 17 June, 29 July, 16 September).
Same-day, same ticks. EURUSD scope per his order (yen/pound walks measured the same 25 May day but held unpublished).

## Change 1 - 18 June euro long missing on trial (EU0525TD-B206T vs DEALS_EU0525TD-B202)
- B-202 (kept build, 13 Oct history): buy 18 June 09:45 at 1.15256, out 18 June 10:25 at 1.15101.
- Trial: never enters. It arms the FOMC-VWAP long (09:35-09:55 rows), kills the line at the 09:40 pass
  (WINLINE KILL FOMC-VWAP 1.15233), prints no 09:45 FIRE, and aborts the leftover at 10:00 on the 5-minute flip
  (B182DEC LONG ABORT LTF_MISALIGN). The Daily-POC long stays suppressed for the FOMC-VWAP hold throughout.
- FOMC-TRACED (heldPoi=FOMC-VWAP, WINLINE KILL FOMC-VWAP, SUPPRESSED Daily-POC held for FOMC-VWAP).
- Filed as its own next item (P3 NOT FIRED), not a fail of this trial.

## No-change notes (FOMC-TRACED changes on euro: none)
- RECON62 trial 16/16 deals and every B201FROM/B201TO row identical to the same-day baseline (96/96 both).
- Euro long otherwise 44/44 shared takes identical side/date/time/price (26 May through 8 Oct, incl. the 10 June,
  25 June and 22 July invalids both builds take - no new invalid fires - and the 7 September 21:25 exit at 1.16239
  both builds book).

Held unpublished per his EURUSD-first order (measured, retained locally): yen trial 8/8 identical with zero row
diffs; pound trial adds one 1 July long (09:50 1.32412, FIRE anc=FOMC-POC) plus its 29-30 June FOMC-VWAP seed trail.
