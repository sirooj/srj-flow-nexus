# /srj-defect — common-mistake self-audit and repair

Deploy by typing `/srj-defect` and pointing at the mistake (paste the report line or name the artifact). The builder then STOPS all other work and runs this protocol. No new writes until the defect is classified below.

## 1. Classify first (no writes before this)

Match the mistake to one class. If none fits, say so and stop — do not force a fit.

- D1 ASK-BEFORE-SEARCH: a question was asked that the record already answers. Sources in order: spec Part A v4.2 (cited section), restatement, findings, journal, ALL other filed prose (decision memos, relays, results, session prompts). A search of journal-only is NOT a search. V4 2026-09-17 TIGHTENING (A2/A3 kills): his DECLINES inventory counts as record — before presenting ANY fire as an open question, grep his prior MUST-DECLINE / considered-not-taken / invalid rulings by bar (v14-SEL1 table, SEP8_MANUAL_REVIEW, v93 quotes) and match bar-for-bar. An ask on a bar he already declined is D1, not a relay. V5 2026-09-18 TIGHTENING (8/28 entry time, third occurrence): entry-time/detail asks check BUILDER_FINDING_0828-FVG.md + COUNCIL_RESPONSE_POI-R.md + journal Comment first — his 2026-09-11 correction already gives entry 1.16466 next-open ~10:05; journal-silent is not record-silent.
- D2 DESCRIPTION-ONLY PACKAGE: a relay or ruling ask without whole code regions or machine-pulled rows inline. Any "..." standing in for code, or any claim resting on prose about evidence.
- D3 UNRESOLVED CONTRADICTION: two contradictory standards quoted side by side without resolution. Governing order: spec, then his later words, then council prose. Council prose never overrules him.
- D4 HAND-TYPED EVIDENCE: any row value, price, or ID that was typed rather than machine-pulled, or any token/ID invented. Includes one hand-typed cell in an otherwise pulled table.
- D5 MIXED PROVENANCE: blocks from different eras, runs, or seats without labels. Every block needs run ID plus archive plus date. Old vs new never share a header.
- D6 FILER FAULT: filed twice, appended mid-file instead of tail, duplicated pointer lines, overwrote instead of adopted, or wrote without a same-name collision check.
- D7 UNNAMED-FILE MEMO: a memo referencing a deliverable without its exact `06_HANDOFFS\NAME.md` path plus read-vs-paste action.
- D8 SCOPE STEER: new dates, windows, instruments, or strategy direction proposed or framed without his explicit order. Includes framing that steers him toward supplying them.
- D9 DRIP-FEED: questions asked one by one across turns instead of batched in one decision memo.
- D10 UNMEASURED CLAIM: anything asserted from agent or model prose without a disk measurement (hash, bytes, lines) pasted verbatim. Accusations need measurement first too.
- D11 SINGLE-PROOF ZERO: any void, absence, or miss graded on one unconfirmed zero (one pattern, one flag, one file).
- D12 SCRIPT HYGIENE: non-ASCII in any ps1, or a script-touched file without a raw-byte audit.

## 2. Audit mechanically (per class, literal commands, paste verbatim)

- D1: grep every source for the question's keywords; file hits and misses per source WITH any further question. If any source answers, the question is withdrawn, never asked.
- D2: list every claim in the artifact; beside each, the inline whole region or pulled rows that carry it. No carrier means the vehicle is withdrawn and re-filed with source inline.
- D3: name both standards plus their sources; apply the governing order; either resolve on record or escalate as ONE question.
- D4: re-pull every row from its journal or log and set-diff against the filed table; re-verify every ID. Correct the record, name the withdrawn error, keep the surviving conclusion, credit the catcher by seat.
- D5: re-label every block (run, archive, date) or re-file cleanly; verify tail order after every append.
- D6: counts before and after (marker 0 to 1, never 1 to 2); tail-order read-back; collision list-check before any filed write; adopt-not-overwrite on collision.
- D7: reissue the memo named. A memo with an unnamed file is defective — reissue, don't patch by chat.
- D8: vacate the track the same turn (record stands, nothing built on it); report the vacation plainly.
- D9: collect ALL open questions into one decision memo; ask once.
- D10: produce the hash, byte count, or line output, or withdraw the claim the same turn.
- D11: re-prove with a second differently-formed pattern before grading anything on it.
- D12: rewrite ASCII-only; file the byte audit (non-ASCII count plus line-ending note).

## 3. File and report (every deployment)

- Ledger: next number in `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_LEDGER_QUEUE.md`, tail-append only, format `332. /SRJ-DEFECT <class> + <one-line cause> + <correction> + <withdrawn artifact, if any> + NO build/run/commit` (or the real next number — count first, never assume).
- Pointer: refresh `BUILDER_SESSION_POINTER.md` State plus Next (single action), dedupe the Next block, keep under 35 lines, verify by read-back.
- Report to him: plain words, short sentences. What was wrong. What the record actually says. What is withdrawn. Next action. Name every file exactly. Never bare row numbers. Gloss every EA code. No new question unless the audit proves true absence — and then the audit rides with it.
- This skill learns: a defect seen twice gets its audit tightened here the same turn (no chat-only lessons).
