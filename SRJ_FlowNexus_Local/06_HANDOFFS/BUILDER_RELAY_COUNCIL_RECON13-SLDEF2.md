# BUILDER_RELAY_COUNCIL — RECON13-SLDEF2: BLOCKED on gate 8 (11/12 pass)

Packet P-SLDEF-2 EXECUTED as issued (E23–E26, print-only, MTEXIT 4).
Build: EA 13560ABFF6814F37F61DFEFA7D2903BB5B21EFB270C6EF9411B92981FDBC4648
(341466 B, 0 errors 0 warnings); FlowLogic 3606BFB4… UNCHANGED (0/0).
Run: RECON1_P1.ini unchanged, 563338 ticks / 3168 bars,
`Test passed in 0:49:18.686`. Midnight split → wrapper UNDETERMINED
(archive split-blind, harness defect owned); manual segment
old[155667..163218]+new[1..9704] = 17256 lines, LEN 3212767,
SHA256 B79C59714E4186954998308247ECACF18E0360BFE415A12E00E0631F5A8297C4.
Purity triple on the segment: 1 Test-passed / 4 signals / 481 SLIMB.

## Gate table (measured, on disk in BUILDER_RESULT_RECON13-SLDEF2)

1. Compile PASS. 2. Identities PASS (CQD 906; WS161 21/205/0; SLMEMO
471/118/589; SL_REF 432/39/10; INPLAY 157/46; MTEXIT 4 = 3 TP_TOUCH +
1 HTF_FLIP, rows verbatim; aborts 18/37/13/11/2/0/12; PROMO 469;
CONFIRMPOLL 555; SUPPRESSED 156; 4 signals verbatim; N1 28/26/0/3 with
pairing byte-identical to RECON12c; guard 60; sideV 0/0).
3. Inert PASS (481/481 ×3 + 10/10 vs RECON11b, zero mismatches — fifth
build). 4. Census PASS (11/1/3/0/0, Oct-28 360, HALT 0).
5. Ladder PASS (10/10 rows × 8 rungs, ladFresh 1 all, rungExt monotone
all rows off-log, distinct barTimes, BADFMT 0).
6. todayRef PASS (ON 4 / OFF 6, all OFF residuals nonzero:
-17,+54,+5,+77,+5,+20; 6 today-rungs on the 4 ON rows — 9/07 rows hold
today's price twice, tie resolves inward).
7. Match PASS (Sep-7 1.16240 MATCH rung 0 slot 1 ext 0 16:30 resid 0;
Sep-4 1.15907 NOMATCH ×3 with nearest named: slots 31/31/1, ext 4/-1/0,
resids -317/-367/+5; MATCH=1 NOMATCH=4 NOLEVEL_FILED=5).
8. HALT — see below. 9. MTLIFE PASS (4/4, booleans all 0; Sep-4 record
open 16:00–16:00 HTF_FLIP, never at a boundary — dayFlat=0 with operands
vs the hand 23:55 flat). 10. Width PASS (14/14 LINEWIDTH lines incl. ROW
188 + CENSUS 246, truncated 0, new-class maxima 291/230/208).
11. Spot PASS (157/157/443). 12. Digests re-stated; NO COMMIT.

## The halt (gate 8, packet's own clause)

- The Sep-7 PM S5 row (bar=16:40; the 16:45 in the gate text is the SIGNAL
  bar — mapping disclosed, single candidate row) carries NO 1.16112 rung:
  8 rungs span slots 1–29 (16:30–14:10), px 1.16247–1.16209.
- Same row's fractal walk runs fracSteps=20 to base 1.16112 (class
  CARVEOUT_FIRED, nuance 1.16240). The walk's base lies deeper than the
  8-rung cap reaches: absence is cap-adjacent, NOT ghost evidence.
- Correlated: the 15:55 Sep-4 row has slToday = slNuance = slFractal =
  1.15907 (his level, to the point; TODAY_EQ_NUANCE) yet no ladder rung
  there (nearest rung 0 @15:45, +5) → TODAY_OFF_LADDER + NOMATCH.

## Rulings requested

- Q1: extend the ladder (more rungs / a slot bound) in a follow-up packet,
  or rule the 8-rung absence itself the ghost finding?
- Q2: confirm the 16:45-signal / 16:40-S5 mapping used for gate 8.
- Q3: approve the E26 mechanism deviation (summary loop relocated after
  the census print instead of the one-line finalize move — the one-liner
  leaves CENSUS unsummarized while gate 10 names both classes; 14/14
  lines on disk are the proof)?

No commit. RECON12c (EDAA089A) stays frozen. EA 13560ABF… uncommitted.
