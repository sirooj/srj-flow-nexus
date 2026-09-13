# BUILD PACKET P-SLDEF-4

Four edits. Print-only. **No selection may change. No reference definition may change. No verdict may move; MTEXIT stays 4.**

## E31 — coverage rescope and derived window

1. `refIsRung` per reference by slot occupancy against the swing buffers; `refWalkSteps` beside it. Disagreement between the two halts with operands.
2. `ladCovers` over the rung-obligated subset only, gated 1. Non-rung references emit `REF_OB_DEEP` with slot and distance.
3. Derived read window: origin at entry bar, span to deepest obligated slot plus stated margin. Tokens `ladWindowStart`, `ladWindowSpan`, `ladReadLimit`, `ladLimitHit`, `ladRungs`, `ladDeepestSlot`.
4. `ladLimitHit=1` → row status `UNCOVERED_READ_LIMIT`, gate-8-class evaluation on that row `UNTESTED`. Never silent.
5. **Halt condition:** ladder cannot read a slot the same row's walk read → halt, report both windows.
6. Extremity and imbalance stay reported, never applied. `imbCode 3` prints as 3 and terminates nothing.
7. `rungExt` monotonicity preserved and gated. Break → halt.

## E32 — `SLADDER_DECISION`

Human-readable block at end of run, the artifact the operator marks up. Per S5 row, four firing rows flagged: rungs 0 / 1 / 2 by `rungSlot` **and** by `rungExt`, each with `slot`, `barTime`, `px`, `wick`, `body`, `imbCode`, `distPts`, `rungR`; plus the matched operator level with its rung and slot; plus `ladCovers` and `ladRungs`. Keyed on slot and `barTime` — **no rung index is load-bearing anywhere in this block.** Threshold `1.00 compiled_default` quoted in the block header.

## E33 — `ORDER` census, intra-bar sequence

Monotonic per-bar sequence counter stamped at the bias-update site and at the S5 gate-check site. One line per bar on which the S5 gate is evaluated: `bar`, `barTime`, `seqBias`, `seqS5`, `biasAtGate`, `flipDetectedThisBar`, `gateOutcome`. Report `count(flipDetectedThisBar==1 AND gateOutcome==PASS)`.

**No evaluation order changes. No gate outcome changes. No priority applied.** This is the measurement the exit side and the entry-side guard are both designed against; it is neither of them.

## E34 — conventions and width

1. `FRAME_NOTE` carries **six** conventions: slot frame, apex frame, protective sign, population identity, signal↔S5 mapping, and read-window origin/span **per reader**.
2. `LINEWIDTH` extended to every new class, measured pre-write. Collision audit re-run, audit lines non-self-matching.
3. Rung companions stay keyed on `bar|site|rung`; do not widen any line toward the 537 boundary.

## Gates

Full window, pilot ini unchanged, 3168 / 563338.

