# BUILDER SLICE B-98 - greps, B-97 refs, tables, before/after lines (spec review, MEASURED)

Scope: read-only review of B-97 evidence vs spec/skill/finding/register. No edit, no gate, no re-grade, no compile, no run. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-97` = `1f67497094043ef2ced3cb88d6509843a6840646` (verified; cut builder/B-98 here).
- `git log -1` = `1f67497094043ef2ced3cb88d6509843a6840646 B-97 provenance fix verified, same diagnostic proven with valid build stamps (relay B-97)`.
- `git status --short` line count = 378 (B-97 artifacts added; preserved, untouched).
- `git diff 1f674970... --` EMPTY on: pointer, RESULT/SLICE B97, RESULT B96, RESULT B95, PLANNER_CONTEXT, PLANNER_HANDOFF.
- EA `137076D9CF85...` / EX5 `FA4C924978F6...` / indicator src `956BF3E3ADB7...` / EX5 `27B5F272DCF...` (prefixes match; LF-normalized identical).
- Spec/skill/register/XOBSUIT verified untouched by gate diff. No terminal64. No compile. No run.

## PART B GREPS (before/after)

- Operator message = B-98 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- Skill quotes verified (lines): 0602 pair `skill:178` (both phrases, one line); 0604 `skill:198`; B-91 retrace `skill:202`; no-cascade `skill:204`. XOBSUIT-a3 in finding `FINDING:91-94` (not in skill — 0 matches there, recorded).
- `B-98-XOB-SPEC-EVIDENCE-REVIEW` in 99_WORKFLOW 0→1 (context X1). `B-98` in 99_WORKFLOW 0→1 (handoff X2).
- `B98-XOB-SPEC-EVIDENCE-REVIEW` in SRJ_FlowNexus_Local 0→1 (ledger 1243). `^1243.` 0→1; `^1242.` = 1 beside.

## R1 B-97 REFS (all FOUND; RESULT_B97 R2/T4 + ledger 1242)

- Decision PROVEN; stamps `headerBuild=2026.10.08 18:27:06`, rows same, `eaBuild=2026.10.08 18:27:18`.
- `bars=3289 recs=167638 maxPerBar=84 atBar=2026.06.02 23:00` (84 direct-counted at 1780441200).
- MULTI `2026.05.21 14:20 n=3` (ids 1/3/4). ADJACENT `id=1 ... diffSec=300` (CSV 1779371400/1779371700).
- PROMO `42514/254`. INVAL `48656`. PROV `1/1`. 5 SHAs restored. Gate never enabled (additive-only diff).

## R2 CONTRACT TABLE (field | evidence | need | class | limit)

- identity | objId/row + id=1 adjacent | cross-run join (§8; B-95) | PARTIAL | no cross-run key.
- direction | B/S per row | bias context (§3.2/3.3) | SATISFIED | verdicts EA-side.
- zone high | double/row | §3.5 + §3.6 | SATISFIED | verdicts unbuilt.
- zone low | double/row | same | SATISFIED | same.
- formation | startT+createT/row | §3.5 origin, §9.9 age | SATISFIED | none.
- promotion | promoT/NA/row | §3.5.1 ordering | SATISFIED | confirmation EA-side.
- validity | flag/row | §3.5 + a1 | SATISFIED | no kill inference.
- activation | flag/row | liveness | SATISFIED | same.
- promotion-state | flag/row | §1.2 relevance | SATISFIED | same.
- inval-state | valid=0 rows | §5.4 input | SATISFIED | never a kill label.
- inval-time | invalT/row (death-bar writes, B-95) | death timing | SATISFIED | NOT a kill bar.
- inval-level | double/NA/row | a1 midline geometry | SATISFIED | comparison unbuilt.
- bar/timestamp | barT sec/row | §4 indexing | SATISFIED | forming bar absent by design.
- multi-record | 84 max | full live set | SATISFIED | observed, not unlimited.
- four-state | absent/NA-prom/valid=0/live per row | lifecycle | SATISFIED | tracking via adjacency only.
- provenance | build/row + header + EA + journal | run/build join (§8) | PARTIAL | same-stamp collisions (B-63); no cross-run key.

## R3 SPEC TABLE (section | supportable | missing | consequence)

- §3.5 | zone+validity+invalT/row, age records | the in-play VERDICT (2-swing cover only) | inputs, never verdict.
- §3.5.1 | promoT≤candle testable | confirmation linkage (EA-side) | ordering offline; confirmation EA-side.
- §3.6 | touch testable both ways | nothing (a permission) | future gates accept both.
- §3.7 | none (invalLevel ≠ stop) | stop-reference join | no stop placement.
- §9.9 | startT/createT, age computable | nothing | age-blind selection supported.
- §9.10 | zones+history for ANY-depth walk | the corrected window (unbuilt) | fix material, never fix.
- §9.11 | nothing countable | depth itself | never pick a number.
- §10 | design constraint | nothing | permission never rejection.

## R4 WORD REVIEW (evidence preservable; readings stay parked per B-92)

- 2 June (`skill:178`, 14:20 + counted candle): zones+promoT+validity per bar per XOB — penetration/touch + relevance order inspectable.
- 4 June (`skill:198` + bias/CQD): same XOB evidence; bias/CQD separate (buffers 2/6).
- XOBSUIT-a3 (`FINDING:91-94`): zone+validity; SL leg EA-side (inputs exist, verdict doesn't).
- B-91 (`skill:202`/`skill:204`): honored by construction (rows never split retrace/touch).

## R5 LIMITS (all confirmed)

- One run + one segment (61072/288; adjacency in-segment). No cross-run identity (B-95). One UJ day ≠ all sessions/feeds (65 passes ungraded). Prints never substituted (file census). No behavior changed (additive diff + restore).

## RECORD LINES (exact)

- X1 context §4 appended once: `- B-98-XOB-SPEC-EVIDENCE-REVIEW (planner lesson 2026-10-08, B-98): reviewed the proven diagnostic export against the XOB specification without enabling a trading gate; the next step depends on the contract classification.`
- X2 handoff §3 appended once: `- B-98: reviewed B-97's proven diagnostic export against the XOB specification; no trading gate was enabled.`
- X3 ledger `1243.` appended once (tag `B98-XOB-SPEC-EVIDENCE-REVIEW`; provenance, tables, word review, limits, R6, no edit/compile/run/gate).
- X4 pointer 20→20 lines (cap 35): latest B-98 MEASURED; PARTIAL; artifacts unchanged; no compile/runs/gate; next names missing evidence only.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1242.` = 1; staged set = 6 relay files only; no source diff; no run tables.
- R6: `EVIDENCE-CONTRACT-PARTIAL` — missing for register-wide review: cross-run identity key + same-stamp disambiguation. R7: next names ONLY the missing evidence; no gate from B-97 alone; no reopening B-91 without new evidence.

(End of slice)
