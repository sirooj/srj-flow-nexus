# BUILDER_FINDING_SWEPT-ABSORPTION (2026-09-22, read-only, his hypothesis tested, no ask)

## His hypothesis (verbatim, labeled HYPOTHESIS not ruling; ledger 557)

"my suspicition is that the sessional liquidity high or low does not get deleted. once they are sweep with even candle wick, they are deleted in the sense of absorption. and i need another or newer POC or VWAP touch to renew the entry POI, meaning if a setup has a valid retest and then hit the sessional Liquidity before a valid 5m structure retracement and confirmation, i need another POC or VWAP retest."

## Record-first trail (no source answers it whole; each answers a part)

- Spec Part A v4.2 section 3.7 L187: "A target is valid unless (a) already swept as session liquidity, or (b) closed over." His absorption rule MATCHES spec - the rule is settled, only its implementation is in question.
- BUILDER_FINDING_0820-TP.md: census "admitted=" applies EMPTY + DIRECTION only (not mask, not zone) - census presence never proves validity; R-Q12 (live-session filter not in spec) open.
- v142 line 36: prev-day session swept bits 14..21 unwired ("no FlowLogic export sets them this stage -> admitted; future sweep detection wires here").
- FVG-validity (2026-09-11): POI dead when wicked through entire range - wick-standard precedent on his side.
- Journal ABORT reasons this run (7 values, machine-grouped): LTF_MISALIGN 25, FRESH_OPP_FVG 9, SESSION_CLOSED 11, FRESH_VETO 2, FRESH_OB_DEAD 10, TP_RR_FAIL 11, NO_TP_TARGET 2. FRESHSKIP single reason PRE_BINDING (202x). No liquidity-touch kill exists anywhere.
- EA source has zero "liquidity" references (case-insensitive grep, 0 hits).

## Code proof, both ends (current tree DA975803 + frozen FlowLogic + includes, read-only)

- Consumer EA L2261-L2275 (TpSessionLevelFiltered): prev-day indices 10..17 map to swept bits 14..21 with the comment "no FlowLogic export sets them this stage -> admitted". Pool map EA L2284-L2292: 10..17 = PD_ASIA/PD_LONDON/PD_NY/PD_PM H/L.
- Producer FlowLogic L1371-L1392 (buffer 29): sets bits 0..9 (swept) + 10..13 (live) ONLY. Bits 14..21 never set - verified at the producer.
- State SRJ_Sessions.mqh L346-L435: sweep test is WICK-based (high[i] >/low[i] < plus small buffer) for prev-day H/L + all current sessions. Wick-standard already implemented where wired.
- State inventory: NO prev-day-session swept fields exist anywhere (include-wide grep empty). The state is not even represented.
- The four block-causing F1 winners all sit in the unwired band: YPML = idx17/bit21, YLOL = idx13/bit17, YPMH = idx16/bit20, YNYH = idx14/bit18. Structurally never deleted, whatever price did.
- Renewal half: seed path EA L7679-L7696 carries g_anchorLine through S1-S5; NO transition retires a seed on a session-liquidity touch (abort set above is exhaustive; detector L1920 re-fires fresh per bar but live seeds persist). His renewal rule is unimplemented - no in-window instance claimed (none traced; labeled open, packet-run-grade work).

## Bar proof (formation-aware close brackets, body-standard; wicks invisible in-journal)

- 08-28 10:00 YPML 1.16459: 8/27-8/28 London closes min 1.16445 below line = SWEPT-BODY. Block R 0.17 on a dead line.
- 08-28 16:20 YLOL 1.16416: closes min 1.16422, never below = NO body-sweep (wick unknown).
- 09-04 15:55 YLOL 1.16188: 9/3-9/4 closes max 1.16291 above line = SWEPT-BODY. Block R 0.99 on a dead line (his +0.84 take).
- 09-07 09:15 YPMH 1.16158: 2 closes only, max 1.16116 = NO body-sweep (thin samples, wick unknown). His AS.H admitted + mask-valid, loses nearest race.
- 09-07 16:40 YNYH 1.16270: closes max 1.16329 above line = SWEPT-BODY. Block R 0.39 on a dead line (his +1.06 take).
- 09-08 10:05 YLOL 1.16102: closes min 1.16110, never below = NO body-sweep. Take R 1.94 on a fresh line - consistent.
- 09-08 16:55 YPML 1.16210: closes min 1.16106 below line = SWEPT-BODY (blocked both runs regardless).

## Reading (adversarial alternatives closed)

- Confirmed (his suspicion holds): 09-04 + 09-07 New York blocks booked body-swept dead lines; 08-28 London likewise (plus his daily-POC line absent from both pools - coverage flag stands).
- Not resolved by absorption: 08-28 New York NEVER valid (A1 declined kill-all 2026-09-17; moot for absorption - corrected same turn) + 09-07 London (fresh by thin closes vs his admitted AS.H) - residue for preference-order (R-b, parked) or wick-joins.
- FVG-analogy holds: wick = touch = consumed, both asset classes.
- Buffer size (g_liquiditySweepBufferPoints value) open detail, non-blocking: test shape is wick-based either way.

## Packet direction (authority: his proceed + spec L187 + his absorption words)

- Validity fix, NOT booking redesign, NOT gate change: wire prev-day-session sweep detection at the producer wick-standard (mirroring L346-435), consume bits 14..21 in the existing filter (comment already reserves them), retire seeds on pre-confirmation liquidity touch per his renewal rule. 536-nearest-VALID then skips dead lines; kept floor then passes his live lines (9/4 R 1.74, 9/7pm R 2.34 on admitted family targets). Exit-only scope preserved (no booking-order, no gate, no exit-leg change).
- Needs: council packet + token + run word + his transport in a later turn. Run-grade step named now: wick-join per bar (h/l history) for the two unknowns + renewal instance trace. This finding supersedes R-a (menu-conformance) as the sharper mechanism; R-a stays parked on his challenge.
- Cost of the eventual run: same envelope as RECON52 (~50 min measured). No run requested now.

## Non-asks

- Validity rule: settled (spec + his words). Booking order: settled (536). Floor: settled (KEEP). Valid set: settled (replicate-all). This file asks nothing.