1. Both compile clean under `#property strict`. FlowLogic digest `3606BFB4…` **unchanged** — a change halts.
2. All RECON14 identities verbatim: CQD 906; `WS161` **21**/205/0; SLMEMO 471/118/589; SL_REF 432/39/10; INPLAYCOMMIT 157/46; MTEXIT **4** (3 `TP_TOUCH` + 1 `HTF_FLIP`, rows verbatim); aborts 18/37/13/11/2/0/12; PROMO 469 scoped; CONFIRMPOLL 555; SUPPRESSED 156; N1 28/26/0/3 with pairing; guard 60; `sideViolations` 0 / `sideFracViolations` 0. Four-signal set verbatim.
3. **Instrument inert, seventh build:** `SLIMB` 481/481, `SLIMBWALK` 481/481, `SLIMBWALKF` 481/481, `SLIMBR` 10/10 on the `bar|site` join, deltas and classes included. A miss halts.
4. Blackout census reproduces: 11 / 1 / 3 / 0 / 0, Oct-28 `offsetMinutes` 360, gap HALT 0.
5. `ladCovers = 1` on all 10 rows over the obligated subset. `ladLimitHit` reported; any row with it set is `UNCOVERED_READ_LIMIT` and named. `refIsRung` / `refWalkSteps` agreement 100%. `rungExt` monotone every row. Distinct `barTime` every rung.
6. `FRAC_OFF_LADDER = 0`. `TODAY_OFF_LADDER` reported; `REF_OB_DEEP` reported with slots. Change from RECON14's 9/1 split reported, not absorbed.
7. Slot-matched price residual `= 0` on every pair. Nonzero halts. Histogram in full.
8. **Ghost re-verified by slot, not by rung:** `1.16112` present at **slot 77** with `imbCode 1` and residual 0, brackets reported. Its rung index may change; the change is reported, not gated.
9. `SLADDER_MATCH`: Sep-7 `1.16240` at slot 1 residual 0; Sep-4 `1.15907` at slot 407 residual 0; `1.15847` resolved by slot if the operator files it.
10. `ORDER` emitted on every S5-evaluated bar. `count(flipDetectedThisBar==1 AND gateOutcome==PASS)` reported with rows. Sep-4 15:55 quoted with `seqBias` / `seqS5`.
11. `SLADDER_DECISION` present, 10 rows, four flagged, threshold quoted, no rung index load-bearing.
12. `SIGMAP` 4/4. `FRAME_NOTE` carries six conventions.
13. `LINEWIDTH truncated = 0` all classes. Data `BADFMT = 0`, audit lines excluded by construction.
14. Sampled-day spot check: `INPLAYCOMMIT` 157, `XOBPROMO` 157, `SWEPTMASK` 443 identical to RECON14.
15. New EA SHA256 + byte size, FlowLogic digest re-stated unchanged, archive as purity-validated segment with SHA, line count and boundary indices. No commit until 2 through 14 pass.

Halt rather than substitute on E31.1, E31.5, gate 3, gate 5, gate 7.

## Off-log reports requested, no rerun

1. OB-limb `walkSteps` and `fracSteps` for both RECON14 capHit rows, to discharge gate 5 on 9/08 immediately.
2. Rungs 0 / 1 / 2 by both indices with `rungR` for all 10 rows off the RECON14 ladder — the two-away candidate, answerable now.
3. `rungR` at the matched operator level on both matched rows, so his levels carry their own R beside the candidates.

---

STATUS: ISSUED (P-SLDEF-4: E31 rescope+window, E32 decision block, E33 order census, E34 conventions; print-only; MTEXIT stays 4).
Filed by builder to `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-SLDEF-4.md`.

---

# Council rulings recorded with this packet (verdict session 2026-09-13)

- RECON14 ACCEPTED; new frozen baseline (EA 2702B7F2 357192 B; journal
  F0D7AC70 17516 lines, boundaries [9705..27220], purity 1/4/481). Local
  commit cleared. Gate-3 across six builds = custody mechanism proven.
- Gate-5 halt ruled MY over-specification: coverage rescoped to
  rung-obligated references (walkSteps>0); zero-step OB extremes take
  REF_OB_DEEP, never a coverage failure. 9/08 discharges off-log on
  walkSteps=0; 15:55 shortfall (slots 493 vs 524) is a two-horizon
  defect, closed by E31.
- Rung index derived, never key: (slot, barTime, px, imbCode) is the key;
  gate 8 re-armed by slot 77; MATCH already slot-keyed; operator mark-up
  by barTime+price only. Sixth FRAME_NOTE convention (read-window
  origin/span per reader).
- "Exactly two swings away" REFUTED on the fractal set (rung 0 vs rung
  16 over his own two levels); no counting definition packetised before
  the mark-up lands. Shallow-rung table (rungs 0/1/2 + matched-level R)
  owed off-log for the handoff.
- Sep-4 16:00 signal = same-bar race (bias flipped 15:55, gate passed
  15:55, record opened 16:00, died same-bar); entry-side finding inside
  the frozen four-signal set; E33 measures it for exit-side + news-guard
  design. 1.15847 unfiled: Sep-4 SL pair stays open.
- Debts discharged: MTFLIP_N=1 accepted; 9/1 split accepted (OFF becomes
  REF_OB_DEEP); zero-step falsifier CLOSED (0 on 56 anchors + 0/0/0 off
  old logs); E30.3 tabulation form adopted standing. Launch hang: try
  `cmd /c start`, no canonical packet on it; boundary indices in every
  archive record.
