# BUILDER_RELAY_COUNCIL — P-SWINGIMB-3 verdict requested (RECON10-SWINGIMB3)

## What ran

P-SWINGIMB-3 E8+E9+E10, print-only, no selection change. EA
`4B2FA10EA263420ED12C83D58B128AA53278A0E78611841B71AA55C4E9E97C8F`
(290162 B); FlowLogic unchanged
`3606BFB480A34B5ED4357588DDAFDFE8F7DF2224DA34C6A220EA49F506725911`.
Both compile 0 errors / 0 warnings. Full pilot window, ini unchanged:
`Test passed in 1:08:58.374`, 563338 ticks / 3168 bars. (Wrapper 60-min
ceiling fired first; terminal continued untouched; completion markers
verified in the manually archived 16634-line segment. Expect this path on
all ~1h runs.)

## Gates 1-9 — all PASS, measured

1. Compiles clean (above).
2. Every RECON9 identity verbatim: CQD DIV-first 906 (170/308/263/165);
   WS161 fields=21 loads=3168 stores=3168 changes=205 mismatch=0; SLMEMO
   471/118/589; SL_REF 432/39/10; INPLAYCOMMIT 157/46; MTEXIT 4; aborts
   18/37/13/11/2/0/12; PROMO 469; CONFIRMPOLL 555; SUPPRESSED 156;
   four-signal set verbatim.
3. SLIMB 481 (432+39=471, S5 10); avail 481/481; apex 481/481; chosen
   exposure 481/481 (zero NOOB residuals, unchanged).
4. SLIMBWALK fields=23: 481 rows, BADFMT=0, UNRESOLVED=0,
   UNCLASSIFIED=0, sideViolations=0. (code3Seen=0, WALK_UNEVALUABLE=0.)
5. Cross-tab chosenFlag x class in full (481/481 joined, 0 unmatched):
   cf0: BASE_MOVED 189 / TODAY_EQ_NUANCE 55 / WALK_EXHAUSTED 139;
   cf1: ALL3_EQ 51; cf2: BASE_MOVED 11 / TODAY_EQ_NUANCE 16 /
   WALK_EXHAUSTED 20. Falsifier count(cf1 AND BASE_MOVED) = 0 — the
   zero-step case is present and correct (all 51 anchor-1 rows ALL3_EQ,
   TEQB=0).
6. Pre-filter recount reproduced from RECON9 operands: TRUE BASEMOVED 375
   / TEQN(carve-held) 106; split 16 / 152 / 207 — exact. Of the 168:
   absorbed 91, re-resolved further out 77, terminated 0. No remainder.
7. SLIMBR 10 rows, STALE=0. Firing set (entry / tp / today-R all match
   record):
   8/28 SHORT 1.16466 / 1.16364 / 2.43 -> base R 2.17, dBase +5;
   9/04 LONG 1.16018 / 1.16302 / 2.56 -> base R 1.53, dBase -75;
   9/07 LONG 1.16135 / 1.16200 / 1.76 -> base R 1.07, dBase -24;
   9/07 LONG 1.16261 / 1.16315 / 1.25 -> base R 0.36, dBase -106.
   deltaPts is NOT zero across the firing set. The 9/07 NYAM row falls to
   0.36 under the ruled rule — below the 1.0 latch gate, i.e. the ruled
   rule would have killed that signal. Nuance == base on all four firing
   rows. The operator's selection decision is now pending with these
   costs stated.
8. INPLAYCOMMIT 157/157, XOBPROMO 157/157, SWEPTMASK 443/443, content
   signatures identical (full-window, stronger than sampled-day).
9. Digests above. Committed local f07e4b1/8da1ad2 + tag
   Task162-T162SWINGIMB3, backup verified; origin still pending
   credential word, not held per standing ruling.

## Other measurements

- Post-filter partition: ALL3 51 / TEQB 0 / TEQN 71 / BASEMOVED 200 /
  CARVEOUT 0 / EXH 159 / UNEVAL 0 / UNRES 0 / UNCLASS 0 (= 481).
- extUpdatedByNonQual rows = 318 (alternative reading measurable).
- Carve-106 redistribution: ALL3 4 / TEQN 61 / EXH 41. Post-filter TEQN
  rows are carve-with-chosen==today (classifies TODAY_EQ_NUANCE per the
  total mapping since carve precedence requires !eqN) — recomputable from
  the printed booleans, not a defect.
- sideViolations=0 on all 481: the anchor-protective argument holds; no
  side test ships.
- Two builder-side defects found and fixed before recording: tabulate
  double-counted SLIMBR rows in the class line (rescoped, partition
  above is clean); first join script counted TEQN-row bases as tighter
  (restricted to TRUE-BASEMOVED, council numbers reproduce exactly).

## Verdict requested

P-SWINGIMB-3 ACCEPT or redirect. SLIMBR is delivered; per the packet's
closing section the next step is a decision, not another instrument.
