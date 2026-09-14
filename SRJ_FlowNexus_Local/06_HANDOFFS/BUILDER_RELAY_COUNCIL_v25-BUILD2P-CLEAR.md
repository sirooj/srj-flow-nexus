# BUILDER RELAY v25 — v24 compliance (C-a–C-e answered on disk) + build-2′ clearance ask (dual-key)

**Relay version: v25. Answers: GPT-v24-S2-CLR-001 + OPUS-V24-CLR-01
(both filed verbatim; no build/run/commit happened on either).**
**Ruling-IDs requested in both returns.**
**Single live relay, identical content to BOTH models. Paste whole.
NOTHING builds, runs, or commits on this relay.**

## §0. Standing context (compact)

Alert-only EA must reproduce his manual strategy as-is (side, entry
bar, stop, target; take iff unrounded R>=1.0 on Dukascopy). His rules:
TF rows read HTF-bias-only ({1H,15m} proven by his Sep-8 screenshot),
MR rows most-recent-sweep-only (spec §3.2, restatement §1); stop
1-away with imbalance / 2-away without + wick nuance; a swing is the
three-candle middle extreme (spec §3.7); filed stops authoritative
(R1 1.16508@06:30, R3 1.15847@15:30, R4 1.16098@08:40, R5 FILED
1.16239@16:15, S1 1.16258@09:40; S2 TP gap). Frozen baseline RECON17.
Stage-2 froze S2-1–S2-7 + P1–P8 + builder C1–C5 naming return; both
streams cleared by name; RECON23-STAGE2 ran DONE=PASSED 2026-09-14
(Test passed 0:46:42; archive 50836 lines SHA 6d59f7d0 bounds
[205308..256143]; build e5a5cc24 uncommitted) and graded BLOCKED on
an owned instrument defect (anchor global never published; walk count
never routed to limb cells; cross-bar contamination R1→04:40 /
R5→00:40 / S1,S2→05:05 — P1/P2/P3/P5/P6-reseat VOID, not failed).
Clean record stands (D1 14/14 + 892/0; D3 isolation all diff=0;
SEAT 14/14 with S1-M5=09:40; SIDE 7/7 with decided S1 flip + R1
split-decline + R2/S2 abstains; funnel 599/0; probe 14/14 with R5-L
and R4-L PRESENT at width; summaries nominal). Full proof in
`06_HANDOFFS\BUILDER_RESULT_RECON23-STAGE2.md`. Both v24 verdicts
accept this split with one Opus amendment (below, accepted).

## §1. C-a–C-e answered (all evidence on disk in e5a5cc24, zero build)

**Opus §6 amendment ACCEPTED (stricter wins):** funnel structural half
(599 stamps, zero dups, one-writer) stands; the 4-line scope
adjudication moves to VOID with P1/P2 (it read the broken walk's
stops). No laundering either direction. Astra §1–§2 accepted as filed.

**C-a · wiring receipts** (writer → reader, both quoted with anchors):
- `g_s2_tOByExi[7]` (new, L2): W = L3
  `g_s2_tOByExi[e] = S2Anchor(exID, s2ab);` (S2BuildAll bar loop) →
  R = L4 `g_s2_tO = g_s2_tOByExi[e];` (ForceEval bar loop).
- `g_s2a_N[14]`: W = `g_s2a_N[cell] = w;` (S2MaterializeCell end) →
  R1 = L1 expression; R2 = dump `g_s2a_N[dex*2+TF]` (both read-verified
  in e5a5cc24).
- `g_s2_tO`: W1 = L4; W2 = L5 `g_s2_tO = 0;` (EndOfRun beside
  `g_s2_on = 0;`) → R = variant
  `if(g_s2_on == 1 && g_s2_tO > 0 && cT > g_s2_tO) continue;`.
- `s2_aux`: W = S2Scope2Swing body `aux = StringFormat(...)` → R =
  same-statement stamp argument. (RECON23's lesson is the point: the
  build-1 table would have shown `g_s2_tO` with an init and no writer.)

