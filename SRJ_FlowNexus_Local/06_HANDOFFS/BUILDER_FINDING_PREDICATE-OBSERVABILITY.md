# FINDING — P-predicate observability CLOSED (read-only, 2026-09-16)

Luna's `V103-PROBE-MERITS-01` gap (predicate observability, not probe purity) closes term-by-term on the current tree `7BFC7FA3` (FlowLogic `3606BFB4` frozen):

1. HTF-bias-only → EXISTS: `ClassifyRegime` (EA:2140-2168) reads buffers 19/20/21 (high/mid/low) + 2-of-3 `trendOk`. DESIGN POINT (builder, pre-declared): its two function-static census counters are unrestorable externally, so the probe INLINE-DUPLICATES the 10-line idiom verbatim (same inputs, same rule; pure reads; zero new semantics) instead of calling it.
2. most-recent-sweep-only → EXISTS: buffer 18 carries the most-recent UNEXPIRED sweep bar-by-bar (FlowLogic 1138-1150: `freshSweepTag` unless `freshSweepExpired`, else 0); EA idiom = tag + direction-match (EA:2152-2164). Recency is buffer-carry construction with indicator-side expiry — no separate walk needed.
3. valid SHORT conditions → COMPOUND, all checkable: `CheckLtfAlign` (CLOSED) + `IsConfirmationCandle` (EA:2096-2137: OHLC reads + POI-line read + fail ladder NO_ANCHOR/DATA/LINE, A_OPP, A2_CLOSE_BREAK, B_BODY, C_TOUCH) + trendOk/mrOk (terms 1–2). N1 SAFETY: the confirm helper writes 8 `g_n1_*` globals → probe saves/restores like-for-like (SIDE1F precedent; globals are accessible, unlike ClassifyRegime statics).
4. Seed-identity → EXISTS: `s1g_seedBiasAl`-pattern twin `s1g_legDir` (EA:1039 decl, seed-assigned). Probe uses the CARRIED seed dir, never `g_dir`-at-S5 (Luna's identity hazard, adopted as build law).

Nothing above is approximated or newly computed; every term reuses a settled input/idiom with the two stated handlings (inline-duplicate; N1 save/restore). Sonnet's "predicate not in code" point is thereby answered as: the predicate is newly COMPOSED, from exclusively pre-existing checkable terms — which is what print-only probing is for.
