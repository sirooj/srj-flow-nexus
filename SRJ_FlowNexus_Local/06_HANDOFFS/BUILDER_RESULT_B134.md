# BUILDER RESULT B-134 - STOP at S0: the own-body break test does not separate (A1 already qualifies at 11:30, not 11:40)

STOP: S0 pre-edit re-grade differs from B-133 S1 on A1 — under the relay's own-body predicate the first qualifying candle is the 11:30 D-POC (pack lines 351/355: o=1.16440 c=1.16463 vs L=1.16451, trigger=1, rank 10<11), not the 11:40 exit B-133 S1 names. No EA edit, no backup, no compile, no tester run, no terminal launch.

Trader summary: your 1 September long should leave at the 17:45 close under the Yearly POC, and the plan was to judge the break on each candle's own open and close instead of the next candle's open. Checked word-for-word against every kept trade before touching anything, the new test also catches your 28 August short one candle earlier: the 11:30 candle opens at 1.16440 under the Daily POC (1.16451) and closes at 1.16463 over it, so it would exit at the 11:35 open instead of keeping your 11:40 exit. The relay required your 28 August exit to stay exactly where it is, so the trial stopped before any change. Nothing was edited, compiled or run; your kept build is untouched on disk.

## Relay order (B-134, kept-build trial, lane A2-EXIT 2 of 6)

- Part 0 fresh start on builder/B-133 at 2518c26bcc88ad0fe52deee3d16a5f63ae7e01dd (backup remote verified exact; builder/B-134 cut here, stays local until F6). Both skills loaded whole first (relay skill 83 lines + 2 per-day lines; strategy skill whole, exit pins at actual lines s28/s36/s78/s87; .agents copy stub never opened).
- Part B banking: no new rule words; append nothing.
- Part S S0 re-grade from the 12 committed EXITS-B131 packs only, exact predicate of the hunk: A1 first = 11:30 D-POC (DIFFERS from B-133 S1 11:40), A2 first = 17:45 Y-POC (matches), every other trade NONE before its kept exit (matches), 4 June same-line rows rank-excluded, reported never counted (matches). One difference = STOP before any edit, verdict STOP.
- Parts K/T not run (STOP stands before K1). No source edit stands; no .preB134 written (nothing to back up); no compile; no RECON62/JUNE runs; no T1/T2 tables exist.
- Part X: ledger 1279 filed (tag B134-A2-BRK-OWNBODY, STOP + S0 numbers); pointer updated (verdict STOP, lane stays 1 of 6); HANDOFF §3 line appended with verdict STOP; PLANNER_CONTEXT untouched (X1 lesson contradicted by S0, X2 session-profile unverifiable — both skipped, reasons below); register untouched (X5 is KEPT-only).
- Part F: this result + slice + ledger + pointer + HANDOFF staged by explicit path (never EA/ex5/indicator/includes/logs/journals/inis/profiles/backups/scripts); commit + push via backup + ls-remote check. Reply STOP.

## Part 0 - fresh-session start

