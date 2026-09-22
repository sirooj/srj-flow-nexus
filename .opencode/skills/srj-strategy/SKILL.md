---
name: srj-strategy
description: Operator strategy-rules memory for SRJ Flow Nexus. His trading rules in his words plus spec anchors, so the builder never rules strategy from code alone. Load before grading any take/exit, before framing any operator question, and before drafting any relay question.
---

# srj-strategy - his rules, never the code's

Role: the operator owns strategy. The spec records it; his later words amend it. The EA is judged against the rules here, never the reverse. A mismatch between code and this file is an EA finding, never a rule question - unless this file shows no ruling, in which case the record-first gate (spec, restatement, findings, journal) runs before anything is asked.

## 0. Canon order (D3 applied)

Spec Part A v4.2 states the baseline; his later words amend it; council prose never overrules either. His latest word on any point governs.

## 1. Exits (his words, 2026-09-20; amends spec S5.1 touch-exit for managed exits)

- Break-and-retest: a gap of the POC or AVP lines with price breaking through by BODY candle close flips the bias direction and exits (the 8/28 11:35 instance). Touch or retest of a line does NOTHING once entered.
- Normal take-profit: touch exits on session-liquidity, POC, or VWAP targets (touch of the booked TP target; per-bar nearest touches that are not the booked target do nothing).
- Body-close exit ONLY for the early-exit case: a POC gap that flips bias with a break. (His line, recorded verbatim.)
- HTF-flip experiment OPEN for trend setups (his words 2026-09-21, verbatim: "I have an open experiment to not exiting on the HTF bias flip for the trend following setup so at 9/4 setup i could exit next at 5 mins before the day candle close"). Amended point: while the experiment runs, trend-following setups do NOT exit on HTF bias flip; the 9/4 setup exits 5 minutes before the day-candle close. Anchors spec Part A v4.2 section 5.6 toggle flag. SCOPE AMENDED by the universal rule below (day-close exit now every trade regardless of regime; experiment holds flips, decisive exit always near day-close). EA status: F2 toggle drafted in PACKET_P-EXITMODEL-2 v6 (unbuilt, awaiting dual-key clearance) - mismatch vs experiment is an EA finding in the build queue, never a rule question.
- 9/4 classified MEAN-REVERSAL by his word 2026-09-21 (verbatim: "it is also a mean reversal setup so ++ setup from LD.L close"). Flip inapplicable by spec section 5.6 scope directly (mean-reversion setups were never justified by HTF agreement), independent of the experiment; definitive exit day-close-minus-5 (his word - now an instance of the universal rule below). EA divergence: the flip leg ran, so the EA classified 9/4 TREND-or-BOTH at admission - regime-classification divergence, future packet material.
- UNIVERSAL day-close rule (his clarification 2026-09-21, verbatim: "the experiment is about the trend following setup when the HTF flip to the other direction, close or hold. the decisive exit rule is always exit upon near the day close. the rule is 5 minutes before candle close, which has been recorded on the previous session"). Amended point: the experiment tests flip-response (close-or-hold) on trend-following setups when HTF flips the other direction; the DECISIVE exit rule is ALWAYS exit near the day close, 5 minutes before the candle close, every managed trade regardless of regime. Later word amends earlier scope: the F3 day-close leg is universal session discipline, not mean-reversion-scoped; no trade holds overnight by design.
- 9/7 London TP SETTLED by his rule-choice (his words 2026-09-21: booked should be AS.H nearest, not the further yearly VWAP; plus his Q1 answer same day: nearest valid TP wins, family/category disregarded, ledger 536). Settlement: the booked target is the nearest valid target, so the 9/7 London long books AS.H if valid (LOH 9pts validity open, run-graded under PACKET_P-EXITMODEL-2). The 2026-09-17 POI-FIRST fork stands amended; the pending-fork wording above is retired.
- Record: 06_HANDOFFS\BUILDER_FINDING_EXIT-BREAK-RETEST.md. Earlier: EXIT-POCVWAP (entry-anchor POI governs; VWAP sibling flip alone never exits a POC-anchored trade), EXIT-0817 (spec S5.2 relocation + next-open execution), EXITMODEL-1 S6 (six answers; Q6 nearest-recompute superseded by booked-TP discipline above).

