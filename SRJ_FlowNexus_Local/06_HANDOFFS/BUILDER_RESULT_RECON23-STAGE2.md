# BUILDER RESULT — RECON23-STAGE2 (frozen S2-1–S2-7 first run)

**Verdict: BLOCKED (builder instrument defect, owned — see §2).**
Run PASSED; grading of P1–P5 and P6-reseat is UNGRADABLE (void, not
fail). Clean evidence (§3–§7) stands and is filed. Council ruling owed:
accept clean record + CLEAR build-2 BY NAME + ONE rerun (v24 relay).

## 1. Run facts

- DONE=PASSED 2026-09-14 17:45:42. Test passed in 0:46:42.723.
  3168 bars / 563338 ticks expected (STATUS gates show both).
- Archive `06_HANDOFFS\RECON23-STAGE2_JOURNAL.log`: 50836 lines /
  9706928 B / SHA256 `6d59f7d08d3bfdba5d67bec88812a3bb3ffc443f8f6e3413b133d779007cd693`
  / bounds [205308..256143] (PRE=205307 contiguous from RECON22).
- Purity: farm-off ×1, Test-passed ×1, Core-04 throughout, no other
  agent/farm lines. MAXLEN=537 (=LW_CAP, zero exceedance), content 489.
- Signals 4/4 (SHORT 08-28, LONG 09-04, LONG 09-07 morning, LONG 09-07
  afternoon — same four, same bars). No terminal leftover (none running
  at archive). Build e5a5cc24 uncommitted; RECON17 frozen.

## 2. The defect (owned — two missing wirings, measured, not inferred)

- (a) `g_s2_tO` is assigned NOWHERE: repo grep `g_s2_tO\s*=` returns
  exactly one hit, the init `datetime g_s2_tO = 0;` (EA line 2809).
  S2SeatForceEval computes the anchor into a LOCAL and prints it but
  never publishes it. The S-A anchor never engaged any walk.
- (b) The walk count `n` was never routed to the limb cells: EA line
  2962 still reads `int n = isH1 ? g_sel_h1N : g_sel_m5N;` (snapshot
  counts, ~1000s) while S2RowRead serves cell rows (~dozens). Indices
  past the cell read stale/neighbor-cell rows: cross-bar
  contamination. Signature: walks land on ancient foreign rows —
  R1→04:40, R2→05:00, R4→00:40, R5→00:40/wit-05:55, S1→05:05,
  S2→05:05 — while H1 lines (n≈156 < slice, breaking in-cell) mostly
  hold. The 00:40/05:05 outcomes PROVE wrong-row-set, not limb binding
  (a correct-cell walk breaks at the legacy pair first).
- Impact: SEL53 + SEL58 families are VOID for P1–P6 grading (84/168
  SEL53 keys moved + S1/S2 shape changes all carry the contamination).
  P1/P2/P3/P5/P6-reseat = UNGRADABLE. This is an instrument failure,
  not a design failure: no conclusion about limbs/anchors follows from
  the void families. Everything in §3–§7 bypasses the walk (separate
  code paths, separately verified) and stands.

## 3. Clean I — enumeration, isolation, funnel (all verified by diff)

- D1: SEL60 14/14 lists + SEL60FINAL `stored=892 dropped=0 m5scan=967
  m5drop=0 h1scan=75 h1drop=0` — byte-identical to RECON22.
- SEL60END 14/14 diff=0 (F4 oracle (a) HOLDS).
- D3 isolation diff=0 vs RECON22: SEL52 census 14376, SEL52_FINAL 24,
  SLIMB 481 / SLIMBWALK 481 / SLIMBWALKF 481, SLIMBR 10, SLEXT1 10,
  SLEXT45 10, SLEXT47 118, SEL55 5/5, ORIGINREG 5, SEL60DISCEND 2,
  OrderSend 0, InpAdoptExt1 false-static. Live path byte-identical.
- Funnel: SEL61SRC 599 stamps, dups=0 (one-writer holds perfectly).
  SEL61LIVE calls=56 agree=56 delta=0. Drops=0, tiebreak=0, haltNC=0.
- Summaries all present: INV (declines=1 promoAtt=0 overturnBlocked=0
  wiring=OK), OVR (0/EMPTY), INDEP (adopt=0 ordersend=0/0 sizefields=0
  h4branches=0), SCOPE (rows=40 violations=4 table=EMPTY), SRCEND,
  LIVE, SUMMARY (h4reads=7).

## 4. Clean II — seats (P6-origin PASSES; reseat void)

- SEL61SEAT 14/14: R1 tO=09:55, R5 tO=16:30, S1 tO=09:40, S2 tO=16:20
  (all as declared); M5 member=1 on all four anchored bars; H1
  member=0 (reported, P6 constrains M5 only); R2/R3/R4 UNANCHORED_GAP
  with LEGACY_UNANCHORED lineage; anchored rows lineage=F2_SA.
- S1/M5 = 09:40 itself, no HALT-NEWCLASS fired. P6-origin PASSES.
- P6-reseat: UNGRADABLE (walk void). Amendment-A3 S1-identity
  prediction is NOT graded (would launder contaminated evidence).

## 5. Clean III — sides (F3 resolver behaves as designed)

- R3 MR_SWEEP_LD.L → LONG = pinned, decline=0. R4/R5 TF_UNANIMOUS
  (1.0/1.0) → LONG = pinned, decline=0. S1 TF_UNANIMOUS (-1.0/-1.0)
  → SHORT = pinned, decline=0: the DECIDED Sep-8 flip line (P7 first
  leg LANDED).