**C-b · freshness needs code (M0–M3 below, quoted in §2).** Verified
premise: L1's `>= 0` proves set-not-current; a valid-index-but-stale
cell reads zeros and walks empty SILENTLY (the RECON23 shape with a
cleaner log). MQL5 out-of-range halts the tester (loud); stale-valid
does not — hence sentinel + stamp + asserts, all ordered below.

**C-c · (i) S2Anchor output-pure PROVEN** (body quoted whole — string
assigns + StringToTime + returns; zero prints, counters, globals,
buffer reads):
`datetime S2Anchor(const string exID, string &basis)` /
`basis = "UNANCHORED_GAP";` / R1→09:55 HAND_FIRST_SWING /
R5→16:30 HAND_FIRST_ANCHOR / S1→09:40 + S2→16:20 HAND_SECOND_SWING /
`return 0;`. No instrumentation moves. **(ii)** stability+equality
assert = M4 (SeatForceEval recomputes via the same pure function and
compares against storage; mismatch → ANCHOR_MISMATCH HALT).

**C-d · escape hatch OPEN (grep-measured):** scope-status strings are
consumed ONLY by stamp arguments + summary counters (S2Scope2Swing /
S2ScopeExh bodies, three stamp call sites, SEL61SCOPE summary). ZERO
decision consumers. → L6′ tightened form cleared-as-quoted per the
hatch. firstVal range guard + EMPTY→UNKNOWN third state spelled in
L6′; PURE stays stamp-arg/counter-only (aux carriage).

**C-e · RESOLVED, no arity problem:** EA line 4856
`int bufIdx = (dir == DIR_LONG) ? FL_BUF_SWING_LOW :
FL_BUF_SWING_HIGH;` — bufIdx IS the direction-selected swing buffer =
L6's `swBuf` under a loose name. L6 (imbBuf, swBuf, dir, entryPx,
firstShift, chosenShift, aux) vs L7 (slimb_imbBuf, bufIdx, dir,
slCurPx, firstShift, s, s2_aux): 7 vs 7, positions align; slCurPx and
dir are function-scope at the call site.

**Opus rerun grading rules ACKNOWLEDGED BINDING** (oracles not
re-baselined with the exact 14/892/14376/481/10/5/1/0 list; void/fail
cuts both ways incl. anchored-window HALT vs filed-miss FAIL; landing
table vs the five filed stops + S2 gap with the RECON23 void list
restated; scope re-measured fresh). L3/L6 print nothing new (proven
above for S2Anchor; L6 prints nothing — aux rides the existing stamp
line), so the archive cannot move by instrumentation.

## §2. Build-2′ (quoted verbatim — the ONLY delta vs e5a5cc24)

