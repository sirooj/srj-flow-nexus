# BUILD PACKET P-SLDEF-3

Four edits. Print-only. **No selection may change. No reference definition may change. No verdict may move; MTEXIT stays 4.**

## E27 — ladder coverage

1. Replace the rung-count bound with the coverage invariant above. Enumerate outward until the deepest rung is strictly beyond every reference printed for that row on the protective side.
2. New tokens: `ladCovers`, `ladCap`, `ladCapHit`, `ladRungs`, `ladDeepestSlot`.
3. Extremity and imbalance stay **reported, never applied**. `imbCode 3` prints as 3 and terminates nothing — nothing is being decided.
4. `rungExt` monotonicity is preserved and still gated. If extending the ladder breaks monotonicity, halt and report — it would mean `rungExt` was being computed over a window rather than over the enumeration.
5. Rungs may exceed one line class's cap. Split into keyed companions on `bar|site|rung` as with `SLIMBRCARVE`; do not widen a line toward the 537 boundary.

## E28 — slot-identity correspondence

1. Print the originating slot for every reference: `todayRefSlot`, `baseRefSlot`, `nuanceRefSlot`, `fracRefSlot`, `fracNuanceRefSlot`, `fracAnchorSlot`, plus `fracAnchorPx`. `-1` where the path genuinely exposes no slot — OB-derived `slToday` is the known case and stays named, not absorbed.
2. Match rung ↔ reference on **slot**. Price residual on a slot-matched pair is a cross-check gated at 0.
3. Split gate 6: `TODAY_OFF_LADDER` (OB-derived, authorised finding, reported) and `FRAC_OFF_LADDER` (fractal-derived, halts with operands). A fractal-limb reference that is not on a protective-side fractal ladder is a frame defect by construction, and it may not be filed as a finding.
4. Report the residual histogram over all slot-matched pairs. Any nonzero cell is named with its row and its two slots — the `+5` pair from RECON13 is the specific thing being falsified here.

## E29 — the zero-length record's operands

One `MTFLIP` line per `HTF_FLIP` verdict, four expected on the Sep-4 record alone but emitted for every instance: `openBar`, `openBarTime`, `entry`, `evalBar`, `evalBarTime`, `biasBefore`, `biasAfter`, `flipSourceBar`, `barsHeld`, and whether the flip was evaluable against the record's own opening bar (`sameBarFlip`). No verdict changes, no evaluation order changes, no priority applied. This is the measurement the exit side will be designed against; it is not the exit side.

## E30 — conventions gate

1. `FRAME_NOTE` states all five conventions: slot frame (`FLOW_SHIFT_OFFSET`), apex frame (`ApexShift`), protective sign (`outwardPts`), population identity (input-side versus result-side), and signal↔S5 mapping (`signalTime = s5BarTime + PeriodSeconds`).
2. `SIGMAP` line, once per run: each of the four firing signals mapped to exactly one S5 row at `signalTime − PeriodSeconds`, reported 4/4 with both bar times printed.
3. `LINEWIDTH` extended to every new class, measured pre-write. Collision audit re-run over the new token set — note `fracRefSlot` / `fracNuanceRefSlot` and `todayRefSlot` against the grandfathered `class` / `fracClass` / `nuanceClass` triple, non-letter lookbehind, audit lines non-self-matching.

## Gates

Full window, pilot ini unchanged, 3168 / 563338.

