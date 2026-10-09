# BUILDER SLICE B-134 - gate, pins, S0 rows raw (STOP at S0)

Scope: reads + greps + pack grading (grade_s0_b134.ps1, unstaged). No edit/backup/compile/run/launch; 4JUN/B-91/B-123 never reopened.

## START GATE (raw)

- `git ls-remote backup builder/B-133` = `2518c26bcc88ad0fe52deee3d16a5f63ae7e01dd` (GitHub identical; cut builder/B-134 here; no remote B-134 on either remote before push).
- `git log -1` = `2518c26 B-133 1 Sep exit census plus higher-line break separator (relay B-133); verdict MEASURED`.
- `git status --short` count = 530 (pre-existing + untracked, preserved, none staged).
- Protected diff vs 2518c26 EMPTY by `git diff --quiet` (pointer, RESULT_B133, SLICE_B133, INDEX_B133, ROWPACK/, register, ledger, CONTEXT, HANDOFF, both skills, spec, journal, FINDING, 99_WORKFLOW incl. kit files). AGENTS.md/.clinerules dirty, not gate-listed, preserved.
- Ledger `1278. B133` = 1, `B133-A2-EXIT-CENSUS` = 1, `1277.` = 1, `1279.` = 0. CONTEXT `B133-EXIT-ROWS-FIRST` = 1. HANDOFF `B-133:` = 1. Pointer `Lane: A2-EXIT (first B-133, 1 of 6)` = 1. Journal 1068 lines.
- SHAs: EA disk == .B131LATCH `90240F238A0668885E2D39BDAE5271CE3C08D81B7EA1836DB77F52A42E631AF3` (64-char; 12773 newlines; LF-only; 703681 bytes; B-133 records carry 63-char truncation, defect noted) / EX5 `6CFD3A469E434CE0570F2CE04B1C19AD994570042A553EEF18D32569E58D380D` (full) / indicator src `956BF3E3ADB7` raw-disk prefix / ind-ex5 `27B5F272DCFA` / HTFEngine `D5FD5B063E75` / terminal.ini `4082A94F` (../config/terminal.ini). No terminal64 (0).

## PART B (counts + actual pin lines, .opencode skill)

- 9/1 early-exit INSTANCE s78 = 1: `- 9/1 early-exit INSTANCE (his words 2026-09-23: exit should not be full -1R; exit one candle before at the 17:45 close on the Y-POC bearish gap-break; Y POC 1.15987 vs 17:45 close 1.15984)`.
- ANCHOR-RANK BREAK RULE s36 = 1: `- ANCHOR-RANK BREAK RULE (his words 2026-09-23, verbatim: "the 9/4 trade POI entry originate from the same Y POC, so when the same Y POC crossed it over it does not matter. while the 28 originates from the D VWAP which i have explained and stated on the nuance of the VWAP hierarchy is lower than the POC/AVP")` + `(a) SAME-LINE-NO-EXIT` + `(b) HIGHER-BREAK-EXITS` halves on the same line.
- POC-SUPREMACY s87 = 1 heading (+1 name-reference inside OWN-SOURCE-EXCLUSION): `- POC-SUPREMACY (his words 2026-09-25, verbatim: "do not forget the POC is higher than the VWAP and with POC it does not matter if the break comes from it's own or the same hierarchy.")`.
- UNIVERSAL day-close s28 = 1, tail: `BREAK-leg next-open untouched` (line: `... the v225-era weekend-gap-nextOpen semantic is retired for DAY_CLOSE by this later word; BREAK-leg next-open untouched.`).
- Append nothing.

## S0 GRADING (exact relay predicate; script grade_s0_b134.ps1 on EXITS-B131/*.csv)

- Strict run (trigger=1 + rank strictly above anchor; ranks Y2/M-POC6/M-VWAP7/W-POC8/D-POC10/D-VWAP11; unknown ranks never pass):
- A1: anchor=Daily-VWAP first=2026.08.28 11:30 SHORT o=1.1644 c=1.16463 Daily-POC=1.16451 barpack=351 censpack=355 exitBar=2026.08.28 11:40
- A2: anchor=Monthly-VWAP first=2026.09.01 17:45 LONG o=1.16002 c=1.15985 Yearly-POC=1.15987 barpack=54 censpack=69 exitBar=2026.09.01 17:50
- A3: anchor=Yearly-POC first=NONE exitBar=2026.09.04 23:50
- A4: anchor=Weekly-POC first=NONE exitBar=2026.09.07 10:50
- A5: anchor=Weekly-POC first=NONE exitBar=2026.09.07 17:10
- A6: anchor=Monthly-POC first=NONE exitBar=2026.09.08 10:40
- A7: anchor=Monthly-POC first=NONE exitBar=2026.09.08 17:30
- B2: anchor=Monthly-POC first=NONE exitBar=2026.06.05 19:15
- B3: anchor=Daily-POC first=NONE exitBar=2026.06.11 15:20
- C-05-27: anchor=Daily-POC first=NONE exitBar=2026.05.27 20:05
- C-06-03: anchor=Daily-VWAP first=NONE exitBar=2026.06.03 09:55
- C-06-04: anchor=Daily-POC first=NONE exitBar=2026.06.04 10:40
- vs B-133 S1: A1 DIFFERS (S0 11:30 vs S1 11:40); A2 + all others match; 4 June NONE-via-rank matches (same-line reported, never counted). = STOP.
- No-rank sanity variant (parser check only): A1 11:30 D-POC; A2 17:40 M-VWAP own-anchor; A3 16:05 Y-POC same-line; A7 17:00 M-POC same-line; B3 14:40 D-POC same-line; C-05-27 17:10 D-POC same-line; C-06-04 09:55 D-POC same-line; A4/A5/A6/C-06-03/B2 NONE. All same-line rows rank-excluded in the strict run, as S1.

