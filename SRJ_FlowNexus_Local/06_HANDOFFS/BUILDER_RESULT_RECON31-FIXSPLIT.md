# BUILDER RESULT — RECON31-FIXSPLIT (`SIDE-1P-FIX-SPLIT` shadow proving run)

**Verdict: DELIVERED, graded PER-TRACK: Track-1 PASS + blanket-scope REFUTATION; Track-2 FAIL with mechanism; isolation PERFECT. NOTHING builds/runs/commits. NO relay now (message-budget rule + landing ask needs his tokens first).**

## 1. Run facts

- DONE=PASSED 2026-09-15 20:39:30. Test passed in 0:49:25.032 (< 90, no timeout). 3168 bars / 563338 ticks (same footprint as RECON20b–30).
- Archive `06_HANDOFFS\RECON31-FIXSPLIT_JOURNAL.log`: 38103 lines / 7436166 B / SHA256 `2702C34BBC9E262EAD6F9579D0B9A496BFAF8D3CAF663CC64786F916B7627DB` / bounds [190084..228186] (PRE=190084 contiguous past RECON30's 190081, +3 inter-run lines; 190084+38103−1=228186 exact).
- Purity: Core-04 prints, Test-passed-1, single local agent. MAXLEN=537 (= cap, zero over). SELHALT 0.
- Build: EA `E4F39359…` (561702 B, SIDE1F_ shadow block + fire watch only, adoption OFF), FlowLogic `3606BFB4` unchanged, both compile 0/0 fresh logs. Build uncommitted; RECON17 frozen.

## 2. Realized delta (close-the-loop vs the pre-run brief)

- Promised gate-at-seed + hierarchy votes + fire watches → DELIVERED: 56 VOTE + 12 SHORT + 4 WATCH = 72 lines, extract `06_HANDOFFS\RECON31_FIXSPLIT.txt` (72 / `9E334313…`).
- Promised everything else frozen → DELIVERED (§5).

## 3. Track-1 grade: PASS + blanket-scope REFUTATION (both load-bearing)

- **Target PASS:** Sep-8 09:15 seed → `t1term=B_BODY t1reject=1` (extract line 64) — the gate would have rejected the 09:15 LONG on his exact London reason. Wiring point (v67-confirmed) proves out on live data.
- **Controls (all seeds recorded with terms; 50 reject=1, 6 pass):** R1 seed 09:55 B_BODY reject=1 (R1 = INFERRED hold — consistent, observation); R3 seed 15:30 A_OPP reject=1; R4 seed 09:00 A_OPP reject=1; R5 NO seed near its 16:40 fire (nearest 14:55 — seed-fire lag spans hours for long pipelines, datum for landing scope); R2 seed 10:35 gate-PASS (R2 = MUST-DECLINE void — pass is correct-non-action, datum).
- **REFUTATION (landing constraint, council's):** R3 FIRED LONG live (R 2.56) and R4 FIRED LONG live (R 1.76) DESPITE gate-at-seed rejecting both their seeds (A_OPP at 15:30 / 09:00 — the seed bar's own prior candle, not the downstream bars the live gate passed). A blanket seed-gate landing would BREAK two fired trades. Track-1 landing must scope to S1/void-class seeds, NEVER blanket. This is the proving run working as designed.
- **Watches 4/4:** fire-bar dirs SHORT/LONG/LONG/LONG = legacy fires identical (R 2.43/2.56/1.76/1.25 with SL/TP byte-identical §5).

## 4. Track-2 grade: FAIL with mechanism (prediction missed, precisely localized)

- **Target MISS:** Sep-8 16:45 seed → `hier=- conf=1` (extract line 69), NOT the predicted SHORT-shadow. No SHORT at the S2 seed on code objects.
- **Mechanism PROVEN working:** 12 SHORT votes print where 4H+1H genuinely agree (all off-example bars); conflict residuals print as designed wherever they disagree (incl. 16:45). The instrument is alive — the prediction, not the plumbing, missed.
- **Site corroboration:** `SEL61SIDE ex=S2 … h1=1.0 m15=-1.0 h4=-1.0` — at the 17:00 SITE bar itself, buffer-4H SHORT vs buffer-1H LONG = conflict too. Seed-bar and site-bar reads AGREE with each other (not a single-bar artifact).
- **Object mismatch (load-bearing for design):** buffer-H1 reads LONG (+1.0) at S2 while his panel-1H read Bear at 16:40. FlowLogic-HTF-buffer semantics ≠ his naked-eye HTF semantics at this bar. The side-fix design must NAME which HTF object governs — "4H+1H" does not agree on code objects at S2.
- **S1 datum:** `SEL61SIDE ex=S1 pinned=SHORT decided=SHORT … TF_UNANIMOUS_1H_15M h1=-1.0 m15=-1.0 h4=-1.0` — at the S1 site even the EXISTING TF rule agrees SHORT (unanimous). The failure there was never the vote — it was the owner ignoring it (RECON30 fork stands).
- **Consequence (council's, never tuning):** Track-2 needs an HTF-object ruling + a seed-vs-site-bar ruling before any landing text. Builder proposes nothing.

## 5. Isolation: PERFECT (31/31 families + payloads + signals + alert-only)

- Full table: `06_HANDOFFS\RECON31_TABULATE.txt` — 31/31 legacy families delta-0 (SEL52 14376, SEL53 168, SLIMB 1465, SLIMBR 16, SEL55 5, A6 2/2/481/2/1/481, GEOM 7/8/1, SIDE1P2 7, SIDE1P3 2, SEL60 3, SEL61 15+7, N1EQUALS 1/1, census finals, CONFIRM families 555/111/198, S2WAIT 138, S1WAIT 54, ANCHOR_ELECT 56/56 — no seeds added/removed). Sole delta: +72 SIDE1F_ lines (56+12+4, pre-declared).
- Payloads byte-identical (tester-prefix transport excluded by method — full-line hashes differ on wallclock/prefix ONLY): SIDE1P2_9 `522C41D7…`, SIDE1P3_3 `CC36EBED…` both archives.
- Signals 4/4 byte-identical vs RECON30: 2.43/1.16508/1.16364, 2.56/1.15907/1.16302, 1.76/1.16098/1.16200, 1.25/1.16218/1.16315.
- Alert-only proven in-run: `SEL61INDEP adopt=0 ordersend=0/0`. N1 save/restore proven (N1EQUALS 1/1 identical).

## 6. Consequences + asks

- For council authorship (when tabled): (a) Track-1 landing SCOPED (S1/void-class), never blanket — R3/R4 refutation; (b) Track-2 needs HTF-object + seed/site-bar rulings — S2 conflict both bars + buffer-vs-panel mismatch; (c) R5 seed-fire-lag datum rides along.
- Asks: NONE now. Landing-authorship relay waits for HIS tokens + word (message-budget rule; a relay without them settles nothing). Next = his landing call or quiet.

## 7. Files

- Archive: `06_HANDOFFS\RECON31-FIXSPLIT_JOURNAL.log` (38103 / 7436166 B / 2702C34B… / [190084..228186]).
- Extract: `06_HANDOFFS\RECON31_FIXSPLIT.txt` (72 / 9E334313…).
- Tabulate: `06_HANDOFFS\RECON31_TABULATE.txt` (35 families) + script `00_CURRENT_WORKING\tabulate_recon31.ps1`.
- Scripts/logs/markers: `launch_recon31_run.ps1`, `compile_side1f_ea.ps1`, `compile_side1f_flow.ps1`, `T162_SIDE1F_EA/FLOWCOMPILE.log` (0/0), `RECON31-FIXSPLIT_STATUS/DONE.txt` (PASSED 20:39:30).

(End — RECON31 graded per-track; no relay; his landing call or quiet)
