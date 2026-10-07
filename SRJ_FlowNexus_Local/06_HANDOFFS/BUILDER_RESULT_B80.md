# BUILDER RESULT B-80 - side-matched row-key reading (RKD) across both whole runs, MEASURED

Trader summary: read every retest-row line's side tag beside the trade direction on both whole runs (418 target-race passes). The 4 Sep 15:35 long's Yearly POC was hit from below (r2:dS) while the trade is long: under side-matching it is not the long's own source, the key stays Monthly POC, the Yearly POC stays in the race and refuses at R 0.18 exactly as the kept build did, and his 16:00 entry stands. All five must-holds grade HOLDS and every filed fire is unchanged on both runs. One side-matched pass crosses 1R against the kept rows without moving any trade: 27 Aug 10:05 short books the Daily POC at R 0.40 (refused) where kept booked YPML at R 3.13 (passed, then stalled). His covering words for that refusal shape are on record (nearest below-1R skip), so no question goes to him. Nothing was edited, compiled or run.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (disk copy governs, 66 lines), then strategy skill whole (199 lines; .agents copy stub, never opened). TERMS-HIS, QUOTE-WORDS-POINT-AT-ROWS, ASK-THE-CODE, RECORD-FIRST NO DIRECT QUESTIONS.
- 0.2 ls-remote backup builder/B-79 returns `50b353c96421eb054212bc76b583e15e21c7cc0f` (verified). Cut builder/B-80 at it. Dirty tree kept (330 lines at cut, count only). No git config/remote change. Push via `backup` (never `origin`).
- 0.3 Read in order on builder/B-79: pointer (27 lines); RESULT_B79 whole (61 lines, carried note = B-79 chart call); SLICE_B79 whole (346 lines); RESULT_B78 + SLICE_B78 whole (55 + 212 lines; hunk RK diff, 11 ROWKEY rows, F2k rows); spec v4.2 whole via fresh temp copy (SHA F2F4CDDE..., 396 lines; focus §2 row 1, §2.3, §3 line "same-direction higher-tier POI touch", §3.7 targets paragraph, §6 arrival-order + same-bar-tie); register whole (65 lines); PLANNER_CONTEXT whole (78 lines); journal CSV by grep only (1066 lines; rows 279/280/312 quoted whole in slice R1); skill lines s36/s53/s89/s94/s137/s130/s147/s193/s195 quoted verbatim in slice R1(c); ledger/AGENTS/.clinerules by grep only (15:35 hits: ledger B-78/B-79 own records only; AGENTS 0; .clinerules 0).
- 0.4 Names per relay (kept EA 6CFE8F8B full SHA 6CFE8F8B81C700411EB723C597A4672D2D631123284F45382CB96C11DC50D213, 688905 B LF-only; ex5 6CDBB39E; .B78RK 7A88676A read-only 693654 B; .preB78 kept; j37 77F454AB bal 10474.64; j41 DD4128CB bal 10429.29; j38 6019A461; j42 ED757045 bal 10395.28; row codes + r<rank>:dL|dS tokens as listed; journals located on disk: j37 = 06_HANDOFFS/RECON62-B66K_JOURNAL.log, j41 = 06_HANDOFFS/RECON62-B78_JOURNAL.log, j38 = 06_HANDOFFS/JUNE0525-B66K_JOURNAL.log, j42 = 06_HANDOFFS/JUNE0525-B78_JOURNAL.log).
- 0.5 Start gate: git log -1 = 50b353c. git diff 50b353c EMPTY on all 0.3 committed text files + ledger + spec + journal. Ledger `^1224.` = 1, `^1225.` = 0, `B80-` = 0. Journal CSV 1066 lines. All disk SHAs = RESULT_B79 final state (EA 6CFE8F8B; ex5 6CDBB39E; .B78RK 7A88676A 693654 B; terminal.ini 88a0deb1; CQD BE6FD84F/90D3EF87; FlowLogic 956BF3E3/27B5F272; HTFEngine D5FD5B06; BiasEngine 3B1D9D3D; OrderblockMgr 5D14FCE2; Draw FD2B3716; MARKER 79859EDC/f0890c0b; j37/j38/j41/j42 prefixes verified). No terminal64 running. No STOP.
- 0.6 Provenance: RESULT_B78 K5 names the new ex5 SHA 773DB69E644DCC0C2080DFB53CB64D14AD420A671BC7C9DB1FEC4E75CB0D8494 (compiled from .B78RK source 7A88676A); B-79 R1 + both slice conventions name j41's build "RK 773DB69E" / "hunk RK ex5 773DB69E"; pointer names .B78RK 7A88676A. So j41/j42 were built by ex5 773DB69E (from source 7A88676A). 773DB69E names record lines (FOUND) but no current disk file (NOT FOUND on disk: current ex5 restored to kept 6CDBB39E; no backup carries a 773DB69E hash). Record only.
- 0.7 Scope MEASURED: text records only (Part X). NO ROW and NOT FOUND where legal. No proposal, no hunk text.

