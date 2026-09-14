# BUILDER RELAY v24 — RECON23 graded BLOCKED (owned instrument defect) + build-2 clearance ask (dual-key)

**Relay version: v24. Answers: GPT-v23-S2-001 + OPUS-V23-CLR-01 (both
executed: one build e5a5cc24 + one run RECON23-STAGE2 DONE=PASSED
2026-09-14 17:45:42; grading below). Ruling-IDs requested in both returns.**
**Single live relay, identical content to BOTH models. Paste whole.
NOTHING builds, runs, or commits on this relay.**

## §0. Standing context (compact — the whole arc in one paragraph)

Alert-only EA must reproduce his manual strategy as-is (side, entry
bar, stop, target; take iff unrounded R>=1.0 on Dukascopy). His rules:
TF rows read HTF-bias-only ({1H,15m} proven by his Sep-8 screenshot),
MR rows most-recent-sweep-only (spec §3.2, restatement §1); stop
1-away with imbalance / 2-away without + wick nuance; a swing is the
three-candle middle extreme (spec §3.7 — the 5-bar window was a
builder/council rendering, never his number); filed stops authoritative
(R1 1.16508@06:30, R3 1.15847@15:30, R4 1.16098@08:40, R5 FILED
1.16239@16:15, S1 1.16258@09:40; S2 TP gap). Frozen baseline RECON17.
Stage-1 (limbs_v2 shadow + seat discriminator + side provenance)
accepted by both streams. Stage-2 froze S2-1–S2-7 (limbs ship as the
selection enumeration; S-A origin anchors R1 09:55 / R5 16:30 / S1
09:40 / S2 16:20, UPPER bound; F3 row-local resolver with loud
mismatch invariant and empty override table; SCOPED_EXCEPTIONS table
EMPTY; F4 byte-identity-only refactor + stop funnel; three-candle M5
probe) with the 7+1 prediction rule P1–P8 and builder C1–C5 naming
return (single pass; HALT-NEWCLASS default; heartbeat rows; gating
assert; OPEN-SPEC-DIVERGENCE rule). Both streams cleared by name;
operator spent the ~1h run word.

## §1. RECON23 result: BLOCKED on a builder instrument defect (owned)

The run PASSED (Test passed 0:46:42; 3168 bars / 563338 ticks; archive
50836 lines SHA 6d59f7d0 bounds [205308..256143] contiguous; purity
farm-off/Core-04/Test-passed; MAXLEN=537=cap; signals 4/4; no
leftover). Grading is BLOCKED: the builder left TWO wirings
unconnected (measured, both quoted): (a) the anchor global `g_s2_tO`
is assigned nowhere (repo grep returns only its init — the seat
printer computed anchors but never published them, so no walk ever
anchored); (b) the walk count `n` was never routed to the limb cells
(EA line 2962 still reads snapshot counts while the reader serves
cell rows), so walks read stale/neighbor-cell memory — signature:
stops landing on ancient foreign rows (R1→04:40, R5→00:40, S1→05:05),
which a correct-cell walk cannot produce (it breaks at the legacy
pair first). Consequence, applied as written: P1/P2/P3/P5/P6-reseat =
UNGRADABLE (void, explicitly not fail — the instrument is broken, so
no design conclusion follows). No halt condition was tripped by
design behavior; the builders' own gate (measure-before-belief) caught
it at grade time. Full proof + void-family list in
`BUILDER_RESULT_RECON23-STAGE2.md` (on disk with the run).

## §2. Clean record (bypasses the walk; separately verified; stands)

- Enumeration + isolation byte-identical vs RECON22: SEL60 14/14 +
  FINAL 892/0; SEL60END 14/14 (F4 oracle-a holds); SEL52 census 14376;
  SLIMB 481×3, SLIMBR 10, SLEXT1/45/47, SEL55 5/5, ORIGINREG 5,
  OrderSend 0, adopt false. Live path untouched.
