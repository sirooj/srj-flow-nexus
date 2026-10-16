Roles
- Planner: the planner agent the operator opens (ClickUp Brain since relay B-81; any profile or workspace). Reads this repo on GitHub, read-only, and writes relays B-<n>. Has no terminal and cannot push. Entry page SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_BOOTSTRAP.md; context SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_CONTEXT.md.
- Operator: pastes each relay whole into a builder session, and pastes the builder's one-line reply back to the planner. He does not code. Never ask him code questions.
- Builder: you. Do exactly what the relay lists, measure, report.

Fresh sessions
- Every relay is self-contained. A fresh session needs only three things: this skill, the previous BUILDER_RESULT_B<n-1>.md on branch builder/B-<n-1>, and the relay.
- For its own scope, the relay wins over older queue items in the pointer.
- Every relay opens with a Part 0 fresh-session start: the branch and commit to check out, the files to read in order, and every name the relay uses. A builder with no memory runs the relay from Part 0 alone.

Authority
- His paste of relay B-<n> is his word for the edits, compiles, runs and pushes that the relay lists, and for nothing more.
- EA, indicator and Include/SRJ edits stay uncommitted and unpushed unless the relay says to commit AND he has said so.
- Push only the files the relay names, to branch builder/B-<n>.

Start gate (every relay)
- Run git log -1 and report the git status --short line count.
- Take the SHA-256 of every file the relay names and compare it to the relay's expected prefix. On a mismatch, STOP and report.
- Line-ending gate (B-48 lesson, defect owned 2026-10-06): this workstation writes CRLF and git stores LF, so a disk SHA and a GitHub-blob SHA of the same content never match on text files (journal: 1059 CRLF bytes; ledger: 11 CRLF bytes on appended lines). Before declaring a gate mismatch, LF-normalize the disk bytes (strip every CR) and re-hash: if the normalized SHA equals the expected blob SHA, the content is identical - record it as accounted and go on. A mismatch that survives normalization, or any non-empty `git diff <commit> -- <file>`, is a real STOP. Result files must carry both SHAs (disk + normalized) so the next session never stops on this class again.
- Before any source edit, write a backup <file>.preB<n> and give its SHA-256.

