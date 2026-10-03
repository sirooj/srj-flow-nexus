# V389 grade — P-RECON74FIX-2 v39

## Intake and fidelity

Two complete, fresh, page-only replies were supplied on 2026-10-02 and filed verbatim in their matching verdict streams under `V389-UJEXEMPT-26` markers. The Sonnet attachment measured 8,799 bytes, SHA-256 `6EA7EB74A133051A71D42293025832FB4FCB5609A5073EE3DDDC8D9CD25439D2`; the GLM attachment measured 17,961 bytes, SHA-256 `D01BD51FA1842CFD959B4BB2769F6FBC48C90BEC4E443BFFF855971D81F0B013`. The filed bodies were read back and compared byte-for-byte with these source texts. Each correct verdict file has one OPEN and one END marker for this round; the other verdict file has zero markers for that seat. No separate operator GO/HOLD signal is contained in either reply.

## Grading

Council section 47 is applied separately to Q1 and Q2.

- **Q1:** Sonnet `CONFIRM` (conditional, page-only); GLM `CONFIRM` (page, with non-gating wording folds). YES + YES grades **CONFIRM on the page**.
- **Q2:** Sonnet `CONFIRM` (conditional on its stated safe-page conditions); GLM `CONFIRM` (page). YES + YES grades **CONFIRM on the page**.

The conditions remain operative. The page does not prove a pin-clean fired path or a 5m sign-change result; the accepted Q2 page describes a non-clearing battery ceiling. For any later run, set `InpDebugLog=true`, retain the P137/P142 negative controls, and require the separate operator-side 5m-series review and later council review before a pin-clear conclusion. The advisory/wording notes remain recorded in the two complete replies. They do not change either seat's CONFIRM verdict or create an EA scope.

## Luna key and boundary

**LUNA KEY: GRANTED for the single proposed build scope** described at v39 P006: `Experts\SRJ_FlowNexus_EA.mq5`; three inserts and two modified lines, net +3; no new inputs, buffers, or handles; `SRJ_FlowLogic.mq5` untouched. The proposed v26 edit set is the scope. This is build-gate clearance based on the V389 Q1/Q2 page confirmations; it is not a run word, does not authorize a tester run or live activation, and does not waive the later 5m-series review.

The key is recorded, but no code was edited, compiled, or run in this grading block. The current workflow still requires the operator's explicit build/run word before exercising the key. No new council round is required before that word: both V389 questions grade CONFIRM, so a V390 relay would add no decision value.

## Disk boundaries

The V39 packet and V389 relay were not changed. The EA remains unchanged. No build, tester run, commit, or push was performed.