---
name: srj-relay
description: Run an SRJ B-series relay from the planner (SuperApp AI) - start gate, trial discipline, result file, push, one-line reply. Load first whenever the inbound message is a relay "B-<n>".
---

# SRJ B-series relay lane (operator order 2026-10-04)

Roles
- Planner: the SuperApp AI in the operator's SuperApp project thread (replaced the PromptQL bot 2026-10-07, relay B-52). Reads this repo on GitHub, read-only, and writes relays B-<n>. Has no terminal. Its context file is SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_CONTEXT.md.
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
- Tester runs are launch-then-stop by default (his RAM order 2026-10-05): launch detached via the wrapper, verify the journal shows the right window within minutes, then kill the launcher shell itself (it re-reads the whole day log every 10s and burns ~1GB; the terminal + tester agent survive it) and end the turn. Grade straight from the tester day-log on completion (STATUS file keeps PRE_JOURNAL_LINES for the archive slice; no DONE file will exist). A verified DONE file IS the completion signal - grade, restore and file immediately on seeing it; never demand a second human signal after confirming DONE yourself (defect owned 2026-10-05). Start-Sleep auto-polling for completion only when he explicitly orders it (e.g. overnight sessions).
- File every edit so it can be re-applied exactly: report the edited source SHA-256, keep the edited copy as <file>.B<n><tag> (never committed), and paste the full diff against .preB<n> raw in the result file. A RESTORED trial must never lose its hunk text (B-19 had to rebuild B-15's lost skip).
- Launch from a script file (B-28 lesson, defect owned 2026-10-05): start the tester wrapper from a launch script file mirroring the known-good pattern, never an inline WMI command string (inline backslash-quote escaping silently breaks the wrapper command: WMI returns PID with RC=0 but no STATUS appears and no terminal starts).
- Keep regression runs fast (his standing order 2026-10-05: runs must stay under 5 minutes): a run's wall time follows the history window the indicator actually replays. With the slot fix live (lookback 3000) the full RECON62 window (563338 ticks, 3168 bars) grades in ~4 minutes (j14 0:04:06, j15 0:04:00); with the input-group shift live (lookback 16388) the same window takes ~50-58 minutes (j12 0:51:57, j13 0:58:34). Keep the slot fix live for every regression run; a ~50-minute RECON62 run means the shift is back. Do not re-verify speed with extra runs - the window print and the elapsed time on the completion line are the proof.
- Auto-detect completion on fast runs (his standing order 2026-10-06: with runs under 5 minutes he prefers automatic detection over end-the-turn waiting): after the launch-then-stop verification, start the tail watcher (`00_CURRENT_WORKING/watch_run.ps1`, detached via WMI: it reads only the last 64 KB of the day log every 25 s and writes the DONE file on the completion marker, then exits) and poll for DONE with short cycles only (single Test-Path checks with sleeps of 60 s or less per tool call, so every call returns visible progress - never one long Start-Sleep block, which looks stuck and gets aborted). The moment DONE verifies, grade, restore and file at once. The wrapper-shell kill still applies during the run. (B-34 lesson, defect owned 2026-10-06: a 180 s blocking sleep hid a finished run; the watcher + short cycles replace it.)
- Set the tester window before every run (B-38 lesson, defect owned 2026-10-06): the tester dates live in config\terminal.ini [Tester] DateFrom/DateTo as epoch seconds; run inis carry Symbol and inputs only. Before EVERY launch, write that run's DateFrom/DateTo and read them back; never assume the prior run's dates. RECON62 EURUSD = 1787702400/1788998400; June USDJPY = 1780272000/1781308800.
- Verify the watcher started (B-38 lesson, defect owned 2026-10-06): after launching watch_run.ps1, confirm its process exists by the PID the launch returned (never by a process query that matches your own command text) before the first DONE poll. If no PID exists, read the 64 KB day-log tail directly for the completion marker.
- Second indicator copy (B-41 lesson, defect owned 2026-10-06): an iCustom with arguments identical to a live handle returns the same shared instance, so releasing it kills the live copy. A diagnostic second copy must differ in at least one input, or must never be released before the run ends.
- Content copies before any terminal launch (B-42 lesson, defect owned 2026-10-06): the terminal re-saves chart files and config\terminal.ini on exit, so before any launch copy the CONTENT of every file in that scope to .preB<n> copies; fingerprints alone cannot restore. After the run, restore from the copies and verify the SHAs.
- Leftover terminal (B-43 lesson, defect owned 2026-10-06): run inis carry no ShutdownTerminal, so a finished tester run can leave terminal64 open and the next launch is refused as busy; before every launch confirm no terminal64 is running, and stop any leftover by its PID.
- YOLO mode (his standing order 2026-10-06): git commands run automated and every folder this lane touches is pre-allowed - opencode.json sets permission bash/edit/external_directory to allow, so the builder never stops for an approval prompt on commands, edits, or outside-workspace folders. If a prompt still appears, report its exact text instead of working around it.

Rule-conflict check (before any edit)
- If a relay's change touches a trading rule, first find his banked words on that rule in the strategy skill, the findings and the journal.
- If the change contradicts them, do not edit. Write a carried note quoting his words and stop for the planner.
- Example, B-8: a 1-point A2 allowance contradicted his 2026-09-23 no-tolerance rule.

Result file
- Path: SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B<n>.md.
- Write the steps in relay order: raw where raw is asked, trader words elsewhere. Explain every journal code in a few words.
- End with the final disk state: which source is on disk with its SHA, and whether the EX5 matches it.
- Put carried notes at the end, under "## Carried note".
- When he answers a carried question, the next relay banks his words verbatim in the strategy skill, his trade journal and the ledger before anything else, so he never has to explain them twice.
- Before banking, grep for the section/row/item first: if the exact words are already present verbatim, verify counts + SHAs, cite the landing commit, and do not re-append (B-27 re-issued B-26's landed banking; silent re-application risks duplicates and a false record).
- Questions for him: trader words, exact dates, times and prices, asked only after the record-first search, with the sources listed.
- Grep before banking (B-27 lesson, operator order 2026-10-05): before appending any strategy-skill section, journal row or ledger item, grep the target file for it. Count 1 and verbatim: append nothing, cite the commit that landed it, and report ALREADY_BANKED <commit>. Count 0: append. Count 2 or more: append nothing and write a carried note.

Reply line (exact shape)
- B-<n> is done, GitHub branch builder/B-<n>, commit <short hash>, verdict <KEPT | RESTORED | MEASURED>
- When a carried note exists, add: - read the carried note first
- Before sending the reply line, run git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-<n> and confirm it returns the commit hash. origin/<branch> in the local repo is not proof the push reached GitHub.
- The ls-remote output travels in the reply line only. The result file need not contain its bytes, and a pushed branch is never amended or force-pushed to add them (planner ruling B-29, answering the B-28 question).
