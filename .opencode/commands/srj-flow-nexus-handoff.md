# /srj-flow-nexus-handoff — SRJ Flow Nexus new-session transition prep and handoff

Deploy by typing `/srj-flow-nexus-handoff` when the operator wants a fresh SRJ session (improper open, compaction point, or version boundary). SRJ lane only — never on HORC blocks (use `/horc-handoff` there). The builder then STOPS all packet/relay/build work and runs this protocol. No canonical edits, no builds, no runs, no commits anywhere inside it.

## 1. Freeze first (no writes before this)

- Finish or park the in-flight write. An unclosed applier run is either completed with its counts or left with its failure line quoted — never half-applied silently.
- Record the stop point: which artifact is mid-flight, which pair/step failed, what the disk actually holds (hash plus lines plus bytes, pasted verbatim).

## 2. Disk truth (read-only, paste verbatim)

- Re-hash: EA (`Experts\SRJ_FlowNexus_EA.mq5`), current packet per pointer plus `AGENTS.md` §9 (never a remembered packet name — the frozen example it replaced was already superseded twice), latest relay (`SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_vNNN*.md`).
- Read-only git: `git log --oneline -5` plus `git status --short`. No add, no commit, no push — ever, inside this protocol.
- Confirm pointer (`BUILDER_SESSION_POINTER.md`) matches disk MECHANICALLY: enumerate every 64-hex token in the pointer by regex and compare each against the live-measured hash of its named file (hash plus lines plus bytes pasted beside the check); a token with no disk match, or a file whose hash has no pointer token, is a mismatch. If it lies, say so before anything else. (2026-10-02 gap audit: the human rule alone let a one-char packet typo into the pointer; the mechanical guard is the gate.)

## 3. Sweep the session (nothing valuable left behind)

- Verdicts: every council/Astra/Sonnet text pasted this session, with its filed marker plus file plus line numbers. Unfiled verdicts are filed verbatim first (one source per entry), never referenced from chat memory.
- Defects: every failed anchor, count mismatch, script-hygiene hit, and tool-misreport, each with cause plus fix plus the command that proved it. Char-code dumps beat theories — an anchor that fails while its head matches hides non-ASCII (em-dash U+2014 renders as hyphen in tool output; anchor with `[char]8212`, never retype the dash).
- Open items: what was asked but not answered, what was drafted but not transported, what is blocked and on whom.
- Standing-rule candidates: a defect class seen twice goes to `AGENTS.md` the same turn; one-offs stay in the handoff, never in chat alone.

## 3.5 READINESS GATE - a handoff is never filed over an unready artifact (his order 2026-10-03: "make sure your partial work of non ready handoff never happen again cause it's costing me time and coucil credits")

A handoff is the operator's only initialization path, so an unready artifact shipped through one costs a whole round and two council credits. Before step 4 files anything, the handoff must PROVE readiness, not assert it. Three checks, each measured, none recalled:

1. **STRUCTURAL BATTERY GREEN on the exact files the handoff names**, with the numbers pasted: twin line-by-line mismatch count zero, P-sequence complete with each label once, zero build tokens, zero ellipsis in prose, fence balance, one section header with no stale predecessors, every digest in prose and memo equal to a live file.
2. **CONTENT CENSUS GREEN on the saved file, independently of the battery**: for every load-bearing artifact the predecessor page carried - tables, censuses, gate lists, state maps - its header row, first row, middle row and last row are present in the file actually being handed over. Structural green plus content red is a BLOCKED artifact and a BLOCKED handoff; this is the check that catches a fold whose prose CLAIMS a carry the packet does not contain.
3. **POINTER HONESTY**: every 64-hex token in the pointer resolved by searching the tree for the file whose CURRENT hash equals it - never by the builder's own memory of which file it meant. A stale token is corrected in step 5 before the handoff is filed, and the correction is named in the defect log.
4. **SELF-TABLE FIGURE CENSUS** (2026-10-03, D18 instance: the POST-V406 handoff shipped a byte figure of 1650 for `.agents/skills/srj-handoff/SKILL.md` while the digest in the same row equalled the live file, whose real size is 1164 B - the digest was measured, the byte count was composed, and no gate looked at the handoff's own table): every byte count, line count and marker line inside the handoff's own tables is re-measured in the same turn the table is written, by the same script that resolves its digests, and a figure that disagrees with disk is corrected before filing with the withdrawn value and the measured value both named. A digest-census that checks hashes but not bytes is half a census and does not pass this check.

If any of the four is red, the handoff is not filed. Park the round instead, say plainly which check is red and what it would take to turn it green, and name the next artifact. A parked round costs him nothing; an unready handoff costs him a round and credits.
## 4. File the handoff (collision-check first, adopt-not-overwrite)

- Target: `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_HANDOFF_NEWSESSION_POST-V<NNN>.md` where NNN is one past the latest relay version on disk. Test-Path first — on collision STOP, never overwrite, never duplicate the version.
- Contents, in order: session stop point; disk truth (hashes plus lines plus bytes); verdict inventory (markers plus files); defect-plus-fix log with proving commands; open items plus who owns each; the paste-ready resume prompt verbatim (names the exact artifact expected next plus the stop-and-report mismatch condition).
- Verify by read-back before reporting.

## 5. Refresh the pointer and report

- Pointer: State plus Next (single action), under 35 lines, read-back verified. Next names the ONE awaited trigger (his verdict paste, his word, or a council relay) — never bare "nothing owed".
- Report to him: plain words, short sentences. Every file named exactly (`06_HANDOFFS\NAME.md` form) with read-vs-paste action. What to paste where (same relay text to both seats, whole, verbatim). What builds next and on whose key. Gloss every EA code. Never bare row numbers.
- Prompt initializer in chat (operator order 2026-09-19 — first-use lesson: the resume prompt lived only in the handoff file, which he cannot open from a fresh session, so no new session could be initialized): the report ALWAYS pastes the section-7 resume prompt VERBATIM in chat under a copy-ready header (`NEW-SESSION PROMPT — copy everything below`). A prompt that lives only in the handoff file never reaches him — file-only prompt is a defective handoff, caught here before reporting.
- Byte-match: the chat-pasted prompt must equal the file's section-7 prompt exactly (same trigger, same hashes, same mismatch conditions). Verify by read-back before sending; on any drift, re-paste from the file, never retype.
- Portability: the section-7 prompt initializes a DIFFERENT agent/harness with no inherited transcript (files plus hashes plus mismatch-stop named outright, never "as before" or home-harness slash-command assumptions). A prompt that only works in its home harness is a defective handoff.

## 6. Notes (standing, do not re-litigate)

- Config-time files (this file included) load once at opencode start — after the 2026-09-29 rename the operator restarts opencode one time for `/srj-flow-nexus-handoff` (plus `/horc-handoff`) to register. History citing `/srj-handoff` means this command.
- Transports ride with him only: council pastes, verdict pastes, run words where tokens require. Everything else runs unattended.
- Dual-key stays: both verdicts must clear before anything builds — either seat can halt.
