# BUILDER SLICE B-133 - B greps, W counts, R1 code, R2 table, S1 rows (A2 exit census)

Scope: greps + B-131 day-log reads + EA source reads + pack transcription. No edit/compile/run/gate/refusal; 4JUN/B-91/B-123 never reopened.

## START GATE (raw)

- `git ls-remote backup builder/B-132` = `5730e5a33c9fcd3deb951205aa28d67729b0079d` (verified; cut builder/B-133 here).
- `git log -1` = `5730e5a B-132 bank his 4 June CQD answer; park the 4 June lane (6 of 6); per-day row packs with exits; exit census on every kept trade (relay B-132); verdict MEASURED`.
- `git status --short` count = 528 (pre-existing + untracked, preserved, none staged).
- Nineteen-path diff vs 5730e5a EMPTY (pointer, RESULT_B132, SLICE_B132, INDEX_B132, ROWPACK/, register, ledger, CONTEXT, HANDOFF, both skills, spec, journal, FINDING, 4 kit files).
- Ledger `^1277.`=1, B132-tag=1, `^1278.`=0, `B133-`=0 everywhere. CONTEXT `B132-4JUN-PARKED`=1, `relay B-132`=1, `B133-EXIT-ROWS-FIRST`=0, `relay B-133`=0. HANDOFF `B-132:`=1, `B-133:`=0. Skill phrase=1; journal phrase=1; pointer Lane none-open=1; srj-relay ROWPACK line=1. Journal 1068.
- SHAs (absolute paths): EA 90240F23 / EX5 6CFD3A46 / indicator 956BF3E3ADB7 / ind-ex5 27B5F272DCFA / HTFEngine D5FD5B063E75 / terminal.ini 4082A94F. No terminal64 (0).

## PART B (counts + actual lines)

- 9/1 early-exit INSTANCE s78 = 1. ANCHOR-RANK BREAK RULE s36 = 1. POC-SUPREMACY s87 = 1 heading + 1 name-reference inside OWN-SOURCE-EXCLUSION line 94 (relay text says s90: stale, skill grew; reference-inside-pin class as B-127). UNIVERSAL day-close rule s28 = 1. Append nothing.

## R1 CODE RAW (kept EA 90240F23)

- Order SL, TP_TOUCH, POI_BODY_BREAK, HTF_FLIP: EA:12509-12518 priority chain + header EA:12281-12282 (SL, then TP_TOUCH, then BREAK, then HTF when re-enabled, then DAY_CLOSE). No other order on file: REPORTED NOT FOUND.
- (a) BREAK test EA:12410-12457: scans all twelve POI lines (POI_NLINES loop EA:12416); behind LONG = L < nextOpenPx (EA:12425); body open->next-open EA:12411, bodyLo/bodyHi EA:12301-12302, nextOpenPx defaults to close EA:12300; through LONG = bodyLo < L-EPS strict, equality never breaks (EA:12422-12423, EA:12430); trigger MtIsBreakTrigger EA:12011 (anchor always true; FAMILY_POC scope: even indices EA:12016); rank gate EA:12451 (g_authorityRank[k] < g_authorityRank[anchor]); census per line EA:12440 (side/trigger/bodyLo/bodyHi/verdict). Compares open->next-open body, NOT the candle close; L = ReadBuf1 at barShift EA:12419.
- (b) SL first in-pass: computed EA:12346-12349 (LONG l <= slRef) before the BREAK loop; priority EA:12514 ahead of EA:12516.
- (c) Break fills at nextOpenPx: EA:12516 (`exitPrice = nextOpenPx`); MTEXIT prints it EA:12520-12526.

## R2 TABLE (A2; UJBARMAP day-log rows + pack CONFIRMPOLL/MTEXIT/deal rows)

- 17:35: o=1.16022 h=1.16030 l=1.16008 c=1.16013; Y-POC value UNKNOWN as a row (no Y-POC print at 17:35; nearest row 1.16077 at 17:35 EXITCENSUS); opp=1 bodyDir=1 touchAttr=1 (CONFIRMPOLL bar=17:30, pack 239); behind-above-M-VWAP others: M-POC 1.15931 (behind, no through: closes above).
- 17:40: o=1.16015 h=1.16019 l=1.15995 c=1.16001; Y-POC 1.16077 ahead ok (EXITCENSUS); opp=0 bodyDir=0 (CONFIRMPOLL bar=17:35, pack 255).
- 17:45: o=1.16002 h=1.16018 l=1.15984 c=1.15985 (UJBARMAP); machine Y-POC 1.15987 (EXITCENSUS); read AHEAD (code: 1.15987 == nextOpen 1.15987, not <); verdict ok; behind-above others: M-POC 1.15931 (behind, no through). Machine Y-POC 1.15987 beside his 1.15987 (equal, 0pts); machine close 1.15985 beside his 1.15984 (1pt).
- 17:50: o=1.15987 h=1.16002 l=1.15972 c=1.15975; Y-POC 1.15982 ahead ok; SL fires (low <= stop 1.15975); deal #5 17:51:04 1.15975 (pack 258); MTEXIT 17:50 SL entry=1.16022 exit=1.15975 (pack 259).

