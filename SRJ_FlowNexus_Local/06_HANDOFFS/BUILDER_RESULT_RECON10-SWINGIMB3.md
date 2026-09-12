# BUILDER_RESULT_RECON10-SWINGIMB3 — P-SWINGIMB-3 EXECUTED, gates 1-9 PASS

## Run facts

- Packet: `SRJ_FlowNexus_Local\01_TASKS\PACKET_P-SWINGIMB-3.md` (ISSUED,
  council verdict session 2026-09-12). STAGE-1 EA re-hash before any write:
  `34BD7D82147CEABD365271790365AC87BBF7297BAC74DFF93A37017BEBAA4FF0`
  (283725 B) = frozen RECON9 baseline. No drift, no revert.
- Edits (EA only, all print-only, no selection branch, no memo contact):
  E8 walk repair (running extreme seeded from chosen; SL_STRUCT exceeds
  idiom reused character-for-character; non-qual extremes update the
  running extreme counted in `extUpdatedByNonQual`; code 0/2 walked past;
  code 3 terminates as `WALK_UNEVALUABLE`; zero-step on anchor flag 1),
  E9 class totality (3-boolean mapping, 9-class set, booleans printed),
  E10 `g_slimbr_*` file-scope shadows (never in ResetSequence, never
  working set) + per-invocation `SLIMBR` print at S5 with stale guard.
- Post-write digests: EA `4B2FA10EA263420ED12C83D58B128AA53278A0E78611841B71AA55C4E9E97C8F`
  (290162 B); FlowLogic `3606BFB480A34B5ED4357588DDAFDFE8F7DF2224DA34C6A220EA49F506725911`
  (67515 B, UNCHANGED).
- Compiles: EA `Result: 0 errors, 0 warnings, 2057 ms elapsed`;
  FlowLogic `Result: 0 errors, 0 warnings, 5072 ms elapsed`.
- RECON10-SWINGIMB3: launched 12:23:22 (PID 21612, PRE_JOURNAL_LINES=53807,
  pilot ini unchanged). Wrapper 60-min ceiling fired 13:27:37
  (`RESULT=TIMEOUT_60MIN`, 15876 lines archived at timeout, 4 SIGNAL gates
  already on record). Terminal NOT killed per rule; test ran to completion:
  `Test passed in 1:08:58.374`, 563338 ticks / 3168 bars, `connection
  closed` 13:32:29 — all three markers verified INSIDE the manually
  archived segment (lines 53807-70440, SEG_LINES=16634).
- Archived journal: `06_HANDOFFS\RECON10-SWINGIMB3_JOURNAL.log`,
  LEN=2835608 SHA256=`B76EA86E71E6678DCAE6C4C3F5A37BC2C3B330F76B8929E11084142118DF9424`.
- Tabulation: `06_HANDOFFS\RECON10-SWINGIMB3_TABULATION.txt` (script
  `00_CURRENT_WORKING\tabulate_swingimb10run.ps1`, parse-checked);
  gate-6 join: `06_HANDOFFS\RECON10_GATE6_JOIN.txt` (script
  `00_CURRENT_WORKING\analyze_walk10.ps1`).

## Gates

1. PASS. Both compile clean under `#property strict` (above).
2. PASS. All RECON9 identities verbatim: CQD DIV-first 906
   (170/308/263/165); WS161_CENSUS fields=21 loads=3168 stores=3168
   changes=205 mismatch=0; SLMEMO 471/118/589; SL_REF 432/39/10;
   INPLAYCOMMIT applied=1 157 / committed=1 46; MTEXIT 4; aborts
   18/37/13/11/2/0/12; PROMO 469 (full-segment count); CONFIRMPOLL 555;
   SUPPRESSED 156; four-signal set verbatim (8/28 SHORT R2.43 SL 1.16508;
   9/4 LONG R2.56 SL 1.15907; 9/7 LONG R1.76 SL 1.16098; 9/7 LONG R1.25
   SL 1.16218).
3. PASS. SLIMB 481 (432+39=471, S5 10); avail 481/481 (AVAIL0=0,
   CHAVAIL0_EXPOSED=0); apex 481/481; chosen exposure 481/481
   (CHOSEN_NEG=0, NOOB=0); BADFMT=0.
4. PASS. SLIMBWALK fields=23 total 481, BADFMT=0; UNRESOLVED=0;
   UNCLASSIFIED=0; sideViolations=0 (no row >0). code3Seen=0,
   WALK_UNEVALUABLE=0, exhausted=159 (declared fallback, see below).
5. PASS. Cross-tab chosenFlag x class, full (join bar|site, 481/481
   matched, 0 unmatched):
   cf=0 x BASE_MOVED=189, cf=0 x TODAY_EQ_NUANCE=55,
   cf=0 x WALK_EXHAUSTED=139, cf=1 x ALL3_EQ=51,
   cf=2 x BASE_MOVED=11, cf=2 x TODAY_EQ_NUANCE=16,
   cf=2 x WALK_EXHAUSTED=20.
   Named falsifier count(chosenFlag==1 AND class==BASE_MOVED) = 0.
   All 51 anchor-1 rows are ALL3_EQ (zero-step explicit, TEQB=0 overall).
