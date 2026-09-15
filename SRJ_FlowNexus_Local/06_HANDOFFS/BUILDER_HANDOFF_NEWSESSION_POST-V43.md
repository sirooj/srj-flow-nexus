# BUILDER HANDOFF — NEW SESSION POST-V43 (thorough, self-contained)

**Supersedes:** `BUILDER_HANDOFF_NEWSESSION_POST-V30.md` and `BUILDER_HANDOFF_NEWSESSION_POST-V37.md` (both stale: pre-A6 arc). New session starts at §9–§10.

## §0. Corrections carried (never re-ask)
- S1 first swing = 09:50 HAND (Addendum 2); S2 first 16:50 / second 16:20@1.16274 HAND. Blank-(a) closed Sep-14; record-first defect owned twice (v22-questions, S1-blank).
- Session/record dates read 2026-09-14 where the relay record says so (v38 S2 strike owned); runs stamped 2026-09-15 by the terminal clock. Both true, different clocks.
- "Slot-758" (criterion text) = eval shift; swing slot = 7. Same R4 row, different operands — never conflated.

## §1. Goal + scope
- GOAL: the EA (alert-only, never executes) must agree with the operator's journaled EURUSD M5 trades structurally. KPI = STRUCTURAL AGREEMENT between documented strategy and code.
- Journal scope: filed KipExcel rows #257/#280/#281/#283 (four fired: Aug-28 LONG, Sep-4 NY, Sep-7 AM LONG, Sep-7 PM) + Sep-4 10:35 SHORT considered-then-taken (recovery YES) + two Sep-8 SHORTs (London 10:10, NYAM 17:00, both HAND, both mapped 09:50-limb / 16:20-second-swing). Sep-8 journal blanks are TIMING (handed over pre-input), not missing.
- Strategy of record: Part A Spec v4.2 (only spec on disk, 396 lines, read whole) + `GOAL_STATEMENT.md` + `CHARTER.md` + `06_HANDOFFS\BUILDER_STATEMENT_FUNDAMENTAL_RULES.md` (record-only restatement: setup independence TF-bias-only/MR-sweep-only; conditional stop 1-away-with-imbalance / 2-away-without + wick nuance; side = HTF 1H+15m; R>=1.0 Dukascopy-always; filed-authoritative; exact barTime+price).

## §2. Rules + conventions (builder obeys, never invents)
- Filed-authoritative: where code and his levels differ, his level rules and code is under test. Exact barTime+price, no tolerance/absorption. Signal-bar close = decision instant. Dukascopy ALWAYS. Takes flat 1.0R (iff R>=1.0).
- Exits on record: R1 scratch; R3 1.16302; R4 1.16200; R5 1.16318; S1 1.16102; S2 TP unstated (gap, stays gap). R2 1.16224 moot (MUST-DECLINE).
- Dual-key: BOTH streams rule every relay; EITHER halts; both must name a packet identically or nothing builds. Print-only amendment (standing): Astra-sufficient for print-only; dual-key mandatory for selection changes. Opus never signs keys (review-only, non-blocking); Astra key + run word authorizes print-only build+run.
- Relay discipline: single live relay; version + ruling-ID ack every relay; full branch coverage (no relay spent deciding the next relay); relays self-contained (file-blind streams, operative text inline); relay-count minimized over prompt length (his labor is the scarce resource). Filed relays/records are READ-ONLY (two edit-anchor lessons owned). Every deliverable named by exact file with read-vs-paste instruction. Pre-send ritual runs before anything leaves the desk (record-first search + measured numbers + verbatim verdicts + fresh-disk relay + named files).
- Instrument law: DIGESTS ARE IDENTITY (mtools bump mtimes); digests never prove adherence (filed audit must cover current digest before any build/run); zero-counts re-proved with a second pattern; WRAPPER is the archive method (segment+SHA+count+bounds); never read the day log whole; ONE cheap probe per poll, zero sleeps; run completion signal is HIS.

## §3. Seven-row trade table (code names R1-R5/S1-S2)
| ID | Bar | Side | Filed stop | Status on record |
|---|---|---|---|---|
| R1 Aug-28 10:00 | LONG | 1.16508@06:30 HAND | MATCH (ext-1 R 2.429; MONO-only) |
| R2 Sep-4 10:35 | — | 1.16299 hypothetical | MUST-DECLINE (invalid setup, his ruling) |
| R3 Sep-4 15:55 | LONG→? | 1.15847@15:30 HAND | filed MATCH (R 1.661) |
| R4 Sep-7 09:15 | LONG | 1.16098@08:40 HAND | SELECTED live-1SWING, guaranteed (RECON27) |
| R5 Sep-7 16:40 | LONG | 1.16239@16:15 filed-only | code prefers retained 16:05 (tie-break defect, open) |
| S1 Sep-8 10:10 | SHORT | 09:50 high (bar-read; his stop 53pts) | TRIGGER_UNRESOLVED (limb 1.16251/1.16233/1.16250 held; retest+LTF+confirm+div missing) |
| S2 Sep-8 17:00 | SHORT | 16:20 second swing | CQD-probe row only (TP unstated) |

