# BUILDER RELAY v26 — build-2″ unified clearance ask (dual-key)

**Relay version: v26. Answers: GPT-V25-S2-CLR-001 (no key: three
instrumentation-integrity gaps) + OPUS-V25-CLR-02 (key on build-2″
with A1–A7 + P-a–P-e). Both filed verbatim; nothing built/run/
committed on either.**
**Single live relay, identical content to BOTH models. Paste whole.
NOTHING builds, runs, or commits on this relay. Ruling-IDs requested
in both returns.**

## §0. Why v26 exists (one paragraph)

Stage-2 (S2-1–S2-7 + P1–P8) ran RECON23-STAGE2 DONE=PASSED but graded
BLOCKED on an owned two-wire instrument defect (anchor never
published; walk count never routed to cells) — P1/P2/P3/P5/P6-reseat
VOID, clean record standing (filed: `BUILDER_RESULT_RECON23-STAGE2.md`;
archive 50836 lines SHA 6d59f7d0). v24 asked build-2′ clearance: Astra
accepted the record but CLEARED NOTHING (M2 freshness/generation,
M2-too-late-for-L1, M4-conditional); Opus cleared a DIFFERENT artifact
(`build-2″` = build-2′ + A1–A7 + P-a–P-e filed). The two positions do
not conflict — Astra's three gaps are a subset of Opus's seven
amendments in different words (freshness/generation = A3+C-b;
L1-before-guard = A7+C-b; unconditional-compare = A5+C-b). v26 quotes
ONE unified artifact, `build-2″`, that satisfies every numbered
demand from both returns simultaneously. No strategy, prediction,
gate, width, scope, or live-behavior change anywhere in v26.

## §1. Every numbered demand answered (evidence on disk, zero build)

**C-a receipts** (writer → reader, e5a5cc24 line numbers read-verified):
`g_s2_tOByExi` W=L3 (S2BuildAll bar loop) → R=L4 (ForceEval bar loop);
`g_s2a_N` W=`g_s2a_N[cell] = w;` (EA:3636) → R=L1 (EA:2962) + dump
(EA:3065); `g_s2_tO` W=L4/L5 → R=variant anchor line (existing);
`s2_aux` W=S2Scope2Swing body (EA:3784) → R=same-statement stamp arg
(EA:4928) — this last receipt IS A1's hazard (see fix).
**C-b** needs code → M0′–M3′ + M5 below (no dominance proof offered:
M2 sits after the count use, so it cannot dominate L1 — guard chosen).
**C-c (i)** S2Anchor output-pure PROVEN (EA:3652 body quoted whole in
v25: string assigns + StringToTime + returns; zero prints/counters/
globals/buffer reads). **(ii)** M4′ asserts recompute-vs-storage live.
**C-d** escape hatch OPEN (measured: scope strings consumed ONLY by
stamp args + summary counters, zero decision consumers) → L6′
tightened + UNKNOWN + `fv <= 0.0` guard (A2) as aux carriage.
**C-e** RESOLVED: EA:4856 `bufIdx` IS the direction-selected swing
buffer; L6 7-vs-L7 7 positions align; slCurPx/dir function-scope at
the site (EA:4612).
**P-a** PROVEN: S2MaterializeCell has no early return (drop path is
`continue`); `g_s2a_N[cell] = w;` executes unconditionally → legit-0
written, distinct from M1′'s −1.
**P-b** PROVEN: ReadBuf1 (EA:1799, read whole: CopyBuffer + assign +
bool, zero side effects) + ReadFlow (single-expression wrapper over
it, region unedited by stage-2) → L6′'s new reads cannot move the
archive.
**P-c** PRE-DECLARED: mark-and-continue. Rationale: a hard stop
corrupts the archive and kills the end-of-run oracles the grade
depends on. Consequence (binding): ANY SEL61HALT emission (STALE_CELL
/ ANCHOR_MISMATCH / HALT-NEWCLASS) makes the run VOID — except on a
row whose filed stop is also missed, which is FAIL on that row (Opus
rerun rule, adopted verbatim).
**P-d** MOOT BY CONSTRUCTION: per-cell generation markers (M0′/M1′/L3′
produce, L1′/M2′ compare) make freshness cadence-independent; order
cited anyway (EndOfRun EA:3955 BuildAll → 3956 Seat → 3958/59
ForceEval → 3960 gates → 3961 Census).
**P-e** PROVEN: every `for(int e = 0; e < 7; e++)` in the S2 paths
(EA:3092/3478/3490/3496/3642/3666/3729/3853); L3′/L4/M4′ all sit
inside such loops; bars[] order shared (Shadow/Build/Force/Seat/Dump
use the identical 7-literal).
**Opus rerun grading rules ADOPTED VERBATIM** (enumerated oracles only;
void/fail both ways incl. STALE/ANCHOR→VOID-except-filed-miss→FAIL;
landing table vs five filed stops + S2 gap with the RECON23 void list
restated; scope re-measured fresh; archive SHA/count are NOT oracles).
Preference declined as offered (C-b + C-c cover the surface).

