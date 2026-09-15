# BUILDER RESULT — RECON27-A6FIX (`A6-DECISION-PAIRING-001` print-only repair run)

**Verdict: DELIVERED — all 4 pre-declared checks PASS; no halt fired; isolation clean. Council ruling owed (v43 relay): accept record + next direction. NOTHING commits.**

## 1. Run facts

- DONE=PASSED 2026-09-15 05:46:54. Test passed in 0:47:01.620 (< 90, no timeout). 3168 bars / 563338 ticks (same footprint as RECON20b–26).
- Archive `06_HANDOFFS\RECON27-A6FIX_JOURNAL.log`: 38005 lines / 7420760 B / SHA256 `105099E1E8368656B754C78C30FE2EBD4870294EA5555F005E93B1AEA951B4FD` / bounds [38004..76008] (PRE=38004 contiguous past RECON26's 38002; 38004+38005−1=76008 exact).
- Purity: Core-04-only lines, Test-passed-1, single local agent; farm/cloud fields not recorded in this STATUS (same stated gap). MAXLEN=537 (=cap, zero exceedance). SELHALT 0.
- Build: EA `C24460B6…` (531778 B, pairing-key fix only, adoption OFF), FlowLogic `3606BFB4` unchanged, both compile 0/0 with freshness-verified logs. Build uncommitted; RECON17 frozen.
- Leftover terminal 13840 closed forced (declared; no run active, slot free).

## 2. Grades vs the 4 pre-declared checks (full text in `06_HANDOFFS\RECON27_A6.txt`, 11 lines)

- **Check 1 — target: PASS.** `A6DECISION tag=S1` now reads `state=TRIGGER_UNRESOLVED limb=2026.09.08 09:50 e09=1.16251 eN=1.16233 eO=1.16250 limbsrc=OK missing=retest+LTF+confirm+div verdict=NONE`. The false `px=1.16198` SELECTED is gone from the SHORT decision (confirmed 0 by two differently-formed patterns). MATCH stays `EMPTY class=ABSENT_UNBORN`. D7 fires for the first time.
- **Check 2 — regression: PASS (top check).** R4 prints identically: `SELECTED px=1.16098 ok=1 slot=7`, MATCH ok=1, FIRED R=1.76 SL/TP exact. The row is now right by construction (site+dir key), not by luck.
- **Check 3 — invariants: PASS.** FIRED 4/4 byte-exact; SLIMB 481/481, SLIMBR 16/16, SEL52 14376, SEL53 168, SEL55 5, O1DISC 2, SUPPRESSED 637 = 481 A6 + 156 legacy (legacy 156/156), SIGNAL 4/4, SELHALT 0, REFUSED 52/52. No SUPPRESSED/REFUSED movement. No signal drift; adoption static OFF; OrderSend-src 0; no live-selection delta outside recorder lines.
- **Check 4 — count/bounds delta: PASS as pre-declared.** `A6COUNT emitted=1024 s5rows=10 s5cap=0 termrows=481` — flat vs RECON26 (DECISION 2→2 content-swapped, as predicted). Archive 38005 lines (+3 non-A6 lines vs RECON26; all A6 family counts identical).

## 3. Realized delta (close-the-loop vs the v42 promise)

- Promised the false Sep-8 SELECTED gone → DELIVERED (TRIGGER_UNRESOLVED with limb operands + missing-operand names).
- Promised Sep-7 regression identical → DELIVERED (byte-identical decision + fired rows).
- Promised everything else frozen → DELIVERED (full invariant list diff 0).
- S1 substance stays open under VOID(NO_MATCHING_ROW) — the instrument now reports "open" honestly instead of asserting a false decision. No halt fired. No third run; no re-grade.

## 4. Asks (v43 relay)

1. Accept this record (run + 4 checks + isolation).
2. Next direction: council AUTHORS the next packet (if any) — nothing is pre-authorized after this run.
3. Confirm nothing builds/runs/commits; RECON17 frozen; C24460B6 uncommitted (no token sought).

## 5. Files

- Archive: `06_HANDOFFS\RECON27-A6FIX_JOURNAL.log` (38005 / 7420760 B / 105099E1… / [38004..76008]).
- Extract: `06_HANDOFFS\RECON27_A6.txt` (11 lines).
- Scripts: `00_CURRENT_WORKING\launch_recon27_run.ps1`, `compile_a6_ea.ps1`, `compile_a6_flow.ps1`.
- Logs: `06_HANDOFFS\T162_A6_EACOMPILE.log` (0/0), `T162_A6_FLOWCOMPILE.log` (0/0).
- Markers: `00_CURRENT_WORKING\RECON27-A6FIX_STATUS.txt` (PASSED gates) + `RECON27-A6FIX_DONE.txt` (PASSED 05:46:54).
