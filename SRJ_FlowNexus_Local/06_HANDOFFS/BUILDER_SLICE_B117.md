# BUILDER SLICE B-117 - run proof, journal rows, case table, objective audit, record lines (kept-build June fidelity, MEASURED)

Scope: one unchanged kept-build June run + fidelity grade. No edit, no compile, no second window. Live files only.

## START GATE (raw)

- `git ls-remote ... builder/B-116` = `988391e76b6e42307656633df9e071c07f1f1499` (verified; cut builder/B-117 here).
- `git log -1` = `988391e B-116 return to full-range fidelity with workflow correction (relay B-116)`.
- `git status --short` line count = 440 (prior artifacts + B110-B116 files/scripts, preserved untouched).
- `git diff 988391e76b6e42307656633df9e071c07f1f1499 --` EMPTY on every committed file named.
- EA disk `137076d9cf85160ab8cd8379575afd4801e71098ce97c0b10d88a42c7bf59671` LF same (LF-only). EX5 `fa4c924978f6...` (the binary that ran). Indicator at gate SHAs, untouched.
- terminal64 count 0 pre-launch. terminal.ini read back exact (USDJPY/5/1779667200/1781308800) + content preserved (`terminal.ini.preB117` 5a4b0c78) + full `Profiles.preB117` backup. No source edit or compile. No STOP.

## PART B GREPS (before/after)

- Operator message = B-117 relay order only; no new trading-rule words. Record `no new rule words`; appended nothing.
- `B-117-JUNE-KEPT-BUILD-FIDELITY` in 99_WORKFLOW 0->1 (context X1). `B-117` in 99_WORKFLOW 0->1 (handoff X2).
- `B117-JUNE-KEPT-BUILD-FIDELITY` in SRJ_FlowNexus_Local 0->1 (ledger 1262). `^1262.` 0->1; `^1261.` = 1 beside.

## RAW RUN PROOF (T2-T4; kept EX5 ran as-is)

