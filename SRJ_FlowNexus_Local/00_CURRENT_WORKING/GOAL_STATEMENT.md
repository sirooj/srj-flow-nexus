# OPERATOR GOAL STATEMENT — CHARTER SEED
Recorded 2026-09-08, verbatim from the operator (the project's owner and final authority):

"The EA is working off SRJ Flow Logic but it is not up to my standard. I have a manual
discretionary trading that I want to automate but the current EA does not take the same
trades that I would take."

## What this establishes
- THE GOAL, missing from every consolidated handoff until now: the EA must reproduce the
  OPERATOR'S MANUAL DISCRETIONARY DECISIONS — the same trades, for the same reasons.
- Rev 63 §13.1's "structural agreement 0 of 12" is the measurement of this goal. The goal
  itself was never restated in the record; this file anchors it from this date forward.
- Economic constraint declared by the operator: the master models (Opus 5, GPT 6 Astra)
  are accessed through free-trial aggregators with limited context and limited turns.
  The on-disk handoffs are the context-preservation mechanism, and parts were lost in
  transit. Relay cost is real: masters are consulted sparingly, and the operator is the
  council of record for anything they choose to approve directly.

## AGREEMENT SAMPLE 2 — 2026.08.18 (operator ruling 2026-09-09, verbatim)
"I have a potential NY short from the mean reversal setup on the NY session from W POC
BUT it is invalid CQD divergence." — the operator did NOT take it.

EA behavior (from T161D_JOURNAL.log, the EA's own trace): the EA SIGNALed a SHORT at
2026.08.18 14:50:01 (R=1.06 SL 1.15813 TP 1.15665 Daily-POC NYAM). Trace:
- Seeded 14:15 on a DAILY-POC retest (the operator's setup referenced W POC — a
  DIFFERENT, higher-tier anchor line).
- Zone: XOB 1.15794-1.15813, xobId=2159, promoted 2026.08.18 05:05 (same day).
- The zone was NOT in play per the live test (inPlay=0 — the walk fell back to the
  two-swing depth because the stop reference did not exist for a candidate seeded
  that same bar; the S2POLL stop capture only runs for states S2-S5) — AND THE
  CANDIDATE ARMED ANYWAY: the S3 arming condition does not gate on in-play. This is
  a FINDING against Task 31/Ruling 8's intent (the in-play test is currently
  diagnostic-only at the arming site).
- Divergence: divLatch=0 at 14:15/14:20/14:25; CQD verdict=-2 at 14:30 (bar 14:20)
  -> latched; the sequence then ended without signaling (state=IDLE by 14:40); a
  second sequence re-armed by 14:45 (divLatch=0), CQD verdict=-2 again at 14:50
  (bar 14:40) -> latched -> SIGNAL fired.
- Operator verdict: the CQD divergence was INVALID. The EA latched and fired on it.
DISAGREEMENT LAYERS: (1) anchor tier Daily-POC vs operator's W POC; (2) divergence
validity - the CQD export disagrees with the operator's manual divergence read;
(3) arming without in-play (the in-play gate is not enforced at arming).
The divergence-validity question is OPERATOR-RESERVED (semantic): what makes a CQD
divergence valid or invalid in their manual read is not encoded anywhere in the record.

## AGREEMENT SAMPLE 3 — OPERATOR_TRADE_JOURNAL.csv (received 2026-09-09, 142,627 bytes)
The operator's manual journal: four rows per day (LDN/NY x TF/MR), each with 4H/1H/15m
structure, bias, LQ sweep, POI tier, CVD divergence code, TP, and the acceptance/rejection
reason. Manual input — the operator warns invalid trades may be missing. The CVD taxonomy
(operator's own): codes 1/3 bullish (normal/hidden), 2/4 bearish (normal/hidden).
TIER-1 WINDOW (08.14-08.22), 24 rows:
- 08.14: #217 LDN TF, W VWAP, CVD=x, 0.18R TAKEN (small winner). EA: NO SIGNAL — a MISS.
- 08.17: #223 NY TF, POI=W VWAP, CVD=3 (bullish hidden), TP=AVP, "or full L" — VALID
  SETUP. EA: SIGNAL LONG 16:20 Weekly-VWAP R=1.42 — CANDIDATE AGREEMENT (direction,
  session and POI family match; structural comparison pending the TradingView shots).
- 08.18: #228 NY MR, LQ=LD.H, POI=W AVP, CVD=x (NO valid divergence), TP=S LQ — NOT
  TAKEN. EA: SIGNAL SHORT 14:50 R=1.06 — FALSE POSITIVE: the EA latched CQD code-4
  (bearish hidden) verdicts at 14:30 and 14:50 where the operator's CVD is x. The
  14:10 potential short (valid CQD short, NO VALID XOB) is not journaled as a row
  (operator caveat: invalid trades may be missing) and was not taken; the EA armed on
  XOB 2159 (promoted 05:05) which the operator does not consider valid for this setup.
- 08.19: all four rows empty; EA: no signals. AGREEMENT (absence matches).
- 08.20: #235 NY TF, D VWAP, CVD=x, "short invalid CQD and less than 1R" — NOT TAKEN;
  EA: no signal on 08.20. AGREEMENT (absence matches).
- 08.21: #237 LDN TF, D AVP, CVD=x, "less than 1R and invalid CQD" — NOT TAKEN; EA: no
  signal on 08.21. AGREEMENT (absence matches).
TALLY: EA 2 signals; operator 1 taken trade + 1 valid-setup row (#223) + 2 rejected
(#228, #235/#237). AGREEMENTS: 08.17 candidate match; 08.19/20/21 absence matches.
DISAGREEMENTS: 08.18 false positive (divergence encoding — EA latched code-4 where the
operator records none); 08.14 miss (the 0.18R trade).
CRITICAL PATH: the divergence encoding. The CQD exported code-4 verdicts the operator
validates as none. The CQD indicator's divergence detection (SRJ_CQD_TickBased_MT5) does
not match the operator's classification. The operator also distinguishes "ordinary
imbalance" from "FVG" — the spec/code do not carry that distinction.
The screenshots (08.18 14:10 and 11:17) show the bias panel at 15m=Bear with OB=x, FVG=x
and the 2xOB label - the bias-engine OB state is distinct from XOB promotion validity.

## Status
- Builder knowledge inventory taken 2026-09-08 (see builder reply of the same date).
- **Part A Specification v4.2 — RECEIVED and FULLY READ, 2026-09-08.** Location: this
  folder, 36,202 bytes, 396 lines (operator-placed). Rev 63 §0 recorded it as absent from
  the session and "demoted"; the operator has now made it the repository's strategy
  document of record. It is "outdated but basic": the origin document, predating
  improvements that were later lost in translation.
- It contains the operator's own method: the seven-step entry workflow (§3), the exit
  model (§5), concurrency and throttling (§6), the no-dimensionals prohibition (§0),
  the implementation-status table (§8), the unknowns (§9), and the permission
  vocabulary (§10). §9.7 is the origin of "structural agreement 0 of 12."
- §8's table is the charter's first work list. Two ready-made packages: "one export
  serves three rules" (the OB promotion bar) and "three removals serve four rules"
  (widen in-play window, make XOB touch optional, permit in-zone stops — no new export).
- Operator explanation of the discretionary method: the Part A Spec IS that explanation.
  Charter drafting proceeds from this file + the spec.

## AMENDMENT 2026-09-09 — THE 08.20 TALLY CORRECTION (operator correction; AGREEMENT SAMPLE 4)
The operator's correction, verbatim: "You read the journal wrong, but the good news is i
actually took the same trade on 8 20 london long from D VWAP."
Row #233 EXISTS (OPERATOR_TRADE_JOURNAL.csv line 234, verbatim fields): 8/20/26, LDN, TF,
Bull/Bull/Bull, 🐂, LQ Sweep (empty), POI = D VWAP, CVD = 3, TP LQ = S LQ, <4 chart links>,
1.61, <2 more links> — TAKEN at R=1.61.
The tally above ("08.20: #235 NY TF ... NOT TAKEN; EA: no signal on 08.20. AGREEMENT
(absence matches)") and BUILDER_RESULT_161-K's "the operator's journal has NO 08.20 LDN
row" were WRONG — the builder mis-read the journal. Corrected by this amendment in place;
the originals above are preserved as the record of the error.
THE AGREEMENT (T161K, run-verified): EA SIGNAL 2026.08.20 09:35:04 LONG Daily-VWAP
LONDON R=1.60 SL 1.16733 TP 1.16837. Agreement on: session (LDN), direction (LONG),
setup (TF), POI tier (D VWAP = Daily-VWAP), CVD code (3 = bullish hidden = the EA's +2
latch that fired the signal at 09:35:04), R (1.60 vs 1.61). THIS IS AGREEMENT SAMPLE 4 —
the first COMPLETE taken-vs-signaled trade match in the Tier-1 window.
Remaining deltas (layers, not disagreements yet): the TP reference (their S LQ vs the
EA's nearest-POI 1.16837) and the entry/exit layers that await the §5 exit model
(charter STEP 4).
TIER-1 TALLY AFTER CORRECTION: 08.17 candidate agreement (the operator addressed the
trade; entry-timing/CVD layers settled on their side; the exit = STEP 4, unbuilt);
08.18 AGREE (the false positive eliminated in T161J; the 18:20 W-POC short absent on
BOTH sides — and the record corrected: the EA was not idle that bar, see
BUILDER_FINDING_ANCHORTIER-1.md §8b); 08.19/08.21 AGREE (absence); 08.20 AGREE
(this sample); 08.14 MISS (BUILDER_FINDING_0814-MISS.md — the EA armed the same-bar
setup and killed it with the 2-of-3 rule plus the divergence latch; two operator
questions pending).

## AMENDMENT 2, 2026-09-09 — THE 08.14 RECLASSIFICATION (operator correction, Q5 answer)
The operator corrected the #217 reading, verbatim: "...what i meant with the 0.18R is i
document the invalid trade that was less than 1R and invalid CQD, but i write the 0.18R
not with the same column with the Gain % but in the comments section."
The row's Gain % is EMPTY; "0.18R <link>" is the COMMENT column. The row documents an
INVALID trade by the operator's own standard: invalid CQD (CVD=❌) AND less than 1R.
TALLY CORRECTION: "08.14: #217 LDN TF, W VWAP, CVD=x, 0.18R TAKEN (small winner). EA: NO
SIGNAL — a MISS." is SUPERSEDED. 08.14 = the operator-documented INVALID setup; the EA's
no-signal (divergence latch CLEAR on the invalid CQD; the 2-of-3 kill besides — see
BUILDER_FINDING_0814-MISS.md §6) AGREES with the validity standard.
TIER-1 VALIDITY PICTURE AFTER BOTH AMENDMENTS: 08.14 agreement (invalid setup -> no EA
signal); 08.17 candidate agreement (entry/exit layers = STEP 4); 08.18 agreement (no
false positive; the 18:20 suppression ruled correct); 08.19/21 absence agreements;
08.20 AGREEMENT SAMPLE 4 (complete). NO VALIDITY DISAGREEMENT REMAINS IN THE TIER-1
WINDOW.

## AMENDMENT 3, 2026-09-09 — THE 08.20 TP LABEL CORRECTION (builder correction of record)
Amendment 1's phrase "the EA's nearest-POI 1.16837" is WRONG and is corrected in place:
1.16837 is ASH — the Asia Session High, a SESSION-LIQUIDITY level — the EA's session
group target, i.e. the operator's own "S LQ" family, not a POI line. The mechanism and
the residue (R-Q12; which session level "S LQ" denoted) are measured in
BUILDER_FINDING_0820-TP.md. The agreement verdict of Amendment 1 (08.20 = AGREEMENT
SAMPLE 4, complete) is unchanged.