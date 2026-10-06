# PROMPTQL_PLANNER_CONTEXT - SRJ Flow Nexus planner context for PromptQL bots
SUPERSEDED 2026-10-07 by PLANNER_CONTEXT.md (planner moved from PromptQL to SuperApp, relay B-52). Audit-only; never used to resume.

Mirror of the Flow Nexus PromptQL project wiki, written 2026-10-04 by relay B-10. The PromptQL wiki is primary. This copy lets a PromptQL bot in a new or empty project rebuild it. Only a planner relay refreshes this file; the builder never edits it on its own.

## If you are a PromptQL bot and your project wiki lacks the pages "SRJ Flow Nexus" and "B-series relay lane"
1. Propose learning blocks that recreate sections 2 and 3 below. The operator approves them with "Add to wiki".
2. Ask the operator to paste section 1 into Wiki -> Guide pages -> Domain Overview. Bots cannot edit guide pages.
3. Then continue as section 1 says.

## 1. Domain Overview (guide page text)
This project is where the operator plans his SRJ Flow Nexus MQL5 trading EA. In every session here, the bot is the planner in the B-series relay lane. Read the wiki page "SRJ Flow Nexus" first.

How a session starts. The operator pastes the builder's reply line: "B-<n> is done, GitHub branch builder/B-<n>, commit <hash>, verdict KEPT | RESTORED | MEASURED". On that branch of the public repo sirooj/srj-flow-nexus, read these files in this order:
1. SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_SESSION_POINTER.md
2. SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_RESULT_B<n>.md. If the reply says "read the carried note first", start with its "## Carried note" section.
3. .opencode/skills/srj-relay/SKILL.md, for the lane rules.
4. .opencode/skills/srj-strategy/SKILL.md, for his trading rules.
Then write relay B-<n+1> and hand it over as a text artifact.

Standing rules:
- His banked words decide, never the code. Check every change against the strategy skill before proposing it.
- There is never a tolerance or wiggle rule.
- REFINE-ONLY: every build first re-proves the EURUSD 26 Aug - 9 Sep regression window (RECON62).
- The operator does not code. Talk to him in trader words (dates, times, prices), and never ask him code questions.
- The builder's EA edits stay uncommitted, so locate code by its text, never by line number.
- Never ask the operator questions directly (his DEFECT word 2026-10-04). Every question goes into the relay as a record-first search by the builder; only a "no ruling found" result reaches him, in trader words.

## 2. Wiki page: SRJ Flow Nexus
Aliases: SRJ Flow Nexus EA.
Definition: SRJ Flow Nexus is the operator's MQL5 trading EA (Expert Advisor) project. It is built and refined through the B-series relay lane.
- The code lives in the public GitHub repository sirooj/srj-flow-nexus. The EA source is Experts/SRJ_FlowNexus_EA.mq5; include files are under Include/SRJ/.
- Project records live in SRJ_FlowNexus_Local/: handoffs in 06_HANDOFFS/, workflow docs in 99_WORKFLOW/. The live resume source is 06_HANDOFFS/BUILDER_SESSION_POINTER.md. Older queue and state files are audit-only and are never used to resume work.
- Builder EA edits usually stay uncommitted, so the EA committed on GitHub can lag the builder's disk copy. Locate code by text, never by line number.
- Operator's trading rules: "his rules, never the code's", banked in .opencode/skills/srj-strategy/SKILL.md. Before any change, check it against his banked words.
- REFINE-ONLY order (2026-09-25): every build first re-proves the EURUSD 26 Aug - 9 Sep regression window (RECON62). Nothing else is graded until that passes.
- Repository access: if GitHub is not connected in the PromptQL project, read the public repo through unauthenticated GitHub API and raw-content calls. They need a User-Agent header and return 403 without it.
- GitHub integration (PromptQL): when the project's GitHub integration is connected, read the repo with run_http(integration="__github") on https://api.github.com only; raw.githubusercontent.com is refused through the integration. Files over 1 MB (the ledger) come back from the contents API with empty content; read them through the git blobs API (/git/blobs/<sha>) instead. Through the integration the contents API can return JSON with a base64 `content` field even when a raw Accept header is sent; decode it.
- Trading rules copy: the full strategy skill is .opencode/skills/srj-strategy/SKILL.md. The .agents/skills/srj-strategy/SKILL.md copy is a short stub. Planners read and bank rules in the .opencode copy.
- CQD divergence: on his EURUSD M5 chart, the CQD Tick pane (PERIOD_D1 reset) shows divergence lines; a blue solid line is a type 1 bullish divergence. An invalid CQD divergence is one of his reasons to reject a setup.

