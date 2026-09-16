# ADDENDUM 5 — pre-live adherence re-verification on the CURRENT digest (read-only, no build)

**Tree checked:** EA `F0B810FE6F03BE3ABDDF85E1C3D099F5263BB6B37C37F68B4B4EE5F07D945BA6` (570849 B, 10734 lines, SHA256+length verified this turn pre-write = the graded RECON34 build). FlowLogic `3606BFB4…25911` (67515 B) unchanged. Parent audits: readiness (`703c3b0a`) + ADD1 (`51DF542D`) + ADD2 (`590BE614`) + ADD3 (`D0DD07AA`) + ADD4 (`3B5CA00B`). Method: literal grep + line reads, 2026-09-16. Satisfies `AGENTS.md` §10 item 6 for the `S2-CROSS-DIR-PREEMPT` live word (Luna `V87-LIVE-PREEMPT-001` CLEAR-by-name + his selection token + fresh run word, both read from his "permission granted, proceed").

## Measured on the current digest

- **R gate (adherence):** `input double InpMinRewardRisk = 1.0;` (EA:57). HOLDS.
- **Adoption OFF (violation):** `input bool InpAdoptExt1 = false;` (EA:71). Present.
- **Alert-only (adherence):** `OrderSend\(` = 0; bare `OrderSend` = 1 (print-string literal, two-pattern proven). HOLDS.
- **Side owner (violation):** `g_dir = S2ResolveLive(...)` (EA:7556 pre-shadow numbering); resolver pass-through (detector-owned). Present — HTF-bias-only unread at the site.
- **Stop branch (violation):** `obValid) == 1` (1SWING else 2SWING; imbalance never consulted). Present.
- **Setup independence (adherence):** REGIME enum + RETAINED semantics intact. HOLDS in kind.
- **Divergence latch (adherence):** `UpdateDivergenceLatch` machinery intact. HOLDS in kind.
- **Filed authoritative (consequence):** code emits its own side+stops; filed loses every disagreement by construction. Present.
- **Graded probes present:** `SIDE1D_BOTHDIRS` = 1 site (RECON33 probe, null-effect proven) + `SIDE1H_` = 1 site (RECON34 recorder, null-effect proven). Both record-only.

## Conclusion for the live word

4 adherences + 4 violations reproduce exactly: the tree still CANNOT take his trades by construction — that is what the cleared live transfer is built to change at exactly one site (t78, S2-bounded, opp-only). Gate SATISFIED for the live build+run; any protected-row delta outside the pre-registered S1 consequence fails the run by design (REPORT+HALT, no mechanism inference).
