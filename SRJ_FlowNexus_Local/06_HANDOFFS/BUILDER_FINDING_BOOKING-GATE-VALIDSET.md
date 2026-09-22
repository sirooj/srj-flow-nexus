# BUILDER_FINDING_BOOKING-GATE-VALIDSET (2026-09-22, read-only reconciliation design, no ask)

## Standing constraints (all his, all cited, none re-asked)

- C1 booking (ledger 536, 2026-09-21, latest): nearest valid TP wins, family/category disregarded. Amends the 2026-09-17 POI-FIRST fork.
- C2 floor (spec Part A v4.2 section 3.7; v141 verbatim "1R gate KEEP"; charter line 28): nearest valid TP must imply 1R+ at admission, no floor in management.
- C3 valid set (goal Amendment 4; v141: 8/28 valid with "R check must not kill it" plus "my valid trades is what i want to replicate"; journal rows 257/277/281/285): reproduce EVERY valid take.
- C4 micro-validity (v142 line 198: "His YES keeps micro lines valid"): prev-day session micro lines stay candidates; exclusion off the table.
- C5 filters as built (packet P15, V225-cleared): direction + in-zone both pools; tier-rank POI only; swept/live mask session/PD only. LOH 8pts (9/7am) and LOL 7pts (9/8am) cut by these filters (would imply R 0.22 / 0.13 at the gate anyway - machine-computed).

## Per-bar proof (RECON52 segment 94C248E7 vs RECON51 7E86343A; pools byte-identical both runs; R machine-computed)

- 08-28 10:00 SHORT entry 1.16466 sl 1.16508 (risk 42): pool has PML/YPML 7pts, ASL/YASL 11pts, LOL 37pts, PDL/NYL/YNYL 102pts, Yearly-VWAP 144pts. F1 books YPML 1.16459, R 0.17, BLOCKED. Old booked Yearly-VWAP 1.16322, R 3.43, took (11:40 BREAK small win). His line daily POC 1.16380, R 2.05, NOT in either pool (pool-coverage flag).
- 08-28 16:20 SHORT entry 1.16430 sl 1.16508 (risk 78): pool has LOL/YLOL 14pts, NYL 38pts, PDL/YNYL 66pts, Yearly-VWAP 108pts. F1 books YLOL 1.16416, R 0.18, BLOCKED. Old booked 1.16322, R 1.38 (A1 paper trade T2, lot-refused). NEVER valid: declined under his kill-all 2026-09-17 (v169 P013 repeats; FRESHVETO-V1); sub-1R on his reference per his 2026-09-22 word. Corrected same turn - prior 'his stop trade' framing withdrawn.
- 09-04 15:55 LONG entry 1.16018 sl 1.15847 (risk 171): pool has LOL/YLOL 170pts, PML/YPML 234pts, NYH 252pts, YNYH 283pts, ASH/YASH 313pts, Yearly-VWAP 297pts. F1 books YLOL 1.16188, R 0.99, BLOCKED (GLM-D4 carve-out). Old booked 1.16315, R 1.74, took (his +0.84). His line admitted, loses nearest race.
- 09-07 09:15 LONG entry 1.16135 sl 1.16098 (risk 37): pool has LOH 8pts (cut, C5), PMH/YPMH 23-24pts, YLOL 53pts, ASH/YASH 65-66pts, NYH/YNYH 135-136pts, Yearly-VWAP 180-181pts. F1 books YPMH 1.16158, R 0.62, BLOCKED. Old booked 1.16315, R 4.86, took. His line AS.H ~1.16200, R 1.76, ADMITTED (mask 2816 validated per ledger 535), loses nearest race. Direct 535-vs-536 tension on record.
- 09-07 16:40 LONG entry 1.16261 sl 1.16238 (risk 23): pool has YNYH 9-10pts, NYH 21-22pts, Yearly-VWAP 54-55pts. F1 books YNYH 1.16270, R 0.39, BLOCKED. Old booked 1.16315, R 2.34 (v142 files 2.12 on a different sl basis; machine figure used here), took (his +1.06). His line admitted, loses nearest race. ASH correctly absent from pool.
- 09-08 10:05 SHORT: F1 books YLOL 1.16102, R 1.94, TAKEN (TP_TOUCH win). LOL 7pts cut by C5.
- 09-08 16:55 SHORT: F1 books YPML 1.16210, R 0.19, BLOCKED both runs (old R 0.68 also blocked). Valid setup, no gain row on his record - not a deployment-bar miss.

## Unsatisfiability (fact, not a question)

- C1 + C4 + C5 fix the winners (proved above, all admitted-valid, ties value-graded). C2 then blocks every winner below R 1.0 (0.17/0.18/0.99/0.62/0.39). C3 requires his four valid trades taken (8/28 London, 9/4 New York, 9/7 London, 9/7 New York; 8/28 New York NEVER valid - A1 kill-all decline, corrected same turn). On this window the three constraints are jointly unsatisfiable under the current pool: 1 take of 7, his four missed. No alternative reading of the same words changes any number above.

## Resolution space (design sketches for a future council round; each names the word it moves)

- R-a menu-conformance audit (CODE question, no amendment needed if it holds): does the 18-level session/PD pool match the spec section 3.7 menu (nearest relevant session-liquidity level / same-tier VWAP-POC opposite / higher-tier VWAP-POC)? Per-bar consequence computed per candidate menu. Note it cuts both ways: his 8/28 daily-POC line is absent from both pools today. Needs EA cites (pool construction + menu mapping), council route, his transport in a later turn - NOT this turn.
- R-b preference order among valids (v142's surviving space): rank family/anchor lines above micro lines at booking. Moves C1 (536-nearest). PARKED: needs his amendment; never asked now (D1-V7).
- R-c gate reference (spec line 191 higher-valid-R selection): gate on max-R over valids instead of booked-R. Contradicts charter line 28 (gate against the nearest valid target). PARKED: needs his amendment; never asked now.
- R-d accept the misses: contradicts C3/goal. DEAD, stated for completeness, never proposed.

## Non-asks (D1-V7 compliance)

- Floor revisit: settled (C2 KEEP). Take-rate acceptability: settled (C3 replicate-all). Booking rule: settled (C1). Validity of micro lines: settled (C4). Nothing in this file asks him anything.

## Cost and state

- Cost: zero build, zero run, read-only pulls only. No council round opened (transport is his carrier; no transport asked this turn per draft-split).
- Next: a future council round on R-a needs his transport word; R-b/R-c need his amendment word which is never solicited. Quiescent until either word arrives.
