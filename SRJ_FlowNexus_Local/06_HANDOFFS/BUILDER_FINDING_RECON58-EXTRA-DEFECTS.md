# BUILDER FINDING RECON58-EXTRA-DEFECTS (2026-09-23, on his "still other defects" order; all rows machine-pulled, zeros re-proved)

## D1 squatter-veto (already in result 1F2D44F4; identity now closed)

- Squatter born 16:45 9/1 (ANCHOR_ELECT action=SEED poi=Yearly-POC rank=2 tier=1
  dir=LONG), armed S4 by 16:50 (S3_ZONE_WAIT->S4_ARMED), S5-fallback 16:55
  (S5_GATE_CHECK->S4_ARMED), vetoes from 16:55 on (first victim 16:50 SHORT,
  then 17:30/17:35 Monthly-VWAP LONGs incl the 57-winner px 1.15975 slot 9).
- Tier-1 holder is preemption-immune (wouldPreempt=0 vs all challengers) and
  its fire conditions never met: without eviction it vetoes intraday permanently.
  Session abort bounds it (1 SESSION_CLOSED abort 9/1 evening in-segment).
- 57 voided the same-window seeds (16:55 + 17:00 LONGs buf=14, CO/IH rows).
- Fix shape: time-based arm expiry or S5-reject kill for unclassified seeds
  (preemption cannot evict tier-1; MEANREV scoping kept). Council route.

## D2 market-close executor never fires (CONFIRMED, pre-existing, not E1)

- EXITVERDICT want=1 count is 0 run-wide (control 155 rows, second pattern
  want=[1-9] also 0). Intent flag never set in 51, 57, or 58.
- All 12 fills in 58 are broker-side (6 entries + 6 SL/TP at stop/limit prices);
  zero EA-sent closes (no close-send prints under any pattern; PRE-SEND == 6
  entries only). Same in 51 (break verdict unfilled, SL fill) and 57 (day-close
  verdict unfilled, TP fill).
- Paper/real split: MTLIFE paper-closes at verdict (8/28 closeBar 11:40,
  9/4 closeBar 23:55) while real positions run to SL/TP. His day-close rule
  (exit near day close, every trade) and his higher-break exit therefore never
  execute as coded - verdicts print, positions ignore them.
- Owner: exit-executor packet (close-send on verdict + want wiring), council
  route. Bounds all exit-fidelity grading until built.

## D3 8/28 aftermath accounting diverges 51-vs-current (OPEN, print/lifecycle level, zero fill impact)

- 51 prints TWO MTLIFE rows (11:40 BREAK paper-close + 17:00 SL re-track with
  openBar=16:25 entry=1.16430) plus the SL MTEXIT row. 58 prints ONE (11:40
  paper-close) and no SL verdict row - fills identical (SL 17:00:17 at 1.16508).
- E1 cannot be isolated as cause (57 has no 8/28 take for same-tree control;
  R2 block holds no managed-trade writes, and 58 fired 0 voids). Candidate:
  break-aftermath re-acquire logic changed between the 51 tree and the current
  tree (EXITMODEL/RANK era). Code read owed before the claim hardens.
- No selection impact (fills byte-identical second+price). Tracked, not graded.

## D4 booking re-selection (NON-DEFECT, elimination case on record)

- 8/28 TP 1.16364 (R2.43) vs 51 TP 1.16322 (R3.43), same SL/entry/feed. No TP
  candidate census prints in-output (one candidates= hit is BLACKOUT news-flat,
  unrelated), so compliance rests on: same picker code as every other 58 take
  (all book nearest per his ruling; 9/7 AS.H verified ledger 561) + same feed +
  picker evolution landed between the trees under his nearest-wins ruling.
- Design-path proof (both takes came the designed way, not re-seeds): 8/28
  CONFIRMPOLL 10:00 confirm=1 anchor Daily-VWAP SHORT; 9/7 CONFIRMPOLL 16:40
  confirm=1 anchor Weekly-POC LONG.

## Verified non-defects (checked on his order, all clean)

- CQD instrument: every mismatch field run-wide is 0 (progress + final rows).
- EXECUTE_ACCT: 6/6 takes mode=0 login=1359506594 (audit label intact).
- Alert kinds: SIGNAL/EXIT/HEADS-UP/STAND-DOWN only (grouped census 6/6/46/41).
- 9/4-invalid: S4 ABORT + S5 FRESH_VETO + A6REFUSED + STAND-DOWN (intact).
- Feed census: ticks/bars/BIAS/ZONE/PROMO identical to 57; MTCOLLISION 0;
  RENEW 0; DEMO_GUARD 0; TP_ELECT 10 = 57.
- Silence elsewhere: no signals 9/2, 9/3, 9/5, 9/9 either run (consistent).

## Open (honestly bounded, not defects)

- O1 WS161 changes 215 vs 218/200: loads/stores/bars/feed identical; only
  lifecycle rows differ. Attribution by elimination (kept-pool + 9/1-miss
  footprint); exact write site unread. Monitor, not graded.
- O2 his-feed touch attribution on TPs (9/7 TP 1.16315 under his chart line):
  in-tester touch proven by fills; his-feed side needs him, never assumed.

(End of file)
