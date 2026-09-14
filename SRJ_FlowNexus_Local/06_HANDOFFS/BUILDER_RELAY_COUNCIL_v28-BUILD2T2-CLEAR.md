# BUILDER RELAY v28 — build-2 TN2 clearance ask (dual-key)

**Relay version: v28. Answers: GPT-V27-S2-CLR-001 (Astra key on
build-2 TN with two qualifications) + OPUS-V27-RVW-002 (review-only,
no key: V1+V2 blocking + S-a–S-f should-resolve). Both filed verbatim;
nothing built/run/committed on either. Astra's TN key covers the old
text only and does not transfer — fresh key asked below.**
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
graded BLOCKED on an owned two-wire instrument defect — P1/P2/P3/P5/
P6-reseat VOID, clean record standing (D1, D3, SEAT 14/14, SIDE 7/7
with decided S1 flip, funnel 599/0 structural, probe 14/14; full proof
in `BUILDER_RESULT_RECON23-STAGE2.md`). v27 asked build-2 TN: Astra
keyed it with two qualifications; Opus reviewed-only with V1+V2
blocking and S-a–S-f should-resolve. v28 closes all of it in ONE
artifact, `build-2 TN2`, quoted whole in S2. No strategy, prediction,
gate, width, scope, or live-behavior change anywhere in v28.

## S1. Every point closed (fix or answered evidence first)

