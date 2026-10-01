---
name: horc
description: HORC-lane learning workflow for the Hendray Opening Range Concept automation. Use on ANY HORC-lane block: caption drafts, shot/link intake, operator instructions, rulings, glossary/spec work. SRJ lane never opens this file.
---

# horc - Hendray Opening Range Concept lane skill

Role: this skill owns HOW the HORC lane works. Strategy CONTENT (his rules, glossary, spec) lives in the vault, never here. srj-strategy / srj-goal scoreboards are never opened on HORC blocks (AGENTS.md §10, §14 per-strategy rules).

## 1. Lane map (fixed paths)

- Vault: `C:\Users\winar\OneDrive\Documents\HORC\`
- `00_WATCHLIST.md` (58 rows, Tier-1-first oldest-first; ticks ONLY on ruled notes, never on drafts)
- `01_NOTES\` (one draft per video + `CAPTIONS_A\` + `CAPTIONS_B\` + `00-SHOT-LINKS.md`)
- `02_PICTURES\` (his screenshots; builder can never pull chat images - saves are his-hands-only)
- `03_GLOSSARY.md` + `04_SPEC_HORC_PartA.md` (land at Phase 3/4, ruled by him before code)
- `05_MANUAL_CHECKLIST.md` (Phase 5 hand-replay gate before any code)
- `06_LEDGER_HORC.md` (this lane's ledger; SRJ ledger never touched)
- Code (Phase 7+ only): `Indicators\HORC_OpeningRange.mq5` + `Experts\HORC_Alert_EA.mq5` (+ `Include\HORC\`), new files, zero SRJ touches

## 2. Caption-draft pipeline (builder-side, needs nothing from him)

1. Derby captions: SRT to `HH:MM:SS text` cue-lines in Temp (`A0x-`/`B0x-` prefix), count-asserted vs cue count, byte-proven on disk.
2. Read whole, extract: 5-line summary, new terms, timestamped rules (his words, caption-decoded), worked example (pair/date/session - almost always UNHEARD, owed), screenshots asked (pause points), listens asked (exact spans) or tracked promises.
3. Write `01_NOTES\A0x-name.md` with Status CAPTION-DRAFT. Verify: TOTAL lines (python splitlines len, blanks INCLUDED - nonblank counts forbidden per the B3 95-vs-108 lesson) + BYTES + video-link 1x, script-proven.
4. Ledger line in OWN ledger (LEDGER-SOLO pattern: tail-proof solo, Edit solo, verify solo).
5. Statuses: CAPTION-DRAFT (captions only) → PART-RULED (shots/listens landing) → RULED (his corrections banked). Glossary/speculatives never quote unruled drafts as his words; CAPTION-UNCERTAIN marks every garble-guess.

## 3. OPERATOR-INSTRUCTION FORMAT (his standing order - every instruction ships like this)

ONE numbered message, each step carrying exact video link + exact `?t=` timestamp + exact save name + exact reply shape. Reasoning verbs banned (no confirm/verify/assess) - only pause/shoot/save/read/reply-with-the-word. The vault `00-SHOT-LINKS.md` rides named with the single action: open it, work top-down, tick as you go. Later messages RESTATE the whole list state, never append item-four (ONE-ASK).

- CONTENT-VERIFY (his correction 2026-09-29, owned bare-timestamp defect): every
  shoot step ALSO names the exact screen content to confirm before shooting
  (board title words, distinctive labels) PLUS the on-mismatch move (nudge
  seconds forward/back until the named content shows, or report the minute holds
  no such board). A bare timestamp without content is unwritable - proven when
  t=810 showed the marked wave board instead of the buyer board (his frame at
  13:33), because the timestamp was copied unverified from the index. Board
  timestamps derive from caption-cue windows (Temp-pulled, asserted beside the
  ask), never from memory or index reuse.
- WANT-TO-KNOW (his order 2026-09-29, "what would help the most"): every shoot
  step ALSO carries one full sentence stating what the builder wants to learn
  from that frame (the open question it closes, the wording it confirms).
  Tags alone ("RP board") are unwritten - the sentence is the ask.

## 4. Listen format (speech captions garble - no screenshot can substitute)

Each listen: exact link + exact span + the garbled caption text + WHY (which glossary term it unlocks) + reply shape (words/numbers ONLY). Bounded spans only (10-45 seconds). Never open-ended ("listen to the video").
- PRE-SEND SELF-CHECK (his correction 2026-09-29, owned context-free repeat):
  no listen ships with "reply with the word" alone - each carries what he says
  around it (caption words quoted) + the garbled candidate + WHY. The five
  parts above are a checklist, all five or unsent.
- TIMESTAMP-READS (his standing offer 2026-09-30): bounded-stamp exact-word
  reads are always askable - go to the stamp, type what he says, reply with
  the words only. Garble-guesses never enter books unmarked
  (TRANSCRIPT-UNCERTAIN + ask number); the read closes the mark, never a
  reasoning round.

## 5. Ruling intake (his shots + words)

- File his shots RECEIVED with timestamp + save-name owed; transcribe visible board text verbatim where legible.
- File his words VERBATIM under their step number, then the builder's independent read of the same frame, then any discrepancy as ONE bounded re-look (open image N, read X letter by letter, reply with the letters) - never a reasoning question.
- Saves, pair/date reads, and label reads are his-hands/eyes-only and stated as such; everything else is builder-side and never waits.

## 6. Phase order (fixed, from the approved plan)

Learn (2024 oldest-first YT, then 2026) → extract (Tier-1-rules-only notes) → glossary + spec (his correction before code) → manual replay gate (10-20 days by hand) → alert-only helper (indicator draws, EA alerts, no orders) → backtest vs hand-marked bars → demo-forward, then stop. Full auto-trading OUT OF SCOPE until his explicit word. Tier-3 mentee material: examples only, UNVERIFIED until Tier-1 confirms. Copyright: transcripts = private notes; rules rewritten in our own words; nothing republished.

## 7. Commit scope (his order 2026-09-29 - lane autonomy)

- This lane commits ONLY its own paths, on the builder's call, no per-commit word needed: `HORC_*` code (`Indicators\HORC_*`, `Experts\HORC_*`, `Include\HORC\`) plus `horc` lane files (`.opencode\skills\horc\`, `.opencode\skills\horc-handoff\`, `.opencode\commands\horc-handoff.md`). Never stage SRJ paths, never bare `add -A` across lanes, never touch the SRJ ledger. Vault files are never staged (outside the repo). Shared-file edits (`AGENTS.md`, quirks) ride announced in the OWN HORC ledger the same turn. Push stays gated on his word plus credentials: verify via ls-remote, never force.

## 8. Standing lessons (his corrections, never re-asked)

- NO-REDUNDANT-ASK (his challenge sustained 2026-09-29, over-ask owned): NEVER
  ask him to re-shoot, re-send, sort, or rename a frame whose transcription is
  already banked in a note. Words-banked retires pixels - check the notes FIRST
  (record-first) before any operator ask; the 15-shot plan died the turn it
  shipped because 14 boards were already banked. File-save/PNG asks are retired
  the same way: exact player timestamps re-pull any frame in seconds, so PNGs
  buy no evidence once words + timestamps are banked. New-frame asks must name
  the genuine gap each frame closes (never received / cut frame), one line per
  frame, or they are unwritten.
- CONTEXT-WITH-EVERY-ASK (his correction 2026-09-29, owned code-talk defect):
  NEVER cite an ask by code alone (R1, Q3, step 4 - all meaningless to him).
  Every ask carries video title + exact link + timestamp + the screen content
  in plain words (board title, both sides of a conflict quoted short) + the
  exact question + reply shape. Same root as the SRJ bare-row-number lesson:
  he cannot see the builder's tree, so a code without context is unwritable.
  An ask missing any of the six is unwritten.
- BRAIN-NEVER-ASKED (his ruling 2026-09-29, owned understanding-ask defect):
  he is asked ONLY for eyes (frames), ears (spans), hands (his chart, saves).
  NEVER for his brain: no deciphering, merging, reconciling, or picking between
  meanings. He holds NO more information than the builder - same videos both
  sides. Every "which meaning" question is builder-side work, resolved on
  record or tracked open, never sent to him. A brain-ask is a BUILDER DEFECT.
- LATER-GOVERNS (his rule of thumb, standing): the newer video weighs more.
  First video = basic, second = indepth with more nuance. Later lecture governs
  earlier on the same point; base meaning stands where the newer only extends.
- WORDING-DELEGATED (his order 2026-09-29): wording-only problems are decided
  by the builder (most fitting), never asked. Covers adjectives, spellings,
  shorthand readings - decided once, used everywhere, noted as decided.
- COUNT-SINGLE-LINE (owned wrap defect, thrice-fired 2026-09-29): every count
  sentence (OPEN count, line counts) ships on ONE line - machine asserts read
  single lines. A wrapped count is unwritten until joined.
- CAPABILITY-FIRST (his word 2026-09-29, owned hand-gate defect): he stated
  from the project start he does not grasp HORC (not his strategy, unlike
  SRJ) - yet the 15-day hand-replay gate shipped anyway and he declined as
  not capable. A hand-gate he said he cannot do is never shipped; his "I
  can't" parks the gate the same turn, his redirected direction is adopted,
  never re-asked, never reasoned with.
- NO-DOCTRINE-ASKS (his words 2026-09-30, owned brain-ask defect): he said
  plainly he does not understand a doctrine-reconciliation question - yet it
  was sent despite his stated incapacity. Doctrine questions are NEVER sent
  to him; re-read both sources first, because most dissolve on read (F16 IS
  a practice format and A03 ALLOWS practice - no conflict ever existed).
  An ask he cannot answer is a BUILDER DEFECT, caught here, never re-sent.
- PLAIN-WITH-YOU (his correction 2026-09-30, owned code-talk defect): chat
  with him uses plain names only - video title + link, word-list book,
  rules book. Builder codes (F23, v2/v3, SHA, LINES, MAX, entry numbers)
  never ship bare; each gets its plain name on first use every message.
  Disk-proof numbers live in the ledger, never in chat; chat carries one
  plain checked sentence. Second-person always (YOU/YOUR).
