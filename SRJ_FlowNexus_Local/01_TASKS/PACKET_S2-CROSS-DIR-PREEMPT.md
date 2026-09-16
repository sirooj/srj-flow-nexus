# PACKET `S2-CROSS-DIR-PREEMPT` — live transfer, TRANSCRIBED-unbuilt (records-only)

**Source:** Luna `V87-LIVE-PREEMPT-001` §§3–9, transcribed verbatim below (mechanical pull, zero builder authorship). Status: LUNA-CLEARED-BY-NAME 2026-09-16; Sonnet v87 review-only (2 flags carried: new-span stays owed; reuse-not-copy Region-P). Authority for build+run: Luna clearance + his selection token + fresh run word (his "permission granted, proceed" this turn, read as both). No commit token. Tree base: EA `F0B810FE…`/570849.

## §3 Exact predicate (Luna verbatim)

A detected opposite-direction candidate may preempt the held candidate ONLY when the live machine is in S2 LTF-alignment:

```text
g_state == ST_S2_LTF_ALIGN
&& DetectPoiRetest(barShift, t78_pr)
&& t78_pr.found
&& (t78_pr direction != g_dir)
```

Equivalently, using the existing t78 variables:

```text
g_state == ST_S2_LTF_ALIGN
&& t78_opp
```

The tier comparison is deliberately absent from the preemption predicate. It remains diagnostic information:

```text
newTier  = g_authorityRank[t78_pr.topLine] / 2
heldTier = g_authorityRank[g_anchorLine]   / 2
legacyTierPass = (newTier < heldTier)
```

There is no `<=` substitution.

## §4 Exact live site (Luna verbatim)

The implementation site is the existing t78 occupied-state path, Region R, EA 7366–7389. The current code already establishes `DetectPoiRetest(...) → candidate found → derive t78_dir → derive t78_opp → derive t78_tier`. The cleared live modification adds the state-bounded preemption consequence at this site. NOT changed: `DetectPoiRetest()`; seed detector at Region O; `IsConfirmationCandle()`; authority-rank table; session/window rules; confirmation predicate; same-bar election logic.

## §5 Required transfer consequence (Luna verbatim)

Real ownership transfer, not a log. When the predicate fires, the newly detected opposite candidate becomes the primary live candidate — Region-P-equivalent re-homing:

```text
g_anchorLine       = new candidate
g_anchorPrice      = new candidate price
g_anchorBarTime    = current bar
g_dir              = new candidate direction
g_zoneHi           = 0
g_zoneLo           = 0
g_touchSeen        = false
g_touchBarHi       = 0
g_touchBarLo       = 0
g_latchedEntry     = 0
g_latchedSl        = 0
g_latchedTp        = 0
g_latchedR         = 0
g_latchBarTime     = 0
g_confirmFromState = ST_IDLE
```

Precise code expression may reuse existing helpers where available; semantic consequence fixed: release the S2-held candidate's ownership, make the detected opposite candidate the new primary. The machine must NOT return to ST_IDLE merely to obtain the new candidate.

## §6 Hold semantics (Luna verbatim)

Held primary + observed opposite → predicate → old ownership released → new candidate primary. Exactly one live primary after the transition. No queue, stack, or deferred alternative.

## §7 Seven-row predictions (Luna verbatim, fixed)

S1 (Sep-8 09:15 LONG): LONG seeds, superseded to Monthly-POC; first qualifying observed opposite SHORT during S2 must preempt it; LONG must not remain primary through session closure. S2 (Sep-8 16:30 SHORT): birth + R-gate unchanged. R1 (Aug-28 09:55→10:05 SHORT): no S2 cross-direction condition; unchanged. R3 (Sep-4 15:55→16:00 LONG): same-direction/S4 history; unchanged. R4 (Sep-7 09:15→09:20 LONG): unchanged. R5 (Sep-7 16:40→16:45 LONG): no qualifying S2 opposite; unchanged. R2 MUST-DECLINE: remains declined; no manufacture. Hard invariant: no `DetectPoiRetest` candidate at 10:10 → no preemption.

## §8 Threshold (Luna verbatim, structural-exact)

`ST_S2_LTF_ALIGN` + actual `DetectPoiRetest` candidate + opposite direction. No elapsed-time/candle/price/rank tolerance; no `<=`; no seed-bar substitution; no session truncation.

## §9 Proving requirement (Luna verbatim)

Live-transfer proof must include a NEW Dukascopy source/span (Sep-8 00:00–18:30 window; RECON34 same-range accepted as corpus label only). This build's same-range run establishes the §10 state-machine consequence first; new-span proving stays owed. Must establish: S1 held-LONG → observed SHORT → live preemption → SHORT primary; S2 preserved; R1/R3/R4/R5 zero delta; R2 declined; 10:10 no manufacture; STATUS/DONE/purity/MAXLEN/SELHALT intact; any violation = REPORT+HALT.

## Builder derivations (packet-forced, recorded pre-run)

D1: transfer reuses the computed `t78_pr/t78_dir/t78_opp` (no fresh scan, N1 untouched) — else parity breaks.
D2: transfer fires only under the live guard incl. `inWindow` + `g_state == ST_S2_LTF_ALIGN` — else scope widens beyond clearance.
D3: Region-P reuse-vs-mirror decided by code read this turn (recorded in the build record): if Region P exposes a callable re-home, call it; else mirror its field list inline and declare the mirror.
