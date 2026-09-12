# BUILD PACKET P-SLDEF-2

Four edits. Print-only. **No selection may change. No reference definition may change. No verdict may move; MTEXIT stays 4.** Expected result: RECON12c reproduces on every existing join, plus three new line classes.

Issued on council verdict session 2026-09-12: RECON12c-NEWS ACCEPTED (gates 1-8; new frozen baseline EA EDAA089A, FlowLogic 3606BFB4). RECON11b superseded (imbalance record retained; fractal census superseded by ladder work to come).

## E23 — `SLADDER`, the rung census

At `site=S5` only. Companion lines keyed `bar|site|rung`, one line per rung, own `fields=` token, own `LINEWIDTH` class.

1. Enumerate protective-side swing slots outward from the **entry bar**, anchor-free, rungs `0 … 7`. Anchor-free is deliberate: anchors are marked, not assumed, so one ladder serves every candidate anchor.
2. Per rung: `rung`, `rungSlot`, `rungExt`, `shift`, `barTime`, `px`, `wick`, `body`, `imbCode`, `exceedsPrev ∈ {W,B,N}`, `distPts`, `rungR`, `isOBSwing`, `isFracAnchor`, `isTodayRef`.
3. **Two indices, both printed, neither derived from the other.** `rungSlot` is the raw consecutive slot count outward. `rungExt` is the index among rungs that are strictly more extreme than every rung inside them, `-1` otherwise. "Two swings away" is ambiguous between these and the packet does not pre-decide it.
4. Extremity and imbalance are **reported per rung, never applied.** No filter, no walk, no termination. `imbCode 3` is printed as 3 and does not stop the enumeration; it stops nothing because nothing is being decided.
5. `body` through `ApexShift`, unchanged frame. `rungR` uses the row's live `entry` and `tp` and states the direction convention in the line's comment block.
6. `isOBSwing` from buffer 39 by bar time. `isFracAnchor` = the post-guard fractal anchor. `isTodayRef` = the rung whose `px` equals the returned `slRef`.

## E24 — operator-level resolution

`SLADDER_MATCH`, one line per S5 row: for each of the operator's recorded levels on that signal (Sep-7 1.16240, Sep-4 1.15907, plus any he files before the run), print the matched `rung`, `rungSlot`, `rungExt`, `barTime` and the residual in points, or `NOMATCH` with the nearest rung and its residual. **Do not adjust a level or a price to produce a match.** `NOMATCH` is a finding, not a failure.

## E25 — `MTLIFE`, managed-record lifetimes

One line per managed record, four expected: `openBar`, `entry`, `sl`, `tp`, `verdict`, `closeBar`, `closePx`, and `openAtNewsStart` / `openAtDayClose` / `openAtWeekClose` as read-only booleans against the same `SrjInNewsBlackout` body and the same quoted boundaries. This resolves the Sep-4 flat divergence with operands and re-bases the flat populations honestly.

## E26 — audit ordering fix

Move the `LINEWIDTH` / collision-audit finalize ahead of the emission loop so `BLACKOUT_ROW` and `BLACKOUT_CENSUS` are measured pre-write like every other class. One-line move. Audit lines stay non-self-matching per the standing ruling.

## Gates

Full window, pilot ini unchanged, 3168 / 563338.

