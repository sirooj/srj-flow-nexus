# REPORT/OBJECTS_EU_B208 - his pieces vs the machine's (euro only; print-only diagnostic, always restored)

Build: flow-indicator diagnostic .B208D (12 print-only hunks, 0 errors, 3 pre-existing warnings in unedited lines;
kept ex5 c82f175e restored+verified after the runs). Runs RECON62-B208D (16/16 deals identical, no STOP) and
EU0525TD-B208D (44/44 identical, no STOP). Pack lines below are EU0525TD-B208D day packs (committed here) except
RECON-D CUT journal lines (CUTs stay on disk, never staged). Trader words throughout; machine ids appear only
inside cited rows.

## P1 - his named pieces vs the machine's
- 28 Aug long side (A1): his 06:30-06:40 FVG is FOUND on rows (formed 06:30-06:40, range 1.16489-1.16491,
  RECON-D JL926135); wicked dead at the 09:55 candle (JL927510), never body-killed before your 10:05 entry (its only
  body kill prints 13:55, after). The OB the machine counted dead at your confirmation is a different piece (formed
  09:25, range 1.16446-1.16479, killed 09:40 at close 1.16475 through its 1.16463 level, JL927325/JL927401). The FVG
  the machine counted dead is an older body-filled one (its exact identity is not printed by the selection; the flag
  reads alive all morning and flips at the 10:05 pass).
- 25 June short: your bearish 10:00 block is NOT FOUND as an object (the machine formed only bullish blocks nearby,
  EU/06-25#753/#855). The 10:10 candle closed at 1.13500, beyond both their levels, and both were skipped as
  out-of-bias (EU/06-25#969 and mate). Your 10:05-10:15 FVG matches the machine's 10:05-10:20 piece (EU/06-25#1034),
  body-killed at 10:35 before your entry (EU/06-25#1262). The validated opposite piece prints at 10:05
  (bullish, EU/06-25 OPPV rows).
- 22 July short: nearest machine block formed 14:45 (range 1.14037-1.14073, level 1.14055, EU/07-22#2694), alive at
  your confirmation (14:50 close 1.14048 never closed beyond its level; the only later row is a skip, EU/07-22#2695).
  Your kill candle for it is not determinable (your level never printed). Nearest dead FVG: body-killed 14:30
  (EU/07-22#2504).
- 10 June long: your dead in-bias piece matches the machine's body-killed 15:50 piece (EU/06-10#3149); opposite
  pieces validated 15:55 and 16:00 (EU/06-10#3207/#3265). Direction agrees on all three terms.
- 8 Sep (A6/A7): your 9:20 zone is FOUND exactly (formed 09:20, range 1.16230-1.16256, in-bias at form, JL1025677),
  alive through both your entries (first machine rows on it after entry are out-of-bias skips, JL1030493/JL1032489).

## P2 - every OB the euro run registered (11,678)
- KILLED 5,097 (all on live candles; the replay path fired zero times in 141 days). SKIPPED-only 6,316 (every one
  out-of-bias; the refOk gate never refused once). NEVER closed beyond on a live block 265.
- Reading: the kill works when price closes through a live in-bias level; nothing else ever kills or skips.

## P3 - in-bias FVG at each confirmation (wick/body candles before entry vs the machine's kill candle)
- Machine kill candle = latest body kill before entry; wick kills never flip the machine flag (your rule counts them).
- 26May 0, 28May 0, 4Jun adv1 (body kills 10:00), 10Jun adv2 (5 wick + 6 body ids incl. your piece, kill 15:50),
  25Jun adv1 (4+4 incl. your 10:05-10:15 piece, kill 10:35), 29Jun 0, 8Jul 0, 15Jul 0, 22Jul adv1 (2+3, kill 14:30),
  28Jul 0, 5Aug adv1, 17Aug adv1, 28Aug adv2 (4+4 older pieces; yours wick-only), 1Sep adv1 (opp), 2Sep 0,
  4Sep-09:30 adv1, 7Sep-09:20 adv1, 7Sep-16:45 adv1, 8Sep-10:10 adv1, 8Sep-17:00 adv1, 22Sep 0, 8Oct adv1.
  (adv from FRESHCOUNT conf rows; full per-take rows in the grade job output.)

## P4 - 2-of-3 recomputed his way (committed pack lines; SEPARATES, breaking row: none)
- Method: OB term dead only for his named blocks (25Jun, 22Jul); FVG term dead only for his named/identified pieces
  killed per his wick/body words by confirmation (10Jun, 25Jun, 22Jul, A1); OPP term = machine's persisted flag
  (no validation mechanics in his words - disclosed); everything else live (no invented kills).
- 10Jun: 0+1+1 = 2 REFUSE (EU/06-10#3126,#3149,#3151). 25Jun: 1+1+0 = 2 REFUSE (EU/06-25#1176-1206 + B208 rows).
  22Jul: 1+1+0 = 2 REFUSE (EU/07-22#2482-2506 + B208 rows).
- A1: 0+1+0 = 1 keep (EU/08-28#973,#992,#994; 2150 wick JL927510). A2: 0+0+1 = 1 keep (EU/09-01#4824+; OPP
  machine-read, disclosed). A3: 0+0+0 = 0 keep (EU/09-04#3841 cross; machine adv1 noted, piece unidentified).
  A4-A7: 0+0+0 = 0 keep (machine adv1 noted each, pieces unidentified - F0 work).
- C rows: 4S1040 + 27Aug zero rows; 1S1530/28A1625/8S1645 dead-seed refusal pack lines (EU-D 09-01#3365, 08-28#4244,
  09-08#4766) - OTHER-GATE, no take path.
- Verdict: SEPARATES. Trader line: "with the pieces read your way, this count keeps all 7 of your valid euro takes
  and refuses your 10 June, 25 June and 22 July trades."