## §4. Why the EA won't take them (two failure levels, measured on digest C24460B6)
- NEVER-BORN: no SHORT row evaluated at either Sep-8 bar; LONG carried through both (side owner `g_dir = S2ResolveLive(...)` EA:6793 — violation).
- MIS-STOPPED: stop branch on obValid only (EA:4820 — violation, imbalance never consulted); adoption OFF (EA:71 — violation); R5 tie-break prefers retained; R4 fractal path walks away (live leg proven Present-and-chosen, fractal Absent).
- Adherences holding: R gate 1.0 (EA:57), alert-only OrderSend-0, setup-independence classification, divergence latch. Proof: `06_HANDOFFS\BUILDER_FINDING_ADOPT-READINESS.md` + `...-ADD1.md` (current digest).

## §5. Code state
- EA C24460B6… (531778 B, UNCOMMITTED) = 835C164F + pairing-key fix. FlowLogic 3606BFB4 frozen. Fixture E9E6F710… (7704 B, UNCOMMITTED). HEAD `5cc58d3` (records post-V43, local only, NO push). Tree = exactly 4 paths: EA modified + fixture/debris-×2 untracked. RECON17 frozen baseline of record. No run active; slot free; harness idle.

## §6. Ledger (v38→v43 arc, full text in AGENTS.md §11 items 89–102)
- v38 split on name → v39 crossed (substance identical, one string wide) → v40 DUAL ISSUANCE `A6-PRINT-ONLY-RECORDERS-001` → v41 Astra CLEAR (+Opus review 6 findings, 1–3 built as gates) → RECON26 built+run (DONE=PASSED 02:49:21; 3/4 + C2 FAIL-with-owned-mislabel) → v42 Astra CLEARs `A6-DECISION-PAIRING-001` (+Opus 4 pre-declared checks) → RECON27 built+run (DONE=PASSED 05:46:54; 4/4 PASS; D7 first fire; R4 now by construction; count flat 1024) → v43 DUAL ACCEPT-QUIESCENT. No conflicts anywhere; every ask agreed.
- Archives: RECON26 38002/7420420B/87B74384/[0..38001]; RECON27 38005/7420760B/105099E1/[38004..76008]. Extracts 11 lines each. All families diff-0 (481/16/14376/168/5/2, SUPP-legacy 156/156, 4/4 signals, 0 halts).

## §7. Council + packets
- Design `GPT-V37-A6-001` + `OPUS-V37-DSN-001`; issuance `GPT-V40-ISS-001` + `OPUS-V40-ISS-001`; clearance `GPT-V41-CLR-001`; repair `GPT-V42-A6REC-001`; accepts `GPT-V43-A6FIX-001` + `REV-A6FIX-003`/`A6FIX-ACCEPT-QUIESCENT-001`. Verdicts verbatim in `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md` / `BUILDER_VERDICTS_SLDEF4-5.md`. Relays v38–v43 in `06_HANDOFFS\`. Opus thin-D7 observation carried-not-scoped. NOTHING pre-authorized; next packet needs fresh keys.

## §8. Outstanding + adoption roadmap (owners)
- OPERATOR (leisure, blocking nothing): 08:40 formation detail (only blank that reshapes R4 design); N1 wick; flats read. Tokens owed someday: debris deletion, canonical commit, push/origin refresh.
- COUNCIL (blocking): 1) geometry ruling (which leg the conditional rule walks — live leg evidenced); then 2) side-owner, 3) stop-branch, 4) Sep-8 generation fix packets (dual-key each; print-only riders Astra-sufficient). Next suggested relay: v44 geometry-issuance ask (rules + Sep-7 per-path split inline).
- BUILDER: on keys + run word — build, run (~1h, ceiling 90, same ini/range), grade vs his journal, relay. Expect 2–3 run hours across fixes 2–4.

## §9. REQUIRED READS (exact paths; MUST before acting)
- MUST: `AGENTS.md` §1–§11 (esp. §10 checklist incl. adherence gate, §11 items 89–102); this handoff §0–§8; `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_CHECKPOINT_POST-V43.md`; `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_RECON27-A6FIX.md`; both v43 verdict sections; `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_STATEMENT_FUNDAMENTAL_RULES.md`.
- SHOULD: `SRJ_FlowNexus_Local\00_CURRENT_WORKING\SRJ Flow Nexus — Part A Specification v4.2`; `BUILDER_RESULT_RECON26-A6REC.md`; `BUILDER_FINDING_ADOPT-READINESS-ADD1.md`.
- AS-NEEDED: relays v38–v43; RECON26/27 extracts + journals; `.clinerules` (long archive).

## §10. Resume
1. §10 checklist (re-hash 4 baselines vs §5; read-only git log/status; latest result + verdicts).
2. Adherence gate before any build/run request.
3. Do nothing else until a directive or dual-cleared packet is on the table (continuous-execution order covers cleared builds only).

## §11. Session lessons banked (all standing, all in AGENTS.md)
- Structural rounds (92): file-blind fresh-session streams negotiate through him; tripwires are his protections; names cost (future keys quote them).
- Relay-count-first (92-correction): full branch coverage every relay; bigger prompts beat more trips.
- Cost discipline: dense multi-ask relays; pre-declared convergence; name-derivation before voting; Astra-sufficient print-only fast path.
- Freshness-coincidence (102a); graceful-first hygiene (102b); caveat-as-regression-target (102c); pre-declared delta (102d); thin-coverage carried-not-scoped (102e); dual-ID filing (102f).
- Zero-count rule; anchor hygiene; missing-artifact-fails-step; verify-every-write; record-first question gate; self-contained relays; why-not-last-time; close-the-loop; resume-prompt rule; post-relay checkpoint practice.