## Part B - banking (grep-first)

- B1 Skill grep "not yet a valid bias for short" = 1 (skill:198) -> ALREADY_BANKED 79ddb11, append nothing. His last message carried the B-79 reply line only: no new words.
- B2 The B-79 carried chart call (15:35 / 15:40 open 1.15964 / stop 1.15835 vs his 16:00 open 1.16018) is WITHHELD by the planner. It never reaches him. Recorded in X3 only; never in the skill, journal or register.

## Part R - records (every row names journal + EA SHA)

- R1 SIDE READ 4 Sep (j37 kept 6CFE8F8B beside j41 RK 773DB69E; raw rows verbatim in slice): 15:35 RETESTBOOK hits=3 W-POC:r8:dL M-POC:r6:dL Y-POC:r2:dS both journals (j37:43547/j41:43753); SUPPRESSED Y-POC SHORT opp=1 higher=1 HELD behind M-POC LONG both (j37:43546/j41:43752); CONFIRMPOLL anchor M-POC LONG confirm=1 both (j37:43550/j41:43756); TP_ELECT j37:43789 tp=1.15987 R=0.18 + A6REFUSED TP_RR_FAIL (j37:43795) vs j41 TP_ELECT R=2.62 + FIRED 15:35 (j41:43996/43999); 15:45 RETESTBOOK hits=3 all dL both (j37:44003/j41:44056), confirm=0 both; 15:55 RETESTBOOK hits=2 W-VWAP:r9:dS Y-POC:r2:dL both (j37:44340/j41:44079), CONFIRMPOLL anchor Y-POC LONG confirm=1 both (j37:44343/j41:44083); j37 TP_ELECT R=1.66 + FIRED 15:55 (j37:44604/44607).
  (a) Arithmetic: 15:35 o=1.15946 c=1.15964 both below Y-POC 1.15987 (18/23pts under), h=1.16018 wick 31pts above. Body-below + wick-through-up = SHORT-side hit (dS) under spec §2 row 1. For the LONG trade the Yearly POC was hit from the wrong side.
  (b) His entry line (Yearly POC long side, s36 + rows 279/280 "Y AVP"): 15:35 present as r2:dS (not his side), confirm=1; 15:45 present as r2:dL (his side), confirm=0; 15:55 present as r2:dL (his side), confirm=1.
  (c) Verbatim quotes (s94, s89, s193/s195, spec §3.7 paragraph, same-direction line, §2 row 1) in slice R1(c). Record only, no verdict.
- R2 CODE LOCATE (read-only, by text): .B78RK SrjRowkeyUpdate longHit/shortHit (:2305-2306) + held-list add (:2308 `lines[n++] = k`, :2311 copy) - hit side NOT kept (k only; RkHeldRefused compares k). Kept EA RETESTBOOK print (:2305) + dL/dS tag (:2302 `(longHit ? "L" : "S")`) uses the SAME inequalities (character-identical). Booking direction guard is strict-side (TpTargetUpdateBest: LONG v > price, SHORT v < price); census admitted has NO zone guard while booking has the Task-31 containment guard. Full quotes in slice R2.
- R3 RKD CENSUS (rows only, no run; 418 distinct run/bar/dir passes with j41/j42 ROWKEY prints; kept anchor from kept-journal UJPOISKIP live anchor; POLL entry/sl verified build-invariant at every shared bar, 0 mismatches): EU 235 rows = S 197 / K 37 / N 1; UJ 183 rows = S 159 / K 21 / N 3. Full table in slice R3.
  B-79 flips: EU 20 = S: 8/27 16:55, 8/27 17:00, 9/1 09:50 LONG, 9/1 17:30 LONG, 9/2 17:20, 9/2 18:40, 9/2 18:50, 9/9 18:15 (8, take j41 outcomes); K: 9/1 09:25-09:50 SHORT x6, 9/1 17:30 SHORT, 9/4 15:35, 9/8 16:15 SHORT, 9/9 18:45, 9/9 18:50 (11, take kept outcomes); kept-path (no j41 print): 9/4 15:45/15:50/15:55 (3, follow kept through the 15:35 K refusal). UJ 9 = K: 5/29 15:50, 6/1 11:05, 6/9 10:35, 6/9 10:50, 6/9 15:15, 6/9 16:00 (6); S: 5/29 17:05, 6/1 10:55, 6/10 16:30 (3).
  Kept-FAIL->RK-PASS polls EU 5 (18:40 S, 18:50 S, 16:15 SHORT K, 18:45 K, 18:50 K) + UJ 5 (15:50 K, 17:05 S, 10:55 S, 11:05 K, 16:30 S): all stopped pre-fire (PREBIND/confirm=0/deferred-abort on rows); none fired. Kept-PASS->RK-FAIL polls: 9/1 09:25-09:50 x6 K (kept PASS stands) + 8/27 17:00 S (j41 FAIL refusal stands).
