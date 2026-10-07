# BUILDER RESULT B-78 - his entry line keys the target race on the kept build (hunk RK), RESTORED

Trader summary: the one change worked exactly where it should - on 27 Aug the machine now keys off his Daily POC, lets the Daily VWAP into the race, and refuses it below 1R with no fire. But the same change also moved his valid 4 Sep long: with the own-source line gone from the race, the machine fired at 15:35 on the London high instead of waiting for his 16:00 entry, so the entry, the stop and the exit all differ even though the target is the same. The June run is fully identical, five takes to the cent. Because one of the seven takes is not deal-identical, the change is put back: the disk runs the kept build again. No question goes to him.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (disk copy governs), then strategy skill whole (199 lines; .agents copy stub, never opened). His terms everywhere (TERMS-HIS). Quote his words, point at rows, never re-decide logic (QUOTE-WORDS-POINT-AT-ROWS). Code questions from code (ASK-THE-CODE), never him (RECORD-FIRST, NO DIRECT QUESTIONS).
- 0.2 ls-remote builder/B-77 returns `85b6295d80a6ca2291662e207f4a049df53f8ea1` (verified). Cut builder/B-78 at it. Dirty tree kept (326 lines at cut; count only). No git config/remote change. Push via `backup` (never `origin`).
- 0.3 Read in order on builder/B-77: pointer; RESULT_B77 whole (no carried note); SLICE_B77 whole (R1 key table, R2 winners, R5 code spots); RESULT_B76 R3 + SLICE_B76 R1 + line 3 (ranks); RESULT_B68 T1/T2 (filed-trade baselines, balances 10474.64 / 10395.28); spec v4.2 whole via fresh temp copy (SHA f2f4cdde; focus §2.3, §3.7, §6, §10); register whole (65 lines); PLANNER_CONTEXT whole (74 lines); journal CSV by grep only (1066 lines); ledger/AGENTS/.clinerules by grep only.
- 0.4 Names per relay (.preB78 SHAs verified; .B78RK kept uncommitted; hunk S untouched; j41 DD4128CB; j42 ED757045; inis/dates/terminal.ini as listed; codes, code names located by text, ranks per SLICE_B76 line 3, rows per SLICE_B77).
- 0.5 Start gate: git log -1 = 85b6295. git diff 85b6295 EMPTY on all 13 gated files. Ledger `^1222.` = 1, `^1223.` = 0, `B78-` = 0. Journal CSV 1066 lines. All disk SHAs match RESULT_B77 final state (EA 6CFE8F8B LF-only CR=0; ex5 6CDBB39E; terminal.ini 88a0deb1; .B69DIAG 4C6D560E/D2EDDA28; CQD BE6FD84F/90D3EF87; FlowLogic 956BF3E3/27B5F272; HTFEngine D5FD5B06; BiasEngine 3B1D9D3D; OrderblockMgr 5D14FCE2; Draw FD2B3716; MARKER 79859EDC/f0890c0b; j37/j38/j39/j40). No terminal64 running. No STOP.
- 0.6 Scope kept (one EA edit, one compile, two runs; EA edit uncommitted/unpushed; no include/indicator/ini/skill/journal/register/spec change).

## Part B - banking (grep-first)

- Skill grep "not yet a valid bias for short" = 1 -> ALREADY_BANKED 79ddb11, append nothing. His last message carried the B-77 reply line only: no new words.

## Part K - rule check, backups, one edit, one compile

- K1 RULE-CONFLICT CHECK: no word of his keys targets off the seed line. Greps over skill (seed+target/anchor/tier hits: only compatible pins - BOOKING-INNOCENT s56, MANAGE-NEAREST s32, TP booking s66, OWN-SOURCE-EXCLUSION s94, REFINE-ONLY s91 which authorizes target-logic refinement), findings (3 hits, none a seed-line target rule), journal CSV (0 hits). His words behind the change (s53/s51/s46 latest-retest-governs, s65/s87 ranks+POC-supremacy, s94 own-source, s130/s136/s147 27-Aug skip, s193/s194/s195 kept targets correct, spec §2.3/§3.7/§6) all support it. Edit authorized, no carried note.
- K2 BACKUPS: EA.preB78 6CFE8F8B ✓, ex5.preB78 6CDBB39E ✓, terminal.ini.preB78 88a0deb1 ✓. Content copies: terminal.ini.preB78 + all 36 chart .chr files (path-preserving temp copies).
- K3 RAW SPOTS (pasted raw with real line numbers before editing; raws in slice): RETESTBOOK build kept EA:2293-2308; `g_anchorLine = pr.topLine;` EA:8299; race tier key EA:2660; UjPoiTargetValid EA:2571-2580; reseed/reset sites :8051/:8077/:8130/:8617/:6706. All FOUND, edit made.
- K4 HUNK RK (target logic only; full diff raw in slice; +91/-0, 12 all-additive hunks): RK globals + SrjRowkeyClear/SrjRowkeyUpdate/RkHeldRefused (row replica of the RETESTBOOK inequalities); per-bar track call (inWindow-gated); clear+plant at seed :8299, reseeds :8051/:8077, swaps :8130/:8617, reset :6706 (prototypes added: ResetSequence is the first caller in file order); race-head row-key (lowest held rank replaces anchor rank) + ROWKEY print; own-source gates in both POI loops (silent, after the UJPOISKIP block so existing prints are byte-identical when nothing new is refused). Untouched: session/pool, validity, nearest-wins, 1R, entry, stop, exits, hunk S, non-target g_anchorLine uses, UjPoiTargetValid itself (:11878 managed path untouched).
- K5 COMPILE once: 0 errors, 0 warnings (9389 ms). .B78RK SHA 7A88676A355D5BFF374983B82C589162439814863E761CACADC2177080C8B91D (kept, uncommitted). New ex5 SHA 773DB69E644DCC0C2080DFB53CB64D14AD420A671BC7C9DB1FEC4E75CB0D8494. Full diff raw in slice.

