# BUILDER RESULT B-81 - side-matched row key (hunk RKD) on the kept build, KEPT

Trader summary: the one change works exactly as the B-80 census predicted on live rows. The 4 Sep 15:35 long keys off the Monthly POC, leaves the Yearly POC in the race, refuses it at R 0.18 with no early fire, and his 16:00 entry fires at R 1.66 to the same London-high target and day-close exit. All seven EU takes and all five June takes come out deal-identical to the kept build, balances to the cent, and the 27 Aug 17:00 short still refuses the Daily VWAP below 1R. The B-80 predicted 10:05 refusal prints live exactly as predicted (Daily POC, R 0.40). Nothing else moved: all 418 race passes grade exactly as predicted with zero differences. No question goes to him.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (disk copy governs, 66 lines), then strategy skill whole (199 lines; .agents copy stub, never opened). TERMS-HIS, QUOTE-WORDS-POINT-AT-ROWS, ASK-THE-CODE, RECORD-FIRST NO DIRECT QUESTIONS, LOGIC-IS-BUILDER'S.
- 0.2 ls-remote builder/B-80 returns `f8d97294cde7dba8ee9178f85897d0f34797dee4` (verified). Cut builder/B-81 at it. Dirty tree kept (330 lines at cut, count only). No git config/remote change. Push via `backup` (never `origin`).
- 0.3 Read in order on builder/B-80: pointer (23 lines); RESULT_B80 whole (57 lines, no carried note); SLICE_B80 whole (521 lines: R1 rows, R2 quotes, 418-row census, R4 rows); RESULT_B78 + SLICE_B78 whole (55 + 212 lines, verified unchanged by SHA/diff); spec v4.2 whole via fresh temp copy (SHA F2F4CDDE, focus sections as listed); register whole (65 lines); PLANNER_CONTEXT whole (80 lines); journal CSV by grep only (1066 lines; rows 279/280/312 verified); ledger/AGENTS/.clinerules by grep only.
- 0.4 Names per relay (kept EA 6CFE8F8B 688905 B LF-only; ex5 6CDBB39E; .B78RK 7A88676A 693654 B read-only base; .preB81 backups with SHAs; edited .B81RKD 137076D9 695359 B kept uncommitted; terminal.ini 88a0deb1; inis + DateFrom/DateTo per relay; baselines j37 77F454AB / j38 6019A461 / j41 DD4128CB / j42 ED757045; new j43 RECON62-B81_JOURNAL.log 8EDD1254 71653 lines; new j44 JUNE0525-B81_JOURNAL.log 113541CF 71396 lines; codes/ranks as listed).
- 0.5 Start gate: git log -1 = f8d9729. git diff f8d9729 EMPTY on every 0.3 committed text file + ledger + spec + journal. Ledger `^1225.` = 1, `^1226.` = 0, `B81-` = 0. Journal CSV 1066 lines. All disk SHAs = RESULT_B80 final state (EA/ex5/.B78RK/terminal.ini/CQD/FlowLogic/HTFEngine/BiasEngine/OrderblockMgr/Draw/MARKER/j37/j38/j41/j42 prefixes verified). No terminal64 running. No STOP.
- 0.6 Scope: one EA edit, one compile, two tester runs graded on whole runs. EA edit uncommitted/unpushed. No include/indicator/ini (beyond tester dates)/skill/journal/register/spec change.

## Part B - banking (grep-first)

- B1 Skill grep "not yet a valid bias for short" = 1 -> ALREADY_BANKED 79ddb11, append nothing. His last message carried the B-80 reply line only: no new words.

## Part K - rule check, backups, one edit, one compile

