# BUILDER_FINDING_BOOKING-ASH (2026-09-23, read-only, booking thread CLOSED by verification, no build)

## His rule (verbatim 2026-09-21, index-recorded): booked TP is the nearest valid target (AS.H on 9/7 London), family/category disregarded; flat ledger 536.

## Proof on the built tree 98F6BBAC (all disk-measured this turn)

- TPCENSUS #108 bar=2026.09.07 09:15 dir=LONG close=1.16135 (RECON57 segment 6F242EAC): winner=YASH best=1.16200 distPts=65, admitted ASH:65 vs YASH:65 (exact tie, both admitted = both valid).
- Name map (EA L2403-2406, index-aligned with sessbufs L2325-2333): ASH = FL_BUF_ASIA_HIGH (race index 2); YASH = FL_BUF_PD_ASIA_HIGH (race index 10).
- Booking keeps FIRST-equal (EA L2289 strict less-than: `if(!haveBest || dist < MathAbs(best - currentPrice))`; comment L2364 records the census-vs-booking tie-name divergence by design): ASH (idx2) arrives before YASH (idx10), so BOOKED = AS.H at 1.16200.
- Fills prove the value: MTSNAP/TP_ELECT tp=1.16200; MTEXIT TP_TOUCH 10:50 exit 1.16200 (RECON55/56/57 identical).
- Census names YASH (LAST-equal overwrite, L2419) while booking keeps ASH: tie-NAME divergence, filed design per L2364, never a fill gap. Yearly-VWAP sat 180pts away (admitted Yearly-VWAP:180) - never booked on this tree; his "further yearly VWAP" wording describes the PRE-F1 tree, retired.

## Reading

- Booking thread CLOSED: his nearest-valid rule is satisfied on the current tree (AS.H booked by value AND by line-order proof). No packet, no build, no run for booking. Withdraws my RECON56/57 "flaw persists" lines (stale pre-F1 framing, owned here).
- Reopen only on his word (e.g., if a future window books a further line over a nearer valid one).

(End of file)
