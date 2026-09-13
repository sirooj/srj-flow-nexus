# BUILDER_RESULT — RECON17-SLDEF6 (P-SLDEF-6, build 1)

Build: EA `6ACDF3B8EB03026CB96C45FE1F0D31C9F426615F739DC7DA07867F9E87961DBE`
(413224 B, P-SLDEF-6 E41–E45, print-only; slToday unmoved, no reference
definition changed, no selection changed, MTEXIT 4).
FlowLogic `3606BFB480A34B5ED4357588DDAFDFE8F7DF2224DA34C6A220EA49F506725911`
UNCHANGED. Both compile 0 errors / 0 warnings
(`06_HANDOFFS\T162_SLDEF6_EACOMPILE.log`,
`06_HANDOFFS\T162_SLDEF6_FLOWCOMPILE.log`).
Run: `00_CURRENT_WORKING\RECON1_P1.ini` unchanged, 3168 bars / 563338
ticks. Test passed in 0:55:03.585. DONE=PASSED 2026-09-13 17:31:53.
Wrapper archived itself: 18459 lines, journal `2B9ADBDE…` (3583852 B),
boundaries [98283..116742] (PRE=98283 = 16b end, contiguous). Purity
1/4/481 (signals/MTEXIT/SLIMB).
Tabulation: `06_HANDOFFS\RECON17-SLDEF6_TABULATION.txt`
(`00_CURRENT_WORKING\tabulate_sldef517run.ps1` + two appended rows).
Tenth join: `06_HANDOFFS\RECON17_GATE5_JOIN.txt`
(`00_CURRENT_WORKING\join_17_vs_11b.ps1`). E42 join:
`06_HANDOFFS\RECON17_GATE7_JOIN.txt` (artisan comparison, script
`00_CURRENT_WORKING\join_17_vs_16b_ext1.ps1` filed; shell hung twice on
full-archive scans — findstr-extract path used instead, documented).

Gate numbering: 1–4 and 12–15 per P-SLDEF-5 (1 = window/compile/flow,
2 = four-signal, 3 = join continuity, 4 = side/classes); 5–11 per
P-SLDEF-6; 13–15 = SIGMAP/FRAME_NOTE/census continuity, spot, archive.

## Gates

1. Window 3168/563338, Test passed; EA 0/0, FLOW 0/0; FlowLogic
   `3606BFB4…` unchanged — PASS.
2. FULL four-signal identity verbatim (2.43/2.56/1.76/1.25; SL
   1.16508/1.15907/1.16098/1.16218; TP 1.16364/1.16302/1.16200/1.16315
   per SLIMBR tp identical in the join); slToday unmoved — PASS.
3. Join continuity (SLDEF-5 gate 3 verbatim, served by the tenth-join
   artifact): SLIMB/WALKOB/WALKFR 481/481 IDENTICAL + SLIMBR 10/10
   zero-mismatch vs RECON11b — PASS.
4. sideViolations 0/0 both limbs; classes OB 51 ALL3_EQ + FR 68
   CARVEOUT_FIRED (exact 16b record); zero UNRES/UNCLASS — PASS.
5. Tenth inert join, LOAD-BEARING: same artifact as gate 3, deltas and
   classes included, zero movement — PASS.
6. `slExt1` on all 481 invocations (ext1Defined=1 everywhere; no
   `ext1Defined=0` case occurred, nothing unnamed); `ladOrigin` every
   row, `ladOriginSite` histogram S2POLL=432 / S3ARM=39 / S5=10;
   SLEXT41HALT=0 — PASS.
