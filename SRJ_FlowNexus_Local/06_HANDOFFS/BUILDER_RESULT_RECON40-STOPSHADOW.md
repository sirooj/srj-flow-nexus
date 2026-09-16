# RESULT RECON40-STOPSHADOW (V110 CLEAR) — GRADED DELIVERED 2026-09-16

**Build:** EA `8CFBDC7A…`/589206 (SIDE1X shadow inside SIDE1E block, reads-only; both compile 0/0 fresh logs; FlowLogic `3606BFB4` unchanged). **Run:** RECON40-STOPSHADOW DONE=PASSED 2026-09-16 23:49:15 (Test passed 0:53:58, slower — his workload, noted, no concern; 3168 bars / 563338 ticks; same ini/range Model=4/debug/08-26→09-09). **Archive:** `06_HANDOFFS\RECON40-STOPSHADOW_JOURNAL.log` 37427 lines / 7243113 B / SHA `e37276aa…` / bounds [264163..301589] past PRE=264162 exact-contiguous. **Purity:** farm off, cloud off, Core-04-only (37410/37427, rest Tester/agent startup), Test-passed. MAXLEN cap 537 zero exceedance. SELHALT 0 (x2). Signals 4/4 payload-identical. No leftover (slot free). Run word SPENT.

## 1. Shadow rows: DELIVERED 14/14, 10:05 == his levels (pre-registered predictions HOLD)

SIDE1X_STOPREF 14 = one per S5 eval. 10:05 row (verbatim): `bar=2026.09.08 10:05 dir=SHORT entry=1.16205 liveStop=1.16379 ruleStop=1.16258 ruleSlot=5 ruleImb=0 liveTp=1.16072 liveR=0.77 livePass=0` — entry == his 1.16205 ✓; ruleStop == his 1.16258 ✓ (slot 5 = 09:40, imb 0); ruleR = (16205-16102)/(16258-16205) = 103/53 = 1.94 TAKES ✓ (computed offline, zero literals in build). Live path re-confirmed stale (liveR 0.77, livePass 0).

## 2. Isolation: PERFECT (198-family table `RECON40_TABULATE.txt`, only SIDE1X new)

All legacy families payload-identical vs RECON39 (SIDE1E/R/W/O/Q 14/14, PREEMPT 13, D 424, H 64, V 63, T 63, N1EQUALS/WS161/TALLY/SEL61LIVE/A6FIRED identical). +16 lines = +14 SIDE1X + 2 Tester framing. R fires 4/4 identical. R2 declined-silent. 10:10 clean. tf=-1 zero. No halt trigger fired.

## 3. Finding (grade, not design)

The mechanism is proven end-to-end: the candidate reaches S5; live prices it 0.77 on the Sep-3 pin and kills it; his-rule stop prices it 1.94 and takes it. Whether the live fix is rewire-to-X or staleness-test-in-W (the OB-anchored counter-reading) is council authorship — relay v111 asks it with the live-fix clearance.

## 4. Files

Result (this file) + `06_HANDOFFS\RECON40_EXTRACT.txt` (17 rows: 14 SIDE1X + 3 join, SHA `bb3dbbba…`) + `06_HANDOFFS\RECON40_TABULATE.txt` (198 lines, SHA `a43a1189…`) + relay `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v111-STOPFIX-LIVE.md` (grade + live-fix clearance; same-prompt both seats). Run word SPENT. RECON17 frozen; `8CFBDC7A` uncommitted. NO build/run/commit (dual-key live clearance + selection token + fresh word all owed).
