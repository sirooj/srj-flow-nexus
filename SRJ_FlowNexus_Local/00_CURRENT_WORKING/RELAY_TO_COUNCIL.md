# RELAY TO COUNCIL (Opus 5) — packaged 2026-09-09, self-contained (Opus 5 has no file access)
The operator pastes this whole file into a fresh Opus 5 session. Everything needed is inline.

RELAY TO COUNCIL — from the builder via the operator. Session report + questions.
Context: the IDE builder (Cline) holds the repository and drafts; council approves;
the operator is relay and final authority. The operator's council access is
trial-limited; this relay is batched and self-contained.

=== SECTION 1: STATE ===
The Task-161 arc is COMPLETE through STEP 2, all compiled 0 errors 0 warnings and
run-verified on the full Tier-1 range (08.14-08.22, EURUSD M5, real ticks):
- STEP 0 (161-REG baseline): WS161_CENSUS fields=15 loads=1728 stores=1728 changes=68
  mismatch=0 - the working-set closure proof (nothing outside the fifteen fields carries
  sequence state across bars). The snapshot created: af5a9bf, tag Task161-baseline.
- STEP 1 (the three removals + the in-play depth): the SL-leg in-play depth reconciled
  across all FOUR in-play copies (ZoneInPlay, ZoneAdoptable, the S3 arming gate, the S4
  re-read displacement); XOB touch made optional (a fromFvg branch at BOTH touch sites -
  a second site was found outside the relayed windows and is declared); both in-zone
  stop guards retired in one edit; CANDIDATE_ZONE_WAIT=9 appended to the enum. Verified
  run: in-play 32-38/47-49 S3 bars (was 11/54 under two swings), signals: 08.17 16:10
  (NEW early admission, R=1.38 - ten minutes earlier than Tier-1's 16:20) + 08.18 14:50
  SHORT R=1.06.
- STEP 2 (the divergence gate): the LATEST-AT-CONFIRMATION rule (the operator's ruling)
  replaced the spec 3.8 permanent latch: UpdateDivergenceLatch walks from the evaluation
  bar back to the candidate's anchor; the FIRST nonzero CQD verdict is the latest; its
  direction-match decides the latch per bar (it clears on opposing, re-arms on matched).
  Verified run: mismatch=0 (changes=59 - the latch values changed as designed), BOTH
  signals held, census identity held.
- The current source digest:
  27569701581f4d6a94e6994ff40b5d59dd1cfc62758ce758279f913c961bd59c (4,179 lines).
  .ex5 127,762 B built from it. Git HEAD 7080c06; the lineage is in the standing state.

=== THE FINDINGS ===
- The operator's trade journal received (the agreement sample): the Tier-1 window rows
  extracted. Findings: the 08.17 candidate agreement (the EA's LONG vs the operator's
  #223 W VWAP CVD=3 valid setup); the 08.18 FALSE POSITIVE (the EA latched CQD code-4
  verdicts at 14:20/14:40 where the operator's journal records CVD=x, NO valid
  divergence); the 08.14 miss (the operator's 0.18R trade); the 08.19/20/21 absence
  agreements.
- The divergence taxonomy (the operator's): codes 1/3 bullish normal/hidden, 2/4
  bearish normal/hidden. VERIFIED from the CQD source (SRJ_CQD_TickBased_MT5 L750-753):
  +1=bull regular, +2=bull hidden, -1=bear regular, -2=bear hidden. The mapping is
  confirmed - the disagreement is in the CQD's DETECTION (which pivot pairs it
  connects), not in the encoding.
- The midline audit: FlowLogic's OB invalidation level = min/max(midline, obOpen) -
  the OB's OPEN modifies the midline criterion (the operator's rule = the pure
  midline). The XOB-PROMOCENSUS data shows obInval=INT_MIN (NEVER invalidated) on
  EVERY XOB across 9 days with isValid=1 - FlowLogic's criterion almost never fires,
  while the operator's midline rule would have invalidated XOBs during the ranges.
- The 08.18 candidate anchored DAILY-POC; the operator's setup was from W POC - the
  EA missed the operator's 18:20 W-POC setup entirely (idle at that bar). The
  anchor-tier/POI-selection rule is OPERATOR-RESERVED.

=== QUESTIONS FOR COUNCIL ===
1. RATIFY the arming-gates-on-in-play implementation: the operator approved (Q2 = do
   what the spec says); the S3 arming's in-play now uses the SL-leg depth per the
   operator's ruling (charter section 9). Confirmed or amended?
2. The DIVERGENCE-DETECTION FIX SCOPE: the CQD's detection produced code-4 verdicts
   the operator rejects. The builder's audit task: compare the CQD's detection
   algorithm against the spec 3.8 + the taxonomy. Council is asked to confirm the
   audit scope, or state additional criteria the operator's divergence definition
   requires that are not in the spec.
3. The XOB-SUITABILITY FINDING (operator-reserved): the 14:10 setup had a valid CQD
   short but NO VALID XOB (the operator's judgment), while the EA's XOB 2159 was
   never-invalidated and in-play per the SL-leg walk. Does council rule on the
   XOB-suitability standard, or does it stay operator-reserved?
4. 155-RT-A: the body read is done (REVISION_62 20.2 extracted); the council's
   directive is awaited.
5. 161-REG ACCEPTANCE: the STEP 0 run done (mismatch=0, loads=stores=1728); council's
   acceptance closes the Task-161 arc.
=== END RELAY ===