# COUNCIL RESPONSE — POI-R (Opus 5's design, relayed verbatim by the operator 2026-09-10)
File: c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\COUNCIL_RESPONSE_POI-R.md
Provenance: the operator relayed the flagship council's reply to BUILDER_RELAY_COUNCIL_POI-R.md
(C1-C5). Verbatim below between the markers. The council designed from the relay (not the
source) and asked the builder to VERIFY every line anchor against the file — the builder's
verification addendum follows the verbatim block. The council's four open questions (at the
end of the verbatim block) are STRATEGY questions -> THE OPERATOR.

--- COUNCIL REPLY (verbatim) ---

## Lead finding: your two failures are not co-equal, and C2 alone would make 8/28 worse

I'm designing from your report and log excerpts, not from the source — I haven't read the EA, so treat every line anchor mapping below as a proposal to verify against the file.

Run the 8/28 arithmetic before committing to a TP rule. From your verbatim lines:

| bar | close | tp (NYL) | tpDist | slDist | R |
|---|---|---|---|---|---|
| 10:20 | 1.16426 | 1.16364 | 0.00062 | 0.000549 | 1.13 |
| 10:25 | 1.16421 | 1.16364 | 0.00057 | 0.00060 | 0.95 |

Now substitute the operator's AVP (~1.16380) at the same bars: tpDist becomes 0.00046 / 0.00041, and R drops to **0.84 / 0.68**. The AVP is *closer* than NYL. Swapping the TP line to the family AVP does not rescue 8/28 at those bars — it kills it harder.

Solve for what produces 1.21R with TP = 1.16380 and slDist = 0.00060: entry ≈ **1.16453**. That is a next-open somewhere around 10:05–10:10, not 10:30. Note also that slDist *grew* 0.000549 → 0.00060 between the two bars, so the swing reference was still moving while the ladder waited on `divLatch`.

Conclusion: **the R defect is downstream of the entry-timing defect (C4), not a TP-selection defect.** The EA arrived at the decision 4–5 bars late, and by then no TP choice could produce R ≥ 1. C2's TP-class change fixes *which line*; C4 fixes *which bar*; the latch preserves the value once the bar is right. Fix order must be C4 → C1 → C2, not the reverse.

Please confirm the 8/28 journal entry and stop from your records — the 1.16453 entry is reconstructed from your 1.21R claim, not verified.

## The unified defect class

All three symptoms are one thing: **the EA binds its critical references by machine arrival order instead of by your ruled selection criteria.**

| reference | bound today by | should be bound by |
|---|---|---|
| anchor line | which retest fired first (L3163-3193) | highest authority among valid retests (rank table L82-93) |
| TP line | nearest admitted line (L1706) | family AVP class |
| entry bar | wherever the ladder completes (L4007-4042) | next open after a confirmation candle |

That framing is what makes this a root fix rather than three patches: one election principle applied at three binding sites.

## C1 — Supersession: both, via one election function

Answer (c), but not as two code paths. Implement one `ElectAnchor()` and call it at seed and per-bar while pre-fire.

**RetestBook.** Demote `DetectPoiRetest` (L1446-1488) to a pure detector that writes an entry for **all 12 lines every bar** — line id, rank, direction, retest bar, expiry. It stops being consulted only for the seeding line. The singleton stays at the candidate level; suppression moves from *don't look* to *don't promote*.

**Seed** (L3163-3193): `argmin(rank)` over unexpired, direction-consistent, confirmation-qualified entries. Ties → authority, then proximity, then earliest retest bar.

**Live re-bind** (the 9/4 case): while pre-fire, a strictly-better-rank same-direction unexpired entry replaces the anchor. Re-derive SL_REF from the new anchor's swing, re-elect TP, re-run the anchor-relative legs.

You need both: (a) alone cannot fix 9/4 (the Yearly retest arrived at 15:45, ten minutes after the 15:35 seed); (b) alone leaves same-bar multi-retest seeds mis-bound.

