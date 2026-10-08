# BUILDER RESULT B-87 - selected-XOB in-play diagnostic STOPPED at RECON62: gate refuses 4 valid takes, source restored

Trader summary: the selected-XOB in-play gate was built exactly as specified and ran clean on the RECON62 window, but it refuses four of his seven valid EURUSD takes (28 Aug, 1 Sep, both 8 Sep sessions) while keeping only three deal-identical (4 Sep, both 7 Sep sessions). Any RECON62 disappearance is a mandatory STOP, so no June run happened, the source is restored, and the June 2 / June 5 / 27 August questions stay ungraded. The gate as designed does not reproduce his valid set.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (67 lines, ClickUp Brain), then strategy skill whole (199 lines).
- 0.2 `git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-86` returns `62592b6beb7f84c3fcbc768e54ba59a0db07ac4e` (verified). Cut `builder/B-87` at it. Push via `backup` (never `origin`).
- 0.3 Read in order on `builder/B-86`: pointer (22 lines); RESULT_B86 (49); SLICE_B86 (55); RESULT_B84 (60); SLICE_B84 (45); PLANNER_CONTEXT (89); PLANNER_HANDOFF (33); both skills whole (67 + 199); spec v4.2 whole (396 lines); register whole (65 lines).
- 0.4 Names per relay (kept EA 137076D9CF85 695359 B / ex5 FA4C924978F6 / terminal.ini 88A0DEB1; tag B87-PICK-XOB-INPLAY-DIAG; ledger item 1232; result/slice below).
- 0.5 Start gate (with a defect owned - see below): `git log -1` = 62592b6beb7f84c3fcbc768e54ba59a0db07ac4e. `git status --short` line count 350 (all untracked lane dirt, count only; no modified tracked file was staged by me). EA disk SHA 137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671 = LFnorm (LF-only) - prefix matches. EX5 FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5 - prefix matches. terminal.ini disk 88A0DEB1924C8A1E68D0CDF1FCCFA7353C7027237259121EFE605C535A1E10D2 (LFnorm 5D5484797BCFE2C426833A03D26807FD71A8CBFAE62C245C2DA0C8AF04D3E41D; CRLF file, accounted per relay skill) - prefix matches. No terminal64 launched before the authorized edit. DEFECT OWNED: my gate `git diff` put `--stat` after `--`, where it parses as a pathspec, so the "EMPTY" reading proved nothing. Proper `git diff <commit> --stat` shows the preserved dirty tree (25 files: pre-existing multi-lane drift incl. EA uncommitted lag at the gate SHA, AGENTS.md drift accounted since B-86, verdict docs, includes, opencode.json) plus my 6 staged text records and nothing else; every other relay-named committed file (RESULT_B86, SLICE_B86, RESULT_B84, SLICE_B84, both skills, spec v4.2, register) is untouched. Tightened gate for the next turn: always `git diff <commit> --stat -- <paths>` with flags before `--`.
- 0.6 Scope: one diagnostic edit + one compile + RECON62 run + (June only if RECON62 passed - it did not) + restoration + text records. Nothing forbidden touched.

## Part B - banking

- B1 Strategy skill, journal and ledger greps: the current operator message carries the B-86 reply line plus this B-87 relay (workflow + diagnostic, no new trading-rule words). Record `no new rule words`; append nothing.

## Part K - diagnostic edit