- First attempt NEVER STARTED (you caught it): wrapper heartbeats froze at journal_lines=9 on `USDJPY: history check timeout` -> `no history data from 2026.05.25 to 2026.06.13` -> `stop testing` (demo server didn't deliver M1 history in time). Idle wrapper + idle terminal killed by PID; single harness-standard retry (reported, never hidden).
- Retry: WMI_PID=16340 RC=0; STATUS RUNNING with history synced, ticks processing (05-25 -> 05-26, lines 9 -> 4059). Wrapper killed immediately post-verify (gone, terminal survived). Watcher PID 6876 verified powershell. DONE polled 3x60 s. Genuine watcher DONE RUN=JUNE0525-B117 RESULT=PASSED DONE=2026-10-09 04:54:49.
- Completion: `USDJPY,M5: 740873 ticks, 4320 bars generated ... Test passed in 0:03:13.361` (same scale as B101/B106; slot fix active).
- Provenance: journal Tester/logs/20261009.log; run JUNE0525-B117 Core 04; EA src `137076D9...` / EX5 `FA4C924978F6...` / ind `956BF3E3...` / EX5 `27B5F272...`; window 1779667200/1781308800 USDJPY M5.

## DEAL LIST (complete; only deals 5/25-6/12)

- #2 buy 05-27 15:35 at 159.344 + #3 sell 05-27 20:08 at 159.535 (in-window, no register case - noted, never graded).
- #4 buy 06-03 09:10 at 159.932 + #5 sell 06-03 09:59:40 at 159.983.
- #6 sell 06-04 09:55 at 159.868 + #7 buy 06-04 10:40:20 at 159.920.
- #8 buy 06-05 16:55 at 160.120 + #9 sell 06-05 19:16:32 at 160.298.
- #10 buy 06-11 14:40:22 at 160.530 + #11 sell 06-11 15:23:06 at 160.588.
- No deals 06-01/06-02/06-05-morning/06-08/06-09/06-10/06-12 (verified by full-list scan - the silence evidence).

## CASE TRACES (exact journal rows, 20261009.log Core 04)

- 2 June (silent): SEED 14:20 Monthly-POC LONG, bias REJECT-BIAS-TIMING (UJPROV reseed Fix CARRY); S1->S2->S3, inPlay=0 + confirm=0 throughout, FRESHSKIP PRE_BINDING holds; S3->S4 armed 16:25 anyway; ABORT FRESH_OB_DEAD 17:40 (obDead=1 fvgDead=1 adverse=2). j34/j36 15:35 fire NOT repeated. SILENT-AS-RULED.
- 3 June (take): SEED 09:00 Daily-VWAP LONG; S3INPLAY inPlay=1 via=BAR (zone 159.906-159.913); CONFIRMPOLL 09:05 touchAttr=1 confirm=1; S5; ELIGSTATE/RGATE livePass=1; deal #4 buy 09:10:00 at 159.932. MATCH.
- 4 June (fire): SEED 09:10 Daily-POC SHORT biasAligned=1; S3INPLAY inPlay=0 at 09:45; S3->S4 armed despite it; CONFIRMPOLL 09:50 touchAttr=1 confirm=1; ELIGSTATE cqd=UNREAD + RGATE seedBT=09:10 livePass=1; SIGNAL; deal #6 sell 09:55 at 159.868. Machine ltf=-1.0 vs his bullish row 13; DIV verdict=-2 computed yet UNREAD at eligibility; payload 0-touch both candles. MISMATCH (all three reasons violated together).
- 5 June London (silent): SEEDs 09:25 + 09:35 bias-REJECTED, KILL+ABORT 09:30/09:40; no 09:45 deal. SILENT-AS-RULED (refusal correct per NOT VALID).
- 5 June NY (miss): 16:00 RETESTBOOK hits=6 yet seed dead 16:05 UJDEFERABORT/ABORT LTF_MISALIGN; hits=0 at 16:05-16:40 bars (machine blind to his retest+confirmation); no 16:15 candidate ever exists; 16:50 second seed off 16:45 retest (hits=2 LHIT, Daily-POC anchor - not his M-POC/M-VWAP line); CONFIRMPOLL 16:50 touchAttr=1 confirm=1; ELIGSTATE/RGATE seedBT=16:45 livePass=1 (cqd=UNREAD); SIGNAL R=1.56; ALERT; EXECUTED R=1.53 deal #8 buy 16:55 at 160.120. MACHINE-MISSED-OPERATOR-ENTRY (second candidate, never delayed execution).
- 11 June (take): LONG retests 14:20-14:35 hits=2 (a separate 14:05 SHORT seed confirmed-then-died, noted ungraded); S3INPLAY inPlay=1 via=SWINGLEG 14:35; RGATE seedBT=14:20 seedBiasAl=0 (!) livePass=1; deal #10 buy 14:40:22 at 160.530 (0.6-pt slip). Position flat since 06-05 #9 close - no 5 June blocking (deal-list gap verified). MATCH.
- 10 June (silent): SEED 15:30 bias-REJECTED at birth; no 16:10 deal. SILENT-AS-RULED.

## DECISION TABLE + OBJECTIVE STATUS

- 2JUN SILENT-AS-RULED (fire gone) | 3JUN MATCH | 4JUN MISMATCH (fire persists) | 5JUN-LDN SILENT-AS-RULED | 5JUN-NY MISMATCH (16:55≠16:15) | 11JUN MATCH | 10JUN SILENT-AS-RULED.
- R7: 2JUN PROVEN | 3JUN PROVEN | 4JUN NOT PROVEN | 5JUN-1615 NOT PROVEN | 11JUN PROVEN | June full-window NOT PROVEN | EU seven-take UNKNOWN (not run here).
- R8: next relay chooses one narrow corrective task. Ranked handoff: (a) 4 June SHORT-fire suppression (bias-opposed + CQD-unread pass + in-play-0 arming coincide); (b) 5 June 16:15-candidate survival (S2/LTF-misalign + deferred-abort kill + no re-seed 16:10-16:20). 2 June needs nothing.

## RESTORATION + RECORD LINES (exact)

- terminal.ini restored to pre-run `5a4b0c78` (re-saved noise NOT re-applied); Profiles restored from `Profiles.preB117`. Leftover terminal64 PID 12068 reported (B-43: next launch handles). Launch script/STATUS/DONE/watcher artifacts unstaged.
- X1 context §4 appended once: `- B-117-JUNE-KEPT-BUILD-FIDELITY (planner lesson 2026-10-09): graded the unchanged kept build against the June register, including operator 16:15 versus machine timing, without editing the EA or enabling a gate.`
- X2 handoff §3 appended once: `- B-117: graded the unchanged kept build against the June register; no source edit or gate was performed.`
- X3 ledger `1262.` appended once (tag `B117-JUNE-KEPT-BUILD-FIDELITY`; provenance, fidelity table, four traces, objective table, no edit/compile/gate/rule).
- X4 pointer 20->20 lines (cap 35): latest B-117 MEASURED; 2 MATCH + 3 silent-correct + 2 MISMATCH; kept EA/EX5 unchanged; no source edit; next relay chooses one narrow corrective task; project goal open unless proven otherwise.
- Pre-commit re-check: X1/X2/X3 counts 1; `^1261.` = 1; staged set = 6 relay files only; no source/EX5/journal/log/settings diff; no run tables beyond the filed deal list.

(End of slice)