## R3 CAUSE (one sentence)

- (ii) the Yearly POC was read as ahead: behind is tested as line < next-open price and 1.15987 == 1.15987 is false, so the behind-gate excluded it before through (vacuous: bodyLo == line, equality never breaks) and rank (would have passed: 2 < 7) ever ran. (i) in scanned set YES; (iii) rank would-pass, not the cause; (iv) values identical and close did cross, not the cause as stated; (v) no (SL false at 17:45: low 1.15984 > stop 1.15975).

## R4 FEED (points, reading only)

- Y-POC 1.15987 vs 1.15987 = 0pts. Close 1.15985 vs 1.15984 = 1pt. bodyLo convention gap 3pts (open->next-open 1.15987 vs his close-based read), never a tolerance.

## S1 ROWS (first qualifying candle per trade or NONE; anchor ranks: Y2/M-POC6/M-VWAP7/W-POC8/D-POC10/D-VWAP11-rowkey; Q/FOMC UNKNOWN excluded with note)

- A1 (anchor D-VWAP): 11:40 D-POC 1.16451 (behind+trigger+through, rank above; same exit it already has).
- A2 (anchor M-VWAP): 17:45 Y-POC 1.15987 (behind-price, rank above, close 1.15985 through; fired exit was SL 17:50).
- A3 (anchor Y-POC): NONE (16:10 Y-POC is same-line).
- A4 (anchor W-POC): NONE (09:20-10:50: min bodyLo 1.16126 above every above-anchor line; full-window EXITCENSUS dump method).
- A5 (anchor W-POC): NONE (no BREAK, no edge in 16:45-17:10).
- A6 (anchor M-POC): NONE (no BREAK, no edge in 10:10-10:40).
- A7 (anchor M-POC): NONE (17:05 M-POC same-line).
- 27May (anchor D-POC): NONE (four D-POC breaks same-line: 15:40/17:05/17:20/17:30).
- C3 (anchor D-VWAP): NONE (no BREAK, no edge in 09:10-09:55).
- B2 (anchor M-POC): NONE (no BREAK, no edge in 16:15-19:15).
- B3 (anchor D-POC): NONE (14:55/15:15 D-POC same-line).
- 4Jun (anchor D-POC): 10:00/10:15/10:30 D-POC same-line BREAKs (behind+trigger+through rows quoted; graded+reported, never counted).
- Method: code-BREAK census (12 rows both windows: only A1-exit + same-line rows) + equality-edge scan (side=ahead with body-edge==val: only A2-17:45 Y-POC rank-passing + 4Jun same-line + A2-17:45 W-VWAP rank-failing) + per-trade behind/through verification (EXITCENSUS val + UJBARMAP o/c).

## S2 RANKS + S3 + S4

- S2: ANCHOR_ELECT rank prints (Y-POC 2, M-POC 6, M-VWAP 7, W-POC 8) + June rowkey r10/r11 for Daily lines (EU D-line explicit rank rows absent: flagged, no S1 verdict turns on them). Code order lower=higher (EA:12451) beside skill section 3 lines 62-66 (family ranks, AVP-POC over VWAP inside each family): no conflict touches S1 (same-line exclusions + A1 exit agree on both orders). Reported, not resolved.
- S3: line value BUILDABLE (ReadBuf1 at barShift EA:12419); behind/ahead BUILDABLE (vs nextOpenPx in-pass EA:12425); rank BUILDABLE (array + prints); anchor BUILDABLE (g_mtrade.anchorLine). All readable at the exit pass at runtime.
- S4: SEPARATES (A2 17:45 only qualifying non-same-line candle; no breaker). Draft nothing.

## RECORD LINES (exact)

- X1 §4: `- B133-EXIT-ROWS-FIRST (planner lesson 2026-10-09): ...` (full text in result X1).
- X2 §5: `- 2026-10-09: planner session ran as ClickUp Brain for relay B-133 (kit PK-2); ...`.
- X3 §3: `- B-133: cut entry-to-exit packs for every kept trade; named the cause of the 1 Sep 17:45 non-exit; graded his higher-line break-exit words on every kept exit (Part S); no source edit or run.`.
- X4 ledger `1278.` (tag `B133-A2-EXIT-CENSUS`; P + R + S summaries + verdict).
- X5 pointer (cap 35): verdict MEASURED; kept SHAs unchanged; Lane A2-EXIT 1 of 6; S4 verdict; goal open. (No register edit: Part B verifies only.)
- Pre-commit: X1/X2/X3 counts 1; X4 counts 1; `^1277.` = 1; staged = result, slice, ledger, pointer, CONTEXT, HANDOFF, EXITS-B131/*.csv (12), INDEX_B133.md; no source/EX5/journal/log/settings diff beyond staged. (No carried note: no no-ruling item; Q/FOMC UNKNOWN flagged but verdict-independent.)

(End of slice)
