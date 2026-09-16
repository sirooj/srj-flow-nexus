# ADDENDUM 4 — pre-shadow adherence re-verification on the CURRENT digest (read-only, no build)

**Tree checked:** EA `3B5CA00BE690EA46E140D99DA442BAFA79FFA102E5418D3E7A1C1BD201522EB2` (569412 B, 10713 lines, SHA256+length verified this session pre-write). FlowLogic `3606BFB4…25911` (67515 B) unchanged. Parent audits: readiness (`703c3b0a`) + ADD1 (`51DF542D`) + ADD2 (`590BE614`) + ADD3 (`D0DD07AA`). Method: literal grep + line reads, 2026-09-16. Satisfies `AGENTS.md` §10 item 6 for the `S2-PREEMPT-SHADOW-001` word (Luna `V86-SHADOW-CLEAR-001` + his run permission, print-only, no tokens).

## Measured on the current digest

- **R gate (adherence):** `input double InpMinRewardRisk = 1.0;` (EA:57). HOLDS.
- **Adoption OFF (violation):** `input bool InpAdoptExt1 = false;` (EA:71). Present.
- **Alert-only (adherence):** `OrderSend\(` = 0; bare `OrderSend` = 1 (print-string literal, two-pattern proven). HOLDS.
- **Side owner (violation):** `g_dir = S2ResolveLive(...)` (EA:7556); resolver EA:3862 pass-through (detector-owned). Present — HTF-bias-only unread at the site.
- **Stop branch (violation):** `obValid) == 1` (EA:5568) → 1SWING else 2SWING; imbalance never consulted. Present.
- **Setup independence (adherence):** REGIME enum + RETAINED semantics intact (behavior untouched since ADD3; line shift +15 below the SIDE1D insert only). HOLDS in kind.
- **Divergence latch (adherence):** `UpdateDivergenceLatch` machinery intact (behavior untouched since ADD3). HOLDS in kind.
- **Filed authoritative (consequence):** code emits its own side+stops; filed loses every disagreement by construction. Present.
- **Probe print present:** `SIDE1D_BOTHDIRS` = 1 site (EA:1944-1958, the graded RECON33 probe; null-effect proven, behavior identical to C0).

## Conclusion for the run word

4 adherences + 4 violations reproduce exactly: the tree still CANNOT take his trades by construction, and `S2-PREEMPT-SHADOW-001` does not ask it to — WOULD-PREEMPT recorder at the t78 site reusing computed values (no fresh scan, no state/anchor/dir/latch/order/stop/eligibility writes, N1 untouched), graded on null-effect parity vs RECON33 plus the pre-registered grade table. Gate SATISFIED for the shadow only; any behavior delta fails the shadow by design (REPORT+HALT, no mechanism inference).
