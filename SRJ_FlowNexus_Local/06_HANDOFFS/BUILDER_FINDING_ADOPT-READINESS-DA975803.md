# BUILDER FINDING ADOPT-READINESS — EA DA975803 (2026-09-22, read-only, pre-build gate)

Covers EA Experts\SRJ_FlowNexus_EA.mq5 = DA97580358ED7ACCFB02208BFD9B0ED97185398BC3DC93D55F7AA3366E3742C4 / 616591 B / 11236 lines (v12 live tree, uncommitted). Filed per AGENTS 10.6 (adherence gate before any build/run): rule-by-rule against 06_HANDOFFS\BUILDER_STATEMENT_FUNDAMENTAL_RULES.md, read-only, no canonical touched. Verdict per rule: ADHERE or carried note. No new mismatch found; nothing here re-proves a filed mismatch. The run hour is releasable on this audit.

## 1. Side owner + independence (rules 1-2 of record: TF/MR separate reads)

- REGIME enum EA L227 (REGIME_NONE/TREND/MEANREV/BOTH); votes L2176-L2191 (trendOk/mrOk arms); his experiment flags L130-L131 (F2/MT_HTF_EXIT per his 2026-09-21 words); regime pinned at admission EA L10043 (regimeAtAdmission).
- Detector direction owns candidacy (candidateDirection idiom, EA L7712 context); gate consumes g_dir (184 refs; latch rows carry dir).
- Verdict: ADHERE. Classification divergences (e.g. 9/4 regime note) are packet/grade matters, not adherence breaks.

## 2. Place: POI + sweep (rule 2)

- Anchor lines + POI buffers consumed at admission; MTSNAP EA L10048-L10056 records anchor/entry/sl/tp/regime per take.
- Verdict: ADHERE (mechanism present).

## 3. Validity: divergence latch (rule 3)

- Latch is candidate-level EA L805-L808 (siblings share); verdict fields L838-L840; UpdateDivergenceLatch EA L6194-L6195.
- His read outranks code at grade level (declines inventory never re-asked; A1 moot clauses carried in packets).
- Verdict: ADHERE with carried note (authority sits in record/grade, not as an EA input table — design, council-accepted).

## 4. Stop branch + wick (rule 4)

- Imbalance-aware stop walk EA L2492-L2494, L3335, L3454, L3918 (one-away/two-away with imbalance test).
- Break-retest exit leg EA L11078, L11136-L11138 (his 2026-09-20 words); wick-aware fills EA L557 (WICK_RETURN_ONLY), L1955 (pierce-vs-body hold).
- Verdict: ADHERE. TP-touch scope stays open at council (carried, not a mismatch).

## 5. R gate (rule 5: flat 1.0 valid)

- InpMinRewardRisk = 1.0 EA L57; tpOk EA L9658 (slDist > 0 and ratio >= input); latch EA L9856-L9901 (single-shot, never recomputed); kill EA L9922-L9958 (TP_RR_FAIL_LATCH + abort).
- Verdict: ADHERE (conformant including flat-1.0 boundary via >=).

## 6. Target: nearest valid (rule 6 + his 2026-09-21 word)

- Booked-TP-is-nearest F1 EA L2323 region; consumer E6 site EA L10907-L10914.
- Verdict: ADHERE (F1 live in this tree, RECON52 graded).

## 7. Scope: replace, not alongside (rule 7)

- Single strategy pipeline in tree; no sidecar path present.
- Verdict: ADHERE-by-construction.

## 8. Alert bar A+ strict (rule 8)

- Single-rule-violation kills across the abort set (7+ reasons), veto consume-on-fire EA L9885-L9896, hypothesis-state gating L478+.
- Verdict: ADHERE.

## 9. Adoption state: OFF

- InpAdoptExt1 = false EA L71; ADOPT_EXT1 firmware comment L68; "Adoption untouched (OFF)" EA L4081, L4207, L4363.
- Verdict: ADHERE (adoption off; nothing adopted silently).

## 10. Filed-authoritative (grading authority)

- His filed stops/levels are grading authority (packet G4 cites his lines; result joins vs journal). EA computes swings EA L9857 for the latch.
- Verdict: ADHERE-as-designed (authority split: compute in EA, truth in record).

## 11. Alert-only: no live-money path

- MODE_ALERT_ONLY branch EA L10058-L10068 returns before Phase 2 (no order sent).
- DEMO_GUARD EA L10074-L10076: execute-mode only on demo trade-mode AND recorded login, else abort before sizing/send.
- CTrade decl EA L13 used only past both gates; Buy/Sell EA L10127/L10129 execute as tester-simulated fills under InpMode 1 (the RECON measurement instrument), with concurrency guard L10079 and stops gate L10117-L10119.
- Verdict: ADHERE (no live-money path; simulation inside the tester is the graded instrument).

## Carried (open, council-accepted, not blocks)

- Exit TP-touch scope open at council; full-journal reconciliation open (deployment shut regardless).
- 8/28 New York never valid (A1 declined, moot); journal 0.84 retired flawed.
- Old adopt-audit violation sites (EA:6666/EA:4695) belong to a superseded tree; the rule classes they covered re-audited above (items 1, 4) with no live mismatch.

## Gate release

Adherence audit covers the current digest rule-by-rule. S1 may proceed. No build/run/commit authorized by this file (Luna key + his run word govern build/run; token governs commit).

(End of file)
