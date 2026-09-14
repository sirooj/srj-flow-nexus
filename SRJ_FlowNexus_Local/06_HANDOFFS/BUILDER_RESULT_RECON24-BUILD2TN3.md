# BUILDER RESULT — RECON24-BUILD2TN3 (build-2 TN3 single authorized run)

**Verdict: GRADED — P1/P2/P3/P4/P5/P6-origin/P8 PASS; P6-reseat FAIL (6 ineligible
lines, filed §3); P7 FAIL-with-gap (pre-registered). P-c clean (0 halts, nothing
voided). RECON23 void list CLOSED by this run. Council ruling owed (v30 relay):
accept record + rule the P6-reseat FAIL (finding vs fix packet).**

## 1. Run facts

- DONE=PASSED 2026-09-14 20:26:46. Test passed in 0:49:09.570.
  3168 bars / 563338 ticks (same footprint as RECON23).
- Archive `06_HANDOFFS\RECON24-BUILD2TN3_JOURNAL.log`: 36961 lines /
  7247515 B / SHA256 `87226cb4b30df644765187a5c5db07172b000519a468c130a01c92d0b7d71c9f`
  / bounds [256144..293104] (PRE=256143 contiguous from RECON23).
- Purity: farm-off x1, cloud-off x2, single agent 127.0.0.1:3003
  (started + authorized build 6182), Test-passed x1, Core-04 only.
  MAXLEN=537 (=cap, zero exceedance), content 489.
- Signals 4/4 byte-identical vs RECON23 (SHORT 08-28 R=2.43 SL 1.16508;
  LONG 09-04 R=2.56 SL 1.15907; LONG 09-07 AM R=1.76 SL 1.16098;
  LONG 09-07 PM R=1.25 SL 1.16218). ALERT diff=0.
- No timeout (49:10 < 90). No terminal leftover. Build 703c3b0a
  uncommitted; FlowLogic 3606BFB4 unchanged; RECON17 frozen.

## 2. P-grades (frozen rule + C-note/Amendment A, no reinterpretation)

- P1 PASS: R1 V005 (MONO/M5) def=1 px=1.16508 bt=06:30 slot=43 R=2.429
  g1m=1 retm=1 — full R1 cell byte-identical vs RECON22 (diff 0).
- P2 PASS: R2 cell strict line-identity vs RECON22 (diff 0); V005
  1.16297@10:05 decl=1 (MUST-DECLINE stands); G1x4/G2x3 counts in §4.
- P3 PASS: R3 cell strict line-identity vs RECON22 (diff 0); V005
  1.15847@15:30 R=1.661 g1m=1 retm=1 (filed MATCH).
- P4 PASS (report-route): R4 cell identical vs RECON22 (diff 0); filed
  1.16098@08:40 absent both TFs; walk level 1.16088@08:20 as on 22.
  Reported, no extension ships.
- P5 PASS: R5 cell identical vs RECON22 (diff 0); walk retains 16:05
  px=1.16238 retm=1 R=2.478; anchor unshifted (wit 16:30). Any-movement
  STOP not triggered.
- P6-origin PASS: SEAT 14/14 identical (S1-M5 09:40 itself, lineage
  F2_SA, haltNC=0).
- P6-reseat FAIL (§3): 6 S1 lines differ vs RECON22 (3 ineligible H1
  variants V008/V016/V024, in/out = 6). A3 identity falsified; applied
  without reinterpretation.
- P7: partition exact (SIDE 7/7 identical: S1 SHORT decline=0 decided,
  S2 ABSTAIN evidence-plus-gap); S2 gap -> FAIL-with-gap
  (pre-registered, advancement halt).
- P8 PASS: probe 14/14, verdicts identical vs RECON23 (R5-L PRESENT@16:15
  mechanism-alive; R4-L PRESENT width-artifact; directionals sane).
- C5 OPEN-SPEC-DIVERGENCE (emitted per rule): probe R5-L PRESENT@16:15
  while P5 retains 16:05. Filed 1.16239@16:15 stays authoritative.
- P-c: SEL61HALT=0, NOEVENTS=0 -> nothing VOID, nothing failed by cut.
- Carried triggers: L3via run-wide 0 (DISC 1 + DISCEND identical);
  >1-forming-limb none; unattributed admission 0. None fired.

## 3. The P6-reseat FAIL (measured — council adjudicates, builder does not)

- The 6 lines: S1 V008/V016/V024 (all elig=0, K=1, H1) flip def=0
  FRACTAL_UNAVAILABLE (skE=3) -> def=1 px=1.16412 bt=09-03 19:50
  slot=1324 R=0.498 take=0 decl=0 g1m=0 wit=1.16359@09:05 skN=1 skE=7.
  All 12 eligible S1 rows byte-identical (M5 defines 1.16359@09:05;
  H1 defines 1.16329@09-07 / 1.16358).
- Same signature on S2 (12 lines, REPORT-ONLY per A4, never halting):
  H1 rows V006/V008/V014/V016/V022/V024 (K=0 AND K=1) flip to def=1
  @1.16412 09-03 (take=-2 TARGET_UNSTATED). M5 rows unchanged.
- Pattern: H1-only, Sep-8-bars-only, one ancient level. R1-R5 H1 rows
  diff 0.mechanism note (not a finding): 1.16412@09-03 is an admitted
  limb since stage-1 (RECON22 shadow: admitted_by=legacy+L1+L2,
  l3via=0) — the cells surface a stored limb the legacy H1 walk could
  not count on those bars. No new admission: SEL60DISC + SEL60END
  diff 0, token S-A-LIVE, l3via=0.
