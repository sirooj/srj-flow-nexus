---
name: horc-handoff
description: HORC learning-phase new-session transition prep and handoff. Deploy by typing /horc-handoff when the operator wants a fresh HORC session (compaction point or watch-block boundary). HORC lane only.
---

# /horc-handoff - HORC learning-phase new-session transition prep and handoff

Deploy by typing `/horc-handoff` when the operator wants a fresh HORC session
(compaction point or watch-block boundary). HORC lane only - never on SRJ blocks
(use `/srj-flow-nexus-handoff` there). Learning phase carries no packets, no keys,
no council relays, no runs: the builder then STOPS note/caption work and runs this
protocol. His correction is the only gate - a council seat is never spent here.

Vault root (outside the repo, never staged): `C:\Users\winar\OneDrive\Documents\HORC\`

## 1. Freeze first (no writes before this)

- Finish or park the in-flight note or caption draft. A half-written note is either
  completed with its line count or left with its failure line quoted - never
  half-filed silently.
- Record the stop point: which watchlist row was in hand, which note file is
  mid-draft, what the disk actually holds (lines plus bytes, pasted verbatim).

## 2. Disk truth (read-only, mechanical counts only)

- COUNT METHOD (single, no alternatives): TOTAL lines = python splitlines len
  (matches Read line numbers, blank lines INCLUDED). Nonblank-only counts are
  FORBIDDEN - the B3 95-vs-108 and glossary 232-vs-251 drift of 2026-09-29 was
  exactly this method split (B3 bytes 6297 matched, content unchanged, method
  moved). Every cited file carries LINES-total + BYTES + SHA-16 prefix from one
  Temp-staged script (`HORC-` prefix, utf8 both sides, count-asserts beside
  output). A count with no deriving script output is unwritten.
- Watchlist (`00_WATCHLIST.md`): total rows = open + ticked via mechanical
  substring counts (`- [ ]` plus `- [x]`/`- [X]` second pattern for the zero-tick
  proof). Next unwatched row number plus its title - never a remembered row.
- Latest note (`01_NOTES\`): file name plus LINES-total + BYTES + SHA-16.
  Pictures owed vs saved (`02_PICTURES\`): each ask named (S1/S2/...) with
  saved-or-owed beside it.
- HORC ledger (vault `06_LEDGER_HORC.md`): tail = MAX numbered entry,
  helper-computed over the OWN lane file only, never memory. SRJ files untouched
  - `git status --short` must show zero HORC-lane writes inside the repo tree.
- Count drift or stale-tail trip is a BUILDER defect, never his. The operator
  plays no defect here.

## 3. Sweep the session (nothing valuable left behind)

- His owed items, each named with owner HIM: image saves, watch-question answers,
  corrections to notes or captions. Owed rides BESIDE advancing work, never ahead
  of it - disk-doable drafts are advanced before reporting, never parked behind
  his list.
- Open items: what was drafted but uncorrected, what phase gate is next
  (glossary, spec, manual replay), what is blocked and on whom.
- No SRJ content: no SRJ pin judged a HORC take this session, no HORC note enters
  an SRJ relay. A cross-lane cite is a defect, owned here before reporting.

## 4. File the handoff (collision-check first, adopt-not-overwrite)

- Target: vault `HORC_HANDOFF_<NN>.md` where NN is one past the latest
  `HORC_HANDOFF_*` on disk. List-check first - on collision STOP, never overwrite,
  never duplicate the number.
- Contents, in order: session stop point; disk truth (watchlist row, note file,
  pictures owed-vs-saved, ledger tail); his owed list; open items plus phase gate;
  the paste-ready resume prompt verbatim (next unwatched row plus the exact
  artifact expected plus the stop-and-report mismatch condition).
- POST-FILE RE-PROOF (the 2026-09-29 tail-32 lesson: disk truth captured tail 32
  pre-file, the handoff filing itself landed as #33, and the frozen resume prompt
  guaranteed a +1 drift next session): after the ledger HANDOFF line + handoff
  file write, RE-RUN the baseline script and PATCH the resume prompt inside the
  handoff file to the POST-FILE values (post-file ledger MAX, TOTAL-line numbers)
  by exact-anchor replace the same turn. Verify by read-back (hash-before plus
  hash-after). A resume prompt carrying a pre-file tail or a nonblank count is a
  DEFECTIVE handoff - blocked, never reported. The chat-pasted prompt is pasted
  FROM the post-patch file, never retyped.
- MIRROR RULE (duplicate `.opencode\commands\horc-handoff.md` vs this skill
  source): this skill file is the SOURCE (frontmatter form). The commands copy
  mirrors it the SAME turn (content identical modulo frontmatter/dashes). Both
  verified by read-back counts before reporting. Neither deleted nor merged
  without his word - reconciliation stays an owed item until he rules.
- Verify by read-back before reporting. The SRJ pointer is SRJ-lane owned and
  stays untouched - this protocol never writes it.

## 5. Report

- Report to him: plain words, short sentences, YOU/YOUR always. Every vault file
  named exactly with what to do (watch vs save vs correct). His owed list stated
  beside the advanced work, never as a gate.
- Prompt initializer in chat (same lesson as the SRJ handoff: a prompt living only
  in the handoff file never reaches him from a fresh session): the report ALWAYS
  pastes the resume prompt VERBATIM in chat under a copy-ready header
  (`NEW-SESSION PROMPT - copy everything below`). File-only prompt is a defective
  handoff, caught here before reporting.
- Byte-match: the chat-pasted prompt must equal the file's prompt exactly (same
  row, same files, same mismatch condition). Verify by read-back before sending;
  on any drift, re-paste from the file, never retype.

## 6. Notes (standing, do not re-litigate)

- Config-time files load once at opencode start - after first creation the operator
  restarts opencode one time for `/horc-handoff` to register.
- Phase order is fixed (learn, extract, glossary plus spec, manual replay,
  alert-only helper, backtest, demo-forward, then stop). Full auto-trading is OUT
  OF SCOPE until his explicit word. From Phase 7 code takes fresh `HORC_*` names
  only - zero SRJ touches, ever.
- Copyright guardrail: transcripts are private study notes; rules rewritten in our
  own words; nothing of his republished.
