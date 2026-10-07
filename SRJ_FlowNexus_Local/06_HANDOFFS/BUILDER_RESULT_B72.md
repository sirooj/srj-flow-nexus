# BUILDER RESULT B-72 - his CQD divergence words beside the machine's own rows at every fire, MEASURED

Trader summary: your specification already settles how divergence works - one direction-matched divergence anywhere in the sequence, and your later ruling adds that an opposing newest clears it and the setup keeps waiting. Your 9 September packets that enforce both rules were issued and executed the same day. On the machine's own rows, every one of your valid trades carries a direction-matched newest divergence at its confirmation candle, on both readings of your rule. The 4 June short does too on the machine's stream (-2 at 09:45) - so neither reading stays out of it, and what keeps it out is your pane, where the divergence is invalid. That is a machine-read versus your-pane disagreement, filed as such, with no question back to you. Nothing was changed.

## Part 0 - fresh-session start
- 0.1 Relay skill loaded whole first (disk copy governs), then strategy skill whole (both parts, now 199 lines with B-70 section). His terms everywhere (TERMS-HIS s162). Quote words, point at rows, never re-decide logic (s183, s188). Code-path questions answered from code (ASK-THE-CODE s163), never him (s101).
- 0.2 ls-remote builder/B-71 returns `79ddb1186b55f1f4f0ce23d89b3beda0de6c5caf` (verified; parent 4f6ab1e, 7 files). Cut builder/B-72 at it. Dirty tree kept (326 lines; count only). No git config/remote change. Push via `backup` (never `origin`).
- 0.3 Read in order on builder/B-71: pointer; RESULT_B71 whole (no carried note); SLICE_B71 R3-R5 whole; spec v4.2 (§0.1 undated tables, §3.7 ordering, §3.8 whole, §8 rows, §9.1, §10); DIVCON-1 whole (§1 mechanism incl. verdict signs, §3 deltas, §7 + §8 his 9 Sep rulings); packets P-DIVCON-B + P-CQD-FLAGGATE (status + edit text); register whole; strategy s19, s101, s131, s133, s138, s140, s148, s155, s163, s183, s188 + B-70 end section; PLANNER_CONTEXT whole; journal rows 13 + 314 whole, rest by grep; ledger/AGENTS/.clinerules by grep only.
- 0.4 Names per relay (j37 77F454AB EU kept; j38 6019A461 June kept; j39 408E5073 / j40 1D968931 diag EA 4C6D560E; kept EA 6CFE8F8B; CQD = SRJ_CQD_TickBased_MT5 via InpCqdName EA:24; verdict signs +1/+2/-1/-2 per DIVCON-1 §1.3; Readings S/L as relayed; must-keeps = A rows + B3 + C-3June VALID-taken).
- 0.5 Start gate: git log -1 = 79ddb11; git diff 79ddb11 EMPTY on all 12 gated files (pointer, RESULT_B71, SLICE_B71, ledger, PLANNER_CONTEXT, relay skill, strategy skill, register, journal CSV, spec v4.2, DIVCON-1, XOBSUIT-1); ledger `^1216\.` = 1, `^1217\.` = 0, "B72-" = 0; journal 1066 lines; all disk SHAs match RESULT_B71 final state (EA 6CFE8F8B 688905 B LF-only; ex5 6CDBB39E; ini 88a0deb1; backups; includes; MARKER; journals j28-j40); CQD source BE6FD84F...A421F (50,555 B) + ex5 90D3EF87...84CE3C (no expected value; pre-edit digest 4B2D688C 50,557 B for comparison - differs, record only); no terminal64. LF-normalize gate applied. No STOP.
- 0.6 Scope MEASURED kept (journals/day-logs/source text only; text edits per Part X only; no proposal; at most one chart call under R4 - none carried).

## Part B - banking (grep-first)
- Skill grep "not yet a valid bias for short" = 1 verbatim (skill:198) -> ALREADY_BANKED 79ddb11. Journal grep = 1 (row 314, file 1066) -> ALREADY_BANKED 79ddb11. Ledger 1216 carries it verbatim -> ALREADY_BANKED 79ddb11. No new words since B-71; nothing appended.

