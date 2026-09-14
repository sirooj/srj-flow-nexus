# BUILDER RESULT RECON19-ORIGIN1 (P-ORIGIN-1) — REGRESSION FAIL, candidate dead, Sep-8 NOT REACHED

Diagnostic build EA `97FCED1D81642AD15FB0576FB7E0584A5E2168F197634639DC2787BD68959DDE`
(444437 B, UNCOMMITTED — no commit token; failed-gate build stays on disk only);
FlowLogic `3606BFB4…25911` unchanged; both compile 0 errors / 0 warnings
(`06_HANDOFFS\T162_ORIGIN1A_*COMPILE.log`). RECON19-ORIGIN1 DONE=PASSED
22:14:40 (Test passed in 0:55:12.464; 563338 ticks, 3168 bars). Archive
`06_HANDOFFS\RECON19-ORIGIN1_JOURNAL.log`: SHA256
`B4797591770F2C5BCC75A2B3B48043F4137A6312DED4145218B4965B3D5D84F8`,
18730 lines, bounds [153936..172665] contiguous from 18b, purity 1/4/481.
Freeze `06_HANDOFFS\BUILDER_FREEZE_PORIGIN1.md` (pre-execution; entries,
expected identities, rule declaration, manifest). Tabulation
`06_HANDOFFS\RECON19-ORIGIN1_TABULATION.txt`; joins
`06_HANDOFFS\RECON19_GATE_JOIN.txt`. Production paths byte-untouched by
construction (diagnostic reads + prints only; memo struct gained
sidecar fields, keys/lookup/replacement untouched).

## Gate 1 — regression: FAIL (rows=5 fail=3). Candidate dead.

`ORIGINREG_FINAL rows=5 fail=3`. Diagnostic = declared time-ordered
second-back rule with frozen HAND entries (skip-witness + candidate
printed per row):

| ID | entry | expected (retained) | observed 2nd-back (skip-witness) | resid | match |
|---|---|---|---|---|---|
| R1 Aug-28 10:00 SHORT | 1.16466 | 1.16508/s42/06:30/i0 | 1.16481/s3/09:45/i0 (skip 1.16491@09:55) | −27 | 0 |
| R2 Sep-4 10:35 SHORT | 1.16265 | 1.16299/s13/09:30/i2 | 1.16299/s13/09:30/i2 (skip 1.16289@10:30) | 0 | 1 |
| R3 Sep-4 15:55 LONG | 1.16018 | 1.15847/s5/15:30/i0 | 1.15847/s5/15:30/i0 (skip 1.15902@15:45) | 0 | 1 |
| R4 Sep-7 09:15 LONG | 1.16135 | 1.16098/s7/08:40/i0 | 1.16103/s3/09:00/i0 (skip 1.16102@09:10) | +5 | 0 |
| R5 Sep-7 16:40 LONG | 1.16261 | 1.16238/s7/16:05/i0 | 1.16239/s5/16:15/i0 (skip 1.16240@16:30) | +1 | 0 |

Implementation fidelity evidenced: R5's skip-witness is exactly his
documented 16:30 skip (1.16240@16:30) — the walk implements his stated
rule, and the gate still fails. Per the pre-declared gate the his-entry
candidate DIES here. No alternative origin is proposed or tested (packet:
any alternative requires a newly issued declaration).

R5 reading preserved for council (both resids on the row): observed
1.16239@16:15 = his FILED stop exactly (filedResid 0), but the gate
demanded RETAIN of the current 1.16238@16:05 identity (resid +1 → MISS).
Whether retain was the right demand is a ruling input, not a ruling —
filed as measured.

Anatomy (mechanics only): R2/R3 reproduce under BOTH rules (ext-1 ==
2nd-back there). R1's stop (06:30 extremity) is unreachable by
time-ordered count from a 10:05 entry (2nd-back lands 09:45, −27) — his
documented time-rule does not cover Aug-28. R4 same shape (+5, lands
09:00 vs his 08:40). The five do not share one time-ordered rule.

## Gate 2 — Sep-8: NOT REACHED (not scored, not failed)

In-run gating worked: both T-bars printed `ORIGINCAND_SKIPPED`
(regN=5 regFail=3, EA side LONG both bars as ever). `ORIGINCAND_FINAL
rows=0`. E46 −7/+85 stays the closed record, untouched.

## Gate 3 — memo provenance: CLOSED

`ORIGINPROV_FINAL computesS2POLL=432 computesS3ARM=39 hitsS2POLL=0
hitsS3ARM=118 computesTotal=471`. Reconciliation with units stated:
471 memo-path COMPUTEs + 10 S5-directs (SLEXT481 S5=10) = 481 function
invocations; 118 HITs are non-invoking cache returns, ALL requested at
S3ARM, ALL agree (req-evalClose vs stored-evalClose 118/118), each
carrying its supplying genID (traceable off-run against the genID on
every SLMEMO COMPUTE line). The "10" are the ten S5-site invocations —
not assumed stop comparisons. Structural answer to the verdict's
provenance question: the S5 firing path never consults the memo
(S5-direct fresh computes only), so no S2POLL-bound value can serve an
S5 decision on this build. E47's single-origin caveat is discharged by
construction here (tags, not inference).

## Gate 4 — inertness: PASS

Twelfth join vs RECON11b: SLIMB/WALKOB/WALKFR 481/481 ×3 + SLIMBR 10/10,
zero mismatch, zero misses. slToday 10/10 identical vs RECON17.
Diagnostic classes width-clean (ORIGINREG max 370, SLORIGPV max 207,
trunc 0; ORIGINCAND class correctly absent — never emitted).
All other identities verbatim: four-signal set + SIGMAP 4/4, WS161,
481s, SLIMBR 10/0, MATCH 2/3/5, ORDER 6/6/4, SLEXT1 6/1/2/1, DECISION
10/4 @1.00, MTEXIT 4, MTLIFE 4, MTFLIP 1, N1EQUALS 28/26/0/3, E43
10/10/10, E45 6/2/2, E46 still 2/2 halted, E47 118/118, E48 8 S2POLL,
proxy 4/0/3/3, census 471/118/589, SUPPRESSED 152, spot 157.

## Disposition + asks

Complete closure fails at Gate 1 (regression FAIL → all downstream
gated). Run-B delta untouched (still suspended). Build stays UNCOMMITTED
(no token; failed-gate build). Council ruling owed: (a) accept the kill
+ NOT REACHED; (b) R5 retain-vs-filed reading (does the exact filed hit
reopen anything, or does retain stand?); (c) next direction — alternative
origin/rule declaration, per-trade rule treatment, or accept that
"second swing" as documented does not generalize (R1/R4 shapes on
record). Builder recommends nothing beyond the measurements; the
alternative must be declared, not inferred.