**Ladder reset policy on re-bind:** keep line-agnostic progress (regime, LTF bias — properties of the market), recompute anchor-relative legs (zone, SL_REF, TP, confirmation). This is what keeps 9/4 alive: regime/LTF already passed at 15:35, so the 15:45 re-bind only re-runs zone → confirm → gate against the Yearly POC and its own swing.

**Direction guards** (all hard vetoes):

1. `opp=1` → never supersede. The 15:40 Yearly SHORT against a held Monthly LONG stays suppressed. Reuse the existing flag at L3267 unchanged.
2. Candidate direction is immutable for its lifetime. Supersession swaps the anchor and its references, never the direction.
3. Rank must be **strictly** better. Equal rank = no re-bind, which prevents POC↔VWAP thrash inside one tier.
4. No re-bind after fire.
5. Bounded window: supersession only within the existing setup window, as a named input so verification can freeze it. Otherwise a Yearly retest hours later hijacks a stale candidate.
6. Same session block (London vs NY) as the held candidate.
7. The superseding retest must itself have passed the L1446-1488 body-side test in the candidate's direction — touched is not enough.

Split the log at L3267 into `ANCHOR_SUPERSEDE` / `SUPPRESSED_OPP` / `SUPPRESSED_LOWER`, keeping the existing field set plus `action=`.

## C2 — TP/R reference: option (b), latched

**Which line.** Restrict the TP selector to **AVP-class lines only**, ordered: same-family first → authority rank → proximity. POC lines and session levels (NYL and friends) leave the *selector* set. That kills the NYL pick outright.

- Anchor is a POC → TP = same-tier AVP (Yearly POC → Yearly AVP). Matches your journal's TP column.
- Anchor is itself an AVP (the 8/28 Daily VWAP) → no family partner exists; fall through to the next AVP by the ordering. Which tier's AVP sat at ~1.16380 on 8/28 is the one thing I can't resolve from your evidence — I need that from the journal to pin the fallback rule.

Keep `ComputeNearestTpTarget` (L1706) alive **as the census printer** so TPCENSUS output is byte-identical. Only the selector changes. That gives you a strong containment proof in the verification run.

**When measured.** Latch, and latch at the right bar. The 10:25 `S5 waiting: divLatch=0 tpOk=1` line shows the gate function running before the decision was actually takeable — so the latch point is **the bar where every non-R condition is satisfied**, i.e. the confirmation bar's close, not the first bar the gate is called. Store `latchedEntry` (next open), `latchedSl`, `latchedTp`, `latchedR`, `latchBar`. Test `latchedR >= 1.0` once. Never recompute.

Option (c) buys nothing in an alert-only EA — there's no trade to manage, and a second moving reference is a second timing leak.

**Wrong-side family AVP:** fall back to the next admitted AVP in direction. Never skip the R check — skipping is a safety hole. If no admitted AVP exists in direction, `ABORT reason=TP_NO_AVP`. Conservative default preserves the no-new-signals bar.

## C4 — Re-anchor on the confirmation event

The chain currently conflates three bars (retest / ladder-completion / entry) where you have two (confirmation / next open). The ladder is a **filter set** being used as a **timing source**. That is the defect.

**Mechanism.** Add `IsConfirmationCandle(bar, anchor, dir)` — a pure predicate on a closed bar in the anchor's context. Proposed v1 terms, all as named inputs for calibration:

1. Retracement leg into the anchor is complete (price returned to the line from the impulse side).
2. Body close on the setup side of the line (your L1446-1488 test, generalised).
3. The bar is a structural rejection in the trade direction — close beyond the prior bar's extreme, body dominance, wick rejection off the line.

Term 3 is where I need your read. Calibrate it to fire on 09:15 and 16:40 (9/7) and to fail on all four EA-only bars.

**Firing rule.** The EA may fire only on the open immediately following a bar where the predicate returned true. **One-bar validity**: if the preconditions were not all satisfied at that close, the confirmation is consumed and discarded. No carry-forward, no fire-when-the-ladder-catches-up. This single rule is what makes the four EA-only signals structurally impossible and what puts 8/28's R measurement on the correct bar.

