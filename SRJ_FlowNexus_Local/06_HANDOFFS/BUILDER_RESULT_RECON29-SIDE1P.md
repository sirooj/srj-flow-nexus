# BUILDER RESULT — RECON29-SIDE1P (`SIDE-1P-REV3` print-only run)

**Verdict: DELIVERED, graded PASS-with-PARTIAL-REFUTATION (2+2 direction 4/4; fork F4 ×2 at Sep-8, pre-registered branch). Yield COMPLETE — this is a side-rule claim per §H, not inconclusive. Isolation clean. Council ruling owed (v56 relay): accept record + author the side-fix packet. NOTHING builds/runs/commits.**

## 1. Run facts

- DONE=PASSED 2026-09-15 15:31:13. Test passed in 0:48:13.630 (< 90, no timeout). 3168 bars / 563338 ticks (same footprint as RECON20b–28).
- Archive `06_HANDOFFS\RECON29-SIDE1P_JOURNAL.log`: 38025 lines / 7425579 B / SHA256 `FBF3D544918C32FE598B36733426EF713A9ADC7832FA7376E9D7AAC42FDF629C` / bounds [114030..152054] (PRE=114030 contiguous past RECON28's 114027; 114030+38025−1=152054 exact).
- Purity: Core-04 prints (16 Tester framing lines only), Test-passed-1, single local agent. Archive max line 537 (= cap, zero over). SELHALT 0.
- Build: EA `CB25D2D2…` (553055 B, SIDE1P2_ block + 2 hooks only, adoption OFF), FlowLogic `3606BFB4` unchanged, both compile 0/0 fresh logs. Build uncommitted; RECON17 frozen.

## 2. Realized delta (close-the-loop vs the v54 promise)

- Promised FIRST vote-at-site-with-provenance across the 7-bar roster → DELIVERED (7 MATCH + 1 REPORT + COUNT, full text in `06_HANDOFFS\RECON29_SIDE1P.txt`, 9 lines, SHA `A3EC2689…`).
- Promised 2+2 direction (R3/R4 LONG agree; Sep-8 LONG-disagree) → 4/4 HELD (see §3). Fork refinement F4 ×2 is the pre-registered PARTIAL-REFUTATION branch, not a miss.
- Promised everything else frozen → DELIVERED (full isolation diff-0, §4).

## 3. Grades (full text in `06_HANDOFFS\RECON29_SIDE1P.txt`)

- **R3 — PASS.** LONG, SRC 15:45, CARRIED PRE-SEP8, F3, GRADED. Agrees with roster LONG.
- **R4 — PASS.** LONG, SRC 09:00, CARRIED PRE-SEP8, F3, GRADED. Agrees with roster LONG.
- **S1 — PASS-with-F4.** LONG used at SHORT site (disagreement as predicted), SRC same-day 09:20, CARRIED ONAFTER-SEP8, F4, GRADED. Stale-carry component refuted; disagreement retained → packet self-reports PARTIAL-REFUTATION (N=2 covers S1+S2).
- **S2 — PASS-with-F4.** LONG used at SHORT site, SRC same-day 16:45, F4, GRADED. Same reading.
- **R2 — VOID holds.** NODIR/NONE, F11 CLEAN-VOID, GRADE=NONE with VOTE-EXISTS-DISCARDED=NOT-ASSESSED (horn ii honored). MUST-DECLINE intact.
- **R1/R5 — HELD, no claim.** R1 SHORT/F5 (observation only — roster LONG-held INFERRED; mechanical-birth correction is council's, never the builder's). R5 LONG/F3.
- **Gates:** 7/7 seen (P1 DIVERGENT never fired — mapping confirmed in practice); F12 residual never exercised (table exhaustive first try); DEFAULT-INIT/VOID-WITH-DIRECTION unexercised; HALT 0; MAXLEN 260 (reassembly condition met via no-split-needed); YIELD=COMPLETE (4/4 core graded).
- **Failure condition (§I substitution-only):** S1/S2 LONG traces to earlier bars (09:20/16:45), never own birth bars → substitution confirmed. Core premise HOLDS with the F4 same-day refinement.

## 4. Isolation (same patterns both archives, RECON29 vs RECON28)

- 1465/1465, 600/600, 192/192, 16/16, A6 481/2/2/481/2/1/4/52, GEOM 7/8/1 payloads byte-identical, signals 4/4 byte-identical (2.43/2.56/1.76/1.25), A6COUNT identical (1024/10/0/481), SELHALT 0/0, OrderSend-journal 1/1 (the independence line adopt=0 ordersend=0/0 — alert-only proven in-run). Only delta: +9 SIDE1P2 lines (7+1+1, pre-declared). No selection drift; adoption static OFF.

## 5. The finding (mechanism refinement for authorship)

- Sep-8 disagreement is REAL (LONG carried through both SHORT bars — the code-side contradiction stands proven with provenance).
- It is NOT pre-Sep-8 stale carry: both sources resolve same-day (09:20 → 10:10; 16:45 → 17:00). The fix seats a same-day object (S1: his 9:50/9:40 zone; S2: his 16:20 zone), not a week-old one. Whether the 09:20/16:45 LONG votes are wrong-side resolutions or carried-then-kept is COUNCIL AUTHORSHIP (F6) — the builder does not adjudicate.
- R1-SHORT-held is carried as observation for the birth-mapping review (F5 handling voids 2+2 claims only where graded — R1 is held, so yield stands COMPLETE).

## 6. Asks (v56 relay)

1. Accept this record (run + grade + isolation + F4 refinement with two-bar corroboration).
2. Author the side-fix packet (Stage-C): same-day LONG votes at Sep-8 SHORT sites are the named target; R1 observation and F5 handling ride as inputs. Nothing is pre-authorized after this run.
3. Confirm nothing builds/runs/commits; RECON17 frozen; CB25D2D2 uncommitted (no token sought).

## 7. Files

- Archive: `06_HANDOFFS\RECON29-SIDE1P_JOURNAL.log` (38025 / 7425579 B / FBF3D544… / [114030..152054]).
- Extract: `06_HANDOFFS\RECON29_SIDE1P.txt` (9 lines / A3EC2689…).
- Scripts: `00_CURRENT_WORKING\launch_recon29_run.ps1`, `compile_side1p2_ea.ps1`, `compile_side1p2_flow.ps1`.
- Logs: `06_HANDOFFS\T162_SIDE1P2_EACOMPILE.log` (0/0), `T162_SIDE1P2_FLOWCOMPILE.log` (0/0).
- Markers: `00_CURRENT_WORKING\RECON29-SIDE1P_STATUS.txt` (PASSED gates) + `RECON29-SIDE1P_DONE.txt` (PASSED 15:31:13).

(End — RECON29 graded PASS-with-PARTIAL-REFUTATION; v56 relay carries asks 1–3)
