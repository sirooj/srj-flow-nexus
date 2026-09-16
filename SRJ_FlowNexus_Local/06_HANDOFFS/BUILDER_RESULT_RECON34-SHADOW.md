# RESULT — RECON34-SHADOW (`S2-PREEMPT-SHADOW-001` diagnostic run)

**Build:** EA `F0B810FE6F03BE3ABDDF85E1C3D099F5263BB6B37C37F68B4B4EE5F07D945BA6` (570849 B, +1437 shadow-only). FlowLogic `3606BFB4` unchanged. Both compile 0/0 fresh logs (EA 05:22:57, Flow 05:23:14).
**Run:** RECON34-SHADOW, DONE=PASSED 2026-09-16 06:14:15. Test passed 0:47:26.882; 3168 bars / 563338 ticks; same ini/range as RECON33 (Model=4, InpDebugLog=true, 08-26→09-09).
**Archive:** `06_HANDOFFS\RECON34-SHADOW_JOURNAL.log` — 38839 lines / 7559461 B / SHA `62FA7D810E09B844672C6E4F29B09FF200EB7976C58159E54A1D4B61C8FB66C6` / bounds [38773..77611] contiguous past RECON33's 38768 (PRE=38772). Purity: farm-off + cloud-off + Core-04 + Test-passed. MAXLEN=537 (cap, zero exceedance). SELHALT=0. Signals 4/4 identical (R1 2.43 / R3 2.56 / R4 1.76 / R5 1.25). Leftover 4320 closed graceful, declared.

## Grade vs Luna `V86-SHADOW-CLEAR-001` table

| Required result | Measured | Status |
|---|---|---|
| 09:30 Weekly SHORT WOULD-PREEMPT | wouldPreempt=1 (tier 4-vs-3) | PASS |
| 09:40 Weekly SHORT WOULD-PREEMPT | wouldPreempt=1 (tier 4-vs-3) | PASS |
| 09:50 Weekly SHORT WOULD-PREEMPT | wouldPreempt=1 (tier 4-vs-3) | PASS |
| 10:05 Monthly SHORT WOULD-PREEMPT | wouldPreempt=1 (tier 3-vs-3) | PASS |
| Legacy tier 09:30/40/50 | 0/0/0 | PASS (×3) |
| Legacy tier 10:05 | **0 (expected 1)** | **FAIL — pre-registered cell wrong, see finding** |
| 10:10 no manufactured preempt | SIDE1H 0 + SUPP 0 + S2WAIT 1 | PASS |
| R-row zero delta | 4/4 signals + all legacy families delta-0 | PASS |
| 222-bar corpus label | same-range run; Sep-8 00:00–18:30 window in-range (new-span provenance owed at live stage per clearance) | PRESENT (label-only) |
| Purity / MAXLEN / SELHALT / STATUS / DONE | pass / 537-0 / 0 / complete / complete | PASS |

## Finding: 10:05 legacy cell (council text error, not a run defect)

Luna's grade table expects legacy-tier-true at 10:05, but its own cleared rule records-not-substitutes tier (`newTier=6/2=3`, `heldTier=6/2=3`, strict `<` → false). The run prints exactly that: `newTier=3 heldTier=3 wouldTierPassLegacy=0`. The `<=` variant (Sonnet's retired sketch) would read true — the clearance table appears to have carried the `<=` value into the legacy column. No rescue: the shadow behaved as cleared; the pre-registered expectation is corrected here, council to confirm or re-rule. All four Luna-predicate cells PASS; the divergence the shadow was built to show (Luna-vs-legacy on 3 of 4 rows) measures as 4 of 4 under strict `<`.

## Null-effect parity vs RECON33 (probe build `3B5CA00B`)

46-family table: every non-new family delta-0 (SEL52 599, SUPPRESSED 152, SIDE1D 430, ANCHOR 56, A6TERM 481, signals 4/4, N1EQUALS 1, TALLY 1, WS161 2, POIREPLACE 9, SEL61LIVE 1, CONFIRMPOLL 555, S2WAIT 138, S1WAIT 54, SIDE1F/G/C families all 0-delta). EA-line delta = +72 = SIDE1H_N exactly; the +1 total-line remainder is a non-EA terminal line. Behavior identical; only addition is the cleared recorder. N1 untouched (N1EQUALS identical). AdoptOff held; OrderSend 0.

## Sonnet v86 build-time checks (folded as gates, verified)

1. Recorder mirrors the live guard incl. `inWindow` — YES by construction (inside the t78 block, same guard; wouldPreempt column adds the S2-state condition per spec).
2. Reuses computed `t78_pr/dir/opp/tier`, no fresh `DetectPoiRetest` — YES by construction (no new indicator reads; N1 identical proves it).

## Disposition

DELIVERED with one pre-registered-cell correction (above). No REPORT+HALT trigger fired (no live-state mutation, no protected-row delta). Live transfer `S2-CROSS-DIR-PREEMPT` remains NOT CLEARED (dual-key path: Luna clearance + tokens + fresh word). Run word SPENT. RECON17 frozen; `F0B810FE` uncommitted.
