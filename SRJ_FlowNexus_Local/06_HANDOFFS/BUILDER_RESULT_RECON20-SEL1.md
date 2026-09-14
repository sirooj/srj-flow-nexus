# BUILDER RESULT RECON20-SEL1 (P-SEL-1) — BLOCKED: run incomplete, no Test passed

Build: EA `44D0923B…` (P-SEL-1 build 1, both compile 0/0, FlowLogic unchanged).
Launched 23:39:07 PID 18864, PRE_JOURNAL_LINES=172665 (contiguous from RECON19).

## 1. Terminal state (measured, not assumed)

- DONE file: `RESULT=UNDETERMINED`, 01:27:11. This is the wrapper giving up, not success.
- Day-log scan: NO `Test passed` for this run in either log. Last test-time line ≈ Sep-07 18:30 (wall 00:22–00:24). Journal frozen 62 min (00:24:25 → 01:26:06), then `connection closed` 01:26:00 (20260914.log line 7042). Terminal stayed alive; the tester AGENT died mid-window.
- Verdict: INCOMPLETE RUN. No packet measurement gate was failed — no full-window evidence exists to grade. Cause of the agent death is NOT established from these markers. The EA hanging is excluded by construction (all live P-SEL-1 hooks are loop-free straight-line prints; the only loops run at tester end, which never executed).

## 2. Archive (manual protocol, midnight split)

- `06_HANDOFFS\RECON20-SEL1_JOURNAL_PARTIAL.log`: 16363 lines (13-log 9321 + 14-log 7042),
  SHA256 `163499F62401B56E65187F82641BFE032F4B6F33A26F548E6CEBE22317024FF6`,
  first `23:39:08 Local network farm switched off`, last `01:26:00 connection closed`.
  UTF-8 (BOM, recorded). Name says PARTIAL and means it.
- Tabulation: `RECON20-SEL1_TABULATION_PARTIAL.txt` + `RECON20-SEL1_TABFIX_PARTIAL.txt`.

## 3. What landed (partial, on-disk)

- E55 COMPLETE for the mapped five (`SEL55` 5/5, maxlen 177, trunc 0):
  R1 SHORT 1.16466/1.16364, R2 SHORT 1.16265/1.16224, R3 LONG 1.16018/1.16302,
  R4 LONG 1.16135/1.16200 — code side/entry/target ALL EXACT vs HAND.
  R5 LONG entry exact, TP 1.16315 vs HAND 1.16318 (+3 known Yearly-VWAP drift).
- CQD-state (printed, never consumed): EMPTY at all five S5 rows. The frozen
  CQD computes no-divergence at R2's bar; his updated chart CQD rules it
  invalid. The divergence is now DATA, not just claim (R2 must-decline stands).
- R5 SLIMBR (last, 16:40): conservative refs all 1.16112 R 0.36; his stop lives
  in slFractalNuance 1.16240 R 2.56; slExt1 1.16238 R 2.34. Frozen identities intact.
- Live hooks proven: CTX 497 rows, handles M5=13/H1=14 err=0, SLIMB-family
  partial 398/398/398 + SLIMBR 9/10, branch split 364/34 (ratio consistent).
- Max printed lengths 224/177 — zero truncation pressure.

## 4. Builder print defect OWNED (CTX site-shift)

`SEL52CTX` lines carry 9 format specifiers but 8 args — `site` was not passed.
Every field right of bar is shifted one left (site slot holds DirName, …, mode
holds a pointer read as int, halt starved). LOST from print: site, slMode,
halt flag. Recoverable by unshift: dir, oPx, oBT, slRef values are present.
Site is re-derivable for S5 rows (SLIMBR-bar join); memo-site split is not.
The in-memory arrays (which the end-of-run matrix would have read) were
correct — the defect is print-only, but the run died before end-of-run, so
nothing grades off it. FIX (specified, NOT applied — no token): pass `site`
as the third arg. One-line change, zero logic impact.

## 5. What did not (needs a rerun)

- SEL52/SEL53/FINALs: absent (end-of-run never executed) → G1/G2/G4 UNEVALUABLE.
- SEL54 (presence): absent (Sep-8 bars never processed) → G5 UNEVALUABLE.
- Isolation join: partial only (398/481 rows) → UNEVALUABLE as a gate.
- G3/G6 moot without G1. E55/R-accounting: graded §3.

## 6. Rerun ask (v15 relay owed)

Both verdicts forbid automatic rerun. The v15 relay will ask dual-key clearance
for: build 2 (bit-identical to build 1 EXCEPT the one-line CTX fix, verified by
diff) + ONE rerun, same ini/range. Operator cost: another ~1 hour — HIS call,
flagged here explicitly. No code moves until both streams name it.
