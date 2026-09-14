# BUILDER FREEZE P-SEL-1 — reconciled dual-clearance record (Astra-5 + Opus-v14)

Dual-key MET 2026-09-13: both streams named P-SEL-1 (E51–E56), one
print-only build + full-window run. Reconciliation (stricter wins, no
conflict — nothing below contradicts any cleared line):

- Decision instant (BOTH descriptions = one instant): close of the signal
  bar = the bar immediately preceding the fill/entry bar. R1 10:00→10:05,
  R2 10:35→10:40, R3 15:55→16:00, R4 09:15→09:20, R5 16:40→16:45.
  Force-eval anchors (uniform rule: close of bar preceding the entry bar):
  R2 10:35 close, S1 10:05 close, S2 16:55 close. Closed-bar decisions
  only; no intrabar events.
- Start-offset THREE settings (Opus amendment, inside the declared
  dimension): O1 signal-bar-inclusive, O2 fill-bar-inclusive, O3 strictly
  prior to signal. Start index s ∈ {signalIdx, fillIdx, signalIdx−1};
  counted fractals must still satisfy barTime ≤ decision instant +
  availability (so O2 differs from O1 only if a fractal sits on the fill
  bar itself — shown, not assumed).
- H1 projection (builder call, pre-declared): an H1 fractal reports the M5
  bar containing its extreme (exact rule, not tolerance). Source-fractal
  timestamps preserved in provenance; no relabeling.
- K2 (confirmation-including) variants printed but G1-INELIGIBLE even if
  their stops confirm (Astra binding).
- Labels: FRACTAL_UNAVAILABLE / AMBIGUOUS_IDENTITY (print all tied, match
  none) / INVALID_GEOMETRY (print operands) / TARGET_UNSTATED (S2 only).
- CQD printed-never-consumed; no P-SEL-1 path reads it; fix packet
  sequenced after, separate authorization.
- G1 = 4/4 exact (R1/R3/R4/R5) on one eligible variant; R5 target filed
  1.16239@16:15 ONLY, dual-printed vs 1.16238@16:05 for every variant;
  eligible count (12) printed beside example count (4); no absorption,
  no substitution, no tolerance.
- G2 REPORTED (R2/S1/S2 force-eval prices); disagreement blocks adoption,
  never erases a G1 pass. R2-takes-everywhere PRE-REGISTERED (R 1.206
  clears 1.0; threshold cannot explain the decline; adoption blocked by
  construction on all branches — expected, not failure).
- Pre-registered R (unrounded): R1 2.43, R3 1.66, R4 1.76, R5 2.59 filed
  (2.48 retained), S1 1.94, R2 1.206, S2 uncomputable (TARGET_UNSTATED).
- Desk prediction (graded, not gated): monotone-outward wins R1 at 06:30.
- Isolation: adoption off verified before+after; selection outputs join vs
  RECON17 zero-mismatch or run rejected. Failure: no G1 passer → dead, no
  rerun/tuning. Build base = current tree (ORIGIN code dormant-uncalled).

## Variant matrix (24 total, 12 eligible) — recorded pre-run, no amendment after

O ∈ {SIG=signal-inclusive, FILL=fill-inclusive, PRIOR=strictly-prior} ×
C ∈ {RAW=sequence, MONO=monotone-outward} ×
K ∈ {AVAIL=available-only [ELIGIBLE], UNCONF=incl-unconfirmed [printed, ineligible]} ×
T ∈ {M5, H1-projected}

| ID | O | C | K | T | Elig |
|---|---|---|---|---|---|
| V001 | SIG | RAW | AVAIL | M5 | Y |
| V002 | SIG | RAW | AVAIL | H1 | Y |
| V003 | SIG | RAW | UNCONF | M5 | n |
| V004 | SIG | RAW | UNCONF | H1 | n |
| V005 | SIG | MONO | AVAIL | M5 | Y |
| V006 | SIG | MONO | AVAIL | H1 | Y |
| V007 | SIG | MONO | UNCONF | M5 | n |
| V008 | SIG | MONO | UNCONF | H1 | n |
| V009 | FILL | RAW | AVAIL | M5 | Y |
| V010 | FILL | RAW | AVAIL | H1 | Y |
| V011 | FILL | RAW | UNCONF | M5 | n |
| V012 | FILL | RAW | UNCONF | H1 | n |
| V013 | FILL | MONO | AVAIL | M5 | Y |
| V014 | FILL | MONO | AVAIL | H1 | Y |
| V015 | FILL | MONO | UNCONF | M5 | n |
| V016 | FILL | MONO | UNCONF | H1 | n |
| V017 | PRIOR | RAW | AVAIL | M5 | Y |
| V018 | PRIOR | RAW | AVAIL | H1 | Y |
| V019 | PRIOR | RAW | UNCONF | M5 | n |
| V020 | PRIOR | RAW | UNCONF | H1 | n |
| V021 | PRIOR | MONO | AVAIL | M5 | Y |
| V022 | PRIOR | MONO | AVAIL | H1 | Y |
| V023 | PRIOR | MONO | UNCONF | M5 | n |
| V024 | PRIOR | MONO | UNCONF | H1 | n |

Implementation depth requirement: fractal series must extend ≥ 43+ bars
(R1 depth) on M5 and equivalent on H1 at every evaluation.

## Reference table — see relay v14 §2 (frozen, unchanged by reconciliation)
