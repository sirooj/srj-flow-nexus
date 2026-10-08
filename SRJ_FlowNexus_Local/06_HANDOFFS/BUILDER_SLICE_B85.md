# BUILDER SLICE B-85 - W5-W7 before/after raw, W8 greps, 0.5 records (planner kit PK-1, text only)

## W5 BEFORE/AFTER (PLANNER_CONTEXT.md; each anchor grepped exactly 1 before replacing)

(a) BEFORE: `- Planner: ClickUp Brain (the AI in his ClickUp workspace) since relay B-81, with the ClickUp skill "SRJ Relay Planner" as its wiki (Relay Template, Planner Lessons, Handoff State). The SuperApp AI and the PromptQL bot are history only (section 5). Read-only GitHub access through ClickUp's GitHub connection. No terminal, cannot push.`
AFTER: `- Planner: any planner agent the operator opens (ClickUp Brain since relay B-81; earlier SuperApp AI and PromptQL bot, section 5). It starts from 99_WORKFLOW/PLANNER_BOOTSTRAP.md and may keep a local copy of the kit as a cache; the repo wins. Read-only GitHub access. No terminal, cannot push.`
(b) BEFORE: `  Load the SRJ Relay Planner skill, then read SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_CONTEXT.md and PLANNER_HANDOFF.md on the branch below and follow them.`
AFTER: `  Read SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_BOOTSTRAP.md on the branch below and follow it.`
(c) BEFORE: `  B-<n> is done, GitHub branch builder/B-<n>, commit <hash>, verdict KEPT|RESTORED|MEASURED`
AFTER: `  B-<n> is done, GitHub branch builder/B-<n>, commit <hash>, verdict KEPT|RESTORED|MEASURED|STOP`
(d) BEFORE: `4. Write relay B-<n+1> with a full Part 0 and hand it to him as one text block, then refresh the Handoff State page of the ClickUp skill SRJ Relay Planner (planner-side; the builder never touches it).`
AFTER: `4. Write relay B-<n+1> with a full Part 0 and hand it to him as one text block. Repo-side state lands through the relay's Part X and Part F; any local Handoff State page is a cache the planner refreshes itself.`
(e) BEFORE: `- Verdicts: KEPT = change kept; RESTORED = change undone from .preB<n>; MEASURED = read-only (text-record edits allowed).`
AFTER: `- Verdicts: KEPT = change kept; RESTORED = change undone from .preB<n>; MEASURED = read-only (text-record edits allowed); STOP = a STOP rule hit before the trial ran or finished, no source edit stands, text records allowed, reason in the result's first line (first used B-84, banked B-85).`

## W6 BEFORE/AFTER (PLANNER_HANDOFF.md)

(a) BEFORE: `Written 2026-10-08 by relay B-84 (planner ClickUp Brain). Stable page: how to start and where things are. Live state is 06_HANDOFFS/BUILDER_SESSION_POINTER.md on the newest builder/B-<n> branch; planner lessons are PLANNER_CONTEXT.md section 4; the ClickUp skill "SRJ Relay Planner" mirrors them with a Handoff State page.`
AFTER: `Written 2026-10-08 by relay B-84, refined by relay B-85 (kit PK-1). Stable page: where things are and the arc. Entry for any new planner agent, profile or workspace is PLANNER_BOOTSTRAP.md. Live state is 06_HANDOFFS/BUILDER_SESSION_POINTER.md on the newest builder/B-<n> branch; lessons are PLANNER_CONTEXT.md section 4.`
(b) Section 1 replaced whole (5 steps -> 4 steps; old text in slice history, new text on disk per relay).
(c) Appended: `- B-85: workflow refine: profile-neutral planner kit PK-1 in the repo; STOP banked as a verdict. Project work resumes B-86 with the XOB-term redesign.`
(d) Appended: `- Write a local workspace ID, URL, profile name or email into any repo file.`

## W7 BEFORE/AFTER (.opencode/skills/srj-relay/SKILL.md)

(a) BEFORE frontmatter: `description: Run an SRJ B-series relay from the planner (ClickUp Brain) - ...`
AFTER: `description: Run an SRJ B-series relay from the planner agent - ...`
(b) BEFORE Roles Planner line (ClickUp Brain ... cold-start page ... ClickUp-side wiki ...).
AFTER: `- Planner: the planner agent the operator opens (ClickUp Brain since relay B-81; any profile or workspace). Reads this repo on GitHub, read-only, and writes relays B-<n>. Has no terminal and cannot push. Entry page SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_BOOTSTRAP.md; context SRJ_FlowNexus_Local/99_WORKFLOW/PLANNER_CONTEXT.md.`
(c) BEFORE reply line: `- B-<n> is done, GitHub branch builder/B-<n>, commit <short hash>, verdict <KEPT | RESTORED | MEASURED>`
AFTER: same + `| STOP>` plus added line `- STOP = a STOP rule hit before the trial ran or finished; no source edit stands; the reason is the result's first line (B-84 first use, planner ruling B-85).`

## W8 GREPS AFTER (raw; nothing further changed)

- PLANNER_BOOTSTRAP.md SuperApp|PromptQL|ClickUp: 1 hit (line 31 `- Audit-only, never followed: PLANNER_INSTRUCTIONS.md and RESULT_SCHEMA.md (council-era task and report formats), PROMPTQL_PLANNER_CONTEXT.md.` - filename reference, legitimate).
- PLANNER_SKILL.md: 0. PLANNER_RELAY_TEMPLATE.md: 0. PLANNER_MEMORY.md: 0. (Kit bodies are profile-neutral by design.)
- PLANNER_CONTEXT.md sections 1-2: line 2 (`PROMPTQL_PLANNER_CONTEXT.md` filename, legitimate) + line 5 (new Planner line, intended).
- srj-relay SKILL.md: line 9 (new Planner line, intended).

## 0.5 RECORDS

- git log -1 = c1ef12b (verified at cut). Dirty count at cut: 350 (count only).
- git diff c1ef12b on pointer/RESULT_B84/PLANNER_HANDOFF/srj-relay SKILL/ledger: EMPTY (verified).
- PLANNER_CONTEXT exception: B-84 X1 ("Workflow home") NOT FOUND + X2 ("relay B-84" §5) NOT FOUND on disk; c1ef12b blob (81 lines) carries neither. Case (b): reported, going on without re-appending.
- Ledger: ^1228.=1, ^1229.=1 (B-84's landed item; relay 0.5 "`^1229.` = 0" is a typo - its own X3 orders item 1230 - ACCOUNTED), ^1230.=0, B85-=0.
- AGENTS.md note: worktree holds a 35-line Codex contract (34 LFs) vs the 72KB committed copy; replaced after B-84 by another session; not in the 0.5 gate list; left untouched. W3 grep on current file: SuperApp|PromptQL|ClickUp|planner = 0 lines (no change).
- Prefix SHAs: EA 137076D9CF85 / ex5 FA4C924978F6 / terminal.ini 88a0deb1 (verified, untouched; no terminal64 launch this turn).

(End of slice)
