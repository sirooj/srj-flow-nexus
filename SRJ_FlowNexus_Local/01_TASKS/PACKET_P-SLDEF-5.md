# BUILD PACKET P-SLDEF-5 — CLEARED (RESCOPE verdict 2026-09-13)

Transcribed by builder from the council verdict 2026-09-13 (BRIEF BLOCKED
third revision), CLEARED by the RESCOPE verdict 2026-09-13 (mark-up gate
VACATED, build approved). STATUS: EXECUTING. A–E landed, no contradiction;
four confirmations reduced to ONE (Aug-28 1.16508 INFERRED, owed for
adoption, not the build). Amendments applied: E37 provenance three-value
(HAND/CODE/INFERRED, INFERRED→PROVISIONAL_MATCH); E39 rewardPts+riskPts full
precision per non-firing row; E40 NONE-row OB extreme slot/barTime/age;
gate 2 FULL (shadow → four-signal verbatim, slToday move halts); gate 6 four
tokens (MATCH/ABSORBED/PROVISIONAL_MATCH/MISS); Ruling-3 fifth-example map
owed for adoption (off-log, no rerun).

## Build record

- Build 1: EA 5B4F7E06… (399165 B), 0/0. RECON16 DONE=PASSED 14:24:05
  (Test passed 0:54:19; journal A32F0E85… 17955 lines). SUPERSEDED:
  cover target missed ext1, ladObligN/VACUOUS_COVER unbuilt, noneAgeBars
  sign inverted (gate-9 letter). All other gates gradeable (see
  BUILDER_RESULT_RECON16b-SLDEF5.md appendix).
- Build 2: EA 893B26DF… (399946 B), 0/0 — ext1 in cover target, ladObligN
  token (SLADWIN fields 27→28), VACUOUS_COVER naming, noneAge sign fix.
  RECON16b DONE=PASSED 15:25:32 (Test passed 0:56:30; 4740FA3B… 17954
  lines; 10/11 PASS + gate-8 FINDING, zero halts). STATUS: EXECUTED —
  council ACCEPT + adoption word owed. Full record in
  06_HANDOFFS\BUILDER_RESULT_RECON16b-SLDEF5.md.
- VERDICT 2026-09-13: ACCEPTED. Baseline advances to 893B26DF (local
  commit cleared, NO push). E35 deviation (S5-site shadow) accepted for
  the run, BLOCKS adoption (471 pre-S5 invocations + 118 memo hits
  unmeasured) → P-SLDEF-6 ISSUED (separate file). Scorecard n=5 (Aug-28
  promoted MATCH off-log; filedT 06:30 rides next run). OB carve
  corrected 4 (firing-vs-effect = 6th taxonomy entry); NONE=4 splits
  OFF_LADDER/EXT_NONE in P-SLDEF-6; gate-9 naming debt to P-SLDEF-6
  (VACUOUS+EXT1_UNCOVERED). F: definition-confirmation YES; recovery
  awaits his one yes/no (10:35 taken-on-correct-data?).

Print-only. **No selection may change. No reference definition may change.
MTEXIT stays 4.** Cleared to build once A–E land and the operator confirms
his four levels. **Halt and report instead of building if A or B contradicts
the candidate** — a wrong candidate is not worth a 55-minute run.

## E35 — `slExt1`, the candidate as a shadow reference

Sixth reference, computed in `ComputeSlReference` on every invocation, both
branches: the rung at `rungExt == 1` on the protective side, anchor-free from
the entry bar, with **no imbalance term and no carve-out**. Tokens: `slExt1`,
`ext1Slot`, `ext1BarTime`, `ext1ImbCode`, `deltaExt1Pts`, `outwardExt1Pts`,
`ext1Defined`. Where ext 1 does not exist, `ext1Defined=0` with the deepest
available ext index reported — never a fallback price, never silent.

Add `extIndexOf` for every existing reference — `today`, `base`, `nuance`,
`fractal`, `fractalNuance` — so the whole reference set is expressed in the
index the operator counts in. This is the column that lets any future
candidate be evaluated as arithmetic.

## E36 — `carveFired` and mechanism separation

Per limb, a boolean emitted from the carve-out predicate itself. Class tokens
unchanged. Report `carveFired` against class in a cross-tab so the mislabel
is sized in the log rather than off it.

## E37 — provenance and `SLIMBR` extension

`SLADDER_MATCH` carries `provenance ∈ {HAND, CODE}` per filed level, refusing
to accept a `CODE` value as an operator level. `SLIMBR` and the decision
block extend to six references with survival verdicts against the runtime
threshold, reward at full precision.

## E38 — rider list, folded in

`ladObligN` + `VACUOUS_COVER`; `SEQ_UNSTAMPED` naming with its S4→S5 cause in
the token block; the three DECISION classes registered in `LwAudit`; the
mark-up table emitted as its own audited class rather than script-assembled;
`orderFlipPass` struck or scope-annotated at the emitter; ORDER stamp
relocated to the HTF site if the code-read says the sites differ.