## Part R - records (every row names journal + EA SHA)
- R1 CQD_WORDS: raws + tags in slice (spec §3.8 whole + §3.7 ordering + §8 rows + §9.1 + undated §0.1 + §10 context; DIVCON-1 §7 verbatim + axes, §8 verbatim flag-gate, charter §9 via §3; W2/s138 + W4/s133 + s140 + B-70 trio; journal fire-date hits whole: rows 13/314/303/165/167, all other fire dates zero hits). Amendments: (a) NO RULING FOUND (spec undated, cannot order vs 9 Sep); (b) FOUND AMENDS (9 Sep strict-clearing contradicts never-re-invalidate); (c) FOUND settled strict-clearing (P-DIVCON-B issued + executed 2026-09-09; W2 consistent; ledger silent).
- R2 CQD_CODE (kept EA 6CFE8F8B): UNREAD = unreadable-or-empty single-bar print-only (SIDE1O :10588-10601, SIDE1Q :10611-10624); P-DIVCON-B APPLIED (guard gone, caller :7864-7868 unconditional; latch :6669-6696); fire paths: latch NOT READ, verdict READ via unbounded S5 walk (:9451-9495, A6Fired :10822) - uniform across 4 June + all must-keep paths; flag-gate NOT APPLIED on disk CQD (old gates L732-735/L984-987; non-strict swings; disk SHA differs from both digests - record only). Packets: both ISSUED + EXECUTED 2026-09-09 (baselines AB102C0A EA / 92F3A62B CQD).
- R3 CQD_ROWS (census prints only nonzero verdicts, EA:7132-7147; all journals carry the stream): 16 rows in slice - every must-keep has a direction-matched newest census verdict (EU: 8/28 -1@09:25, 9/1 +2@17:15, 9/4 +2@15:45, 9/7LDN +2@09:10, 9/7NY +2@16:30, 9/8LDN -2@09:40, 9/8NY -1@16:20; June: 5/27 +1@15:20, 6/3 +2@09:00, 6/11 +1@14:00); 4 June newest -2@09:45 matched (opposing +1@09:35 earlier); 2 June newest +2@14:50 matched; 27 Aug newest -2@16:45 matched; single-bar prints UNREAD at every confirm (SIDE1O/SIDE1Q divLatch mixed 0/1); 1 Sep 09:45 silent both sides (0 fires, 0 prints).
- R4 PARTING + gate: Reading S DOES NOT SEPARATE (keeps all must-keeps AND 4 June/2 June/27 Aug on rows); Reading L DOES NOT SEPARATE (same newest verdicts); separator is HIS pane (s93/s141 pattern, §9.1 open). STOP-class NONE (s140 quoted; every must-keep matched under both readings). Chart gate closed ((c) FOUND; parting moot anyway) - NO chart call.

## Part X - records (text only, grep-first)
- X1 Strategy skill, journal, register: no edit.
- X2 PLANNER_CONTEXT.md section 5: grep "relay B-72" = 0 -> appended B-72 history line.
- X3 Ledger item 1217 B72-CQD-REC (MEASURED): banking verified, R1 amendments, R2 APPLIED/NOT APPLIED + READ/NOT READ, R4 separators + gate outcome.

## Part F - file, push, reply
- F1 this result (trader summary first; final disk state below; no carried note - R4 carried none).
- F2 slice BUILDER_SLICE_B72.md (R1-R4 raws + tables).
- F3 ledger 1217.
- F4 pointer (35-line cap): latest B-72 MEASURED; R2 code answers in one line; R4 separator verdict; kept build unchanged EA 6CFE8F8B / ex5 6CDBB39E; next = relay B-73.
- F5 stage explicit paths only: result, slice, ledger, pointer, PLANNER_CONTEXT.md. Never EA/includes/indicators/ex5/journals/logs/inis/backups. Commit + push builder/B-72 via `backup`.
- F6 ls-remote builder/B-72 must return the commit. Reply: B-72 is done, GitHub branch builder/B-72, commit <short>, verdict MEASURED (no carried note).

## Final disk state (unchanged; MEASURED turn, re-verified)
- EA Experts/SRJ_FlowNexus_EA.mq5 6CFE8F8B (688905 B, LF-only, uncommitted: kept build + hunk S); EA.ex5 6CDBB39E (461660 B, matches); terminal.ini 88a0deb1; no terminal64 running. All backups kept uncommitted, never pushed.
- CQD Indicators/SRJ_CQD_TickBased_MT5.mq5 BE6FD84F...A421F (50,555 B) + .ex5 90D3EF87...84CE3C (uncommitted, never pushed; record only).
- Journals j28-j40 SHAs as gated in 0.5 (all match). Gated text files (disk SHAs): result 62169553 (pre-finalization figure; this line is the last edit), slice 4593A605, ledger 0E67A3A7, pointer 74236497, PLANNER_CONTEXT.md 33746D16.

No carried note (R4: no chart call, no STOP-class).

(End of file)
