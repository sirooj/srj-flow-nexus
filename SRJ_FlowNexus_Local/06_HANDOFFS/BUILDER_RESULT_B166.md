# BUILDER RESULT B-166 - his 27 May words banked; blind GBPUSD run done, machine sheet sealed

Trader summary: your words are banked first: without a journal before June and no replay on MT5, the 27 May long cannot be checked by you, so it sits as a warm-up deal outside your audited range — never graded, never carried as a question again. Your blind test ran clean on the unchanged build: the window had data on all 15 days, the run passed in under 4 minutes, and the machine's trades are sealed in their own sheet. That sheet holds 1 graded-window deal and 1 warm-up deal — counts only here, no dates, sides or prices. Write your own 6-17 July list first, then open the sheet. Nothing was changed on the build.

## Relay order (B-166 BLIND-GBP0706 1 of 6, MEASURED: banking + one blind run)

- Part 0 on builder/B-165 at 57ffc52 (ls-remote returned 57ffc528b908bd5292afbfc1c3fe0190eea76bc7; builder/B-166 cut here; HEAD builder/B-166 at 57ffc52 re-checked after cut). Push via backup, never origin.
- Skills loaded whole (srj-relay 90 lines + srj-strategy 244 lines read raw this turn; Row pack L62-70 + Setup report L72-77 govern; .agents stub never opened).
- Reads in order: pointer; RESULT_B165 + SLICE_B165 whole; RESULT_B164 carried + R1 coverage; register whole; spec v4.2 whole (396 lines, §3.0 windows 09:00-12:00/14:00-19:00 server); CONTEXT whole (284 lines + L196-197); REPORT/README; RECON62 + June run inis located (RECON50_DEMO_USD.ini, USDJPY_DEMO_JUNE.ini); B-165R cutter/renderer/index scripts located; TickAudit SOURCES located (Indicators + Scripts .mq5; NO runnable audit preset for GBPUSD — new .set written); Files/SRJ_TickAudit_* outputs present. Ledger, AGENTS.md, .clinerules, journal: grep only.
- Names per 0.4 verified: EA 1617DC1A/ex5 187A7202; indicator 7842A02E/ex5 10880847; OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; terminal.ini live CF80083C (04:25, unchanged). RECON62-B162 re-proves this exact build (same SHAs, 14 deals, B-162 KEPT) — REFINE-ONLY met, no new RECON62 run. Window 1782691200/1784332800 (6/29 warm-up, graded 6-17 July). Lanes: FIDELITY-B162 closes (3 of 6); BLIND-GBP0706 opens (1 of 6). Tag B166-GBP-BLIND-RUN; ledger 1312; kit PK-2.
- Start gate: log-1 = 57ffc52; status 746 lines (dirty tree preserved); git diff 57ffc52 EMPTY on every 0.5 path (incl 99_WORKFLOW); disk SHAs match; terminal.ini CF80083C 04:25; no terminal64. Records: ledger ^1311.=1, B165 tag=1, ^1312.=0; HANDOFF B-165:=1; pointer "first B-163, 3 of 6"=1; CONTEXT B-165 line L197 quoted, present. No STOP.
- Scope: MEASURED (banking + one tester run on the unchanged kept build). Part B banking + register NOTE; one run ini; window write + read-back; .preB copies + restore; one launch; offline packs with B-165R scripts; text records. No EA/indicator/include edit, compile, input change except Symbol, second run, gate, hunk, number, tolerance; no grading of machine GBPUSD trades; no trade list in summary/reply. Legal results used: FOUND, NOT FOUND, SAME, ADDED, NOT PRINTED, NO DATA, ACCOUNTED, ALREADY_BANKED.

## Part B - banking (grep-first, verbatim)

- B1, his words 2026-10-11: "i don't have a journal that reaches before june so i can't verify that and there is no replay feature on MT5." Greps before append: skill 0, journal 0, ledger 0, register 0 → landed: strategy skill new section "27 May NY long UNVERIFIABLE (his words 2026-10-11, B-166)" + consequence line (warm-up, never graded/kept/never, no chart call again); journal row 321 (same shape as B-150 row L320); register NOTE under section B (verbatim); ledger inside item 1312. All counts 1.
- B2, his order 2026-10-11: "The next step, i would like to do another blind test on GBPUSD from 6 july to 17 july." Landed in journal row 321 with B1 (blind-test order quoted). Count 1.

