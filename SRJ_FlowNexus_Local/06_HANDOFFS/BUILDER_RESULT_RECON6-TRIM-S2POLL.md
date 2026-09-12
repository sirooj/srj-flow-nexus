# BUILDER_RESULT_RECON6-TRIM-S2POLL.md — P-TRIM-S2POLL EXECUTED AND VERIFIED

## S0 precondition (all three PASS on 1478ADCF, measured — no adaptation needed)

1. Zone reads inside ComputeSlReference (L2073–2375) are PrintFormat args only
   (SLSIDEGUARD/SL_REF prints); Task 67 exclusion `[STEP 1 RETIRED]` (L2230);
   Task 75 walk (L2193–2213) tests side vs slCurPx, no zone test; all returns
   depend on side tests only.
2. Exactly three live call sites: S2POLL (L3355), S3ARM (L4211), S5 (L4568).
3. S3ARM sits inside `if(haveXob && !haveFvg && s31_zHi > 0.0 && s31_zLo > 0.0)`
   (L4199). Program order confirms the memo model: S2POLL gate (L3333) is
   evaluated BEFORE the IDLE seed (L3733) and S1 handler (L3740), so cascade
   bars skip S2POLL in the same pass.

## CQD §2 question SETTLED (read-only, no run)

The +3/+1 is a TABULATION artifact, not a source movement. Pure
`CQD DIV verdict=` counts are 170/308/263/165 in BOTH RECON3 and RECON5.
tabulate_build3.ps1 filters DIV-first (pure); tabulate_fixrun/tabulate_fvg
count loose `verdict=-1/-2` and pick up 4 path-dependent CONFIRM_DIV_WAIT
contaminants (3x verdict=-1: 8/31 16:35, 9/1 16:50, 9/4 09:40; 1x verdict=-2:
9/1 10:10 — identical lines in both journals). The per-bar DIV census (above
UpstreamReady, path-independent) is unmoved at 906. Carry 170/308/263/165
forward with the DIV-first method (used in tabulate_trimrun.ps1).

## Probe D — M=39 (measured, `00_CURRENT_WORKING\probe_d.ps1`)

6 trans-only + 33 seed(+trans) cascade bars (list in script output; includes
8/28 10:00, 9/4 09:30/09:40, 9/7 09:00). Council's "expect M small" was wrong;
M=39/157. Expected: demands=589, computes=471, hits=118, S3ARM SL_REF=39.

## S1–S4

- S1 PASS: EA 1478ADCF…BA74 (261040 B, 4882 lines per Get-Content).
- S2: E1 memo block after ComputeSlReference + both call-site swaps + OnDeinit
  SLMEMO_CENSUS; E2 dead reads (Task 21 override pair verified unconditional
  below); E3 four hoists (udl_limit L2483, za_limit L2678, zip_limit L2828,
  s31_legLimit L4021; zero `s <= barShift + Bars(...)` remain; t127/t133
  untouched). E4 DEFERRED per council recommendation (operator elected nothing).
- S3: EA 57B2F9D3F2D96DED256303086E0196F79B19CD7AA5FE6B0123E7E53084A9B61E
  (266664 B, +5624). Only the EA touched.
- S4 PASS: "Result: 0 errors, 0 warnings, 1837 ms elapsed"
  (06_HANDOFFS\T162_TRIM-S2POLL_COMPILE.log, gitignored; metaeditor log is
  UTF-16 — read with -Encoding Unicode; blank EXIT= is the harness capture
  class, the log line is the instrument).

## S5 — two attempts; record = attempt 2 (declared)

- Attempt 1: launched 22:00:35 (PID 12480; leftover 10204 closed graceful first).
  Wrapper TIMEOUT_60MIN at 23:13:10 with agent frozen at 9/9 14:25, no marker.
  Terminal closed graceful by builder, verified gone. SEGMENT SUPERSEDED.
- Attempt 2: launched 23:21:23 (PID 22092; PRE=110544). Wrapper TIMEOUT_60MIN at
  00:22:37 BUT the agent survived (wrapper never kills) and finished:
  "Test passed in 1:03:23.693", 563338 ticks, 3168 bars, marker 00:24:58.582.
