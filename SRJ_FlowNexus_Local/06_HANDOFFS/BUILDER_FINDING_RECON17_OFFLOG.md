# BUILDER_FINDING — RECON17 off-log owed (verdict #6 terms + verdict #7 Ask-1 series)

## 1. SUPPRESSED series (Ask-1: quote as a series, name the build or annotate)

Head-anchored pattern `[SRJ-EA] SUPPRESSED bar=`, one count per archived
run (findstr, exact):

- RECON10-SWINGIMB3: 152
- RECON11-SLDEF: 152
- RECON11b-SLDEF: 152
- RECON12-NEWS: 152
- RECON12b-NEWS: 152
- RECON12c-NEWS: 152
- RECON13-SLDEF2: 152
- RECON14-SLDEF3: 152
- RECON15b-SLDEF4: 152
- RECON16-SLDEF5: 152
- RECON16b-SLDEF5: 152
- RECON17-SLDEF6: 152

Unanchored `SUPPRESSED` on 16b/17: also 152 (every occurrence is a bar=
line; no non-bar population). The quoted 156 occurs in NO archive on
disk under either pattern. No build moved it; no edit to name. Account:
156 was prose-carried (pre-segment or different-population origin,
predates the archived series) and is ANNOTATED, not accepted —
superseded by the flat-152 measured series. Accounted value for run A
gates: **152**.

## 2. RECON16b archive record restated (prior-verdict outstanding)

Purity 1/4/481 (4 signals / MTEXIT 4 / SLIMB 481). SHA
`4740FA3B9DFFAA92A97881EE4A170C56CB0CB94DB0B60DC1227BC03810A15752`
(3402790 B). 17954 lines, boundaries [80330..98283]. Wrapper-archived
(RECON16b-SLDEF5 DONE=PASSED 15:25:32, Test passed 0:56:30.538).
Already stated in `BUILDER_RESULT_RECON16b-SLDEF5.md` header and
AGENTS §11.23; restated here verbatim to close the term.

## 3. ORDER biasOpposedAtGate × gateOutcome cross-tab (16 rows, RECON16b)

opp=0: DIV_WAIT 5, PASS 3, RR_FAIL 5 (13 rows).
opp=1: DIV_WAIT 1 (2026.09.01 10:10), PASS 1 (2026.09.04 15:55),
RR_FAIL 1 (2026.08.27 17:00).

Full rows (barTime opp outcome): 08-26 14:40 0 RR_FAIL; 08-27 17:00 1
RR_FAIL; 08-27 17:10 0 DIV_WAIT; 08-28 10:00 0 PASS; 08-28 16:20 0
RR_FAIL; 08-31 16:35 0 DIV_WAIT; 09-01 10:10 1 DIV_WAIT; 09-01 16:10 0
DIV_WAIT; 09-01 16:50 0 DIV_WAIT; 09-04 09:25 0 RR_FAIL; 09-04 09:40 0
DIV_WAIT; 09-04 10:35 0 RR_FAIL; 09-04 15:55 1 PASS; 09-07 09:15 0 PASS;
09-07 16:40 0 PASS; 09-08 16:40 0 RR_FAIL.

Opposed-PASS = 15:55 only (concentration unique, as relayed). No
flipNewThisBar=1 row passed (flip&&PASS=0). Source: 16 ORDER lines,
`06_HANDOFFS\RECON16b-SLDEF5_JOURNAL.log`, keyed barTime.