- K1 Rule-conflict check (quotes from disk). His banked words (strategy skill lines 177-178, verbatim): "That 14:20 candle is annotated in my journal: there is no valid XOB retracement or touch there, so no setup ever forms for me. The machine buying at 15:35 (159.774, aiming at the 30 April high) is answering a touch I do not count." Standing permission (spec v4.2 §3.6 table): XOB row - "Not required. A touch is permitted and is never disqualifying."; relaxation note: "An implementation must accept an XOB-sourced candidate whose opposing candle touches the zone and one whose opposing candle does not."; §10 permission vocabulary: "Permitted / not required / need not - accept either way; the condition is informational at most - never [rejects]". B-86 measured rows: 2 June 14:20 pick 159.679-159.694 promoT 11:30 NOT in play (xobInPlay=0, committed=0); 5 June 16:00 pick 159.881-159.916 promoT 15:40 IN PLAY by pick verdict (xobInPlay=1). This diagnostic rejects ONLY the selected-XOB-not-in-play reading: it never tests touch, never rejects touching rows, never builds the full live-XOB map, never reads 5m bias, adds no number. No other condition added - edit authorized.
- K2 `Experts/SRJ_FlowNexus_EA.mq5.preB87` written before any edit; SHA 137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671 (= LFnorm) - matches the kept prefix, proceed.
- K3 Raw spots on the kept build (by text; full lines in the slice): kept `IsConfirmationCandle` signature :2481-2482 (5-param form, zero hunk-C identifiers); call sites :9340 (uj_carryTerm) / :9360 (cfTermZ) / :9548 (cfTerm); selected zone reads :6911-6912 / :8800-8801 (buffers 22/23); promo read :8790 (buffer 33); `ZoneInPlay` :7118; hunk-C insertion context per B-84: decl :1111, ResetSequence :6808, seed sites :8164/:8191/:8245/:8422 (`g_anchorBarTime = barTime`), DirName/enum/ComputeNearestTpTarget present. B60C counted-touch shift / `retestShift` / `g_b61RetestTime` / `uj60_` NOT FOUND on the kept build (0 hits each) - the counted source used here is `g_anchorBarTime` (the machine's seed/retest bar time, the kept equivalent).
- K4 One narrow change inside `IsConfirmationCandle`, before the existing A/A2/B/C path: if `g_anchorBarTime > 0`, counted shift = `iBarShift(..., g_anchorBarTime, true)`; read the selected XOB zone (buffers 22/23) at that same shift; `ZoneInPlay(countedShift, hi, lo, 0.0, false)`; REFUSE with `failTerm = "B87_XOB_NOT_INPLAY"` + `B87PICKXOB` print unless in play; in-play rows continue to the untouched confirmation path.
- K5 Diff against `.preB87`: +24/-0 (one block, byte-clean reapply after a whitespace drift caught by diff review and fixed). `Experts/SRJ_FlowNexus_EA.mq5.B87PICKXOB` written: disk = LFnorm = 5066BAB96E1EFD9A02567221480B1693B80C2CEF583BF3915ABA5B8C7D40A8F5. Only the intended path changed.
- K6 Compiled exactly once: 0 errors, 0 warnings (16281 ms), binary fresh. Diagnostic EX5 41CFD4CE642DA0F3F48579869F374B93EF33E3FE3367D7CACDAB58E13AF25E3F. No retry.

## Part T - diagnostic runs (STOP at RECON62; no June run)

- T2 Before the first run: no terminal64. Content copies: `config/terminal.ini.preB87`, `Experts/SRJ_FlowNexus_EA.ex5.preB87`, `Profiles/Charts.preB87` (39 files). RECON62 window set and read back in `config/terminal.ini` [Tester]: DateFrom 1787702400, DateTo 1788998400. Launches via script files mirroring the known-good b82/watch pattern (`launch_recon62_b87_run.ps1`, `launch_watch_b87r1.ps1`, `launch_june_b87_run.ps1`, `launch_watch_b87j1.ps1` written, untracked, unstaged). Wrapper verified (STATUS/PID/heartbeats + journal window line). Watcher behavior measured: on this dense day-log the 64 KB tail still held an older completion marker, so the watcher wrote a premature DONE (13:34:44) - removed, watcher killed, completion read from the wrapper (new-segment scan, accurate). Noted for the next fast run: start the watcher only, or verify DONE timestamps against launch.
- First two attempts interrupted by the environment, not the diagnostic: attempt 1 stopped 13:37:41 "tester is stopped because the account has been changed" (16 archived lines; operator had re-logged with a new account mid-run); attempt 2 agent disconnected 13:45:52 "history synchronization interrupted" + "connection closed" (15 archived lines). Leftovers cleared by PID; window re-verified; clean third run launched 13:39/13:49 pattern per attempt.
- T3 RECON62-B87 (clean run): PASSED 13:52:43 (563338 ticks, 3168 bars = kept j43; test time 0:02:54). PRE_JOURNAL_LINES 414698, ARCHIVED 82532 lines, XOB_PROMOCENSUS 469, final balance 10422.36 (kept j43: 10474.64). Provenance: `SRJ_FlowNexus_Local/06_HANDOFFS/RECON62-B87_JOURNAL.log` + day log `Tester/logs/20261008.log` + diagnostic source 5066BAB9 + diagnostic EX5 41CFD4CE. Baseline: `RECON62-B81_JOURNAL.log` (kept EA 137076D9, 7/7 fires).
- Filed-trade table (before = B81 kept, after = B87 diagnostic; every row from the named journals):

| # | Trade (entry bar) | B81 kept fire | B87 diagnostic fire | Verdict |
|---|---|---|---|---|
| 1 | 28 Aug London SHORT 10:05 (D-VWAP) | FIRED 10:00 tp 1.16364 r2.43, exit 11:40 BREAK 1.16439 | NO FIRE (B87 REFUSE: 09:55 xob 1.16492-1.16507 inPlay=0) | LOST |
| 2 | 1 Sep NY LONG 17:35 (M-VWAP) | FIRED 17:30 tp 1.16077 r1.17, exit 17:50 SL | NO FIRE (B87 REFUSE rows 15:55-16:05 xob 1.15855-1.15862 inPlay=0 on the seed path) | LOST |
| 3 | 4 Sep NY LONG 16:00 | FIRED 15:55 tp 1.16302 r1.66, exit DAY_CLOSE 1.16129 | FIRED 15:55 tp 1.16302 r1.66, exit DAY_CLOSE 1.16129 | IDENTICAL |
| 4 | 7 Sep London LONG 09:20 | FIRED 09:15 tp 1.16200 r1.76, exit TP 1.16200 | FIRED 09:15 tp 1.16200 r1.76, exit TP 1.16200 | IDENTICAL |
| 5 | 7 Sep NY LONG 16:45 | FIRED 16:40 tp 1.16315 r2.34, exit TP 1.16315 | FIRED 16:40 tp 1.16315 r2.34, exit TP 1.16315 | IDENTICAL |
| 6 | 8 Sep London SHORT 10:10 | FIRED 10:05 tp 1.16102 r1.94, exit TP 1.16102 | NO FIRE (B87 REFUSE rows on the seed path; 1217 B87 rows, 674 B87_XOB_NOT_INPLAY total) | LOST |
| 7 | 8 Sep NY SHORT 17:00 | FIRED 16:55 tp 1.16114 r1.96, exit SL | NO FIRE (B87 REFUSE: 16:30/17:05/17:25 xobs inPlay=0) | LOST |

- Grade: 3/7 deal-identical; 4 valid takes disappear, each tied to `B87_XOB_NOT_INPLAY` rows on the diagnostic EA SHA. No known must-never EURUSD fire appeared (no 9/4-10:40, 8/28-16:25, 9/1-15:30 or 9/8-16:45 signals on either run). T6 fires: "any RECON62 deal moves or disappears: STOP" - STOP. Per T3, no June run.
- T5/T6 June: NOT RUN (STOP at RECON62). The 2 June 15:35 absence, the 5 June 16:15 preservation and the 27 August population are ungraded; B-86 readings stand and no new ruling is claimed.
- T7 Restored immediately after grading: EA from `.preB87` = 137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671 ✓; EX5 = FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5 ✓ (via `.preB84`; defect owned: `ex5.preB87` was copied after the diagnostic compile so it holds the diagnostic build 41CFD4CE - recorded, never staged, never used as a restore source); terminal.ini = 88A0DEB1924C8A1E68D0CDF1FCCFA7353C7027237259121EFE605C535A1E10D2 ✓; charts 39/39 from content copies; no terminal64. `.B87PICKXOB` + `.preB87` files on disk, uncommitted, unstaged.

## Part X - records

- X1 `PLANNER_CONTEXT.md` section 4 grep `B-87-PICK-XOB-INPLAY-DIAG` = 0 -> appended the lesson (verified count 1).
- X2 `PLANNER_HANDOFF.md` section 3 grep `B-87` = 0 -> appended the line (verified count 1).
- X3 Ledger item 1232, tag B87-PICK-XOB-INPLAY-DIAG (grep absent verified; provenance, hunk + SHAs, RECON62 3/7 + 4 lost rows, no June run, restoration SHAs, no kept edit, next step).
- X4 Pointer within 35-line cap (25 lines): latest B-87 STOP; EA/EX5 restored; no kept edit; run status; next relay follows the whole-run grade.

## Part F - file, push, reply

- F1 this result. F2 slice `BUILDER_SLICE_B87.md` (under 600 lines). F3 stages only: result, slice, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md. EA/EX5/includes/indicators/journals/logs/terminal.ini/charts/backups/diagnostic artifacts unstaged. F4 commit + push `builder/B-87` via `backup`; ls-remote must return the commit. Reply: `B-87 is done, GitHub branch builder/B-87, commit <short hash>, verdict STOP`.

## Final disk state (STOP turn; kept RKD build on disk, uncommitted)

- EA `Experts/SRJ_FlowNexus_EA.mq5` 137076D9 (695359 B, LF-only, untouched) + `.preB87` kept; `.B87PICKXOB` 5066BAB9 kept uncommitted. EA.ex5 FA4C9249 (matching kept source). terminal.ini 88a0deb1 (RECON62 window reverted; no launches pending). Charts restored. No terminal64 running. No j47/j48 (no June run).

No carried note (STOP goes to the planner as this record; nothing to ask him - record-first search answered everything on record).