6. PASS. Pre-filter recount reproduced from operands on the RECON9
   journal: TRUE BASEMOVED=375 / TEQN(carve-held)=106;
   split 16 same-turn / 152 tighter / 207 wider-protective — all three
   match the council's numbers exactly. Of the 168 contradicting cases:
   ABSORBED (post slBase == today) = 91, RE-RESOLVED further out = 77,
   TERMINATED = 0. 91+77+0 = 168, every case accounted, no OTHER bucket.
   Carve-106 redistribution: ALL3_EQ=4, TODAY_EQ_NUANCE=61,
   WALK_EXHAUSTED=41 (carve printed 0 post-filter; note below).
7. PASS. SLIMBR 10 rows, STALE=0. Four firing rows match the signal set
   on entry, tp and today's R exactly:
   - 8/28 10:00 SHORT entry 1.16466 tp 1.16364 rToday 2.43 →
     base 1.16513 rBase 2.17 dBase +5 (BASE_MOVED)
   - 9/04 15:55 LONG entry 1.16018 tp 1.16302 rToday 2.56 →
     base 1.15832 rBase 1.53 dBase -75 (TODAY_EQ_NUANCE)
   - 9/07 09:15 LONG entry 1.16135 tp 1.16200 rToday 1.76 →
     base 1.16074 rBase 1.07 dBase -24 (TODAY_EQ_NUANCE)
   - 9/07 16:40 LONG entry 1.16261 tp 1.16315 rToday 1.25 →
     base 1.16112 rBase 0.36 dBase -106 (BASE_MOVED)
   deltaPts is NOT zero across the firing set. The 9/07 NYAM row carries
   R 1.25 -> 0.36 under the ruled rule — below the 1.0 latch gate, i.e.
   the ruled rule would have killed that signal (TP_RR_FAIL). Per the
   packet's closing section this is now the OPERATOR'S decision, with the
   cost stated above. Nuance == base on all four firing rows.
8. PASS. INPLAYCOMMIT 157/157, XOBPROMO 157/157, SWEPTMASK 443/443 with
   identical wall-clock-stripped content signatures (full-window
   comparison, stronger than sampled-day).
9. PASS (measured above). No commit yet — this file is the record;
   commit follows the packet's gate-9 order (local + backup; origin still
   pending the credential word, explicitly NOT held per verdict).

## Post-filter partition (scoped, SLIMBWALK rows only)

ALL3_EQ=51, TODAY_EQ_BASE=0, TODAY_EQ_NUANCE=71, BASE_MOVED=200,
CARVEOUT_FIRED=0, WALK_EXHAUSTED=159, WALK_UNEVALUABLE=0,
UNRESOLVED=0, UNCLASSIFIED=0. Sum 481. extUpdatedByNonQual rows = 318
(rows where a non-qual swing moved the extreme; alternative reading stays
measurable). sideViolations = 0: the anchor-protective argument holds on
all 481 rows, no side test ships.

## Notes owned (no gate impact)

- N1 (tabulate defect, fixed): first CLASS line double-counted SLIMBR
  rows (481+10=491). Rescoped to `SLIMBWALK fields=23.*class=`; clean
  partition above. Gate-4 zero counts were never affected (no SLIMBR row
  carries those tokens).
- N2 (join-script defect, fixed): first join counted TEQN-row bases as
  "tighter" (186 vs 152). Restricted to TRUE-BASEMOVED rows; council
  numbers reproduce exactly (16/152/207, 375/106).
- N3 (reading, not defect): RECON9's printed class is TODAY_EQ_NUANCE on
  all 481 rows (carve sets nuance=chosen=today, so carve&&!eqN never
  fired on print). The TRUE partition always lived in the operands.
- N4 (reading): post-filter TEQN=71 all arise as carve-with-chosen==today
  (nuance==today, base!=today) and classify TODAY_EQ_NUANCE per the total
  mapping (carve precedence requires !eqN). Recomputable from the printed
  booleans; 61 of the 106 carve rows land here, 41 exhaust, 4 zero-step.
- N5 (run conduct): wrapper ceiling fired before test end (run needs
  ~69 min > 60-min ceiling). Manual completion protocol used throughout;
  completion markers verified in-segment, never from prose. Future
  ~1h runs should expect the same TIMEOUT+DONE-then-manual-archive path.

## Verdict requested

P-SWINGIMB-3 gates 1-9 PASS claimed on the measurements above. SLIMBR is
delivered: the imbalance rule's R cost is now stated (maximal on the 9/07
NYAM signal: 1.25 -> 0.36, a kill under the 1.0 gate). Next packet is a
decision, not another instrument — selection change (if any) is the
operator's, on a council packet.
