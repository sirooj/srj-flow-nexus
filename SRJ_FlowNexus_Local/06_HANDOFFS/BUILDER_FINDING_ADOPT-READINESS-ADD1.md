# ADDENDUM 1 — pre-run adherence re-verification on the CURRENT digest (read-only, no build)

**Tree checked:** EA `51DF542D…7A4927` (521720 B, SHA256 verified this session; digest matches the post-V37 handoff §5). Parent audit: `06_HANDOFFS\BUILDER_FINDING_ADOPT-READINESS.md` (audited `703c3b0a`; delta to current = O1 recorders only, parity-bound per RECON25 isolation read). Method: literal grep + line reads on the current file, 2026-09-14. Satisfies `AGENTS.md` §10 item 6 for the RECON26-A6REC run word.

## Measured on the current digest

- **R gate (adherence):** `input double InpMinRewardRisk = 1.0;` (EA:57). HOLDS.
- **Adoption OFF (violation):** `input bool InpAdoptExt1 = false;` (EA:71). Present — sidecar era still the running reality.
- **Alert-only (adherence):** `OrderSend(` source count = 0 (second differently-formed pattern per the zero-count rule: `OrderSend\s*\(` + `OrderSend` — both zero). HOLDS.
- **Side owner (violation):** `g_dir = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);` (EA:6793); resolver at EA:3839. Present — HTF bias still unread at the assignment site; LONG-carry through both Sep-8 SHORT bars stands unexplained by anything except this line.
- **Stop branch (violation):** `if((int)MathRound(obValid) == 1)` (EA:4820) → 1SWING prints (EA:4830/4847/4939/5014) else 2SWING (EA:5108+/5169+); imbalance never consulted in the branch. Present — R5 tie-break and R4 walk-away stand.
- **Setup independence (adherence):** `REGIME_BOTH / REGIME_TREND / REGIME_MEANREV / REGIME_NONE` classification intact (EA:2144-2147). HOLDS in kind.
- **Divergence latch (adherence):** `g_divLatch` + `UpdateDivergenceLatch` machinery present (EA:962/6492). HOLDS in kind (charter CQD-source mapping residual unchanged).

## Conclusion for the run word

4 adherences + 4 violations reproduce exactly on the current digest: the tree still CANNOT take his trades by construction (side owner + stop branch + adoption OFF), and RECON26 does not ask it to — print-only recorders beside the untouched selection path, graded on presence/format/isolation only. No run hour is spent re-proving a filed mismatch; the hour buys the FIRST implementation evidence (terminal `SELECTED` record, fired/refused/`TRIGGER_UNRESOLVED` rows, windowed `EMPTY`), which no prior run emitted.
