# BUILDER RESULT — RECON28-GEOM (`GEOM-LIVE-CONDITIONAL-3C-001` print-only run)

**Verdict: DELIVERED as evidence, graded FAIL on substance (0/4 exact) → returns to AUTHORSHIP per F6, never tuning. No halt fired; isolation clean. Council ruling owed (v48 relay): accept record + author the next step. NOTHING builds/runs/commits.**

## 1. Run facts

- DONE=PASSED 2026-09-15 12:11:05. Test passed in 0:47:01.638 (< 90, no timeout). 3168 bars / 563338 ticks (same footprint as RECON20b–27).
- Archive `06_HANDOFFS\RECON28-GEOM_JOURNAL.log`: 38019 lines / 7423632 B / SHA256 `A31461C502AF4055C4AE9E05487D5002E3C5830E614D63B44252C181D5EA0711` / bounds [76009..114027] (PRE=76009 contiguous past RECON27's 76008; 76009+38019−1=114027 exact).
- Purity: Core-04-only lines, Test-passed-1, single local agent. MAXLEN=537 (=cap, zero exceedance). SELHALT 0.
- Build: EA `8F677D3A…` (544061 B, GEOM block + 1 hook line only, adoption OFF), FlowLogic `3606BFB4` unchanged, both compile 0/0 with freshness-verified logs. Build uncommitted; RECON17 frozen.

## 2. Realized delta (close-the-loop vs the v47 promise)

- Promised FIRST live-leg conditional-walk print side-by-side with fractal across the 7-bar roster → DELIVERED (7 GEOMMATCH + 8 GEOMDECISION + GEOMCOUNT emitted=15 rows=7 sigs=1 decPrints=8; full text in `06_HANDOFFS\RECON28_GEOM.txt`, 16 lines).
- Promised 4/4-exact → FAILED on substance (see §3). The evidence is honest either way: the walk ran as cleared, the prediction did not survive it.
- Promised everything else frozen → DELIVERED (full isolation diff-0, §4).

## 3. Grades vs F1–F7/roster (full text in `06_HANDOFFS\RECON28_GEOM.txt`)

- **R1 — MISS.** `live=2026.08.28 08:45@1.16424/slotW=15/2AWAY/IMBALANCE_ABSENT` vs filed 06:30@1.16508. The 1-away block read imb=0 → 2-away walk landed 08:45.
- **R2 — VOID holds.** `verdict=DECLINED` (walk shown as observation only: 1AWAY/imb=1). R2 contributes neither pass nor fail.
- **R3 — OFF.** `live=2026.09.04 15:35@1.15847/slotW=4/2AWAY/IMBALANCE_ABSENT` vs filed 15:30@1.15847 — price exact, barTime +1 bar. legslot=408 corroboration present, s5=1.
- **R4 — OFF.** `live=2026.09.07 08:45@1.16098/slotW=6/2AWAY/IMBALANCE_ABSENT` vs filed 08:40@1.16098 — price exact, barTime +1 bar. legslot=7 + s5=1 corroboration present; R4 A6DECISION regression holds byte-identical (SELECTED 1.16098 slot=7).
- **R5 — OFF.** `live=2026.09.07 16:10@1.16238/slotW=6/2AWAY/IMBALANCE_ABSENT` vs filed 16:15@1.16239 — 1pt + 1 bar off (walk retains …38 family).
- **S1 — PRESENT.** Candidate found (mechanism alive). Note: live=2026.09.03 20:40@1.16379/1AWAY/imb=1 — the known stale Sep-3 extreme pins this row; presence-only per the packet, so PRESENT stands; frac=09:40@1.16258 (his first-swing bar at his second-swing price — recognition annotation only).
- **S2 — PRESENT.** Candidate found. live = same stale 1.16379; frac=16:20@1.16274 (his HAND probe bar — recognition annotation only).
- **F5 tally: 0/4 exact + 2/2 present + 0 spurious + void holds → FAIL.** F6 applies: FAIL returns to AUTHORSHIP, never tuning. Wick proxy never overrode (wick=NONE all 7 rows — no beyond-candidate wick observed, so the proxy is unexercised, not refuted).
- **D-items all met:** D1 (zero EA price literals re-verified post-run); D2 (leg-tag+barTime+price same-print, _Digits throughout, no 4-digit/normalize); D3 vacuously clean (no under-precision: MAXLEN 0, all prints well-formed → no REPORT+HALT trigger); D4 (rows=7/sigs=1/decPrints=8 reconcile); D5 (no UNKNOWN fallback occurred — every imb read resolved, so the literal is unexercised, not violated); D6 (GEOM families prefix-disjoint; isolation mechanically decidable).

## 4. Isolation (vs RECON27, same patterns both archives)

- SLIMB 481/481, SEL52CTX 600/600, SEL53 168/168, SLIMBR 16/16, A6SUPP 481/481, A6REFUSED 52/52, A6CQD 2/2, A6MATCH 2/2, A6DECISION 2/2, A6COUNT 1024/10/0/481 identical, SELHALT 0/0, OrderSend-journal 0/0, signals 4/4 byte-identical (2.43/2.56/1.76/1.25). Only deltas: +16 GEOM lines (7+8+1, pre-declared) incl. the +1 SIGNAL-substring hit = `VOID_SIGNAL` (declared signal print). No selection delta. No live-selection drift; adoption static OFF.

## 5. The finding (why the prediction failed — mechanism, not verdict)

- Two independent measurements on this run agree: (a) GEOM imb gate read ABSENT (0, resolved — never UNKNOWN) at all four fired 1-away blocks → 2-away everywhere; (b) legacy SLIMB nuance classes read `OB_VALID_LATEST_NOIMB` / `OB_DEAD_LATEST_NOIMB` with chosenFlag=0 on all four fired rows. **The packet's core gamble — that his filed blocks carry imbalance — is refuted on this evidence.** The conditional walk as cleared cannot reach filed stops because its gate condition is absent where it must be present.
- Signature for authorship: R3/R4/R5 land exactly +1 bar after formation with R3/R4 prices exact; R1 lands far (08:45/1.16424). R4's legacy 1SWING still selects filed exactly (regression held) — so the live leg *contains* filed stops, but the imbalance gate routes away from them. Whether the gate's shift attribution, the flag semantics, or the rule itself is at fault is COUNCIL AUTHORSHIP territory — the builder does not adjudicate (F6).

## 6. Asks (v48 relay)

1. Accept this record (run + FAIL grade + isolation + refutation with two-measurement corroboration).
2. Author the next step: revised geometry packet, re-scoped investigation, or next direction (Stage-C side-fix authorship was pre-ruled for PASS only — this FAIL does not trigger it). Nothing is pre-authorized after this run.
3. Confirm nothing builds/runs/commits; RECON17 frozen; 8F677D3A uncommitted (no token sought).

## 7. Files

- Archive: `06_HANDOFFS\RECON28-GEOM_JOURNAL.log` (38019 / 7423632 B / A31461C5… / [76009..114027]).
- Extract: `06_HANDOFFS\RECON28_GEOM.txt` (16 lines).
- Scripts: `00_CURRENT_WORKING\launch_recon28_run.ps1`, `compile_geom_ea.ps1`, `compile_geom_flow.ps1`.
- Logs: `06_HANDOFFS\T162_GEOM_EACOMPILE.log` (0/0), `T162_GEOM_FLOWCOMPILE.log` (0/0).
- Markers: `00_CURRENT_WORKING\RECON28-GEOM_STATUS.txt` (PASSED gates) + `RECON28-GEOM_DONE.txt` (PASSED 12:11:05).

(End — RECON28 graded FAIL-with-refutation; v48 relay carries asks 1–3)
