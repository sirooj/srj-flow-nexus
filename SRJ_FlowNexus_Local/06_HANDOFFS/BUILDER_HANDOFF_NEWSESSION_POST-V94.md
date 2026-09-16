# HANDOFF — NEW SESSION POST-V94-COMBINED-BUILD (run RECON37 here: build DONE, launch+grade owed)

**Cut:** 2026-09-16 ~16:05 UTC, build session at 51% usage. **Read this file first, then follow section 7's prompt.** Prior handoffs superseded for the work below (archive stays).

## 0. One line

Combined print-only build DONE and verified (EA `77E26216`/581593, both compile 0/0); the tester run RECON37-COMBINED was deliberately NOT launched here — this session launches it, grades it, and relays it.

## 1. Authority (exact)

- Luna `V94-COMBINED-PRINT-CLEAR-001`: ONE print-only build + ONE run covering F1 `S2-TIMING-SHADOW-001` + F2 `R2-CQD-PROBE-001` + F0 `S2R2-ELIGIBILITY-SHADOW-001`, STAGE-1/build-gate/0/0/ceiling-90/grade terms. NO tokens (print-only). Sonnet `V94-COMBINED-PRINT-REVIEW-001` + Sonnet-live web concur, review-only.
- Run word: CARRIED from his order ("build here but halt your run... make the new session run the tester there") — spend it AT LAUNCH of RECON37, nowhere else.
- Locks: RECON17 frozen; EA + fixture UNCOMMITTED (no council token — never commit); his demo terminal (PID 22420 at handoff) NEVER touched — wrapper REFUSED_TERMINAL_BUSY is safety, not failure; debris ×2 untouched.

## 2. Tree state (verify before anything else)

- EA `Experts\SRJ_FlowNexus_EA.mq5` = `77E26216EA10BA9D4F88A56F97ED84142D50E516776AF6B5B2BE8771DA4BD7DC` (581593 B). FlowLogic `3606BFB4` (67515 B) unchanged. HEAD `133531b`; working set = AGENTS + EA + verdicts + records modified, full untracked records (journals/logs/ex5 ignored). If the EA hash differs: STOP, do not launch, diagnose (never assume drift, never revert on assumption).

## 3. What the build did (do NOT rebuild)

On base `7F01804E` (+4612 B): (F1) `SIDE1T_SEEDBIAS` recorder inside the seed block reusing `CheckLtfAlign` (same helper as the S2 path) + seed-this-bar gate (s1f_seedArmed/S1/dir/anchor idiom); candidate dir via file-scope `s1g_legDir` (equals pr.isLong on seed bars — a scope defect `pr`-outside-block was caught BY THE COMPILER 0-error round, repaired same turn, recompiled 0/0). (F0) `SIDE1O_ELIGSTATE` + (F2) `SIDE1Q_CQDKILL` at Region W pre-latch reusing currentPrice/tpTarget/slRef/tpOk + established buffer idioms. Parity: g_dir writers 4 (unchanged), OrderSend( 0, DetectPoiRetest 4 (no fresh scan), AdoptOff held. Both compile 0/0 fresh logs (`06_HANDOFFS\T162_COMB_EACOMPILE.log` EA 16:03:26, FLOW 16:03 direct). imb-identity CLOSED at build: stop-imb = buffers 37/38, OB-validity = buffer 3 — different inputs, printed side-by-side, never aliased. ADD6 adherence filed on `7F01804E` (gate satisfied).

## 4. His answers that route the plan (filed, never re-asked)

- S2 stays down: 5m bias flipped short only at Sep-8 16:35 open vs EA 16:30 seed (bias-timing gate owed).
- R2: 10:25-entry CQD + in-bias-imb-invalidation + OPP-FVG-validation killers; A+ STANDING RULE (alert = would-execute; single-rule violation = no alert; R2 silent; surfacing branch dead).

## 5. Grade contract for RECON37 (pre-registered, no expansion)

S1-chain (s0imb0 → sel1 → wick 1.16258 → R 2.52) + S2-timing rejected (16:30 bias-not-short + exact 16:35 flip + verdict, causal order) + S2 biasAtGate-at-seed captured + R2/CQD rows observed (killers present-or-missing named) + R-fire zero-delta + R2-declined-by-legacy + 10:10 clean + purity/MAXLEN/SELHALT/STATUS/DONE. REPORT+HALT on: any behavior delta, invented bias read, tolerance, quiet remap, fixture exclusion, R2 surfacing beyond print, build-gate trip.

## 6. Run-book (mechanical, in order — no pauses between lawful steps)

1. Pointer → this handoff → AGENTS §10 checklist (re-hash EA/Flow/CQD/OBMGR + `git log --oneline -5` + `git status --short`, read-only).
2. Confirm `V94-COMBINED-PRINT-CLEAR-001` + both Sonnet v94 reviews on disk (tail-verify by read).
3. Check slot: `Get-Process -Name terminal64`. If his terminal open → STOP, ask him (his word or his close); NEVER close it; wrapper refusal is safety.
4. Launch: execute `SRJ_FlowNexus_Local\00_CURRENT_WORKING\launch_recon37_run.ps1` (WMI instant, CEILING_MIN=90, PRE contiguous past RECON36's 152066). Record WMI-PID/RC + STATUS PRE.
5. HOLD for his completion signal ("the run has completed, please proceed"). No polling loops (one cheap DONE probe per check at most).
6. Archive the segment → verify bounds/SHA/lines/purity → grade vs §5 table → result + extract + tabulate files → next relay (dual-key for anything further) → AGENTS + pointer + report.
7. Timeout/no-third-run → REPORT+HALT. No commit/tag/push (no token).

## 7. Resume prompt (paste-ready, verbatim — new session starts here)

```
New session. Read 06_HANDOFFS\BUILDER_SESSION_POINTER.md first, then 06_HANDOFFS\BUILDER_HANDOFF_NEWSESSION_POST-V94.md fully, then run the AGENTS.md section-10 checklist (re-hash the four baselines + git log/status, read-only). State: combined print-only build DONE (EA 77E26216/581593, both compile 0/0, RECON17 frozen, all uncommitted, run word CARRIED for RECON37 only). Your job: execute handoff section 6 (verify → slot check → launch RECON37-COMBINED via the filed launcher → hold for his completion signal → archive → grade vs the section-5 contract → result + relay). Do NOT rebuild, do NOT touch his demo terminal, do NOT commit/push/tag. On his completion signal proceed continuously with no pauses; on timeout REPORT+HALT.
```

(End — handoff filed pre-run; next stop is his completion signal in the new session)
