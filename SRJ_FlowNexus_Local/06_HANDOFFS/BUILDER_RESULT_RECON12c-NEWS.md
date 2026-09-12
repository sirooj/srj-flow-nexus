# BUILDER_RESULT_RECON12c-NEWS (P-NEWS-1, E20–E22)

STATUS: ACCEPTED (council verdict 2026-09-12). New frozen baseline:
EA EDAA089A… (328520 B), FlowLogic 3606BFB4…. RECON11b superseded
(imbalance record retained). Local commit cleared.

## Run record

- Window/ini: RECON1_P1.ini unchanged. 563338 ticks / 3168 bars.
- `Test passed in 1:06:41.075` 22:53:41 (operator observed; builder's
  probe was reading a stale 22:42 heartbeat — owned).
- Archive: MANUAL segment (wrapper stalled pre-DONE: heartbeats stopped
  22:42, no DONE file; wrapper process alive). Segment [138512..] of the
  day log via shared-read copy: 17155 lines, LEN 3181472,
  SHA256 E73A5E8C1E3F12D3A289C8B18B89D2D1809A03FBF6E17AC0A846832FB7986760.
  Purity proven: exactly 1 Test-passed, 4 signals, 481 SLIMB (the one
  stray pre-run "connection closed" line matches no gate pattern).
- Build: EA `EDAA089A7A7A98A3B9FAFCBAE0C76694CA253B92109CDAC252ECC4BEF3CBE7D1`
  (328520 B, 0/0); FlowLogic `3606BFB4…` UNCHANGED (0/0). Gate 1 PASS.
- Tabulation: `RECON12c-NEWS_TABULATION.txt`. Join: `RECON12c_GATE3_JOIN.txt`.
- Prior runs on disk as records: RECON12 (rowsInWindow=0 range defect),
  RECON12b (false gap-halt + sticky-flag flats). Defects owned below; the
  instrument (imbalance side) was inert and identical on all three.

## Gate verdicts

2. Identities verbatim — PASS (CQD 906; WS161 21/205/0; SLMEMO 471/118/
   589; SL_REF 432/39/10; INPLAY 157/46; MTEXIT 4 = TP_TOUCH 3 + HTF_FLIP
   1; aborts 18/37/13/11/2/0/12; PROMO 469 scoped; CONFIRMPOLL 555;
   SUPPRESSED 156; 4 signals verbatim; N1 28/26/0/3 + pairing identical;
   guardApplied=60; OB ALL3=51; WALKF carve=68; SLIMBR 10 STALE 0).
3. Imbalance instrument inert — PASS: SLIMB/WALKOB/WALKFR 481/481,
   SLIMBR 10/10, deltas+classes, ZERO mismatches, zero missing.
4. Census arithmetic — PASS: rows=11, rowsInWindow=1 (NFP 9/04),
   memberBars=3 (PRE 15:25 / NEWS 15:30 / POST 15:35), expected=3,
   mismatch=0, overlaps=0. Every row prints ET + resolved server open +
   both bounds + offsetMinutes + barsSpanned=3. Conversions: 08:30 ET →
   15:30 server (420) ×9 dated rows; FOMC 14:00 → 21:00 (420) Sep/Dec;
   Oct-28 FOMC → 20:00 (360). Sep-16 21:00 confirms the pinned
   21:00-broker anchor.
5. DST honesty — PASS with exact wording: pilot 8/26–9/10 contains no
   transition (US 2026: Mar-8/Nov-1; EU: Mar-29/Oct-25) → hazard
   UNEXERCISED in window. Forward rows checked arithmetically: Oct-28's
   360 is correct (EDT −4 vs EET +2 = 6h; a +7 constant would print the
   wrong 21:00). Never "verified".
6. Width — PASS with owned note: truncated=0 on all 9 emitted audit
   lines (maxes ≤500, cap 537). DEFECT (diagnostic-only, no data lost):
   BLACKOUT_ROW/BLACKOUT_CENSUS audits execute but print after the
   audit loop, so their LINEWIDTH lines are absent. Off-log proof from
   the journal: ROW max 236, CENSUS max 294 — truncation impossible.
   Owed: move SrjNewsFinalize() before the audit loop (1-line move) in
   the next build touching OnDeinit.
7. Flats — PASS: newsFlat 0, dayFlat 0, weekFlat 0, all under the TRUE
   open-interval test `active && state!=MT_CLOSED` (12b's sticky-flag
   12/2 retracted as artifact). Verified against MTEXIT intervals: 8/28
   closed 11:30, 9/04 closed 16:05, 9/07 closed 17:10 — none spans a
   23:55 mark, a Friday 00:00 mark, or the 15:25 windowStart. Friday ET
   quoted (8/28 + 9/04), daily 17:00 ET quoted. No verdict value added;
   MTEXIT still 4.
8. Spot — PASS: INPLAYCOMMIT 157, XOBPROMO 157, SWEPTMASK 443, all
   identical to RECON11b.
9. Digests above; FlowLogic re-stated unchanged; manual archive recorded
   (method + SHA + length, no mtime). COMMITTED (see §verdict).

## Verdict 2026-09-12 — ACCEPTED, committed locally (no push)

- Gate 6 note accepted with terms: 236/294 labelled ARITHMETIC
  (computed, not pre-write). Move lands in P-SLDEF-2 (E26).
- Archive acceptance = purity triple (1/4/481), not DONE. Stall logged.
- Artifact taxonomy +1: sticky-flag (state-defined counts required).
- DST demonstrated (Oct-28 360); wording: in-window unexercised,
  forward-row exercised arithmetically. Sep/Dec 21:00 = operator anchor
  from the table.
- Entry-side probe requirement adopted for both future sides
  (off-canonical, own digest, reverted in-session, never committed).
- Sep-4 flat = divergence via MTLIFE; flats not re-frozen vs MTEXIT 4.
- "Exactly two swings away" NOT packetized: blast radius 441, chain
  (a)(b)(c), granularity mismatch, label pairs. Next artifact = ladder
  + operator mark-up. Decisive gate: both his levels findable as rungs.
- NEWS: exit→entry after imbalance; flats pending MTLIFE; probes on
  both; table pinned; Oct-28 = regression test.

## E21 halt conditions (both clear)

- One body: SrjInNewsBlackout is the single implementation (census now;
  exit/entry later call it). No second window exists — grep-proof.
- Gap rows: the in-window row verified at finalize with full history
  (iBarShift exact); BLACKOUT_HALT count 0. The 12b false-halt mechanism
  (tester series end at the current bar) is documented in code.

## Decision-surface intersection (the reason this census exists)

- SLIMB evals inside the NFP window: 1 (9/04 15:35 S2POLL, POST bar).
- S5 rows inside: 0. Four-signal membership: none (8/28; 9/04 16:00;
  9/07 ×2 — all outside [15:25,15:40)). The entry-side guard, when it
  comes, suppresses almost nothing on this window — one S2POLL eval.

## Defect log (this packet's repairs, all builder-owned)

- 12: range from Bars()/iTime (full broker depth + first-bar lastB) →
  rowsInWindow=0. Fix: SRJ_PILOT_FROM/TO constants.
- 12b: gap check at first tick (future bars invisible) → false halt of
  the only in-window row; flat test on sticky g_mtrade.active → 12/2.
  Fix: finalize-at-end + SrjNewsIsOpen() (active && state!=MT_CLOSED).
- 12c: audit-loop ordering (this result §gate 6). Owed 1-line move.
