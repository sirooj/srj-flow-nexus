# BUILDER SESSION POINTER — read this first, every session

**Rule:** this file is the ONLY live memory (capped 35 lines). If chat says otherwise, this file wins.
Ledger (`06_HANDOFFS\BUILDER_LEDGER_QUEUE.md`) is audit-only, never required reading.

## State (2026-09-29, V333 RELAY-READY)

- Packet v20 + relay v333 (D22E7EA0/839)
  memo-shipped to 3 seats; verdicts owed.
- His 16:15 question asked with trail.
  Key spent; no build/run/key this round.

## Next

- Verdicts owed back whole per seat; grade,
  fold, result, ledger, pointer, commit.

## Resume order (exact)

1. This pointer. 2. AGENTS.md §10 checklist (hashes + git log/status, read-only).
3. Latest result + relay + verdicts on disk. 4. Ledger ONLY for audits.
5. Index 06_HANDOFFS\BUILDER_INDEX_RELEVANCE.md before ANY record search (relevance first).

## Update rule

- End of every block: refresh State + Next + date, keep under 35 lines, verify by read-back. A session that did not update it did not finish. Next always names ONE action or the exact trigger awaited — never "nothing owed" alone.
