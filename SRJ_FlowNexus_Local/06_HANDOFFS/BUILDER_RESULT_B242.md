GRADE RECON62-B242K: KEEP entries exact 7/7; KEEP exits exact 6/7; NEVER fires 0; MACHINE-ONLY ungraded 0; trades 7
GRADE EU0525TD-B241D: KEEP entries exact 13/13; KEEP exits exact 12/13; NEVER fires 4; MACHINE-ONLY ungraded 0; trades 17
# BUILDER RESULT B-242 - KEPT (EURUSD): early kill installed, 10 Jun + 22 Jul silent
Trader summary: Your early kill is now the kept build: your 10 June long and your 22 July short are refused on it with every keep unchanged, re-proved on the short run deal for deal. Your 25 June short still goes through and stays the open row. Nothing else changed on either run.
## Relay order (B-242 F1/F2 install 2 of 6; KEPT)
- Part 0 on builder/B-242 cut at 1415188 (backup exact). Python 3.13.16. Reads per 0.3 in order. Gate: log-1 1415188, status 1058 (+B-241 artifacts ACCOUNTED, listed), gated diff EMPTY, kept SHAs + .B241K verified, tick STATIC (10-06 18678468), no terminal64, ledger ^1388=1 ^1389=0. Tini b64523fc touch-class ACCOUNTED ([Tester]/[TickLoad] intact, RECON dates); B-241 gate line imprecise (unmeasured carryover, owned here, no evidence impact).
- Part B: no new rule words (REACHED-ONLY-INPLAY pin + addendum line count 1).
- Part S (SEPARATOR_B242.csv, 30 rows): SEPARATES 14 (12 KEEP EXACT + N10JUN/N22JUL FIRES->SILENT); OTHER-GATE 16. G1: no KEEP worse, fires only drop, EU 6->4 better. PASS -> install.
- Part K (no edit, no compile): .preB242 = kept SHAs; installed .B241K (9 files) verified (EA 18a1d49b/d85cf7d2, Flow 61177aa5, includes .B216K SHAs), markers 1 each.
- Part T (same binaries re-proof): RECON62-B242K window JL 6276327 verified, PASSED, ex5 pre/post, grade 7/7-6/7-0; deal list identical to B241D deal for deal. EU not re-run (same binaries + static ticks: ACCOUNTED); EU0525TD-B241D is the kept long baseline. Restored 17 charts + tini from pre-launch copies; installed files stay.
- Part P: ROWPACK RECON62-B242K (6 day files) + EU0525TD-B241D (17 day files, DEAL+B215F1+B216H1+B234EQ+B237TD) + both DEALS + INDEX_B242 (21 rows); SETUPS EXECUTED-only (7 + 17 rows; REJECTED rows need full-tag packs, stated); REVIEW_BATCH_B242 no new items.
## Final disk state
- Kept: EA 18a1d49b/d85cf7d2 + Flow 61177aa5 + 5 includes (.B241K) + POI d47a0e68/04fcd8a5, terminal.ini b64523fc (touch-class), 17 chart files, no terminal64. Review batch: REPORT/REVIEW_BATCH_B242.md (no new items).
## Record checklist (grep-verified in staged files)
- S separator + G1: FOUND
- K install SHAs + markers: FOUND
- T DEALS_B242K + cut + grade + deal compare: FOUND
- P INDEX_B242 + SETUPS x2 + batch: FOUND
- X fixplan F1 + F2 + pointer State B-242 + ledger 1389: FOUND
## Carried note
- B-236-filed EU day packs (journal_line -1) stay corrected on disk only (out of F5 scope here too); TOOLS/job_cut_b235.py repair likewise. Owned in B-236/B-237 records.
- Next: planner decides (25 June road or next EU_FIX_PLAN item F0).
