# RESULT — C0-PROBE (null-effect probe; graded CLEAN, both WHY-NOT-LAST-TIME firsts delivered)

**Verdict: DELIVERED CLEAN.** Every null-effect prediction holds; the CHAINN fork closes on the 0/0 cascade-driven branch; the both-dirs table is complete. No behavior delta anywhere → no REPORT+HALT trigger. Clean run authorizes NOTHING further (no C1/D/E/range/landing/deployment — all need fresh gates).

- Run: DONE=PASSED 2026-09-16 02:05:54 (Test passed 0:47:16.194; 3168 bars / 563338 ticks; no timeout). Build EA `D0DD07AA…` (568323 B).
- Archive: `06_HANDOFFS\C0-PROBE_JOURNAL.log` (38335 lines / 7469613 B / SHA256 `002F8323C472BB3D54BAFD4CB6BCF6EDF4B6DBDF0AC5BFDE724856B4D8DE28B0` / bounds [1..38335] fresh `20260916.log`, L1-verified). Purity: farm-off / cloud-off / Core-04-only / single-agent-3003 / Test-passed. MAXLEN=537=cap, exceed-count 0 (two patterns). SELHALT 0/0 (two case-sensitive patterns).

## Grade vs pre-declared predictions (all PASS)

- **Seeds 56/56 shared-zero-new-zero-lost:** ANCHOR_ELECT 56/56 counts + bar-set diffs 0 vs RECON32.
- **Fires 4/4 byte-identical (R1 alive):** SIGNAL payload diffs 0 — R1 SHORT R 2.43 SL 1.16508 TP 1.16364 first, then 2.56 / 1.76 / 1.25.
- **TALLY 56/56/56:** `SIDE1G_TALLY seeds=56 prof=56 vote3=56`; PROFILE match=1 on 56/56 (mirror self-validates as in RECON32).
- **N1EQUALS:** content-identical (`poiEqBody=28 poiEqWick=26 vwapEq=0 pocEq=3`).
- **Isolation 38-family + payloads identical:** `06_HANDOFFS\C0_TABULATE.txt` — all 38 legacy families delta-0 counts; payload diffs 0 on SIGNALS, N1EQUALS, SIDE1F_VOTE (56), SIDE1P3_SRC (2); WS161 `changes=205` == RECON32 exactly (STAGE-C's 224 was the cascade outlier).
- **SEL61LIVE agree==calls (D1 pre-declared):** `calls=56 agree=56 delta=0`, identical to RECON32's line — print delta as predicted, zero behavior behind it.

## WHY-NOT-LAST-TIME firsts (both delivered)

1. **Cascade-vs-dir CHAINN fork → CLOSED cascade-driven:** SIDE1P3_SRC CHAINN 98/105 byte-identical to RECON32 (delta 0/0); STAGE-C's +5/+5 growth is gone with suppression off and zero re-seeds (CHAIN ledger 56 unique positions, monotone 2..112). The +5/+5 branch never fired, so Sonnet's NOT-dir-driven disposition never triggers — no shadow-artifact investigation owed.
2. **Both-dirs failTerm table → COMPLETE:** `SIDE1C_BOTHDIRS` 56/56 (one per seed) + `SIDE1C_CHAIN` 56/56; all 56 rows split (longTerm != shortTerm — the gate is direction-parameterized everywhere, confirming the banked 14:20 ruling structurally). S1 seed row 09:15: live=LONG/B_BODY, long=B_BODY, short=A_OPP (SPLIT). S2 seed row 16:30: live=SHORT/A_OPP, long=A2_CLOSE_BREAK, short=A_OPP (SPLIT).
3. **Would-suppress markers:** `SIDE1C_SUPP` 8 rows — exactly the RECON32 B_BODY census-8 population (incl. R1's 09:55 seed and S1's 09:15 seed), all fired through as designed. Suppression deleted, observability kept.

## C1-precondition inputs (measured, never assumed — reading rides the council relay)

- Table complete per seed (legacy+owned terms): S1's 09:15 row is SPLIT (B_BODY vs A_OPP). Type-(ii) counting over the 56-row table is the council's reading; the full table is in `06_HANDOFFS\C0_EXTRACT.txt` (137 lines, SHA `FC9A5E90…`, mechanical pull, zero transcription).

## Locks and next

- RECON17 frozen; `D0DD07AA` uncommitted; run word SPENT. NO relay now (grading relay carries the C1-precondition reading + needs his tokens + fresh word first — next = his landing call or quiet). NO build/run/commit.
- Full families: `06_HANDOFFS\C0_TABULATE.txt` (45 lines). Count script: `SRJ_FlowNexus_Local\00_CURRENT_WORKING\tabulate_c0.ps1`.
