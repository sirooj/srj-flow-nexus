# ADDENDUM 6 — pre-combined adherence re-verification on the CURRENT digest (read-only, no build)

**Tree checked:** EA `7F01804EC5EFD89B25B115D778E2245103F688E765A31DE4CCD724E4F374A206` (576968 B, 10836 lines, SHA256+length verified this turn pre-write = the graded RECON36 stop-shadow build). FlowLogic `3606BFB4…25911` (67515 B) unchanged. Parent audits: readiness (`703c3b0a`) + ADD1 (`51DF542D`) + ADD2 (`590BE614`) + ADD3 (`D0DD07AA`) + ADD4 (`3B5CA00B`) + ADD5 (`FAF8442B`). Method: literal grep, 2026-09-16. Satisfies `AGENTS.md` §10 item 6 for the `V94-COMBINED-PRINT-CLEAR-001` word (Luna CLEAR-by-name print-only F1+F2+F0 + fresh run word; no tokens).

## Measured on the current digest

- **R gate (adherence):** `input double InpMinRewardRisk = 1.0;` (1 site). HOLDS.
- **Adoption OFF (violation):** `input bool InpAdoptExt1 = false;` (1 site). Present.
- **Alert-only (adherence):** `OrderSend\(` = 0; bare `OrderSend` = 1 (print-string literal). HOLDS.
- **Side owner (violation):** `g_dir` writers = 4 (3 baseline: init/6160-reset/7529-seed + 1 cleared live transfer). Present.
- **Stop branch (violation):** `obValid) == 1` 1SWING/2SWING selector; imbalance never consulted. Present.
- **Setup independence / divergence latch (adherence):** intact, behavior untouched since ADD5. HOLD in kind.
- **Filed authoritative (consequence):** code emits own side+stops. Present.
- **Graded probes present (record-only):** SIDE1D (RECON33) + SIDE1H (RECON34) + SIDE1C_PREEMPT (live transfer, 13 prints on RECON35) + SIDE1E (RECON36); all null-effect proven.

## Conclusion for the run word

4 adherences + 4 violations reproduce exactly. Gate SATISFIED for the combined print-only build+run; any behavior delta fails the run by design (REPORT+HALT).
