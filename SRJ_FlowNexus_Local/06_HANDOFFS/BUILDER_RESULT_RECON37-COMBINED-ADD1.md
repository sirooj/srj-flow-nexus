# ADDENDUM 1 — RECON37-COMBINED: seed-sampling correction + Sonnet-live flags closed (read-only, 2026-09-16)

Filed result `BUILDER_RESULT_RECON37-COMBINED.md` stands on all MEASUREMENTS (every row value re-verified below). What changes is one INTERPRETATION LINE (F1 §2/§4): the sampling instant of the seed read. This addendum corrects it, closes both Sonnet-live v95 flags from disk, and carries the corrected synthesis. Filed records are read-only — corrections ride addenda, never edits.

## 1. Seed prints fire at seed-bar CLOSE (measured, systematic, 4/4)

SIDE1T print test-time vs printed bar (RECON37 archive, verbatim payloads):

```text
bar=2026.09.08 16:30 printed at test-time 2026.09.08 16:35:00 (ANCHOR_ELECT same tick)
bar=2026.09.08 09:15 printed at test-time 2026.09.08 09:20:00
bar=2026.09.04 10:35 printed at test-time 2026.09.04 10:40:00
bar=2026.09.08 09:45 printed at test-time 2026.09.08 09:50:00
```

Every seed evaluates at seed-bar close (= next-bar open). Seeds run on closed bars.

## 2. Consequence for the F1 reading (correction owned)

The 16:30 bias read (`biasAligned=1`) was taken at test-time 16:35:00 — the operator's flip moment ("5m structure bias flipped short at 16:35 open"). A SHORT reading at 16:35:00 for the just-closed 16:30 bar COINCIDES with his event account; it does not refute it. The probe has no flip detector (nothing timestamps when the buffer changed), so the event claim is UNTESTED by this probe — neither refuted nor confirmed. Luna's `V95-NEXT-DIRECTION-001` lines "prerequisite premise already refuted" and "closes the timing-first branch" are therefore OVERSTATED as event claims and must be reframed (carried into v96 as confirm-or-correct, never asserted).

What STANDS unaltered: (a) the state proposition — repo LTF bias reads SHORT for the closed 16:30 bar; (b) timing-as-REJECTION is closed — bias CONSIDERs on the live path (and unaligned routes to S2WAIT RETAIN, EA:7812-7813, never a kill); (c) S2-down = R-gate (0.60 → latch → 16:45:01 ABORT → A6REFUSED/STAND-DOWN) holds independently of any timing reading.

## 3. Flag 1 CLOSED (CheckLtfAlign semantics, code-read EA:2172-2178)

```mql5
bool CheckLtfAlign(int barShift, ENUM_SRJ_DIR dir, bool &alignedOut)
  {
   double ltfBias;
   if(!ReadFlow(FL_BUF_LTF_BIAS, ltfBias, barShift)) return false;
   alignedOut = ((int)MathRound(ltfBias) == ((dir == DIR_LONG) ? 1 : -1));
   return true;
  }
```

It reads the LTF-bias buffer state at the seed bar and compares sign vs candidate dir. NOT HTF (Sonnet-live's guess corrected — it is LTF), NOT a flip detector (its structural point stands: a state check cannot timestamp an event). Same helper serves the live S2 gate (EA:7810) and the F1 recorder (EA:7649) — reuse proven, no invention. Sonnet-live's caution is VINDICATED structurally, sharpened by §1: the stamp's sampling instant coincides with his flip moment.

## 4. Flag 2 CLOSED (bar identity, journal chain)

Same-candidate chain, verbatim: `ANCHOR_ELECT bar=2026.09.08 16:30 action=SEED poi=Monthly-POC dir=SHORT` (at 16:35:00) → `SIDE1O bar=2026.09.08 16:40 … rLive=0.60 livePass=0` + `SIDE1E 16:40 sel=0 r0=1.62 r1=0.68` → `TP_RR_FAIL_LATCH bar=2026.09.08 16:40 R=0.60` → `16:45:01 ABORT TP_RR_FAIL` → A6REFUSED + STAND-DOWN. No seed exists at 16:35/16:40 (Sep-8 SIDE1T bars: …15:15, 16:30, then 16:45 LONG — a different candidate, bias-rejected). The 16:40 S5 eval + 16:45:01 abort belong to the 16:30 seed. His 16:45 consideration (SL 1.16359, stop-selection reason) is a separate human event sharing only the clock minute with the robot's abort tick. The grade never conflated them (abort cited as the robot candidate's fate only).

## 5. Corrected synthesis (builder measures, council rules)

- Q1 re-scope proceeds UNBLOCKED: S2-down = R-gate either way; timing rejects nothing on this path. Only the "timing-branch-closed" phrasing needs Luna's reframe (rejection-closed vs event-untested).
- Q2 (CQD workstream) and Q3 (staged) are unaffected by either flag.
- Method lesson (standing, extends proxy-measurement discipline): a reused state stamp inherits its sampling instant — quote print test-time beside barTime whenever a seed read adjudicates an event claim, or the state/event conflation (taxonomy entry 5) re-enters through the sampling door.
