# /srj-handoff — new-session transition prep and handoff

Deploy by typing `/srj-handoff` when the operator wants a fresh session (improper open, compaction point, or version boundary). The builder then STOPS all packet/relay/build work and runs this protocol. No canonical edits, no builds, no runs, no commits anywhere inside it.

## 1. Freeze first (no writes before this)

- Finish or park the in-flight write. An unclosed applier run is either completed with its counts or left with its failure line quoted — never half-applied silently.
- Record the stop point: which artifact is mid-flight, which pair/step failed, what the disk actually holds (hash plus lines plus bytes, pasted verbatim).

## 2. Disk truth (read-only, paste verbatim)

- Re-hash: EA (`Experts\SRJ_FlowNexus_EA.mq5`), current packet (`SRJ_FlowNexus_Local\01_TASKS\PACKET_EXT1LIVE-001.md`), latest relay (`SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_vNNN*.md`).
- Read-only git: `git log --oneline -5` plus `git status --short`. No add, no commit, no push — ever, inside this protocol.
- Confirm pointer (`BUILDER_SESSION_POINTER.md`) matches disk; if it lies, say so before anything else.

## 3. Sweep the session (nothing valuable left behind)

- Verdicts: every council/Astra/Sonnet text pasted this session, with its filed marker plus file plus line numbers. Unfiled verdicts are filed verbatim first (one source per entry), never referenced from chat memory.
- Defects: every failed anchor, count mismatch, script-hygiene hit, and tool-misreport, each with cause plus fix plus the command that proved it. Char-code dumps beat theories — an anchor that fails while its head matches hides non-ASCII (em-dash U+2014 renders as hyphen in tool output; anchor with `[char]8212`, never retype the dash).
- Open items: what was asked but not answered, what was drafted but not transported, what is blocked and on whom.
- Standing-rule candidates: a defect class seen twice goes to `AGENTS.md` the same turn; one-offs stay in the handoff, never in chat alone.

## 4. File the handoff (collision-check first, adopt-not-overwrite)

- Target: `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_HANDOFF_NEWSESSION_POST-V<NNN>.md` where NNN is one past the latest relay version on disk. Test-Path first — on collision STOP, never overwrite, never duplicate the version.
- Contents, in order: session stop point; disk truth (hashes plus lines plus bytes); verdict inventory (markers plus files); defect-plus-fix log with proving commands; open items plus who owns each; the paste-ready resume prompt verbatim (names the exact artifact expected next plus the stop-and-report mismatch condition).
- Verify by read-back before reporting.

## 5. Refresh the pointer and report

- Pointer: State plus Next (single action), under 35 lines, read-back verified. Next names the ONE awaited trigger (his verdict paste, his word, or a council relay) — never bare "nothing owed".
- Report to him: plain words, short sentences. Every file named exactly (`06_HANDOFFS\NAME.md` form) with read-vs-paste action. What to paste where (same relay text to both seats, whole, verbatim). What builds next and on whose key. Gloss every EA code. Never bare row numbers.
- Prompt initializer in chat (operator order 2026-09-19 — first-use lesson: the resume prompt lived only in the handoff file, which he cannot open from a fresh session, so no new session could be initialized): the report ALWAYS pastes the section-7 resume prompt VERBATIM in chat under a copy-ready header (`NEW-SESSION PROMPT — copy everything below`). A prompt that lives only in the handoff file never reaches him — file-only prompt is a defective handoff, caught here before reporting.
- Byte-match: the chat-pasted prompt must equal the file's section-7 prompt exactly (same trigger, same hashes, same mismatch conditions). Verify by read-back before sending; on any drift, re-paste from the file, never retype.

## 6. Notes (standing, do not re-litigate)

- Config-time files (this file included) load once at opencode start — after first creation the operator restarts opencode one time for `/srj-handoff` to register.
- Transports ride with him only: council pastes, verdict pastes, run words where tokens require. Everything else runs unattended.
- Dual-key stays: both verdicts must clear before anything builds — either seat can halt.