- R4 MUST-HOLDS: (a) 27 Aug 17:00 SHORT HOLDS (RKD key/own Daily-POC = RK -> S -> j41 rows: D-VWAP 1.16498 R0.20 FAIL, PREBIND C_TOUCH, no fire). (b) 4 Sep 15:35 LONG HOLDS (RKD key M-POC, Y-POC 1.15987 left in race -> kept rows: R0.18 refused, no fire). (c) 4 Sep 15:55 LONG HOLDS (RKD key/own Y-POC from row tags; W-VWAP:dS not own; no j41 race; kept rows fire 16:00 R1.66 = his take, register row 3). (d) Other ten B-78 ROWKEY rows HOLDS (all S; zero lines tagged against the trade in any row: A1/A2/A4/A5/A6/A7/F2k/B3/C3/F1a). (e) Fires HOLDS (RECON62 7/7: six S with RkFire==KeptFire to the digit + 15:35 K refused + 15:55 kept-path; June 5/5 all S identical; all 4 N passes end no-fire under RKD). Raw rows in slice R4.
- R5 VERDICT: RKD BREAKS - names EU 2026.08.27 10:05 SHORT (class N; row 10:05 D-POC:r10:dL D-VWAP:r11:dS; RKD key/own D-VWAP; kept anchor W-POC; RKD books Daily-POC@1.16541 R0.40 FAIL vs kept YPML@1.16500 R3.13 PASS; no fire either way; no filed trade moves). Record-first search: register (no 8/27 10:05 trade), skill (no 10:05 ruling; covering words FOUND: s89 nearest-refuse, s130/s136/s147 27-Aug skip same-shape, s94, s193), journal (no 8/27 10:05 row), spec §3.7 (refuse below 1R), ledger (1159 banks the skip; 10:05 hits other-context only). Covering rules FOUND -> NO carried note (RECORD-FIRST NO DIRECT QUESTIONS; refusal matches his banked skip shape). No proposal, no hunk text.

## Part X - records (text only, grep-first)

- X1 PLANNER_CONTEXT.md section 4: grep "Line side in the row" = 0 -> appended the exact lesson line (verified count 1).
- X2 PLANNER_CONTEXT.md section 5: grep "relay B-80" = 0 -> appended the exact history line (verified count 1).
- X3 Ledger item 1225, tag B80-RKD-READ (MEASURED): banking none (ALREADY_BANKED 79ddb11); B-79 chart call WITHHELD, record answer (15:35 Y-POC r2:dS, nearest higher target 1.15987, R 0.18 refused; entry line Y-POC long side 15:45 dL confirm=0, 15:55 dL confirm=1, 16:00 open 1.16018; s36/s89/s94/s193 + spec §2 row 1/§3.7/same-direction line); 0.6 provenance (j41 built by ex5 773DB69E from source 7A88676A; 773DB69E FOUND on record lines, NOT FOUND on disk); R2 code quotes (side not kept; same inequalities; strict-side + containment guards); R3 totals (EU 197/37/1, UJ 159/21/3; flip classes; poll classes); R4 grades (a-e all HOLDS); R5 verdict (RKD BREAKS naming 8/27 10:05; search FOUND; no carried note); X1 landed.
- X4 No edit to the strategy skill, journal CSV, register, spec, EA, includes or indicators.

## Part F - file, push, reply

- F1 this result (trader summary first; final disk state below; no carried note - R5 files none).
- F2 slice BUILDER_SLICE_B80.md (raw R1 rows, R2 code quotes, full 418-row R3 census table, R3 totals + flip classes, N resolutions, raw R4 rows).
- F3 ledger 1225.
- F4 pointer (35-line cap): latest B-80 MEASURED; R5 verdict line; B-79 chart call withheld (record answer); kept build unchanged EA 6CFE8F8B / ex5 6CDBB39E; .B78RK kept uncommitted; planner PromptQL bot B-80; next relay B-81.
- F5 stage explicit paths only: result, slice, ledger, pointer, PLANNER_CONTEXT.md. Never EA, includes, indicators, ex5, journals, logs, inis or backups. Commit + push builder/B-80 via `backup`.
- F6 ls-remote builder/B-80 must return the commit. Reply: B-80 is done, GitHub branch builder/B-80, commit <short>, verdict MEASURED

## Final disk state (unchanged; MEASURED turn, re-verified at gate)

- EA Experts/SRJ_FlowNexus_EA.mq5 6CFE8F8B (688905 B, LF-only, uncommitted: kept build + hunk S); EA.ex5 6CDBB39E (matches kept source); terminal.ini 88a0deb1; no terminal64 running. All backups kept uncommitted, never pushed.
- CQD BE6FD84F + ex5 90D3EF87 (untouched; record only). j41 DD4128CB / j42 ED757045 (record only).
- Gated text files: ledger +1225, pointer, PLANNER_CONTEXT.md +X1/X2 (disk SHAs in F5 commit).

No carried note (R5 search FOUND; no chart call filed).

(End of file)
