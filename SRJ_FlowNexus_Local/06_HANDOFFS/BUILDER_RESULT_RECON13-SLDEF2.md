# BUILDER_RESULT_RECON13-SLDEF2 (P-SLDEF-2, E23–E26)

STATUS: 11/12 ACCEPTED (council verdict 2026-09-13). Gate-8 halt ruled
CORRECT and INCONCLUSIVE (fails to test, not a failure). RECON12c stays
frozen. EA 13560ABF… stays uncommitted. P-SLDEF-3 ISSUED.

## Run record

- Packet: P-SLDEF-2 ISSUED → EXECUTED (E23 ladder, E24 match, E25 lifetimes,
  E26 audit-order fix; print-only; MTEXIT untouched).
- Build: EA `13560ABFF6814F37F61DFEFA7D2903BB5B21EFB270C6EF9411B92981FDBC4648`
  (341466 B, 0/0); FlowLogic `3606BFB4…` UNCHANGED (0/0). Gate 1 PASS.
- Window/ini: RECON1_P1.ini unchanged. 563338 ticks / 3168 bars.
- `Test passed in 0:49:18.686` (00:30 new-log line 9698; agent log-written
  9701; connection-closed 00:30:47). Duration differs from the 1:06–1:07
  band of RECON10–12c with identical ticks/bars — observation only, no gate.