## Part T - two runs, graded on whole runs

- T1 j41 RECON62 EURUSD (RECON50_DEMO_USD.ini; terminal.ini dates written 1787702400/1788998400 and read back; no terminal64 before launch; mt5_start_backtest run c7691569b84f; window verified on day log within a minute (8/26 bars); 563338 ticks / 3168 bars = j37 data, 0:03:59; leftover terminal killed by server PID; agent journal split at run boundary, T1 portion archived as j41 DD4128CB 69508 lines). Filed-trade table vs j37 in slice: 6/7 deal-identical (A1, A2, A4, A5, A6, A7 entries/stops/targets/exits match); A3 CHANGED (j41 15:35 bar entry 1.15964 sl 1.15835 tp 1.16302 exit 15:45 BREAK vs j37 15:55/1.16018/1.15847/day-close 1.16129; target same). New fires: none (7 vs 7). Lost: none. Balance 10429.29 vs 10474.64. ROWKEY SAME key+own on A1, A2, A4, A5 (row-bar 16:35 vs 16:15 noted), A6, A7, F2k; A3 15:55 race absent (fired 15:40). F2k 17:00: ROWKEY key Daily-POC fallback=0, TPCENSUS winner Daily-VWAP 1.16498 26pts, POLL R0.20 FAIL, PREBIND_FAIL C_TOUCH, no fire - refused at the target step below 1R as expected. S54KILL 0.
- T2 j42 June USDJPY (USDJPY_DEMO_JUNE.ini; dates written 1779667200/1781308800 and read back; no terminal64 before launch; run 4d2ccbef4e96; window verified (5/26 bars); 740873 ticks / 4320 bars = j38 data, 0:04:03; leftover killed; T2 portion archived as j42 ED757045 71394 lines). Filed-trade table vs j38 in slice: all 5 deal-identical (5/27, C3, 6/4 SHORT, 6/5 16:55, B3; 5/27+6/4+6/5-16:55 unchanged, recorded). New: none. Lost: none. Balance 10395.28 = j38 to the cent. ROWKEY SAME on B3, C3, F1a, fallback=0 all. B2: NO ROW (needs hunk C; B-77 R2 stands). S54KILL 0.
- T3 VERDICT, right after both tables: (a) FAILS (A3 not deal-identical); (b) HOLDS (B3+C3 identical, no new fire); (c) HOLDS (F2k refused D-VWAP below 1R, key Daily-POC, no fire); (d) FAILS 10/11 (A3 15:55 race absent); (e) FAILS (needs all 11). Otherwise RESTORED: EA+ex5 restored from .preB78, verified 6CFE8F8B / 6CDBB39E. .B78RK + diff kept (uncommitted). terminal.ini restored from content copy, verified 88a0deb1; 36 chart files byte-verified restored; no terminal64 running. Verdict RESTORED.

## Part X - records (text only, grep-first)

- X1 PLANNER_CONTEXT.md section 4: grep "Whole-run grade" = 0 -> appended the exact lesson line. X2 section 5: grep "relay B-78" = 0 -> appended the exact history line.
- X3 Ledger item 1223, tag B78-ROWKEY-TRIAL, with verdict RESTORED (banking; K1; K5; T1/T2 tables; ROWKEY 10/11; F2k; verdict; X1).
- X4 No edit to strategy skill, journal CSV, register or spec.

## Part F - file, push, reply

- F1 this result (trader summary first; final disk state below; carried note only on K1 conflict or banking 2+ - neither, so none).
- F2 slice BUILDER_SLICE_B78.md (raw K3 spots, full hunk diff, both filed-trade tables, raw ROWKEY rows, raw F2k rows).
- F3 ledger 1223.
- F4 pointer (35-line cap): latest B-78 RESTORED; EA on disk restored 6CFE8F8B + ex5 6CDBB39E; j41 DD4128CB bal 10429.29, j42 ED757045 bal 10395.28; planner PromptQL bot B-78; next relay B-79.
- F5 stage explicit paths only: result, slice, ledger, pointer, PLANNER_CONTEXT.md. Never EA/includes/indicators/ex5/journals/logs/inis/backups. Commit + push builder/B-78 via `backup`.
- F6 ls-remote builder/B-78 must return the commit. Reply: B-78 is done, GitHub branch builder/B-78, commit <short>, verdict RESTORED

## Final disk state (RESTORED turn; verified after restore)

- EA Experts/SRJ_FlowNexus_EA.mq5 6CFE8F8B (688905 B, LF-only) + .B78RK 7A88676A (693654 B, kept, uncommitted, never pushed) + .preB78 kept; EA.ex5 6CDBB39E (461660 B, restored bytes matching the kept source); terminal.ini 88a0deb1 (restored pre-run content, verified SHA); no terminal64 running.
- CQD BE6FD84F + ex5 90D3EF87 (untouched; record only). j41 DD4128CB / j42 ED757045 (new journals, uncommitted, never pushed; record only).
- Gated text files: ledger +1223, pointer, PLANNER_CONTEXT.md +X1/X2 (disk SHAs in F5 commit).

No carried note (no K1 conflict; banking count 1).

(End of file)
