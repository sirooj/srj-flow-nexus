# BUILDER_FINDING_SEEDFIX-1 (2026-09-22, read-only diagnosis for the fix round)

Scope word banked: his "proceed to fix these remaining defects" (2026-09-22) covers
selection (8/28, 9/7 NY, 9/8 17:00) and exit (9/4 day-close) - council route still
required before any canonical edit (dual-key for selection). No code touched here.

## D1 - 8/28 London: valid seed voided same bar, never re-seeded

- 09:55 bar: retest found (RETESTBOOK hits=1 Daily-VWAP:r11, alert at 10:00 print),
  CONFIRMPOLL anchor Daily-VWAP SHORT confirm=0, ANCHOR_ELECT SEED Daily-VWAP SHORT,
  then SEEDVOID bar=09:55 dir=SHORT buf=12 line=1.16482 evals=66 (PD-London-High).
  Single-pass order (R2 after seed block) means the void wins same-bar by design.
- 10:00 + 10:05 bars: RETESTBOOK hits=0, no re-seed, no election. His entry
  next-open ~10:05 (1.16466) off the D VWAP retest his chart shows.
- Open, narrowed by his screenshots 2026-09-22 (his challenge owned - the charts DO
  help): CLOSED - "no retest happened" is dead; his feed shows the valid D VWAP
  retest (8/28) and the latest W POC retest (9/7), so the EA's post-void hits=0
  is a confirmed miss, not an empty market. OPEN fork with two branches only:
  (a) void TRUE on tester feed (09:55 wicked over 1.16482+buffer) while his feed
  shows only the AS.L sweep - feed divergence (spec 9.1), fix = re-seed after
  void on the fresh retest; (b) void FALSE (stale PD-London-High line value or
  tester-feed artifact, no touch on any feed) - fix = void precision. The chart
  pixels cannot pick (a)/(b) - values by eye are forbidden - so the packet
  carries both: SEEDVOID prints r2_hi/r2_lo + line source, and the re-seed path
  is built regardless (under (a) it restores the take; under (b) the void never
  fires). His chart numbers, if he dictates them, file verbatim as his words.

## D2 - 9/7 New York: LONG never forms, SHORT churns all afternoon

- SHORT seeds at 15:05, 15:15, 16:05 (Weekly-POC, retests found with alerts),
  voided on buf=15 (PD-NY-Low 1.16218, evals 298-312); retests persist
  (hits=2 most bars) but every seed dies the same bar.
- LONG retests appear from 16:20 but SUPPRESSED-HELD each time (opp=1, SHORT held);
  16:15 SHORT CONFIRMPOLL confirm=1 yet no election (16:20 CQDRECHECK divLatch=1).
- End-of-run audit flags: A6SUPP 15:05/15:10 FRACTAL_SUPPRESSED target
  UNRESOLVED_WALK reason NO_CENSUS_ROW verdict NONE - carried, never graded.
- His LONG entry (post-sweep W POC retest) has no seed on any bar 15:00-16:40.
  Packet needs: LONG-formation path through suppression/CQD-latch traffic, with
  his entry bar's full row sequence as the acceptance bar.

## D3 - 9/8 17:00: regression vs the 51 build, no void involved

- RECON53: no SEEDVOID 16:30-17:05. ANCHOR_ELECT 16:45 SEED Weekly-VWAP LONG;
  16:55 Monthly-POC SHORT retest hit (r6) SUPPRESSED-HELD (opp=1 higher=1, LONG
  held); 17:00 S1WAIT LONG-carried (Weekly-VWAP, NYAM), RETESTBOOK 17:00 hits=0,
  no SHORT seed, no election.
- RECON51: MTLIFE openBar=17:00 SHORT entry 1.16220 sl 1.16274 tp 1.16114,
  out 17:05 POI_BODY_BREAK - took his valid trade at his entry.
- Mechanism class differs from D1/D2 (formation/suppression, not renewal).
  Packet needs: why the held LONG outranks the valid SHORT at 16:55 (tier/
  preempt rules at EA L7621 writer + S1WAIT L7946), and a 17:00 formation proof.

## D4 - 9/4 exit: F3 built but unexercised, priority fork open

- EA L11201-11232 implements day-close-minus-5 (16:55-ET mark) with priority
  below SL, TP, BREAK. RECON53: all takes closed before the mark, DAY_CLOSE 0.
- 9/4 NY: tester exited 16:10 POI_BODY_BREAK (entry 1.16018, out 1.16004); his
  ruled exit is day-close-minus-5 (mean-reversal setup, flip inapplicable).
- Fork for council (not asked of him - relay budget): his break-retest rule
  (body-break flips bias and exits, 8/28 11:35 instance) vs his 9/4 hold-to-close.
  Candidate resolution: BREAK yields to DAY_CLOSE on mean-reversion setups, or
  break-retest is trend-scoped - council rules, packet implements.

## Packet design named (draft next, council route)

- P-SEEDFIX-1 (selection, dual-key): D1 observability (r2_hi/lo in SEEDVOID,
  failing sub-test in RETESTBOOK) + post-void re-admit + D2 LONG-formation +
  D3 17:00 formation proof bar. Acceptance replays 8/28 09:55, 9/7 15:00-16:40,
  9/8 16:45-17:05 against these rows.
- Exit rider or follow-up (his exit-only scope allows): D4 priority + F3 first
  firing proof. No booking/gate/target changes (exit-only scope preserved).

(End of file - total 73 lines)
