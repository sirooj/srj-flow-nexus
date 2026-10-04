# PROMPTQL_PLANNER_CONTEXT - SRJ Flow Nexus planner context for PromptQL bots

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
- Trading rules copy: the full strategy skill is .opencode/skills/srj-strategy/SKILL.md. The .agents/skills/srj-strategy/SKILL.md copy is a short stub. Planners read and bank rules in the .opencode copy.

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
