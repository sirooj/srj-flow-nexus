# ADDENDUM 2 — pre-C0 adherence re-verification on the CURRENT digest (read-only, no build)

**Tree checked:** EA `590BE6140D6FF616BCDF2465B00B86DBBE19A8FCACB277C81041291ABB94E095` (567138 B, 10679 lines, SHA256+length verified this session pre-write). FlowLogic `3606BFB4…25911` (67515 B) unchanged. Parent audits: `06_HANDOFFS\BUILDER_FINDING_ADOPT-READINESS.md` (audited `703c3b0a`) + `-ADD1.md` (audited `51DF542D`). Method: literal grep + line reads on the current file, 2026-09-16. Satisfies `AGENTS.md` §10 item 6 for the C0-PROBE build+run word (Luna `C0-PROBE-001` + his "i authorize the run").

## Measured on the current digest

- **R gate (adherence):** `input double InpMinRewardRisk = 1.0;` (EA:57). HOLDS.
- **Adoption OFF (violation):** `input bool InpAdoptExt1 = false;` (EA:71); only consumers EA:6012/6104/8559 gated on it. Present — sidecar era still the running reality.
- **Alert-only (adherence):** `OrderSend\(` source count = 0; second pattern `OrderSend` = 1 at EA:3993, a print-string literal (`"[SRJ-EA] SEL61INDEP adopt=0 ordersend=0/0 ..."`), not a call. HOLDS.
- **Side owner (violation):** code's seed-path side assignment `g_dir = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);` (EA:7555); resolver at EA:3847 currently a live 4H/1H vote (agree→vote else legacy). Present — HTF-bias-only still unread at the assignment site; C0 reverts this function to pass-through (detector-owned again), which does NOT cure the violation, only the cascade question.
- **Stop branch (violation):** `if((int)MathRound(obValid) == 1)` (EA:5567) → 1SWING else 2SWING; imbalance never consulted in the branch. Present — same idiom as the parent audit's EA:4695, relocated by later inserts.
- **Setup independence (adherence):** `REGIME_NONE/TREND/MEANREV/BOTH` enum intact (EA:216); unclassified/unaligned candidates RETAINED at EA:7683/7696, never killed on a missing counterpart. HOLDS in kind.
- **Divergence latch (adherence):** `UpdateDivergenceLatch` def EA:6149, consumer EA:7250, `g_divLatch` 13 sites. HOLDS in kind (charter CQD-source mapping residual unchanged).
- **Filed authoritative (consequence):** code emits its own side+stops (above), so filed levels lose every disagreement by construction. Present.

## Conclusion for the run word

4 adherences + 4 violations reproduce exactly on the current digest: the tree still CANNOT take his trades by construction (side owner + stop branch + adoption OFF), and C0-PROBE does not ask it to — null-effect probe (suppression deleted, resolver pass-through, additive prints only), graded on seeds/fires/tally/isolation parity vs RECON32 plus the two pre-registered CHAINN branches. No run hour is spent re-proving a filed mismatch; the hour buys the two WHY-NOT-LAST-TIME firsts (cascade-vs-dir CHAINN fork + both-dirs failTerm table), which no prior run emitted. Gate SATISFIED for C0-PROBE only; any behavior delta fails the probe by design (REPORT+HALT, no C1 inference).
