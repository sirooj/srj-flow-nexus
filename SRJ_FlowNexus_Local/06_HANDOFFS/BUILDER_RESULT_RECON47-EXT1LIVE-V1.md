# BUILDER_RESULT_RECON47-EXT1LIVE-V1 — first EXT1LIVE probe run (2026-09-19)

Run: RECON47-EXT1LIVE-V1. DONE=PASSED 2026-09-19 22:35:24 (46m45s wall).
Build: EA C375D6A5/612385 (A+B+C literal per P032, twin-verified 1x each;
snapshots STRUCK, no hunk). Compile: 0 errors, 0 warnings
(06_HANDOFFS\EXT1LIVE-V1_EACOMPILE.log, 48 lines).
Packet: v25 (DDD82BC1/46/132168). Relay: v188 (E263ECA2/459).
Auth: dual CLEAR Luna-v188 + Astra-v188, run word spent 2026-09-19.
Segment: 06_HANDOFFS\RECON47-EXT1LIVE-V1_JOURNAL.log (37321 lines).
Tabulate: 00_CURRENT_WORKING\tabulate_ext1live2.ps1 (ASCII, segment-only).

## Realized delta (promise vocabulary of v188 NOVEL-EVIDENCE)

IMPROVED (no prior run had any of this):
- First STOPRESOLVE output ever: 1 SCHEMA + 13 NORMAL rows on disk.
- C-reach closure 13/13/13/13: 13 NORMAL + 13 SIDE1E_STOPSHADOW +
  13 SIDE1X_STOPREF + 13 site-S5 SLEXT481 rows in one segment.
- A1 pass from the new instrument: bar 2026.08.28-16:20, rExt1=1.3836
  (rounds 1.38), wouldGate=1, ext1Slot=118, pxExt1=1.16508 = archive ruleStop.
- A3 decline from the new instrument: bar 2026.09.08-16:40, rExt1=0.67808
  (rounds 0.68), wouldGate=0, ext1Slot=91.
- A2 record-at-C: bar 2026.09.04-10:35, rExt1=7.30299 (archive 7.30),
  wouldGate=1, slot=13, pxExt1=1.16299.
- Strikes print: vetoStateAtSite=- and sessionUseAtSite=- on every NORMAL
  row; zero "?" survivors file-wide; zero INVALID in the present region.
- wouldGate sign agreement 13/13 (rExt1>=1 prints 1, below prints 0).
- SINK CAP MEASURED: longest NORMAL payload 468 chars; longest journal
  line 537 total (day-log verified: longest NORMAL payload 489). The sink
  truncates long rows. Full-row (1024/1056) transport is NOT demonstrated
  by this run. This bounds the P038 micro-check premise: a 1056 synthetic
  fixture cannot survive a ~537-capped sink as one line.

CONFIRMED (re-proven on new output, not new):
- SCHEMA complete: fields=38, all 38 key spellings in P034 order.
- Key order correct on every present prefix (positions 0-22); no mismatch.
- dir in {1,-1} on all 13 rows; ext1Defined=1 throughout.
- Slot ladder values 118/91/13 and pxExt1 ruleStops match archive.
- No terminal: zero CAP, zero BSAVE_FAIL lines (cap-unreachable holds).
- 11 TP_ELECT lines with 7 SIGNAL alerts (wrapper GATE block, R values
  3.43/1.48/1.74/4.86/2.34/2.52/1.62 on the seven table bars).

NOT PROVEN (cut by the sink cap, voided for this run, never failed):
- Full-row byte-identity and 1024/1056 transport demonstration (rows cut
  mid ladOriginBarTime, ~position 23 of 38; keys 24-38 absent on the wire).
- emitSeq sequencing, ladOriginStamp joins, raw-pair recompute leg-(a),
  entryPx==currentPrice, extSideOk/extDistPts/raws/actualGate/wouldAdopt
  values (all past the cut on every NORMAL row).
- Per P038 the truncated rows sit in the transport-halt class for full-row
  grading (never a grading miss): row-level gradeable checks above all pass;
  full-row claims are withheld, not failed.

## Mandatory-findings ledger (P042, gradeable subset)

- 7 TP_ELECT fire rows of 11: wrapper SIGNAL GATE block carries all seven
  table-bar alerts; TP_ELECT line count 11. PASS (event level).
- A1 record-at-C + self-consistency: rExt1=1.3836 present, wouldGate=1
  present and sign-consistent; full operand recompute blocked by cut raws.
  PARTIAL (value level pass, recompute withheld).
- A2 record-at-C (slot 13, archive-precision price): pxExt1=1.16299,
  slot=13, rExt1=7.30299. PASS.
- A3 record-at-C + shadow self-consistency: rExt1=0.67808, wouldGate=0,
  sign-consistent; recompute withheld as above. PARTIAL.
- gateConst=1 on all rows: PASS. actualGate: WITHHELD (cut).
- Cap non-occurrence + terminal exactly-once (zero terminals): PASS.

## Falsifiers tripped

None in the gradeable region. Transport-halt class engaged for full rows
(environmental sink cap, measured 537/489, not a probe defect: the emitted
envelope/keys/values are byte-exact as far as the sink carries them).

## Owed forward

- Next relay carries these results plus the sink-cap bound: full-row
  transport claims require either sink-cap-aware grading (present-prefix
  contract) or a split-line emission design (own token, literal change).
- Opus-v188 still owed (4x no-output, credit); re-add whole when able.
- No build, no second run, no commit on this turn. EA stands C375D6A5.