The candidate does not die on a miss — a later bar can present as a fresh confirmation while the candidate is alive and in-window.

**Is the ladder salvageable?** Yes, as gates. Two required changes:

- Every latch gets an explicit `validUntilBar` and must be live *at the confirmation bar*. Any latch with unbounded lifetime is a timing leak.
- Fold `divLatch` **into** the confirmation predicate rather than leaving it as an async latch the fire waits on. Async latches are the leak mechanism that produced the 10:30 fire.

The gate at L4007-4042 becomes single-shot at the confirmation close: elect anchor → elect TP → entry = next open, SL = swing → latch R → fire or abort with a named reason.

## C3 — Keeping 8/18 dead

A false positive that survives only by an R arithmetic accident is fragile. Move its death upstream.

1. **Primary kill = the C4 predicate.** If 8/18 is structure-unqualified like the other four, it dies at `CONFIRM_FAIL` and never reaches the R computation. Check this first — if it holds, 8/18 stops depending on arithmetic entirely.
2. **Latch monotonicity:** latch once at the decision bar, never re-latch on a later, more favourable bar. This is the specific mechanism that could otherwise revive 8/18 (its R may exceed 1 on some later bar).
3. **AND-composition:** threshold stays 1.0, entry stays next-open, SL stays the swing. Only *which line* and *when* change.
4. Every death gets a named reason code in the baseline. Assert the reason string, not just the absence of a signal.

## Code sites

| site | change |
|---|---|
| L82-93 | add `AnchorAuthority()`, `IsAvpClass()`, `FamilyTier()` — read-only helpers |
| L1446-1488 | make pure; write RetestBook for all 12 lines |
| L3062-3074 | parameterise SL_REF by anchor; must be re-derivable mid-life |
| L3100 / L3163-3193 | seed via `ElectAnchor()` |
| L3267 + other suppress sites | split into supersede / suppressed-opp / suppressed-lower |
| L1706 | keep as census printer; new `ElectTpTarget(anchor, dir)` for the selector |
| L4007-4042 | confirmation gate before it; single-shot latch; new reason codes |
| new | RetestBook, `ElectAnchor()`, `IsConfirmationCandle()` |

## Observables per ruled case

**8/28 returns:** `CONFIRM bar=10:00|10:05` → `ANCHOR_ELECT poi=Daily-VWAP` → `TP_ELECT class=AVP poi=<tier>-AVP src=cross-tier` → `RLATCH entry=1.16453 sl=... tp=1.16380 R=1.2x latchBar=...` → `SIGNAL`. Declared observable change: `S2POLL_RR_SHORTFALL` **disappears** for this setup, because R is no longer recomputed per bar.

**9/4 survives:** the three `SUPPRESSED` lines become `ANCHOR_SUPERSEDE from=Monthly-POC to=Yearly-POC rank=4->2 dir=LONG opp=0 bar=15:45`, followed by `SL_REBIND`, `TP_ELECT poi=Yearly-AVP`, `CONFIRM`, `RLATCH R>=1`, `SIGNAL`. Assert absence of `ABORT reason=TP_RR_FAIL poi=Monthly-POC`.

**8/18 dead:** exactly one `ABORT reason=CONFIRM_FAIL` (preferred) or `TP_RR_FAIL` with latch values printed. No `SIGNAL`. Reason string asserted in baseline.

**Four EA-only bars:** `CONFIRM=0` at 8/31 11:40, 9/1 15:50, 9/2 15:55, 9/8 15:55 → no `RLATCH`, no `SIGNAL`. Add a `CONFIRMPOLL` census printing each sub-term per bar — that's your calibration surface.

**Containment:** loads=stores=2880 mismatch=0 unchanged; TPCENSUS byte-identical (census printer untouched, only the selector changed).

## Packet sequencing