L1 (variant count routing, replaces EA:2962):
`int n = (g_s2_on == 1 && g_s2_cExi >= 0) ? g_s2a_N[g_s2_cExi * 2 + g_s2_cTF] : (isH1 ? g_sel_h1N : g_sel_m5N);`
L2 (new global beside g_s2_tO): `datetime g_s2_tOByExi[7];`
L3 (S2BuildAll per bar after SrjSelEntry success):
`{ string s2ab = ""; g_s2_tOByExi[e] = S2Anchor(exID, s2ab); }`
L4 (ForceEval bar loop): `g_s2_tO = g_s2_tOByExi[e];`
L5 (EndOfRun beside `g_s2_on = 0;`): `g_s2_tO = 0;`
L6′ (scope helper, tightened per hatch + guard + UNKNOWN):
`string S2Scope2Swing(const int imbBuf, const int swBuf, const ENUM_SRJ_DIR dir, const double entryPx, const int firstShift, const int chosenShift, string &aux)`
`{ g_s2_nScopeRows++; double f = 0.0; int fi = -1; if(firstShift >= 0 && ReadFlow(imbBuf, f, firstShift) && f != EMPTY_VALUE) fi = (int)f; double c = 0.0; int ci = -1; if(chosenShift >= 0 && ReadFlow(imbBuf, c, chosenShift) && c != EMPTY_VALUE) ci = (int)c; double fv = EMPTY_VALUE; int sok = -1; if(firstShift >= 0) { double fr = 0.0; if(ReadFlow(swBuf, fr, firstShift) && fr != EMPTY_VALUE) fv = fr; } if(fv == EMPTY_VALUE) sok = -1; else sok = SlimbProtectiveSideOk(dir, fv, entryPx) ? 1 : 0; aux = StringFormat("f1=%d chosen=%d fval=%s sideOk=%d", fi, ci, (fv == EMPTY_VALUE ? "-" : DoubleToString(fv, _Digits)), sok); if(fi == 1 && sok == 1 && !S2ScopeTable()) { g_s2_nScopeViol++; return "OUT_OF_SCOPE_VIOLATION"; } if(fi == 1 && sok != 1) return "UNGROUNDED_REPORT"; return "IN_SCOPE"; }`
(aux states: sideOk=1 protective / 0 non-protective / -1 UNKNOWN;
PURE-violation needs fi==1 AND protective; fi==1 with UNKNOWN or
non-protective reports UNGROUNDED — never a violation, never IN_SCOPE
by default. PURE stays diagnostic-only per the hatch finding.)
L7 (4478 call site, bufIdx resolved per C-e):
`S2StampStop(site, barShift, "SLREF_2SWING", 1, slRefOut, (int)slModeOut, S2Scope2Swing(slimb_imbBuf, bufIdx, dir, slCurPx, firstShift, s, s2_aux), s2_aux);`
(with `string s2_aux = "";` on the line before, as v24 quoted.)
M0 (new global beside g_s2_tO): `datetime g_s2_stampD = 0;`
M1 (S2BuildAll top): `for(int s2c = 0; s2c < S2A_CELLS; s2c++) g_s2a_N[s2c] = -1;`
M2 (S2RowRead s2-branch top, before any read):
`{ int s2cell = g_s2_cExi * 2 + g_s2_cTF; if(g_s2_cExi < 0 || g_s2_cExi > 6 || g_s2_cTF < 0 || g_s2_cTF > 1 || s2cell < 0 || s2cell >= S2A_CELLS || g_s2_stampD <= 0 || g_s2a_N[s2cell] < 0) { g_s2_haltNC = 1; string stl = "[SRJ-EA] SEL61HALT kind=STALE_CELL"; LwAudit("SEL61HALT", stl); Print(stl); cT = 0; rU = EMPTY_VALUE; rL = EMPTY_VALUE; repT = 0; repA = 0; return; } }`
(zero/EMPTY return walks through the existing `repT == 0` skip with no
skip inflation, then def=0 fails the control grade — loud at grade AND
in log. STALE_CELL reuses the halt flag with its own kind token.)
M3 (stamp writers + reset): ForceEval beside L4 append
`g_s2_stampD = D;`; dump beside its cell-set append `g_s2_stampD = D;`;
EndOfRun beside L5 append `g_s2_stampD = 0;`.
M4 (SeatForceEval beside tO compute):
`if(tO != 0 && g_s2_tOByExi[e] != tO) { g_s2_haltNC = 1; string sam = "[SRJ-EA] SEL61HALT kind=ANCHOR_MISMATCH"; LwAudit("SEL61HALT", sam); Print(sam); }`
(S2BuildAll fills before SeatForceEval runs — existing EndOfRun order;
recompute-vs-storage cross-checks the wiring live.)
Opus preference noted (parameter threading) — declined for clearance
scope: C-b + C-c cover the surface; redesign ships under its own
packet, never smuggled in a repair.

## §3. Asks

**Ask 1:** Accept §1 (BLOCKED + void list + clean record + §6 split +
C-a–C-e answers with on-disk evidence).
**Ask 2:** CLEAR build-2′ BY NAME (L1–L7 as re-quoted + M0–M4 + the
two globals, nothing else) for ONE build + ONE rerun, same ini/range,
ceiling 90 (~1h operator cost flagged now, spent only on dual-key +
his word).
**Ask 3:** CONFIRM nothing builds/runs/commits until BOTH streams name
build-2′ + operator run word; RECON17 frozen; e5a5cc24 uncommitted;
build-2′ uncommitted without a token; no third run; timeout
REPORT+HALT. Ruling-IDs requested in both returns.
