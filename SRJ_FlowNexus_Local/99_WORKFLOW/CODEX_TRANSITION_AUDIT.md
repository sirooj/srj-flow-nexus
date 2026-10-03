# Codex Transition Audit

Date: 2026-10-01
Purpose: map the existing OpenCode workflow to Codex and record the transition work completed.
Authority: workflow migration only. This file does not change strategy rules, task state, approvals, or the live pointer.

## Current workflow map

- `AGENTS.md` is the broad operator contract: portfolio boundaries, operator/council roles, approval gates, relay rules, tester discipline, and session continuation. It currently says OpenCode loads it through `opencode.json`.
- `.opencode/commands/` contains the handoff and defect procedures. The procedures are valuable workflow sources, but their `/command` entry points are OpenCode-specific.
- `.opencode/skills/` contains the SRJ council, SRJ strategy, SRJ goal, HORC learning, and handoff guidance. These files currently have no Codex-local skill mirror under `.agents/skills/`.
- `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_SESSION_POINTER.md` is the live continuation pointer. At transition completion it says V377 is graded, V28/V378 is relay-ready, and your council replies plus GO/HOLD are the next external input.
- `SRJ_FlowNexus_Local/99_WORKFLOW/TASK_QUEUE.md`, `CURRENT_COUNCIL_STATE.md`, and `CURRENT_OPERATOR_STATE.md` still describe LT-7. Their last-write times predate the pointer's V378 state, so they are historical/stale for live continuation unless refreshed by the workflow owner.
- `opencode.json` configures OpenCode only. Its instruction loading, compaction, formatter/LSP, and shell approval settings do not configure Codex.

## Codex fit and risks

1. **Instruction size:** `AGENTS.md` is 72,588 bytes. Current Codex documentation says project instruction loading stops when the combined instruction size reaches the default 32 KiB limit. Do not assume all of this file reaches the model. Split durable rules by scope or keep a short root router before relying on Codex to enforce the full contract.
2. **Skill discovery:** Codex scans repository `.agents/skills/` folders. It does not discover the current `.opencode/skills/` location as a Codex skill path. A Codex conversation can still read those files when explicitly pointed to them, but that is manual loading, not skill discovery.
3. **Command entry points:** the OpenCode `/srj-flow-nexus-handoff`, `/srj-defect`, and `/horc-handoff` commands do not become Codex commands merely by retaining their Markdown files. Their procedures need Codex skill entry points or explicit task prompts.
4. **Model-era scaffolding:** the workflow contains extensive repeated micro-checklists and strict turn rules written across many iterations. Preserve every operator ruling and hard safety gate, but make Codex entry guidance concise and load detailed evidence gates only for the relevant task. Do not delete or weaken rules based only on model capability.
5. **Conflicting status surfaces:** the V377 pointer and LT-7 state files disagree. Codex should treat the explicit live pointer as the current resume source, flag the stale queue/state documents, and never infer that LT-7 is the next task.
6. **Dirty tree:** `AGENTS.md`, several `.opencode` skills and commands, and many SRJ artifacts are already modified or untracked. Any migration must preserve this working state and avoid replacing or reformatting those files wholesale.

## Transition completed

1. Preserved the complete pre-transition root instructions at `SRJ_FlowNexus_Local/99_WORKFLOW/AGENTS_OPENCODE_ARCHIVE_2026-10-01.md`. Its SHA256 matches the original `AGENTS.md` snapshot.
2. Replaced root `AGENTS.md` with a concise 3,670-byte Codex contract covering authority, task/safety gates, dirty-tree protection, lane separation, resume sources, and skill routing.
3. Updated `opencode.json` to keep loading the full archived contract, leaving the detailed OpenCode workflow active.
4. Added nine Codex skill entry points under `.agents/skills/`: `srj-resume`, `srj-council`, `srj-strategy`, `srj-goal`, `srj-defect`, `srj-handoff`, `horc`, `horc-handoff`, and `mql5-reference`. They preserve detailed rules by pointing to the existing OpenCode sources and requiring full reads where those sources require them; the long source files were not duplicated or edited.
5. The supplied `quick_validate.py` could not run because its PyYAML dependency is absent from the bundled Python runtime. A static validation checked all nine folders for matching skill names, non-empty descriptions, correct frontmatter fences, existing Markdown links, and valid `$skill` references; it found zero errors. `opencode.json` parses and the archived file hash matches the pre-transition `AGENTS.md` hash.
6. The stale LT-7 state files were left untouched. The root instructions tell Codex to use the live pointer and report pointer-versus-disk mismatches rather than silently reconcile history.

## Familiarization notes for Codex

- On each SRJ block, begin with the live pointer and distinguish strategy content from process rules. The SRJ strategy memory and HORC learning vault never cross lanes.
- The current SRJ stop point is waiting for your V378 council replies and your GO/HOLD. No code edit, build, run, or key is authorized by this workflow migration.
- Treat source packets, council verdicts, and your recorded rulings as evidence with their stated authority. Do not invent strategy meaning or promote a draft into an approved task.
- Use exact file paths and the requested action in operator-facing instructions. Keep the relay external: Codex must not message council chats or other people without your explicit authorization.

## Measured files at audit time

| File | Bytes | Lines | Notes |
|---|---:|---:|---|
| Pre-transition `AGENTS.md` snapshot | 72,588 | 872 | Preserved byte-for-byte in the OpenCode archive |
| Current `AGENTS.md` | 3,670 | 41 | Concise Codex entry contract |
| `.opencode/skills/srj-council/SKILL.md` | 113,536 | 488 | Largest detailed workflow; not in Codex skill discovery path |
| `.opencode/skills/srj-strategy/SKILL.md` | 41,930 | 115 | SRJ strategy rules; keep strategy authority separate |
| `.opencode/skills/srj-goal/SKILL.md` | 18,468 | 78 | SRJ goal/deployment tracking |
| `.opencode/skills/horc/SKILL.md` | 10,573 | 129 | Separate HORC learning lane |
| `BUILDER_SESSION_POINTER.md` | 2,123 | 25 | Current live pointer; V378 relay-ready |
| `TASK_QUEUE.md` | 1,351 | 34 | LT-7 status predates the live pointer |