1. Both compile clean under `#property strict`. FlowLogic digest `3606BFB4…` **unchanged** — a change halts.
2. All RECON13 identities verbatim: CQD 906; `WS161` **21**/205/0; SLMEMO 471/118/589; SL_REF 432/39/10; INPLAYCOMMIT 157/46; MTEXIT **4** (3 `TP_TOUCH` + 1 `HTF_FLIP`, rows verbatim); aborts 18/37/13/11/2/0/12; PROMO 469 scoped; CONFIRMPOLL 555; SUPPRESSED 156; N1 28/26/0/3 with pairing; guard 60; `sideViolations` 0 / `sideFracViolations` 0. Four-signal set verbatim.
3. **Instrument inert, sixth build:** `SLIMB` 481/481, `SLIMBWALK` 481/481, `SLIMBWALKF` 481/481, `SLIMBR` 10/10 on the `bar|site` join, deltas and classes included. A miss halts.
4. Blackout census reproduces RECON13: 11 / 1 / 3 / 0 / 0, Oct-28 `offsetMinutes` 360, gap HALT 0.
5. `ladCovers = 1` on all 10 rows. `ladCapHit` reported; any row with `ladCapHit=1` is reported as **uncovered** and gate 8 is not evaluated on it. `rungExt` monotone on every row. Distinct `barTime` per rung. `ladRungs` and `ladDeepestSlot` per row reported.
6. `FRAC_OFF_LADDER = 0`. Any nonzero halts with the row, both slots and the residual. `TODAY_OFF_LADDER` reported with residuals; RECON13's `ON 4 / OFF 6` is the comparison record, and a change in that split is reported rather than absorbed.
7. Slot-matched price residual `= 0` on every pair. Nonzero halts. Residual histogram reported in full.
8. **Gate 8 re-armed:** on the Sep-7 S5 row (bar 16:40, `ladCovers=1`), 1.16112 appears as a rung with its `rungSlot`, `rungExt` and `imbCode` — or it does not, and *that* is the ghost finding, reported with the rung bracketing it on both sides and its two slots. Cap-adjacent absence is no longer a possible outcome; if `ladCapHit=1` on that row, gate 8 is `UNTESTED` and the packet halts on gate 5 instead.
9. `SLADDER_MATCH`: Sep-7 1.16240 still `MATCH` at residual 0 with its slot; Sep-4 1.15907 re-evaluated under coverage and slot identity — a `MATCH` here would confirm the `+5` was the frame defect, a persisting `NOMATCH` with `FRAC_OFF_LADDER=0` is a genuine structural finding and is reported as such.
10. `MTFLIP` emitted for all `HTF_FLIP` verdicts, Sep-4 record's `barsHeld` and `sameBarFlip` quoted.
11. `SIGMAP` 4/4. `FRAME_NOTE` carries five conventions.
12. `LINEWIDTH truncated = 0` all classes. Data `BADFMT = 0`, audit lines excluded by construction.
13. Sampled-day spot check: `INPLAYCOMMIT` 157, `XOBPROMO` 157, `SWEPTMASK` 443 identical to RECON13.
14. New EA SHA256 + byte size, FlowLogic digest re-stated unchanged, archive recorded as purity-validated segment with SHA, line count and boundary indices. No commit until 2 through 13 pass.

Halt rather than substitute on gate 3, gate 5, gate 6, gate 7.

## What this run settles

Three things, none of them a definition.

The `+5` question resolves one way or the other: either the fractal references sit on the ladder under slot identity and RECON13's off-ladder residuals were frame #4, or they do not and the walk and the ladder are enumerating different sets — which would be a defect in one of them and would invalidate `slFractal` on the whole run, not just at S5.

Gate 8 becomes answerable. With coverage proven, the ghost claim is either earned or retired, and 1.16112 gets its two indices and its `imbCode` on the record either way.

And the Sep-4 record stops being a mystery. A trade that opens and closes on one bar is either an evaluation-order artifact or the correct answer to a bias that had already flipped, and `MTFLIP` says which with operands.

The handoff brief is unchanged in shape and is not issued until gates 5 through 9 pass — a ladder the operator marks up must be one whose coverage and correspondence are both proven, or his mark-up inherits our defect.

## Standing debts, restated so none of them ages out

- `fracAnchorPx` — owed since P-SLDEF-1b, ships in E28. The fractal zero-step falsifier (`slFractal == fracAnchorPx` where `fracAnchorFlag==1`) is verifiable for the first time on RECON14 and must be reported. `count(fracAnchorFlag==1 AND fracWalkSteps != 0) = 0` remains recomputable off the RECON11b/12c/13 logs with no rerun — report it if it has not been.
- Flat re-freeze stays **provisional** pending `MTFLIP`.
- Two label pairs (+20, −10) stay open, resolved by content only, blocking before adoption as selection.
- N1's wick-site contradiction (10 survived / 16 invalidated) is an operator ruling, not a code change, and stays in the handoff brief.
- Probe requirement stands on both remaining news edits: exercised once off-canonical, own digest, reported, reverted in-session, never committed.

# NEWS

Unchanged. Exit side after the imbalance decision and after `MTFLIP`, three flats by value, append-only, priority `SL`, `TP_TOUCH`, flats, `POI_BODY_BREAK`, `HTF_FLIP`, every verdict printing. Entry side last, inside `ST_S5_GATE_CHECK` after the divergence walk and before `g_latchedEntry`, rollback to `g_confirmFromState`, single-shot R latch unspent.

Table pinned at `5FFF5C76…EF1F134`, rows `{eventTimeET, kind}`, conversion at read, resolved bar printed per row. The Oct-28 shoulder row at `offsetMinutes 360` is the table's regression test and is quoted in every future news result.

---

STATUS: ISSUED (P-SLDEF-3: E27 coverage, E28 slot identity, E29 flip operands, E30 conventions gate; print-only; MTEXIT stays 4).
Filed by builder to `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-SLDEF-3.md`.