## 3. Wiki page: B-series relay lane
Aliases: relay lane, B-series relay.
Definition: The B-series relay lane is the workflow used to build the SRJ Flow Nexus EA. A planner bot writes numbered relays (B-<n>), and a terminal builder carries them out.
- Roles. Planner: the PromptQL bot; it reads the repo on GitHub, writes relays B-<n>, and has no terminal. Operator: the user; he pastes each relay into a terminal builder session and pastes back its one-line reply; he does not code, so never ask him code questions. Builder: the coding agent in the operator's terminal.
- Lane rules are in .opencode/skills/srj-relay/SKILL.md: the start gate, backups named .preB<n>, one edit, one compile and one run per trial, STOP-and-restore when a trial fails.
- The builder writes its result for each relay to 06_HANDOFFS/BUILDER_RESULT_B<n>.md on branch builder/B-<n>.
- Reply format: "B-<n> is done, GitHub branch builder/B-<n>, commit <hash>, verdict KEPT|RESTORED|MEASURED". "Read the carried note first" means a note to the planner sits at the end of the result file.
- EA edits stay uncommitted unless both the relay and the operator say otherwise.
- Starting a new planner session: on branch builder/B-<n>, read the pointer, then the result file (carried note first when told), then the srj-relay skill, then the srj-strategy skill; then write relay B-<n+1> and hand it to the operator as a text artifact.
- Repo copy: this file (99_WORKFLOW/PROMPTQL_PLANNER_CONTEXT.md) is a backup of the PromptQL wiki; the wiki is primary. Only a planner relay refreshes it, and a relay adds a refresh step when these wiki pages change.
- Questions to the operator: when a builder record-first search ends "no ruling found", the builder writes the question in trader words in the result file's carried note. The planner passes it to him as a chart call (date, time, price). When his answer decides the next edit, the planner waits for it before writing the next relay.
- Fresh sessions: every relay opens with a Part 0 fresh-session start: the branch and commit to check out, the files to read in order, and every name the relay uses. A builder with no memory must be able to run the relay from Part 0 alone (operator order 2026-10-04).
- Banking his answers: when the operator answers a carried question, the next relay banks his words verbatim first, in the strategy skill (a new numbered section), his trade journal and the ledger, so he never has to explain them twice (operator order 2026-10-04).
- Screenshots: the builder cannot open PromptQL uploads. When the operator shares a chart screenshot, the planner writes a plain description of it into the relay.
- Missing branch: if the reply's branch builder/B-<n> or its commit is not on GitHub, the push did not go through. The planner does not guess or fall back to an older branch; it gives the operator a one-line paste-in for the builder (push to origin, confirm on GitHub, repeat the reply line). origin/builder/B-<n> in the builder's repo is not proof; the planner checks the GitHub API, and if still missing asks for git remote -v and git ls-remote output.
- Banking grep-first (B-28, after B-27 re-ordered banking B-26 had landed): before ordering a bank the planner checks the branch on GitHub, and a relay never re-orders banking that a prior relay landed. The builder greps first and, when the item is already present verbatim, cites the landing commit instead of re-appending.

## 4. Wiki rebuild record (planner relay B-50)
- 2026-10-06: the PromptQL project "17 SRJ Flow Nexus" wiki was rebuilt from sections 2 and 3 of this file. Pages now on the wiki: SRJ Flow Nexus, B-series relay lane, Carried Note, Builder Verdict, RECON62, RAW Chart, SRJ_TickAudit.
- Builder verdicts: KEPT = the trial's change was kept; RESTORED = the change was undone from .preB<n>; MEASURED = read-only measurement, nothing changed.
- RAW Chart: his USDJPY_RAW and EURUSD_RAW charts can miss candles or whole hours that his live charts have (for example USDJPY_RAW has no candles 07:59:58-09:00:00 on 5 June). Gaps are measured with the SRJ_TickAudit script (Files/SRJ_TickAudit_*_days.csv and _gaps.csv). EURUSD_RAW holds no ticks for 7-10 September and needs a re-import.
- Section 1 (Domain Overview) is pasted into the guide page by the operator; bots cannot edit guide pages.