## 2. Entries (anchors; details live in the findings)

- A+ strict (standing 2026-09-16): an alert must be as strict as an execution; a single-rule violation means no alert.
- FVG-validity (2026-09-11): dead when wicked through entire range or body-closed through; otherwise the remaining untested range is the POI.
- His declines stand forever (kill-all 2026-09-17; SEP8 manual review; v14-SEL1; v93 quotes). Never present a declined bar as an open question (D1-V4).
- Entry-time facts: 8/28 1.16466 next-open ~10:05 (2026-09-11 correction; D1-V5).
- R boundary inclusive (his words 2026-09-22: flat 1.0 is valid, 0.99 below 1R is not; 7 Sep New York +1.06 valid). Code gate >= 1.0 conformant - no change.
- 9/4 New York valid with dynamic exit (his words 2026-09-22: admission target above 1R, exit may print below since the target is dynamic nearest; journal 0.84 retired flawed, his day-close exit unimplemented). Amended point: exit reference TBD by day-close model; spec L189 (no floor in management) conformant.
- Retest renewal (his words 2026-09-22, ordered implemented): a valid retest hit by session liquidity before 5m retracement + confirmation is void; entry needs a fresh POC/VWAP retest. EA gap proved (no kill transition; absorption finding). Council route pending; never a relay question.
- 8/28 London exit-flaw (his words 2026-09-22: entry correct, exit mechanism flawed). Take valid; exit basis open - exit-mechanism thread, in-scope per exit-only order.
- 9/7 London AS.H exit (his words 2026-09-22: take valid; mechanism wrong exiting at Yearly-VWAP instead of valid AS.H). Proved on RECON51 segment: AS.H 1.16200 first touched 10:50 bar, booked exit 11:15 at 1.16315. Exit-mechanism thread, in-scope.
- Settled never-re-ask (D1-V7 2026-09-22, RECON52 defect): the 1R admission floor is KEPT (spec section 3.7; v141 verbatim) - never ask to revisit it; his valid set replicates-all (v141: 8/28 valid with "R check must not kill it" plus "my valid trades is what i want to replicate"; goal Amendment 4; journal rows 257/277/279/281/283/285 (London + New York takes; 8/28 New York has no row - A1 declined kill-all, corrected 2026-09-22)) - never ask whether fewer takes are acceptable; the micro-line kill is pre-diagnosed (v142 line 198: YPML 7pts/YPMH 23pts/YNYH 9pts beat family targets below the kept gate; v147-149) - resolution space is preference order, builder/council design work, never an operator question. Before ANY take-rate/floor/booking ask, re-read these three pins with his-quote relays; an ask contradicting any of them is a D1 defect, withdrawn never asked.

## 3. Hierarchy and scope

- Family ranks plus AVP-POC over VWAP inside each family (EXITMODEL-1 S6 resolution; MT_EXIT_SCOPE default FAMILY_POC).
- TP booking (his words 2026-09-21, verbatim: "the category of family does not matter. I said the nearest and i do not care anything else"). Amended point: the booked take-profit target is the nearest valid target; family/category disregarded. Amends the 2026-09-17 POI-FIRST fork and settles Q1 in favor of nearest. Future booking-walk work follows this.
- Session levels behind a trade are take-profit touch only, never body-close triggers.
- Alert-only stands regardless. Gains are entry plus exit discipline and only entry grades recall (never argue magnitudes).

## 4. Learning loop

- Every new ruling of his lands here the turn it is given (verbatim quote plus date plus amended point), never carried in chat alone.
- Every builder question answered on record here is a D1 defect, not a relay.
