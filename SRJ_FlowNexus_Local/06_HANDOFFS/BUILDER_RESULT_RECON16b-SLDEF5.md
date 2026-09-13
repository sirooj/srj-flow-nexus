# BUILDER_RESULT — RECON16b-SLDEF5 (P-SLDEF-5, build 2)

Build: EA `893B26DF496507638E6269B1A7DFAD7EE608BB862EC2D3283F983F35EF79298E`
(399946 B, P-SLDEF-5 E35–E40 + RESCOPE amendments, print-only).
FlowLogic `3606BFB480A34B5ED4357588DDAFDFE8F7DF2224DA34C6A220EA49F506725911`
UNCHANGED. Both compile 0 errors / 0 warnings
(`06_HANDOFFS\T162_SLDEF5_EACOMPILE.log`,
`06_HANDOFFS\T162_SLDEF5_FLOWCOMPILE.log`).
Run: `00_CURRENT_WORKING\RECON1_P1.ini` unchanged, 3168 bars / 563338
ticks. Test passed in 0:56:30.538. DONE=PASSED 2026-09-13 15:25:32.
Wrapper archived itself: 17954 lines, journal `4740FA3B…` (3402790 B),
boundaries [80330..98283]. Purity 1/4/481 (signals/MTEXIT/SLIMB).
Tabulation: `06_HANDOFFS\RECON16b-SLDEF5_TABULATION.txt`
(`00_CURRENT_WORKING\tabulate_sldef516brun.ps1`). Ninth join:
`06_HANDOFFS\RECON16b_GATE3_JOIN.txt`
(`00_CURRENT_WORKING\join_16b_vs_11b.ps1`).

## Gates

1. Window 3168/563338, Test passed — PASS.
2. FULL four-signal identity verbatim (2.43/2.56/1.76/1.25; SL
   1.16508/1.15907/1.16098/1.16218); slToday unmoved — PASS.
3. Ninth inert join vs RECON11b: SLIMB/WALKOB/WALKFR 481/481 IDENTICAL +
   SLIMBR 10/10 zero-mismatch — PASS.
4. sideViolations 0/0; classes OB 51 ALL3_EQ + FR 68 CARVEOUT_FIRED,
   zero UNRES/UNCLASS — PASS.
5. slExt1 resolved all 10 invocations (ext1Defined=1, deepestExt printed);
   outward sign distribution outPos=1/outNeg=5/outZero=4, unconstrained —
   PASS.
6. Filed rows: 8/28 PROVISIONAL_MATCH (ext1 1.16508 slot 42/06:30 imb 0,
   resid 0, INFERRED at build); 9/04 15:55 MATCH (1.15847 slot 5/15:30
   imb 0, resid 0, HAND); 9/07 09:15 MATCH (1.16098 slot 7/08:40 imb 0,
   resid 0, HAND); 9/07 16:40 ABSORBED (1.16238 slot 7/16:05 imb 0 vs
   1.16239 HAND @16:15: resid −1, barDiff −2). SLEXT6HALT=0 — PASS
   (three + provisional, four tokens kept distinct).
7. todayXi==1 on 8/28 10:00, 8/28 16:20, 9/04 09:25, 9/07 09:15 = 4/10,
   comparison record reproduced; NONE=4 (10:35, 15:55, 16:40-Sep7, 9/08)
   — PASS.
8. FINDING (packet: "a different count is a finding, not a pass"):
   fractal predicate 3 = class 3 = companions 3 (exact). OB predicate
   fires 4 (8/26, 9/04 09:25, 9/04 15:55, 9/07 09:15) vs item-C 3 — all
   four class TODAY_EQ_NUANCE, companions 0 both builds (no regression):
   mechanism 4/4 (fired OB carve always absorbs). S5 subtotals per limb
   on SLIMBR ob/frCarveFired tokens.
9. Cover target includes ext1; ladObligN printed (6=5/4=2/3=2/0=1, all
   consistent with SLADWIN steps); VACUOUS_COVER named on 9/08 (only
   empty-obligation row); covers 1=9/0=1 — the 0 IS 9/08, honestly
   uncovered (no rung beyond ext1 1.16359 in 52 rungs; no decision
   depends on it). Rung counts identical to build-1 on all 10 rows —
   PASS with finding.
10. 25 classes, truncated=0 (SLEXT1 max 485, SLADWIN-28 max 426,
    DECISION×3 + SLADMARK + SLEXT_FINAL all registered) — PASS.
11. newSignalCount=1 (10:35, full-precision reward 41.00000/risk 34.00000,
    ext1 R 1.21) / lostSignalCount=0, rows named — PASS (1/0 as reported).

Grading: 10/11 PASS + gate-8 FINDING, zero halts. BUILDER
RECOMMENDATION: ACCEPT — next is the adoption packet (single
anchor-and-count change) on council word.

## Cross-records (unchanged from build-1, re-confirmed)

ORDER 16 rows fields=10 (RR_FAIL 6 / DIV_WAIT 6 / PASS 4; STAMPED 12 /
SEQ_UNSTAMPED 4 cause S4S5_NOBIAS; flipNewThisBar=1 rows 0;
biasOpposedAtGate 1=3). SIGMAP 4/4. DECISION 10 rows / 4 fired / 24
rungs (12 SLOT + 12 EXT). SLADMARK 336 = SLADDER 336 (fired subset
11+49+32+21=113). MTEXIT 4, MTLIFE 4, MTFLIP 1. N1: body 28/0, wick
10/16, vwap 0/0, poc 3/0. News census 11/1/3/0/0. CQD 170/308/263/165.
WS161 mismatch 0. Sub-pip reward live (16:40 53.79362). NONE ages
+167/+407/+20/+816 (REF_OB_DEEP slotDist convention).

## Appendix — RECON16 build-1 record (SUPERSEDED, defect owned)

EA `5B4F7E06…` (399165 B), 0/0. DONE=PASSED 14:24:05 (Test passed
0:54:19; journal `A32F0E85…` 17955 lines). Defects (all gate-9 letter):
cover target missed ext1; ladObligN/VACUOUS_COVER unbuilt (SLADWIN
fields=27, status OK=10); noneAgeBars sign inverted (−167/−816).
All other gates gradeable and identical to build-2 outcomes above
(gate-6 operands, 4/10 Xi, ninth join, 1/0, width). Retained as
measurement, not a baseline. RECON15b (`1EE6FC62…`) stays frozen.

## Operator answers landed mid-run (adoption inputs, not grading)

Aug-28 1.16508 HAND + bar 06:30 (barDiff 0 by inspection; row stays
PROVISIONAL_MATCH as built). Fifth = Sep-4 10:35 SHORT, SL 1.16299 HAND
(digit confirmed) — F converts cost→recovery. Sep-8 pair HAND, unmapped.
Count 7. Full record in
`06_HANDOFFS\BUILDER_FINDING_SLDEF5_FIVEEXAMPLES.md`.

NO commit (no token). Terminal 15956 left running post-DONE (hygiene
owed next session if idle).