## Part R1 - GBPUSD readiness (read-only, before launch)

- Symbol: history\GBPUSD\2026.hcc present (17 MB, 10/06) + ticks\GBPUSD + cache M5.hc on the Dukascopy-demo-mt5-1 server data. Digits/point: NOT PRINTED from any quotable disk source pre-launch (symbol DBs are binary) — established at T from 5-decimal prints (deal fills 1.33716/1.33564/1.33863/1.33901). Spread mode SAME as RECON62: no Spread key in either run ini (B-138 R2) or the new GBP ini — broker floating.
- Symbol branches: EA grep USDJPY|EURUSD|GBPUSD = 3 hits, all cosmetic `inst=EURUSD_M5` print labels (EA:4974/4984/4988 — mislabel on GBPUSD rows, print-only); `"JPY"|_JPY` = 0; 419 _Symbol/Symbol() uses all generic. Include/SRJ: 4 hits, all comments. Indicator: 0 hits. UJ*-named prints (UJADMIT/UJRETARGET/UJPROBE/UJBARMAP, 14 def lines) are general prints with UJ names — unconditional PrintFormats (EA:11305/12518/12887), no symbol gate; GBPUSD takes the same path. EU-Sep date fixtures (SrjFiledLevel/SrjSep8Filed/g2Px/ladDate/sl54) are diagnostic-compare only per SRJ_HandFixture.mqh header (labels never operands); inert on July GBPUSD by date. No _Digits/JPY branching (0 hits). GBPUSD path: general, neither EURUSD- nor USDJPY-specific. No refusing branch → no STOP.
- History: SRJ_TickAudit SOURCES found (Indicators + Scripts .mq5); runnable preset NOT FOUND (only B48 EURUSD/June-era presets) → new Presets\SRJ_B166_GBP.set (InpSymbols=GBPUSD, InpFrom=1782691200, InpTo=1784332800, B48 input shapes) + startup ini GBP0629_TICKAUDIT.ini (B47 [StartUp] pattern: Symbol/Period/Script/ScriptParameters). Run via terminal startup (not tester): day table 6/29-7/18 — all 15 days with data (70k-126k ticks/day, ~1430 min/day, no intraday gaps; weekends CLOSED; M5 bars column UNREAD_BARS "?"). Graded 7/06-7/10 + 7/13-7/17: 10/10 with data ≥ 8 → proceed, no STOP. CSVs Files/SRJ_TickAudit_20261011_days.csv (+ gaps file absent = none ≥5 min).
- His GBPUSD record (fixed patterns + regex second form; ZERO-COUNT RELAPSE L58): "GBPUSD" 1 hit = own L1073 banking row; "GBP" 1 same row; "GU" 15 hits all substring noise (regular/argue class, L5/L58-61/L82-89/L263/L281); July dates 7/6-7/10 + 7/13-7/17 one dated LDN row each (L102-L138: #101/#105/#109/#113/#117/#121/#125/#129/#133/#137) with undated companions — his July block EXISTS (L102-L141) and was NOT read for trade details (blind discipline: dates/line numbers only). No validity word anywhere.

## Part T - the run

- T0 content copies .preB166: terminal.ini CF80083C + Profiles (4 charts) + run ini, SHAs recorded.
- T1 GBP0629-B162.ini = RECON50_DEMO_USD.ini with Symbol=GBPUSD; diff raw = only the Symbol line; no Spread key.
- T2 terminal.ini [Tester] DateFrom=1782691200 DateTo=1784332800 written + read back raw (only those two lines changed, encoding preserved).
- T3 script-file launch (WMI PID 19264); journal verified GBPUSD 6/29-7/18 within minutes (B162ORIGIN printing on GBPUSD); wrapper killed, terminal 8748 alive; watcher launched, PID 19460 verified; DONE polled in short cycles, verified against the marker directly (B-162 lesson).
- T4 DONE genuine: `GBPUSD,M5: 1386092 ticks, 4320 bars ... Test passed in 0:03:55.061` (under 10 min; slot fix live). Restored .preB166 copies: terminal.ini CF80083C + Charts 22/22 identical verified; leftover terminal stopped by PID; no terminal64. EA/indicator/ex5 SHAs unchanged (1617DC1A/187A7202/7842A02E/10880847).
- STOP rules: none hit (right symbol + window; marker present; no halt rows; SHAs unchanged).

## Part R2 - packs, index, sealed sheet

- Cutter build_rowpack_gbp0629.ps1 (fixed copy of B-165R cutter; filed changes: run/segment/weeks/MTEXIT-check rewritten for the single GBP run; two owned script defects caught and fixed in-turn: flat span list-drop, wrong-loop run names). Packs from the same day log, same 28-tag columns: ROWPACK_GBP0629-B162 24944 rows (W1 6983/W2 9636/W3 8325) + 15 day files; both GBP MTEXITs packed (j=1448182 W1:5459, j=1470236 W2:3235). DEALS_GBP0629-B162.csv: 4 rows, register_row NONE everywhere. INDEX_GBP0629-B162.md: 2 deals (seed/conf/latch/entry/exit) + 13 rejected kills.
- SETUPS_GBP0629-B162.csv via build_setups_gbp0629.ps1 (15 B60C-dedup candidates, README join rules; 4 owned script defects caught and fixed in-turn: FL/Format-List collision, kill-row scoping to poi+dir+pack-order, bar dot/dash formats, zone/div joins). 15 rows, 2 EXECUTED (7/02 warm-up LONG, 7/07 SHORT); 13 REJECTED with killing rows (7/01 TP_RR_FAIL; 7/03 ×2 DIV_FALLBACK; 7/06 ×3 TP_RR_FAIL + ×1 DIV_FALLBACK; 7/08 never-confirmed + LTF_MISALIGN; 7/09 LTF_MISALIGN; 7/13 LTF_MISALIGN; 7/14 ×2 DIV_FALLBACK).
- Sealed sheet REPORT/BLIND_GBPUSD_0706-0717.md: seal line first; 1 graded-window trade (7/07) + 1 warm-up trade (7/02) in trader words from report rows only; per-day rejected counts with killing reasons, no prices; no validity word anywhere.

## Part X - records (grep-first, append once, verify count 1 each)

- X1 CONTEXT section 4 appended (relay text verbatim). Count 1.
- X2 HANDOFF section 3 appended after the B-165 line (relay text verbatim). Count 1.
- X3 ledger 1312, tag B166-GBP-BLIND-RUN (banking, R1 tables, run marker + elapsed, pack/report SHAs; no trade list in the summary line). "^1312." = 1.
- X4 pointer rewritten (35-line cap): latest B-166 MEASURED; FIDELITY-B162 CLOSED; Lane BLIND-GBP0706 (first B-166, 1 of 6); Next = his GBPUSD takes then comparison; O3 pending kept; goal open.

## Part F - file, push, reply

- F1 this result. F2 slice (branch quotes, audit table, ini diff, launch + marker lines; under 600 lines; no trade list).
- F2b packs (3 week + 15 day), DEALS, INDEX, SETUPS, sealed sheet.
- F3 ledger 1312. F4 pointer.
- F5 stages result, slice, F2b files, strategy skill, journal CSV, register, ledger, pointer, CONTEXT, HANDOFF. Never EA, includes, indicator, ex5, logs, inis, profiles, backups.
- F6 commit, push via backup to builder/B-166; ls-remote check must return the commit.
- Reply line: B-166 is done, GitHub branch builder/B-166, commit <short hash>, verdict MEASURED.

## Final disk state (MEASURED turn; B-162 kept build on disk, verified, terminal idle)

- EA 1617DC1ACCE6B50ED2D1359582A70A8B8503C569623EE90C18C6B33542796207 + ex5 187A7202 (pair matches); indicator 7842A02E + ex5 10880847 (pair matches); OB 8BBF936B; Bias 3B1D9D3D; HTF D5FD5B06; terminal.ini CF80083C June as-run; Charts as-run (22/22); no terminal64. Strategy skill +1 section; journal +1 row (1073 lines); register +1 NOTE; CONTEXT +1; HANDOFF +1; ledger +1 (1312); pointer rewritten; result + slice new; GBPUSD packs (3 week + 15 day) + DEALS + INDEX + SETUPS + sealed sheet new. Build scripts (.set, launch, watch, audit, cutters, renderer, indexer) unstaged in 00_CURRENT_WORKING. B-162 packs/reports untouched. No source/ex5 committed.

(No carried note - nothing needs him; his GBPUSD list comes first by the blind order.)