7. E42: ten S5 `slExt1` values bit-identical to RECON16b (10/10,
   keyed bar|site, 16 value fields); whole-line deltas exactly ONE row
   (Aug-28: filedT `->2026.08.28 06:30, barDiffBars -999->0 = intended
   E45.4, nothing else) — PASS.
8. UNGATED (packet: disagreement is not a halt): S5 probe probed=10,
   hits=10, agree=10, disagreers none (9 memoised at S2POLL, 1 at
   S3ARM — the 10:35 row). Memo-wide end totals: computes=471,
   hits=118, demands=589 (packet's 432/39/10 + 118 reproduced exactly).
   QUESTION to council: gate text says "over the 118 hits" — implemented
   over S5-probe hits (10/10); memo-wide 118 quoted for reference.
9. E44 per row, provenance HAND, no second emission (REDUNDANT by
   design — both bars covered by the 481-site shadow): 10:10 resid
   −146 barDiff −288 (shadow ext1 1.16112 slot 288); 17:00 resid −87
   barDiff −5 (shadow ext1 1.16187 slot 5). SIDE DISCLOSURE: both
   shadow rows evaluated dir=LONG (the EA's side those bars); his
   levels are SHORT-side stops — cross-side residuals, reported not
   adjudicated. NO_LADDER: none.
10. Predicate authoritative: OB 4 / fractal 3
    (`SLIMBCARVE_PROXY obPred=4 frPred=3`); consequence proxy beside
    it, labelled (`obConsProxy=0 frConsProxy=3` = S5 companions; S5
    class OB 0 / FR 3 measured off-log; RECON16b identical 0/3 and
    FINAL ob=0 fr=3). Firing-vs-effect taxonomy holds — PASS (record).
11. Split: SLEXT45 10 rows; ON_LADDER=6 OFF_LADDER=4 (10:35, 15:55,
    16:40-Sep7, 9/08 = RECON16b NONE=4, record matched);
    EXT_DEFINED=10 (EXT_NONE unexercised in-window, code path present);
    COVERED=9 EXT1_UNCOVERED=1 (9/08 + VACUOUS_COVER, ladObligN=0);
    noneAge only OFF_LADDER with slot+barTime (167/407/20/816; slots
    168/408/21/817) — PASS.
12. `LINEWIDTH truncated = 0` all classes incl. SLEXT481 max 326,
    SLEXT43 166, SLEXT45 225, both finals; Data `BADFMT = 0`
    (SLADDER/SLADWIN BADFMT=0; new classes single-emission-site) — PASS.
13. SIGMAP 4/4; FRAME_NOTE conventions + `ladObligN=6refs
    ladCovers=oblig+ext1` named (E45.2); ORDER 16 (RR_FAIL 6 / DIV_WAIT
    6 / PASS 4; STAMPED 12 / SEQ_UNSTAMPED 4); DECISION 10 rows / 4
    fired / threshold 1.00 compiled_default; SLADMARK 336;
    SLEXT_FINAL 1/0 (10:35; full-precision 41.00000/34.00000) — PASS.
14. Identities: WS161 3168/3168/205/0; SLMEMO 471/118/589; SL_REF
    432/39/10; INPLAYCOMMIT 157/46; MTEXIT 4 (3 TP_TOUCH + 1 HTF_FLIP,
    rows verbatim, entries match signals); aborts
    18/37/13/11/2/0/12; PROMO 469; CONFIRMPOLL 555; SUPPRESSED 152
    (16b 152; 156 was RECON14); N1 28/26/0/3 with pairing
    10/16/28/0/0/0/3/0/0/0; guard 60; CQD DIV 906/906; BLACKOUT
    11/1/3/0/0; spot INPLAYCOMMIT 157 / XOBPROMO 157 / SWEPTMASK 443 —
    PASS.
15. Archive: purity 1/4/481, SHA
    `2B9ADBDEC4479B9AAD08D1CFABDFEE73487B3AD989B4E000AE20A565EEDDF5F9`,
    18459 lines, bounds [98283..116742]; EA `6ACDF3B8…` 413224 B
    UNCOMMITTED — PASS (record).

Grading: 14/15 PASS + gate 8 ungated-report (10/10 agree, no
disagreers), zero halts. BUILDER RECOMMENDATION: ACCEPT — adoption
packet next on council word (all adoption inputs complete: Aug-28
HAND 06:30, fifth recovery-YES, Dukascopy-always feed rule, take iff
R>=1.0 — operator answers post-compact, filed in
`06_HANDOFFS\BUILDER_FINDING_SLDEF5_FIVEEXAMPLES.md` Addendum 3).

## E41 readings disclosed (council confirms or overturns)

- S5 origin = caller-stamped raw next-open; a non-positive open halts
  the row (never fired; no substitution anywhere).
- S2POLL/S3ARM origin = eval-bar close (the price both sites' live R
  already uses). S3ARM has no own R computation on record — the shared
  memo-path convention is the only entry concept at that site; the
  packet's own gate 6 expects 39 S3ARM origins, so coverage (not halt)
  is the packet-consistent reading.
- E45.4 = filedT-only. The prov token stays INFERRED (row still grades
  PROVISIONAL_MATCH as built); the HAND flip rides adoption.
- E43 denominator: S5-probe-10 implemented; memo-wide-118 quoted.

## Harness notes

- Launch printed LAUNCHED then the builder-side call hung (known);
  STATUS proved the launch (PID 19852, PRE=98283, RUNNING→PASSED).
- Two full-archive PowerShell scans hung with no output; the
  findstr-extract-then-compare path completed every check in seconds.
  `join_17_vs_16b_ext1.ps1` is filed as the reproducible instrument;
  the artisan E42 stands in, fully documented above.
- No terminal left running (none found pre-launch; wrapper archived
  itself). NO commit (no token). RECON16b stays frozen pending verdict.
