# OpenCode workflow coverage and gap audit - 2026-10-02

## Question and scope

This audit checks whether the current SRJ workflow lessons from the V391/RECON78 block are absent from OpenCode or already present in its active instructions and skills. It is a read-only workflow assessment; it does not change the OpenCode contract or authorize EA work.

## Which instructions OpenCode loads

The revised root `AGENTS.md` is the concise Codex-loaded contract and directs Codex to `.agents/skills/`. OpenCode does not load that file through `opencode.json`: its `instructions` entry points to `SRJ_FlowNexus_Local/99_WORKFLOW/AGENTS_OPENCODE_ARCHIVE_2026-10-01.md`. OpenCode task-specific instructions live in `.opencode/skills/`, and the OpenCode handoff command is `.opencode/commands/srj-flow-nexus-handoff.md`. Therefore, revising Codex `AGENTS.md` alone does not revise OpenCode behavior. Check the OpenCode archive and skills directly when deciding what that harness has.

## Already covered in OpenCode

| Workflow lesson | Current evidence | Status |
|---|---|---|
| Resume from pointer and verify live disk state | The archive's file map says POINTER WINS (around line 624); the handoff command requires the pointer to match disk before proceeding. Current pointer names the current V391 artifacts. | Covered, but execution must still follow it. |
| Check the latest run's own miss mechanism and reconcile historical causes | `.opencode/skills/srj-goal/SKILL.md` line 79 adds LATEST-RUN-MISS-JOIN (2026-10-02): inspect latest-run decision rows/source path, check filed findings/refutations, correct stale register attribution, record evaluated bar/pass/owed entry bar, and test settled pins. | Included since the recent skill update. |
| Diagnose rather than stopping at a passed tester status | The SRJ goal skill requires same-block read-only diagnosis for misses and separates process/test PASS from goal acceptance; its double-review sections require take-by-take and goal-ledger reconciliation. | Covered. |
| Preserve June 11 as a distinct miss and ask it in the council relay | V391 packet v2 and relay Q3 include June 11 NY 14:40 LONG; current pointer states the RECON78 blocker and says downstream admission/fill remains unproven. | Included in current artifacts. |
| Distinguish current and prior-run causes | The result, register, packet, relay, and memo now label the R63 freshness and R71 VWAP paths as historical, based on the later filed finding. | Included in current artifacts; do not revive the stale register note. |
| Do not treat Sonnet refusal as rejection | Current V391 memo and relay state NO-VERDICT per operator instruction; refusal is not a confirming verdict or run authority. | Included in current relay instructions. |
| Require a new-session prompt to be visible to the operator | `.opencode/commands/srj-flow-nexus-handoff.md` section 5 says the exact section-7 prompt must be pasted in chat and byte-matched to the saved handoff. | Covered in the OpenCode handoff protocol. |
| Keep handoff read-only and protect unrelated work | The Codex `srj-handoff` entry skill forbids strategy/code/build/run/commit/push during handoff. The OpenCode command likewise prohibits canonical edits/builds/runs/commits during transition; root contracts require preserving the dirty tree. | Covered in both paths. |

## Gaps and cautions

1. **Harness boundary:** the revised root `AGENTS.md` is not an OpenCode instruction source under the current `opencode.json`. Shared lessons must be copied into or linked from the OpenCode archive/skills. This is an instruction-routing fact, not evidence that OpenCode lacks all the lessons: the miss-join and prompt-init rules are already present in its own files.
2. **Pointer digest proof is not mechanical in the handoff command:** section 2 says to confirm the pointer matches disk, but does not expressly require enumerating every SHA-256 in the pointer and comparing it to the corresponding current file. During this block, a packet digest was mistyped while updating the pointer; a final hash-bound check caught and corrected it before handoff. Recommend adding an explicit automated pointer-hash binding check and read-back to the OpenCode handoff procedure. The existing human rule is present; the mechanical guard is the gap.
3. **Cross-harness prompt portability is not explicitly specified:** the OpenCode procedure already requires a copy-ready prompt in chat, and this handoff supplies one without relying on an OpenCode slash command. The procedure does not state that a prompt may need to initialize a different agent/harness with no inherited transcript. This handoff addresses the immediate transition; recommend making portability an explicit prompt requirement if cross-harness switches are routine.
4. **Do not infer verdict intake from relay readiness:** V391 is prepared, but the disk pointer still makes the operator the carrier. The next agent must establish that the complete relay was actually sent and that pasted replies bind to V391/packet v2 before grading them. The current protocol already requires transport provenance and complete replies; the prompt makes this boundary explicit.

## Conclusion

Most SRJ process lessons from this run are already encoded in OpenCode's archive and skills, especially latest-run miss joining, same-block diagnosis, and visible resume prompts. They were not all supplied by the revised Codex `AGENTS.md`; OpenCode's own archive and `.opencode/skills/` carry them. The concrete workflow hardening opportunity is a machine-checked pointer digest binding. Cross-harness portability is an additional explicitness improvement. This audit recommends those changes but does not modify OpenCode policy files.