- Midnight rollover: day log 20260911.log → 20260912.log at ~00:04 (wrapper
  heartbeats tracked the new file; ARCHIVED_LINES=0). Manual archive across
  both files: 20260911.log 110544..120999 (10455) + 20260912.log 0..5100
  (5100) = SEG 15555 → 06_HANDOFFS\RECON6-TRIM-S2POLL_JOURNAL.log (2465149 B).
  Builder DONE marker written; wrapper TIMEOUT DONE superseded by the journal
  marker per manual completion protocol.
- Lesson carried forward: on this machine (~1:03–1:05 runs) the wrapper's
  60-min ceiling WILL fire; the terminal continues; plan the two-file manual
  archive whenever a run crosses midnight.

## S6 gates — ALL PASS (RECON6-TRIM-S2POLL_TABULATION.txt, 22 lines)

- G1: 3168 bars / 563338 ticks / Test passed ✓
- Four-signal set VERBATIM (8/28 SHORT R2.43 SL 1.16508 entry 1.16466; 9/4 LONG
  R2.56; 9/7 R1.76 + R1.25) ✓
- WS161 fields=21 loads=stores=3168 changes=205 mismatch=0, LOAD NOSTORE x1 ✓
- INPLAYCOMMIT applied=1: 157 both runs; all 157 committed= values IDENTICAL
  bar-for-bar (0 diffs) — the strong gate holds ✓
- Memo identity: demands=589 computes=471 hits=118; 471+118=589 ✓ (no fourth
  call site). HIT lines=118. SL_REF S2POLL=432 (P unchanged), S3ARM=39 (=M),
  S5=10 (=RECON5). SL_STRUCT S3ARM=3. Calls removed=118. S2POLL_NO_SL_REF=0 ✓
- CQD DIV-first 906=170/308/263/165 ✓; BIAS 1554/1614 x2 ✓; ZONE 3168/1056
  fvgOnly=0 ✓; PROMO 469 ✓; CONFIRMPOLL 555 ✓; SUPPRESSED 156 ✓;
  aborts 18/37/13/11/2/0/12 ✓; MTEXIT 4 verbatim ✓; MTSNAP 4 ✓
- Acceptance diff vs RECON5 (minus SLMEMO*/S3ARM/SWINGDUMP#/wall-clock):
  residual = 26 lines, ALL tester-harness/environment (memory, ms timings,
  history download/check, ex5 bytes 145082/146638, agent log paths) — ZERO
  EA-behavior lines ✓
- G4: post-run EA digest 57B2F9D3… byte-identical to S3 ✓
- Wall time 1:03:23 reported, not gated (council §8: no material move expected;
  none claimed).

## S7 state

- NEW EA BASELINE: 57B2F9D3F2D96DED256303086E0196F79B19CD7AA5FE6B0123E7E53084A9B61E
  (266664 B, T162_TRIM run-verified). The 1478ADCF set SUPERSEDED.
- E2 admission gain confirmed 0 in-window (council §3 correction stands:
  Q2 encoded but unexercised).
- haveStop post-trim: read from INPLAYCOMMIT haveStop= field (line-presence
  method retired — S3ARM lines now exist only on the 39 cascade bars).
- Artifacts: packet filed 01_TASKS\PACKET_P-TRIM-S2POLL.md (verbatim council
  text); result + TABULATION + JOURNAL (gitignored) in 06_HANDOFFS;
  compile_trim/launch_trimrun/archive_trimrun/tabulate_trimrun/probe_d scripts
  + STATUS + builder DONE in 00_CURRENT_WORKING; T162_TRIM-S2POLL_COMPILE.log
  gitignored. E4 not applied. No git action, no 02_TASK_CHECKPOINTS write,
  ALERT-ONLY preserved.
- Queue: P-SL-IMBALANCE-A ISSUED (council relay 2026-09-12; operator rulings
  a–c answered: outward-step count, walk-back default, wick-only nuance);
  RECON scale-out window (operator's word); debris deletion word; snapshot
  on token.

## Addendum 2026-09-12 (read-only, no re-run)

- Council's two independent memo-model checks land exactly on this run's
  journal (`SL_REF`-anchored): `site=S2POLL` = 432 (=P), `site=S3ARM` = 39
  (=M). 471+118=589; 157-39=118 proved from two directions; no fourth call
  site. Method note: unanchored `site=` counts (1794/275) include memo
  lines — tabulations must anchor `SL_REF`.
- CQD identity carried DIV-first: 170/308/263/165 = 906 (council-confirmed;
  RECON5's 170/308/266/166 annotated as parser artifact in its record).
