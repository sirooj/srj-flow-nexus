# ADDENDUM 3 — pre-probe adherence re-verification on the CURRENT digest (read-only, no build)

**Tree checked:** EA `D0DD07AA0379A7046E7B7AB03325DB9A99B33D89408E7C80B970FC4D09F3BC18` (568323 B, 10698 lines, SHA256+length verified this session pre-write). FlowLogic `3606BFB4…25911` (67515 B) unchanged. Parent audits: readiness (`703c3b0a`) + ADD1 (`51DF542D`) + ADD2 (`590BE614`). Method: literal grep + line reads, 2026-09-16. Satisfies `AGENTS.md` §10 item 6 for the `D-BIRTH-PROBE-001` word (Luna `V82-PROBE-001` + his run permission, print-only, no tokens).

## Measured on the current digest

- **R gate (adherence):** `input double InpMinRewardRisk = 1.0;` (EA:57). HOLDS.
- **Adoption OFF (violation):** `input bool InpAdoptExt1 = false;` (EA:71). Present.
- **Alert-only (adherence):** `OrderSend\(` = 0; bare `OrderSend` = 1 (print-string literal EA:3993, two-pattern proven). HOLDS.
- **Side owner (violation):** `g_dir = S2ResolveLive(...)` (EA:7541); resolver EA:3847 pass-through (detector-owned). Present — HTF-bias-only unread at the site.
- **Stop branch (violation):** `if((int)MathRound(obValid) == 1)` (EA:5553) → 1SWING else 2SWING; imbalance never consulted. Present.
- **Setup independence (adherence):** REGIME enum + RETAINED semantics intact (per ADD2 pattern, lines shifted −14 by the C0 build; behavior untouched since). HOLDS in kind.
- **Divergence latch (adherence):** `UpdateDivergenceLatch` machinery intact (behavior untouched since). HOLDS in kind.
- **Filed authoritative (consequence):** code emits its own side+stops; filed loses every disagreement by construction. Present.

## Conclusion for the run word

4 adherences + 4 violations reproduce exactly: the tree still CANNOT take his trades by construction, and `D-BIRTH-PROBE-001` does not ask it to — bare loser-exposure print inside `DetectPoiRetest` (no second scan, no state/anchor/dir/latch/order/stop/eligibility writes, N1 untouched), graded on null-effect parity vs C0 plus the pre-registered A/B/N reading. Gate SATISFIED for the probe only; any behavior delta fails the probe by design (REPORT+HALT, no mechanism inference).
