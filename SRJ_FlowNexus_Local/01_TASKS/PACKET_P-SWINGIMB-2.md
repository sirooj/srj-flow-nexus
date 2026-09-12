# PACKET P-SWINGIMB-2 — issued (council session 2026-09-12, P-SWINGIMB verdict ACCEPTED)

RECON8-SWINGIMB stands as the new frozen baseline. Record the new digests
as canonical for EA and FlowLogic; commit is cleared on the strength of
gates 1-6 and 8.

---

## Gate 7 — waiver GRANTED, but as a DEFERRAL, not a discharge

EA-side consistency is accepted as sufficient for this packet: avail 481/481,
exposed-chosen 140/140, apex 481/481, and an internally consistent histogram
(318/67/96/0 = 481). The reconciliation stays owed.

Two constraints while it is owed:

- The EA-side histogram is a **read** census over 481 invocations. FlowLogic's is a **write** census over every fractal in the window. They are different populations, so the reconciliation is `EA_avail ≤ FL_writes` plus agreement on *which codes occur*, never a count match. Do not let a later session read the two as the same number.
- `f3=0` is currently an EA-side observation over evaluated bars only. It may not yet be quoted as "the leg boundary is always set." It is "always set on the 481 bars the stop path read."

Capture method for the FlowLogic tally — use the tree's own progress idiom rather than fighting the unload:

```
SWINGIMB_PROGRESS writes=<n> highs=<n> lows=<n> code0=<n> code1=<n> code2=<n> code3=<n> naAlive=<n>
```

emitted from inside the write branch every 500 writes, matching `IDCHANGE_PROGRESS` / `BIASCENSUS_PROGRESS` / `CQDRECHECK_PROGRESS`. The final progress line bounds the tally within 499 writes, which is ample for an inequality reconciliation, and it lands in the log before unload so nothing depends on OnDeinit surviving. Keep the OnDeinit line as well — it costs nothing and it works outside the tester. This ships in the next packet, not as a standalone edit.

## Finding 3a — frame correction: my instruction was wrong, yours is right

Gate 6 as I wrote it (`iHigh(s)`) was incorrect. A swing value reached through `ReadFlow` at eval shift `s` sits in raw slot `s+FLOW_SHIFT_OFFSET`, and FlowLogic indexes that slot by the apex bar, so the apex is at price shift `s+1`. RECON7's 481/481 miss was the instrument reading my error faithfully; RECON8's 481/481 is the proof. Export exonerated, Rulings 1 and 2 unbroken, deviation accepted as frame-correction with intent preserved.

**The same defect is still live elsewhere in E2 and it sits on the only new content in the nuance.** The `cands` `W|B` classifier takes its body extreme from `iOpen`/`iClose` "at the swing's own eval shift." That is the identical off-by-one. Every wick-versus-body verdict measured so far is therefore reading the wrong bar's body, and wick-versus-body *is* the carve-out. Do not draw any conclusion from the current `W|B` marginals.

Fix the class, not the instance: one named helper, and every price read of a swing's own bar routed through it.

```
int ApexShift(const int evalShift) { return evalShift + FLOW_SHIFT_OFFSET; }
```

Every `shift` token printed by SLIMB stays in ReadFlow frame — do not renumber them. Name the frame in the token block comment so a later session cannot "correct" it back.

## Finding 4 — the hypothesis holds, and it is narrower than it looks

Branch ⟺ obValid, off-diagonal zero, UNEVAL zero. `FL_BUF_LTF_OB_VALID` carries the nuance's OB-validity term. Accepted.

But the census also shows the ruled rule is **not** implemented today in either branch, and the gap is larger than the wick carve-out:

- **1-swing, 441 invocations.** The branch takes buffer 27 — the OB's swing extreme — with no imbalance term anywhere. Operator ruling (b) says a swing without a qualifying imbalance is walked past, outward, to the next one that has it. In VALID_NOIMB (296) today's code stops at a swing the base rule would walk past. The nuance is what decides whether the walk is suppressed. Both limbs are unmeasured.
- **2-swing, 40 invocations.** The structure walk stops at the first previous turn top regardless of imbalance. Same missing term, DEAD_IMB 18 / DEAD_NOIMB 22.

So the wick carve-out is not the only new content. It is the *suppressor* of a walk that does not exist yet. Both must be shadowed together or the deltas are uninterpretable.

## Rulings on your two declared judgments

**Multi-record aggregation (any-alive → 1, else 2): accepted.** The operator's rule asks whether the leg displaced, not which record did it, so ANY is correct and uniqueness is not a term.

**NA remainder counted alive-as-of-apex: accepted, with the fail-open sized.** It matches creation semantics — `startBar = apex-2`, `detectedAt = apex`, no fill pass has run against it beyond the same-bar pass — but it is a fail-open on the one term that can turn a 2 into a 1. Add `naAlive` to the progress line above so the population is known. Until it is measured, code 1 may not be quoted as "remainder positively observed alive."

**Code 2 does not qualify as an imbalance for the outward walk.** A fully mitigated gap is not a displacement any more. This does not reopen the operator's partial-fill ruling — a partial is code 1 by `remTop > remBottom` and still qualifies. Count code-2 encounters separately so the alternative reading stays measurable without a rerun.

## Blocking prerequisite: the chosen slot

341 of 481 report `chosen=-1` because the reference came from buffer 27, which arrives as a price with no slot. The ruled rule needs the imbalance flag *of the chosen swing*, so the walk cannot be shadowed until that swing is identifiable.