## §2. build-2″ (quoted verbatim — the ONLY delta vs e5a5cc24)

Globals (M0′ beside `datetime g_s2_tO = 0;` + L2):
`datetime g_s2_tOByExi[7];` `datetime g_s2_stampD = 0;` `datetime g_s2_cellD[S2A_CELLS];`
L1′ (replaces EA:2962 `int n = isH1 ? g_sel_h1N : g_sel_m5N;`):
`int s2_cellIdx = g_s2_cExi * 2 + g_s2_cTF;` `int n = isH1 ? g_sel_h1N : g_sel_m5N;`
`if(g_s2_on == 1) { n = -2; if(g_s2_cExi >= 0 && s2_cellIdx >= 0 && s2_cellIdx < S2A_CELLS && g_s2_stampD > 0 && g_s2_stampD == g_s2_cellD[s2cellIdx] && g_s2a_N[s2cellIdx] >= 0) n = g_s2a_N[s2cellIdx]; else { g_s2_haltNC = 1; string s2_haltLn = "[SRJ-EA] SEL61HALT kind=STALE_CELL"; LwAudit("SEL61HALT", s2_haltLn); Print(s2_haltLn); } }`
(guard BEFORE the array access (Astra-2/A7); legit-0 (N=0, gen match)
walks empty with NO halt line — distinct from unmaterialized (−1);
n=-2 skips the loop → def=0 fails the control grade AND logs HALT:
loud in log and at grade, never silent.)
L3′ (S2BuildAll per bar, extends L3): `{ string s2ab = ""; g_s2_tOByExi[e] = S2Anchor(exID, s2ab); }` + `S2MaterializeCell(e, 0); S2MaterializeCell(e, 1);` + `g_s2_cellD[e * 2] = D; g_s2_cellD[e * 2 + 1] = D;`
L4 (ForceEval bar loop beside cursor set): `g_s2_tO = g_s2_tOByExi[e];` + `g_s2_stampD = D;` (writer = authoritative consumer path only; dump writer DROPPED per A4).
L5′ (EndOfRun before `SrjSelProjectH1();`): `g_s2_tO = 0; g_s2_stampD = 0;` + `ArrayInitialize(g_s2_tOByExi, 0);` (A6 literal).
M1′ (S2BuildAll top): `for(int s2c = 0; s2c < S2A_CELLS; s2c++) { g_s2a_N[s2c] = -1; g_s2_cellD[s2c] = 0; }`
M2′ (S2RowRead s2-branch, replaces body): range + stamp + generation +
sentinel, else STALE_CELL HALT with zero/EMPTY return (rides the
existing `repT == 0` skip with no skip inflation):
`{ int s2_rcell = g_s2_cExi * 2 + g_s2_cTF; if(g_s2_cExi > 6 || g_s2_cTF < 0 || g_s2_cTF > 1 || s2_rcell < 0 || s2_rcell >= S2A_CELLS || g_s2_stampD <= 0 || g_s2_stampD != g_s2_cellD[s2_rcell] || g_s2a_N[s2_rcell] < 0) { g_s2_haltNC = 1; string s2_haltLn2 = "[SRJ-EA] SEL61HALT kind=STALE_CELL"; LwAudit("SEL61HALT", s2_haltLn2); Print(s2_haltLn2); cT = 0; rU = EMPTY_VALUE; rL = EMPTY_VALUE; repT = 0; repA = 0; return; } int base = s2_rcell * S2A_CAP; cT = g_s2a_T[base + i]; rU = g_s2a_U[base + i]; rL = g_s2a_L[base + i]; repT = g_s2a_P[base + i]; repA = g_s2a_A[base + i]; return; }`
M4′ (SeatForceEval beside tO compute, UNCONDITIONAL per A5/Astra-3):
`if(g_s2_tOByExi[e] != tO) { g_s2_haltNC = 1; string s2_am = "[SRJ-EA] SEL61HALT kind=ANCHOR_MISMATCH"; LwAudit("SEL61HALT", s2_am); Print(s2_am); }`
M5 (dump s2-path direct reads, no S2RowRead, no stamp write per A4):
n-expression becomes `int n = isH1 ? g_sel_h1N : g_sel_m5N; int s2_dcell = -1; if(g_s2_on == 1 && dex >= 0) { g_s2_cExi = dex; g_s2_cTF = TF; s2_dcell = dex * 2 + TF; if(s2_dcell < 0 || s2_dcell >= S2A_CELLS || g_s2a_N[s2_dcell] < 0) { g_s2_haltNC = 1; string sd57 = "[SRJ-EA] SEL61HALT kind=STALE_CELL"; LwAudit("SEL61HALT", sd57); Print(sd57); n = -2; } else n = g_s2a_N[s2_dcell]; }`
and the row-read line becomes `if(g_s2_on == 1 && dex >= 0 && n >= 0) { int s2o = s2_dcell * S2A_CAP + i; cT = g_s2a_T[s2o]; rU = g_s2a_U[s2o]; rL = g_s2a_L[s2o]; repT = g_s2a_P[s2o]; repA = g_s2a_A[s2o]; } else S2RowRead(i, isH1, cT, rU, rL, repT, repA);`
(cursor derives from the row's own exID via S2ExiOf — self-proving,
no stamp needed; listN=-2 marks guard-trips unambiguously.)
L6′ (scope helper, tightened per hatch + A2 guard + UNKNOWN):
`string S2Scope2Swing(const int imbBuf, const int swBuf, const ENUM_SRJ_DIR dir, const double entryPx, const int firstShift, const int chosenShift, string &aux)` `{ g_s2_nScopeRows++; double f = 0.0; int fi = -1; if(firstShift >= 0 && ReadFlow(imbBuf, f, firstShift) && f != EMPTY_VALUE) fi = (int)f; double c = 0.0; int ci = -1; if(chosenShift >= 0 && ReadFlow(imbBuf, c, chosenShift) && c != EMPTY_VALUE) ci = (int)c; double fv = EMPTY_VALUE; int sok = -1; if(firstShift >= 0) { double fr = 0.0; if(ReadFlow(swBuf, fr, firstShift) && fr != EMPTY_VALUE) fv = fr; } if(fv != EMPTY_VALUE && fv > 0.0) sok = SlimbProtectiveSideOk(dir, fv, entryPx) ? 1 : 0; aux = StringFormat("f1=%d chosen=%d fval=%s sideOk=%d", fi, ci, (sok == -1 ? "-" : DoubleToString(fv, _Digits)), sok); if(fi == 1 && sok == 1 && !S2ScopeTable()) { g_s2_nScopeViol++; return "OUT_OF_SCOPE_VIOLATION"; } if(fi == 1 && sok != 1) return "UNGROUNDED_REPORT"; return "IN_SCOPE"; }`
(PURE needs fi==1 AND protective; UNKNOWN/non-protective report
UNGROUNDED — never violation, never default-IN_SCOPE. Diagnostic-only
per the open hatch.)
L7′ (4478 site, A1 hoist):
`string s2_aux = "";` `string s2_scope = S2Scope2Swing(slimb_imbBuf, bufIdx, dir, slCurPx, firstShift, s, s2_aux);` `S2StampStop(site, barShift, "SLREF_2SWING", 1, slRefOut, (int)slModeOut, s2_scope, s2_aux);`
Funnel balance (unchanged in kind): the other nine stamps ride as
built (verified identical post-build by diff).

## §3. Asks

**Ask 1:** Accept §1 (BLOCKED + void list + clean record + §6 split +
C-a–C-e/P-a–P-e answers with on-disk evidence + P-c declaration +
rerun grading rules).
**Ask 2:** CLEAR `build-2″` BY NAME (§2 whole: L1′/L2/L3′/L4/L5′/L6′/
L7′ + M0′/M1′/M2′/M3′/M4′/M5 + the three globals, nothing else) for
ONE build + ONE rerun, same ini/range, ceiling 90 (~1h operator cost
flagged now, spent only on dual-key + his word).
**Ask 3:** CONFIRM nothing builds/runs/commits until BOTH streams name
`build-2″` + operator run word; RECON17 frozen; e5a5cc24 uncommitted;
build-2″ uncommitted without a token; no third run; timeout
REPORT+HALT. Ruling-IDs requested in both returns.