- Seats 14/14: all four anchors wired+printed with M5 membership;
  S1/M5 = 09:40 itself, lineage F2, no HALT-NEWCLASS. P6-origin PASSES.
- Sides 7/7: R3 MR-sweep→LONG, R4/R5/S1 TF-unanimous→their pinned
  sides, all decline=0 — the DECIDED Sep-8 S1 flip LANDED. R1
  TF-split (code 15m bull vs his journal bear) → correct DECLINE, no
  side taken (input divergence, same family as the R2-CQD one).
  R2/S2 abstain as designed; S2 branch reads split (it would decline
  even if TF-classified). Invariant/override/independence/live rows
  all nominal (declines=1, promo 0, overturn 0, overrides 0,
  live 56/56/0).
- Funnel: 599 stamps, zero duplicates (one-writer holds); 4
  candidate scope-violations, all poll-site off-example bars, chosen
  stops verified protective off-log; first-leg side-validity uncarried
  (caveat filed; closed by build-2 aux below).
- Probe 14/14: R5-lower PRESENT@16:15 (his filed level EXISTS at his
  width — mechanism alive; C5 antecedent needs P5-retained so no
  divergence line, both filed instead); R4-lower PRESENT@08:40 while
  platform-Fractals sees nothing there (the miss was the rendering
  width, not his rule — reported, no extension); S1-upper@09:40 and
  S2-upper@16:20 PRESENT; directionals sane throughout. P8 PASSES.
- P7: S1-flip PASSES; S2 undecided → FAIL-WITH-GAP (pre-registered).

## §3. Build-2 (quoted verbatim — the ONLY delta vs e5a5cc24)

Seven insertions + one global, nothing else touched (pre-hash
e5a5cc24 verified before editing; diff-verified + parity re-audited +
0/0 post-build per the v15 precedent):
```
L1 (SrjSelVariant, replaces `int n = isH1 ? g_sel_h1N : g_sel_m5N;`):
   int n = (g_s2_on == 1 && g_s2_cExi >= 0) ? g_s2a_N[g_s2_cExi * 2 + g_s2_cTF] : (isH1 ? g_sel_h1N : g_sel_m5N);
L2 (new global beside g_s2_tO):   datetime g_s2_tOByExi[7];
L3 (S2BuildAll, per bar after SrjSelEntry success):
   { string s2ab = ""; g_s2_tOByExi[e] = S2Anchor(exID, s2ab); }
L4 (SrjSelForceEval bar loop):   g_s2_tO = g_s2_tOByExi[e];
L5 (SrjSelEndOfRun beside g_s2_on = 0):   g_s2_tO = 0;
L6 (S2Scope2Swing gains first-leg validity: signature becomes
   (imbBuf, swBuf, dir, entryPx, firstShift, chosenShift, aux); reads
   firstVal via swBuf; sideOk = protective(dir, firstVal, entryPx);
   aux carries f1/chosen/fval/sideOk; PURE iff (fi==1 && sideOk)).
L7 (4478 call site): passes (slimb_imbBuf, bufIdx, dir, slCurPx,
   firstShift, s, s2_aux).
```
(L1–L5 restore the frozen design exactly as cleared; L6–L7 close the
§6 caveat with operands already in scope. No prediction, gate, width,
or scope changes. Failure modes if the fix is wrong are all
self-reporting: P-grades HALT per the frozen rule.)

## §4. Asks

**Ask 1:** Accept §1–§2 (BLOCKED stands; clean record stands; void
families stay void — no laundering).
**Ask 2:** CLEAR build-2 BY NAME (the seven lines above, nothing else)
for ONE build + ONE rerun, same ini/range, ceiling 90 (~1h operator
cost flagged now, spent only on dual-key + his word).
**Ask 3:** CONFIRM nothing commits (RECON17 frozen; e5a5cc24 stays
uncommitted; build-2 stays uncommitted without a token) and no third
run on any other terms (timeout ⇒ REPORT+HALT per both streams' rule).
Ruling-IDs requested in both returns.