## E39 — non-firing cost (amendment, verdict BRIEF BLOCKED-3)

Per S5 row: abort reason, today's R, today's ext index, `slExt1` R, and
`wouldFireUnderExt1`. Report `newSignalCount` and `lostSignalCount` as
counts with rows named. **Neither is gated** — both are findings, and a
definition that changes selection must state the change in both directions
before it ships.

## E40 — token renames and mechanism separation (amendment)

`flipNewThisBar` plus `biasOpposedAtGate`; `carveFired` per limb from the
predicate; `rewardPts` once per row at full precision with continuity
labelled. Class tokens unchanged.

## Gates

Full window, pilot ini unchanged, 3168 / 563338. Gates 1–4 and 12–15 as in
P-SLDEF-4, verbatim, including the FlowLogic digest unchanged and the
**ninth** inert join at 481/481 ×3 plus 10/10. Added:

5. `slExt1` resolved on every invocation or `ext1Defined=0` named with its
   deepest ext. `outwardExt1Pts` sign distribution reported, unconstrained.
6. Per firing row: price residual **and** bar difference vs the filed level,
   provenance printed. Three rows grade `MATCH`/`ABSORBED` with operands;
   Aug-28 grades `PROVISIONAL_MATCH` (level INFERRED — reported, counted
   apart, never a pass, never a halt). Tokens stay four:
   `MATCH`/`ABSORBED`/`PROVISIONAL_MATCH`/`MISS`. **Residual beyond the
   1-point absorption limit on any row halts with operands.**
7. `extIndexOf` printed for all six references; `count(extIndexOf(today) ==
   1)` over the ten S5 rows reported.
8. `carveFired` × class cross-tab in full, S5 subtotals per limb. The RECON9
   partition is the comparison record.
9. `ladCovers` over the obligated subset including `slExt1`; `ladObligN`
   reported; `VACUOUS_COVER` named where the obligated set is empty.
10. `LINEWIDTH truncated = 0` on all classes including the three DECISION
    classes and the mark-up class. Data `BADFMT = 0`.
11. `newSignalCount` / `lostSignalCount` with rows named and full-precision
    reward and risk on every row that changes state. Expected `1 / 0`; a
    different pair is reported, not absorbed.

Halt rather than substitute on E35's `ext1Defined` clause, gate 6 and the
inert join.

## What closes after this run

If gate 6 passes, the definition is `rungExt == 1`, no imbalance term, no
carve-out, and the packet after it is a single anchor-and-count change with
its R already on paper — 2.43 / 1.66 / 1.76 / 2.34, all four signals alive.
If gate 6 misses beyond absorption on any row, the candidate dies with
operands and the fallback is enumerating candidate indices against his five
filed examples (mark-up refused). Either outcome is a decision.

## Off-log, no rerun (gating the candidate — LANDED 2026-09-13)

**A.** ext index and price, four ext-1 rungs off `SLADDER` (filed in
`BUILDER_RELAY_COUNCIL_RECON15b-SLDEF4.md` v3; no contradiction).
**B.** HAND/CODE tags with chartread quotes (same relay; Aug-28 INFERRED).
**C.** `count(slNuance != slBase)` per limb, S5 + 481, vs CARVEOUT_FIRED
(OB 71⟺TODAY_EQ_NUANCE 71; frac 92=68+24; same relay).
**D.** reward operands + R formula, four firing rows (same relay).
**E.** ext 1 all ten rows + todayRef ext per row (same relay).
Still owed per verdict text: ORDER recount, 9/08 walkSteps, RECON15
build-1 exhibit, bias code-read (all quoted in relay v2/v4).
Report **F** (non-firing cost table, newSignalCandidates=1: Sep-4 10:35
SHORT) filed in relay v4. Bias-opposed bar predating 15:55: not on-log →
rides E40.

## NEWS (standing, quoted from verdict)

Unchanged. Exit side after the imbalance decision, after `MTFLIP`, after
`ORDER` reconciles and the flip-detection scope resolves. Entry side last,
inside `ST_S5_GATE_CHECK` after the divergence walk and before
`g_latchedEntry`, rollback to `g_confirmFromState`, latch unspent. Three
flats by value, append-only, priority `SL`, `TP_TOUCH`, flats,
`POI_BODY_BREAK`, `HTF_FLIP`, every verdict printing. Flats **provisional**.
Probe requirement stands on both edits: exercised once off-canonical, own
digest, reported, reverted in-session, never committed. Table pinned at
`5FFF5C76…EF1F134`, rows `{eventTimeET, kind}`, conversion at read, resolved
bar printed per row. Oct-28 at `offsetMinutes 360` quoted in every future
news result.
