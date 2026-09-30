---
name: edge
description: Edge-finding pipeline over already-built reference scripts in the Library inbox. Intake each script, extract its rules, synthesize shared DNA plus the flaw classes capping profit factor, draft the separate-bot spec for his correction, then prove alert-only. SRJ and HORC lanes never opened on edge blocks.
---

# edge - reference-script edge-finding lane skill

Role: this skill owns HOW the edge lane works. Strategy CONTENT (his targets, his corrections, the future bot's spec) lives in the vault and the lane ledger, never here. srj-strategy never judges edge takes; edge notes never enter SRJ relays or the HORC lane.

## 1. Lane map (fixed paths)

- Inbox (his-hands-only drops): `D:\SRJ Venture\SRJ Venture\Library\00_Inbox\` - he manually places reference scripts here, one file per script. Builder never scrapes Discord or any login-walled source, ever.
- Sorted notes: `D:\SRJ Venture\SRJ Venture\Library\01_MQL5\` + `02_Python\` + `03_Node\` (one note per script, filed from the inbox original; originals never edited, never deleted without his word).
- Rejected: `D:\SRJ Venture\SRJ Venture\Library\99_Archive\` (never deleted without his word).
- Survey + synthesis notes: `Library\00_Inbox\YYYY-MM-DD-<name>.md` (source maps, shared-DNA findings).
- Lane ledger (this lane only): `D:\SRJ Venture\SRJ Venture\Library\06_LEDGER_EDGE.md` (opens at first intake; SRJ and HORC ledgers never touched).
- Future bot code (spec-gated, Phase 5+ only): `Experts\REF_*.mq5` + `Indicators\REF_*.mq5` (+ `Include\REF\`), new files, zero SRJ touches, zero HORC touches. `REF_` namespace reserved; rename only on his word.
- Homes: `D:\SRJ Venture\SRJ Venture\Library-Home.md` + `Library.base` (table view, no install).

## 2. Intake rules (where scripts come from)

1. HIM: he drops files in the inbox by hand. That is the only intake path for Discord-walled or login-walled material - pasted or dropped by him, never pulled by the builder.
2. WEB: builder fetches ONLY free public pages he names (one link = one note). Each note carries source link + license; rules rewritten in our own words; small sketch only (50 lines max, ASCII-only); nothing whole-copied, nothing republished.
3. FORBIDDEN: Discord scraping, credential use, ToS-breaking pulls, bulk imports. An intake that cannot name its license is filed `source: unknown` and never quoted as proven.
4. Per-script frontmatter (Dataview + Bases + Grep read the same fields): language, market, purpose, status (idea/testing/kept/archived), source (your-own | web-rewritten + link | discord-rewritten + channel + date | unknown).

## 3. Per-script note pipeline (builder-side, needs nothing from him)

1. Read the inbox original whole. Never edit the original.
2. Write the sorted note from `Templates\Library-Note-Template.md`: what it does in 2 lines, entry, exit, risk, measured profit factor + span (or UNKNOWN where unknown - never inferred), flaw candidates (labeled candidate, never ruled).
3. Verify by read-back: frontmatter 5 fields present, sketch 50 lines max, source line exact.
4. Move the note to its language folder; file the intake in the OWN edge ledger (tail-proof solo, Edit solo, verify solo). Ledger MAX+1 computes over the OWN edge file only.

## 4. Synthesis (shared DNA + the PF cap)

1. After every 3-5 notes, write or refresh the synthesis note: what the scripts share (entries, exits, risk), and the flaw classes capping them under his profit-factor line.
2. Usual suspects are PROVED, never assumed: no session filter, fixed targets vs structure, trading news, no spread filter, tuned on seen months. Each suspect ships with the rows or spans that decide it, or stays open.
3. PF-HONESTY: every profit-factor cite carries span + costs + seen-vs-unseen. A PF with no span is unwritten. A PF tuned on seen months is labeled SEEN and never presented as edge.
4. QUALITY-OVER-COUNT (standing): ten proven notes beat two hundred raw pastes. The inbox is triaged, never hoarded - rejects move to `99_Archive\` with one-line reasons.

## 5. Phase order (fixed - mirrors the HORC pattern, never a fresh workflow)

Intake → per-script notes → synthesis (shared DNA + flaw classes) → separate-bot spec (his correction before code) → manual replay gate (10-20 past days by hand, his marks) → alert-only helper (indicator draws, EA alerts, no orders) → backtest vs his hand-marked bars → demo-forward, then stop. Full auto-trading OUT OF SCOPE until his explicit word. Blind optimization (tuning numbers until past months look green) is curve-fit and FORBIDDEN - gains come from cutting proven flaws plus unseen-span proof, never from stacking rules.

## 6. Build/run gates (when the future bot exists)

- Zero-run triage join BEFORE any run is spent; his word follows only a positive case.
- Alert-only stands: the helper draws and alerts, never sends orders, until his explicit word.
- Proving spans must be unseen + feed-covered (verified at launch, REFUSED gate otherwise); same-settings rerun reproduces.
- A DONE=PASSED with bars=0/signals=0 is VOID on instrument, never graded.
- Binary proof: EA digest + ex5 time recorded at launch, re-verified at grade before any take attribution.

## 7. Commit scope (lane autonomy)

- This lane commits ONLY its own paths, on the builder's call, no per-commit word needed: `.opencode\skills\edge\` plus future `REF_*` code (`Experts\REF_*`, `Indicators\REF_*`, `Include\REF\`). Never stage SRJ paths, never HORC paths, never bare `add -A` across lanes, never touch another lane's ledger. Vault files (`D:\` + OneDrive HORC) are never staged (outside the repo). Shared-file edits (`AGENTS.md`, quirks) ride announced in the OWN edge ledger the same turn. Push stays gated on his word plus credentials: verify via ls-remote, never force.

## 8. Standing lessons (his corrections, never re-asked)

- HIS-TARGET (2026-09-30): his profit-factor target + unseen span define "better" - the builder never sets the bar. No spec ships without his target line (PF on which unseen span) plus his alert-only yes.
- HIS-HANDS-INTAKE (2026-09-30): walled sources arrive by his hands only (drops, pastes). The builder never pulls them and never asks twice for what already landed - check the inbox FIRST before any intake ask.
- PROVE-BEFORE-BELIEF: ten scripts at 1.3 average into nothing. A flaw is cut only on rows, a rule ships only on unseen proof. Measured beats theorized, every turn.