- 0.1 Skills loaded whole first/second as ordered.
- 0.2 `git ls-remote backup builder/B-133` = `2518c26bcc88ad0fe52deee3d16a5f63ae7e01dd` (exact; GitHub same). Cut `builder/B-134` at it (`git log -1 builder/B-134` = 2518c26). Dirty tree kept (status count 530, none staged). No remote builder/B-134 exists (ls-remote empty on both remotes). Push via `backup`, never `origin`.
- 0.3 Read on builder/B-133, in order: pointer (22 lines, B-133 MEASURED); RESULT_B133 + SLICE_B133 whole (56 + 71 lines); INDEX_B133 (14 lines); EXITS-B131/A2.csv whole (95 lines); EXITS-B131/A1.csv in full via script + raw spot rows (411 rows); register whole (69 lines); FINDING EXIT-BREAK-RETEST whole (28 lines); spec v4.2 whole (396 lines, care on §2 row 3 POI-side exit body-closes-through, §4 next-open default, §5.1 ahead=touch / behind=body-close-exit per-bar, §5.2 side dynamic per bar, §5.3 no asymmetry, §5.4 pre-confirmation death); CONTEXT §4 whole (lane rules + B133 lesson); ledger/HANDOFF/AGENTS/.clinerules/journal grep-only.
- 0.4 Names per relay (all verified): kept EA 90240F23 (12773 newline count, LF-only 703681 bytes, byte-identical to .B131LATCH) + EX5 6CFD3A469E434CE0570F2CE04B1C19AD994570042A553EEF18D32569E58D380D (full match); indicator src 956BF3E3ADB7 (raw-disk prefix) / ex5 27B5F272DCFA (prefix); HTFEngine D5FD5B063E75 (prefix); terminal.ini 4082A94F (prefix; path ../config/terminal.ini). No .preB134/.B134BRK written (no edit). Lane A2-EXIT (B-134, 2 of 6). Tag B134-A2-BRK-OWNBODY. Ledger item 1279. Kit PK-2. Pins: s36 ANCHOR-RANK BREAK RULE; s78 9/1 early-exit instance; s87 POC-SUPREMACY (B-133 corrected s90 to s87); s28 UNIVERSAL day-close.
- 0.5 Start gate: log -1 = 2518c26. Status count 530. Protected diff vs 2518c26 EMPTY (pointer, RESULT_B133, SLICE_B133, INDEX_B133, ROWPACK/, register, ledger, CONTEXT, HANDOFF, both skills, spec, journal CSV, FINDING, 99_WORKFLOW incl. kit files; each verified by `git diff --quiet`, AGENTS.md/.clinerules dirty but not gate-listed, preserved). Records landed: ledger `1278. B133` = 1, tag = 1, `1277.` = 1 beside, `1279.` = 0; CONTEXT `B133-EXIT-ROWS-FIRST` = 1; HANDOFF `B-133:` = 1; pointer Lane line = 1. Disk SHAs verified (EA LF-normalized = raw, identical to .B131LATCH; EX5 full; indicator raw prefix; ind-ex5 prefix; HTFEngine prefix; terminal.ini prefix). No terminal64 (0). Journal 1068 lines. Record defect noted (not a STOP): B-133 pointer/result/relay carry the EA SHA as 63 chars (truncated, one char dropped after `...BDA`); measured 64-char disk SHA is `90240F238A0668885E2D39BDAE5271CE3C08D81B7EA1836DB77F52A42E631AF3` (matches .B131LATCH byte-for-byte; prefix 90240F23 as gated). Full hash filed below for future gates. No real mismatch: NO STOP at 0.5.
- 0.6 Scope observed (reads, greps, pack grading script kept unstaged; grade_s0_b134.ps1).

## Part B - banking

- No new rule words. Grep-verified once each (quote in slice): 9/1 early-exit INSTANCE s78; ANCHOR-RANK BREAK RULE s36 ((a) SAME-LINE-NO-EXIT + (b) HIGHER-BREAK-EXITS); POC-SUPREMACY s87; UNIVERSAL day-close s28 (`BREAK-leg next-open untouched` line 28 tail). Append nothing.

## Part S - separator (S0; K never opened)

