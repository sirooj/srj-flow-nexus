---
name: srj-council
description: Prepare or grade SRJ council packets and relays, or intake council verdicts. Use only for SRJ council workflow.
---

# SRJ council workflow

Preserve the two-seat/ruling gates, source evidence, and relay checks. Never send a relay or message a council chat; you carry all external messages.

Current SRJ reviewer roster: Sonnet and GLM are required; Astra and Opus are optional only when the operator chooses to spend credits. The builder/Luna is not a voting seat. A later direct operator instruction or the live pointer may update the roster.

The cycle is: packet (`01_TASKS\PACKET_*.md`, versioned vNN) -> relay (`06_HANDOFFS\BUILDER_RELAY_COUNCIL_vNNN*.md`, carrying the packet as its exact inline twin) -> the operator's transport -> verbatim verdict intake (one source per entry, markers, every tally re-derived from filed bytes) -> a grade under the TIE-FIXED rule independently per question (YES+YES confirms; YES+DISCREPANCY conditional-confirms; DISCREPANCY+DISCREPANCY amends; OBJECT or NO halts). EDIT-SET CLOSURE is mandatory before any fold write: a replaced phrase whose fingerprint survives on any line other than its own edited line BLOCKS the fold. SELF-CONTAINMENT: whole code regions and machine-pulled rows inline, never prose about evidence.

Before any packet, relay, or grade block, read the complete current detailed source [`srj-council/SKILL.md`](../../../.opencode/skills/srj-council/SKILL.md) and follow its full-read/count rule. Use its numbered sections and the current pointer to load only relevant task artifacts; the full source remains authoritative for all accumulated gates.

Apply the active task's form, authorized scope, and stop conditions. A council objection halts the affected path until the required fold/review clears it. A council clearance does not replace any authorization assigned to you. File complete evidence and verify it from disk.

For generated relays, derive metadata from saved packet bytes and rebuild the P-lines from physical packet lines. Preserve and assert the blank section boundary and final newline. After writing, reopen the packet and relay and verify the measured digest, byte/line counts, full twin, labels, and carried regions/rows before marking the battery green; a correct in-memory string or successful script exit is not proof. If a gate catches your own assembly defect, classify it with 'srj-defect' and record the cause, correction, and disk proof before transport. Prefer enforcing an existing gate over adding another anecdotal rule.

Two relation gates, added 2026-10-03 after a pre-send review of relay v408: (a) COUNT-VS-ENUMERATION - any builder-prose header stating a count ('N additions/rows/items/sites') must equal the items it introduces, and their numbering must ascend; a header count disagreeing with its own list BLOCKS the transport. (b) CROSSWALK-COVERAGE - a crosswalk or table claiming to cover a round's conditions must carry one row per named condition, or state its coverage explicitly; a claim of 'one line each' over an incomplete row set BLOCKS the transport.

**OPERATOR-RULING FIDELITY and INFERRED-PREMISE (owner: srj-council; added 2026-10-03 after a two-round waste).** When the operator rules on scope, purpose or a target: (a) his words are filed verbatim and the fold cites them; (b) the applied scope RESTATES his quantifier exactly - "all six", "both", "every" - and a fold that narrows a ruling to a subset, to one instance, or to a category he did not name is a DEFECT, not a refinement; (c) no disposition, declaration or sweep may rest on a premise the operator did not state. A premise the builder INFERRED (for example, that a term must be a session value, or that a source must be a newly created buffer) is marked INFERRED-PREMISE on the page and may not be declared final, swept, or used to strike text until it is tested against his actual words; (d) if a sweep would strike text that the operator's ruling makes CORRECT, the sweep is BLOCKED. A scoping QUESTION framed as a binary his words do not support ("is it the session POC or the profile POC?") is itself a defect when his own words already decide it: ask from the recorded words, never from the page's assumption. Cost of the miss, recorded so it is not repeated: the UNSOURCED declaration and its five strikes consumed the v408 and v409 rounds.