**Do not recover it by matching buffer 27's value against swing slots.** Price identity is ambiguous exactly where it matters: the 08/28 case has four swing highs inside one point. Export it. FlowLogic already writes buffers 26/27 from one `SRJ_NearestPromotedOBIndex` selection inside one branch, and buffer 33 is the precedent for exporting a bar time from that same pointer.

---

# BUILD PACKET P-SWINGIMB-2

Three edits. Shadow-first, print-only. **No selection may change.** Expected result is an in-window no-op on every measured identity, +1 line class.

## E5 — FlowLogic: OB swing bar time + progress tally

1. `indicator_buffers 39` → `40`. `indicator_plots` unchanged.
2. Index **39**, `INDICATOR_CALCULATIONS`, `FL_BUF_OB_SWING_TIME`. Encoding is buffer 28/30/33's: server-time datetime of the OB's swing bar cast to double, `0.0` = unset. `EMPTY_VALUE` is forbidden as the sentinel here for the reason recorded at buffer 33.
3. Written **in the same branch, from the same object pointer** that writes 26 and 27. If that pointer does not expose the swing bar index, **halt and report** — do not derive it, do not search for it.
4. `SWINGIMB_PROGRESS` per the capture method above, every 500 writes, plus `naAlive`.
5. No new FlowLogic input. The positional `iCustom` surface is frozen.

## E6 — EA: frame repair, no new line class

1. Add `ApexShift`. Route every price read of a swing's own bar through it, including the `cands` `W|B` body extreme.
2. `#define FL_BUF_OB_SWING_TIME 39`, read via `ReadFlow`.
3. Resolve `chosenShift` for the OB-source path from buffer 39 by bar time, then read the flag at that slot. `chosen=-1` should fall to 0. Any residual is reported with its cause, not absorbed.
4. SLIMB token set and order otherwise unchanged, so RECON8 remains diffable line-for-line outside `chosenShift`, `chosenFlag`, `chosenAvail` and the corrected `W|B`.

## E7 — EA: SLIMBWALK shadow

One line per `ComputeSlReference` invocation, both branches, gated `InpDebugLog && SHADOW_SLIMBWALK`. `fields=` token mandatory.

Three references per invocation:

| token | rule |
|---|---|
| `slToday` | the value the function actually returns. Live. Untouched. |
| `slBase` | outward walk on the protective side from the chosen swing to the first swing with code 1. Code 2 and code 0 are walked past. |
| `slNuance` | `slBase`, unless the wick-only carve-out fires, in which case the inward one-swing reference. |

Carve-out predicate, falsifiable as stated: the newer, more extreme swing exceeds the retained reference by **wick only** — its apex bar's body extreme, read at `ApexShift`, does not exceed. Body exceeds → the stop moves out. Print the operands, not just the verdict.

Also print: `deltaBasePts`, `deltaNuancePts` (signed, `slToday` as origin), `walkSteps`, `code2Seen`, `exhausted`, and a class token over `{TODAY_EQ_BASE, TODAY_EQ_NUANCE, ALL_THREE_EQ, CARVEOUT_FIRED, WALK_EXHAUSTED, UNRESOLVED}`.

Assigns nothing outside its own counters. Branches on no flag. Does not consult or pollute the memo — `site=S5` computes fresh, as it does today.

## Gates

Full window, pilot ini unchanged, 3168 / 563338.

1. Both compile clean under `#property strict`.
2. Four-signal set verbatim. All RECON8 identities verbatim, including SLMEMO 471/118/589, SL_REF 432/39/10, aborts 18/37/13/11/2/0/12, WS161 21/205/0, MTEXIT 4, CQD 906.
3. SLIMB: 481 lines, 432+39=471, S5 10, avail 481/481, apex 481/481. **`chosen` exposure 481/481** or a named residual.
4. SLIMBWALK count = SLIMB count = 481. `UNRESOLVED` = 0 or named.
5. FlowLogic progress tally present in the segment log, and `EA_avail ≤ FL_writes` with code sets agreeing.
6. Re-run gate 8 on a sampled day: `INPLAYCOMMIT`, `XOBPROMO`, `SWEPTMASK` identical to RECON8.
7. New SHA256 + byte size for both files. No commit until 2 through 6 pass.

Halt rather than substitute on E5.3 and on any `avail=0`.

## What this buys, stated in advance

If `TODAY_EQ_NUANCE` dominates and `deltaNuancePts` is zero across the four-signal set, the ruled rule is already what the code does and the imbalance work closes with an export and no selection change. If `CARVEOUT_FIRED` is rare and `deltaBasePts` is large and positive, the base rule widens stops materially and the operator gets to see the R cost of his own rule before it ships. Either outcome is a decision; neither needs another rerun.

---

# NEWS — one item you can move in parallel

Sequencing stands: BLACKOUT census, then exit side, then entry side, all after imbalance. No code.

The one thing that is not code and should not wait: draft the pinned static event table now for operator review — CPI, NFP, FOMC rate decision only, `{eventTimeET, kind}` per row, covering the pilot window plus whatever forward span the operator wants, with its own SHA256 recorded alongside the file digests. It must derive from the same timestamp anchor the operator uses for the FOMC VWAP/POC, and the review is a human-latency item that will otherwise sit on the critical path behind the imbalance run. Run the throwaway `CalendarValueHistory` probe if you want the knowledge; it blocks nothing and enters the canonical path never, except later as a print-only `CALXCHECK`.

---

STATUS: ISSUED (council verdict session 2026-09-12: P-SWINGIMB ACCEPTED, RECON8 frozen baseline, commit cleared).
Filed by builder to `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-SWINGIMB-2.md`.
