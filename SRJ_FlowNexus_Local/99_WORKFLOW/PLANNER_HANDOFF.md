# PLANNER_HANDOFF - cold start for a new planner session
Written 2026-10-08 by relay B-84 (planner ClickUp Brain). Stable page: how to start and where things are. Live state is 06_HANDOFFS/BUILDER_SESSION_POINTER.md on the newest builder/B-<n> branch; planner lessons are PLANNER_CONTEXT.md section 4; the ClickUp skill "SRJ Relay Planner" mirrors them with a Handoff State page.

## 1. Start
1. Operator pastes the kickoff (PLANNER_CONTEXT section 2) ending with the builder's latest reply line.
2. Planner loads the ClickUp skill SRJ Relay Planner.
3. Planner verifies builder/B-<n> head = the reported commit on GitHub; missing = one-line push/ls-remote paste for the builder, never an older branch.
4. On that ref read: pointer; BUILDER_RESULT_B<n>.md (carried note first); BUILDER_SLICE_B<n>.md (when huge, have the builder quote it); PLANNER_CONTEXT.md whole; both .opencode skills whole; spec v4.2 whole; register whole.
5. Draft relay B-<n+1> from the skill's Relay Template; hand it over as one text block.

## 2. Where things are (on builder/B-<n>)
- Spec: SRJ_FlowNexus_Local/00_CURRENT_WORKING/SRJ Flow Nexus — Part A Specification v4.2 (em dash in the name).
- His rules: .opencode/skills/srj-strategy/SKILL.md. Builder lane: .opencode/skills/srj-relay/SKILL.md.
- Register: 06_HANDOFFS/BUILDER_REGISTER_VALID_TRADES.md. His journal: 00_CURRENT_WORKING/OPERATOR_TRADE_JOURNAL.csv (grep only).
- Ledger 06_HANDOFFS/SRJ_FLOW_NEXUS_LEDGER.md (over 1 MB), AGENTS.md, .clinerules: grep only.
- His XOB answers: 06_HANDOFFS/BUILDER_FINDING_XOBSUIT-1.md section 6. Findings: 06_HANDOFFS/BUILDER_FINDING_*.md.
- EA: Experts/SRJ_FlowNexus_EA.mq5 on his disk, uncommitted; the GitHub copy lags. Locate code by text.

## 3. The arc B-69 to B-84
- B-69: hunk C (retest-candle touch) fired his 5 June 16:15 long but also 27 Aug 17:05 and 2 June 15:35, both ruled out. Restored.
- B-70 to B-75: 4 June London ruled not his; XOB, zone and CQD readings at the confirmation candle never separated.
- B-76 to B-81: target race keyed off his entry line; hunk RK restored (moved 4 Sep), side-matched hunk RKD KEPT (27 Aug refused at the target step).
- B-82: hunk C on the RKD build, diagnostic: 27 Aug out, 5 June 16:15 in, 2 June 15:35 still in. Restored.
- B-83: his "touch I do not count" words graded at the counted touch candle: machine and from-formation in-play readings separate; 2 June 14:20 has no XOB touch or retracement.
- B-84: kept trial of hunk C + the touch-candle XOB term; workflow moved to ClickUp.

## 4. Never
- Ask him code or mechanism questions, or any question his record answers.
- Use his 5m read to age a retest or kill a line.
- Add a tolerance, buffer or number to any rule.
- Fall back to an older branch when a reply's branch is missing.
