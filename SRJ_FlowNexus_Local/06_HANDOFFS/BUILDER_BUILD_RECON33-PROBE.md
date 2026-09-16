# BUILD RECORD — RECON33-PROBE (`D-BIRTH-PROBE-001` loser-exposure; built + launched, awaiting his signal)

**Authority:** Luna CLEAR `V82-PROBE-01` (`06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md`, quotes packet whole §1-12, print-only, NO tokens) + Sonnet v82 review (keyless: bare-print + six-list adopted as build gates) + his run permission this turn ("proceed with those things until the run"). Scope: ONE print-only build + ONE run. NO selection change, NO commit/push/tag. RECON17 frozen.

## STAGE-1 (pre-write, all PASS)

- EA `D0DD07AA…`/568323 + FlowLogic `3606BFB4…`/67515 (exact pre-build match); ini Model=4/InpDebugLog=true/08-26→09-09; working set as expected; adherence ADD3 filed covering `D0DD07AA` (4+4 carried, gate SATISFIED).

## Edit (1, `Experts\SRJ_FlowNexus_EA.mq5` EA:1944-1958, read-back verified)

- Bare loser-exposure print inside `DetectPoiRetest`, after selection (1940-1943), before E19 counters: `SIDE1D_BOTHDIRS bar/bl/br/sl/sr/sel/sline/scode/lcode` (Luna 7 fields + selected+loser line-code reads) + six-forbidden-write comment block. Emit iff a side qualified (`bestLongLine>=0 || bestShortLine>=0`). No struct change; no second scan; no N1 touch; `InpDebugLog`-gated.

## Builder derivations (packet-forced, pre-declared)

- D1: bare-print form (Sonnet refinement, stricter than Luna's neutral text): zero new calls, zero new writes — not even a struct field — so N1-untouchability holds BY CONSTRUCTION (nothing to save/restore).
- D2: six-forbidden list attached as comments AND grade-verified (g_dir writes 3, OrderSend 0, ST_IDLE writes 2 pre-existing, no new indicator reads — `iTime` only, pre-existing idiom).
- D3: emit-iff-qualified bounds journal volume (double-miss calls print nothing); per-call duplicates (seed block + t78 callers) deduped BY BAR at grade, pre-declared.
- D4: `SIDE1D_` new family, prefix-disjoint (1 site); line ~110 chars (MAXLEN-safe by construction).
- D5: selected fields read post-selection (`r.isLong`/`r.topLine` already set); loser index guarded (`-1` → `"-"`); line-code reads are pure array reads.
- D6: Luna §3 "line-code identity" satisfied for selected + loser; §4 N1 rule satisfied vacuously (no new encounters possible).

## Parity + compile

- `g_dir` writes 3; `OrderSend(` 0; `IsConfirmationCandle` 8 (unchanged — no second scan); detector defs 1; AdoptOff held; FlowLogic hash unchanged.
- EA 0/0 (`06_HANDOFFS\T162_PROBE_EACOMPILE.log`, 5274 ms, mtime-fresh; script-miss owned, direct re-issue OK) + Flow 0/0 (`06_HANDOFFS\T162_PROBE_FLOWCOMPILE.log`, 4605 ms, mtime-fresh; same pattern).
- **New digest: EA `3B5CA00BE690EA46E140D99DA442BAFA79FFA102E5418D3E7A1C1BD201522EB2` / 569412 B** (+1089 over `D0DD07AA`).

## Launch `RECON33-PROBE` (2026-09-16 03:43:43, WMI instant PID 440 RC=0)

- Slot free (0 terminals/agents); STANDBYIDLE AC/DC 0 held; same ini/range; ceiling 90; `TERMINAL_BUSY=False`; wrapper PID 19444 RUNNING; heartbeat advancing; PRE=2 (near-fresh log post-clearance); test range 08-26→09-10 as all prior runs on this ini.

## Pre-declared predictions (grade vs these after his signal)

- NULL-EFFECT: seeds 56/56 set-diffs 0; fires 4/4 byte-0 (R1 SHORT 2.43 alive); TALLY 56/56/56; PROFILE 56/56 match-1; N1EQUALS identical; isolation delta-0 vs C0 on ALL families (incl. SIDE1C 8/56/56, SEL61LIVE 56/56/0, WS161 205); MAXLEN cap; SELHALT 0.
- PROBE: `SIDE1D_BOTHDIRS` rows present (bar-deduped at grade); S1 09:15 row classification READ at grade as A/B/N (never pre-declared — tuning to S1 is REPORT+HALT); no N1 double-count (N1EQUALS + isconf-sites-8 prove it).
- ANY behavior delta (seed/fire/signal/tally/isolation/N1) → probe NOT null-effect → REPORT+HALT, no mechanism inference. Clean run authorizes NOTHING further (predicates authored FROM evidence next round).

**Run word SPENT** (consumed by this launch). HOLD for his completion signal — never poll with sleeps. Timeout/no-third-run → REPORT+HALT.
