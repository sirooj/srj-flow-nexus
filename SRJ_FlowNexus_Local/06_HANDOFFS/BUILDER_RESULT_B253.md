GRADE RECON62-B253: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7 (A1 exit +3pt carry of the B-137 note)
GRADE EU0525TD-B253: KEEP entries exact 13/15; KEEP exits exact 12/15; NEVER fires 4; MACHINE-ONLY ungraded 3; trades 20 (same 13/15-12/15-4 shape as EU0525TD-B252R0A; K19JUN and K10JUN MISSING; trades 17->20 = three new machine-only promo takes, -0 baseline deals)

VERDICT: RESTORED (T3 else branch: the keep gate requires K19JUN ENTRY EXACT 2026-06-19 buy 15:45 1.14644 and it stayed MISSING).

Trader view: the machine still made its decision on its own body-confirm candle and entered at 15:50. The divergence verdict was already readable in the 15:45 pass (B253DR rows prove found + latched: kind=hidden, x2=15:35, read wall 15:45:01, latch=1) but my promo bridge only allowed the B_BODY fail term, and that pass failed A_OPP instead — a wrong-branch gate of my own writing. The fix direction is already proven by the three Aug takes the promo DID add (all FIRE-state ladders): widen the trigger geometry (verdict sits at barShift+1) — for the planner to rule, never tuned by me.

Parts:
- K0 FOUND (call order + rows): BUILDER_SLICE_B253.md sections 1-2.
- K1/K2 hunk: helper B253TrySwingConfirmPromo (L7030) + S4 else-branch call gated cfTerm=="B_BODY" (L10361-10370); braces delta 0; compile 0 errors 0 warnings; keep .B253K src 4d5fd60f / ex5 3f9045cc (521,368); .preB253 src 18a1d49b / ex5 d85cf7d2.
- T1 PASS (RECON 7/7-6/7-0). T2 graded EU 13/15-12/15 NEVER 4 trades 20. T3 RESTORED.
- T4: REPORT/DIVREAD_B253.csv (3 new M rows + the 19 June no-move row).
- T5 F4b measure-only: REPORT/EQSWING_B253.csv (9,069 unique pair verdicts; EQ-YES 133 = RECON 19 + EU 114; NODATA 5,809 honest gaps; 33 EQ-YES rows intersect a deal date).
- Restore (T6): EA src/ex5 18a1d49b/d85cf7d2 520,964; terminal.ini 2862b31f; Flow/CQD/POI ex5 61177aa5/90d3ef87/04fcd8a5; charts mirror-exact 37/1,679,192 (3 run-era saves quarantined Temp srj-quar-charts-b253); no terminal64.

Carried note for you (trader words): the three machine-only takes above are NEW and need your grade verdicts (M20 10 Aug 09:50 long 1.15542 / M22 11 Aug 14:40 long 1.15386 / M24 24 Aug 18:40 long 1.16689 — 10 Aug + 24 Aug carry hidden-vs-candle CQD pairs; the M12 19 June pair repeat stays exactly as before, never re-asked).

Housekeeping manifest (executed after the push verified, per the standing order): deleted Tester\logs\20261017.log (8,720,848,370 B) and Tester\logs\20261018.log (1,427,648,862 B) — segments survive in CUT_RECON62-B253.log (153,004,629 B) + CUT_EU0525TD-B253.log (556,556,855 B, both kept in 00_CURRENT_WORKING). Disk after: C 14.6 GB, D 66.2 GB free. Chart saves in Temp awaiting YOUR deletion word: srj-quar-charts-b253\Default (3 files from this run) and srj-quar-charts-b252\Default (6 files from B-252). Kept for the next retry: .B253K (4d5fd60f/3f9045cc) + .preB253 (18a1d49b/d85cf7d2).
