# BUILDER RELAY v22 — P-LIMBSEAT-1 STAGE-1 grading (dual-key for stage 2)

**Relay version: v22. Answers: Astra-11 (`COUNCIL-v21-STAGE1-CLEAR-FP-LIMBSEAT-1-01`) + Opus-v21 (`COUNCIL-v21-OPUS-DUALKEY-CLEAR-STAGE1-01`).**
**Single live relay. Paste whole. Nothing builds, runs, or commits on this relay — it asks for stage-2 clearance BY NAME.**

## §0. Standing context (compact; full text in v20 record)

His rules: TF rows read HTF-bias-only, MR rows read most-recent-sweep-only (no cross-requirement, alignment adds nothing, never double size).
Stop: 1 swing away with imbalance, 2 away without; wick nuance (uninvalidated block wicked beyond 1-away+block → the wick IS the stop);
pure-two-swings-no-imbalance scoped to ONE trade. S1 side SHORT on 1H+15m bear (4H bull non-blocking). Blanks: (a) first swing before S1 09:40;
(b) 08:40 formation detail at 09:15. Reference stops: R1 1.16508@06:30, R3 1.15847@15:30, R4 1.16098@08:40, R5 FILED 1.16239@16:15
(retained code-under-test 1.16238@16:05), S1 1.16258@09:40. Mode alert-only; take iff R>=1.0 unrounded on Dukascopy data.
Frozen baseline RECON17; P-SEL-1 DEAD; P-SEL-2 DELIVERED (R4 ABSENT / R5 ABSENT-candidate-side / S1 ORDINAL).

## §1. What stage 1 built (prints only, both readings honored)

EA D23505D4 (both compile 0/0 first attempt; FlowLogic unchanged): (a) HAND fixture — the six filed constants now ONLY in
`Include\SRJ\SRJ_HandFixture.mqh`, test-import-only, grep gate PASS; (b) limbs_v2 shadow — verbatim-5-bar L1, non-strict L2 with exact-tie
shelf collapse (eps=0), displacement L3 with the STOP rule's own imbalance idiom (protective imb buffer reads 1); set-valued admitted_by (R1);
L3 listed only when L3-necessary (R2); shadow reads only, outcomes byte-identical by construction (R3); 48h diagnostic window per decision;
(c) F2 discriminator with S-B-HOLDS/S-A-LIVE/HALT-NEWCLASS token; (d) F3 provenance — ordered side-field write-chain (only 3 write sites
in the tree: INIT / DetectPoiRetest / ResetSequence) + meter raw reads at the two Sep-8 bars. DEFERRED to stage 2 per R4 ("may"):
stop_source stamping + one-writer invariant (zero graded benefit, nonzero touch risk).

## §2. Run + D-grade (measured)

RECON22-LIMBSEAT1 DONE=PASSED (Test passed 0:54:56.778; 3168 bars / 563338 ticks; archive 55389 lines, SHA 0B256BA7…, bounds contiguous
from 21b; purity farm-off/cloud-off/Core-04/Test-passed). Width MAXLEN=537=cap, zero exceedance.
D1 14/14 lists present. D2 PASS: unattributed=0 on all 14 summaries, store 892 rows dropped=0. D3 PASS: 481×3+10/10, CTX 599, SEL52 14376,
traces 11817, memo 118, suppressed 152, 4/4 signals **byte-identical vs 21b**, SEL53 matrix identical (G1 0/12, best 2/4 MONO/M5, G2x3=0),
R-values identical, OrderSend 0, adoption false.

## §3. Seven-bar grading vs the frozen predictions

R1 PASS (1.16508@06:30, R=2.429, ordinal path unchanged — no partial regression). R2 PASS (decline, legacy identity). R3 PASS (1.15847@15:30, R=1.661).
R4: **08:40 ABSENT both sides both TFs** (probed over the full 892-row store; neighbours present, H1 window 3 limbs) → **blank-(b) route**
per the packet's specified fail-route; walk still 08:20 (universal miss persists, legacy-identical). F1 not extended, correctly.
R5: **L1 mechanism REFUTED** — no 16:15-lower limb on any switch either TF (16:15-low is not a 5-bar extreme vs its M5 neighbours under strict
OR non-strict; conf==1 excludes L3 by the packet's own definition); legacy list stays 16:15-upper-only; walk retains 16:05 (retm=1, R=2.478);
16:30 anchor unshifted. Fail-condition branch operative, strengthened by the shadow silence. No force-fit (packet forbids). **Council routing owed.**
S1: discriminator **S-A-LIVE both TFs** (M5: exactly 1 limb in [09:40,10:10] = 09:40 itself, l3via=0; H1: 0 limbs) — S-B not held, no halt;
no reseat at stage 1 by design; walk still 09:05. S2: provenance delivered, flip pending stage 2.
L3via=0 run-wide. No REPORT+HALT trigger fired (no timeout, no >1-forming-limb, no unattributed admission).

## §4. F3 provenance finding + F3(5) statement

At both Sep-8 bars: CQD EMPTY, bias meters -1.0/-1.0, carried LONG — and the chain's last-before-bar producer is **DetectPoiRetest=LONG
at both bars** (98/106 entries, 3 producers only, dropped=0). Measurement: the carried LONG was set by the POI-retest detector object,
upstream of the meters; no meter writes to the side field exist. F3(5): **no his-read override exists in this build** (F3 replacement ships
only at stage 2; promotion vacuous). The flagged interaction (promotion must not silently overturn a POLARITY_MISMATCH decline) is owed
at stage-2 clearance.

## §5. Asks

**Ask 1:** Accept the stage-1 record (D1–D3 PASS, R1/R2/R3 controls hold, R4 blank-(b) routing correct, S-A-LIVE, provenance delivered, R3 byte-identity).
**Ask 2:** Rule R5 (L1-for-16:15 refuted — retire, amend, or redirect; builder invents nothing) AND CLEAR stage 2 BY NAME
(frozen F1-switches-as-attributed + F2 S-A origin-limb + F3 resolver with F3(5) interaction stated + F4 single-exit wick + SCOPED_EXCEPTIONS),
with the 7-bar prediction rule restated for the stage-2 run (~1h, flagged now, spent only on dual-key + his word).
**Ask 3:** CONFIRM nothing builds, runs, or commits until BOTH streams name stage 2 + operator run word; RECON17 stays frozen; build stays uncommitted.
