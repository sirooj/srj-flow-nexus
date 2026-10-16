# SRJ Flow Nexus — Codex project instructions

This is the concise, Codex-loaded project contract. OpenCode continues loading the preserved full contract at `SRJ_FlowNexus_Local/99_WORKFLOW/AGENTS_OPENCODE_ARCHIVE_2026-10-01.md`. Detailed, task-specific rules live in the Codex skills under `.agents/skills/` and their linked source documents. Keep this file concise; do not copy whole ledgers, run histories, or old handoff snapshots into it.

## Authority and safety

- You own strategy intent, priorities, and goals. Your later direct rulings govern strategy meaning; council rulings govern the matters delegated to council. A council clearance cannot override your rule.
- Make canonical strategy/code changes only under the active, issued task or packet and only within its allowed files. Do not infer approval from a draft, a passed review, a stale task file, or this transition work.
- SRJ is alert-only: no order execution or live trading. Do not compile, launch a tester, run a strategy, commit, or push unless the active instructions authorize that exact action and all required words/keys are present.
- Never contact council chats or other people for you. Prepare artifacts and exact paste instructions; you carry relays and bring back complete replies.
- Keep SRJ and HORC evidence, strategy memory, journals, and ledgers separate. Declare the lane before lane-specific work.
- Preserve the dirty working tree. Inspect current status and diffs before editing; never reset, clean, overwrite, or reformat unrelated work.
- Every hash, byte count, line count and marker line in a filed record is copied from unfiltered same-turn output, never typed or inferred; if a filtered command hid the value, re-run it unfiltered before writing. After writing, a digest-census re-measures every figure against disk. This fires automatically; no instruction is needed.
- When you own a defect in any phase - drafting, evidence, a packet or relay fold, a filing, a grade, a battery, a pointer, a ledger write, a tester launch, a run window, a run gate, a journal read - you tighten the skill that owns that phase in the same turn: name the defect class, extend or add that skill's gate, verify it by read-back and a machine count, and record it in the ledger. You never wait to be asked.

## Resume and task control

- For SRJ continuation, read `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_SESSION_POINTER.md` first. It is the live resume source; old queue/state documents can be stale. Then follow its exact resume order and verify the named artifacts against disk.
- If disk evidence contradicts the pointer (for example, a newer relay or result exists), stop before consequential work and report the measured mismatch. Do not silently choose which state is current.
- Keep one active task. Follow its form, scope, stop conditions, and evidence requirements. Do not start the next task until the stated acceptance gate is met.
- For HORC learning, follow `.agents/skills/horc/SKILL.md` and the vault's own current watchlist/state. Do not use SRJ rules to grade HORC.

## Working with the workflow

- Use `.agents/skills/srj-resume/SKILL.md` to resume; choose `srj-council`, `srj-strategy`, `srj-goal`, `srj-defect`, `srj-handoff`, `horc`, `horc-handoff`, or `mql5-reference` only when that workflow applies.
- The Codex skills are short entry points. For packet, relay, grade, strategy, defect, goal, or handoff work, read the linked OpenCode source sections required by the skill. Those detailed sources preserve the accumulated rulings and checks.
- Before editing MQL5 or making an MQL5 source claim, follow `mql5-reference` and the active task's source-evidence rules.
- Before any record search for an operator question, consult the strategy's governing specification and the relevant rule-memory sources. Ask only when the record does not answer it; batch any remaining questions.
- Keep operator-facing language plain, concise, second-person, and grounded in exact files/actions. Explain EA journal codes on first use. Name dates, sessions, pairs, times, and bar roles when discussing chart events.
- Do not run tests merely because code changed. Follow the active task's explicit verification requirements and report what was and was not verified.
- Tester runs: runs finish in-session on this harness (his order 2026-10-17, verbatim: "the workflow is no longer stopping on each test run because it has become faster, so drop that workflow step"). Do not launch-then-stop and do not end the turn for a tester run. Launch, verify the window on the journal tail, kill the launcher shell, start the tail watcher detached (`watch_run.ps1` with `-PreBytes PRE_JOURNAL_BYTES`; the byte floor is the STALE-TAIL-MARKER fix, B-250), then poll DONE in short cycles of 60 s or less per call - never one long blocking sleep, never full day-log re-reads. A verified DONE file IS the completion signal: kill the terminal PID from the STATUS file, prove the ex5 bytes did not change mid-run, cut, grade, restore and file immediately - never demand a second human signal (defect owned 2026-10-05, reaffirmed 2026-10-17; this supersedes the 2026-10-05 end-the-turn rule).

## Session budget and compaction (his order 2026-10-17)

- His words, verbatim: "i am using a new model now, it has the same capability with the previous model of muse spark 1.3 but the context window is smaller, just over 200k of context tokens. so i want you to safely auto compact the session around the 200k context tokens so that you will not stop before the planner task is done and when i hit the context limit. make this permanent by changing or revising the agents.md and relevant skills so the workflow is tuned with this new model."
- Mechanics: keep the session compaction-safe as it approaches the ~200k budget. Finish the current atomic step first (grade -> ex5 verify -> restore -> records filed and/or pushed, or the next clean pickup point), then open a compaction-safe handoff (`srj-handoff` skill, pointer current on disk) and let the harness compact. Never compact mid-run, mid-restore, or with an unverified grade. If a long run must cross a compaction, the STATUS file already carries PID/PRE_JOURNAL_LINES/PRE_JOURNAL_BYTES and the watcher is verified running, so a fresh session grades on DONE from the pointer alone.
- After any compaction, resume from `SRJ_FlowNexus_Local/06_HANDOFFS/BUILDER_SESSION_POINTER.md` and verify the named artifacts against disk before continuing.

## Command-error self-recovery (his order 2026-10-17)

- On any failed command or tool call ("because of a diff or something"): classify the failure from its own error text first (quoting/escaping; path or encoding; permission; or a content gate - diff, SHA, size cap, duplicate marker), then fix it in the same turn and re-run the same job once with the correction. Quote-fight failures move that same logic into a small script file (Python or PowerShell) instead of re-arguing inline strings; content-gate mismatches follow the LF-normalize rule (01a B-48) before any STOP; a fold-on-over-cap runs before any commit. Never reset, clean or overwrite unrelated work to silence an error; never retry blindly more than once per root cause; file the cause and the fix in the slice. If the same error survives the corrected retry, STOP with the exact error text.

## Current status source

The pointer is dynamic and may change between sessions. Never hard-code a task version here. Read it from disk at the start of each SRJ block.