**V1 (M4' legacy-path halt — fixed structurally, not by s2-wrap).**
Wrapping in `if(g_s2_on == 1)` was rejected: s2 is off during Seat by
construction (EndOfRun sets it only around ForceEval), so that wrap
would deaden the assert. Instead M4" gates on producer generation:
`g_s2_cellD[e * 2] != 0` proves S2BuildAll ran for bar e (cells are
written for all seven bars unconditionally; SrjSelEntry-continue
skips Seat identically, so no orphan compare exists). BuildAll-skipped
→ gate closed → no false halt, in ANY call order.
**V2 (dump save/restore — implemented, prose fixed).** M5" saves on
entry (`s2_svExi/s2_svTF`), restores after the TF loop, and the S1
heading now says save/restore truthfully. dex<0 (unreachable on the
frozen seven — S2ExiOf total) halts explicitly, never reads legacy.
**S-a (i bound — both).** Clamp read-measured on disk (EA:3578
`if(m >= S2A_CAP) { g_s2_drop++; continue; }`): N never exceeds
S2A_CAP, so every correct-loop index is in-bounds; `i < 0 ||
i >= S2A_CAP` added to M2" and M5" row reads anyway (defense in depth,
quoted).
**S-b (tOByExi sizing).** Declaration reads `S2A_CELLS / 2` (GLOBS).
**S-c (globals once).** GLOBS below is the single insertion; L2 names
line 1, M0' names lines 2–3 (map explicit — not three insertions).
**S-d (L6" note).** Corrected to: given fi==1, sok != 1 reports
UNGROUNDED, never violation; fi==-1 takes the fallthrough IN_SCOPE on
the decision-neutral diagnostic path (not carried as proven
invariant). Predicate text byte-identical to v27 L6".
**S-e (M2" lower bound).** `g_s2_cExi < 0 ||` added; guards read
identically now, no argument needed.
**S-f (trip path).** M5" guard-trips set empties directly (no
S2RowRead call, no loop-bound reliance); n=-2 retains the unambiguous
trip marker for the list line.
**B2 (carried answered).** v26-Opus withdrew it on the record (per-cell
destinations distinct; "last bar wins" needs one shared cell). v28
keeps the proof live at runtime (per-cell generation equality on all
seven bars). No code changed on a withdrawn defect.
**B3 (L2/M3' inventory).** L2 = GLOBS line 1; M3' = writer + reset
quoted as its own item; Ask-2 inventory maps 1:1 to §2 quotes
(audited at filing).
**Reachability (enumerated, read-measured).** SrjSelVariant: EXACTLY
two call sites (ForceEval EA:3110 stamp-set per bar before the call;
Census EA:3178 with g_s2_on==0, legacy branch). SrjSelProjectH1()
(EA:3951) fills projections, never calls the walk. Post-M5",
S2RowRead callers = variant trace + variant main only (dump reads
direct). L5' resets precede all fills; nothing consumes between.
**Astra qualifications adopted.** M5" now REALLY save/restores (the
reset-not-restore qualification is superseded, strictly stronger);
L6" note kept with the fi==1-only qualification verbatim.
**Astra F1–F4.** Typo fixed uniformly (`s2_cellIdx` everywhere;
character-verified at filing, grep-promised at parity). F2/F3/F4 as
v27, strengthened above.

## S2. build-2 TN2 (quoted verbatim — the ONLY delta vs e5a5cc24)

GLOBS (beside `datetime g_s2_tO = 0;`, inserted ONCE; L2 = line 1,
M0' = lines 2–3):
`datetime g_s2_tOByExi[S2A_CELLS / 2];` `datetime g_s2_stampD = 0;` `datetime g_s2_cellD[S2A_CELLS];`
L1" (replaces EA:2962 `int n = isH1 ? g_sel_h1N : g_sel_m5N;`):
`int n = isH1 ? g_sel_h1N : g_sel_m5N;` `if(g_s2_on == 1) { bool s2_ok = false; if(g_s2_cExi >= 0 && g_s2_cExi <= (S2A_CELLS / 2 - 1) && g_s2_cTF >= 0 && g_s2_cTF <= 1) { int s2_cellIdx = g_s2_cExi * 2 + g_s2_cTF; if(s2_cellIdx >= 0 && s2_cellIdx < S2A_CELLS && g_s2_stampD > 0 && g_s2_stampD == g_s2_cellD[s2_cellIdx] && g_s2a_N[s2_cellIdx] >= 0) { n = g_s2a_N[s2_cellIdx]; s2_ok = true; } } if(!s2_ok) { n = -2; g_s2_haltNC = 1; string s2_haltLn = "[SRJ-EA] SEL61HALT kind=STALE_CELL"; LwAudit("SEL61HALT", s2_haltLn); Print(s2_haltLn); } }`
L3' (S2BuildAll per bar, unchanged): `{ string s2ab = ""; g_s2_tOByExi[e] = S2Anchor(exID, s2ab); }` + `S2MaterializeCell(e, 0); S2MaterializeCell(e, 1);` + `g_s2_cellD[e * 2] = D; g_s2_cellD[e * 2 + 1] = D;`
L4 (ForceEval bar loop beside cursor set): `g_s2_tO = g_s2_tOByExi[e];`
M3' (stamp writer + reset, own item): ForceEval beside L4 append `g_s2_stampD = D;`; EndOfRun beside L5' append `g_s2_stampD = 0;`.
L5' (EndOfRun before `SrjSelProjectH1();`): `g_s2_tO = 0; g_s2_stampD = 0;` + `ArrayInitialize(g_s2_tOByExi, 0);`
M1' (S2BuildAll top): `for(int s2c = 0; s2c < S2A_CELLS; s2c++) { g_s2a_N[s2c] = -1; g_s2_cellD[s2c] = 0; }`
M2" (S2RowRead s2-branch, replaces body): `{ int s2_rcell = g_s2_cExi * 2 + g_s2_cTF; if(g_s2_cExi < 0 || g_s2_cExi > (S2A_CELLS / 2 - 1) || g_s2_cTF < 0 || g_s2_cTF > 1 || s2_rcell < 0 || s2_rcell >= S2A_CELLS || i < 0 || i >= S2A_CAP || g_s2_stampD <= 0 || g_s2_stampD != g_s2_cellD[s2_rcell] || g_s2a_N[s2_rcell] < 0) { g_s2_haltNC = 1; string s2_haltLn2 = "[SRJ-EA] SEL61HALT kind=STALE_CELL"; LwAudit("SEL61HALT", s2_haltLn2); Print(s2_haltLn2); cT = 0; rU = EMPTY_VALUE; rL = EMPTY_VALUE; repT = 0; repA = 0; return; } int base = s2_rcell * S2A_CAP; cT = g_s2a_T[base + i]; rU = g_s2a_U[base + i]; rL = g_s2a_L[base + i]; repT = g_s2a_P[base + i]; repA = g_s2a_A[base + i]; return; }`
M4" (SeatForceEval beside tO compute): `if(g_s2_cellD[e * 2] != 0 && g_s2_tOByExi[e] != tO) { g_s2_haltNC = 1; string s2_am = "[SRJ-EA] SEL61HALT kind=ANCHOR_MISMATCH"; LwAudit("SEL61HALT", s2_am); Print(s2_am); }`
M5" (dump: guarded count + direct reads + save/restore): top append `int s2_svExi = g_s2_cExi; int s2_svTF = g_s2_cTF;` (before the TF loop); n-block becomes `int n = isH1 ? g_sel_h1N : g_sel_m5N; int s2_dcell = -1; if(g_s2_on == 1 && dex >= 0) { g_s2_cExi = dex; g_s2_cTF = TF; s2_dcell = dex * 2 + TF; if(s2_dcell < 0 || s2_dcell >= S2A_CELLS || g_s2_cellD[s2_dcell] != D || g_s2a_N[s2_dcell] < 0) { g_s2_haltNC = 1; string sd57 = "[SRJ-EA] SEL61HALT kind=STALE_CELL"; LwAudit("SEL61HALT", sd57); Print(sd57); n = -2; } else n = g_s2a_N[s2_dcell]; } else if(g_s2_on == 1) { g_s2_haltNC = 1; string sd57b = "[SRJ-EA] SEL61HALT kind=STALE_CELL"; LwAudit("SEL61HALT", sd57b); Print(sd57b); n = -2; }`
row-read becomes `if(g_s2_on == 1 && dex >= 0 && n >= 0 && i >= 0 && i < S2A_CAP) { int s2o = s2_dcell * S2A_CAP + i; cT = g_s2a_T[s2o]; rU = g_s2a_U[s2o]; rL = g_s2a_L[s2o]; repT = g_s2a_P[s2o]; repA = g_s2a_A[s2o]; } else if(g_s2_on == 1) { cT = 0; rU = EMPTY_VALUE; rL = EMPTY_VALUE; repT = 0; repA = 0; } else S2RowRead(i, isH1, cT, rU, rL, repT, repA);`
restore after the TF loop closes: `g_s2_cExi = s2_svExi; g_s2_cTF = s2_svTF;`
(listN=-2 marks guard-trips; legit-0 stays listN=0; cursor always restored.)
L6" (scope helper; predicate identical to v27 L6", note corrected):
`string S2Scope2Swing(const int imbBuf, const int swBuf, const ENUM_SRJ_DIR dir, const double entryPx, const int firstShift, const int chosenShift, string &aux)` `{ g_s2_nScopeRows++; double f = 0.0; int fi = -1; if(firstShift >= 0 && ReadFlow(imbBuf, f, firstShift) && f != EMPTY_VALUE) fi = (int)f; double c = 0.0; int ci = -1; if(chosenShift >= 0 && ReadFlow(imbBuf, c, chosenShift) && c != EMPTY_VALUE) ci = (int)c; double fv = EMPTY_VALUE; int sok = -1; if(firstShift >= 0) { double fr = 0.0; if(ReadFlow(swBuf, fr, firstShift) && fr != EMPTY_VALUE) fv = fr; } if(fv != EMPTY_VALUE && fv > 0.0) sok = SlimbProtectiveSideOk(dir, fv, entryPx) ? 1 : 0; aux = StringFormat("f1=%d chosen=%d fval=%s sideOk=%d", fi, ci, (sok == -1 ? "-" : DoubleToString(fv, _Digits)), sok); if(fi == 1 && sok == 1 && !S2ScopeTable()) { g_s2_nScopeViol++; return "OUT_OF_SCOPE_VIOLATION"; } if(fi == 1 && sok != 1) return "UNGROUNDED_REPORT"; return "IN_SCOPE"; }`
(note: given fi==1, sok != 1 reports UNGROUNDED, never violation;
unreadable first-leg imbalance fi==-1 takes the fallthrough IN_SCOPE
on the decision-neutral diagnostic path — not carried as proven
invariant. Predicate text unchanged from v27 L6".)
L7' (4478 site, A1 hoist, unchanged): `string s2_aux = "";` `string s2_scope = S2Scope2Swing(slimb_imbBuf, bufIdx, dir, slCurPx, firstShift, s, s2_aux);` `S2StampStop(site, barShift, "SLREF_2SWING", 1, slRefOut, (int)slModeOut, s2_scope, s2_aux);`
Funnel balance (nine other stamps) rides as built, verified identical
post-build by diff. Pre-hash e5a5cc24 + exact-diff + parity (single
definitions incl. s2_cellIdx/s2_rcell/s2_dcell/s2o/s2ab/s2_svExi/
s2_svTF/s2_ok/s2_haltLn/s2_haltLn2/s2_am/sd57/sd57b/s2c, HAND-grep
gate, no new price literal, OrderSend-src 0) + compile 0/0 EA+Flow
required at build.

## S3. Asks + binding grading rules

**Ask 1:** Accept S1 (BLOCKED + void list + clean record + S6 split +
closures above with on-disk evidence).
**Ask 2:** CLEAR `build-2 TN2` BY NAME (S2 whole: L1"/L2/L3'/L4/L5'/
L6"/L7' + M0'/M1'/M2"/M3'/M4"/M5" + three globals, nothing else) for
ONE build + ONE rerun, same ini/range, ceiling 90 (~1h operator cost
flagged now, spent only on dual-key + his word).
**Ask 3:** CONFIRM nothing builds/runs/commits until BOTH streams name
`build-2 TN2` + operator run word; RECON17 frozen; e5a5cc24 uncommitted;
build-2 TN2 uncommitted without a token; no third run; timeout
REPORT+HALT. Ruling-IDs requested in both returns.
Grading (binding, adopted): enumerated oracles only (14 / 892 / 14376
/ 481 / 10 / 5 / 1 / 0 — archive SHA/count are NOT oracles); void/fail
cuts both ways incl. STALE/ANCHOR→VOID-except-filed-miss→FAIL;
landing table vs five filed stops + S2 gap with the RECON23 void list
restated; scope re-measured fresh; P-c mark-and-continue as declared.