- Predicate applied EXACTLY as relayed (LONG L < own-open, close < L; SHORT L > own-open, close > L; strict; census trigger=1 as MtIsBreakTrigger; rank strictly above anchor; unknown Q/FOMC/W-VWAP/Y-VWAP ranks cannot pass). One row per trade (pack lines, o/c, L, verdict):
- A1 (SHORT, anchor Daily-VWAP r11): first = 11:30 Daily-POC L=1.16451 (o=1.16440 c=1.16463, bar pack 351, census pack 355, trigger=1, rank 10<11). B-133 S1 says 11:40. DIFFERENCE.
- A2 (LONG, anchor Monthly-VWAP r7): first = 17:45 Yearly-POC L=1.15987 (o=1.16002 c=1.15985, bar pack 54, census pack 69, trigger=1, rank 2<7). Matches S1.
- A3/A4/A5/A6/A7/B2/B3/C-05-27/C-06-03: NONE before kept exit. All match S1.
- C-06-04 (4 June): first-qualifying NONE (09:55 D-POC same-line rank-excluded). Reported, never counted. Matches S1.
- No-rank sanity variant (same script, rank gate off) finds the known same-line rows (A3 16:05 Y-POC, A7 17:00 M-POC, B3 14:40 D-POC, C-05-27 17:10 D-POC, C-06-04 09:55 D-POC, A2 17:40 M-VWAP own-anchor), proving the parser sees every file; the strict run excludes them all by rank exactly as S1 did.
- S0 verdict: DIFFERS from B-133 S1 on A1 (11:30 vs 11:40) = STOP before any edit. The 11:30 bar also satisfies every other hunk condition (trigger printed 1, rank passes by the machine's own 11:40 BREAK through the same gate), so under hunk BRK-OWNBODY A1 would exit at the 11:35 pass (fill 11:35 open 1.16464), breaking T1's `A1 keeps its 11:40 BREAK D-POC exit` and its STOP rule (`any exit other than A2's moved`). The S0 gate caught before a run what T1 would have restored after one.
- Raw rows in slice (A1 11:25/11:30/11:35/11:40 UJBARMAP + D-POC/D-VWAP census + 11:40 BREAK census + MTEXIT; A2 17:45/17:50 rows).

## Part K - not run (STOP stands before K1)

- No rule-conflict check needed (no edit). No backups written. No diff. No compile. Kept EA/EX5 untouched on disk.

## Part T - not run (no launches)

- No RECON62-B134, no JUNE0525-B134. No filed-trade tables exist. Baseline runs RECON62-B131/JUNE0525-B131 untouched. Terminal never launched (no terminal64 before, none after).

## Part X - records (grep-first, append once, verify count 1)

- X1 PLANNER_CONTEXT §4: SKIPPED (not appended). Reason: the relay's exact line banks the own-body judgment as the fix (`testing side and body against the next open turned his 17:45 close-through into an equality miss ... fill stays at the next open`); S0 proves its premise incomplete — the same judgment opens an earlier A1 break (11:30) that moves a kept exit. Banking it would file a lesson the packs contradict. No `B134-` string written to CONTEXT (verified 0).
- X2 Section 5: SKIPPED (not appended). Reason: the session-profile claim (`planner session ran as ClickUp Brain for relay B-134`) is unverifiable from this session; the turn stopped at S0 with no trial. No `relay B-134` string written to CONTEXT (verified 0).
- X3 HANDOFF §3: appended `- B-134: kept-build trial of the break exit judged on the candle's own body (1 Sep 17:45 Yearly POC) stopped at the S0 separator (A1 11:30 also qualifies, kept 11:40 exit would move); no source edit, compile or run; verdict STOP.` (relay shape kept; scope words corrected to what happened — no RECON62/June grading ran). Verified count 1.
- X4 Ledger 1279, tag B134-A2-BRK-OWNBODY (S0 table + STOP + SHA-truncation note). Verified `^1279.`-class count 1, `^1278.` = 1 beside.
- X5 Register: untouched (KEPT-only). No NOTE line.
- X6 Pointer (35-line cap): verdict STOP; EA/EX5 on disk with full SHAs (EA 64-char measured); lane stays `A2-EXIT (first B-133, 1 of 6)` with B-134 STOP noted (the relay's `2 of 6` form not taken: no lane relay ran); census line updated; project goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (raw gate + S0 rows + pins; under 600 lines). F2b: nothing (no KEPT, no new packs). F3 ledger 1279. F4 pointer. F5 stages result, slice, ledger, pointer, HANDOFF (never EA/ex5/indicator/includes/logs/journals/inis/profiles/backups/scripts). F6 commit + push via backup + ls-remote check. Reply STOP.

## Final disk state (STOP turn; B-131 kept build on disk, verified)

- EA `90240F238A0668885E2D39BDAE5271CE3C08D81B7EA1836DB77F52A42E631AF3` (64-char measured; 12773 newlines; LF-only; 703681 bytes; byte-identical to `Experts/SRJ_FlowNexus_EA.mq5.B131LATCH`; untouched this turn) + EX5 `6CFD3A469E434CE0570F2CE04B1C19AD994570042A553EEF18D32569E58D380D` (matching). Indicator src/ex5 + HTFEngine at gate SHAs, untouched. terminal.ini 4082A94F (no launches). Strategy skill, journal CSV, register, spec, FINDING, kit files, CONTEXT untouched. Grading script unstaged. No Ex5/source committed.

## Carried note (for the planner; no operator question — record-first answers it)

- The own-body break judgment does NOT separate on the kept packs: A1 11:30 (SHORT o=1.16440 c=1.16463 vs D-POC 1.16451, trigger=1, rank 10<11) qualifies under the exact hunk predicate a full 10 minutes before the kept 11:40 exit, while A2 17:45 qualifies as expected and nothing else does. Options that keep A1 pinned: (a) require the break line's value to have been behind the trade at the prior candle too (11:30 D-POC relocated 1.16532→1.16451 that same bar; 17:45 Y-POC read 1.16077 at 17:40 then 1.15987 at 17:45 — also relocated, so this needs care); (b) judge behind on the prior close as well as the own open; (c) any reframing from his words — record-first shows s78 names only the 17:45 instance, s36 names only the 8/28 exit, spec §5.2 already covers relocating lines as behind-or-ahead per bar with no relocation exclusion. Nothing drafted; next relay decides.
- Record defect (pre-existing, not this turn): B-133 pointer/result/relay carry the EA SHA truncated to 63 chars (`...BDA5271...`); measured disk SHA is 64 chars (`...BDAE5271...`, EA item above). Future gates should use the 64-char form; the 63-char strings should never be re-copied.

(End of file)
