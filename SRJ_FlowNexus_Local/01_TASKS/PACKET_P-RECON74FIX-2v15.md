# PACKET_P-RECON74FIX-2 v15 DRAFT - B2-kill exemption for fresh-reseeded seeds (one behavior change; build gated on new key + run word; nothing builds/runs/commits on this file)

Status: v15 DRAFT (his Rebuild order 2026-09-30 + V354 dispositions + RECON77 CARRY lifecycle rows; design: reseed-proven seeds skip the B2 kill into promotion, kill path otherwise intact; base = v29 tree 977B0FB5/684499/12295; STAGE-1/S3 disciplines attach; build needs a NEW key + his run word, neither spent nor asked here).

Canonical files: Experts\SRJ_FlowNexus_EA.mq5 ONLY (1 modified line below; indicator + FlowLogic untouched). No new inputs, no new buffers, no new handles, no new state (predicate rereads the v14 CARRY value only); one modified condition, zero added lines, zero deleted lines.

## Authority (his words verbatim + disk, no invention)

- His Rebuild order (s7 REBUILD-ORDER, 2026-09-30, verbatim: "Rebuild but refer to the older more correct build"). Amended point: restore the 09:45 admission path (v26 RECON74 T2: BYPASS+PREBIND at the 09:40-bar) while KEEPING the 8-June kill (T4 invalid winner stays dead per NO-OVERFIT). This packet is that order's first behavior round.
- V354 Q1(a) "kill-stands" SUPERSEDED on this point by canon order: his Rebuild order (2026-09-30) is later than the V354 ruling and amends it for the reseed-proven path only; the kill stands everywhere else (8-June class, never-reseeded class). Council prose never overruled; his later word governs.
- V356 Q1 2-0 CONFIRM CLEAR (telemetry parent): the CARRY value this design reads was ruled and proven on RECON77 (60 UJPROV rows, lifecycle join in the result file).
- Strategy pins (section plus verbatim, GATE-NEEDS-PIN satisfied; no pin = no gate, and every gate below quotes one):
  - SEED-CARRY EXPECTATION (s5, verbatim: "how did the 5th build take it"): seeds persist across unconfirmed bars to confirmation. Authorizes restoring the killed seed to the confirmation bar.
  - BIAS-SOURCE-INSTANCES (s8) with CHART-READS-6/5 verbatim (s7, verbatim: "The 1H is bearish [Image 1] and the 15m is also bearish [Image 2] hence the valid short"): 5 June SHORT valid on 1H bear + 15m bear; 8 June SHORT invalid on 5m bullish flip during setup. Authorizes the 6/5 restore and the 8-June keep as two instances, never a hierarchy rule (hierarchy stays OPEN; no gate here encodes it).
  - CHART-READS-6/5 (s7): his 1H+15m bear reads govern; the LTF-bullish-as-truth read is withdrawn as prime suspect. Authorizes not trusting the sb=0 kill as his bias.
  - NO-OVERFIT (s2, verbatim: "i am not trying to overfit this test window by having the best result or 100 percent winrate, i want you to apply my rules as is although it is a losing trade such as on the 9/8 NY session"): valid losers taken, invalid winners rejected. Authorizes keeping every kill the pins do not lift (8 June + never-reseeded).
  - CONFIRMATION-CANONICAL (s8, verbatim: "keep it either valid retest rouch or break with a candle body close"): the restored seed still passes confirmation geometry; this packet changes no confirm predicate.
  - CONFIRM-ONCE + TIMING-N/N+1 (s2, verbatim: "the latest D POC retest is at 9:35 and then the confirmation candle is the 9:40 and the EA should enter at 9:45 open candle price"): 09:40 confirmation bar evaluates at the 09:45 pass, entry 09:45 open. Authorizes the predicted path endpoint.
  - BOOKING-INNOCENT (s2): booking never causes a selection miss. The predicted take books per standing rules; booking is untouched.

## Settled-rules audit (RULES-COMPLETENESS output; every mechanism touched maps to a pin, every pin on the path is dispositioned)

- S5.4 pre-confirmation body-break + S3.3 flip-kill: run downstream of the edit, untouched, still fire on the promoted path. Disposition: carried, no fence.
- S5 election + R-at-open 1R floor + nearest-TP booking: downstream, untouched. A promoted seed that fails them still refuses. Disposition: carried, no fence.
- Confirm predicates (A2/BODY): untouched. The 09:40-bar read decides admission on tester values. Disposition: carried, no fence.
- R2 renewal (MEANREV void): untouched; unclassified seeds default-keep per TREND-SWEEP pin. Disposition: carried, no fence.
- One-take-per-session: untouched cap; at most one take per session whatever promotes. Disposition: carried, no fence.
- 8-June keep: the kill stands where CARRY is unset (5 kill rows, all unset-proven). Disposition: keep, negative control in acceptance.
- EU sibling check: no August run on this packet (structural fence, same as v14). EU takes-move watch rides a future word plus key scope, never this run.

## Record-first trail (spec + restatement + findings + journal + segments searched before council)

