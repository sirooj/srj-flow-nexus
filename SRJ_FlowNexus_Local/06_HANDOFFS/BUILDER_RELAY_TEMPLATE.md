# STANDING PLAIN-REVIEW TEMPLATE (operator-ordered 2026-09-17 — adopts the review-seat plain form; same text to EVERY model, every time)

## Why this form

- He is the trader: rules strategy, never code. Models answer code questions. Builder verifies on disk. Nobody is asked to play a role, hold a seat, issue IDs, or clear/grant/hold anything. Keys volunteered by a model are recorded, never demanded.
- No model has memory of prior sessions and none can verify past quotes. So: everything needed rides INLINE; prior texts ride labeled with file + marker + digest, never as anyone's words; the operator transports every text VERBATIM both ways — he is the independent fidelity check (he sees what each side actually sent).
- Decisions rest on three legs, all checkable: model answers + builder disk measurements + his word. A pasted ID never substitutes for any leg.
- Verification split (read carefully — this answers repeat file requests): judge ONLY what is pasted in the prompt. Whether pasted code/rows match the repo is proven ON DISK by the builder (digests, counts, bytes quoted in the prompt) and double-checked by the operator, who owns the machine and transports every text verbatim. No chat model of any tier can perform that part — model tier is verification-neutral, every chat seat shares the same blind spot on pasted text, and pasting "the actual file" cannot substitute for it. Do not re-ask for files; rule on the page. File-access log checks happen disk-side, never by paste.

## The template (copy whole; fill every slot; no roles, no IDs asked, no memory assumed)

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
3. One question only; answer form present; no role/ID/clearance asked of anyone.
4. Prior texts labeled (file + marker + digest) or absent — never unattributed.
5. Run rows raw where a per-row claim is made (aggregates alone = defective).

## What each party does with it

- Models: answer the one question plainly. More models = more eyes; none clears anything.
- Builder: files answers verbatim (filer + counts + tail), verifies every checkable claim on disk same turn, reports plainly.
- Him: transport only (paste whole both ways) + strategy rulings + money words. He compares what a model sent with what got filed — that comparison IS the anti-fabrication check.