1. **Shadow packet, zero behaviour change:** RetestBook + `CONFIRMPOLL` + `TP_ELECT` shadow logs. Calibrate the confirmation predicate against 9/7 and the four bad bars before it can affect a signal.
2. C4 confirmation gate + one-bar validity.
3. C1 supersession.
4. C2 TP class + R latch.

Each with its own digest pair, 0/0 compile, and full headless run.

## What I need from you before packet 2

1. The structural definition of your confirmation candle — term 3 above.
2. Which AVP line was the 8/28 TP at ~1.16380 (tier and element).
3. The 8/28 journal entry price and stop, to confirm the 1.16453 reconstruction.
4. Does AVP-class-only TP apply to all setups, or only POC anchors?

--- END COUNCIL REPLY (verbatim) ---

## BUILDER VERIFICATION ADDENDUM (measured against the source, EA digest A0701893...3FD57E)
The council asked: "treat every line anchor mapping below as a proposal to verify against the
file." MEASURED 2026-09-10:
- L82-93 the rank table ✓ EXACT (InitAuthorityTable L80-94). CORRECTION: the council's prose
  "Yearly rank 2 above Monthly rank 4" is wrong on Monthly — measured: FOMC-POC=0, FOMC-VWAP=1,
  Yearly-POC=2, Yearly-VWAP=3, Quarterly-POC=4, Quarterly-VWAP=5, MONTHLY-POC=6, Monthly-VWAP=7,
  Weekly-POC=8, Weekly-VWAP=9, Daily-POC=10, Daily-VWAP=11. The 9/4 observable must read
  `rank=6->2` (Monthly-POC -> Yearly-POC), NOT `rank=4->2`. (rank 4 = Quarterly-POC.)
- L1446-1488 ✗ WRONG — that range is MarkSessionUsed + comments. The REAL retest detector:
  `bool DetectPoiRetest(int barShift, PoiRetestResult &r)` at **L1552** (body from L1552;
  read-only struct-filling already — L3178/L3235 comments state it); consumed at the two poll
  sites **L3203** (t78) and **L3257** (t73). All council references to "L1446-1488" map to
  L1552-1600.
- L1706 ComputeNearestTpTarget ✓ EXACT (signature L1706-1707).
- L3062-3074 ✓ REAL but it is the ZONESHADOW/RR-advisory print block (S2POLL_RR_SHORTFALL at
  L3074; the threshold test L3071). The SL_REF swing-selection machinery the council wants
  parameterised actually sits at **L2000-2060** (SL_REF branch prints L2027/L2051).
- L3100 ✗ drifted — the singleton-architecture comments sit at **L2955-2956** and **L3227-3235**
  ("The singleton discards every POI retest that arrives while a...").
- L3163-3193 ✗ WRONG — that range is a Task-80/EA-80 comment block. The REAL seed site:
  `g_state = ST_S1_REGIME` at **L3311** (the seed block L3300-3330); the poll sites L3195-3300.
- L3267 the SUPPRESSED print ✓ EXACT (PrintFormat L3267-3270; the opp/higher tallies L3265-3266).
- L4007-4042 the S5 gate ✓ EXACT (the ComputeNearestTpTarget call L4007; S5_NO_TP_TARGET L4010;
  "S5 waiting: divLatch=0 tpOk=1" L4042).
- The 8/28 arithmetic ✓ VERIFIED against the journal verbatims (ZONESHADOW 10:20 R_close=1.13,
  10:25 R_close=0.95; tp=1.16364=NYL; slRef=1.16481 = the order-block swing; the 10:25
  S2POLL_RR_SHORTFALL tpDist=0.00057 slDist=0.00060 R=0.95). The council's substitution
  arithmetic is internally consistent. NOTE for the operator's Q3 datum (the 8/28 TP tier):
  the journal TP column for that trade = "AVP" (the family simplification; the origin tier
  unstated) — the council's question 2 stands.