- K1 RULE-CONFLICT CHECK: his words behind this reading, quoted verbatim from disk: s94 "the 6/11 NY setup entry POC is both from POC and VWAP. logically, it can't target it's own source of POI with also the nuance of POC is a higher hierarchy over VWAP on the gapped scenario."; s89 "there is no such thing as no profit target, there is only target there is closer than 1R to then rejected."; s66 "the category of family does not matter. I said the nearest and i do not care anything else"; s137 POC-OVER-VWAP-SCOPE (POC outranks VWAP ONLY in the gap case; his own-source half stands); s130/s136/s147 27-Aug skip (nearest D VWAP below 1R -> skip; ordinary race; NOT a gap); s193/s195 (4 Sep London high + kept-build targets correct); spec §2 row 1 (wick >=1pt, body correct side = the side tag), §2.3 (anchor out of targets), §3.7 (nearest >=1R or not taken; validity). Skill/findings/journal greps for any word making an against-trade line its own source: skill 0, findings only the compatible 6/11 rule, journal 0. No conflict -> edit authorized, no carried note.
- K2 BACKUPS: EA.preB81 6CFE8F8B ✓, ex5.preB81 6CDBB39E ✓, terminal.ini.preB81 88a0deb1 ✓ (all in place, verified). Chart content copies: 38 files (relay named 36; disk holds 31 live + 7 deleted) to charts_preB81 with per-file SHA manifest (38/38 copied).
- K3 RAW SPOTS in .B78RK (all FOUND, none missing): SrjRowkeyUpdate whole :2285-2320; RkHeldRefused whole :2315-2320; race-head ROWKEY block :2712-2736; call sites :2785 (kf) + :2934 (k2) inside ComputeNearestTpTarget (dir in scope, signature :2658); strict-side TpTargetUpdateBest :2603; DirName :1792; enum :226.
- K4 HUNK RKD = hunk RK as in .B78RK plus the side match and nothing else. Work copy started as byte copy of .B78RK (verified 7A88676A). Side stored parallel (g_rkSide, longHit->1 else 0, character-identical to the dL/dS tag); key = lowest rank among side-matched held lines, fallback=1 + kept anchor rank when none match; RkHeldRefused(k, dir) refuses side-matched only at both call sites; ROWKEY print adds dir + per-line tags, own = side-matched only. Untouched: session/pool, validity, nearest-wins, 1R, entry, stop, exits, hunk S, UjPoiTargetValid, non-target g_anchorLine uses, all other prints byte-identical. Code shape builder's call. Full diffs raw in slice (vs .preB81 +117/-0; vs .B78RK +39/-13).
- K5 COMPILE once: 0 errors, 0 warnings (7382 ms; syntax pre-check 0/0). .B81RKD SHA 137076D9CF85160AB8CD8379575AFD4801E71098CE97C0B10D88A42C7BF59671 (695359 B, frozen uncommitted). New ex5 SHA FA4C924978F6A1D5C57B725F2AB530BBB5DC5B1E0D1D0B51FB0172E80D8C41B5 (465572 B, binary_fresh in Experts/). (Deploy-copy step hit a transient Win32 lock; split compile produced the binary in place; syntax + full compile both 0/0.)

## Part T - two runs, graded on whole runs

