# STANDING PLAIN-REVIEW TEMPLATE (operator-ordered 2026-09-17 — adopts the review-seat plain form; same text to EVERY model, every time)

## Why this form

- He is the trader: rules strategy, never code. Models answer code questions. Builder verifies on disk. Nobody is asked to play a role, hold a seat, issue IDs, or clear/grant/hold anything. Keys volunteered by a model are recorded, never demanded.
- No model has memory of prior sessions and none can verify past quotes. So: everything needed rides INLINE; prior texts ride labeled with file + marker + digest, never as anyone's words; the operator transports every text VERBATIM both ways — he is the independent fidelity check (he sees what each side actually sent).
- Decisions rest on three legs, all checkable: model answers + builder disk measurements + his word. A pasted ID never substitutes for any leg.
- Verification split (read carefully — this answers repeat file requests): judge ONLY what is pasted in the prompt. Whether pasted code/rows match the repo is proven ON DISK by the builder (digests, counts, bytes quoted in the prompt) and double-checked by the operator, who owns the machine and transports every text verbatim. No chat model of any tier can perform that part — model tier is verification-neutral, every chat seat shares the same blind spot on pasted text, and pasting "the actual file" cannot substitute for it. Do not re-ask for files; rule on the page. File-access log checks happen disk-side, never by paste.

## The template v1 (superseded by v2 at file foot, kept for audit)

```
CODE REVIEW REQUEST — v[NNN] — [date]

Change (one plain sentence): [...]

File / function / lines: [exact path + function + line numbers]
Source digest: [SHA256 + bytes, measured after last write]

Complete code, verbatim, no elisions:
[paste the whole contiguous region — "..." anywhere = defective prompt, do not send]

Run rows, raw (grade relays only; check relays omit this block):
[paste raw journal rows for recompute — never summaries alone]

Question (one, specific): [...]

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
```

## Grade-relay extension (same template + these two blocks, no extra ceremony)

```
As-built diff (read back from disk AFTER the edit, before compile):
[paste the re-read region — proves what compiled, not what was proposed]

Compile log (verbatim tail): [...]
```

## Builder self-check before any send (BLOCKED until all pass)

1. Code block re-read from disk this turn (digest + bytes cited).
2. Zero "..." / "area"-style pointers in the code block.
3. Numbered questions each with own verdict line and answer form (multi on his per-round word); no role/ID/clearance asked of anyone.
4. Prior texts labeled (file + marker + digest) or absent — never unattributed.
5. Run rows raw where a per-row claim is made (aggregates alone = defective).

## What each party does with it

- Models: answer the one question plainly. More models = more eyes; none clears anything.
- Builder: files answers verbatim (filer + counts + tail), verifies every checkable claim on disk same turn, reports plainly.
- Him: transport only (paste whole both ways) + strategy rulings + money words. He compares what a model sent with what got filed — that comparison IS the anti-fabrication check.

## Format v2 (CURRENT — adopted 2026-09-18 on his word; relay count is the bottleneck)

Same evidence to every model. Same decision question to every model. Analytic depth harvested every round:

```
Question (one, specific — or Q1/Q2 numbered, each with its own verdict line, on his per-round multi-question word 2026-09-23; a NO on one never sinks the other): [...]

Answer form: plain yes / no / discrepancy, with line numbers (per question; or the relay's stated decision form).

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers — freetext, no length limit.

Analytic ask B (standing, code relays): state any better mechanism you see for the stated goal, with the code lines it would touch.

Review-seat packaging: the same relay text ships, but its verdict-slot line is excused for the review seat (standing seat-split: analysis out, review-only, never keys — nothing refused because nothing unanswerable is asked).

Settled standing: verification split, upload-dead, and seat roles ride by reference (filed record); repeat objections to the FORMAT itself are recorded once, not re-litigated each round. New technical objections are always welcome.

Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
```

## Project brief (DEFAULT relay introduction — his order 2026-09-18; answers the repeat seat questions so they are asked once, never re-litigated)

Ships at the top of every relay, same text to every seat:

```
Project brief (standing — read first):
- Money: probe/print-only. Alert-only EA. No live trades. No funded money moves on any verdict here. Live activation needs a separate relay plus his explicit word. Nothing in this packet clears it.
- People: one operator (trader, strategy owner, money authority) plus AI seats. No second human reviewer — declined, his call. He carries every text both ways verbatim. That carry IS the anti-fake check: he compares what a seat sent with what got filed.
- History: this packet v1 through v9; relays v162 through v172 on disk; every version folds the prior round's verdicts (see each relay's delta paragraph). Rounds end in amend or clear, never silent drift.
- Your verdict: rules on the page only (code lines, numbers, logic). Disk truth (digests, logs, builds) is proven on his machine, never in chat. Keys come only from the key seat. No ruling here builds code, runs anything, or spends money.
```