- Spec Part A v4.2: confirmation geometry in his later words (s7/s8); S5 election + R floor conformant, unchanged.
- Findings: RECON77 result (behavior-neutral PASS + lifecycle PROVEN: 10 surviving reseedBar values, carry/stale/clear joins) + V354 dissent dispositions + RECON76 result (B1/B2/B3 mechanisms).
- Segments: RECON77-V29-UJ (AABDBD53/6172800/32086; death rows below) + RECON74-V11-UJ (v26 T2 reference: BYPASS+PREBIND 09:40 path).
- Journal: no new rows rule these venues (register B1-3 stand).

## Death chains (reference behavior, all on-segment RECON77 unless noted)

- B1 death-row-in (5 June London USDJPY SHORT, his frame: retest 09:35 bar, confirmation 09:40 bar, entry 09:45 open 159.948 R2.00 TP 12:15): R01 UJRESEED 09:15 (al=0 ok=1) + R03 UJPROV 09:15 (seedBiasAl=0, reseedBar=09:15 fresh) + R02 KILL 09:15 same pass + R12 UJOPCONF 09:15 (opConf=0 heldConf=0) + R04/R05 KILLs 09:30/09:35 + R06 CONFIRMPOLL 09:35 (confirm=0) + 09:40-bar absent run-wide (0x, dead seed). v26 reference (foreign-build, HYPOTHESIS source only): 09:40-bar confirm=1 then BYPASS+PREBIND then ADMIT.
- B1 death-row-out (predicted): KILL rows at 09:05/09:15/09:30/09:35 gone (0x); S2PROMOTE_M15 rows at those bars (proof of promotion); PROV reseedBar=09:15 persisting to 09:40 (seed alive); 09:40-bar CONFIRMPOLL evaluated at the 09:45 pass (outcome observed).
- 8-June keep (his frame: invalid SHORT, never a take): R07 KILL 09:25 + R08 PROV 09:25 (reseedBar=1970-unset) + 4 further 8-June kills, all unset. Predicted: all persist (kill path alive). 6/9 09:50 kill (R10, unset) persists as second negative control.
- 16:00 interaction (6/5 LONG kill on SHORT-ancestry value): R09 KILL 16:00 + PROV reseedBar=09:15. Exemption fires (nonzero, direction-blind by design). Predicted: S2PROMOTE at 16:00; downstream decides; the 16:55 take watched same-vs-moved; falses binding below.
- B3 watch (11 June NY USDJPY LONG, his frame: retest+confirm 14:35 bar, entry 14:40 open 160.524 R1.75 booked YLOH): R11 KILL 14:45 (SHORT seed, reseedBar=10:35 LONG value) + PROV same + CONFIRMPOLL 14:35 (confirm=0, 3pts). Exemption fires (nonzero, cross-direction). Predicted: S2PROMOTE at 14:45; admission still gated by term (margins); no SHORT take (falses binding).
- Churn promotions (6/2, 6/4, 6/9, 6/10, 6/12 kills, all nonzero CARRY): kill-to-promote row flips; no takes predicted (downstream gates + session cap); watched by falses-0.

## Edit set (exact anchors; STAGE-1 censuses each; 1 modified line; convention: NET per site = new minus old)