- R1 TF_SPLIT (h1=-1.0 bear, m15=+1.0 BULL) → DECLINE=1, no side
  taken. Code's 15m engine reads bull where his journal row reads bear
  (LDN TF Bear/Bear/Bear): genuine code/hand input divergence, same
  family as the R2-CQD divergence (evidence, not halt). The resolver
  correctly refused a split input; no mismatch path fired (nothing to
  mismatch — decided=-). P1 grades the walk only (void this run).
- R2/S2 ABSTAIN_UNKNOWN_CLASS (decline=0, pinned kept) as designed.
  S2 branch reads h1=+1.0/m15=-1.0: SPLIT — S2 would decline even if
  TF-classified. P7 second leg UNDECIDED → FAIL-with-gap
  (pre-registered) with this evidence attached.

## 6. Clean IV — scope (4 candidate-violations + caveat)

- SEL61SRC OUT_OF_SCOPE_VIOLATION ×4, all S2POLL off-example bars,
  all SLREF_2SWING mode=2: 08-28 18:00 1.16589 (f1=1 chosen=0);
  08-31 11:05 1.16084 (f1=1 chosen=0); 09-02 14:25 + 14:30 1.15662
  (f1=1 chosen=1). No S5-row, no example-bar violation.
- SL_STRUCT cross-check: all four chosen stops protective
  (1.16589>1.16134; 1.16084>1.15999; 1.15662<1.15741; 1.15662<1.15760).
- CAVEAT (owned, carried): the stamp does not carry first-leg
  side-validity, so PURE-shape vs conditional-correct-with-
  nonprotective-first is unadjudicated from prints. Build-2 extends
  aux (firstVal + sideOk) to close exactly this (v24, quoted).
- REPORT-only by design; no behavior touched; no halt fires.

## 7. Clean V — probe (14/14; the width question answers itself)

- SEL61PROBE 14/14 + PROBEEND rows=14 expect=14. Verdicts:
  R1-U PRESENT@06:30 / R1-L absent; R2-U+L present@09:30 (moot,
  declined); R3-L PRESENT@15:30 / R3-U absent; R4-L PRESENT@08:40 /
  R4-U absent; R5-U+L PRESENT@16:15; S1-U PRESENT@09:40 / S1-L
  absent; S2-U PRESENT@16:20 / S2-L absent.
- R5-L PRESENT@16:15: the filed level EXISTS as a three-candle lower
  extreme at the specified width → R5 mechanism ALIVE at width (S2-6
  REPORT branch). C5 divergence line NOT emitted (its antecedent
  needs P5-retained; P5 is void) — probe-present + walk-void both
  filed instead (the rule applied as written).
- R4-L PRESENT@08:40: the blank-(b) bar IS a three-candle extreme
  while platform-Fractals sees nothing there (RECON21b proven) → the
  miss was a WIDTH artifact of the 5-bar rendering, not his rule.
  P4 report-route honored: reported, no extension ships.
- Directional sanity throughout: stop-side present, opposite absent
  (R1/R3/R4/S1/S2 all split correctly; R5 both present as measured).
- P8 PASSES (rows present); verdicts are REPORTED findings per S2-6.

## 8. P-grades (frozen rule + C-note/Amendment A, no reinterpretation)

- P1/P2/P3/P5: UNGRADABLE (instrument §2; explicitly NOT fail).
- P4: absence-holds stands (no SEL53 row anywhere resolves to 08:40,
  defining or witness); walk leg void. Report-route, no extension.
- P6: origin PASSES (09:40 M5, lineage F2_SA, haltNC=0); reseat void.
- P7: S1-flip PASSES (decided SHORT, decline=0, invariant present);
  S2 undecided → FAIL-WITH-GAP (advancement halt; evidence attached).
- P8: PASSES. C5: antecedent fails → no line (rule as written).
- Carried triggers: L3via run-wide from clean families = 0
  (discriminator re-verified identical: SEL60DISC 1 + DISCEND
  byte-identical); >1-forming-limb none; no timeout (46:43 < 90);
  unattributed admission 0. None fired.
- SEL53_FINAL moves (6 finals), SEL58END scanned shifts (all 84),
  SEL57 re-baseline (872 rows, 14 lists + ENDs intact): VOID for
  grading (contamination), listed here so nothing is silently dropped.

## 9. Build-2 proposal (for v24 clearance — quoted verbatim there)

Three functional one-liners (route n to the cell; publish per-bar tO
via a precomputed array; reset tO before census) + one global + one
fill line + aux extension (firstVal + sideOk for §6 adjudication).
Pre-hash e5a5cc24 + diff-verified post-build per v15 precedent; parity
re-audit; compile 0/0; same ini/range; ONE rerun ~1h (operator cost NOT
spent — asked in v24, never assumed).

## 10. Files

- Archive: `06_HANDOFFS\RECON23-STAGE2_JOURNAL.log` (50836 / 9706928 B
  / 6d59f7d0… / [205308..256143]).
- Extracts: `06_HANDOFFS\RECON23_SEL61.txt` (642), `RECON23_SEL53.txt`
  (192), `RECON23_FINALS.txt` (1100).
- Scripts: `00_CURRENT_WORKING\tabulate_recon23_stage2.ps1`,
  `compile_stage2_ea.ps1`, `compile_stage2_flow.ps1`,
  `launch_stage2_run.ps1` (WMI form, proven instant RC=0).
- Logs: `06_HANDOFFS\T162_STAGE2_EACOMPILE.log` (0/0),
  `T162_STAGE2_FLOWCOMPILE.log` (0/0).
