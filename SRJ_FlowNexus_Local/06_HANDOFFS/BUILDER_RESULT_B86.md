# BUILDER RESULT B-86 - readable XOB diagnostic: pick-only path reproduces per row, full map still not readable, MEASURED

Trader summary: the only XOB reading the machine can actually run - the selected line's zone, promotion and in-play verdict at the counted candle - reproduces cleanly on both rows from existing records. His 5 June long reads in-play on its selected line; his ruled-out 2 June buy reads not-in-play on its selected line. The full every-live-line map stays unreadable by the machine, exactly as B-84 found. Nothing was edited, compiled or run.

## Part 0 - fresh-session start

- 0.1 Relay skill loaded whole first (disk copy governs, 67 lines incl. B-85 STOP bullet), then strategy skill whole (199 lines; .agents copy stub, never opened). TERMS-HIS, QUOTE-WORDS-POINT-AT-ROWS, ASK-THE-CODE, RECORD-FIRST NO DIRECT QUESTIONS, LOGIC-IS-BUILDER'S, GATE-AUTHORIZATION.
- 0.2 git ls-remote backup builder/B-85 returns `14fb0cf7351b8cda15a1b6354c4d9edfab601943` (verified). Cut builder/B-86 at it. Dirty tree kept (350 lines at cut: pre-existing lane dirt + artifacts, count only). No git config/remote change. Push via `backup` (never `origin`).
- 0.3 Read in order on builder/B-85: pointer (22 lines); RESULT_B85 whole (50 lines); RESULT_B84 whole (60 lines, STOP + verdict note); SLICE_B84 whole (45 lines: W before/after, K3 spots, NOT FOUND evidence); PLANNER_CONTEXT whole (88 lines); PLANNER_HANDOFF whole (32 lines); PLANNER_SKILL whole (33 lines); PLANNER_RELAY_TEMPLATE whole (34 lines); both skills whole (67 + 199 lines); spec v4.2 whole via fresh temp copy (SHA F2F4CDDE); register whole (65 lines, verified unchanged); journal CSV by grep only (1066 lines); ledger/AGENTS/.clinerules by grep only.
- 0.4 Names per relay (kept EA 137076D9 695359 B / ex5 FA4C9249; .B82C 55D91C7E / ex5.B82DIAG 368FE7D7 read-only; baselines j43-j46 SHAs verified; no .preB86 cut (R8: no backups, no edit authorized); no j47/j48; tags as listed, all FOUND where claimed).
- 0.5 Start gate: git log -1 = 14fb0cf. git diff 14fb0cf EMPTY on every 0.3 committed text file + ledger + spec + journal CSV, EXCEPT pre-existing worktree drift on AGENTS.md (35-line Codex contract vs 72KB blob, mtime 2026-10-06, another lane; scope forbids touching it; B-86 neither reads it for content nor stages it) - ACCOUNTED, reported. Ledger `^1229.` = 1, `^1230.` = 1 (B-85's landed item; relay 0.5 omits counts, X3 orders 1231), `^1231.` = 0, `B86-` = 0. Journal CSV 1066 lines. Prefix SHAs untouched: EA 137076D9CF85, ex5 FA4C924978F6, terminal.ini 88a0deb1. No terminal64 launch at any point this turn.
- 0.6 Scope: Part B + Part R + Part X + Part F text records only (no K, no T). Nothing forbidden touched (no EA/include/indicator/ex5/journal/register/spec/skill/terminal.ini/chart/AGENTS/.clinerules edit, no compile, no run). Legal outcomes as listed.

## Part B - banking (grep-first)

- B1 Strategy skill, journal and register unchanged since B-85 (verified diffs EMPTY); banking phrase count 1. His last message carried the B-85 reply line plus this B-86 relay (workflow + diagnostic, no new rule words). Record "no new rule words"; append nothing.

## Part R - read-only XOB diagnostic (every row names journal + EA SHA)

- R1 BUILDABILITY CONFIRM (kept EA 137076D9, located by text, raw in slice): selected zone at shift FOUND (:6911/:8800 buffers 22/23); selected promo at shift FOUND (:8790 buffer 33); ZoneInPlay FOUND (:7118); OHLC any shift FOUND (:2289+); confirmation machinery FOUND (:2481 kept 5-param form, zero hunk-C identifiers); runtime loop over live XOBs NOT FOUND (absence: 0 XOB loops, 27 POI_NLINES loops); runtime kill state NOT FOUND (absence: 0 OBPROV reads). Confirms B-84 K3 on the current disk build.
- R2 POPULATION (already-recorded counted-touch examples, provenance beside each): 2 June fire 15:35 + counted 14:20 (j46 EA 55D91C7E); 5 June long 16:15 + path 16:00/16:10 (j46 EA 55D91C7E); ruled-out 2 June = same fire + s177-178/s185/row 310. Nothing new created; nothing absent (no NOT FOUND).
- R3 PICK-ONLY TABLE (raw in slice): 2 June 14:20 pick 159.679-159.694 promoT 11:30, NOT in play (xobInPlay=0, committed=0), no touch (22 pts above), FIRED 15:30 r25.73, ruling INVALID. 5 June 16:00 pick 159.881-159.916 promoT 15:40, IN PLAY by pick verdict (xobInPlay=1; committed=0 alongside), touch covers zone, FIRED 16:10 r1.44 (16:15 open), ruling VALID. Pick distinguished from full map; selected result distinguished from full-map result (in SLICE_B83); ruling distinguished from result.
- R4 READINGS: A PICK-XOB-IN-PLAY: 2 June FAIL (pick not in play at 14:20); 5 June PASS (pick verdict in play at 16:00). B PICK-XOB-TOUCH-OPTIONAL: both PASS (admissible; 14:20 untouched-but-admissible, 16:00 touched-and-admissible; never rejects). Neither reading is a full implementation (limitation stated beside the table in slice).
- R6 COMPARISON: 2 June INVALID words beside A-FAIL (same negative direction; A is not a setup verdict) and B-PASS (admissibility only, never promotes). 5 June VALID words beside A-PASS + B-PASS (agreement). No unruled row in scope. His logic never re-decided; words quoted, rows pointed.
- R7 BUILDABILITY: BUILDABLE-PICK-ONLY (pick zone/promo/OHLC/ZoneInPlay/confirmation all shift-readable; diagnostic reproduces per row with provenance). NOT-BUILDABLE-FULL-XOB-MAP (zones/promos/kills of every live XOB still unreadable; B-84 stands). BLOCKED-MISSING-RECORD none. Measurement, not permission. No Part K, no Part T (R8: no .preB86 backups cut).

## Part X - records (grep-first)

- X1 Section 4: grep "B-86-XOB-READABLE-DIAG" = 0 -> appended the exact lesson (verified count 1).
- X2 PLANNER_HANDOFF section 3: grep "B-86" = 0 -> appended the exact line (verified count 1).
- X3 Ledger item 1231, tag B86-XOB-READABLE-DIAG (provenance j46 EA 55D91C7E; pick-only table result; full-map limitation; A FAIL/PASS + B PASS/PASS; R6 agreement; BUILDABLE-PICK-ONLY + NOT-BUILDABLE-FULL-MAP; no edit/compile/run; next step = planner's redesign decision).
- X4 scope clean (nothing forbidden touched).

## Part F - file, push, reply

- F1 this result (trader summary first; relay order; raw locating evidence; complete R3 table; R4 readings; limitation; provenance per row; final disk state; no carried note - R5-style chart call not in this relay; no record-first question arose).
- F2 slice BUILDER_SLICE_B86.md (raw evidence, table, greps; under 600 lines).
- F3 ledger 1231. F4 pointer (35-line cap): latest B-86 MEASURED; R7 pair; EA/ex5 unchanged; no compile/runs; next B-87 (planner's redesign decision).
- F5 stage explicit paths only: result, slice, ledger, pointer, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md.
- F6 commit, push builder/B-86 via backup, ls-remote must return the commit. Reply: B-86 is done, GitHub branch builder/B-86, commit <short>, verdict MEASURED.

## Final disk state (MEASURED turn; kept RKD build on disk, uncommitted)

- EA 137076D9 (LF-only, untouched) / ex5 FA4C9249 / terminal.ini 88a0deb1 (prefix-verified; no launches, no terminal64). No .preB86 (none authorized). No j47/j48.
- Gated text files: ledger +1231, pointer, PLANNER_CONTEXT.md +X1, PLANNER_HANDOFF.md +X2 (disk SHAs in F5 commit).

No carried note (no question arose; nothing to ask).

(End of file)
