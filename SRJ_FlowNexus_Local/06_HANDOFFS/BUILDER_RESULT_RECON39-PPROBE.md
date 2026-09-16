# RESULT RECON39-PPROBE (V105 amended dual-reading CLEAR) — GRADED DELIVERED 2026-09-16

**Build:** EA `FEC50B24…`/587901 (both compile 0/0 fresh logs, FlowLogic `3606BFB4` unchanged). **Run:** RECON39-PPROBE DONE=PASSED 2026-09-16 21:25:08 (Test passed 0:46:37.750; 3168 bars / 563338 ticks; same ini/range Model=4/debug/08-26→09-09). **Archive:** `06_HANDOFFS\RECON39-PPROBE_JOURNAL.log` 37415 lines / 7240284 B / SHA `872DEAEB…` / bounds [226744..264158] past PRE=226743 exact-contiguous (first = farm-off, last = connection-closed). **Purity:** farm off, cloud off, Core-04-only (37398/37415, rest Tester/agent startup), Test-passed. MAXLEN cap 537 zero exceedance (decoded; raw +1 = CR). SELHALT 0 (x3 patterns). Signals 4/4 payload-identical. Leftover 19396 closed graceful, declared. Run word SPENT.

## 1. P-dual-rows: DELIVERED (63/63, predicted split reproduced at both S1 seeds)

SIDE1V_BIRTH 63 = SIDE1T_SEEDBIAS 63, bars 1:1 (seedRow join holds). tf: 1=28 / 0=35, tf=-1 = 0 (x2 patterns, guard holds). confShort: PASS 4 / B_BODY 8 / C_TOUCH 6 / A_OPP 25 / A2_CLOSE_BREAK 20.
S1 seeds (verbatim): 09:15 `dir=SHORT tf=0 mr=1 confShort=A_OPP`; 09:45 `dir=SHORT tf=0 mr=1 confShort=A2_CLOSE_BREAK` — TF opposes both, MR supports both, confirm FAILS both. The RECON38-joined 2-2 split now executes: no invention, no row-type pick.

## 2. Isolation: PERFECT (197-family table `RECON39_TABULATE.txt`, only SIDE1V new)

All legacy families delta-0 vs RECON38 (SIDE1E/R/W/O/Q, PREEMPT 13, D 424, H 64, N1EQUALS `28/30/0/3` identical, WS161 mismatch=0 identical, TALLY seeds=63, SEL61LIVE 63/63/0, A6FIRED 4/4 + A6COUNT identical). +66 lines = +63 SIDE1V + 3 Tester framing. S1-chain intact (10:05 sel=1 r1=2.52). Linkage intact (SIDE1R 14/14 identical).

## 3. Predictions + gates: HOLD

R fires 4/4 identical (R-zero-delta). R2 declined by legacy (no 10:35 signal x2; SIDE1E sel=0 livePass=0; silent per A+). 10:10 clean (0 signals). S2 16:30 SIDE1V `tf=0 mr=0 A_OPP` (both oppose); R-gate kills at 0.60 as before. R2 10:35 SIDE1V `tf=1 mr=0 PASS` (confirm passes, legacy still declines — print/decision split recorded). No halt trigger fired.

## 4. Finding (grade, not design)

P as specified would NOT birth SHORT at either S1 seed: confirm fails both, TF opposes both; MR supports both but confirm gates. Whether birth requires confirm, or sweep-only suffices, or S1 is unbirthable (D/E-first), is council authorship — relay v107 asks it.

## 5. Files

Result (this file) + `06_HANDOFFS\RECON39_EXTRACT.txt` (70 rows: 63 SIDE1V + 4 SIDE1T + 3 SIDE1E, SHA `abbaacf8…`) + `06_HANDOFFS\RECON39_TABULATE.txt` (197 lines, SHA `c9d4cf5e…`) + relay `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v107-PPROBE-GRADE.md` (accept + birth-authorship, full branches; relay ALONE, tree unchanged). Run word SPENT. RECON17 frozen; `FEC50B24` uncommitted. NO build/run/commit (fresh authorship + word owed for anything further).
