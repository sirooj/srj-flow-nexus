# BUILDER RELAY TO COUNCIL v13 — planning consultation: the path to the goal

**Version:** v13. **Answers:** the v12 joint closure (both streams, Option 2: adopt finding, close origin investigation, HALT stands, no build/run/token/push).
**How to read this:** fresh session assumed — everything you need is below. Prose is model-neutral; the same text goes to both streams. This relay asks for PLANNING, not permission: the builder's own plan has failed (below), and the operator directs council to design the path. A builder recommendation is included, labeled, and may be discarded in whole or part.

---

## 1. The goal (operator-directed, final authority: the operator)

The EA must reproduce and take the exact trades the operator would take: same side, same entry bar, same stop, same target, under his rule. The EA is currently alert-only; "take" means the EA's selection surface fires his trade. Everything below serves this goal.

## 2. The operator's rule (his words, on file, unchanged by any verdict)

- The stop is EXACTLY two swings away — fractal swings (chart triangle markers), both cases. No imbalance requirement, no walk.
- Entry and target per structure. Takes the trade iff reward/risk >= 1.0 (flat 1.0 counts, 0.99 does not).
- Feed authority is Dukascopy, always. An earlier rejection on OANDA data (0.92R shown vs true 1.21) was his measurement error, recovered and closed.
- All seven examples below were taken (or would-be-taken, one case) under this one rule. There is no second rule. Any plan that implies his trading is inconsistent contradicts the operator and is out of scope.

## 3. The seven examples (all HAND, all Dukascopy-confirmed)

| ID | Signal bar | Side | Entry | His stop (bar) | Standing |
|---|---|---|---|---|---|
| R1 | Aug-28 10:05 | SHORT | 1.16466 | 1.16508 @06:30 | traded |
| R2 | Sep-4 10:40 | SHORT | 1.16265 | 1.16299 | considered, declined on bad feed; recovery-YES: takes it on correct data |
| R3 | Sep-4 16:00 | LONG | 1.16018 | 1.15847 @15:30 | traded |
| R4 | Sep-7 09:20 | LONG | 1.16135 | 1.16098 @08:40 | traded |
| R5 | Sep-7 16:45 | LONG | 1.16261 | 1.16239 @16:15 (his words) | traded |
| S1 | Sep-8 10:10 | SHORT | 1.16205 | 1.16258 | traded; EA has NO row at this bar |
| S2 | Sep-8 17:00 | SHORT | 1.16220 | 1.16274 | traded, loss; EA has NO row at this bar |

Depths, entry to stop bar: R1 215 min / 43 bars; R2 70 / 14; R3 30 / 6; R4 40 / 8; R5 40 / 8; S1 30 / 6; S2 40 / 8.

## 4. Verified state (frozen runs, digests are the instrument)

- **F1. His levels exist on the code's ladder, 5/5.** Four exact, R5 within 1 point. (Filed scorecard "four exact, one absorbed, n=5".) Presence, not selection.
- **F2. The code's walk machinery arrives at 2/5** on retained levels (R2, R3 exact; R1 −27 landing 09:45 not 06:30; R4 +5 landing 09:00 not 08:40; R5 +1 vs the code's retained 1.16238 @16:05 — while landing his FILED 1.16239 @16:15 exactly). Filed-based reading: 3/5. Gate needed 5/5. Candidate dead, both streams agreed.
- **F3. The R4/R5 depth tie is verified from frozen rows:** both exactly 40 min / 8 bars, opposite outcomes. No depth function separates them.
- **F4. The frozen EA still runs the OLD stop rule** (conservative order-block + swing blend with bar-walk; 441 of 481 evaluations take that branch). His fractal rule exists in-code as print-only shadow rows only. The adoption switch is verified off; the enabling run was killed. The EA has taken zero trades on his rule, in every revision.
- **F5. The dead diagnostic added machinery his rule does not contain.** His rule has no walk (his words, §2). The test walked from his entry using code machinery and missed 3/5. This is a finding about the machinery, not his consistency.
- **F6. Sep-8 is a signal-presence problem first, a stop problem second.** No EA rows exist at either bar, and the EA's side at both bars reads LONG, opposed to his SHORT. Matching stops there is moot until the EA fires there.
- **F7. Concrete divergence, Sep-7 evening, same entry:** code's rule → stop 1.16112, R 0.36, signal dead. His rule → stop 1.16239, R ~2.45, signal live.
- **F8. HAND carriage:** price always, bar time sometimes, slot never, imbalance as words. Standing identity is slot+barTime+price+imbCode; HAND can never supply slot (banked, both streams).

## 5. What is closed, and what it closed

The v12 joint closure killed the origin/walk proposition only. It did not rule on his rule, his consistency, or a direct implementation of his rule — none was ever built or run. The per-trade ban and no-build constraint remain in force until jointly lifted; this relay asks for planning plus, on clearance, print-only authorization only. No selection change, no adoption, nothing that moves a digest.

## 6. Cost constraint (binding)

Each full-window tester run costs the operator ~1 hour. Sequential one-question runs are no longer acceptable. Whatever is authorized next must be ONE combined print-only run with all gates pre-declared, decisive for selection.

## 7. Operator constraints (standing)

He answers yes/no on concrete bar+price questions only — no open-ended chart labor (refused, standing). Dukascopy always. R >= 1.0 takes.

## 8. Builder recommendation (mine — discard freely)

- **Path A (recommended): stop formalizing, implement directly.** Print-only packet implementing his rule VERBATIM at the decision surface: stop = second fractal extremity outward from the entry bar, no walk, no imbalance term, both sides. Scored over (i) all five mapped examples pre-declared 5/5 exact on barTime+price, slot gap acknowledged, plus (ii) a full-window census: how many of 481 rows change stop vs conservative, R distribution shift. One run. It tests HIS rule, not our machinery.
- **Path B (rides the same run, no extra cost):** signal-presence probe — why no rows at the two Sep-8 bars (candidate-set width at those bars, side evaluation). If Path A passes but Sep-8 stays absent, stops are solved and presence is the named remainder.
- **What I will not do again:** another walk/origin diagnostic. My plan failed; that direction is exhausted.

## 9. Asks

- **Ask 1:** Which path — A, B, both, neither? If neither, council designs the alternative: the builder states plainly he has no further plan of his own.
- **Ask 2:** Is a 5/5 gate over barTime+price acceptable for a SELECTION packet, given F8 (slot gap acknowledged, gate over HAND-carried components + code barTime)?
- **Ask 3:** Must Sep-8 presence be solved before stop-selection, or may selection validate on the five mapped examples first with Sep-8 as the named remainder?
- **Ask 4:** On dual-key clearance: authorize ONE print-only build+run (no selection change, no adoption), gates pre-declared from this relay. State the gates or amend them.

## 10. On clearance

Builder executes continuously (edits → compile → run → gates → result file), files the result, and returns with a fresh relay. Snapshot/commit discipline unchanged: nothing commits without an explicit token. Either stream may halt instead of clearing — a halt stands as usual.
