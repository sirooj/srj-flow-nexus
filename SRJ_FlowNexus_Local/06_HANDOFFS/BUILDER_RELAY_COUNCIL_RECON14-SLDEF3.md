# BUILDER_RELAY_COUNCIL — RECON14-SLDEF3: BLOCKED on gate 5 (13/14 pass)

Packet P-SLDEF-3 EXECUTED as issued (E27–E30, print-only, MTEXIT 4).
Build: EA 2702B7F2E128E5B9DEC92C00CA5C5E7FF661DA3BAFCEF9F219E09C056C705451
(357192 B, 0/0); FlowLogic 3606BFB4… UNCHANGED (0/0).
Run: pilot ini unchanged, 563338 ticks / 3168 bars, `Test passed in
0:57:54.352`, DONE=PASSED 06:51:02. Archive F0D7AC70… LEN 3300754,
17516 lines, boundaries [9705..27220]; purity 1/4/481 verified on disk.

## What passed (13 gates)

Identities verbatim incl. N1 pairing; sixth inert join 481/481 ×3 + 10/10
zero-mismatch; census 11/1/3/0/0 with Oct-28 360; FRAC_OFF_LADDER = 0;
52/52 slot residuals zero (the +5s were the frame defect — confirmed);
MATCH held on 1.16240 and flipped to MATCH on 15:55 1.15907 (rung 16,
slot 407, resid 0) as predicted; MTFLIP ×1 with barsHeld=0 sameBarFlip=1
and biasBefore=2 (pre-flipped — exit-side operands delivered); SIGMAP 4/4;
FRAME_NOTE five conventions; 19/19 LINEWIDTH truncated=0; spot 157/157/443.

## Gate 8 — ghost retired (earned)

1.16112 = rung 19 (slot 77, ext 6, shift 78, 10:10 bar, imbCode 1,
dist −106, R 0.36), bracketed 1.16141 / 1.16102. Real fractal swing with
imbalance. Conservative R 0.36 stands measured vs nuance R 2.56.

## Gate 5 — halt with operands (no commit; RECON12c frozen)

8/10 rows cover. Two capHit=1 rows, both genuine (targets verified):
- 9/04 15:55 LONG: 33 rungs to slot 493; target = OB base at slot 524.
  Walk window [408..908] vs ladder window [1..501] — different windows.
  today/nuance/anchor slot-match at 0; fracRefs slotless echoes.
- 9/08 16:40 SHORT: 52 rungs to slot 351; OB today/base/nuance all at
  slot 817. Frac refs match at 0. (Also the single gate-6 TODAY_OFF.)
Ruling requested: raise/extend the cap, anchor the ladder window at the
walk start, or accept uncovered-with-UNTESTED? Builder recommends the
second or third — the first only moves the cliff.

## Corrections to packet expectations (measured)

- E29 "four": vHTF=1 fires ONCE (Sep-4 16:00, anti=2). MTFLIP_N=1.
  Gate 10 grades barsHeld/sameBarFlip — unaffected.
- Gate-6 split moved 4/6 → 9/1 under coverage (reported, not absorbed).

## Debts closed here

Zero-step falsifier 0 on RECON14 (56 anchor rows) + 0/0/0 off 11b/12c/13.
fracAnchorPx shipped. E26-style deviation: none this packet (loop stayed
put; 5 new classes fit the widened 16→32 table, 19 registered).
