# WORK ORDER — RECON31-FIXSPLIT (UNBUILT, UNAPPROVED, NO AUTHORITY SPENT)

**Status:** builder-drafted execution plan for converged packet (B) `SIDE-1P-FIX-SPLIT`. Records-only. NOT a council packet, NOT clearance, NOT a token. NOTHING below executes without dual-key + selection token + fresh run word. Canonical tree untouched by this file.

## 0. Pre-conditions (all must already hold; re-verify at execution, never cite)

- EA `E68E0AE38CB0C968132368C6BDD45E155C55B956A7FE4A06260AE43E55700057` (559189 B) + FlowLogic `3606BFB4` + fixture `E9E6F710…`.
- Dual-key for (B) + his selection token + his fresh run word (~1h, ceiling 90, same ini/range).

## 1. STAGE-1 gates (before any write; any fail = REPORT+HALT, revert nothing)

1. Full-SHA256 + byte count of the EA match §0 (abbreviations never substitute).
2. `InpAdoptExt1=false` (EA:71) mechanically confirmed (AdoptOff=1 shadow run).
3. `OrderSend(` count = 0; price literals six+hypo+1.16251 = 0; `SIDE1F_` disjoint pre-check (zero hits; no `SIDE1P_` residue).
4. Single-owner re-inventory: `g_dir` writers = init + reset + EA:7529 seed ONLY (cf. `06_HANDOFFS\BUILDER_FINDING_DIR_WRITERS.md`); zero gate tokens in EA:7503–7560 STILL holds; call sites STILL exactly EA:8163/8300.

## 2. Track-1 build (S1/chain-98/London — confirmation wiring, shadow)

- Insert AFTER the seed vote write sequence (EA:7529–7537 region), BEFORE any promotion: shadow consult `IsConfirmationCandle(barShift, g_anchorLine, g_dir, <shadow-term>)`.
- SHADOW SEMANTICS (AdoptOff=1): record the verdict in `SIDE1F_` variables + print; DO NOT alter the live seed (live seeds exactly as today). Proves "gate would have rejected 09:15" without changing behavior.
- FORBIDDEN: gate body touch; EA:8163/8300 touch; any live-state write from the shadow path; any new price literal.
- Attestation print (pre-declared): gate verdict per seed bar (`SIDE1F_T1GATE bar=… dir=… term=… live-seeded=1 shadow-reject=0/1`).

## 2b. Grade-note (journal-recorded 16:30–16:45 sequence, RECON30 archive)

- 16:30:00 ABORT FRESH_OB_DEAD (S4_ARMED, Yearly-POC LONG) → 16:30 SEED SHORT Monthly-POC → 16:35 CONFIRM_STRUCT_FAIL SHORT A_OPP (consumed, candidate stays) → 16:45:01 ABORT TP_RR_FAIL = "not worth 1R" (S5_GATE_CHECK, Monthly-POC SHORT) → reset → 16:45 SEED LONG Weekly-VWAP.
- Consequence for grading: a hierarchy-fixed SHORT must SURVIVE the R gate to read at the site — Track-2's "S2 SHORT-agree" prediction implicitly requires passing TP_RR_FAIL (his flat-1.0 rule, R>=1.0 unrounded). If the shadow SHORT resolves but dies on reward, that is a distinct R-gate datum (record it), not a hierarchy pass. Council confirms whether the threshold needs the survival clause stated outright.

## 3. Track-2 build (S2/chain-105/NY AM — hierarchy shadow, scoped)

- Shadow resolution at the chain-105 region: read the agreeing-4H/1H HTF-bias state into `SIDE1F_` shadow dir for the S2 site; live `g_dir` path untouched.
- 4H/1H-conflict = separately-printed residual state (never silently resolved one way).
- Single-owner assertion re-proven at build time (writer inventory §1.4 covers 105's upstream: exactly one voting call EA:7523 file-wide).
- FORBIDDEN: live `g_dir`/resolver/adoption/eligibility/order/stop/fixture/latch writes; 15m-takeover logic; conflict silent-resolution.

## 4. Shared build gates (fail = REPORT+HALT, no run)

- New disjoint prefix `SIDE1F_` (anchored); recorders passive (read assigned state only; zero resolver/latch call sites by name).
- Oracle-independence: roster side never an emission/resolver/adoption/eligibility/order/stop/latch input (grading join only).
- R1/R5 + R3/R4 regression-watch recorders (before/after direction-at-site; any move = REPORT+HALT, authorship).
- Both compile 0 errors 0 warnings, freshness-verified logs (`T162_SIDE1F_EA/FLOWCOMPILE.log`); FlowLogic untouched.

## 5. Launch + grade (RECON31-FIXSPLIT)

- Same `RECON1_P1.ini`/range; ceiling 90; STATUS/DONE markers; purity + MAXLEN + SELHALT; no third run; timeout → REPORT+HALT.
- Grade PER TRACK (never joint): Track 1 = gate-reject attested at 09:15-class seeds + S1 SHORT-shadow + watches still + isolation; Track 2 = S2 SHORT-shadow by hierarchy owner + watches still + isolation + single-owner held + AdoptOff=1 held throughout.
- Isolation join vs RECON30: all 19 families + SIDE1P2_9 + SIDE1P3_3 diff-0 outside `SIDE1F_` lines; signals 4/4 identical; AdoptOff=1 proven in-run.
- Artifacts: result `06_HANDOFFS\BUILDER_RESULT_RECON31-FIXSPLIT.md` + extract `06_HANDOFFS\RECON31_FIXSPLIT.txt` + archive `06_HANDOFFS\RECON31-FIXSPLIT_JOURNAL.log`.

(End — drafted 2026-09-15 from converged (B) + v62 gates + on-disk line numbers; executes on authority only)
