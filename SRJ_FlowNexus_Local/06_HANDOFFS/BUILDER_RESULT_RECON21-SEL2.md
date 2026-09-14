# BUILDER RESULT RECON21-SEL2 (P-SEL-2) — BLOCKED: TIMEOUT_60MIN, end-of-run unreached

Build: EA `150A61596F9895C2EA39F9BBA5576E98CE6C0566E9C12094747254218E854FFA`
(474883 B, P-SEL-2 E57–E59 + Astra clarifications + Opus A1–A5, uncommitted);
FlowLogic `3606BFB480A34B5ED4357588DDAFDFE8F7DF2224DA34C6A220EA49F506725911`
unchanged. Launched 10:19:58 PID 15240, PRE_JOURNAL_LINES=40979
(contiguous from RECON20b). DONE file: `RESULT=TIMEOUT_60MIN`,
11:20:09 — the wrapper's 60-min ceiling, not a tester verdict.

## 1. Archive (wrapper self-archived; measurements verbatim)

- `06_HANDOFFS\RECON21-SEL2_JOURNAL.log`: 16992 lines (= STATUS
  ARCHIVED_LINES), 3319978 B, SHA256
  `8C0D0FB8A11E3C818F49C51EF4A80206B8B3143B355450D903025679F488F0FF`.
- Bounds: day-log lines [40980..57971] (PRE=40979 + 16992 = 57971 ✓).
- First: `GM	0	10:20:04.345	Tester	Local network farm switched off`.
- Last: `GQ	0	11:19:59.130	Core 04	2026.09.08 11:35:00   [SRJ-EA] SLIMB
  fields=19 bar=2026.09.08 11:30 …` — test-time died Sep-08 11:35, ~1.4
  test-days short of the Sep-09 23:59 end. End-of-run never executed.
- Purity: farm-off 1, cloud-off 1, Core-04-only throughout, Test-passed 0.

## 2. What landed (partial, on-disk)

- Signals 4/4 present (same four bars/prices as RECON17/20b).
- SLIMB-family partial: `SLIMB fields=19 = 425/481`,
  `SLIMBWALK fields=27 = 424/481`, `SLIMBWALKF fields=25 = 424/481`,
  `SLIMBR bar= = 9/10`.
- `OrderSend = 0` in segment (D3 print-only evidence, partial).
- End-of-run instruments: `SEL57 = 0`, `SEL57ROW = 0`, `SEL57END = 0`,
  `SEL58T = 0`, `SEL58CMP = 0`, `SEL58END = 0`, `SEL53 ex= = 0`,
  `SEL52_FINAL = 0`, `Test passed = 0`. The E57/E58 gating held
  (zero live prints by construction) — the instrument added no live log
  volume and is excluded as a slowdown cause to that extent.

## 3. Gate grades (v17 §4)

- **D1: REPORTED GAP** (missing prints — end-of-run unreached; coverage
  unassertable; this is NOT an empty list).
- **D2: REPORTED GAP** (same; no traces, no sentinels, no compares).
- **D3: UNEVALUABLE as evidence-validity gate** (isolation join needs the
  full 481; partials 425/424/424 + 9/10 prove nothing either way).
  Static holds: `InpAdoptExt1=false` (verified pre-run), OrderSend-src 0,
  OrderSend-segment 0.
- Per v17 §4 + both clearances: missing print grants NO automatic
  rebuild, rerun, or tuning authority. This run is REJECTED as evidence
  for D1/D2; it issues no selection verdict of any kind.

## 4. Pace autopsy (measured; cause of death: ceiling, not corruption)

- Wall time from farm-off to test-time Sep-08 11:35: RECON20b 02:54:12 →
  03:42:04 = 47:52. RECON21 10:20:04 → 11:19:59 = 59:55. Delta +12:03
  over identical test span, same ini/range, same machine.
- At RECON21's pace the window needed ≈ 68–70 min; the 60-min ceiling
  killed a healthy run ≈ 10 min short. Heartbeats continuous, agent alive
  throughout (no `connection closed`, no freeze — contrast RECON20 stall).
- EA-side slowdown cause: NONE established. Live behavior is
  print-identical to build-2 (E57/E58 print end-of-run only; live-print
  counts above are 0/0). Residual pace variance is environmental,
  cause UNKNOWN — owned as unknown, not speculated (host-sleep excluded:
  STANDBYIDLE AC/DC 0 verified pre-run; agent never died).
- Standing implication: a same-everything rerun succeeds iff pace lands
  under 60 min (RECON20b did 55:23 on this range). Repeat-timeout risk is
  real and is carried into the v18 relay as an explicit council question
  (keep ceiling vs authorize raising it — a harness change).

## 5. Disposition

BLOCKED (incomplete run). P-SEL-2 stays OPEN but ungraded — its gates
need a completed run. No code moves (none owed: the build is verified
0/0 + parity 196/196; rebuilding identical source adds nothing).
RECON17 stays frozen; build `150A6159…` stays UNCOMMITTED (no token).
Council ruling owed on the v18 relay (ONE rerun of the same build +
ceiling question + nothing-commits). No auto-rerun per both streams'
express terms.

## 6. Addendum 2026-09-14 (operator statement, post-filing)

Operator confirms he was running other heavy work on the machine during
RECON21-SEL2. Pace variance (§4 "cause UNKNOWN") is therefore explained
as host load, not an EA or harness defect — consistent with the
exclusion evidence (zero live prints, continuous heartbeats, agent
alive). No measurement above changes; the attribution is corrected from
unknown to operator-confirmed host load.