- Midnight split: the run crossed 00:00 server. Wrapper wrote DONE=
  UNDETERMINED, ARCHIVED_LINES=0 (its archive compares the new log's count
  against the old log's PRE count — split-blind; defect owned, harness-side).
- Manual archive per standing protocol: old log lines [155667..163218]
  (PRE_JOURNAL_LINES=155666) + new log lines [1..9704] =
  `RECON13-SLDEF2_JOURNAL.log`, 17256 lines, LEN 3212767,
  SHA256 B79C59714E4186954998308247ECACF18E0360BFE415A12E00E0631F5A8297C4.
  Purity triple on the segment: exactly 1 Test-passed, 4 signals, 481 SLIMB.
  Segment head = tester-launch line 23:41:12 (run-related). Segment tail =
  run-ending connection-closed 00:30:47 + two post-run idle tester lines
  05:32:20 (farm/cloud off — match no gate pattern; kept per RECON12c
  precedent, disclosed here).
- Tabulation: `RECON13-SLDEF2_TABULATION.txt`. Join: `RECON13_GATE3_JOIN.txt`.
- Harness repairs this session (local tooling, future runs only; this run
  used the prior code already in memory): launcher detach via Start-Process
  + file redirection (the 10-min launch-call hang); Read-Journal O(n) via
  List.Add (the 15-min silent pre-flight at a full CPU core). Both
  parse-checked. Recorded in AGENTS §8.

## Gate verdicts

2. Identities verbatim — PASS (CQD 906 = 170/308/263/165; WS161 fields 21 /
   changes 205 / mismatch 0; SLMEMO 471/118/589; SL_REF 432/39/10; INPLAY
   157/46; MTEXIT 4 = TP_TOUCH 3 + HTF_FLIP 1, rows verbatim; aborts
   18/37/13/11/2/0/12; PROMO 469; CONFIRMPOLL 555; SUPPRESSED 156; four
   signals verbatim incl. 9/07 16:45 LONG R1.25 SL 1.16218 TP 1.16315;
   N1 28/26/0/3 with pairing byte-identical to RECON12c incl. exit 0/0;
   guardApplied=60; sideViolations 0 / sideFracViolations 0).
3. Instrument inert, fifth build — PASS: SLIMB/WALKOB/WALKFR 481/481,
   SLIMBR 10/10 on the bar|site join vs RECON11b, deltas+classes, ZERO
   mismatches, zero missing.
4. Census — PASS: rows 11, rowsInWindow 1 (NFP 9/04 [15:25,15:40)),
   memberBars 3, mismatch 0, overlaps 0, Oct-28 offset 360, HALT 0.
5. Ladder shape — PASS: 10/10 S5 rows populated, 8/8 rungs each (80 lines,
   BADFMT 0, ladFresh 1 on all 80). rungExt monotone on all 10 rows
   (off-log check). Distinct barTime on all 80 rungs. Max rungR 3.84,
   min distPts/maxima reported per row on disk.
6. todayRef — PASS with the designed finding: ON_LADDER 4 rows,
   TODAY_OFF_LADDER 6 rows, each OFF row carrying a nonzero residual
   (-17, +54, +5, +77, +5, +20). Six isTodayRef=1 rungs sit on the 4 ON
   rows (9/07 rows hold today's price TWICE each — duplicate-px rungs at
   two shifts; tie rule resolves inward, disclosed).
7. Level resolution — PASS: Sep-7 1.16240 → MATCH on the 16:40 row
   (rung 0, slot 1, ext 0, 16:30, resid 0). Sep-4 1.15907 → NOMATCH on all
   three Sep-4 rows with nearest rung named (09:25: rung 6 slot 31 ext 4
   resid -317; 10:35 SHORT: rung 5 slot 31 ext -1 resid -367; 15:55:
   rung 0 slot 1 ext 0 rungT 15:45 resid +5). Statuses MATCH=1 NOMATCH=4
   NOLEVEL_FILED=5 = 10 rows. Decisive gate: his Sep-7 level IS a rung.
8. Ghost falsifier — HALT (see §halt). The 16:40 row's 8 rungs span slots
   1–29 (16:30–14:10), px 1.16247–1.16209. 1.16112 is NOT among them.
9. Lifetimes — PASS: 4/4 rows, BADFMT 0, all booleans present, all 0.
   Sep-4 record opened 16:00 closed 16:00 (HTF_FLIP) — never open at any
   boundary, so dayFlat=0 stands WITH operands against the 23:55 hand
   flat (quote: HTF_FLIP @16:00 exit 1.15990 vs his flat 1.16129@23:55).
   CANCEL_BIAS path instrumented, unexercised (0 occurrences).
10. Width — PASS: 14/14 classes with LINEWIDTH lines (ROW max 188, CENSUS
    max 246 — both present, E26 goal achieved), truncated=0 everywhere,
    BADFMT=0 on all three new classes. Maxima: SLADDER 291, MATCH 230,
    MTLIFE 208.
11. Spot — PASS: INPLAYCOMMIT 157, XOBPROMO 157, SWEPTMASK 443, identical.
12. Digests above; FlowLogic re-stated unchanged; manual archive recorded
    (method + SHA + length, no mtime). NO COMMIT (gate 8).

## §halt — gate 8 fired per the packet's own clause

- Required: the Sep-7 PM S5 row shows 1.16112 as a rung with two indices
  + imbCode. Measured: absent from rungs 0–7 (slots 1–29).
- Operands: the same row's fractal walk runs fracSteps=20 to base 1.16112
  (SLIMBWALKF, fracClass CARVEOUT_FIRED, nuance 1.16240). The walk's base
  lies DEEPER than the packet's 8-rung cap reaches — absence is
  cap-adjacent, not ghost evidence. Halted with exactly these operands.
- Label mapping for the record: gate 8's "16:45 row" is the SIGNAL bar;
  the S5 eval row feeding it is bar=16:40 (ladder site per E23). No second
  Sep-7 PM S5 row exists (09:15 + 16:40 only). Evaluated the 16:40 row.
- Correlated finding (same row family): on the 15:55 Sep-4 row, today's
  OB-derived ref EQUALS his level to the point (slToday = slNuance =
  slFractal = 1.15907, class TODAY_EQ_NUANCE) yet the 8-rung ladder holds
  no swing there (nearest rung 0 @15:45, resid +5) → TODAY_OFF_LADDER +
  NOMATCH. The granularity question now has both directions on disk.

## E26 deviation (disclosed, graded by gate 10)

- The packet's one-line move (finalize before the loop) restores ROW's
  line but leaves CENSUS unsummarized; gate 10 names BOTH classes. The
  summary loop itself was therefore relocated after the census print
  (finalize unmoved). Gate 10's 14/14 lines are the on-disk proof.

## Questions owed to council (relay attached)

- Q1: extend the ladder (more rungs / slot bound) in a follow-up, or rule
  the 8-rung absence itself the ghost finding?
- Q2: confirm the 16:45-signal / 16:40-S5 mapping used for gate 8.
- Q3: approve the E26 mechanism deviation (goal met, gate 10 green)?
- Filed for the record (no ruling asked): 15:55 equality-vs-absence pair,
  duplicate-px today rungs, 0:49:19 duration observation, harness repairs.

## Files

- `06_HANDOFFS/RECON13-SLDEF2_JOURNAL.log` (17256, B79C5971…, LEN 3212767)
- `06_HANDOFFS/RECON13-SLDEF2_TABULATION.txt`
- `06_HANDOFFS/RECON13_GATE3_JOIN.txt`
- `00_CURRENT_WORKING/{launch_sldef213run,tabulate_sldef213run,join_13_vs_11b}.ps1`
  (+ compile_sldef2_{ea,flow}.ps1, T162_SLDEF2_{EA,FLOW}COMPILE.log)
- EA 13560ABF… UNCOMMITTED; FlowLogic 3606BFB4 unchanged; tree otherwise
  clean except the two debris files awaiting the operator deletion word.

## Verdict 2026-09-13 — 11/12 ACCEPTED, gate-8 halt CORRECT + INCONCLUSIVE

- Halt stands as correct: cap-adjacent absence is not ghost evidence.
  "Fails to test" ≠ failure. EA 13560ABF… stays uncommitted.
- Q2 mapping CONFIRMED (signal 16:45 = S5 16:40 + PeriodSeconds); 5th
  convention joins FRAME_NOTE; SIGMAP 4/4 gated (E30).
- Q3 E26 deviation APPROVED (one-liner self-defeating; 14/14 proof).
- Q1: EXTEND, bounded by COVERAGE (ladCovers + ladCap/ladCapHit;
  rung count becomes output). Off-disk density note flagged as estimate.
- Findings: Sep-4 15:55 equality-vs-absence = probable frame #4
  (slot identity over price proximity; +5 twice); FRAC_OFF halts,
  TODAY_OFF stays a finding; MTLIFE zero-length record = evaluation-order
  question for MTFLIP; flats PROVISIONAL; −15 label pair resolved by
  content (rung 0 = 16:30 bar = his 16:15 low); archive = purity segment
  + SHA + count + boundaries (wrapper = convenience, no more repairs in
  canonical packets). Zero-step falsifier off 11b/12c/13 logs: 0/0/0.
- E29 expectation corrected on disk: vHTF=1 fires ONCE (Sep-4 16:00,
  anti=2), not four — per-evaluation emission gives MTFLIP_N=1; gate 10
  grades barsHeld/sameBarFlip, not the count.
- P-SLDEF-3 ISSUED (E27 coverage, E28 slot identity, E29 flip operands,
  E30 conventions gate; print-only; MTEXIT stays 4).