- T1 j43 RECON62 EURUSD (RECON50_DEMO_USD.ini; terminal.ini dates written 1787702400/1788998400 and read back; no terminal64 before launch; WMI launch PID 12964 RC=0 from launch_recon62_b81_run.ps1; window verified on day log within a minute (8/26 bars, "testing ... from 2026.08.26 00:00 to 2026.09.10 00:00"); wrapper shell gone at verify (nothing to kill); watcher started, PID 23700 confirmed; short DONE polls only (60 s cycles); DONE RESULT=PASSED 06:05:04 (~4.5 min, slot fix live); leftover terminal 10964 killed by PID; agent-3003 journal split at run boundary 140904..212556, archived as j43 8EDD1254 71653 lines). Ticks/bars 563338/3168 = j37. Filed-trade table vs j37 in slice: 7/7 deal-identical (entries/stops/targets/exits match; TP_ELECT 18/18 identical incl. non-firing elections). Balance 10474.64 = j37 to the cent. New: none. Lost: none. S54KILL 0.
- T2 j44 June USDJPY (USDJPY_DEMO_JUNE.ini; dates written 1779667200/1781308800 and read back; no terminal64 before launch; WMI launch PID 10332 RC=0 from launch_june_b81_run.ps1; window verified (5/26 bars); watcher DONE RESULT=PASSED 06:13:40; leftover terminal 25264 killed by PID; agent-3004 journal (this run's agent) lines 1..71396 archived as j44 113541CF 71396 lines). Ticks/bars 740873/4320 = j38. Filed-trade table vs j38 in slice: 5/5 deal-identical (A6FIRED 5/5, MTEXIT 5/5, TP_ELECT 10/10, A6REFUSED 77/77 identical normalized). Balance 10395.28 = j38 to the cent. New: none. Lost: none. S54KILL 0.
- T3 rows (journal + EA SHA, raw in slice): R-a 15:35 key=Monthly-POC own=W,M-POC fallback=0 dir=LONG with tags; TPCENSUS #212/#213 winner Yearly-POC 1.15987; TP_ELECT R=0.18; A6REFUSED TP_RR_FAIL; no 15:40 fire. R-b 15:55 key=Yearly-POC own=Yearly-POC; TP_ELECT 1.16018/1.15847/1.16302 R=1.66; A6FIRED 15:55; DAY_CLOSE exit 23:55 1.16129. R-c 17:00 key Daily-POC; D-VWAP 1.16498 R=0.20 FAIL; PREBIND C_TOUCH; no fire. R-d 10:05 key=Daily-VWAP own=Daily-VWAP dir=SHORT with tags; winner Daily-POC 1.16541 distPts=6 (admitted Daily-POC:6); POLL R=0.40 FAIL (exactly the census prediction); downstream LTF/FRESH refusals, no fire; covering words s89 + s130/s136/s147. R-e 10/10 key+own SAME (A2 LONG pass key M-VWAP own both; SHORT pass same bar fallback=1 key Y-POC). R-f 418/418 passes checked, ZERO winner/R differences vs the B-80 predicted column.
- T4 VERDICT right after both tables: KEPT. (a) EU 7/7 deal-identical, balance 10474.64 ✓. (b) June 5/5 deal-identical, balance 10395.28 ✓. (c) R-a/R-b/R-c as expected ✓. (d) R-e 10/10 SAME ✓. (e) no new/lost fire, S54KILL 0 both ✓. (R-d/R-f confirm and never decide alone.)
- KEPT: .B81RKD source (137076D9) + its ex5 (FA4C9249) stay on disk, uncommitted, never pushed; .preB81 kept. terminal.ini + 38 chart files restored from content copies and verified (88a0deb1; 36/36 match + 2 terminal-created chart20/21.chr left in place, recorded, never staged).

## Part X - records (text only, grep-first)

- X1 PLANNER_CONTEXT.md section 4: grep "Prediction is not a grade" = 0 -> appended the exact lesson line (verified count 1).
- X2 PLANNER_CONTEXT.md section 5: grep "relay B-81" = 0 -> appended the exact history line (verified count 1).
- X3 Ledger item 1226, tag B81-RKD-TRIAL, verdict KEPT (banking; K1; K5 SHAs; T1/T2 tables; R-a to R-f; T4; X1/X2 landed).
- X4 No edit to the strategy skill, journal CSV, register, spec, includes or indicators.

## Part F - file, push, reply

- F1 this result (trader summary first; final disk state below; no carried note - no K1 conflict, banking count 1).
- F2 slice BUILDER_SLICE_B81.md (raw K3 spots, both diffs, both filed-trade tables, raw R-a to R-f rows).
- F3 ledger 1226.
- F4 pointer (35-line cap): latest B-81 KEPT; new kept EA source SHA 137076D9 + ex5 FA4C9249 (kept build = kept + hunk S + hunk RKD); j43 8EDD1254 bal 10474.64 + j44 113541CF bal 10395.28 as new baselines; planner ClickUp Brain B-81; next relay B-82.
- F5 stage explicit paths only: result, slice, ledger, pointer, PLANNER_CONTEXT.md. Never EA, includes, indicators, ex5, journals, logs, inis or backups. Commit + push builder/B-81 via `backup`.
- F6 ls-remote builder/B-81 must return the commit. Reply: B-81 is done, GitHub branch builder/B-81, commit <short>, verdict KEPT

## Final disk state (KEPT turn; new kept build on disk, uncommitted)

- EA Experts/SRJ_FlowNexus_EA.mq5 137076D9 (695359 B, LF-only: kept + hunk S + hunk RKD) + .B81RKD 137076D9 (frozen copy, kept, uncommitted, never pushed) + .preB81 kept; EA.ex5 FA4C9249 (465572 B, fresh binary matching the edited source); terminal.ini restored 88a0deb1 (verified); 38 chart files restored from content copies (36/36 verified + 2 terminal-created left in place); no terminal64 running.
- CQD BE6FD84F + ex5 90D3EF87 (untouched; record only). j43 8EDD1254 (71653 lines) / j44 113541CF (71396 lines) (new journals, uncommitted, never pushed; record only).
- Gated text files: ledger +1226, pointer, PLANNER_CONTEXT.md +X1/X2 (disk SHAs in F5 commit).

No carried note (no K1 conflict; banking count 1).

(End of file)
