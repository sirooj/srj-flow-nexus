# PLANNER_BOOTSTRAP - start here: any planner agent, any profile, any workspace
Planner kit PK-2 (relay B-131). The repo is the only canonical memory. Anything an agent keeps in its own workspace (skill, memory, notes) is a copy and loses to the repo on the newest builder/B-<n> branch.

## 0. Kickoff (the operator pastes this to any new planner session)
  Planner session, SRJ Flow Nexus. Repo sirooj/srj-flow-nexus.
  Read SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_BOOTSTRAP.md on the branch below and follow it.
  B-<n> is done, GitHub branch builder/B-<n>, commit <hash>, verdict KEPT|RESTORED|MEASURED|STOP

## 1. Read access
- Preferred: the agent's own GitHub connection, always passing ref builder/B-<n> (main is stale; code search covers main only).
- Fallback (the repo is public): https://raw.githubusercontent.com/sirooj/srj-flow-nexus/builder/B-<n>/<path>, with spaces as %20 and the em dash in the spec name as %E2%80%94.
- No read access at all: tell him in one line and stop. Never plan from memory.

## 2. Entry check: which case are you?
- A. New agent, new profile or new workspace (no local copy, or a local copy without a kit version line): run section 3, then the loop.
- B. Local copy present: compare its kit version line with this file's. Same: run the loop. Different: re-run section 3 (the repo wins), then the loop.
- C. The agent has no skills or memory feature: read the kit files from the repo every session and skip section 3.

## 3. Install (copy verbatim, never rewrite)
1. Create a local skill or instruction set named "SRJ Relay Planner" whose body is PLANNER_SKILL.md, verbatim, including its kit version line.
2. Add three sub-pages: "Relay Template" = PLANNER_RELAY_TEMPLATE.md; "Planner Lessons" = PLANNER_CONTEXT.md section 4; "Handoff State" = the pointer plus PLANNER_HANDOFF.md section 3 from the newest branch.
3. Save each line of PLANNER_MEMORY.md to the agent's memory or preferences, verbatim.
4. Tell him in one line what was installed. Never ask him to install, click or configure anything.
- Never write a local workspace ID, URL, profile name or user email into any repo file. The kit stays profile-neutral.

## 4. The loop
Follow PLANNER_SKILL.md, section "Every session". Relay shape: PLANNER_RELAY_TEMPLATE.md. Facts and lessons: PLANNER_CONTEXT.md sections 3 and 4.

## 5. Kit files (all in SRJ_FlowNexus_Local/99_WORKFLOW/)
- PLANNER_BOOTSTRAP.md (this page), PLANNER_SKILL.md, PLANNER_RELAY_TEMPLATE.md, PLANNER_MEMORY.md, PLANNER_CONTEXT.md, PLANNER_HANDOFF.md.
- Audit-only, never followed: PLANNER_INSTRUCTIONS.md and RESULT_SCHEMA.md (council-era task and report formats), PROMPTQL_PLANNER_CONTEXT.md.
- Only a relay changes kit files; the builder lands them. A planner never edits the repo.
