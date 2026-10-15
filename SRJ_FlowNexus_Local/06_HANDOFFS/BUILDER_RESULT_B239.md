GRADE RECON62-B238K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B237D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 6; MACHINE-ONLY ungraded 0; trades 19
# BUILDER RESULT B-239 - MEASURED (EURUSD): any-reach zone list not buildable in the EA
Trader summary: Your "no zone reached, no trade" rule cannot be built where your relay put it. The machine grows every zone inside its indicator, and your tester EA only ever sees the one zone it picked, never the full list, so it cannot check "any zone" before entry. Nothing was changed, tested, or undone. The next relay needs either a new export from the indicator or your word on which zone carries each take.
## Relay order (B-239 F3-INPLAY 5 of 6 diagnostic 2; MEASURED K0 STOP)
- Part 0 on builder/B-239 cut at 044a119 (backup exact). Python 3.13.16. Reads per 0.3 in order. Gate: log-1 044a119, status 995 (+B-238 artifacts ACCOUNTED, listed), gated diff EMPTY, EA a62194f8/a975ea27 + POI d47a0e68/04fcd8a5 + tini a512582a, tick STATIC (10-06 18678468), no terminal64, ledger ^1385=1 ^1386=0. Line numbers verified by grep (rules/21 L2 and rules/28 L2, relay said L3; rules/50 L4 exact).
- Part B: no new rule words (50/21/28 quotes count 1 each).
- Part K0 (read-only map, raw in slice): FVG births (GAP_FORM prints, FlowLogic 1763/1782) live in Indicators/SRJ_FlowLogic.mq5, a separate indicator program; XOB promotion state (g_orderblocks/isPromoted) lives there too; the EA's one XOBPROMO hit (EA:9526) is a print-only buffer census, not a birth. EA lines 465-466 forbid indexing either list; the EA reads picked-zone buffers only (XOB_ZONE/FVG_LEG_ZONE/obj IDs/promo time). Zone gate B177HZ at EA:10478-10506 with GoAbort path confirmed in-EA. K0.4 STOP-for-planner: both birth points outside the EA program. No edit, no compile, no runs.
- Part K/T: skipped (K0 STOP). No backups needed (nothing touched); disk untouched.
- Part X: ledger 1386; fixplan F3 State B-239 (K0 STOP map summary); pointer State B-239 + Lane 5/6 + Next (planner decides 6 of 6); batch B-239 no new items; truth unchanged; no LESSONS line. Size gate in slice; READ_MAP rewritten.
## Final disk state
- Untouched: EA a62194f8/a975ea27, POI d47a0e68/04fcd8a5, terminal.ini a512582a, 17 chart files, no terminal64. Review batch: REPORT/REVIEW_BATCH_B239.md (no new items).
## Record checklist (grep-verified in staged files)
- X1 fixplan State B-239: FOUND
- X2 ledger 1386: FOUND
- X3 pointer State B-239 + Lane 5/6: FOUND
- X batch no-new-items: FOUND
## Carried note
- What a buffer export from the indicator would need (names only, no edit): per-bar same-side zone lists, XOB {promotionBar, low, high, side, objId} and FVG {t1/t2/t3, top0/bot0, side, objId}, or a count plus indexed access to the same records the GAP_FORM/XOB rows already print. Planner decision, new print design.
- Next: F3 6 of 6 decided by planner on the record (export road or his retest line).
