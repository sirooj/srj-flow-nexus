---
name: srj-relay
description: Run an SRJ B-series relay from the planner (PromptQL bot) - start gate, trial discipline, result file, push, one-line reply. Load first whenever the inbound message is a relay "B-<n>".
---

# SRJ B-series relay lane (operator order 2026-10-04)

Roles
- Planner: the PromptQL bot. Reads this repo on GitHub and writes relays B-<n>. Has no terminal.
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
- Before any source edit, write a backup <file>.preB<n> and give its SHA-256.

Trial discipline
- One edit, one compile and one tester run, unless the relay says otherwise. No second attempt.
- Locate edit points by their text, never by line number alone. Paste the spot raw, with real line numbers, before editing.
- Filed-trade table: one row per deal, dates first, before vs after, with totals.
- Evaluate the STOP rules right after the filed-trade table. On a STOP, restore from .preB<n>, verify the SHA, and report anyway.
- If two runs in a row fail to improve the same filed trade, stop local iteration and report to the planner. The builder already runs on Opus, so this no longer means a model switch.

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
- Questions for him: trader words, exact dates, times and prices, asked only after the record-first search, with the sources listed.

Reply line (exact shape)
- B-<n> is done, GitHub branch builder/B-<n>, commit <short hash>, verdict <KEPT | RESTORED | MEASURED>
- When a carried note exists, add: - read the carried note first
- Before sending the reply line, run git ls-remote https://github.com/sirooj/srj-flow-nexus.git builder/B-<n> and confirm it returns the commit hash. origin/<branch> in the local repo is not proof the push reached GitHub.