- FIX EXEMPT (S2 edge, the B2 condition; siting: the single if-condition line EA-8413, 9sp, between the UJPROV print EA-8412 above and the PROMOTE block EA-8414 below; no other line touched):
```mql5-old-EXEMPT
         if(uj_m15r && uj_m15b == uj_wantb && s1g_seedBiasAl != 0)
```
```mql5-new-EXEMPT
         if(uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || g_ujOpReseedBarTime != 0))
```
(Scope: g_ujOpReseedBarTime file-scope decl EA-303 + SET EA-7899 + PROV-read EA-8412 in the same function Evalu
ateClosedBar (param EA-6931); order H1-before-S2 on the pass path; compiled-tree oracle (v14 SET/PROV lines already read/write it, 0/0). No new writes anywhere (write-census: this edit adds a READ of CARRY; the only CARRY writes remain EA-7899/10727, unchanged).
- Census: CARRY sites after edit - EA-303 decl, EA-7899 write, EA-8412 PROV read, EA-8413 new read, EA-10727 CLEAR write. S32: modification class (not insert); old-1x/new-0x proven above; already-applied n/a.

## Interaction (carried gates met on paper, fire behavior named, not just sites)

- LTF_MISALIGN abort downstream: SHADOW_EXPIRE precedent (RECON77: 3 session closes on LTF-opposed seeds) proves the abort guard fires per-bar on promoted paths. The exempted 6/5 seed promotes into S3 where the LTF abort may fire before the 09:45 pass - predicted alternative path, watched by promotion-vs-abort rows (S2PROMOTE vs ABORT rows at 09:15-09:40). Promote-then-abort cycling prints S2PROMOTE followed by ABORT, never a silent stall.
- One-take-per-session cap (s5 pin): at most one take per session whatever promotes; a second promoted seed in the same session cannot take while one is floating-armed. No global direction lock broken.
- 16:00 LONG watch: cross-direction promotion (SHORT-ancestry value). Predicted S2PROMOTE at 16:00; the standing 16:55 take watched same-vs-moved; falses binding below covers any extra take.
- 14:45 SHORT watch (B3 venue): cross-direction promotion (LONG-ancestry value). Predicted S2PROMOTE at 14:45; no SHORT admission (falses binding); the LONG term question stays with E2/feed work.
- Churn promotions (6/2, 6/4, 6/9, 6/10, 6/12): kill-to-promote flips with no takes predicted; each watched by falses-0.

## Scope-disclaimer (sibling cases this guard cannot see, pinned outright)

- B2 detector gap (no retest 16:05-16:40): untouched path, separate entry-gated packet, never this kill fold.
- B3 margins (1-2pt strict/armed): untouched predicates; exemption restores the path, not the term.
- E2 touch-or-break predicate: parked with cause (needs EU sibling check + council ruling; one behavior per round).
- Direction-scoped exemption (reseedDir-gated variant): parked with cause (needs a new stored var + SET/CLEAR writes = bigger fence; dir-in-scope at EA-7899 unproven; council may demand it under Q2).
- 6/9-and-later churn takes: watched, none predicted.
- EU takes: no August run on this packet; EU move-watch rides a future word plus key scope.

## Acceptance (FIX-2v15 validation on a future UJ 6/1-6/13 run; proof-rule + routes + envelope)

- Proof rule: hypothesis terms become grade assertions only where converted into a named predicate below (H-TAKE); all other expectations are observational and cannot independently fail a venue. Row enumerations below are exhaustive for the named sets.
- Binding must-match predicates (grade asserts each; any miss FAILS the round): P-KILLOUT (KILL rows at 6/5 09:05/09:15/09:30/09:35 = 0x, two-pattern vs PROV-at-bar), P-PROMOTE (S2PROMOTE_M15 rows at those bars, 1x each), P-KEEP (KILL rows at 8/6 09:25/17:30/17:35/17:45/18:00 + 6/9 09:50 persist 1x each), P-CARRY (PROV reseedBar=09:15 rows spanning 09:15-09:40), P-PARITY (takes 6/3 + 6/5-16:55 row-identical, balance 10027.13, signals 2 same bars), P-NOFALSE (tester takes beyond {6/3, 6/5-16:55, H-TAKE} = 0x; 8 June silent).
- H-TAKE (hypothesis, v26-sourced, labeled): 6/5 London SHORT admission at 09:45 open 159.948 via 09:40-bar confirm + BYPASS + PREBIND. If the 09:40-bar reads confirm=0 on tester values, the round records a UJ finding (term/feed) and H-TAKE is withdrawn without failing P-predicates.
- Route per venue: B1 exemption-at-S2 (this packet) + term-at-confirm (E2 round or feed procedure); B3 term-owned (no prediction change); B2 detector-owned (no prediction change); 8-June preserved-invalid.
- Sibling envelope: this proof is UJ June only (single run, own key scope); EU behavior is a separate sibling proof under its own word plus key scope.
- H1-expiry: UJHOLDEXPIRE + ABORT_HOLDER_EXPIRED two-pattern zero carried as watch.

## Fold map (V354 + V356 dispositions; every demand adopted, parked, or refuted)

- Adopted as behavior: reseed-proven exemption + keep-kill scoping + cross-direction watches (this packet); UJ-RERESEED predicate + arm-offline-derivation as grade procedure (carried, no code).
- Parked with cause: E2 touch-or-break (needs EU sibling check + ruling); direction-scoped exemption (needs dir-scope proof + ruling under Q2); anti-flip guard (needs his session-scope word); wrapper alternative (own round); 8-June counterfactual (needs his 8/6 chart or stays row-based).
- Refuted/declined with cause: blind v26 revert (returns the 8-June invalid winner); B2 removal without exemption (same reason); predicate-only 6/5 fix without the kill question (B_BODY-alone never admits while the kill stands upstream).
- Standing better-mechanism answers: GLM B-1 anti-flip parked (session word owed); B-2 wrapper parked (own round); B-3 pins parked (chart join owed); Luna hardenings parked (future round).

## Budget recount (mechanical): E-EXEMPT old 1 line / new 1 line / NET +0. Total NET +0 vs v29 12295; final tree 12295. S3 recount governs at build (no new inputs/buffers/handles/state - the new line reads existing state only).

## Run cost and novel evidence

- No run proposed (draft round; build gated on a NEW key + his run word, neither spent nor asked here). Cost when gated: build + ~50m UJ June window (measured RECON77 0:48:09) + grade battery; key scope per seat (one build + one UJ run; EU sibling needs its own word + key scope).
- Novel evidence vs RECON77 (why-not-last-time): kill-to-promote row flips at 6/5 09:05/09:15/09:30/09:35 (no prior run promotes a killed seed); first 09:40-bar confirmation evaluation on the v29 tree; keep-kill rows proving the guardrail survived its first behavior round.

(End of file - total 100 lines)