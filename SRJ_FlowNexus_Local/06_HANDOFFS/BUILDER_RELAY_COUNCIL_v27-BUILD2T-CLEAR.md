# BUILDER RELAY v27 — build-2 TN unified clearance ask (dual-key)

**Relay version: v27. Answers: GPT-V26-S2-CLR-001 (no key: four
artifact defects) + Opus v26 review (no Ruling-ID; review-only with
B1–B3 + should-resolve items). Both filed verbatim; nothing built/
run/committed on either.**
**Clearance protocol, briefed identically to both streams: this
project clears work by dual-key. EACH stream rules the full relay. A
build/run key = the words CLEAR plus the artifact name in your return.
BOTH streams must name the IDENTICAL artifact; the operator then
spends the run word. Returns without those words are graded as code
review (valued, non-clearing). Ruling-IDs requested in both returns.**
**Single live relay, identical content to BOTH models. Paste whole.
NOTHING builds, runs, or commits on this relay.**

## S0. Standing context (compact)

Alert-only EA must reproduce his manual strategy as-is (side, entry
bar, stop, target; take iff unrounded R>=1.0 on Dukascopy). His rules:
TF rows read HTF-bias-only ({1H,15m} proven by his Sep-8 screenshot),
MR rows most-recent-sweep-only (spec S3.2, restatement S1); stop
1-away with imbalance / 2-away without + wick nuance; a swing is the
three-candle middle extreme (spec S3.7); filed stops authoritative
(R1 1.16508@06:30, R3 1.15847@15:30, R4 1.16098@08:40, R5 FILED
1.16239@16:15, S1 1.16258@09:40; S2 TP gap). Frozen baseline RECON17.
Stage-2 (S2-1–S2-7 + P1–P8) ran RECON23-STAGE2 DONE=PASSED 2026-09-14
(archive 50836 lines SHA 6d59f7d0; build e5a5cc24 uncommitted) and
graded BLOCKED on an owned two-wire instrument defect (anchor never
published; walk count never routed) — P1/P2/P3/P5/P6-reseat VOID,
clean record standing (D1, D3, SEAT 14/14, SIDE 7/7 with decided S1
flip, funnel 599/0 structural, probe 14/14, summaries nominal; full
proof in `BUILDER_RESULT_RECON23-STAGE2.md`). v25 asked build-2' (L+M)
clearance: Astra keyed nothing (3 gaps); Opus keyed a different
artifact (build-2" with A1–A7). v26 unified as build-2" (L1'/M0'–M5
+ per-cell generation): Astra found four literal defects (below, all
valid); Opus reviewed B1–B3 + should-resolve items while disclaiming
key authority (roster question with the operator, not in this relay).
v27 closes every numbered point from both returns in ONE artifact,
`build-2 TN`, quoted whole in S2. No strategy, prediction, gate,
width, scope, or live-behavior change anywhere in v27.

## S1. Every numbered point closed (evidence first, then the line)

**Astra-1 + Opus-B1 (s2_cellIdx typo — builder defect, owned).** v26
declared `s2_cellIdx` and read `s2cellIdx` three times: does not
compile as written, both catches valid. v27 spells `s2_cellIdx`
uniformly (L1" + M2" re-quoted whole below; verified character by
character at filing; re-verified by grep at build parity).
**Astra-2 (cursor components + L1 timing).** L1" validates
`0 <= cExi <= (S2A_CELLS/2-1)` and `0 <= cTF <= 1` BEFORE computing the
cell (TF-aliasing closed: an invalid TF can no longer address a valid
cell). THEN flat-index/stamp/generation/sentinel checks. Dominance
proof abandoned as ordered: M2 sits after the count use, so it cannot
dominate L1 — the guard lives AT L1". Legit-0 (N=0 with generation
match) walks empty with NO halt line — distinct from unmaterialized
(−1) by construction, as required.
**Astra-3 (M3' quoted).** M3' is its own item below: writer
(`g_s2_stampD = D;` ForceEval beside L4) + reset (`g_s2_stampD = 0;`
EndOfRun beside L5'). Dump writer stays dropped (A4).
**Astra-4 (dump generation).** M5' compares the cell generation
against the dump's OWN `D` parameter (`g_s2_cellD[s2_dcell] != D` →
STALE_CELL HALT): authoritative expected generation with no consumer
stamp written (the sharper of the two offered closures). Sentinel-only
read retired.
**Opus-B2 (bar slot vs exID — answered, not recoded).** `e` is the
bars[] loop index AND exID by one construction: identical 7-literals
in Shadow/BuildAll/ForceEval/Seat (byte-comparable), exi passed
explicitly as `e` (SrjLimbsBarTF(e,…), S2MaterializeCell(e,…)),
dump resolves exID→exi via the pure S2ExiOf. L3' writes DISTINCT
cells per iteration (`e*2`, `e*2+1`), so after BuildAll cell (e,*)
holds bar e's own D — the "last bar wins every cell" reading would
require all iterations to write one cell, which the quoted L3' text
refutes line by line (table: cells 0/1←R1 D=08-28 10:05 … 12/13←S2
D=09-08 17:00). Generation equality therefore holds on all seven
bars, not the last. Runtime cross-checks (M4' + per-cell equality)
would trip any skew regardless.
**Opus-B3 (L2/M3' unquoted).** L2 is the globals line (re-quoted);
M3' is its own item (above). Ask 2's inventory and S2's quotes now
match one to one (audited at filing: L1"/L2/L3'/L4/L5'/L6"/L7' +
M0'/M1'/M2"/M3'/M4'/M5' + three globals).
**Reachability (L1" callers enumerated, read-measured):**
SrjSelVariant has EXACTLY two call sites (ForceEval EA:3110 with stamp
set per bar before the call; Census EA:3178 with g_s2_on==0, legacy
branch, stamp unchecked by design). SrjSelProjectH1() (EA:3951) fills
projections and never calls the walk. S2RowRead callers post-M5':
variant trace + variant main only (dump reads direct). No unenumerated
path reaches EA:2962 with g_s2_on==1.
**Dump cursor (save/restore ADDED to M5').** After the TF loop:
`g_s2_cExi = -1; g_s2_cTF = 0;` (no-cursor state; any stray s2 read
then fails the `>= 0` guard loudly). dex<0 path (unreachable on the
frozen seven — S2ExiOf is total over them): explicit STALE_CELL HALT,
never a silent legacy read.
**M4' write guarantee.** L3' loop body = SrjSelEntry-continue +
anchor-assign + materialize×2 + cellD writes, no other branch. The
frozen seven always satisfy SrjSelEntry (pure total lookup; all seven
ran RECON22/23 through every driver), so L3' executes 7/7; a skipped
bar skips Seat's M4' identically (same bars[], same lookup) — no
orphan compare exists. Matching zeros legitimate (Astra-3's own rule).
**L6" comment corrected (logic byte-identical to L6').** The old note
overstated the invariant: unreadable imbalance (fi==-1) takes the
fallthrough IN_SCOPE on a decision-neutral diagnostic path. The new
note says exactly that; the predicate text is untouched (cosmetic per
the review's own scoping — no freelance tightening in a repair).
**M2" constants derived.** Bounds expressed via S2A_CELLS
(`S2A_CELLS/2-1`, `S2A_CELLS`); TF domain `0..1` literal with the
binary-domain rationale inline.
**P-c (restated binding).** mark-and-continue: a tester hard-stop
would corrupt the archive and kill the end-of-run oracles the grade
depends on. Consequence: ANY SEL61HALT emission → run VOID, except a
row whose filed stop is also missed → FAIL on that row (adopted).

## S2. build-2 TN (quoted verbatim — the ONLY delta vs e5a5cc24)

Globals (beside `datetime g_s2_tO = 0;`):
`datetime g_s2_tOByExi[7];` `datetime g_s2_stampD = 0;` `datetime g_s2_cellD[S2A_CELLS];`
L1" (replaces EA:2962 `int n = isH1 ? g_sel_h1N : g_sel_m5N;`):
`int n = isH1 ? g_sel_h1N : g_sel_m5N;` `if(g_s2_on == 1) { bool s2_ok = false; if(g_s2_cExi >= 0 && g_s2_cExi <= (S2A_CELLS / 2 - 1) && g_s2_cTF >= 0 && g_s2_cTF <= 1) { int s2_cellIdx = g_s2_cExi * 2 + g_s2_cTF; if(s2_cellIdx >= 0 && s2_cellIdx < S2A_CELLS && g_s2_stampD > 0 && g_s2_stampD == g_s2_cellD[s2_cellIdx] && g_s2a_N[s2_cellIdx] >= 0) { n = g_s2a_N[s2_cellIdx]; s2_ok = true; } } if(!s2_ok) { n = -2; g_s2_haltNC = 1; string s2_haltLn = "[SRJ-EA] SEL61HALT kind=STALE_CELL"; LwAudit("SEL61HALT", s2_haltLn); Print(s2_haltLn); } }`
L2 (new global, quoted above): `datetime g_s2_tOByExi[7];`
L3' (S2BuildAll per bar, unchanged from v26): `{ string s2ab = ""; g_s2_tOByExi[e] = S2Anchor(exID, s2ab); }` + `S2MaterializeCell(e, 0); S2MaterializeCell(e, 1);` + `g_s2_cellD[e * 2] = D; g_s2_cellD[e * 2 + 1] = D;`
L4 (ForceEval bar loop beside cursor set): `g_s2_tO = g_s2_tOByExi[e];`
M3' (stamp writer + reset, own item): ForceEval beside L4 append `g_s2_stampD = D;`; EndOfRun beside L5' append `g_s2_stampD = 0;`.
L5' (EndOfRun before `SrjSelProjectH1();`): `g_s2_tO = 0; g_s2_stampD = 0;` + `ArrayInitialize(g_s2_tOByExi, 0);`
M0' (new globals, quoted above): `datetime g_s2_stampD = 0;` `datetime g_s2_cellD[S2A_CELLS];`
M1' (S2BuildAll top): `for(int s2c = 0; s2c < S2A_CELLS; s2c++) { g_s2a_N[s2c] = -1; g_s2_cellD[s2c] = 0; }`
M2" (S2RowRead s2-branch, replaces body): `{ int s2_rcell = g_s2_cExi * 2 + g_s2_cTF; if(g_s2_cExi > (S2A_CELLS / 2 - 1) || g_s2_cTF < 0 || g_s2_cTF > 1 || s2_rcell < 0 || s2_rcell >= S2A_CELLS || g_s2_stampD <= 0 || g_s2_stampD != g_s2_cellD[s2_rcell] || g_s2a_N[s2_rcell] < 0) { g_s2_haltNC = 1; string s2_haltLn2 = "[SRJ-EA] SEL61HALT kind=STALE_CELL"; LwAudit("SEL61HALT", s2_haltLn2); Print(s2_haltLn2); cT = 0; rU = EMPTY_VALUE; rL = EMPTY_VALUE; repT = 0; repA = 0; return; } int base = s2_rcell * S2A_CAP; cT = g_s2a_T[base + i]; rU = g_s2a_U[base + i]; rL = g_s2a_L[base + i]; repT = g_s2a_P[base + i]; repA = g_s2a_A[base + i]; return; }`
M4' (SeatForceEval beside tO compute, unconditional): `if(g_s2_tOByExi[e] != tO) { g_s2_haltNC = 1; string s2_am = "[SRJ-EA] SEL61HALT kind=ANCHOR_MISMATCH"; LwAudit("SEL61HALT", s2_am); Print(s2_am); }`
M5' (dump: guarded count + direct reads + cursor restore): n-block becomes `int n = isH1 ? g_sel_h1N : g_sel_m5N; int s2_dcell = -1; if(g_s2_on == 1 && dex >= 0) { g_s2_cExi = dex; g_s2_cTF = TF; s2_dcell = dex * 2 + TF; if(s2_dcell < 0 || s2_dcell >= S2A_CELLS || g_s2_cellD[s2_dcell] != D || g_s2a_N[s2_dcell] < 0) { g_s2_haltNC = 1; string sd57 = "[SRJ-EA] SEL61HALT kind=STALE_CELL"; LwAudit("SEL61HALT", sd57); Print(sd57); n = -2; } else n = g_s2a_N[s2_dcell]; } else if(g_s2_on == 1) { g_s2_haltNC = 1; string sd57b = "[SRJ-EA] SEL61HALT kind=STALE_CELL"; LwAudit("SEL61HALT", sd57b); Print(sd57b); n = -2; }`
row-read becomes `if(g_s2_on == 1 && dex >= 0 && n >= 0) { int s2o = s2_dcell * S2A_CAP + i; cT = g_s2a_T[s2o]; rU = g_s2a_U[s2o]; rL = g_s2a_L[s2o]; repT = g_s2a_P[s2o]; repA = g_s2a_A[s2o]; } else S2RowRead(i, isH1, cT, rU, rL, repT, repA);`
restore after the TF loop closes: `g_s2_cExi = -1; g_s2_cTF = 0;`
(listN=-2 marks guard-trips unambiguously; legit-0 stays listN=0.)
L6" (scope helper; logic identical to L6', comment corrected):
`string S2Scope2Swing(const int imbBuf, const int swBuf, const ENUM_SRJ_DIR dir, const double entryPx, const int firstShift, const int chosenShift, string &aux)` `{ g_s2_nScopeRows++; double f = 0.0; int fi = -1; if(firstShift >= 0 && ReadFlow(imbBuf, f, firstShift) && f != EMPTY_VALUE) fi = (int)f; double c = 0.0; int ci = -1; if(chosenShift >= 0 && ReadFlow(imbBuf, c, chosenShift) && c != EMPTY_VALUE) ci = (int)c; double fv = EMPTY_VALUE; int sok = -1; if(firstShift >= 0) { double fr = 0.0; if(ReadFlow(swBuf, fr, firstShift) && fr != EMPTY_VALUE) fv = fr; } if(fv != EMPTY_VALUE && fv > 0.0) sok = SlimbProtectiveSideOk(dir, fv, entryPx) ? 1 : 0; aux = StringFormat("f1=%d chosen=%d fval=%s sideOk=%d", fi, ci, (sok == -1 ? "-" : DoubleToString(fv, _Digits)), sok); if(fi == 1 && sok == 1 && !S2ScopeTable()) { g_s2_nScopeViol++; return "OUT_OF_SCOPE_VIOLATION"; } if(fi == 1 && sok != 1) return "UNGROUNDED_REPORT"; return "IN_SCOPE"; }`
(note: unreadable imbalance fi==-1 takes the fallthrough IN_SCOPE on
the decision-neutral diagnostic path (C-d hatch scope); unknown swing
(sok==-1) and non-protective first leg report UNGROUNDED, never
violation, never default-IN_SCOPE. Predicate text unchanged from L6'.)
L7' (4478 site, A1 hoist, unchanged): `string s2_aux = "";` `string s2_scope = S2Scope2Swing(slimb_imbBuf, bufIdx, dir, slCurPx, firstShift, s, s2_aux);` `S2StampStop(site, barShift, "SLREF_2SWING", 1, slRefOut, (int)slModeOut, s2_scope, s2_aux);`
Funnel balance (nine other stamps) rides as built, verified identical
post-build by diff. Pre-hash e5a5cc24 + exact-diff + parity (single
definitions, HAND-grep gate, no new price literal, OrderSend-src 0,
identifier-spelling grep incl. s2_cellIdx/s2_rcell/s2_dcell/s2o/s2ab)
+ compile 0/0 EA+Flow required at build.

## S3. Asks + binding grading rules

**Ask 1:** Accept S1 (BLOCKED + void list + clean record + S6 split +
closures above with on-disk evidence).
**Ask 2:** CLEAR `build-2 TN` BY NAME (S2 whole: L1"/L2/L3'/L4/L5'/
L6"/L7' + M0'/M1'/M2"/M3'/M4'/M5' + three globals, nothing else) for
ONE build + ONE rerun, same ini/range, ceiling 90 (~1h operator cost
flagged now, spent only on dual-key + his word).
**Ask 3:** CONFIRM nothing builds/runs/commits until BOTH streams name
`build-2 TN` + operator run word; RECON17 frozen; e5a5cc24 uncommitted;
build-2 TN uncommitted without a token; no third run; timeout
REPORT+HALT. Ruling-IDs requested in both returns.
Grading (binding, adopted): enumerated oracles only (14 / 892 / 14376
/ 481 / 10 / 5 / 1 / 0 — archive SHA/count are NOT oracles); void/fail
cuts both ways incl. STALE/ANCHOR→VOID-except-filed-miss→FAIL;
landing table vs five filed stops + S2 gap with the RECON23 void list
restated; scope re-measured fresh; P-c mark-and-continue as declared.