- C2 applicability: enumerated triggers NOT met — no new limb binding
  (DISC/END 0), seat is 09:40 (SEAT 0), no side delta (SIDE 0). A3's
  identity letter applied as written (FAIL); the consequence class
  (finding vs fix packet) is the council's — zero selection consequence
  either way (all 9 flipped rows take=0/decl=0/g1m=0; no halt fired).

## 4. Clean record (message-content diffs 24-vs-23, all zero)

- SEL60END 0 (F4 oracle (a) HOLDS). SEL52 census 14376 + SEL52_FINAL 24.
  SLIMB/SLIMBWALK/SLIMBWALKF 481x3. SLIMBR 10. SEL55 5/5. SLEXT1 10,
  SLEXT45 10, SLEXT47 118. ORIGINREG 5. SUPPRESSED 152. SEL54BAR 2.
  SLADDER 336. SEAT 14/14. SIDE 7/7. DISC 1. PROBE 14/14. SIGNALS 4/4.
- Oracles 14 / 892 / 14376 / 481 / 10 / 5 / 1 / 0 all met (SEL60END 14,
  SEL60LIMB 892, SEL52 14376, SLIMB 481, SLIMBR 10, SEL55 5, DISC 1,
  halts+OrderSend 0). 23=22 on these families (RECON23 D3), so 24=22
  transitively. SEL53_FINAL identical (G1x4/G2x3 per A1).
- Funnel: SEL61SRC 599 stamps dups=0 (one-writer holds; N1 duplicate
  confirmed harmless). SEL61LIVE 56/56/0. Summaries nominal: INV
  declines=1 promoAtt=0 overturnBlocked=0 wiring=OK; OVR 0/EMPTY; INDEP
  adopt=0 ordersend=0/0 sizefields=0 h4branches=0; SUMMARY h4reads=7
  drops=0 tiebreak=0 haltNC=0.
- Walk corroboration (REPORTED, S2-1 order): SEL57 14 lists + ENDs
  intact (872 rows re-baselined); SEL58END 84/84 sentinels, scanned
  3-25 (cell counts; 23's 14325 legacy-scan traces retire with the
  fixed source); SEL58T 468.

## 5. Scope, fresh (L6"/L7' as built; N3 count)

- Same 4 candidate violations as RECON23 (same bars/values/mode, all
  S2POLL off-example): 08-28 18:00 1.16589; 08-31 11:05 1.16084;
  09-02 14:25 + 14:30 1.15662.
- Now WITH operands (caveat closed): all four f1=1 + sideOk=1
  (fval=1.16225 / 1.16058 / 1.15669x2) — first leg protective in all
  four, so the VIOLATION label is conservative by the coded rule
  (fi==1 -> table EMPTY -> violation); filed as finding, REPORT-only.
- N3: stamps carrying f1=-1 = 0 (every scope stamp read its first leg;
  the fallthrough path unexercised). UNGROUNDED 118 = all MEMO_HIT
  routing by design (A6); zero EXH/shape ungrounded.

## 6. Landing table (walk vs five filed stops + S2 gap)

- R1: walk 1.16508@06:30 — filed 1.16508@06:30 MATCH (resid 0).
- R2: declined (decl=1) — hypothetical 1.16299 untouched; MUST-DECLINE.
- R3: walk 1.15847@15:30 R=1.661 — filed 1.15847@15:30 MATCH.
- R4: walk 1.16088@08:20 — filed 1.16098@08:40 absence-holds (report).
- R5: walk retains 1.16238@16:05 (R=2.478) — filed 1.16239@16:15
  authoritative; C5 divergence above.
- S1: M5 defines 1.16359@09:05 (flip SHORT decline=0 decided); his
  1.16258 unreproduced (standing gap, unchanged).
- S2: TARGET_UNSTATED + ABSTAIN (gap, branch reads filed in §3).

## 7. RECON23 void list restated (CLOSED)

- P1/P2/P3/P5/P6-reseat were VOID on RECON23 (instrument §2 of that
  result); all are GRADED above on RECON24. No family is void on this
  run (P-c: 0 halts). The contamination signature is gone (no 00:40 /
  05:05 landings; R1wit 09:55, R5wit 16:30, S1 M5-rows as on 22).

## 8. Asks (v30 relay)

1. Accept this record (run + grades + clean families + scope).
2. Rule the P6-reseat FAIL: finding (ineligible-only, take=0, no halt,
   no new limb) vs fix packet (builder proposes nothing until ruled).
3. Confirm nothing builds/runs/commits; RECON17 frozen; 703c3b0a
   uncommitted (no token sought).

## 9. Files

- Archive: `06_HANDOFFS\RECON24-BUILD2TN3_JOURNAL.log` (36961 /
  7247515 B / 87226cb4… / [256144..293104]).
- Extracts: `06_HANDOFFS\RECON24_SEL61.txt` (642),
  `RECON24_SEL53.txt` (192), `RECON24_FINALS.txt` (1100).
- Scripts: `00_CURRENT_WORKING\tabulate_recon24_build2tn3.ps1`,
  `compile_stage2_ea.ps1`, `compile_stage2_flow.ps1`,
  `launch_build2tn3_run.ps1` (WMI form, instant RC=0).
- Logs: `06_HANDOFFS\T162_BUILD2TN3_EACOMPILE.log` (0/0),
  `T162_BUILD2TN3_FLOWCOMPILE.log` (0/0).
- Markers: `00_CURRENT_WORKING\RECON24-BUILD2TN3_STATUS.txt` (PASSED
  gates) + `RECON24-BUILD2TN3_DONE.txt` (PASSED 20:26:46).
