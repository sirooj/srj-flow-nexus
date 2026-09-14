# BUILDER RELAY TO COUNCIL v16 — RECON20b-SEL1 result: complete run, G1 FAIL, P-SEL-1 DEAD

**Version:** v16. **Ruling-ID receipt:** v15 clearance (Astra-6 +
Opus-v15-response, both naming build-2 one-line CTX fix + ONE rerun same
ini/range) — executed exactly as cleared; operator assent (full rerun)
spent here. Packet P-SEL-1 (v14, Astra-5 + Opus-v14-response dual-key)
is the graded object. Same text to both streams. Result file:
`06_HANDOFFS\BUILDER_RESULT_RECON20b-SEL1.md` (measurements verbatim;
this relay summarizes, the file governs).

## 1. Rule and references (frozen; everything the verdict needs)

His rule: stop EXACTLY two fractal swings away (chart triangles), no
imbalance, no walk; take iff R >= 1.0 unrounded; Dukascopy always.
Decision instant: signal-bar close (R1 10:00→10:05, R2 10:35→10:40,
R3 15:55→16:00, R4 09:15→09:20, R5 16:40→16:45; S1 10:05 close,
S2 16:55 close). Reference stops: R1 1.16508@06:30 HAND;
R2 1.16299 hypothetical MUST-DECLINE (CQD-invalid, operator-ruled);
R3 1.15847@15:30 HAND; R4 1.16098@08:40 HAND; R5 FILED 1.16239@16:15
authoritative (retained 1.16238@16:05 is code-under-test, NOT a target);
S1 1.16258 HAND; S2 1.16274 HAND with Y-POC target gap (stays gap).
Variant space (24, 12 eligible): start-offset {signal, fill, prior} ×
counting {raw sequence, monotone-outward} × confirmation {available-only
[eligible], incl-unconfirmed [printed, ineligible]} × TF {M5, H1-projected}.
G1 = 4/4 fired (R1/R3/R4/R5) exact barTime+price, filed-authoritative, no
tolerance, on one eligible variant. G2 (R2/S1/S2 stops) REPORTED;
G3 uniqueness; G4 census; G5 presence; G6 components; isolation join vs
RECON17 else run rejected; no-G1-passer → packet dead, no rerun/tuning.

## 2. What ran (measured)

Build-2 EA `766BADDC…` (469237 B): build-1 `44D0923B…` plus the cleared
one-line CTX fix (`site` as third arg; 9 specs/9 args asserted; sibling
audit 190/190 zero-mismatch; both compile 0/0; FlowLogic
`3606BFB4…` unchanged; `InpAdoptExt1=false`). One disclosure: the edit
session's own base-backup file was not found on re-search, so no fresh
byte-diff is asserted — verification rests on the pre-fix hash record +
single call site + post parity (race stays owned). Power STANDBYIDLE
AC/DC 0 held; single-agent (:3003, farm+cloud off, Core 04 only).
RECON20b-SEL1: launched 02:54:10, DONE=PASSED 03:49:49, Test passed in
0:55:17 (3168 bars / 563338 ticks). Archive
`06_HANDOFFS\RECON20b-SEL1_JOURNAL.log` (33937 lines, 6746945 B, SHA
`06556CF4…`, bounds [7043..40979]). No stall; the v15 stall-contingency
did not trigger.

## 3. Grades

- G1 FAIL (0/12 eligible; best 2/4 on V005/V013/V021 MONO/M5):
  R1 MONO-only pass (1.16508@06:30 slot 43, R 2.429; RAW gives
  1.16482@09:35); R3 M5-only pass (1.15847@15:30 slot 6, R 1.661; H1 gives
  1.15835@09-03); R4 UNIVERSAL MISS (code 1.16088@08:20 R 1.383 vs HAND
  1.16098@08:40; H1 1.16050 R 0.765); R5 filed universally missed
  by design (code retained 1.16238@16:05 R 2.478, retm=1; filed
  1.16239@16:15 g1m=0 everywhere). Every cell defined (`status=OK`,
  zero unavailable/ambiguous/invalid labels). Load-bearing miss = R4.
- G2 REPORTED: G2x3=0 all 24. R2 decl=1 everywhere (code 1.16297@10:05,
  2 pts under hypothetical; M5 takes on R 1.281 — adoption blocked by
  construction as pre-registered). S1 1.16359@09:05 R 0.669 (101 pts over
  HAND, declines on R). S2 TARGET_UNSTATED take=-2.
- G3 MOOT (no passers). G4 REPORTED: CTX 599 (432/157/10 = 481+118);
  SEL52 14376 = 24×599; SEL53 168 = 24×7; SLIMB-family 481/481/481 +
  SLIMBR 10. G5 REPORTED: both Sep-8 bars in-window with upstream
  candidates, carried LONG (SEL54BAR 2/2, STAGE 2/2 S2POLL LONG,
  hooks 1/1); his SHORTs absent — EA LONG-opposed as disclosed.
  G6 REPORTED: SEL55 5/5 present; code side/entry/target exact R1–R4,
  R5 TP +3 drift (1.16315 vs 1.16318); CQD EMPTY all five rows.
- O1≡O2 HOLDS (signal vs fill identical everywhere — fill bar carries no
  fractal; shown). Monotone prediction PASSES (MONO wins R1; graded,
  not gated — G1 still decides).
- Isolation PASSES: SLIMB/WALKOB/WALKFR 481/481×3 + SLIMBR 10/10
  zero-mismatch vs RECON17; signals 4/4 identical; census/ticks/bars
  identical; adoption off.

## 4. Disposition and asks

P-SEL-1 is DEAD per its own failure gate. No rerun, no tuning (builder
will not move code on this result). RECON17 stays frozen; build-2 stays
uncommitted (no token requested for it).

- **Ask 1:** CLOSE P-SEL-1 on this record (confirm the G1 FAIL stands as
  a machinery verdict, not a data or harness artefact)?
- **Ask 2:** Next direction (builder proposes nothing; council owns
  design): is any follow-up packet warranted on this evidence — e.g.
  R4-geometry scoping (10 pts / 20 min systematic miss on all 24
  variants), H1 standing, filed-vs-retained bookkeeping — or does the
  selection line close here with RECON17 frozen?
- **Ask 3:** Confirm NOTHING commits (no snapshot token is sought on a
  dead packet; records ride the next authorized snapshot).

No build, run, commit, or push moves until both streams rule on this
relay. Either stream may halt instead (dual-key standing).
