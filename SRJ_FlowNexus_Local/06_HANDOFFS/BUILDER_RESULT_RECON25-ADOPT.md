# BUILDER RESULT — RECON25-ADOPT (O1 exploratory print-only bench, observation run)

**Verdict: DELIVERED — O1 table complete (12/12 lines, both targets classified with full operands); NO A6 halt (no semantic choice encountered); isolation read clean (signals 4/4 identical, key families match RECON24). Council ruling owed (v37 relay): accept record + author the replacement design (A6) from the O1 table.**

## 1. Run facts

- DONE=PASSED 2026-09-14 23:53:15. Test passed in 0:50:13.442. 3168 bars / 563338 ticks (same footprint as RECON20b–24).
- Archive `06_HANDOFFS\RECON25-ADOPT_JOURNAL.log`: 36973 lines / SHA256 `A812DDAC87F5B84142EE8AD82981B88300BA3B15E238A50E0C96B0FDF83C2D02` / bounds [293110..330082] (PRE=293110 contiguous from RECON24's end; 293110+36973−1=330082 exact).
- Purity measured: Core-04-only lines, Test-passed-1, single local agent; farm/cloud fields not recorded in this STATUS (minor gap, stated). MAXLEN=537 (=cap, zero exceedance). No timeout (50:13 < 90). Leftover terminal 9468 closed graceful post-run.
- Build: EA `51DF542D…` (O1 recorders only, adoption OFF), FlowLogic `3606BFB4` unchanged, both compile 0/0. Build uncommitted; RECON17 frozen.

## 2. O1 grades (the graded artifact — full text in `06_HANDOFFS\RECON25_O1.txt`, 12 lines)

**R4 (Sep-7 morning LONG, filed 1.16098@08:40):** BARS OK (t=759) → PATTERN PASS (low 1.16098 strict middle extreme vs 1.16103/1.16103) → ELIG PASS (protective vs 1.16135, PX_MATCH) → BUF HOLDS filed at mapped slot (tsA=758, bvA=1.16098) → WALK: the 09:15 S5 row itself, mode=1SWING, px=1.16098, ok=1 → DISC NOT_EVALUATED / CONSUMPTION / NO_LOOP_CAPTURED (1SWING OB path runs no loop — owned instrument bound).
**R4 finding (NEW vs all prior runs):** the LIVE 1SWING leg reproduces the filed stop exactly (row px = filed px; SIGNAL SL 1.16098 identical). The "R4 absence" lives in FRACTAL-candidate space only (E57/E58: no 08:40 event, walk to 08:20) — recognition-level, exonerating the live leg. Per-path verdicts, not one verdict: live-1SWING PRESENT-and-chosen; fractal-walk ABSENT. The fix design must say which path the conditional rule walks, or reconcile both.
**S1 (Sep-8 London SHORT, HAND first 09:50):** BARS OK (t=457) → PATTERN PASS (high 1.16251 strict middle extreme vs 1.16233/1.16250) → ELIG PASS (protective vs 1.16205, filed UNSTATED) → BUF HOLDS 1.16251 at tsA=456 → WALK: no S5 row at/near the 10:05 decision (date-match caught the unrelated 16:40 row) → DISC NOT_EVALUATED / CONSUMPTION / NO_LOOP_CAPTURED.
**S1 findings (NEW):** (a) the 09:50 high IS a countable swing (1.16251, first time on record — 46pts risk vs his 53pt stop, 7pts inside); it sits qualified in series + buffer, the closest thing to his #1 ever measured; (b) no decision row exists at the bar — never-born confirmed at row level, stronger than the walk-level absence; (c) code's ext-1 #1 (09:40 = his #2) with #2 at 09:05 keeps the ordinal shift standing.
**Instrument caveats (owned, labels read with them):** NO_LOOP_CAPTURED on both rows (1SWING-OB path has no loop to bound — 2SWING rows would carry bounds); S1's walk-bound came from the unrelated 16:40 row (date granularity, not decision granularity). All operands are printed, so council grades the evidence, never the labels.

## 3. Isolation read (legacy untouched — observation premise holds)

Signals 4/4 byte-identical vs RECON24 (2.43/1.16508, 2.56/1.15907, 1.76/1.16098, 1.25/1.16218). SLIMB 481 / SLIMBWALK 481 / SLIMBR 10 / SEL52CTX 599 / SEL53_FINAL 24 / SEL54_FINAL s1hook=1 s2hook=1 / SEL55_FINAL rows=5 / SEL60END 14 / SUPPRESSED 152 / SLMEMO 589 / SLEXT47 118 / SLEXT1 10 — all match the RECON24 filed record. Adoption static-OFF (pre-run verified); OrderSend-src 0 (pre-run verified). TESTPASSED 1, SELHALT 0.

## 4. False-void incident (owned, process-relevant)

Mid-grading the builder reported O1 absent (0 lines) and diagnosed a stale binary — the diagnosis was WRONG. Cause: an escaped-bracket pattern under -SimpleMatch (literal backslashes matched nothing). Corrected method (unescaped pattern) returned 12/12 immediately. No run was touched on the false claim; no code moved. LESSON (standing, extends AGENTS §6.11): a zero-count is itself a measurement — verify it with a second differently-formed pattern before grading any void. The binary-strings side-theory was also invalid (ex5 literals are not plaintext-guaranteed) and is retracted.

## 5. Asks (v37 relay)

1. Accept this record (run + O1 table + isolation read + caveats).
2. Council AUTHORS the replacement design (A6) from the O1 table — the R4 per-path split and the S1 never-born row are the design inputs; builder drafts no rule.
3. Confirm nothing builds/runs/commits; RECON17 frozen; 51DF542D uncommitted (no token sought).

## 6. Files

- Archive: `06_HANDOFFS\RECON25-ADOPT_JOURNAL.log` (36973 lines / 7248974 B / A812DDAC… / [293110..330082]).
- Extracts: `06_HANDOFFS\RECON25_O1.txt` (12), counts `06_HANDOFFS\RECON25_COUNTS.txt`.
- Scripts: `00_CURRENT_WORKING\tabulate_recon25_adopt.ps1`, `compile_o1_ea.ps1`, `compile_o1_flow.ps1`, `launch_recon25_run.ps1`.
- Logs: `06_HANDOFFS\T162_O1_EACOMPILE.log` (0/0), `T162_O1_FLOWCOMPILE.log` (0/0).
- Markers: `00_CURRENT_WORKING\RECON25-ADOPT_STATUS.txt` (PASSED gates) + `RECON25-ADOPT_DONE.txt` (PASSED 23:53:15).