1. Both compile clean under `#property strict`. FlowLogic digest `3606BFB4…` **unchanged** — a change halts.
2. All RECON12c identities verbatim: CQD 906; `WS161` **21**/205/0; SLMEMO 471/118/589; SL_REF 432/39/10; INPLAYCOMMIT 157/46; MTEXIT **4** (3 `TP_TOUCH` + 1 `HTF_FLIP`); aborts 18/37/13/11/2/0/12; PROMO 469 scoped; CONFIRMPOLL 555; SUPPRESSED 156; N1 28/26/0/3 with pairing; guard 60; `sideViolations` 0 / `sideFracViolations` 0. Four-signal set verbatim.
3. **Instrument inert, fourth build:** `SLIMB` 481/481, `SLIMBWALK` 481/481, `SLIMBWALKF` 481/481, `SLIMBR` 10/10 on the `bar|site` join, deltas and classes included. A miss halts.
4. Blackout census reproduces RECON12c: rows 11, `rowsInWindow` 1, `memberBars` 3, `mismatch` 0, `overlaps` 0, per-row `offsetMinutes` including 360 on Oct-28.
5. `SLADDER`: 10 rows populated, rung count per row reported. `rungExt` monotone by construction — any non-monotone `rungExt` sequence halts. Every rung carries a distinct `barTime`.
6. **`isTodayRef` = 1 on exactly one rung per row, or the row is reported as `TODAY_OFF_LADDER` with the residual to the nearest rung.** Off-ladder is not absorbed and is not a halt — it is the finding that today's OB-derived reference is not a fractal swing, and it must be named as that.
7. `SLADDER_MATCH`: Sep-7 1.16240 and Sep-4 1.15907 each resolved to a rung with residual, or `NOMATCH` with the nearest rung named. Report `rungSlot` and `rungExt` for each.
8. **Named falsifier: the Sep-7 16:45 row must show 1.16112 as a rung with its two indices and its `imbCode`.** The ghost claim is testable only if the level is on the ladder; if it is absent, the walk reached a price that the anchor-free enumeration does not contain, and that halts with operands.
9. `MTLIFE` 4 rows, all three boundary booleans present, Sep-4 record's verdict and close bar quoted against 23:55 broker.
10. `LINEWIDTH truncated = 0` on all classes including `BLACKOUT_ROW` and `BLACKOUT_CENSUS`, now measured pre-write. Data `BADFMT = 0`, audit lines excluded by construction.
11. Sampled-day spot check: `INPLAYCOMMIT` 157, `XOBPROMO` 157, `SWEPTMASK` 443 identical to RECON12c.
12. New EA SHA256 + byte size, FlowLogic digest re-stated unchanged, archive validated by the purity triple. No commit until 2 through 11 pass.

Halt rather than substitute on gate 3, gate 5 and gate 8.

---

# Council rulings recorded with this packet (verdict session 2026-09-12)

- RECON12c ACCEPTED; new frozen baseline (EA EDAA089A 328520 B; journal
  E73A5E8C 17155 lines, manual archive after wrapper stall). Local commit
  cleared. Gate 3 across three builds = custody mechanism proven.
- G6 note accepted with terms: 236/294 are computed, not pre-write —
  label arithmetic as arithmetic. Move lands in P-SLDEF-2 (E26).
- Archive acceptance = content purity triple (1 pass / 4 signals /
  481 SLIMB), not DONE markers. Stall logged beside digest.
- Artifact taxonomy third entry: sticky-flag (flag-defined populations
  over-count; state-defined counts required).
- DST hazard demonstrated: Oct-28 360 (shoulder week); store-ET /
  convert-at-read validated. Wording: in-window unexercised,
  forward-row exercised arithmetically. Sep/Dec 21:00 = operator's own
  anchor from the table (two directions, one artifact).
- Entry side cannot validate in-window → probe requirement for both
  future sides (temporary row/boundary, own digest, reported, reverted
  in-session, never committed; canonical gates stay zero).
- Sep-4 flat = divergence investigated via MTLIFE, not obeyed; flats not
  re-frozen against MTEXIT 4 until lifetimes land.
- "Exactly two swings away" NOT packetized: blast radius (441 1-swing
  invocations), retraction chain (a)(b)(c), granularity mismatch
  (finer code set vs coarser hand set), three label pairs. Next artifact
  = swing ladder marked up by operator, not a definition.
- Decisive gate pre-stated: both his levels (Sep-7 1.16240, Sep-4
  1.15907) must be findable as rungs.
- NEWS sequencing: exit side then entry side after imbalance decision;
  flats pending MTLIFE; both sides carry probe requirement. Table pinned
  5FFF5C76; Oct-28 = standing regression test.

---

STATUS: ISSUED (P-SLDEF-2: E23 ladder census, E24 level resolution, E25 lifetimes, E26 audit-order fix; print-only; MTEXIT stays 4).
Filed by builder to `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-SLDEF-2.md`.
