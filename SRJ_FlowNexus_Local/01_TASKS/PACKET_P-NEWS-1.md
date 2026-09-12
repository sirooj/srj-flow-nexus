# BUILD PACKET P-NEWS-1 — BLACKOUT membership census

Issued now so the builder is not idle behind operator review latency. Print-only, **no verdict may move, no selection may change, no `MT_EXIT_*` value is added in this packet.** MTEXIT stays 4.

## E20 — pinned table, in source

1. Compile-time constant array of `{eventTimeET, kind}`, CPI / NFP / FOMC-rate-decision only, transcribed from the pinned file at SHA256 `5FFF5C76…EF1F134`, 11 rows. **No stored broker-time field, no stored offset.** Conversion at read.
2. `TABLE_NOTE rows=<n> digest=5FFF5C76…EF1F134 anchor=21:00_broker` once per run, digest as a source string constant. The emitted rows are the audit artifact; the file digest is the human check against them.
3. **No new EA input.** Pilot ini stays unchanged — that is a baseline term.

## E21 — one predicate, one implementation

`bool SrjInNewsBlackout(const datetime barOpen, ...)` returning membership plus the resolved row. Window `[barOpen(newsBar) − 1·PeriodSeconds, barOpen(newsBar) + 2·PeriodSeconds)`. `newsBar` containment is `[barOpen, barOpen + PeriodSeconds)`. No literal minutes anywhere.

**Halt condition:** if the predicate cannot be written so that the census now, and both the exit and entry sides later, call the same body, halt and report. Two implementations is two windows.

**Halt condition:** if a table row's timestamp resolves into a price gap — no bar exists containing it — halt and report the row. Do not snap to the nearest bar.

## E22 — census emissions

- `BLACKOUT_ROW` per table row: `kind`, `eventTimeET`, resolved `newsBarOpen` in server time, `windowStart`, `windowEnd`, `offsetMinutes` (server − ET at that instant), `inWindow`, `barsSpanned`.
- `BLACKOUT_BAR` per member bar only: `barTime`, `kind`, `pos ∈ {PRE, NEWS, POST}`.
- `BLACKOUT_CENSUS`: `rows`, `rowsInWindow`, `memberBars`, `expected`, `mismatch`, `overlaps`.
- **Decision-surface intersection**, the reason this census precedes anything: `SLIMB` invocations inside a window, `site=S5` rows inside a window, and four-signal-set membership by name. This is the exact population the entry-side guard would suppress.
- **Flat populations, all three, read-only:** `newsFlatCandidates` (managed record open at a `windowStart`), `dayFlatCandidates` (open at 5 min before daily close), `weekFlatCandidates` (open at the pinned Friday ET time, quoted in the line). The ≤60-min Friday band is an acceptance statement in the result, never an offset in source.
- `LINEWIDTH` extended to every new class, measured pre-write. Collision audit re-run over the new tokens, audit line non-self-matching per the ruling above.

## Gates

Full window, pilot ini unchanged, 3168 / 563338.

1. Both compile clean under `#property strict`. FlowLogic digest `3606BFB4…` **unchanged** — a change halts.
2. All RECON11b identities verbatim: CQD 906; `WS161` **21**/205/0; SLMEMO 471/118/589; SL_REF 432/39/10; INPLAYCOMMIT 157/46; MTEXIT **4**; aborts 18/37/13/11/2/0/12; PROMO 469 scoped; CONFIRMPOLL 555; SUPPRESSED 156. Four-signal set verbatim.
3. **The imbalance instrument is inert under this edit:** `SLIMB`, `SLIMBWALK`, `SLIMBWALKF`, `SLIMBR` reproduce RECON11b on the `bar|site` join — 481/481, 481/481, 481/481, 10/10 — including deltas and classes. A miss halts.
4. `memberBars = 3 × rowsInWindow`, `mismatch = 0`, `overlaps` reported. Every in-window row prints ET, resolved server open, both bounds, and `offsetMinutes`.
5. **DST honesty:** report `offsetMinutes` per row and state whether the pilot window contains a transition. If it does not — and 8/26–9/10 does not — the DST hazard is recorded as **unexercised in window**, with the forward-span rows checked arithmetically off-log against the table. Never "verified."
6. `LINEWIDTH truncated = 0` all classes. Data `BADFMT = 0`, audit lines excluded by construction.
7. Three flat populations reported with the pinned Friday ET time quoted. No verdict value added; MTEXIT still 4.
8. Sampled-day spot check: `INPLAYCOMMIT`, `XOBPROMO`, `SWEPTMASK` identical to RECON11b.
9. New EA SHA256 + byte size, FlowLogic digest re-stated unchanged, wrapper archive recorded. No commit until 2 through 8 pass.

Halt rather than substitute on E21's two halt conditions and on gate 3.

## Sequencing after this

Exit side next — three verdicts by value, append-only, priority `SL`, `TP_TOUCH`, flats, `POI_BODY_BREAK`, `HTF_FLIP`, every verdict printing — with MTEXIT re-frozen after it. Entry side last, inside `ST_S5_GATE_CHECK` after the divergence walk and before `g_latchedEntry`, rollback to `g_confirmFromState`, measured against the four-signal set. Both unchanged from prior rulings, both still after the imbalance decision.

---

STATUS: ISSUED (P-NEWS-1: E20 pinned table in source + TABLE_NOTE, E21 single predicate with two halt conditions, E22 census emissions + flat populations + LINEWIDTH/collision; print-only; MTEXIT stays 4).
Filed by builder to `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-NEWS-1.md`.