## A1 RAW ROWS (EXITS-B131/A1.csv; UJBARMAP o/c vs D-POC census val/trigger)

- pack 332 / j866142 / 11:30 pass: `UJBARMAP bar=2026.08.28 11:25 o=1.16445 h=1.16459 l=1.16440 c=1.16441 ... dpoc=1.16532 dvwap=1.16480`
- pack 336 / j866146: `EXITCENSUS bar=2026.08.28 11:25 dir=SHORT line=Daily-POC val=1.16532 side=behind trigger=1 bodyLo=1.16440 bodyHi=1.16445 verdict=ok`
- pack 351 / j866161 / 11:35 pass: `UJBARMAP bar=2026.08.28 11:30 o=1.16440 h=1.16471 l=1.16440 c=1.16463 ... dpoc=1.16451 dvwap=1.16479`
- pack 355 / j866165: `EXITCENSUS bar=2026.08.28 11:30 dir=SHORT line=Daily-POC val=1.16451 side=ahead trigger=1 bodyLo=1.16440 bodyHi=1.16464 verdict=ok`
- pack 356 / j866166: `EXITCENSUS bar=2026.08.28 11:30 dir=SHORT line=Daily-VWAP val=1.16479 side=behind trigger=1 bodyLo=1.16440 bodyHi=1.16464 verdict=ok`
- S0 on bar 11:30: SHORT behind L>o = 1.16451>1.16440 TRUE; through c>L = 1.16463>1.16451 TRUE; trigger=1; rank 10<11. QUALIFIES (machine side=ahead on nextOpen 1.16464, hence held).
- pack 370 / j866181 / 11:40 pass: `UJBARMAP bar=2026.08.28 11:35 o=1.16464 h=1.16466 l=1.16444 c=1.16455 ... dpoc=1.16451 dvwap=1.16479`
- pack 378 / j866189: `EXITCENSUS bar=2026.08.28 11:35 dir=SHORT line=Daily-POC val=1.16451 side=ahead trigger=1 bodyLo=1.16454 bodyHi=1.16464 verdict=ok`
- pack 394 / j866205 / 11:45 pass: `UJBARMAP bar=2026.08.28 11:40 o=1.16454 h=1.16454 l=1.16436 c=1.16438 ... dpoc=1.16451 dvwap=1.16479`
- pack 398 / j866209: `EXITCENSUS bar=2026.08.28 11:40 dir=SHORT line=Daily-POC val=1.16451 side=behind trigger=1 bodyLo=1.16439 bodyHi=1.16454 verdict=BREAK`
- S0 on bar 11:40: behind L>o = 1.16451>1.16454 FALSE (own-body would NOT exit here; machine BREAKs on nextOpen body).
- pack 410 / j866221: `EXITVERDICT bar=2026.08.28 11:40 ... vBREAK=Daily-POC ...`
- pack 411 / j866222: `MTEXIT bar=2026.08.28 11:40 reason=POI_BODY_BREAK line=Daily-POC lineVal=1.16451 entry=1.16466 exit=1.16439`

## A2 RAW ROWS (EXITS-B131/A2.csv; kept exit for reference)

- pack 54 / j880343 / 17:50 pass: `UJBARMAP bar=2026.09.01 17:45 o=1.16002 h=1.16018 l=1.15984 c=1.15985 ...`
- pack 69 / j880358: `EXITCENSUS bar=2026.09.01 17:45 dir=LONG line=Yearly-POC val=1.15987 side=ahead trigger=1 bodyLo=1.15987 bodyHi=1.16002 verdict=ok`
- S0 on bar 17:45: LONG behind L<o = 1.15987<1.16002 TRUE; through c<L = 1.15985<1.15987 TRUE; trigger=1; rank 2<7. QUALIFIES (machine side=ahead on nextOpen equality 1.15987==1.15987, hence held — B-133 cause (ii) stands).
- pack 77-78 / j880369: `UJBARMAP bar=2026.09.01 17:50 o=1.15987 h=1.16002 l=1.15972 c=1.15975 ...`
- pack 94 / j880386: `MTEXIT bar=2026.09.01 17:50 reason=SL line=- lineVal=- entry=1.16022 exit=1.15975` (deal #5 17:51:04 at 1.15975, pack 74).

## RECORD LINES (exact)

- X1 §4: SKIPPED (lesson contradicted by S0; no `B134-` in CONTEXT, verified 0).
- X2 §5: SKIPPED (session-profile unverifiable; no `relay B-134` in CONTEXT, verified 0).
- X3 §3: `- B-134: kept-build trial of the break exit judged on the candle's own body (1 Sep 17:45 Yearly POC) stopped at the S0 separator (A1 11:30 also qualifies, kept 11:40 exit would move); no source edit, compile or run; verdict STOP.`
- X4 ledger `1279.` tag `B134-A2-BRK-OWNBODY` (S0 + STOP + SHA note).
- X5 register: untouched (KEPT-only; no NOTE).
- X6 pointer: verdict STOP; full EA/EX5 SHAs; lane stays 1 of 6 + B-134 STOP; census updated; goal open.
- Pre-commit: X3 count 1; X4 counts 1 (`1279.`-class), `1278.` = 1; staged = result, slice, ledger, pointer, HANDOFF; no source/EX5/journal/log/settings diff beyond staged.

(End of slice)
