# BUILD RECORD — C0-PROBE (print-only null-effect probe; built + launched, awaiting his completion signal)

**Authority:** Luna CLEAR `C0-PROBE-001` (`06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md:4295-4329`, ONE print-only build + ONE run `C0-PROBE` exactly per `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v74-C0PROBE-CLEAR.md` §1) + Sonnet v74 review (`06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md:4968+`, catch folded as grade line) + his "i authorize the run" (handoff `06_HANDOFFS\BUILDER_HANDOFF_NEWSESSION_POST-V74.md` §0). Adherence gate SATISFIED pre-build (`06_HANDOFFS\BUILDER_FINDING_ADOPT-READINESS-ADD2.md`, 4+4 carried on `590BE614`). Scope: print-only, null-effect. NO selection change, NO commit/push/tag. RECON17 frozen.

## STAGE-1 (pre-write, all PASS)

- EA `590BE6140D6FF616BCDF2465B00B86DBBE19A8FCACB277C81041291ABB94E095` / 567138 B; FlowLogic `3606BFB4…25911` / 67515 B; CQD `BE6FD84F…A421F` / 50555 B; OBMGR `D286621C…20B7B` / 48050 B.
- ini `SRJ_FlowNexus_Local\00_CURRENT_WORKING\RECON1_P1.ini`: Model=4, InpDebugLog=true, 2026.08.26→2026.09.09.
- Working set as expected (EA modified = the `590BE614` build itself; AGENTS/pointer/verdicts = post-`133531b` records; fixture canonical untracked; debris ×2 untracked untouched).

## Edits (2, on `Experts\SRJ_FlowNexus_EA.mq5` only; both read-back verified)

1. **Resolver pass-through** (EA:3847-3854): `S2ResolveLive` body (live 4H/1H vote, 22 lines) → `g_s2_nLiveCalls++; g_s2_nLiveAgree++; return legDir;` (−14 lines).
2. **Suppression-effect delete + additive prints** (EA:7654-7692): `g_state = ST_IDLE;` write removed (consult + `SIDE1C_SUPP` print kept as would-suppress marker); new N1-neutral both-dirs block (`SIDE1C_BOTHDIRS` live/long/short terms) + `SIDE1C_CHAIN` (chainN=`g_side_n` pure read) (+33 lines).

## Builder derivations (packet-forced, pre-declared before the run)

- D1: resolver keeps counters, so `SEL61LIVE` agree==calls by construction — EXPECTED print delta (not behavior), graded as such.
- D2: suppression block is print-only; the S1 gate (`g_state == ST_S1_REGIME`) always proceeds, exactly as in RECON32.
- D3: both-dirs legs save/restore all six N1 counters each (same idiom as the neighboring consults) — N1-neutral by construction; static `IsConfirmationCandle` sites 6→8 (2 additive, named here).
- D4: `SIDE1C_` sites 1→3 (SUPP/BOTHDIRS/CHAIN), prefix-disjoint from every other family; all three prints <150 chars (MAXLEN-537 safe by construction).
- D5: `g_s2_seedShift` write kept as DEAD write (resolver no longer reads it) — behavior-neutral, minimal diff.
- D6: zero new price literals, zero new indicator reads, zero gate/seed/fire/stop/latch/fixture/eligibility writes; AdoptOff held (EA:71 false); `OrderSend(` 0.

## Parity + compile

- `g_dir` writes 3; `OrderSend(` 0 (bare 1 = print literal EA:3993, two-pattern proven); `S2ResolveLive` defs 1; `ST_IDLE` writes 2 remaining (decl 955 + reset 6167, both pre-existing, two-pattern proven); FlowLogic hash unchanged.
- EA compile 0/0 (`06_HANDOFFS\T162_C0_EACOMPILE.log`, 5433 ms, mtime-fresh); Flow compile 0/0 (`06_HANDOFFS\T162_C0_FLOWCOMPILE.log`, 4674 ms, mtime-fresh; flow-script first-miss owned, direct re-issue OK per standing pattern).
- **New digest: EA `D0DD07AA0379A7046E7B7AB03325DB9A99B33D89408E7C80B970FC4D09F3BC18` / 568323 B** (+1185 B over `590BE614`).

## Launch `C0-PROBE` (2026-09-16 01:18:17, WMI PID 20712 RC=0 instant)

- Slot free (0 terminal64 / 0 metatester64); STANDBYIDLE AC/DC 0 held; same ini/range; ceiling 90; `TERMINAL_BUSY=False`; wrapper PID 7792 RUNNING.
- Fresh day log `Tester\logs\20260916.log`, PRE=0 (new-day rollover, same correct shape as RECON26's fresh-log start — NOT a contiguity break; `20260915.log` closed at 302786 past STAGE-C's 302785).

## Pre-declared predictions (grade vs these after his signal; Luna §1 + Sonnet catch)

- NULL-EFFECT: seeds 56/56 shared-zero-new-zero-lost; fires 4/4 byte-identical (R1 alive); TALLY 56/56/56; N1EQUALS; isolation 38-family + payloads identical; `SEL61LIVE` agree==calls (D1).
- CHAINN fork (both pre-registered): 0/0 → cascade-driven closes it; +5/+5 with zero re-seeds → reads NOT-dir-driven (Sonnet catch: shadow artifact to investigate, two-probe follow-up), NEVER the dir-driven line.
- Both-dirs table complete per seed (legacy+owned terms): answers S1∈split-6? and type-(ii) existence either way. 14:20 banked RULED as (row,dir) pairs.
- ANY behavior delta (seed/fire/signal/tally/isolation) → probe NOT null-effect → REPORT+HALT, no C1 inference. Clean run authorizes NOTHING further.

**Run word SPENT** (consumed by this launch); fresh word + tokens owed only AFTER authorship+clearance for any C1. HOLD for his completion signal — never poll with sleeps. Timeout/no-third-run → REPORT+HALT.