## OPERATOR ANSWERS (2026-09-10, verbatim; the four council questions)
1. "you already have the answer in my specification and i refuse the explain again. for
   next time answer the questions for me which i have explained to you before and have been
   documented. i do not require the shape of a candle be an engulfing candle, just a candle
   to my setup bias direction after the retracement candle."
   — TERM 3 RESOLVED BY SPEC CITE: SRJ Flow Nexus — Part A Specification v4.2 §3.6
   (L158-160): "A retracement candle (equivalently, an opposing candle) closes against the
   trade direction. Entry fires on the close of the next candle that closes in the trade
   direction. Any nonzero body counts. No requirement to close beyond the retracement
   candle's extreme or the zone boundary. Long wicks are fine. Only a true doji is
   rejected." IsConfirmationCandle = that documented candle. The reprimand is recorded:
   the builder answers from documented rules FIRST (spec/charter/rulings) before asking.
2. "the 8.28 AVP early exit is D AVP, i have attached the picture here as the D AVP gapped
   below and made the price break the AVP value higher with a candle body close."
   — The 8/28 TP = the DAILY AVP (Daily-VWAP line). AND the early-exit mechanism = the line
   GAPPED (moved) and price BODY-CLOSED through the AVP VALUE → the operator exited. This is
   the EXIT-POCVWAP ruled standard (the §5 exit model, charter STEP 4 — PRICE's body close
   through the possibly-gap-jumped line, not the line's move alone). Record-only here: the
   exit model stays with the unbuilt STEP 4.
3. "the next candle open after the confirmation candle price is at 1.16466. Stop SL was one
   swing high + imbalance of 1.65068 6:30 high or if you meant the early exit price is at
   1.16464 at 11:35 open candle."
   — Entry = 1.16466 (the next open after the confirmation candle). SL = one swing high +
   imbalance, verbatim "1.65068" (APPARENT TYPO — EURUSD cannot be 1.65; the likely value
   is 1.16568 or 1.16468, the 06:30 swing high; recorded verbatim, resolved by measurement
   later — no re-ask). Early-exit price = 1.16464 at the 11:35 candle open. NOTE: the
   council's reconstructed entry 1.16453 is 13 pips off the actual 1.16466 — approximate as
   expected; the implementable standard is the RULED next-open-after-confirmation rule, not
   a fixed price. R arithmetic check (builder, with the recorded figures): reward =
   1.16466 - tp; with the operator's measured 1.21R the implied tp ≈ 1.16380 (their stated
   D AVP) and the implied SL ≈ 1.16537 — vs the verbatim-typo SL; the exact SL comes from
   the chart measurement (the 06:30 swing high), not from this arithmetic.
4. "no, go back to the original rule of whichever is the closest"
   — THE AVP-CLASS-ONLY TP SELECTOR IS RULED OFF. TP = whichever line is CLOSEST (the
   ORIGINAL ComputeNearestTpTarget rule, as-built). C2's selector change is DISSOLVED; the
   surviving C2 piece = the R LATCH (measure R ONCE at the confirmation bar's close — a
   consequence of C4, not a selector change). The AVP fallback / TP_NO_AVP machinery is
   unnecessary. TPCENSUS byte-identity is trivially preserved (the selector unchanged).

## DESIGN STATE AFTER THE ANSWERS
- C4 term 3 = the spec §3.6 candle (any nonzero body in the trade direction after the
  opposing candle; only a true doji rejected). Calibration targets unchanged: fire on the
  9/7 confirmation candles (09:15, 16:40), fail on the four EA-only candles.
- C2 = ONLY the R latch at the confirmation close; the selector stays closest-line.
- C1 unchanged (rank supersession). C3 unchanged.
- The 8/28 exit + the 9/7 TP data confirm the EXIT-POCVWAP standard (STEP 4, unbuilt,
  record-only).
- ALL FOUR questions answered -> packet 2's gate is CLEARED. The shadow packet (build 1)
  is drafted (PACKET_P-CONFIRM-SHADOW.md) and awaits the operator's issuance.

