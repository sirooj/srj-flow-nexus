# FINDING — SEP-8 SEED LINEAGE (journal-recorded, RECON30 archive)

**Source:** `06_HANDOFFS\RECON30-STAGEC_JOURNAL.log` (38027/`41404E0F…`/[152055..190081]). All lines below verbatim payloads. Closes the SRC2 producer-input gap; corroborates Track-1 wiring point.

## Seeds (ANCHOR_ELECT, action=SEED)

- 09:15 London: `poi=Daily-POC rank=10 tier=5 dir=LONG` ← chain-98 vote, fully identified.
- 16:30 NY AM: `poi=Monthly-POC rank=6 tier=3 dir=SHORT` ← correct-direction SHORT seed, higher authority than what follows.
- 16:45 NY AM: `poi=Weekly-VWAP rank=9 tier=4 dir=LONG` ← chain-105 vote, fully identified (lower authority than the 16:30 line).

## Death of the 16:30 SHORT (recorded)

- `CONFIRM_STRUCT_FAIL bar=2026.09.08 16:35 dir=SHORT term=A_OPP` — the SHORT candidate failed confirmation at the S4→S5 edge (no opposing/retracement candle), aborted, reset (matches SRC2 NODIR-at-entry snapshot at 16:45).
- 15 minutes later the LONG seeded on the lower-authority line and carried to the 17:00 site.

## Afternoon story, complete

SHORT born right (16:30, Monthly-POC) → killed on confirmation terms (16:35, A_OPP — no pullback to confirm against) → LONG born wrong (16:45, Weekly-VWAP, meters bearish) → carried to site. Track-2's hierarchy fix inherits a second datum: the SHORT path's confirmation death is part of the afternoon failure, not just the LONG's hierarchy violation. No packet change proposed here (council authorship); recorded for the proving-turn grade.

## London corroboration

- Zero CONFIRM_* lines 09:15–10:10 (first Sep-8 line 11:20) → the 09:15 candidate never reached S3/S4 stages (no S5 rows) → the downstream gate never saw it. Code-side proof (zero tokens at seed) + journal-side proof (zero consults) agree.
- The B_BODY term (his close-direction rule) fires for other Sep-8 LONG attempts (14:05, 15:40, 16:15) — the gate works where consulted; the seed path is the only blind spot.

## A6TERM neighborhood (S2POLL/S5, recorded)

- 09:20 S2POLL LONG 1SWING 1.16232 (seed aftermath); 16:40 S2POLL+S5 SHORT 1.16379 slot-817 (stale Sep-3 pin, recognition only); 16:50 S2POLL LONG 1.16197; 17:00 S2POLL LONG 2SWING 1.16187 (site state).

(End — measured 2026-09-15; SRC2 gap CLOSED from disclosed to identified; rides the record)