Trial discipline
- One edit, one compile and one tester run, unless the relay says otherwise. No second attempt.
- Locate edit points by their text, never by line number alone. Paste the spot raw, with real line numbers, before editing.
- Filed-trade table: one row per deal, dates first, before vs after, with totals.
- Evaluate the STOP rules right after the filed-trade table. On a STOP, restore from .preB<n>, verify the SHA, and report anyway.
- If two runs in a row fail to improve the same filed trade, stop local iteration and report to the planner. The builder already runs on Opus, so this no longer means a model switch.
- Tester runs finish in-session (his standing order 2026-10-17, verbatim: "the workflow is no longer stopping on each test run because it has become faster, so drop that workflow step"; supersedes the 2026-10-05 launch-then-stop rule and the 2026-10-06 under-5-minutes rule): launch detached via the wrapper, verify the journal shows the right window within minutes, kill the launcher shell (it re-reads the whole day log every 10s; the terminal + tester agent survive it), then poll for DONE with short cycles only (single Test-Path checks with sleeps of 60 s or less per tool call - never one long Start-Sleep block). A verified DONE file IS the completion signal - grade, restore and file immediately on seeing it; never demand a second human signal after confirming DONE yourself (defect owned 2026-10-05). Watchers: `00_CURRENT_WORKING/watch_run.ps1` detached via WMI (reads only the last 64 KB of the day log every 25 s, writes the DONE file on the completion marker, then exits) and takes `-PreBytes <PRE_JOURNAL_BYTES>` (B-250 STALE-TAIL-MARKER fix: the marker must land beyond the day log's byte length at launch, 0 = old no-floor behavior) launched by `launch_b250.ps1`, which records PRE_JOURNAL_BYTES in the STATUS file; confirm the watcher by the PID the launch returned (never by a process query that matches your own command text).
- File every edit so it can be re-applied exactly: report the edited source SHA-256, keep the edited copy as <file>.B<n><tag> (never committed), and paste the full diff against .preB<n> raw in the result file. A RESTORED trial must never lose its hunk text (B-19 had to rebuild B-15's lost skip).
- Save the trial keep before any restore (B-201 lesson, defect owned 2026-10-13: the builder restored Experts from .preB201 before saving .B201K source, losing trial src 7c392767; trial ex5 survived as ex5.preB201 only): copy Experts source to <file>.B<n>K and verify its SHA equals the post-compile/pre-launch SHA before overwriting Experts with .preB<n>; never restore before the keep exists and verifies.
- Verify the edit application before compiling (B-170 lesson, defect owned 2026-10-11: a gate edit duplicated its own block, +1 brace, 29 cascading errors): after any EA edit, brace-balance the file against .preB<n> (equal or the hunk's own delta) and confirm the hunk appears exactly once (one [B-<n> TAG] marker set) before the compile call.
- Launch from a script file (B-28 lesson, defect owned 2026-10-05): start the tester wrapper from a launch script file mirroring the known-good pattern, never an inline WMI command string (inline backslash-quote escaping silently breaks the wrapper command: WMI returns PID with RC=0 but no STATUS appears and no terminal starts).
- Keep regression runs fast (his standing order 2026-10-05: runs must stay under 5 minutes): a run's wall time follows the history window the indicator actually replays. With the slot fix live (lookback 3000) the full RECON62 window (563338 ticks, 3168 bars) grades in ~4 minutes (j14 0:04:06, j15 0:04:00); with the input-group shift live (lookback 16388) the same window takes ~50-58 minutes (j12 0:51:57, j13 0:58:34). Keep the slot fix live for every regression run; a ~50-minute RECON62 run means the shift is back. Do not re-verify speed with extra runs - the window print and the elapsed time on the completion line are the proof.
- Auto-detect completion (superseded mechanic, kept as history: his 2026-10-06 order): with runs under 5 minutes he preferred automatic detection over end-the-turn waiting; the 2026-10-17 order extends that to every tester run (see the Tester-runs bullet above). The watcher + short cycles remain the completion gate; the PreBytes floor (B-250 STALE-TAIL-MARKER) now guards the marker.
- Set the tester window before every run (B-38 lesson, defect owned 2026-10-06): the tester dates live in config\terminal.ini [Tester] DateFrom/DateTo as epoch seconds; run inis carry Symbol and inputs only. Before EVERY launch, write that run's DateFrom/DateTo and read them back; never assume the prior run's dates. RECON62 EURUSD = 1787702400/1788998400; June USDJPY = 1779667200/1781308800 (5/25 start, graded 6/01-6/12; measured B-63 D3).
- Verify the watcher started (B-38 lesson, defect owned 2026-10-06): after launching watch_run.ps1, confirm its process exists by the PID the launch returned (never by a process query that matches your own command text) before the first DONE poll. If no PID exists, read the 64 KB day-log tail directly for the completion marker.
- Second indicator copy (B-41 lesson, defect owned 2026-10-06): an iCustom with arguments identical to a live handle returns the same shared instance, so releasing it kills the live copy. A diagnostic second copy must differ in at least one input, or must never be released before the run ends.
- Content copies before any terminal launch (B-42 lesson, defect owned 2026-10-06): the terminal re-saves chart files and config\terminal.ini on exit, so before any launch copy the CONTENT of every file in that scope to .preB<n> copies; fingerprints alone cannot restore. After the run, restore from the copies and verify the SHAs.
- Leftover terminal (B-43 lesson, defect owned 2026-10-06): run inis carry no ShutdownTerminal, so a finished tester run can leave terminal64 open and the next launch is refused as busy; before every launch confirm no terminal64 is running, and stop any leftover by its PID.
- YOLO mode (his standing order 2026-10-06): git commands run automated and every folder this lane touches is pre-allowed - opencode.json sets permission bash/edit/external_directory to allow, so the builder never stops for an approval prompt on commands, edits, or outside-workspace folders. If a prompt still appears, report its exact text instead of working around it.
- B-212-EX5-BESIDE-SOURCE (builder defect owned 2026-10-14, B-211): back up every .ex5 a compile overwrites beside its .preB source, SHA given, before the first compile.

Rule-conflict check (before any edit)
- If a relay's change touches a trading rule, first find his banked words on that rule in the strategy skill, the findings and the journal.
- If the change contradicts them, do not edit. Write a carried note quoting his words and stop for the planner.
- Example, B-8: a 1-point A2 allowance contradicted his 2026-09-23 no-tolerance rule.
No code STOP (his order 2026-10-16, B-245)
- A missing input, an unexported value, an unnamed variable, a zone list the EA cannot see, a missing per-object mark, or a code defect found in a K0 map is never a STOP and never a question to him. The builder designs the export (indicator buffer, EA read, or print) or the code fix itself in the same relay and runs it as an always-restored diagnostic graded by the grader.
- STOP stays only for: a start-gate mismatch that survives LF-normalize; a compile still failing after one corrected re-compile of the relay's own hunk; an ex5 SHA change during a run; a change that contradicts his banked words (quoted with line numbers).
- Questions reach him only when his record holds no ruling on a trading-rule point, after the record-first search. Code words never reach him.
- One builder session per relay chain: before cutting, git ls-remote backup the next branch; if it exists or untracked B-<n> records exist on disk, file those first and report, never overwrite.

Result file
- Path: SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B<n>.md.
- Write the steps in relay order: raw where raw is asked, trader words elsewhere. Explain every journal code in a few words.
- End with the final disk state: which source is on disk with its SHA, and whether the EX5 matches it.
- Put carried notes at the end, under "## Carried note".
- When he answers a carried question, the next relay banks his words verbatim in the strategy skill, his trade journal and the ledger before anything else, so he never has to explain them twice.
- Before banking, grep for the section/row/item first: if the exact words are already present verbatim, verify counts + SHAs, cite the landing commit, and do not re-append (B-27 re-issued B-26's landed banking; silent re-application risks duplicates and a false record).
- Questions for him: trader words, exact dates, times and prices, asked only after the record-first search, with the sources listed.
- Grep before banking (B-27 lesson, operator order 2026-10-05): before appending any strategy-skill section, journal row or ledger item, grep the target file for it. Count 1 and verbatim: append nothing, cite the commit that landed it, and report ALREADY_BANKED <commit>. Count 0: append. Count 2 or more: append nothing and write a carried note.
- Trader summaries and carried notes name zones and events by candle time, price and session only, never by machine zone numbers, tags or log references (his words 2026-10-11, B-175).

Row pack (kit PK-2, operator order 2026-10-09, relay B-131)
- On every KEPT verdict, commit SRJ_FlowNexus_Local/06_HANDOFFS/ROWPACK/ROWPACK_<run>.csv for each run the verdict rests on (RECON62 and June) plus DEALS_<run>.csv, and ROWPACK/INDEX_B<n>.md.
- ROWPACK columns: pack_line,run,ea_sha,journal_file,journal_line,server_date,server_time,tag,raw. raw is the journal row byte-for-byte, CSV-quoted. Rows: every row whose tag is in the relay's tag list (from B-162 the tag list includes B162ORIGIN, the most-recent in-play XOB per side), inside the session windows (server 09:00-12:00 and 14:00-19:00), plus every deal row.
- DEALS columns: deal,side,date,time,price,volume,register_row (A1-A7, B1-B3, C-<date>, or NONE).
- INDEX_B<n>.md: for each register row, the pack lines of its seed, its confirmation decision, its divergence latch and its entry (NONE where absent).
- A file over 900 KB is split by week (_W1, _W2, ...) so it stays readable on GitHub.
- Also write one file per trading day, ROWPACK/<run>/<YYYY-MM-DD>.csv (same columns), so the planner reads one day at a time (PK-2, relay B-132).
- Rows of an open trade are kept from entry to exit even outside the session windows (MTEXIT, exit, day-close and deal rows), so every exit is in the pack.
- Packs are text records, staged by explicit path. The pointer carries one Lane line: open item, first relay, relay count.
