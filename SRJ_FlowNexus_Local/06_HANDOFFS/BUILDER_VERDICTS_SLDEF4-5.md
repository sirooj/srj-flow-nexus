# Council verdicts, SLDEF4–5 line — VERBATIM record

Transcribed by builder from the operator's verbatim relays (chat),
2026-09-13. Presented exactly as received; builder condensation lives
only in AGENTS.md §11 and the packet footers, never here. Three verdicts,
newest last.

---

## VERDICT 1 — RECON15b-SLDEF4 ACCEPTED, baseline advances

# RECON15b-SLDEF4 — VERDICT: ACCEPTED. Baseline advances.

Local commit cleared. Frozen baseline is now **EA `1EE6FC62…` (383844 B)**,
FlowLogic `3606BFB4…` unchanged. Archive `1BB162E5…`, 17598 lines, bounds
`[44769..62366]`, `PRE 44768` matching RECON15's end — no interleave, and
that boundary continuity is what makes the two-run sequence auditable.
RECON15 (`9A9AE93B…`, `[27221..44768]`) is superseded, retained as journal,
and is **not** a baseline for anything; its build-1 coverage defect is why,
and it earns one off-log report below.

Discharged this run: gate 5's 9/04 15:55 shortfall closed exactly as
predicted (window 574, deepest 571, base 524 matched at residual 0 — the
walk's slot was reachable, so the two-horizon defect was a window
construction and not a platform limit); the **eighth** consecutive inert
join; 50/50 slot residuals zero; the ghost stable at **slot 77 /
`imbCode 1`** under the slot key with its rung index unchanged but no
longer load-bearing.

---

## Ask 2 — CONFIRMED. The 10:35 shape is the rescope working.

A zero-step OB reference is the OB's own swing extreme, not a fractal apex,
so it carries no rung obligation and correctly withholds ladder ground.
10:35's obligated set being frac-only, covering at 29 rungs, and never
reaching the zero-step extreme at slot 168 is the specified behaviour. Not
a defect. The boundary that makes it safe is already met: all six non-rung
references emit `REF_OB_DEEP` with slot and distance, so nothing is silent.

The substantive consequence goes straight into the brief. `TODAY_OFF_LADDER
= 2` means that on **2 of 10 S5 rows, today's stop is not on the fractal
ladder at all.** No counting rule over the fractal set — any count, either
index, with or without the carve-out — can reproduce today's reference on
those rows. That is independent of the operator's mark-up and it is the
second arithmetic refutation of a pure-count definition, alongside rung 0
versus rung 16.

Gate 6's split moving `9/1 → 8/2` with the `52 → 50` pair ledger closed as
`−3/+1` is reported, not absorbed. Accepted. Keep the ledger in the result;
a pair count that moves without an accounting line is how a residual
histogram loses a cell.

## Ask 3 — row-level HALT CONFIRMED, with four constraints and one new status

Row-level refusal with operands is the right mechanism for a print-only
instrument: a run-stop discards 55 minutes of otherwise-valid measurement
to report one row. Confirmed as standing, bounded by:

1. A refused row is **counted, named, and its dependent gate recorded
   `UNTESTED`** — never absorbed, never defaulted.
2. Any refusal firing still blocks the packet at report time. Row-level
   refusal is not row-level forgiveness.
3. The refusal is **unexercised in RECON15b** (never fired). That is its
   status, not a pass. It may not be quoted as verified.
4. `SLADWIN` emitting one line per S5 row *including halted rows* is the
   property that makes 1–3 checkable. Keep it unconditional.

**New status, ruled from your own owned defect.** RECON15's build-1 break
came from an empty obligation set with `coverT=0.0`. An empty obligation set
makes `ladCovers=1` **vacuously true** — a row can report covered while
enumerating almost nothing. That is "bound reached indistinguishable from
search completed" wearing its fourth costume, and it is currently reachable
in RECON15b on any frac-only or obligation-empty row.

Emit `ladObligN`. A row with `ladObligN = 0` reports **`VACUOUS_COVER`**,
never `covers=1`. Gate it as reported-and-named. `ladObligN` also lets a
later session verify the obligated subset without re-deriving it from
`refIsRung` — which is the population-identity rule applied to a set
instead of a count.

---

## Ruling — ORDER arithmetic does not close. Recount owed before the brief.

16 bars, 13 stamped pairs, `−1 ×4` unstamped. That is 17 rows over 16 bars.
One of the three numbers is wrong, or one bar carries two ORDER emissions
despite the last-bar guard. Outcomes `6/6/4/0/0` do sum to 16, so the bar
count is corroborated and the pair partition is the suspect.

Recompute off-log from `1BB162E5…`. No rerun. Also name the unstamped
sentinel: `−1` is acceptable as a value that cannot collide with a real
sequence, but it must be **counted as its own status** (`SEQ_UNSTAMPED`)
with the S4→S5 promotion cause stated in the token block, exactly as
`code 3` is counted rather than folded into `code 0`.

## Council finding — the race is retired, and what replaces it is sharper.
## But two instruments disagree, and the DECISION header currently quotes
## the unresolved side.

At 15:55: `seqBias 279 < seqS5 280`. The bias site ran **before** the gate
on that bar, and `biasAtGate = anti-2`, and `gateOutcome = PASS`.

So there is no ordering race. The ordering is the safe one, and the exit was
the correct answer to an opposed bias — your RECON14 reading holds. The
finding moves to the entry: **the S5 gate passed with the bias already
opposed at gate time**, and the resulting record died on its own opening
bar. One of the four canonical signals is admitted against an established
counter-bias. That is entry-side content, it is the operator's to rule on,
and it is now measured rather than inferred.

The problem is `flipDetectedThisBar = 0` at 15:55, while `MTFLIP` puts
`flipSourceBar = 15:55`. Two instruments, same bar, contradictory answers
about whether a flip occurred there. Your own disclosure names the likely
cause: the ORDER counter is stamped at the **LTF-align invariant**, and the
Sep-4 flip is `vHTF`. If the detection flag cannot see an HTF flip, then
`count(flipDetectedThisBar==1 AND gateOutcome==PASS) = 0` is **vacuous**,
not a finding — it is zero because the flag never reads the event class it
is being credited with excluding.

Two consequences, both binding:

- **`orderFlipPass = 0` may not be quoted anywhere until this resolves**,
  including in the `SLADDER_DECISION` header where it currently sits. Strike
  it from the block or annotate it `SCOPE_UNRESOLVED` before the brief
  reaches the operator. A vacuous zero handed to him as reassurance is worse
  than no token.
- Resolve by **code-read with operators named**, off-log, no rerun: which
  bias variable `flipDetectedThisBar` compares, which one `HTF_FLIP` reads,
  and whether they are the same object. Same standard as N1 — the claim is a
  property of a comparison, so the comparison gets quoted. If they differ,
  the ORDER stamp moves to the HTF site in the rider and the flag is
  re-measured there.

`biasAtGate = anti-2` is unaffected by this and stands on its own as
measured. The entry-side finding survives the disagreement; only the
flip-detection zero is in doubt.

## Deviations and artifacts

- **`SLADDER_DECISION` excluded from `LwAudit`: refused as permanent,
  accepted as temporary.** "Short by design" is a property of today's
  content, not of the class, and this is the exact blind spot that ate the
  gate-6 tokens. The `<420` figure is an off-log measurement and must be
  labelled as such. Register all three DECISION classes in `LwAudit` at the
  next touch of that emitter — no exemptions, no exceptions.
- **`RUNG` companions on firing rows only (24 = 12 SLOT + 12 EXT):**
  accepted. 4 rows × 3 rungs × 2 indices reconciles, the four firing rows
  are the decision surface, and the six non-firing rows' shallow rungs are
  recoverable off-log from the full `SLADDER` lines. No rerun.
- **`WALKF_BADFMT = 481`, script mislabel:** fourth entry in the artifact
  taxonomy — parser (CQD loose pattern), truncation (RECON11 empty fractal
  cross-tab), sticky-flag (12b flats), now **script-mislabel**. True
  `BADFMT = 0` accepted. Fix the script rather than the annotation; an
  artifact that has to be re-explained every relay eventually gets believed.
- **Launch hang:** recorded, unexplained, no packet impact. Try
  `cmd /c start` off-canonical. Do not spend a canonical run on it.

---

## Off-log reports owed, no rerun, all before the brief goes out

1. ORDER recount: bars, stamped pairs, unstamped — reconciled to 16.
2. Which bias variable `flipDetectedThisBar` reads versus `HTF_FLIP`, with
   the comparison expressions quoted.
3. OB-limb `walkSteps` for 9/08 16:40 (expected 0) — the RECON14 debt,
   still open, now trivially confirmable.
4. `rungR` at the two matched operator levels: slot 1 (Sep-7 `1.16240`)
   and slot 407 (Sep-4 `1.15907`). His levels must carry their own R
   beside the candidates or the brief asks him to choose blind.
5. From RECON15's retained records: what did 9/08 report for `ladCovers`
   and `ladRungs` under the build-1 defect? If it reported covered, that
   sizes the `VACUOUS_COVER` blind spot and justifies the new status by
   measurement instead of by reasoning.

Operator ask, unchanged: file `1.15847` as an E24 level. Until filed it
resolves to nothing, and the Sep-4 SL pair is **not** closed by the
`1.15907` match — two numbers, one tested.

## Ask 4 — sequencing confirmed. No build packet issued.

Next artifact is the **HANDOFF BRIEF**, assembled once reports 1–4 land.
Then the mark-up, collected **by `barTime` and price only** — no rung index,
no label. That prohibition is now load-bearing twice over: the ladder window
is derived and will move, and the label convention is demonstrably not a
constant offset.

Brief contents, unchanged in shape, sharpened here:

1. `SLADDER_DECISION`, ten rows, four flagged, threshold `1.00
   compiled_default` quoted.
2. The counting arithmetic: `1.16240` = rung 0 / slot 1; `1.15907` = rung
   16 / slot 407. No single count reaches both. Plus the new item: on 2 of
   10 rows today's reference is not a rung at all.
3. The retraction price: `S5_CARVE_OB = 0`, `S5_CARVE_FR = 3`; his Sep-7
   level lives only in `slFractalNuance` under `CARVEOUT_FIRED`; rung 0 says
   a count *could* reach it, and his mark-up decides whether it does.
4. Label table: one pair resolved by content (slot 1 / 16:30), two open
   (+20, −10). Blocking before adoption as selection.
5. N1 as measured: POI body 28/0 confirmed, POC 3/0 confirmed, **POI wick 10
   survived / 16 invalidated — contradicted**, VWAP 0/0 unexercised. His
   ruling, not a code change.
6. The Sep-4 concentration, restated with this run's operands: `seqBias <
   seqS5`, `biasAtGate = anti`, `PASS`, `barsHeld = 0` — a signal admitted
   against an established counter-bias, plus his 23:55 flat against a record
   that never held a bar, plus the untested `1.15847`. Governance holds: his
   read opens each one, operands close it.

**Rider list, `P-SLDEF-5-RIDER`** — attaches to the next packet that runs for
another reason, never its own 55-minute run: `ladObligN` +
`VACUOUS_COVER`; `SEQ_UNSTAMPED` naming; DECISION classes registered in
`LwAudit`; ORDER stamp relocated to the HTF site if report 2 says the sites
differ; `orderFlipPass` struck or scope-annotated.

## Standing debts, none aged out

Flats **provisional** — `0/0/0` honest given the current exit set and given
operands, not frozen against `MTEXIT 4` while the entry-against-bias finding
is open. Two label pairs open. N1 wick ruling owed from the operator. Probe
requirement stands on both news edits: exercised once off-canonical, own
digest, reported, reverted in-session, never committed. "Two swings away"
still not packetised and will not be before the mark-up. News order
unchanged: exit side after the imbalance decision, after `MTFLIP`, after
`ORDER` resolves; entry side last, inside `ST_S5_GATE_CHECK` after the
divergence walk, before `g_latchedEntry`, rollback to `g_confirmFromState`,
latch unspent. Table pinned at `5FFF5C76…EF1F134`, rows `{eventTimeET,
kind}`, conversion at read, resolved bar printed per row, Oct-28 at
`offsetMinutes 360` quoted as the table's regression test.

---

## VERDICT 2 — HANDOFF BRIEF BLOCKED. Do not send.

# HANDOFF BRIEF — BLOCKED. Do not send. One factual error, three
# unevaluable claims, one structural gap.

The shape is right and the scope note on the flip-and-pass counter is
exactly what I asked for — you annotated a vacuous zero instead of handing
it over as reassurance. But this document goes in front of the operator and
becomes the basis of a definition ruling, so it gets gated like a run.
Corrections below, then the one structural change that matters more than
any of them.

RECON15b stays the frozen baseline. No packet issued. Nothing in the
corrections needs a rerun.

## C1 — `today` is not 1.16112. This is falsified by the frozen identity set.

Item 2 says "the conservative stops (today, base, nuance, fractal) are all
1.16112, R 0.36."

`slToday` on the Sep-7 16:40 row cannot be 1.16112, because 1.16112 yields R
0.36 and today's R on that signal is **1.25** — carried verbatim in the
four-signal set across eight builds, and in `SLIMBR` as `1.25→0.36`. The set
at 1.16112 is `{base, nuance, fractal}`. `today` is a separate, tighter
reference; `fractalNuance` is 1.16240 at R 2.56.

This is not a wording slip. As written it tells the operator his current
code already produces a sub-threshold stop on that signal, which would mean
the signal does not fire today — and it does. Correct the row to four
distinct entries with their own prices and R values, and state which
reference each one is.

## C2 — every step figure must carry both indices. The headline refutation
## is currently not evaluable.

"Step 0 versus step 16" is the brief's central claim, and E23.3 exported
`rungSlot` and `rungExt` as two independent indices precisely because "two
swings away" is ambiguous between them. A bare "step" collapses them and the
reader cannot tell which count is being refuted.

Restate `1.16240` and `1.15907` with `rungSlot`, `rungExt`, `slot` and
`barTime`, and do the same for `1.15847` and the ghost.

The refutation almost certainly survives either index — slot 1 against slot
407 is a 406-slot gap, and no plausible count spans it — but that argument
is mine, not the document's. Say it with both numbers on the page.

## C3 — 1.16379 on two rows is a claim about identity, and it is made
## by price

Item 1's second refutation names one price for two rows and gives no slot
for either. Two different slots can hold the same price; the 08/28 case has
four swing highs inside one point, which is why slot identity has been the
mandatory matching key since P-SWINGIMB-2.

Print `slot` and `barTime` for the zero-step OB extreme on each row. If both
resolve to one slot, that is one persisting extreme spanning several days
and worth saying. If they resolve to two slots at equal price, that is a
coincidence and must be labelled one. Either way the refutation stands — a
zero-step extreme carries no rung obligation and therefore no count
reproduces it — but it must rest on the slot.

While you are there: confirm the date on the 10:35 row. It arrives as `NEW`
in RECON15b with no date in the gate record, and the brief asserts Sep-4.
If it is Sep-4, note the corroboration explicitly — a morning SHORT and a
15:55 LONG on the same day is consistent with the `vHTF` flip at 15:55 that
`MTFLIP` already puts on that bar. Two instruments agreeing on a bias
reversal from opposite directions is worth a line.

## C4 — 1.15847 cannot be both resolved and unresolved

Item 5 places it at "step 1, slot 4, 15:30 bar, R 1.66" and then says it
"resolves to nothing until filed." Ask 1 repeats the second half.

Pick one, and the answer follows from the residual, which is missing. Quote
it. If the residual is 0, then **both** of his Sep-4 numbers are ladder
rungs and the question changes shape entirely: it is no longer "one tested,
one untested," it is "two rungs, which is yours." That is a materially
different question and it is the one he should be answering.

The filing ask survives regardless — an unfiled level is not in
`SLADDER_MATCH` and does not carry a gated residual — but the sentence
"resolves to nothing" is now false on its face and must go.

## C5 — the four rows are labelled by S5 bar time and called "the 4 signals"

`Aug-28 10:00`, `Sep-4 15:55`, `Sep-7 09:15`, `Sep-7 16:40` are S5 evaluation
bars. The operator's signals are `10:05`, `16:00`, `09:20`, `16:45`, and that
is how they appear in the four-signal set he has been reading for the whole
line.

The brief is the document arguing that labels are unreliable. It may not
then introduce a fifth-convention shift silently. Print both per row —
`signal 16:45 / S5 16:40` — and reference `SIGMAP` and `signalTime =
s5BarTime + PeriodSeconds` in one clause.

## C6 — the carve-out counts need their population named

"Order-block side 0, fractal side 3" sits under the Sep-7 16:40 heading and
reads as three fires on that row. The 3 is across the ten S5 rows: `8/26`,
`9/07 09:15`, `9/07 16:40`. Two are firing rows, one is not.

Scope it, and add the second firing carve row. `9/07 09:15` has a fired
fractal carve-out and therefore a `slFractalNuance` distinct from its base —
that row's fractal-nuance price and R belong in item 2 beside Sep-7 PM's.
The retraction price is not one row's; it is two.

## C7 — the survival verdicts are missing, and 1.07's margin with them

The brief quotes the threshold and the R values and leaves the operator to
do the comparison. The promise since P-SLDEF-1 was that the survival
consequence of each definition is visible rather than inferred.

Per firing row, per reference, print survive or die against `1.00`. Then
flag the one row that clears by 0.07: `1.76→1.07` survives under base by
seven hundredths, and it is the row most sensitive to any subsequent change
in reference or rounding. That flag was ruled two relays ago and has not
appeared yet.

---

## Structural — steps 0/1/2 cannot collect the mark-up

This is the change that matters most, and it is a purpose collision rather
than an error.

Steps 0/1/2 are the right span to test **"exactly two swings away."** They
are the wrong span to collect **"which rungs are my swings,"** because his
own Sep-4 level is step 16. The block as described does not contain one of
the two levels he is being asked to identify, and if his structure is coarser
than fresh strict fractals — which is now the measured expectation from
three independent directions — then his swing #1 will routinely be a
double-digit rung of ours.

A mark-up over rungs 0/1/2 can only ever return "none of these are mine,"
which is not a definition.

Split the artifact:

- **Mark-up table**, four firing rows, **every rung** out to the deepest rung
  referenced on that row, one line each with `slot`, `barTime`, `px`,
  `wick`, `body`, `imbCode`, `distPts`, `rungR`. All of it exists in the
  `SLADDER` companion lines on the frozen run — this is a tabulation, no
  rerun, no edit. `ladRungs` per row was 11–52 in RECON14, so this is a
  readable table, not a data dump.
- **Two-away test table**, the existing 0/1/2 block by both indices, kept
  as-is with C2 applied.

He marks up the first. The second is the candidate he is marking up
*against*.

## Accepted as written

The scope note on `orderFlipPass` — annotated, narrow question stated, and
pointed at item 6 as the counterexample. That is the correct handling of a
vacuous zero and it unblocks the brief on off-log report 2: the document
makes no claim that report would change.

The governance framing throughout — "your read opens each item, the
operands close it" — carried correctly into an operator-facing document.

The appendix, including the ghost keyed on slot with its rung index reported
and not load-bearing.

N1, with two small fixes: name the site `POI body break` rather than
"price-body" so it matches the source sites, and add the exit-body rider at
`0/0` as unexercised. Four sites reported, one contradicted, one unexercised
at each of two different reasons — that is the honest surface.

## Off-log reports still owed, before the mark-up is collected

Reports 1, 3 and 5 from the RECON15b verdict remain unquoted in-relay. None
of them touch the brief's content, so they do not gate sending the corrected
brief, but they gate the mark-up:

1. ORDER recount reconciled to 16 — 16 bars against 13 stamped pairs plus 4
   unstamped is 17 rows, and one of the three numbers is wrong.
2. `walkSteps` for 9/08 16:40, expected 0 — the RECON14 debt, now one grep.
3. RECON15's build-1 `ladCovers` / `ladRungs` on 9/08, which sizes the
   `VACUOUS_COVER` blind spot by measurement.

Report 2 stays owed as a code-read with the comparison expressions quoted;
it is a prerequisite for the exit side, not for the brief.

## Rider list, unchanged plus two

`P-SLDEF-5-RIDER`, still attaching to the next packet that runs for another
reason: `ladObligN` + `VACUOUS_COVER`; `SEQ_UNSTAMPED` naming; the three
DECISION classes registered in `LwAudit`; ORDER stamp relocated to the HTF
site if report 2 says the sites differ; `orderFlipPass` struck or
scope-annotated at the emitter rather than in prose.

Added: the mark-up table emitted as its own audited class rather than
assembled by script, so it inherits `LINEWIDTH` and the collision audit like
everything else the operator reads.

Send the corrected brief. Nothing else moves until the mark-up lands, and no
counting definition gets packetised before it.

---

## VERDICT 3 — BRIEF BLOCKED third revision, ext-1 finding, P-SLDEF-5
## conditional

# BRIEF — BLOCKED, third revision. Not a wording problem this time.

C1 through C7 are discharged: `today 1.16218 / R 1.25` corrected with the
correction stated; both times per row; carve counts scoped and the second
carve row added; survival verdicts present with 1.07 flagged at seven
hundredths; `1.15847` resolved with a residual; the mark-up table split from
the two-away table. The scope note on the flip-and-pass counter survives
untouched.

The block is that **the mark-up table answers the definition question, and
the brief argues the opposite conclusion from two mis-filed levels and the
wrong index.** RECON15b stays frozen. Nothing below needs a rerun.

---

## Finding — "exactly two swings away" is not refuted. On the extremity
## index it reproduces all four operator levels.

Read the operator's own stops against `rungExt`, not `rungSlot`:

| signal | operator's stop | provenance | ext | position | barTime | px | imbCode | R | today's ref | today ext |
|---|---|---|---|---|---|---|---|---|---|---|
| 10:05 / S5 10:00 SHORT | 1.16508 | agreement inferred | **1** | 41 | 08-28 06:30 | 1.16508 | 0 | 2.43 | 1.16508 | 1 |
| 16:00 / S5 15:55 LONG | 1.15847 | hand, divergent | **1** | 4 | 09-04 15:30 | 1.15847 | 0 | 1.66 | 1.15907 | −1 |
| 09:20 / S5 09:15 LONG | 1.16098 | hand, 3/3 exact | **1** | 6 | 09-07 08:40 | 1.16098 | 0 | 1.76 | 1.16098 | 1 |
| 16:45 / S5 16:40 LONG | 1.16239 | hand, R 2.45 | **0/1 cluster** | 4 | 09-07 16:15 | 1.16239 | 0 | 2.45 | 1.16218 | −1 |

`rungExt == 1` yields 1.16508 / 1.15847 / 1.16098 / 1.16238 — three exact,
one inside the codebase's own 1-point structural-distinctness limit.
R 2.43 / 1.66 / 1.76 / 2.34. **All four signals survive 1.00 and none
dies.** `ext 0` is refuted on Aug-28 (1.16491 ≠ 1.16508) and `ext 2` is
refuted on Aug-28 (1.16513). The test discriminates and only ext 1 passes.

Strength stated honestly: two rows are discriminating (Sep-4 and Sep-7 PM,
where today's code diverges from him and ext 1 lands on his number), two
are non-contradicting (today's ref is already ext 1 there). Two hits plus
two consistencies over n=4, arithmetic on a transcription, not a
measurement. It is the leading candidate, not a ruling.

Three collateral results fall out of the same arithmetic:

**Creation-side imbalance is falsified at the decision surface.** All four
ext-1 rungs carry `imbCode 0`, as do all four ext-0 rungs. His stops sit on
swings with no creation-side displacement. That is why the
imbalance-qualified walk overshot on every row and cost R every time — it
walked past every rung he uses. Buffers 37/38 stay as exports and censuses;
the walk retires as a measured candidate rather than shipping. That is
shadow-first working, not a loss.

**Ruling (c) can be retracted at no measured cost.** The one row that
motivated the nuance is degenerate: 16:30 / 16:15 / 16:05 are 1.16240 /
1.16239 / 1.16238, one point apart, absorbed into a single extremity level.
ext 1 alone reaches him there. And the carve-out actively over-tightens
where he agrees with the code — Sep-7 AM fractal-nuance 1.16102 against his
1.16098, four points, on the row his journal matched 3/3 exact.

**Today's code walks the wrong way on the two divergent rows.** On Sep-4
today's reference is a *previous-day* swing at position 407 while a nearer,
strictly more extreme swing sits at position 4. `ext −1` on both divergent
rows means today's stop is inward of a more extreme nearer swing — an
OB-anchor consequence, and precisely where he disagrees.

## Ruling — the count is over `rungExt`. `rungSlot` is not a counting basis.

E23.3 exported both indices deliberately because "two swings away" was
ambiguous. The ambiguity is resolved by measurement: over `rungSlot` his
levels sit at positions 41 / 4 / 6 / 4 with no common count and today's ref
at 407 on one row; over `rungExt` they sit at 1 / 1 / 1 / 0-1. `rungSlot`
stays exported and printed. It is not the count.

Consequence: on Aug-28 ext 1 skips three less-extreme swing highs at 09:45 /
09:35 / 09:25. That is ruling (a) verbatim — "more extreme price level" —
and it is the behaviour a slot count cannot produce.

## Governance — both filed "operator levels" were code-derived. Both matches
## were self-matches.

`1.15907` is today's reference on Sep-4: `distPts 0`, R 2.56, the canonical
four-signal value. So it is the code's number, and `1.15847` is the hand
number. `1.16240` is the ladder rung the code's fractal-nuance returns; his
hand figure is `1.16239` at R 2.45, and there is a rung at **16:15, 1.16239,
R 2.45** — his label, his price and his R agreeing on one rung.

So E24 was populated with two code values, both produced residual-0 matches,
and those matches were quoted across three relays as confirmation of his
structure. They confirmed ladder-versus-walk correspondence, which was worth
having, and nothing about him.

**Ruling: every filed level carries a provenance tag, `HAND` or `CODE`,
quoted verbatim from his journal or appendix. A `CODE`-derived value may not
be filed as an operator level, and `SLADDER_MATCH` reports the tag on the
line.** A match against our own output must never again be indistinguishable
in the log from a match against his.

## Correction — `S5_CARVE_OB = 0` is wrong, and it is my finding that fails

The brief's survival table shows `nuance ≠ base` on Sep-4 (2.56 vs 1.53) and
Sep-7 AM (1.76 vs 1.07). `slNuance` is by construction either `slBase` or the
retained inward reference, so `nuance ≠ base` **is** the carve-out firing. On
the OB limb the retained reference is the chosen swing, so a fired carve
gives `nuance == today` — which is exactly what those two rows show, and
matches your own RECON13 report of `slToday = slNuance` on Sep-4 under class
`TODAY_EQ_NUANCE`.

`S5_CARVE_OB = 0` counted the rows *labelled* `CARVEOUT_FIRED`. The class is
derived from three relations; "the carve-out fired" is a mechanism fact.
Where both a relation label and the carve apply, the relation label won and
the carve became invisible. This is E9's totality discipline meeting its
limit: totality prevents missing branches, it does not make a relation into
a mechanism.

Retracted: "the nuance is unexercised at the decision surface,"
"`S5_CARVE_OB = 0`," "first evidence ruling (c) has live content on the
fractal limb where it has none on the OB limb," and "nuance == base on all
four firing rows." Recount is off-log — `count(slNuance != slBase)` per
limb, at S5 and across 481, against the `CARVEOUT_FIRED` class counts.
`carveFired` ships as its own boolean token from the predicate in the next
run.

## Label pairs — one dissolves, two restated with operands

- **−15 (16:15 / 16:30): no discrepancy.** His label, price and R all resolve
  to the 16:15 rung at 1.16239. The earlier resolution to the 16:30 bar was
  an artifact of matching a code-derived filed level. Strike the "resolved
  by content" line as written and replace it with this. The 0.1-pip stop
  difference and the 0.11 R difference both vanish — he was reading a
  different rung, one bar earlier, correctly.
- **+20 (14:55 / 15:15): label-versus-price conflict, price governs.** The
  15:15 rung is 1.16209; his quoted price 1.16218 pins the 14:55 rung. Open,
  with operands.
- **−10 (16:05 / 16:15): 1-point absorption cluster,** not a frame error.
  1.16238 and 1.16239 on adjacent bars.

Neither open pair is a constant offset, both now have measured operands, and
both stay blocking before adoption as selection.

## Brief and table corrections, then send

1. Rewrite the headline. The counting arithmetic section becomes the ext-1
   candidate table above, with the two discriminating rows named as such.
   Delete "no single count reaches both" — it is true of `rungSlot` and
   false of `rungExt`, and the document must say which.
2. **Naming.** The table renamed the frozen tokens: prior record's `slot` is
   this table's `position`, and the new `slot` column is `position + 1`. The
   ghost was gated at **slot 77**; the brief says slot 78. Restore `rungSlot`
   / `rungExt` / `shift` as the printed names, or print the mapping in one
   line at the top. The document arguing labels are unreliable may not
   renumber the gated key.
3. **Schema.** The two-away table declares `step / position / extremity /
   slot / bar time / price / R` and emits five of seven fields. Emit the
   declared set or declare the emitted set — `fields=` discipline applies to
   operator-facing tables too.
4. **Degenerate R.** Rungs within a few points of entry produce R 284.00,
   47.33, 16.25. Mark them `DEGENERATE_R` or suppress the column there. He
   must not read 284 as an opportunity.
5. **C3 still open.** Print `slot` and `barTime` for the zero-step OB extreme
   on each of the two rows. If 1.16379 resolves to two slots at equal price,
   label it a coincidence. The refutation stands either way — a zero-step
   extreme carries no rung obligation — but it must rest on the slot.
6. **Duplicate prices, stated.** 1.15907 appears at positions 407 and 537;
   1.16098 at 6 and 13; 1.16218 at 20 and 29. Price matching would have
   picked wrong. One line, because it is the reason slot identity is
   mandatory and he should see it.
7. **Reward precision.** The R column on Sep-7 PM is consistent with a reward
   near 53.80, not the 54 implied by the quoted `entry 1.16261 / tp 1.16315`.
   Aug-28's column is consistent with 102 exactly. Print the reward at full
   precision with the R formula and rounding mode, or he will recompute 2.57
   by hand and we will spend another relay on it. This does not disturb gate
   8's closure: 53.80 / 22 = 2.45.
8. **Mark-up scope.** Keep the full 113-row table as the appendix, but the
   ask changes: confirm four levels verbatim and rule on ext 1. A blanket
   mark-up is no longer the shortest path to a definition, and Sep-4 is the
   one row where marking his swings still buys something — his structure and
   ours disagree by a full trading day there.

## Off-log reports, no rerun, before the packet builds

New, gating the candidate:

- **A.** ext index and price for the four ext-1 rungs, read from `SLADDER`
   lines directly, not from the transcription.
- **B.** The operator's four SL figures quoted verbatim from
   `BUILDER_FINDING_SEP7_CHARTREAD`, tagged `HAND`, confirming 1.15847 is
   his and 1.15907 is ours. Aug-28's agreement is currently inferred from
   the absence of a reported divergence — confirm or mark inferred.
- **C.** `count(slNuance != slBase)` per limb, at S5 and across 481, against
   `CARVEOUT_FIRED` counts.
- **D.** Full-precision reward operands and the R formula for the four
   firing rows.
- **E.** ext 1 across all ten S5 rows: `px`, R, `imbCode`, survival against
   1.00 — and any row where ext 1 does not exist. `todayRefSlot`'s ext index
   read from the log per row, not inferred from `distPts=0`; Sep-7 AM is
   ambiguous by price and only the slot resolves it.

Still owed, unchanged: ORDER recount reconciled to 16; `walkSteps` for 9/08
16:40; RECON15 build-1 `ladCovers` / `ladRungs` on 9/08; and the code-read of
which bias variable `flipDetectedThisBar` compares against the one `HTF_FLIP`
reads, with both expressions quoted.

---

# BUILD PACKET P-SLDEF-5 — conditional

Print-only. **No selection may change. No reference definition may change.
MTEXIT stays 4.** Cleared to build once A–E land and the operator confirms
his four levels. **Halt and report instead of building if A or B contradicts
the candidate** — a wrong candidate is not worth a 55-minute run.

## E35 — `slExt1`, the candidate as a shadow reference

Sixth reference, computed in `ComputeSlReference` on every invocation, both
branches: the rung at `rungExt == 1` on the protective side, anchor-free from
the entry bar, with **no imbalance term and no carve-out**. Tokens: `slExt1`,
`ext1Slot`, `ext1BarTime`, `ext1ImbCode`, `deltaExt1Pts`, `outwardExt1Pts`,
`ext1Defined`. Where ext 1 does not exist, `ext1Defined=0` with the deepest
available ext index reported — never a fallback price, never silent.

Add `extIndexOf` for every existing reference — `today`, `base`, `nuance`,
`fractal`, `fractalNuance` — so the whole reference set is expressed in the
index the operator counts in. This is the column that lets any future
candidate be evaluated as arithmetic.

## E36 — `carveFired` and mechanism separation

Per limb, a boolean emitted from the carve-out predicate itself. Class tokens
unchanged. Report `carveFired` against class in a cross-tab so the mislabel
is sized in the log rather than off it.

## E37 — provenance and `SLIMBR` extension

`SLADDER_MATCH` carries `provenance ∈ {HAND, CODE}` per filed level, refusing
to accept a `CODE` value as an operator level. `SLIMBR` and the decision
block extend to six references with survival verdicts against the runtime
threshold, reward at full precision.

## E38 — rider list, folded in

`ladObligN` + `VACUOUS_COVER`; `SEQ_UNSTAMPED` naming with its S4→S5 cause in
the token block; the three DECISION classes registered in `LwAudit`; the
mark-up table emitted as its own audited class rather than script-assembled;
`orderFlipPass` struck or scope-annotated at the emitter; ORDER stamp
relocated to the HTF site if the code-read says the sites differ.

## Gates

Full window, pilot ini unchanged, 3168 / 563338. Gates 1–4 and 12–15 as in
P-SLDEF-4, verbatim, including the FlowLogic digest unchanged and the
**ninth** inert join at 481/481 ×3 plus 10/10. Added:

5. `slExt1` resolved on every invocation or `ext1Defined=0` named with its
   deepest ext. `outwardExt1Pts` sign distribution reported, unconstrained.
6. On the four firing rows, `slExt1` equals the operator's confirmed level
   within 1 point, reported per row with the residual. **A miss on any row
   halts with operands** — that is the candidate's falsifier and it must be
   able to fail.
7. `extIndexOf` printed for all six references; `count(extIndexOf(today) ==
   1)` over the ten S5 rows reported.
8. `carveFired` × class cross-tab in full, S5 subtotals per limb. The RECON9
   partition is the comparison record.
9. `ladCovers` over the obligated subset including `slExt1`; `ladObligN`
   reported; `VACUOUS_COVER` named where the obligated set is empty.
10. `LINEWIDTH truncated = 0` on all classes including the three DECISION
    classes and the mark-up class. Data `BADFMT = 0`.

Halt rather than substitute on E35's `ext1Defined` clause, gate 6 and the
inert join.

## What closes after this run

If gate 6 passes, the definition is `rungExt == 1`, no imbalance term, no
carve-out, and the packet after it is a single anchor-and-count change with
its R already on paper — 2.43 / 1.66 / 1.76 / 2.34, all four signals alive.
If gate 6 fails on a row, the candidate dies with operands and the mark-up
becomes the path again. Either outcome is a decision.

---

# NEWS

Unchanged. Exit side after the imbalance decision, after `MTFLIP`, after
`ORDER` reconciles and the flip-detection scope resolves. Entry side last,
inside `ST_S5_GATE_CHECK` after the divergence walk and before
`g_latchedEntry`, rollback to `g_confirmFromState`, latch unspent. Three
flats by value, append-only, priority `SL`, `TP_TOUCH`, flats,
`POI_BODY_BREAK`, `HTF_FLIP`, every verdict printing. Flats **provisional**.
Probe requirement stands on both edits: exercised once off-canonical, own
digest, reported, reverted in-session, never committed.

Table pinned at `5FFF5C76…EF1F134`, rows `{eventTimeET, kind}`, conversion at
read, resolved bar printed per row. Oct-28 at `offsetMinutes 360` is the
table's regression test and is quoted in every future news result.

---

## VERDICT 4 — RELAY DUPLICATE, v3 received twice, ruling stands

# RELAY DUPLICATE — v3 received twice. Verdict already issued and stands
# unchanged.

This relay is identical to the one I ruled on last turn. No content in it
is new, so nothing in the verdict moves. Flagging the duplication rather
than re-issuing the ruling, because a re-send usually means one of two
things and they need different responses: either the verdict did not reach
you, or the relay was sent twice by the harness. Confirm which. If it is
the first, the ledger below is self-sufficient and you are not blocked
waiting on a re-transmission.

**Standing note:** relays carry a version tag already; add a one-line receipt
acknowledgement of the ruling ID a relay is answering. Two identical relays
with no acknowledgement in between is indistinguishable from a lost verdict,
and a lost verdict on a conditional packet is how something gets built
without clearance.

## Ledger — what stands, restated compactly

**Accepted:** A–E in full. Table verification at 0/113 mismatches. `R1`
reconciles 12+4=16. `R3` closes the RECON14 gate-5 debt (9/08 `walkSteps=0`,
`ALL3_EQ`, one named non-rung reference). `R5` sizes `VACUOUS_COVER` by
measurement — build-1 reported `covers=1` on one rung. `D`'s bracket
inversion accepted; `tp` is a computed level so reward carries sub-pip while
entry and swing stops do not; gate 8 undisturbed at 53.8 / 22 = 2.45.

**Candidate CONFIRMED, three exact plus one absorbed.** 1.16508 / 1.15847 /
1.16098 exact at residual 0, all `imbCode 0`. Sep-7 PM is `ABSORBED`, not a
match: ext 1 is 16:05 / 1.16238, his bar is 16:15 / 1.16239 at `ext −1`, one
point apart and inside the codebase's own structural-distinctness limit.
Never report that row as exact. The −10 label pair dissolves into the same
cluster and is withdrawn; **+20 is the only open pair** and stays blocking
before adoption as selection.

**Retracted by me, on your code-read:** the "two instruments disagree"
finding. `flipDetectedThisBar` is a newness predicate, `HTF_FLIP` is
level-only, same object, different bar — an event fact and a state fact,
both correct. `orderFlipPass = 0` is `SCOPE_NARROW`, not vacuous. Relocation
not owed. Fifth artifact-taxonomy entry: state/event conflation.

**Retracted by me, on your item C:** "no OB-limb carve content." Corrected S5
counts are **OB 3 / fractal 3**, overlapping on 8/26 only, and one OB fire is
on Sep-4 15:55 — the row he disputes. `carveFired` from the predicate is
mandatory, not an improvement: on the OB limb the retained reference *is*
the chosen swing, so a fired carve always yields `nuance == today` and the
relation label always wins.

**Aug-28 1.16508 stays `INFERRED`** and is one of his four confirmations.

## Owed, no rerun, gating the addendum

**Report F** — the one item still outstanding, driven by `E`: 10:35's ext 1
clears the threshold at R 1.21 while today's reference there is off the
ladder entirely (`extIndexOf(today) = NONE`). Per non-firing S5 row: abort
reason, today's R, today's reference and its ext index, ext-1 R. Then
`newSignalCandidates = count(aborted on RR_FAIL alone AND ext1 R ≥ 1.00)`.

If that is ≥ 1, ext 1 adds a signal as well as saving one, and he is making
a different choice than the brief currently describes. It does not halt the
candidate; it prices it.

**Opposed-bias date** — the bar on which the bias became opposed ahead of
Sep-4 15:55. Off-log if the log carries it, otherwise it rides in E40 and is
reported then, never inferred now.

## Unchanged

Addendum: four items, appended to brief v3, issued after F lands, brief not
resent. P-SLDEF-5: E35–E38 plus E39 non-firing cost, E40 renames
(`flipNewThisBar`, `biasOpposedAtGate`, `carveFired` per limb, `rewardPts`
once per row at full precision), gate 6 restated with `ABSORBED` and both
operands printed, gate 11 reporting `newSignalCount` / `lostSignalCount`
ungated with rows named. Build only after F **and** his four confirmations;
halt rather than build if F returns `newSignalCandidates ≥ 1` and he has not
seen it.

RECON15b frozen. No commit. News sequencing untouched.

---

## VERDICT 5 — RESCOPE APPROVED, mark-up VACATED, P-SLDEF-5 cleared to build

# RESCOPE — APPROVED. Mark-up gate VACATED. P-SLDEF-5 cleared to build.

Builder's recommendation is adopted. The mark-up ask was mine, it was wrong on its own terms, and the operator's refusal is the correct answer rather than an obstacle. RECON15b stays frozen. No commit. Adoption stays gated on council ruling plus two yes/no questions, neither of which involves a table.

---

## Ruling 1 — the mark-up is vacated, on three independent grounds

**It violated the governance rule I wrote.** "The hand journal may motivate an investigation, never adjudicate one" was issued after the Sep-7 mis-input nearly redirected the instrument. Asking the hand to adjudicate 113 rungs is that rule inverted at scale. The operator caught it before I did.

**It was conditional on a failure that did not occur.** The mark-up was specified as the path *if* no counting rule reproduced his levels. One does. `rungExt == 1` returns 1.16508 / 1.15847 / 1.16098 / 1.16238 against his 1.16508 / 1.15847 / 1.16098 / 1.16239 — three at residual 0, one absorbed at one point. The mark-up was the fallback and the fallback is not needed.

**It asked the hand to do what the code already did.** `rungExt` is computed, exported, and verified at 0/113 mismatches against the journal. A hand pass over the same rows adds no independent direction; it adds a transcription risk on the artifact the definition would rest on.

Vacated in full. The 113-row table stays on disk as evidence and stays scheduled for emission as its own audited class under E38 — it is what makes `slExt1` checkable by a later session. Only the *ask* is withdrawn.

## Finding — the granularity question is answered, and `rungExt` is the answer

This is the substantive reason vacating costs nothing, and it is worth stating plainly because it retires a worry that has been open since P-SLDEF-2.

The concern was that his structure is coarser than fresh strict fractals, so no count over our set could ever land on his swings. The measured result is that **the extremity filter performs the coarsening.** On Aug-28, `ext 1` skips three less-extreme swing highs at 09:45 / 09:35 / 09:25 and lands on 06:30 — which is ruling (a) verbatim, "more extreme price level," and is exactly what a coarser discretionary reading of the same chart produces. His swings are not a different set from ours; they are our set under the extremity filter. That was hypothesised as a granularity mismatch and it measures as an index choice.

Honest strength, unchanged: n=4, two discriminating rows, arithmetic over a verified transcription plus a direct `SLADDER` read. Leading candidate, adoption is a selection change, and gate 6 is its falsifier.

## Ruling 2 — four confirmations reduce to ONE. Provenance governs which.

The four were not equivalent and I treated them as if they were. Against report B:

| level | provenance | status |
|---|---|---|
| Sep-4 1.15847 | `HAND`, quoted verbatim | **already confirmed.** Filing is bookkeeping, not adjudication. |
| Sep-7 PM 1.16239 | `HAND`, quoted verbatim, status-bar corroborated | **already confirmed.** The 16:05/16:15 bar is a code fact, not his to rule. |
| Sep-7 AM 1.16098 | journal 3/3 exact | **corroborated.** Tag it `HAND` and move on. |
| Aug-28 1.16508 | `INFERRED` | **open.** One question. |

So the gate is one yes/no: *was your Aug-28 stop 1.16508?* That stays owed, and it may not be closed by us. Promoting `INFERRED` to `HAND` on the strength of an absent divergence is the same self-match error that put two `CODE` values into `SLADDER_MATCH` for three relays. E37's provenance refusal exists for this.

**Gate 6 amended accordingly:** grades against filed levels with provenance printed per row. Three rows grade `MATCH` or `ABSORBED` with operands. The Aug-28 row grades **`PROVISIONAL_MATCH`** while its level is `INFERRED` — reported, counted as its own status, never folded into a pass and never a halt. `MATCH` / `ABSORBED` / `PROVISIONAL_MATCH` / `MISS` are four facts and stay four tokens.

## Ruling 3 — "five traded examples" against four signals. Identify the fifth before adoption.

New, cheap, and possibly decisive. The frozen set has four signals. He says five traded examples are on file.

If his fifth is **Sep-4 10:35 SHORT**, then report F's `newSignalCandidates = 1` is not an adoption cost at all — it is the candidate recovering a trade he took and the code currently rejects, and ext-1 goes from three-exact-plus-one-absorbed on 4 rows to a fifth independent confirmation. That would be the strongest evidence the candidate has produced, and it would arrive from a direction nobody arranged.

If his fifth is outside the pilot window, it is unmeasurable here and must be labelled unmeasurable rather than quietly dropped.

If it is inside the window and is none of the five rows above, that is a signal the code misses under *both* definitions and it is a finding in its own right.

**Off-log, no rerun:** enumerate his five filed examples with dates, direction, entry, SL, TP, tagged `HAND` / `INFERRED` / `CODE` per figure, and map each to an S5 row via `signalTime = s5BarTime + PeriodSeconds`. Report unmapped examples as unmapped. This gates adoption, not the build.

## Finding — F=1 is thin, and its reward is the operand most likely to be wrong

Sep-4 10:35 SHORT: today 1.16379 at R 0.36 with `extIndexOf(today) = NONE`; ext-1 1.16299 at R 1.21, `imbCode 2`. It aborted on `RR_FAIL` alone, so under ext-1 it fires.

Two things to name before this reaches him again.

**R 1.21 clears the threshold by 0.21** — the second-thinnest margin on the sheet after 1.07's 0.07. And the added signal's reward derives from a computed VWAP/POC level, which is precisely item D's sub-pip hazard: `%.2f` on R hides a continuous operand. A row that clears by 0.21 on a reward carrying hidden sub-pip digits must have its reward printed at full precision before anyone rules on whether it should fire. That is E40's `rewardPts` requirement, applied with a named reason.

**The same stale extreme kills two setups.** 1.16379 is one persisting Sep-3 20:35 extreme seen in two frames, and it is today's reference on both 9/04 10:35 and 9/08 16:40 — the only two rows where `extIndexOf(today) = NONE`. So the OB anchor pins a stop to a days-old extreme on two of ten rows, producing R 0.36 and R 0.60. That is the clearest statement yet of what the anchor costs, and it is independent of the operator's levels entirely.

## Correction to my own earlier amendment — gate 2 applies in full this run

I wrote that "the four-signal identity is expected to change under ext 1, so gate 2's four-signal clause applies to the `slToday` selection path only." That is wrong for this packet. E35 is a **shadow** — `slExt1` is computed and printed and selects nothing — so the four-signal set must reproduce **verbatim**, and any movement halts. The scoped clause belongs to the adoption packet, not to this one. Gate 2 stands unamended.

## Stale-paste — closed, with one standing rule

Cause confirmed: a stale re-paste of v3 after v4 was filed. No verdict was lost, and the ruled-on verdict was worked in full. Closed.

Standing rule, and the lesson is the line's own: **the council may not ask for confirmation of a quoted paragraph.** I asked him to confirm a first paragraph, which is identification by label, in a session whose central finding is that labels are unreliable and content governs. Confirmations are requested against a measured value with its file digest, never against prose. Version tag plus ruling-ID receipt stays in force; the single source of truth is the file on disk.

---

# BUILD PACKET P-SLDEF-5 — CLEARED. Print-only.

E35 through E40 as specified in the prior packet, unchanged, plus the amendments below. **No selection may change. No reference definition may change. `slToday` must not move. MTEXIT stays 4.**

## Amendments

- **E37 provenance:** tags `HAND` / `CODE` / `INFERRED`, three values. `CODE` refused as an operator level. `INFERRED` accepted and printed, and it propagates to gate 6 as `PROVISIONAL_MATCH`.
- **E39 extension:** per non-firing S5 row add `rewardPts` at full precision and `riskPts` for both today and ext-1, so every R on the sheet is re-derivable as a ratio of printed operands. `newSignalCount` and `lostSignalCount` reported with rows named, both ungated.
- **E40 addition:** on the two `extIndexOf(today) = NONE` rows, print the OB extreme's `slot`, `barTime` and age in bars. The stale-extreme finding then rests on operands rather than on my arithmetic.
- **E38 unchanged:** the 113-row mark-up table still ships as its own audited class. It is now evidence, not an ask.

## Gates

Full window, pilot ini unchanged, 3168 / 563338. Gates 1–4 and 12–15 as in P-SLDEF-4, verbatim, including FlowLogic digest `3606BFB4…` unchanged and the **ninth** inert join at `SLIMB` 481/481, `SLIMBWALK` 481/481, `SLIMBWALKF` 481/481, `SLIMBR` 10/10 with deltas and classes. Gate 2 in full, four-signal set verbatim — `slToday` movement halts.

5. `slExt1` resolved on every invocation, or `ext1Defined=0` named with its deepest available ext. `outwardExt1Pts` sign distribution reported, unconstrained.
6. Per firing row: price residual **and** bar difference against the filed level, with provenance. Three rows `MATCH` or `ABSORBED` with operands printed; Aug-28 `PROVISIONAL_MATCH`. A residual beyond the 1-point absorption limit on any row halts with operands.
7. `extIndexOf` printed for all six references. `count(extIndexOf(today) == 1)` over the ten S5 rows reported — 4/10 is the comparison record.
8. `carveFired` × class cross-tab in full, S5 subtotals per limb. Expected `OB 3 / fractal 3` from item C; a different count is a finding, not a pass.
9. `ladCovers` over the obligated subset including `slExt1`. `ladObligN` reported; `VACUOUS_COVER` named where the obligated set is empty.
10. `LINEWIDTH truncated = 0` on all classes including the three DECISION classes and the mark-up class. Data `BADFMT = 0`, audit lines excluded by construction.
11. `newSignalCount` / `lostSignalCount` with rows named and full-precision reward and risk on every row that changes state. Expected `1 / 0`; a different pair is reported, not absorbed.

Halt rather than substitute on E35's `ext1Defined` clause, gate 6, and the inert join.

## What closes after this run

If gate 6 passes on three rows plus one provisional, the definition is `rungExt == 1`, no imbalance term, no carve-out, and the packet after it is a **single anchor-and-count change** with its consequences already on paper: four signals at R 2.43 / 1.66 / 1.76 / 2.34, one added at 1.21, one stale-OB reference retired on two rows. The imbalance walk retires as a measured candidate; buffers 37/38 stay as exports and censuses. That is shadow-first completing, not failing.

If gate 6 misses beyond absorption on any row, the candidate dies with operands and the path reverts to the mark-up — which he has refused, so it would revert instead to enumerating candidate indices against his five filed examples. Worth knowing now that the fallback has changed shape.

---

# OPERATOR — two questions, no tables

1. **Was your Aug-28 stop 1.16508?** Yes or no. It is the one figure of five currently inferred rather than quoted, and we may not promote it ourselves.
2. **Your fifth traded example — which date and direction?** Four are mapped to signals. If the fifth is the Sep-4 morning SHORT, the candidate gains a fifth independent confirmation and what we have been calling an adoption cost is a recovery.

Everything else previously asked of him is withdrawn or already answered. His open judgments stay yes/no and unhurried: the wick-equality contradiction (10 survived / 16 invalidated at the POI wick site), and the 23:55 flat against a record that never held a bar. Neither gates this build.

---

# NEWS — one sequencing consequence

Unchanged in every particular, with one item newly unblocked: the opposed-bias date ahead of Sep-4 15:55 is not on-log and rides `biasOpposedAtGate` in E40. That was the last prerequisite for the exit side. So this run, in addition to pricing the definition, clears the exit side to be designed — after the imbalance decision, as ruled.

Exit side: three flats by value, append-only, priority `SL`, `TP_TOUCH`, flats, `POI_BODY_BREAK`, `HTF_FLIP`, every verdict printing, MTEXIT re-frozen after. Entry side last, inside `ST_S5_GATE_CHECK` after the divergence walk and before `g_latchedEntry`, rollback to `g_confirmFromState`, latch unspent. Flats stay **provisional**. Probe requirement stands on both edits: exercised once off-canonical, own digest, reported, reverted in-session, never committed.

Table pinned at `5FFF5C76…EF1F134`, rows `{eventTimeET, kind}`, conversion at read, resolved bar printed per row. Oct-28 at `offsetMinutes 360` is the table's regression test and is quoted in every future news result.

# STANDING DEBTS

- Aug-28 provenance (`INFERRED`) and the fifth-example map — both gate **adoption**, not the build.
- `+20` label pair (14:55 / 15:15, price 1.16218 pinning 14:55) — the only open pair, blocking before adoption as selection. `−10` and `−15` both dissolved into absorption clusters.
- N1: POI body 28/0 confirmed, POC 3/0 confirmed, **POI wick 10 survived / 16 invalidated contradicted**, VWAP 0/0 and exit-body 0/0 unexercised. Operator ruling, not a code change.
- Sep-4 concentration: `seqBias < seqS5`, bias opposed at gate, `PASS`, `barsHeld 0`, one OB carve fire on that row, his 23:55 flat against a never-held record. Operands close each item; his read opens it.
- Artifact taxonomy, five entries: parser, truncation, sticky-flag, script-mislabel, state/event conflation. Any new census gets read against all five before it is believed.
- Archive acceptance is the purity triple plus SHA, line count and boundary indices. The wrapper is a convenience and is not repaired on a canonical packet.

---

## VERDICT 6 — RECON16b ACCEPTED, baseline advances, P-SLDEF-6 issued

# RECON16b-SLDEF5 — ACCEPTED. Baseline advances. Adoption is NOT yet packetisable, and the reason is in the deviation.

Ask 1 granted. Frozen baseline advances to **EA `893B26DF…` (399946 B)**, FlowLogic `3606BFB4…` unchanged, archive `4740FA3B…` / 17954 lines. RECON16 (build 1, `5B4F7E06…`, `A32F0E85…`) is superseded, retained as journal, and is **not** a baseline for anything — same standing as RECON15. Local commit cleared subject to the archive record below.

Ninth consecutive inert join at 481/481 ×3 plus 10/10 against 11b, zero mismatch, across a packet that edited the census layer heavily. Nine builds is no longer a streak, it is the custody mechanism.

**Archive record incomplete.** Purity triple and boundary indices are absent for both runs. The standing acceptance test is purity plus SHA plus line count plus boundary indices, and it was made the acceptance test precisely because the wrapper is unreliable. State them for 16b before commit. One grep.

**Gate 8 was measured on build 1 and is not restated for 16b.** Gates 6/7/11 were re-confirmed; gate 8 was not in that list. 16b is the run of record, so its carve counts govern. Off-log grep, no rerun.

---

## Ruling — the E35 deviation is accepted for this run and it BLOCKS adoption

`slExt1` sits at the S5 `SLIMBR` site, not inside `ComputeSlReference`. The builder's instinct to keep a shadow out of the frozen selection function is right, and gate 5's intent is met at the decision surface. Accepted as executed.

The consequence is larger than the deviation. **Adoption moves the stop reference at every `ComputeSlReference` invocation, not just at S5** — 432 at S2POLL, 39 at S3ARM, 10 at S5. And those 471 pre-S5 computations reach S5 through the memo: `SLMEMO computes=471 hits=118`. A changed reference at S2POLL propagates into 118 S5 evaluations by cache hit. So ext-1 has been measured on 10 of 481 invocations and adoption would move it on all 481, with an unmeasured propagation path into the decision surface itself.

That is not a defect in the build. It is the definitional gap the placement dodged, and it is worth naming exactly:

**`slExt1` is currently only defined where an entry exists.** The ladder is enumerated outward from the entry bar. At S2POLL and S3ARM there is no entry. So the ext-1 reference has no defined origin at 471 of 481 invocations, and the adoption packet cannot be written until the origin at pre-entry sites is ruled and measured.

The origin is probably available — `slCurPx` exists at those sites, the side guard uses it, and the live R computation at S2POLL already has a price to divide by. So this likely resolves to "the evaluated bar's prospective entry." But it must be stated, printed per invocation, and gated, not assumed. Shadow-first surfacing an undefined term at 98% of its population one packet before a selection change is the method working.

**Ruling: one more shadow run before adoption.** P-SLDEF-6 below. It is also the run that answers Ask 2, so it costs nothing extra.

## Candidate scorecard — four exact, one absorbed, n=5

| signal | operator level | provenance | ext-1 rung | residual | barDiff | grade |
|---|---|---|---|---|---|---|
| 10:05 Aug-28 SHORT | 1.16508 @06:30 | **HAND** (Q1) | 06:30 / 1.16508 | 0 | 0 | MATCH |
| 16:00 Sep-4 LONG | 1.15847 @15:30 | HAND | 15:30 / 1.15847 | 0 | 0 | MATCH |
| 09:20 Sep-7 LONG | 1.16098 @08:40 | HAND | 08:40 / 1.16098 | 0 | 0 | MATCH |
| 16:45 Sep-7 LONG | 1.16239 @16:15 | HAND | 16:05 / 1.16238 | −1 | −2 | **ABSORBED** |
| 10:35 Sep-4 SHORT | 1.16299 | **HAND** (Q2) | 1.16299 | 0 | — | MATCH |

All five `imbCode 0` or `2`; none `1`. Creation-side imbalance stays falsified at the decision surface.

**Aug-28 promotion accepted off-log.** Q1 answered YES with the bar, the operands were already printed at residual 0, and the tag flip introduces no new number. Correct call to decline a rerun. Two constraints: the log says `PROVISIONAL_MATCH` and is not retroactively re-read — the promotion is an off-log provenance update with his answer quoted as its source; and `filedT 06:30` rides the next run so the barDiff stops resting on "by inspection."

**The candidate has never been tested on disagreement.** Five agreements is not five falsification attempts. Every case so far is a row where he and ext-1 concur. The first genuinely out-of-sample test is the Sep-8 pair, on bars where the code produces no opinion at all and therefore no machinery of ours could have manufactured the agreement. That is the strongest evidence direction available and it is now cheap.

## Finding — "exactly two swings away" IS `rungExt == 1`. The ambiguity was ours.

His generalisation, recorded three relays ago as a larger change than an anchor flip, is the candidate. `ext 0` is the first extremity swing, `ext 1` the second. Two swings away, zero-based.

His own language corroborates it independently: Q2's Sep-8 London stop is described as the **"9:40 second swing."** He counts extremity levels and calls them swings, and the code's `rungExt` enumerates exactly that. What looked like a granularity mismatch — his coarse structure against fresh strict fractals — is the extremity filter doing the coarsening. On Aug-28, `ext 1` skips three less-extreme swing highs at 09:45 / 09:35 / 09:25 and lands on 06:30, which is ruling (a) verbatim.

So the definition now has two independent supports: five price matches, and his verbal rule reconciled to the index. The `rungSlot`-versus-`rungExt` ambiguity that E23.3 exported both indices to resolve is resolved.

## Q2 — the fifth is a confirmation of the LEVEL. Whether F=1 is recovery or cost is one question away.

Sep-4 10:35 SHORT, **considered-not-taken**. Entry 1.16265, TP 1.16224, SL 1.16299 HAND. Reward 41, risk 34, R 1.206 → 1.21, reproducing the measured `rewardPts 41.00000 / riskPts 34.00000` exactly. His stop equals the ext-1 rung at residual 0.

The arithmetic closing on all three operands simultaneously is a genuine second direction, so the `1.16224` typo closure is accepted on that basis and not on preference. Third hand-figure correction in the line; the governance rule earns its keep again.

The builder's framing — "F converts cost→recovery" — is half right and I want the halves separated:

- As evidence for the **definition**, it is a fifth confirmation from an unarranged direction. Accepted in full.
- As an **adoption cost**, it is not yet resolved. He saw the setup and declined it. Under ext-1 the code would fire it.

The reason he declined is the deciding fact and it is nearly in hand: his journal shows **0.92R on an OANDA feed error against a true 1.21**. He declined a setup that his data showed sub-threshold and true prices show above threshold. That makes recovery the likely reading — but it is an inference about his intent, and inference about intent is exactly what governance forbids us. **One yes/no to him**, below.

## Correction — OB carve fires 4, not 3. Item C's method was mine and it under-counted.

Predicate: **OB 4** (8/26, 9/04 09:25, 9/04 15:55, 9/07 09:15), all four `TODAY_EQ_NUANCE`, companions 0. Fractal: 3, with predicate = class = companions exact.

Item C measured `count(slNuance != slBase)` and returned 3. I specified that method. It counts carves that **changed a value**; the predicate counts carves that **fired**. On 9/07 09:15 the OB carve fired and the retained reference equalled the base, so the consequence-proxy missed it. The fractal limb agrees across both methods because a fired fractal carve always changes the value there, which is why the proxy looked sound.

Item C's OB 3 is **retracted as a proxy under-count with its cause named.** Authoritative counts: predicate OB 4 / fractal 3, six S5 instances across limbs. My gate 8 expectation quoted a count from a proxy population — third instance of the population-identity failure, and it goes in the taxonomy as its own entry: **firing-versus-effect conflation**, alongside state/event. Six entries now.

Note 9/07 09:15 carries a fire on both limbs and is also the 1.07 thin-margin row. Not decision-critical — ext-1 gives 1.76 there — but it is the second time that row has been the most sensitive cell on the sheet.

## Correction — `NONE = 4` collapses two different facts. Split them.

Report E had `extIndexOf(today) = NONE` on two rows and `ext −1` on two others. The run reports NONE=4. Those are not one fact:

- **Off ladder entirely** — 9/04 10:35 and 9/08 16:40. Today's reference is a zero-step OB extreme, not a rung at all.
- **On the ladder, no extremity index** — 9/04 15:55 (`rungSlot 408`) and 9/07 16:40 (`rungSlot 21`). These are rungs with `ext −1`.

Collapsing them is `0` versus `EMPTY_VALUE` in a new costume. Split into `OFF_LADDER` and `EXT_NONE`.

The `noneAge +167 / +407 / +20 / +816` list inherits the collapse. Attributed by slot, `+167` and `+816` are the two off-ladder rows and `+407` / `+20` are rung ages — and only the first pair is stale-extreme evidence. Those two are worth stating properly because they close item C3 arithmetically: **816 bars is 68 hours, which is 116 calendar hours minus a 48-hour weekend**, and 167 bars is ~13.9 hours. One persisting Sep-3 20:35 extreme, two rows, two frames, ages consistent to the bar. C3's "one extreme in two frames" is now independently confirmed.

So the anchor finding stands and sharpens: on two of ten rows the OB anchor pins the stop to an extreme 167 and 816 bars old, producing R 0.36 and R 0.60. That is independent of the operator's levels entirely.

## Gate 9 — two tokens, two populations, currently contradictory

`covers 1=9 / 0=1` and `ladObligN … 0=1`, both named on 9/08. A row with an empty obligation set cannot fail a coverage test computed over the obligated subset — coverage over an empty set is vacuously true, which is why `VACUOUS_COVER` exists. Reporting `covers=0` and `ladObligN=0` on the same row means the two tokens are over different populations, most likely because build 2 added ext-1 to the cover test while the `steps>0` clause keeps ext-1 out of the obligation count.

Not a defect. A naming debt, and the population-identity convention already covers it. Name both populations in `FRAME_NOTE`, and report 9/08 as **`VACUOUS_COVER` + `EXT1_UNCOVERED`** — two statuses, not `covers=0`. No dependent decision on that row, so nothing downstream moves.

## ORDER — reconciles, and one cross-tab is owed

16 rows, `RR_FAIL 6 / DIV_WAIT 6 / PASS 4 = 16`, `STAMPED 12 / SEQ_UNSTAMPED 4 = 16`. The RECON15b miscount is closed from both directions.

`flipNewThisBar = 0` on all 16 with `biasOpposedAtGate = 1` on 3. Both correct and consistent with the newness-versus-level code-read: the opposition became established on a bar that is **not among the 16 S5-evaluated bars**, which is why no bar shows it as new. So the opposed-bias date is still not on the record, but it is now **bounded** — outside the 16. It stays owed for the exit side and is not inferred.

`biasOpposedAtGate = 3` against `PASS = 4` is the number I want cross-tabbed. Sep-4 15:55 is one opposed PASS. If a second opposed row also passed, the Sep-4 concentration is not unique and the entry-side finding is broader than one signal. Off-log grep.

## Ask 2 — Sep-8: instrument it, folded into the same packet

Both bars are unmapped: no S5 row at 10:10 or 17:00, code silent. Two separate things follow and they must not be merged.

**As a test of ext-1, instrument it.** His stops are 1.16258 (from the "9:40 second swing") and 1.16274 (16:20), both SHORTs. Testing them needs a ladder at a non-S5 bar, which is the same capability the 481-site shadow requires — so it is one edit, not two. If ext-1 returns those two prices, the candidate gains two confirmations from bars where no machinery of ours had an opinion. If it misses, the candidate is weakened out of sample, which is the first real chance it has had to fail.

**As a coverage finding, it is a separate line of work.** No S5 row means the miss is upstream — S1–S4 or the divergence walk — and has nothing to do with the stop definition. Logged as a new open item, not scoped now.

Coverage, stated once because it is the first such number in the line: he has enumerated **7** setups. The code produces S5 rows for 5 and fires 4. Under ext-1 it would fire 5. Two stay invisible under either definition. His 7 is his enumeration and may not be exhaustive.

---

# BUILD PACKET P-SLDEF-6

Print-only. **`slToday` must not move. No existing reference definition may change. No selection may change. MTEXIT stays 4.** This is the first packet that edits inside `ComputeSlReference`, so the instrument must be strictly additive there and the join is the proof.

## E41 — `slExt1` at all 481 invocations

1. Computation moves inside `ComputeSlReference`, both branches, every invocation. Additive only — no existing local, return path, or memo interaction altered.
2. **Ladder origin ruled and printed.** At S5 the origin is the entry bar, unchanged. At S2POLL and S3ARM the origin is the evaluated bar's prospective entry — whatever price origin the live R computation at that site already uses. Emit `ladOrigin`, `ladOriginBarTime`, `ladOriginSite` on every invocation. **Halt condition:** if no origin is available at a site, halt and report — do not substitute the evaluated bar.
3. `ext1Defined=0` named with the deepest available ext where ext-1 does not exist. Never a fallback price, never silent.

## E42 — relocation falsifier

The ten S5 `slExt1` values reproduce RECON16b **bit-identical**, keyed `bar|site`. A miss means the relocation changed the computation and halts with operands. This is the same standard the OB-limb join met when the fractal limb was added.

## E43 — memo propagation

`ext1MemoAgree`: where an S5 evaluation takes a memo hit, compare the memoised `slExt1` against a freshly computed one at S5 on the same row. Report agreement count over the 118 hits. Disagreement is not a halt — it is the measurement that sizes adoption's blast radius, and it is the reason this run exists.

## E44 — Sep-8 targeted probe

Ladder plus `slExt1` at the two named bar times, hardcoded, print-only, graded against `1.16258` and `1.16274` with provenance `HAND`. Report residual and barDiff per row, or `NO_LADDER` with its cause. If the 481-site shadow already covers those bars, report the probe as redundant rather than emitting twice.

## E45 — token splits and naming

1. `OFF_LADDER` and `EXT_NONE` as distinct statuses; `noneAge` emitted only on `OFF_LADDER` rows with slot and barTime.
2. `ladObligN` and `ladCovers` populations named in `FRAME_NOTE`; 9/08 reports `VACUOUS_COVER` + `EXT1_UNCOVERED`.
3. `carveFired` from the predicate is authoritative; the consequence-difference count is reported separately and labelled as a proxy.
4. `filedT` printed per filed level so barDiff never rests on inspection.

## Gates

Full window, pilot ini unchanged, 3168 / 563338. Gates 1–4 and 12–15 as in P-SLDEF-5 verbatim, FlowLogic digest `3606BFB4…` unchanged, gate 2 in full with the four-signal set verbatim.

5. **Tenth inert join, and it is the load-bearing gate this run:** `SLIMB` 481/481, `SLIMBWALK` 481/481, `SLIMBWALKF` 481/481, `SLIMBR` 10/10 against 11b, deltas and classes included. Any movement halts — `ComputeSlReference` was edited and this is the only proof it stayed additive.
6. `slExt1` resolved on all 481 invocations or `ext1Defined=0` named. `ladOrigin` present on every invocation, `ladOriginSite` histogram reported 432 / 39 / 10.
7. E42 relocation falsifier: ten S5 rows bit-identical to RECON16b.
8. `ext1MemoAgree` reported over the 118 hits, ungated, with disagreeing rows named.
9. E44 graded per row with residual, barDiff and provenance.
10. Gate 8 restated from this run: `carveFired` per limb, S5 subtotals, predicate authoritative. `OB 4 / fractal 3` is the comparison record.
11. `OFF_LADDER` / `EXT_NONE` split reported; RECON16b's collapsed `NONE=4` is the comparison record.
12. `LINEWIDTH truncated = 0` all classes. Data `BADFMT = 0`.

Halt rather than substitute on E41.2, gate 5, gate 7.

## Off-log, no rerun

- 16b purity triple and boundary indices; gate 8 restated from 16b.
- `biasOpposedAtGate × gateOutcome` cross-tab over the 16 ORDER rows.
- Confirmation that the 9/08 `VACUOUS_COVER` row and the `covers=0` row are the same row, with each token's population named.

## What closes after this run

If gate 5 and gate 7 hold and `slExt1` resolves across all 481 with a stated origin, the **adoption packet is writable**: one anchor-and-count change with its consequences on paper across the full invocation population, not just the decision surface. Four signals at R 2.43 / 1.66 / 1.76 / 2.34, one added at 1.21, one stale-OB reference retired on two rows, the imbalance walk retiring as a measured candidate with buffers 37/38 staying as exports.

If the memo comparison disagrees, or the origin at pre-entry sites cannot be stated without substituting, adoption needs one more definitional ruling before it ships — which is precisely what this run exists to find out.

---

# OPERATOR — one question

**Sep-4 10:35 SHORT.** You considered it and passed, at 0.92R on OANDA data. True prices give 1.21R, above the 1.00 threshold, and your 1.16299 stop matches the candidate rule exactly.

**On correct data, would you have taken it?** Yes or no. If yes, the definition change recovers a setup rather than adding an unwanted one, and that is the last open term in the adoption decision.

Nothing else is asked. The mark-up stays vacated. Your open judgments remain unhurried and gate nothing: the wick-equality contradiction (10 survived / 16 invalidated at the POI wick site), and the 23:55 flat against a record that never held a bar.

---

# STANDING DEBTS

- Adoption gated on P-SLDEF-6, plus the one operator question above.
- **New:** Sep-8 pair unmapped — no S5 row at 10:10 or 17:00. An upstream S1–S4 or divergence-walk coverage miss, independent of the stop definition. Logged, unscoped.
- Coverage: 7 operator-enumerated setups, 5 with S5 rows, 4 firing, 5 under ext-1, 2 invisible either way. His enumeration, possibly not exhaustive.
- `+20` label pair (14:55 / 15:15, price 1.16218 pinning 14:55) — the only open pair, blocking before adoption as selection. `−10` and `−15` both dissolved into absorption clusters.
- N1: POI body 28/0 and POC 3/0 confirmed, **POI wick 10 survived / 16 invalidated contradicted**, VWAP and exit-body unexercised.
- Opposed-bias date: bounded outside the 16 S5-evaluated bars, still not dated, still owed for the exit side.
- Artifact taxonomy, six entries: parser, truncation, sticky-flag, script-mislabel, state/event conflation, **firing-versus-effect conflation**.
- Archive acceptance is purity triple plus SHA, line count and boundary indices. Currently outstanding for 16b.

# NEWS — unchanged, one prerequisite now bounded

Exit side after the imbalance decision, after `MTFLIP`, after `ORDER` — which reconciles — and after the opposed-bias date, now bounded but not dated. Three flats by value, append-only, priority `SL`, `TP_TOUCH`, flats, `POI_BODY_BREAK`, `HTF_FLIP`, every verdict printing, MTEXIT re-frozen after. Entry side last, inside `ST_S5_GATE_CHECK` after the divergence walk and before `g_latchedEntry`, rollback to `g_confirmFromState`, latch unspent. Flats stay **provisional**. Probe requirement stands on both edits: exercised once off-canonical, own digest, reported, reverted in-session, never committed.

Table pinned at `5FFF5C76…EF1F134`, rows `{eventTimeET, kind}`, conversion at read, resolved bar printed per row. Oct-28 at `offsetMinutes 360` is the table's regression test and is quoted in every future news result.

---

## VERDICT 7 — RECON17-SLDEF6 ACCEPTED, baseline advance CONDITIONAL, P-ADOPT-1 ISSUED

# RECON17-SLDEF6 — ACCEPTED. Baseline advance is CONDITIONAL on one identity. Two gates re-graded. Adoption packet issued as two runs, one packet.

Fourteen gates measured, zero halts, and the tenth consecutive inert join across a packet that edited **inside** `ComputeSlReference` for the first time. That was the load-bearing gate and it held: `SLIMB` 481/481, `SLIMBWALK` 481/481, `SLIMBWALKF` 481/481, `SLIMBR` 10/10 with deltas and classes. Additive-only is proven, not asserted.

E42 is the result worth naming: ten S5 `slExt1` values bit-identical after relocation, with line deltas confined to the intended `filedT` / `barDiff` tokens. The relocation changed nothing, and it was checkable because the falsifier was written before the move.

## Ask 1 — ACCEPT, with commit and baseline advance held on one number

`SUPPRESSED 152`. Every gate-2 list from P-SWINGIMB-2 through P-SLDEF-6 quoted **156**, verbatim, and 16b's relay did not quote it at all. So a frozen identity has moved by −4 and arrives asserted equal to a run that never stated it.

Two possibilities and they need different responses: a real behavioural drift, or a scope artifact of the kind `PROMO=1097` already produced. Neither may be assumed.

**Off-log, no rerun:** quote `SUPPRESSED` as a series across 11b / 12c / 13 / 14 / 15b / 16 / 16b / 17 under one head-anchored pattern, and name the build at which it moved. If it moved at a build, name the edit. If the series is flat at 152 and 156 was a looser pattern, that is the fifth parser artifact and it gets annotated, not accepted.

Baseline advances to **EA `6ACDF3B8…` (413224 B)** and local commit is cleared **on that series landing**. Everything else in the archive record is complete this run — SHA `2B9ADBDE…`, 18459 lines, bounds `[98283..116742]` contiguous from 16b, purity 1/4/481. Still outstanding from the prior verdict: 16b's purity triple and boundary indices, and the `biasOpposedAtGate × gateOutcome` cross-tab over the 16 ORDER rows.

## Gate 11 — FINDING, not a pass. The split was implemented as a rename.

`EXT_NONE` unexercised while `OFF_LADDER = 4` is the tell. A status defined and never reached, whose population demonstrably exists, means the classifier put those rows in the wrong bucket.

Two of the four are rungs. `9/04 15:55` at `rungSlot 408` is the rung the operator's 1.15907 matched at residual 0. `9/07 16:40` at `rungSlot 21` holds 1.16218, today's own reference. Both are on the ladder with `ext −1`. Only `9/04 10:35` (168) and `9/08 16:40` (817) are off the ladder entirely. Correct split is **`OFF_LADDER 2 / EXT_NONE 2`**, and RECON16b's collapsed `NONE=4` remains the comparison record for both.

`noneAge 167 / 407 / 20 / 816` inherits the collapse and carries a second problem: against slots 168 / 408 / 21 / 817 it is `slot − 1` on every row. It is the reference slot restated in the shift frame, not an independent age measurement. Rename it `refSlotAge`, state in the token block that it is the slot restated, and emit it on both statuses.

The stale-extreme finding survives and must be re-grounded. It rests on `barTime` identity — one persisting Sep-3 20:35 extreme referenced from two rows — not on this token. My arithmetic checks out as corroboration (Sep-3 20:35 to Sep-8 16:40 is 116 calendar hours, less a 48-hour weekend, is 68 hours, is 816 M5 bars), and it is corroboration of a `barTime` identity rather than evidence in its own right. So the anchor cost stands: on two of ten rows the OB anchor pins the stop to an extreme 167 and 816 bars old, at R 0.36 and R 0.60.

No dependent selection on any of this. It rides run A.

## Gate 9 — UNTESTED, not passed. The out-of-sample test has not run.

The disclosure is the correct call and it is also the whole verdict: the shadow rows are LONG-side, his levels are SHORT-side, so the residuals `−146` and `−87` and the `barDiff −288` compare a protective ladder against the wrong side of the market. Same shape as RECON13's cap-adjacent absence — it fails to test, which is a different verdict from failing, and it gets the remedy rather than the finding.

This matters more than the other two items. **The candidate's entire evidence base is in-sample.** `rungExt == 1` was selected by reading his levels off the ladder; the five agreements are the fitting set, not five falsification attempts. Sep-8 is the only out-of-sample test available — two bars where the code produces no S5 row, so no machinery of ours could have manufactured agreement — and it is still unrun.

It is cheap to run: a forced-side ladder at two hardcoded bar times. It goes in run A and it halts run B.

**Second finding inside the first.** The EA's evaluated side at 10:10 and 17:00 was LONG while he traded SHORT. So the Sep-8 pair is not merely an S5 coverage gap — the code was looking the wrong way on both bars. That sharpens the standing debt from "no S5 row" to "opposed evaluated side," which points upstream at bias or S1–S4 rather than at the divergence walk. Logged, unscoped, and it is not a stop-definition problem.

## Ask 2 — E43 denominator: probe-10 accepted as the decision surface, and it is 10 of 118

Populations named, per the standing rule. The probe measured the **S5 subset**: 10 evaluations taking a memo hit, 9 memoised at S2POLL and 1 at S3ARM, all 10 agreeing with a fresh S5 computation. That is the propagation path that reaches a selection, and it is the one that mattered. It is not the 118 and may not be quoted as such. The remaining 108 are non-S5 re-polls; they extend in run A, ungated.

## Ask 3 — S3ARM origin CONFIRMED, and the probe already falsified the hazard it created

Eval-bar close at S2POLL and S3ARM is accepted as the prospective entry, not as a substitution. E41.2's halt clause was aimed at a site with no origin at all, and that is not this.

It does leave two origin conventions on one reference: next-open at S5, eval-close pre-entry. That would normally be an unruled term inherited by adoption — except the E43 probe accidentally tests it. Nine of the ten agreeing values were computed at S2POLL under eval-close and compared against a fresh S5 computation under next-open. **Rung selection is origin-insensitive on those 10 rows, measured.** That is a genuine result and it is worth more than the ruling it discharges.

Bounded honestly: 10 of 481. Run A computes both origins at every invocation and reports a disagreement count, and the two conventions go into `FRAME_NOTE` as the seventh named convention, per site.

## Ask 4 — the HAND flip rides adoption, as built

Confirmed. The log says `PROVISIONAL_MATCH` because `INFERRED` was true at build time, and the log is not retroactively re-read. The promotion is an off-log provenance update with his YES quoted as its source, `filedT 06:30` now shipped so `barDiff` no longer rests on inspection, and the row grades `MATCH` with provenance `HAND` on the adoption run.

## The `+20` label pair — DISCHARGED as non-blocking for this adoption

It was blocking before adoption as selection, so it gets ruled rather than carried. His `1.16218` pins the 14:55 rung, which is `rungSlot 20` and is **today's** reference on the Sep-7 PM row. Under ext-1 that row's reference becomes 16:05 / 1.16238. The disputed bar is not the adopted reference on any of the ten rows, so the ambiguity does not reach selection.

Discharged with a condition: it re-arms immediately if any future definition reads that rung. It is not resolved, it is out of scope.

## Operator inputs — complete, and one governance addition

Recovery-YES on Sep-4 10:35 closes the last open term: F=1 is a recovery, not an unwanted addition. Take-iff-R≥1.0 matches the runtime `THRESHOLD` already printed. All five ext-1 references clear it.

The Dukascopy-always rule is a data-provenance rule for his journal, not a code input — pilot ini and tester data stay unchanged, ini-unchanged remains a baseline term. It does carry retroactively: **any `HAND` figure sourced from OANDA is now suspect and gets a feed tag beside its provenance tag.** The 0.92R that made him pass on a 1.21R setup is the reason that rule exists, and it is the third hand-figure correction in this line.

---

# BUILD PACKET P-ADOPT-1 — one packet, two runs, selection behind a compile-time flip

Run A is print-only with the adoption code present and dormant. Run B flips it. Refutation and selection change stay in separate runs, so a candidate that dies out of sample cannot die in the same run that shipped it.

## RUN A — `ADOPT_EXT1 false`. Inert by construction.

- **E46 — Sep-8 forced-side probe.** SHORT-side protective ladder at 10:10 and 17:00, hardcoded bar times, graded against `1.16258` (his "9:40 second swing") and `1.16274` (16:20), provenance `HAND`, feed `Dukascopy`. Print residual, `barDiff`, `imbCode`, `rungExt`, and the EA's own evaluated side at each bar beside it. **Halt condition:** a residual beyond the 1-point absorption limit on either row halts the packet and run B does not launch.
- **E47 — memo agreement over all 118 hits**, ungated, disagreers named, populations printed separately as 10 at S5 and 108 non-S5.
- **E48 — origin insensitivity.** Both origins computed at every invocation, disagreement count reported, seventh convention named per site in `FRAME_NOTE`.
- **E49 — classifier fix.** `OFF_LADDER` / `EXT_NONE` by rung occupancy at the reference slot, expected 2/2. `noneAge` → `refSlotAge` with its derivation stated.
- **E50 — adoption code, dormant.** `slExt1` wired as the returned reference behind `ADOPT_EXT1`, default false. The memo HIT path becomes load-bearing under adoption and is currently unexercised for ext-1 — write it, do not enable it.

**Run A gates:** all RECON17 identities verbatim including the accounted `SUPPRESSED`; **eleventh inert join** 481/481 ×3 plus 10/10; four-signal set verbatim; `slToday` byte-identical; E46 graded per row; E47 reported; E48 disagreement count reported; split 2/2; `LINEWIDTH truncated = 0`; `BADFMT = 0`. Halt on E46, the join, and any `slToday` movement.

## RUN B — `ADOPT_EXT1 true`. The first selection change in the line.

**Predicted delta declared in writing before the run, and the run grades the prediction.** Any measured change absent from the declaration halts. Any declared change that does not appear halts. This is the discipline that replaces the four-signal identity for one run.

Expected to change, with values on paper:

| signal | today | adopted | R today → adopted |
|---|---|---|---|
| Aug-28 10:05 SHORT | 1.16508 | 1.16508 | 2.43 → 2.43 |
| Sep-4 16:00 LONG | 1.15907 | 1.15847 | 2.56 → 1.66 |
| Sep-7 09:20 LONG | 1.16135 | 1.16135 | 1.76 → 1.76 |
| Sep-7 16:45 LONG | 1.16218 | 1.16238 | 1.25 → 2.34 |
| **Sep-4 10:40 SHORT (new)** | — | 1.16299 | — → 1.21 |

Plus: `MTEXIT` changes and is re-frozen after, every verdict printing; the `RR_FAIL` abort bucket loses one.

Expected **unchanged**, and a move in any of them halts: CQD 906; `WS161` fields 21; SLMEMO 471/118/589; SL_REF 432/39/10; INPLAYCOMMIT 157/46; PROMO 469 scoped; CONFIRMPOLL 555; `SUPPRESSED` at its accounted value; sampled-day spot signatures 157/157/443; FlowLogic digest `3606BFB4…`.

Also: `rewardPts` at full precision on every firing row, `THRESHOLD` printed with its source, provenance and feed tags per filed level, and the ten-row decision block re-emitted against the adopted reference.

## What adoption is, stated once

`rungExt == 1` — the second extremity swing outward, no imbalance term, no carve-out. This is the operator's "exactly two swings away, both cases," zero-based, and his own "9:40 second swing" phrasing counts the same index. Ruling (b)'s imbalance-qualified walk and ruling (c)'s wick carve-out both retire as **measured candidates**, authorised by his generalisation and priced on paper. Buffers 37/38 stay as exports, `carveFired` stays as a census, and the 481-row walk record stays on disk — so re-instating either is arithmetic off an existing artifact rather than a rebuild. That is shadow-first completing.

# STANDING DEBTS

`SUPPRESSED` series and 16b's archive record, both before commit. ORDER `biasOpposedAtGate × gateOutcome` cross-tab. Sep-8 opposed evaluated side — upstream, unscoped. Coverage: seven enumerated setups, five with S5 rows, four firing, five under adoption, two invisible either way, his enumeration possibly not exhaustive. N1: POI body 28/0 and POC 3/0 confirmed, **POI wick 10 survived / 16 invalidated contradicted**, VWAP and exit-body unexercised — his ruling, unhurried. Opposed-bias date bounded outside the 16 S5 bars, still undated, still owed for the exit side. Flats **provisional** and now provisional against a `MTEXIT` that run B will move. Artifact taxonomy, six entries, and a candidate seventh pending the `SUPPRESSED` account.

News sequencing unchanged in every particular: exit side after adoption and after the opposed-bias date, three flats by value append-only, priority `SL` / `TP_TOUCH` / flats / `POI_BODY_BREAK` / `HTF_FLIP`; entry side last, inside `ST_S5_GATE_CHECK` after the divergence walk and before `g_latchedEntry`, rollback to `g_confirmFromState`, latch unspent; probe requirement on both edits, off-canonical, own digest, reverted in-session. Table pinned at `5FFF5C76…EF1F134`, rows `{eventTimeET, kind}`, conversion at read, resolved bar printed per row, Oct-28 at `offsetMinutes 360` as the table's regression test.

# COUNCIL VERDICT #8 — P-ADOPT-1 run A

**Disposition: HALT AFFIRMED. Run B does not launch. Packet P-ADOPT-1 closes at run A. RECON17 remains the frozen baseline. Run-A build stays uncommitted.**

---

## 0. Leading finding (supersedes the relay's E46 mechanism)

The E46 mechanism as written does not survive its own numbers, and this changes the shape of asks 1 and 2.

The relay states the origin is "eval-close 1.16190 / 1.16241, **above** his entries 1.16205 / 1.16220." That holds at 17:00 only. At 10:10 the eval-close 1.16190 sits **15 points below** the entry 1.16205. The proposed mechanism — protective swings dropping out against a *higher* close, shifting the count downward — is directionally unavailable at 10:10. On a SHORT with the stop above entry, an origin *below* the entry widens rather than narrows the protective candidate set. So the mechanism explains at most the 17:00 row.

Consequence: E46 delivered two failures with two different signatures, not one family.

| bar | resid | barDiff | signature |
|---|---|---|---|
| 09.08 10:10 | −7 (0.7 pip) | −4 | near-neighbour swing, origin *below* entry, mechanism unexplained |
| 09.08 17:00 | +85 (8.5 pip) | −95 | distant swing (slot 95, 09:05, imb 2), origin above entry, mechanism plausible |

The real discovery in run A is not "origin dependence shifts the count." It is that **`rungExt == 1` carries an undeclared free parameter — the origin — and different sites bind it differently** (S5↔eval-close, S2POLL/S3ARM↔strict next-open). The standing claim that the definition is "anchor-free" is false as implemented: origin *is* an anchor, it was never declared, and the five HAND examples reproduced at resid 0 only at bars where the binding did not bite. E48's 8 S2POLL rows are the same discovery from the other side. Sep-8 is the first case where it bites, and at 17:00 it bites by 95 bars.

---

## 1. Ask 1 — run B is dead; no re-scope, no absorption

**Gate fired on declared terms.** Both residuals exceed 1 point. The verdict-#7 halt condition was pre-declared and unconditional. It binds now, including its own mis-specification (grading a forced opposed-side computation at unmapped bars). Re-scoping the probe after seeing the failure is precisely the move that voids a pre-declared gate; we will not authorise it inside this packet.

**Sub-pip absorption for 10:10 is refused on mechanical grounds, not tolerance grounds.** `barDiff = −4`. Standing rule: identity is `slot+barTime+px+imbCode`, never price alone. The barTime component already mismatches, so the 0.7 pip price proximity is a coincidence between two *different* swings, not a rounding residual on the same swing. Absorbing it would launder a structural disagreement as arithmetic. The residual magnitude is irrelevant while `barDiff != 0`.

**Before any origin work is funded, verify the killing evidence.** Two items:

- The relay carries no feed tag on either Sep-8 HAND figure. Standing rule requires one. There is live precedent for contamination — Sep-4 10:35 recovered only on correction to Dukascopy.
- The two stop distances are 53 and 54 points (1.16205→1.16258, 1.16220→1.16274). Near-identical distances at unrelated times of day is as consistent with a fixed-distance stop as with swing structure. Confirm the operator applied the swing rule at those bars.

If the Sep-8 pair is contaminated or rule-inconsistent, the halt remains procedurally correct — the gate fired — but the origin mechanism loses its primary evidence and would rest on E48's 8 rows alone. That is a materially different investigation, so settle it first. It costs no build.

**Successor packet: P-ORIGIN-1, print-only.** Entry condition, in order:

1. Feed tag + rule-consistency confirmation on the Sep-8 pair.
2. Declare origin as an explicit parameter with an enumerated binding per site. No implicit inheritance.
3. **Regression gate first:** re-grade the five already-reproducing HAND examples under the candidate his-entry origin. All five must hold at resid 0 with full identity match. If any moves, the candidate origin dies there and Sep-8 is never reached.
4. Only on a clean sweep of (3) does Sep-8 become a forward prediction, with a new pre-declared gate.

Grading Sep-8 before the regression sweep would fit the origin rule to the two examples it is meant to predict. That ordering is not negotiable.

## 2. Ask 2 — immaterial at the site; undetermined on the memo path

Split the question.

**At the S5 site: not material.** `disS5 = 0` of 10, `disS3ARM = 0` of 39. All 8 disagreements sit at S2POLL, which run B did not touch. As scoped, adoption resolves where origin choice is measurably inert.

**On the memo return paths: undetermined, and E47 does not cover it.** E47 graded fresh vs memoised *at a single origin* — 118/118 agreement there says nothing about cross-origin exposure. The open question is provenance: can a value computed under the S2POLL binding be returned at a demand serving an S5 decision? No probe in run A answers this. Ask 4's corrected split makes the concern worse, not better — 116 of 118 HITs are non-S5 barTimes, so the cache is dominated by entries whose computing site is unidentified. Census `471/118/589` against 481 invocations leaves 10 unreconciled; that gap is itself unexplained.

Ruling: the 8 rows do not block adoption *at the S5 site*. They block adoption *on the memo paths* until provenance is instrumented. Required print-only probe for P-ORIGIN-1: tag every memo entry with its computing site and origin binding at write, report both at every HIT, and reconcile 481 against 471+10.

**Reclassification.** E48's 8 rows move from "reported, no halt" to primary corroborating evidence in the origin investigation. That origin dependence concentrates at S2POLL (8/432) and vanishes at S5 (0/10) and S3ARM (0/39) is diagnostic, not incidental: it tracks candidate-set width. Carry the three imb-bearing rows and the 2–27 point spread forward as the measured population.

## 3. Ask 3 — slot-reach, 2/2, but the predicate failed, not the witness

**First correction: `OCCUPIED_NOMATCH=4` is not a builder miss.** The off-run construction states a swing value sits at all four slots. Occupancy is genuinely 4/4. The E49 predicate — classify by occupancy — cannot discriminate a population that is uniformly occupied. What failed is the specification we issued, not the implementation. We own that.

**Second: the slot regression is a real defect and it is load-bearing.** RECON17 carried 168/408/21/817; run A reads −1/− with age −1 throughout. The slot-reach predicate is computed *from* those values. Until the slot binding is restored and reproduces 168/408/21/817 exactly, the 2/2 construction is unverifiable off-run arithmetic.

**Ruling, sequenced:**

1. Restore the slot/age binding. Non-negotiable gate: in-run slots must read 168/408/21/817. If they do not, the construction below is void and E49 returns to council unruled.
2. Retire the occupancy predicate. Adopt **slot-reach** as the discriminator.
3. Labels assigned on failure kind:

| label | pair | slot vs reach | failure kind |
|---|---|---|---|
| `OFF_LADDER` | 09.04 10:35, 09.08 16:40 | 168>150, 817>351 | reach failure — no rung can exist by construction |
| `EXT_NONE` | 09.04 15:55, 09.07 16:40 | 408<571, 21<89 | emission failure — reachable, occupied, no rung emitted |

Rationale for the assignment: `OFF_LADDER` denotes the reference slot lying outside ladder reach, which is exactly the beyond pair, and both members carry the known persisting Sep-3 20:35 OB extreme identity — one mechanism, two rows. `EXT_NONE` denotes the ladder covering the slot with a swing value present and still emitting no rung, which is the within pair the relay itself places in the frame-defect family. Ladder-shift membership (0/4) is rejected: it reproduces status quo ante and discriminates nothing.

4. Expected split is declared now as `OFF_LADDER=2 / EXT_NONE=2 / OCCUPIED_NOMATCH=0`, graded as a prediction on the next run.

`refSlotAgeBars` rename retained — 10/10 on SLEXT1, 10/10 on SLEXT45, old token 0. Seventh FRAME_NOTE convention retained.

## 4. Ask 4 — accepted, with one amendment

No action on the prediction ledger. Amendment: log 10/108 → 2/116 as a **prediction miss**, not a bookkeeping note. The declared model of memo population was wrong by two orders on the S5-membership axis. That is direct evidence the memo path was less understood than P-ADOPT-1 assumed when it scoped adoption onto both memo return paths. Carry the corrected split into ask 2 as the standing reason provenance tagging is mandatory rather than optional.

---

## 5. Standing orders

- **Do not commit the run-A build.** E50's dormancy is cleanly proven — SLIMBR slToday 10/10 byte-identical, eleventh inert join at 481/481×3 + 10/10 with zero mismatch and zero misses — and the adoption code may remain in the tree at `InpAdoptExt1=false` through the origin investigation. But the same build carries the E49 slot regression. Fix the regression, re-verify the inert join, then commit dormant.
- RECON17 (`6ACDF3B8…`, 413224 B) stays the frozen baseline. FlowLogic `3606BFB4…` unchanged.
- All RECON18 identities logged verbatim and carried: four-signal set R 2.43/2.56/1.76/1.25 with SIGMAP 4/4, WS161 3168/3168/205/0, SLIMB/WALK 481s, SLEXT1 6/1/2/1, DECISION 10/4 @1.00, SUPPRESSED 152, SLEXT481 432/39/10, Sep-8 REDUNDANT resids −146/−87.
- The run-B delta table (2.43→2.43 / 2.56→1.66 / 1.76→1.76 / 1.25→2.34 plus NEW Sep-4 10:40 SHORT R 1.21, CQD 906) is **not** withdrawn — it is suspended. It remains the prediction of record for whichever adoption packet follows a settled origin rule. Do not re-derive it under a new origin without declaring the change.
- Opposed-side debt at the two Sep-8 bars (EA LONG at both) remains disclosed and unpaid.

**Next packet: P-ORIGIN-1, print-only, no selection change.** Scope: Sep-8 feed-tag and rule-consistency verification; origin declared per site; five-example regression sweep; memo provenance tagging with the 481/471+10 reconciliation; E49 slot restoration with the 2/2 prediction graded. Adoption does not return to council until origin is a declared parameter with a passing regression sweep behind it.

# COUNCIL VERDICT (Opus stream — P-ORIGIN-1 outcome, answers relay v11)

## Ruling basis

I have no access to the archives, journal, or the digests in §1. Everything below is adjudicated on the packet as stated; I verified nothing independently. Where a conclusion depends on an unread value, I say so.

## Ask 1 — Kill: ACCEPTED

`ORIGINREG_FINAL rows=5 fail=3` against a gate frozen pre-run in `BUILDER_FREEZE_PORIGIN1.md`. The candidate dies. Sep-8 NOT REACHED is the correct consequence, not a separate concession — both target bars printed SKIPPED in-run under `regN=5 regFail=3`, so they were never scored and cannot be read either way. E46 −7/+85 remains the closed record.

The acceptance is cheap precisely because the gate preceded the run. Any renegotiation of the gate now is gate-moving, and I will treat it as such below.

Inertness and provenance are noted as reported: 481 invocations with units stated, 118 non-invoking HITs all at S3ARM and genID-traceable, S5 structurally memo-free, twelfth join zero-mismatch. Nothing in §3 gives me a reason to distrust §2's grading.

## Ask 2 — R5: the retain demand stands, and it stands on the standing rule

`filedResid 0` at R5 is a **price-only** residual. The standing identity rule in §1 is `slot+barTime+px+imbCode`. The diagnostic landed s5/16:15; the retained identity is s7/16:05. Those are different swings whose prices happen to sit 1 point apart. Under the frozen identity definition that is not a hit, so it reopens nothing.

Two things it does do, and both should be filed:

1. **Weak-evidence caution.** With HAND stops clustering inside ~40 points, an exact price coincidence at 1-point resolution is not rare enough to carry weight on its own. This is the reason identity was defined as a 4-tuple in the first place; R5 is a live demonstration of why.
2. **A defect note against the incumbent, not the candidate.** Retained R5 is 1.16238; filed is 1.16239. The currently-reproducing identity is itself 1 point off the human record at R5. That means "retain the reproducing identity" and "be faithful to HAND" are not the same demand everywhere. That is an open item on the baseline. It does not resurrect the his-entry candidate, which fails 3/5 on the retain target and is unmeasured on the filed target for R1–R4.

The one unknown that would change this reading: whether the HAND record carries barTime or slot for filed stops, or price alone. If it independently carries barTime/slot and those corroborate s5/16:15, R5 stops being a coincidence and becomes a real finding. That is checkable from existing archives.

## Ask 3 — Declared direction

I rule against per-trade rule treatment outright. Five rules for five trades is a lookup table. It reproduces by construction, forecasts nothing, and is unfalsifiable. It would convert an undeclared free parameter into five declared ones, which is worse than the HALT.

I also read the failure shapes as forbidding the "adjust the count" family, for a reason visible in your own table. Entry-to-retained-origin distance: R1 210 min / s42, R2 65 / s13, R3 25 / s5, R4 35 / s7, R5 35 / s7. R4 (+5, s3 vs s7) and R5 (+1, s5 vs s7) are near-misses consistent with a tie-break or protective-test detail. R1 is not off by a swing or two, it is off by ~39 slots and 3.5 hours. No fixed n-th-swing rule spans both regimes.

Declared, in order:

**D1 — Desk measurement, no run, no build, no token.** Complete the `filedResid` column for R1–R4 from `RECON19-ORIGIN1_JOURNAL.log` plus the HAND figures, and record whether HAND filed stops carry barTime/slot at all. This decides whether the gate target should have been retained-identity or filed-record. It is a measurement against an existing archive, not a rule change, and it does not touch the frozen baseline.

**D2 — Desk measurement, same cost.** Compute entry-to-retained-origin distance in both minutes and slots across the **full** HAND set, not these five. Purpose: test whether R1's 210 min / s42 depth is a population outlier.

The constraint on D2 matters more than the measurement. If council later wants to grade a counted-swing rule on an R1-excluded subset, the exclusion criterion must be derivable from HAND and retained data alone, established before any diagnostic is consulted. Excluding R1 because it failed is the gate-move this discipline exists to prevent. Excluding it because it is a structural outlier in the retained population is legitimate — but only if D2 shows that, and only if the criterion is written down first.

**D3 — Contingent.** If D1 and D2 support it, issue a new proposition with its own pre-declared gate over the qualifying subset. If they do not, adopt the finding: "second swing" as documented does not generalize, origin remains an undeclared free parameter, verdict #8 HALT stands unchanged, Sep-8 remains unreachable by any declared rule.

Nothing builds on my account. D1 and D2 are reads of material you already hold.

# COUNCIL VERDICT (Opus stream — v12 relay, D1 + D2)

# Council Response — Opus, v12 relay (D1 + D2)

**Verdict: Option 2. Adopt the finding and close the origin investigation.** I issue no exclusion criterion and no new proposition. Verdict-#8 HALT stands unchanged.

Reasoning below, then what I bank, then the conditions under which this could ever reopen.

---

## 1. The decisive reason: the D2 axis cannot separate the failures

This is arithmetic on the numbers you filed, and it settles the question before any judgment call about post-hoc criteria.

| Trade | Minutes/bars | Filed residual | Gate |
|---|---|---|---|
| R1 | 215 / 43 | −27 | fail |
| R2 | 70 / 14 | 0 | pass |
| R3 | 30 / 6 | 0 | pass |
| R4 | **40 / 8** | **+5** | **fail** |
| R5 | **40 / 8** | 0 (vs filed) | pass |

R4 and R5 are **identical on depth**. Same 40 minutes, same 8 bars. One fails, one passes. No threshold, band, or monotone function of entry-to-retained depth can exclude R4 while retaining R5, because depth does not distinguish them at all.

So the strongest available exclusion — R1 as a genuine outlier at 43 bars, 3× the next-deepest — buys you a qualifying subset of R2–R5, and the gate **still fails at R4**. To rescue the proposition you would need a criterion that is explicitly R4-shaped: built on some axis not yet measured, chosen because it removes the one trade that breaks the result. That is not a criterion, it is a description of R4.

And Sep-8 lands in the same trap. Both placements (30/6 and 40/8) sit inside the cluster that contains one pass and one fail. A depth criterion leaves Sep-8 in the ambiguous bucket, so it does not even restore reachability, which was the point of the exercise.

D2 was the right question to ask. It returned a clean negative. Credit for asking it in a form that could return one.

## 2. The firewall is already breached

You framed criterion-writing as council's alone, before any diagnostic is consulted. Good instinct, but the sequencing has already failed: this packet delivers D1's per-trade residuals and D2's depth ranking together. I now know which trades fail and by how much. Any criterion I write is written with that knowledge, and its blindness cannot be restored by declaring it blind.

This matters independently of §1. Even if depth *had* separated the failures, a criterion issued from this position would be selected on the outcome, and a gate passed under it would carry no evidential weight. I will not launder a post-hoc carve through a pre-declaration ritual.

## 3. Power, even in the best case

Best case after any exclusion is a 3–4 trade subset. Against the weak-evidence caution you already logged — a 1-point coincidence inside a ~40-point cluster is noise — a gate over three or four price matches cannot distinguish a rule from luck. There is no configuration of the existing five trades that produces an informative test.

## 4. The one piece of strengthened evidence is comparison-dependent

R5 is the best case for the proposition: exact match plus barTime promotion past price-only. But per your own §4 defect note, retained R5 is 1.16238 and HAND is 1.16239. So R5 reads 0 against filed and **+1 against retained**. The cleanest observation in the set changes value depending on which record you compare to. That is not a reason to discard it, but it is a decisive reason not to found a rule on it.

Your instinct to file this as a defect rather than fold it into the origin argument was correct.

## 5. What I bank as durable

Three results survive the closure and should be recorded as standing, not as origin artifacts:

**HAND carriage is structurally insufficient for the standing identity.** Px always, barTime sometimes, slot never, imbCode occasionally as prose. The standing identity is slot+barTime+px+imbCode. HAND never carries slot. Therefore **no gate keyed to the full identity 4-tuple can ever be scored against the HAND record.** This is the most valuable thing D1 produced, and it is a permanent precondition on future work, not a finding about second swings. Any future proposition must either declare a gate over the components HAND actually carries, or bring a record that carries slot.

**The kill is robust to retain-vs-filed.** A filed-based gate fails at R1 and R4 exactly as the retained-based gate did. The kill does not depend on the retain decision, which removes the last plausible route to reopening via that door. This is a real robustness result and worth the desk time it cost.

**Origin remains an undeclared free parameter.** Adopted as stated. Second swing as documented does not generalize; Sep-8 is unreachable by any declared rule.

## 6. What I permit

Nothing that builds, runs, or spends a token. Specifically:

- **Permitted:** annotate the baseline record with the R5 1.16238 / 1.16239 discrepancy as an open bookkeeping item. Annotation only.
- **Not permitted:** altering the frozen artifact, EA `6ACDF3B8…`, FlowLogic `3606BFB4…`, or anything that changes a digest. The digests are the instrument. A bookkeeping fix that moves a digest costs more than the defect it repairs. If the discrepancy is ever reconciled in the artifact, it is a new baseline with a new digest and a fresh identification, not a correction to this one.
- **Unchanged:** Rev075 stays local, no push. Diagnostic `97FCED1D…` stays uncommitted. Run-B delta stays suspended and untouched.

## 7. Conditions for any future reopening

I am not sealing the origin question permanently, but I am putting a real gate on it rather than a procedural one. To reopen, all four:

1. **An independent justification** for the origin rule, derived from mechanism rather than from these five trades. Not a criterion that fits the residuals.
2. **A scoreable held-out set that exists before the rule is written.** Sep-8 is not it — unmapped bars, no retained slot. This almost certainly means acquiring new data first, Dukascopy per standing rule. This is the binding constraint: today there is no dataset on which a rescued rule could be honestly scored.
3. **A gate declared over components HAND actually carries** (see §5), with the slot gap acknowledged rather than assumed away.
4. **Pre-declaration in a packet that does not also carry per-trade residuals.** Whoever writes the criterion must not have the answer sheet.

Absent all four, origin stays closed.

---

## Standing constraints

My per-trade ban remains in force. Astra-2's no-build constraint remains in force and I do not lift it, unilaterally or by implication. Both stand until jointly lifted. Nothing builds until a packet issues, and on my vote no packet issues from D3.

One caveat on my own position: I am reasoning from the relayed figures, not from the underlying series. If any depth number in §3 of your relay is misfiled — in particular if R4 and R5 are not in fact identical at 40/8 — say so, because that tie is what carries my §1 argument. My conclusion would survive on §2 through §4 alone, but the reasoning would change shape and you are entitled to know which plank is load-bearing.

D1 and D2 were executed within both verdicts and returned answers rather than ambiguity. That is the outcome a desk finding is supposed to produce, including when the answer is no.

# COUNCIL VERDICT (Opus stream — v13 goal-plan, planning with amendments)

## Position

Clear, with amendments. Path A and Path B both ride the one run, but Path A as written is a single-guess coin flip and I would not spend the hour on it in that form. The amendment converts it into a variant matrix plus two free riders, so the run is decisive whether it passes or fails.

## Ask 1 — Which path

**Both, one run, A amended.** The amendment matters more than the choice.

Path A as written implements one reading of "second fractal extremity outward, no walk" and gates it 5/5. If it lands 5/5, good. If it lands 4/5, you have spent the hour and learned nothing about *why* — and the most likely near-miss is R5, where his filed 1.16239 @16:15 sits one point and two bars from the code's 1.16238 @16:05 (F2). That is a definitional disagreement, not noise, and a pass/fail gate cannot name it.

His words fix the *object* (fractal swings, chart triangle markers) and the *count* (exactly two). They do not fix five things the implementation must decide:

1. **Fractal definition** — resolved, not a variant: replicate the platform's Fractals indicator verbatim, including its equal-high/inside-bar handling. "Chart triangle markers" means literally what his terminal draws. Do not write your own N-bar fractal.
2. **Start offset** — does enumeration begin at the entry bar itself or the first bar strictly prior?
3. **Counting discipline** — raw sequence of fractals walking back, or monotone-outward only (each counted swing more extreme than the last)? This is the highest-value dimension. R1 is the tell: the code's machinery landed 09:45 while his stop is 06:30, 27 bars further out. A nearer fractal that is *not higher* than a closer one would be skipped under monotone-outward and counted under raw. That single bit may explain the R1 miss.
4. **Confirmation** — does a fractal that needs future bars to confirm count as present at entry time?
5. **Timeframe of the fractal series** — signal TF is the privileged base case; R1's 43-bar depth makes a higher TF a live alternative hypothesis worth computing in the same pass.

Cross product of 2–5 is small, costs nothing extra at run time, and every dimension traces to a real ambiguity in his words rather than a tuned number. Print, per variant, the (barTime, price) produced at each of R1–R5 and at S1/S2. One run either finds a variant that reproduces him exactly, or proves no variant in the declared space does. Both outcomes are decisive.

**Path B: yes, unchanged.** Free, and F6 already establishes presence as the harder Sep-8 problem.

**Path C rider (my addition, also free):** §1 says same side, same entry bar, same stop, same target. Only stop is under examination. F6 says the EA reads LONG at both Sep-8 bars against his SHORT, and every R-gate decision depends on a target rule nobody has validated. For the seven examples, print the code's side, entry bar, and target alongside his. If the target rule diverges, a perfect stop rule still produces wrong R and wrong selection, and you would find that out an hour from now instead of three hours from now.

## Ask 2 — Is 5/5 on barTime+price acceptable for a selection packet

Yes, with three conditions.

Slot is structurally unobtainable from HAND (F8), so it cannot be gated — that is a property of the evidence, not a weakening of the gate. But **print slot for every match** so slot behavior is observable and reconcilable later.

Second: **exact match on price, no tolerance.** A tolerance window wide enough to absorb R5 is wide enough to pass a wrong variant. Handle R5 by having the matrix cover the definitional choice that distinguishes 16:15/1.16239 from 16:05/1.16238. If no variant hits R5 exactly, file 4/5 plus the delta and return — do not absorb it.

Third: his filed values are authoritative on both components. Where the code's retained level differs, the code is the thing under test.

## Ask 3 — Must Sep-8 presence come first

No. A stop function can be **force-evaluated at any bar**, with no signal row and no candidate set. That decouples stop validation from presence entirely, and it turns Sep-8 from a blocker into free out-of-sample evidence: evaluate the winning variant at his S1 and S2 entry bars and check the stop prices 1.16258 and 1.16274. Those two were never used to select the variant, so they are the only honest check on whether the matrix found his rule or fitted his five examples.

Selection validates on R1–R5. Sep-8 presence is the named remainder — and it should be named as **blocking for the goal, not for this packet**. Two of seven trades are invisible to the EA and its side reads opposite at both bars. That is a larger gap than stops, and the relay after this one should be about it.

## Ask 4 — Clearance and gates

**Clearance:** one print-only build+run, authorized from this stream, subject to the conditions below. Adoption switch verified off before and after. No selection change, no digest movement, no commit, no token, no push. Full window, Dukascopy.

**Pre-declared, frozen in the packet before the run, recorded verbatim in the result file:**

- **G1 — primary, pass/fail.** At least one declared variant reproduces stop barTime *and* stop price exactly for all of R1–R5.
- **G2 — out-of-sample, reported.** That variant, force-evaluated at S1 and S2 entry bars, reproduces both stop prices. Not blocking for G1; blocking for any later adoption proposal.
- **G3 — uniqueness.** If more than one variant passes G1, report all of them. No winner is declared in the result file. The disagreement between tied variants is converted into concrete bar+price yes/no questions for the operator, which is what §7 permits.
- **G4 — census, reported.** Across all 481 evaluations: rows whose stop changes versus conservative, R distribution before and after, and counted both directions across the 1.0 threshold — rows where his rule takes and the code declines, and where the code takes and his rule declines. That is the selection impact and the input to any future adoption relay.
- **G5 — presence probe, reported.** At both Sep-8 bars: candidate-set width, evaluated side, and the specific reason no row is emitted.
- **G6 — component census, reported.** Code side, entry bar, and target versus his, for all seven examples.
- **Failure gate.** If no variant passes G1, the packet is dead on arrival, no re-run is implicitly authorized, and you return with a relay. **No numeric buffer, offset, or tolerance may be introduced to force a match.** That is fitting the machinery again, which is the exact lesson of F5.

## Build constraints

The new stop function must be **isolated**: no call into the existing walk, origin, or imbalance code paths, not even for candidate enumeration. His rule contains no walk (§2). If the packet borrows walk machinery to find fractals, F5 repeats and the result is uninterpretable.

Shadow rows only, both sides, every evaluation, with the old branch still live and printing alongside.

## One free move before the run

If you want to collapse the variant space at zero cost, a single concrete question fits §7: *"Aug-28 short, entry 10:05 — was the first swing above your entry at 09:45, and the second at 06:30? Yes/no."* That answer alone likely resolves the raw-versus-monotone dimension. Ask it in parallel; do not gate the run on it.

# COUNCIL VERDICT (Opus stream — v14 SEL1 packet, clearance with conditions)

## Position

I'm clearing packet P-SEL-1 as one stream, with conditions on Asks 1 and 3. Scope of what my clearance covers: the packet text as written. I have no access to the repo, so I cannot independently verify the CQD digest (`BE6FD84F…A421F`), the RECON17 baseline, or the 481-evaluation window count. Those remain operator-attested, and my clearance rests on them being accurate.

One arithmetic finding below changes what you should expect from E56, so read that before the asks.

---

## Finding: R2 will report "take" on every branch

From the frozen table, R2's raw R at the hypothetical stop:

- risk = 1.16299 − 1.16265 = 0.00034
- reward = 1.16265 − 1.16224 = 0.00041
- R = 1.206

That clears `R >= 1.0` unrounded. So the R-threshold does **not** explain the must-decline. Since E51 is forbidden from calling qualification paths, and the operator ruling attributes the decline to CQD-invalidity, every branch that produces a computable stop at R2 will take it.

Per E56's own wording, that's an adoption-blocking finding for that branch — meaning **adoption is blocked by construction in this packet**, on all branches, regardless of G1's outcome. That's not a defect; it's the correct outcome of a print-only run that deliberately excludes the qualification path. But pre-register it now so the R2 row reads as expected-and-explained rather than as a fidelity failure. It also settles Ask 2's second half: a CQD packet is required before adoption is even discussable.

For completeness, the other R values from the frozen table: R1 2.43, R3 1.66, R4 1.76, R5 2.59 (2.48 on the retained stop), S1 1.94. All clear the threshold. R5's two candidate stops give the same take/decline result, so the 16:15/16:05 ambiguity affects G1 exactness only, not R accounting.

---

## Ask 1 — reshape to 4/4: **approved**

R2's stop is conditional testimony ("if that was the entry, yes") attached to a setup the operator ruled invalid. Letting it sit in a pass/fail gate means a hypothetical decides a binary. Moving it to G2 as blocking-for-adoption-only is the right placement.

The cost is discriminating power: 4 examples against 8 eligible variants (16 minus the confirmation-including half, pre-declared ineligible). Two conditions:

- Print the eligible-variant count alongside the example count in the result file, so coincidental multi-pass is visible on its face rather than inferred.
- For R5, print match status against **both** 16:15/1.16239 (authoritative) and 16:05/1.16238 (code-under-test) for every variant. Only the filed value counts for G1 — but 2 bars and 1 pip apart is exactly where variants split, and the council should see the split rather than have it collapsed by the frozen choice.

G3 stays as written.

## Ask 2 — CQD scoping: **approved, read-only**

Desk-check of frozen CQD at R2's bar plus in-run CQD-state print at the seven bars is a genuine free rider. One hard condition: the CQD state is **printed and never consumed** — no decision path, no candidate filter, no exclusion point in P-SEL-1 may read it. Otherwise E51's isolation claim is void.

Separate repo-CQD fix packet: yes, needed, and **sequenced after** P-SEL-1, not concurrent. The repo CQD is the provenance anchor for the frozen reference table and the digest comparison. Touching it before the run lands destroys the ability to say the run and the table came from the same machine state.

## Ask 3 — H1 + eval-close: **amend, then accept**

Two amendments, one substantive.

**Substantive — start-offset needs three settings, not two.** R1 is logged as signal 10:00 / entry 10:05. "Entry bar itself" is therefore ambiguous: signal bar or fill bar? As written, the builder picks one silently and the matrix never shows the other. Split it:

1. signal bar inclusive
2. fill bar inclusive
3. first strictly prior to signal

That's 24 variants, 12 eligible. Worth the cost — this is a real fork in the interpretation space, not a synonym.

**H1 — define the barTime projection rule or mark it diagnostic-only.** The frozen stop barTimes are 06:30, 15:30, 08:40, 16:15. None are H1 boundaries. H1-sourced fractals will emit hour-aligned barTimes and fail G1 on barTime exactness trivially, burning matrix slots without informing anything. Either specify that an H1 fractal reports the M5 bar containing its extreme, or keep H1 printed as diagnostic and excluded from G1. Builder's call which; it must be one of the two.

**Eval-close convention — accept as proposed.** Decision at signal-bar close makes the signal bar confirmed and available, so counting it is causally legal. Require the convention be printed per variant so availability labels stay auditable.

**One reporting-convention addition:** S2's R is uncomputable because the target was never stated. Give that its own label — `TARGET_UNSTATED` — distinct from `INVALID_GEOMETRY`. A data gap and a geometry defect should not share a bucket. The S2 TP gap stays a gap either way.

## Ask 4 — clearance: **CLEARED by name**

I clear packet **P-SEL-1 (E51–E56)** for ONE print-only build and full-window run on the gates as frozen in §4, subject to:

- Ask 1's two print conditions
- Ask 2's read-only constraint and post-sequencing
- Ask 3's three-setting start-offset, the H1 decision, and `TARGET_UNSTATED`
- The R2 expectation pre-registered above, recorded in the result file before the run

Unchanged and affirmed: adoption off, no selection change, no digest move, no tuning, no rerun on failure. Isolation gate failure or absent G5 traces means the run is not evidence.

The second stream still has to name it. If Astra-4 halts or amends, this clearance does not carry.

---

A note on the domain, stated once: this is stop-placement replication logic, not a judgment about whether the underlying rule is sound to trade. Position sizing and live-capital decisions sit outside what I'm reviewing here.

# COUNCIL VERDICT (Opus stream — v15 rerun, conditional clearance + smoke option)

## Verdict

Ask 1 — CLEARED, with conditions.
Ask 2 — CLEARED for one run, with pre-flight conditions, and a cheaper sequencing option the operator should see before spending the hour.

Reviewing the relay as written; I have no on-disk access, so nothing below is verified against the artifacts.

## Ask 1 conditions

The defect diagnosis is internally coherent. A missing vararg makes each specifier consume the next argument, so labels shift left, the true `site` is never emitted, and the rightmost field has no source. That matches "site/slMode/halt lost, others recoverable by unshift" and matches "in-memory arrays correct." Passing `site` as the third arg is the right fix, not trimming a specifier, since you want the field.

1. Post-fix, assert specifier count equals arg count on that call (9/9). State the number in the result file.
2. Same-class audit before compile: check every `StringFormat`/`PrintFormat` in the build for specifier/arg parity and report the count checked and the count mismatched. Fix only `SEL52CTX` under this clearance; report siblings, do not touch them. A static check costs minutes and stops a sibling defect from eating a later run.
3. Source diff pre-compile is the control, as you scoped it. Do not carry the build-1 `44D0923B…` relationship into the binary — MQL5 output embeds build metadata and is not expected to be reproducible. Record build-2's own hash as fresh provenance.

## Ask 2 conditions

The run failure is unattributed, so a rerun under identical conditions has an unquantified chance of returning the same nothing. Cheap capture, all outside the EA and outside the cleared binary:

- Preserve the per-agent tester logs, not just the terminal journal. Agent-side death detail lands in the agent's own log directory under the terminal's Tester folder, and that is the one place the journal does not mirror.
- Pull OS-level records around the failure window. A process that dies at 01:26 after a 62-minute stall usually leaves an application or kernel-power entry.
- Check host state before starting: sleep/hibernate policy, scheduled AV scan windows, update reboot windows, free disk, free memory. A 62-minute freeze with a healthy terminal and a dead agent reads more like a host event than an EA event.
- Pin to a single local agent for this run to remove farm-distribution as a variable.

On "EA hang excluded by construction": loop-free straight-line hooks exclude an EA infinite loop. They do not exclude EA-driven resource exhaustion. With CTX at 497 rows and SLIMB at ~398, exhaustion is implausible — but say that rather than "excluded," so the next reader inherits the right confidence level.

## Sequencing the operator should see

E55 is already 5/5. Everything still owed — G1/G2/G4, G5, the isolation join — is an end-of-run or Sep-8 artifact, and the reason all of it is UNEVALUABLE is that end-of-run never executed. That means the binding unknown is not the full range, it is whether this pipeline can reach end-of-run at all.

A short-range smoke run of build-2 tests exactly that, proves the CTX print is correct, and emits a matrix, for a fraction of the hour. If it reaches end-of-run, the full run is a better bet. If it dies the same way, you have the infrastructure relay without spending the hour.

That is a scope change against "same ini/range," so it is not covered by this clearance and it is the operator's call. If he declines it, the single full rerun stands as cleared and as asked.

## Two items for the council independent of the asks

CQD-state EMPTY at all five S5 rows is the heavier finding here, and the relay undersells it. EMPTY is not the same as no-divergence. If the frozen CQD is unpopulated at S5, the R2 result cannot be read as agreement with his chart-CQD — it reads as "no state to compare." Any gate that grades CQD divergence is vacuous under EMPTY, which makes it a design question: should EMPTY be a hard FAIL rather than a strict pass-through? Worth settling before a rerun grades that gate.

Second, the wrapper. DONE=UNDETERMINED reaching a handoff at all is the defect that nearly turned a blocked run into a reported success, and you caught it manually. Make the success predicate explicit: no `Test passed` plus no end-of-run matrix equals BLOCKED, emitted as BLOCKED. Wrapper-side, no EA exposure, and it removes the need for a human to catch this again.

## Next relay

Specifier parity number, sibling-audit count, source diff, build-2 hash, agent-log and OS-log capture for whatever the run does. If it stalls identically, the infrastructure relay is the correct return and this council will not read it as a third-run request.

# COUNCIL VERDICT (Opus stream - v16 result, P-SEL-1 dead + forensic read)

# COUNCIL RULING — Opus stream, v16 relay (RECON20b-SEL1 / P-SEL-1)

Receipt: v15 clearance executed as cleared (build-2 one-line CTX fix, one rerun, same ini/range). Graded object is P-SEL-1 (v14 dual-key). I am grading the relay text; `BUILDER_RESULT_RECON20b-SEL1.md` governs. If the file contradicts any numbered point below, that point is void and returns to council.

## Ask 1 — GRANT. Close P-SEL-1. The G1 FAIL stands as a machinery verdict.

Four things carry it, in order of weight:

**Isolation held.** The pre-registered anti-artefact guard is the RECON17 join, and it passed clean: SLIMB/WALKOB/WALKFR 481/481 ×3, SLIMBR 10/10, zero mismatch, signals 4/4 identical, census/ticks/bars identical, adoption off. The candidate census the selector reads is bit-identical to the pre-fix reference. That places the divergence downstream of enumeration, inside selection — machinery, not feed and not harness.

**No cell was undefined.** `status=OK` throughout, zero unavailable/ambiguous/invalid labels. The code did not fail to answer; it answered differently. A data or harness artefact almost always surfaces as missing or degenerate cells, and there are none.

**The misses are structured, not noisy.** R4 is off by exactly 10 pts and 20 min on all 24 variants. R5-filed is `g1m=0` everywhere with `retm=1` everywhere. Deterministic, variant-invariant offsets are the signature of a rule divergence, not of nondeterminism, tick handling, or run corruption.

**The report is arithmetically self-consistent.** CTX 599 = 432+157+10 = 481+118; SEL52 14376 = 24×599; SEL53 168 = 24×7; journal bounds [7043..40979] = 33937 lines; V005/V013/V021 at stride 8 is the correct signature of start-offset as slowest-varying index in a 3×8 space. Internal consistency at this density is evidence against a reporting artefact.

**On the missing base-backup.** The disclosure is real but non-load-bearing *for a FAIL*. An unverified edit is a threat to a false PASS, not a false FAIL — and the specific route by which it could manufacture a FAIL (corrupting the candidate census) is closed by the RECON17 parity above. The selection divergence is independent of the CTX fix. Accepted as disclosed; race stays owned.

**One finding the relay does not draw, and council should.** Per §1 the retained/filed split on R5 was on the frozen reference list at registration: filed 1.16239@16:15 authoritative, retained 1.16238@16:05 explicitly "code-under-test, NOT a target." If that divergence was already on record when P-SEL-1 was registered at v14, then G1 4/4 was arithmetically unreachable before a single variant was enumerated — the packet was not falsifiable in the PASS direction, and operator assent for a full rerun was spent confirming a known-impossible gate. I cannot verify registration order from this relay, so I raise it conditionally. If it holds, it is a packet-design defect, not a builder defect, and it warrants a standing rule: **no gate may include a reference the code-under-test is already on record as not producing, unless the packet is explicitly re-scoped as diagnostic rather than pass/fail.**

This does not disturb the FAIL. It does bound what the FAIL teaches: the run is low-information about R1/R3 and high-information about R4/R5.

## Ask 2 — Direction: no new run-bearing packet. One zero-run forensic read.

The selection line should not close here, but it should not spend a run either. The discriminator between the two live hypotheses is already on disk in `RECON20b-SEL1_JOURNAL.log` (SHA `06556C…`), and answering it costs no build, no run, no token.

**R4 — one binary question.** Is 1.16098@08:40 present in the code's fractal/limb census (the 481 SLIMB rows)?
- Present but unselected → counting/ordinal defect. The two-swing walk lands one seat off at this geometry.
- Absent → fractal-recognition defect. The code never saw the 08:40 triangle, and "two swings away" then resolves to the next one out at 08:20.

Those are different defects with different fixes and different blast radii. Nothing in the current record distinguishes them, and the R4 miss is the load-bearing one by the builder's own read.

**R5 — same question.** Is 16:15 in the census alongside 16:05? Both present with the code preferring 16:05 → retention/tie-break divergence at 1 pt and 10 min apart, i.e. adjacent near-flat fractals resolved opposite to HAND. That is a bookkeeping rule, cheap to state and cheap to test later.

**Elevate S1 out of the REPORTED tier.** S1 code 1.16359@09:05 vs HAND 1.16258 is a **101-pt** divergence — an order of magnitude larger than R4's 10 pts. It is currently filed under G2 as a decline-on-R and is therefore at risk of being banked as benign because the decline outcome happened to match. Before that read stands, builder should state one thing: **does the S-side stop computation traverse the same selection path as the R-side, or a separate/unexercised short path?** G5 reports the EA as LONG-opposed with his SHORTs absent, which makes S1 possibly notional. If it is the same path, 101 pts is a stronger sample of the same defect than R4 and belongs in the forensic read. If it is an unexercised path, discount it and say so on the record.

**Two design findings to bank for future variant spaces:**
- **Start-offset is empirically inert.** O1≡O2 is shown, and prior tracks with them — V005/V013/V021 return identical results. The 24-cell space has 8 effective cells, 4 eligible. Future packets should not spend budget on that axis absent new reason.
- **H1-projected is dominated on this sample.** It never adds a pass and it costs R3. H1 standing should be recorded as "no demonstrated value on this evidence" rather than carried as a live open question.

**Non-evidential, flag it as such:** R2's `decl=1` is achieved by construction — adoption is blocked, and M5 would otherwise take on R 1.281. The relay is disciplined about saying so; I am reinforcing it so no downstream packet cites R2 as machinery evidence. It is a harness fact, not a geometry fact.

## Ask 3 — GRANT. Nothing commits.

RECON17 stays frozen. Build-2 stays uncommitted. No snapshot token sought or given. Records ride the next authorized snapshot.

One preservation condition attached, because Ask 2 depends on it: **build-2 (`766BADDC…`, 469237 B) and the journal (`06556C…`) are now evidentiary and must be retained, not discarded.** Uncommitted is not the same as deletable. If either is lost, the forensic read becomes impossible and the machinery verdict in Ask 1 becomes unre-examinable.

Separately, and independent of this packet: the missing edit-session base-backup should be closed as a process defect. A rule that any edit session preserves its pre-edit artefact until the run it feeds is graded and closed is nearly free and prevents exactly this gap from recurring at a moment when it might be load-bearing for a PASS.

## Standing

Dual-key: this ruling clears nothing on its own. No build, run, commit, or push until Astra concurs. If Astra halts, the halt governs.

Summary of my position: **P-SEL-1 dead and closed on a machinery verdict; no rerun, no tuning, no commit; one zero-run forensic read of the archived journal on R4 / R5 / S1 to determine whether any further packet is warranted; two axis findings and one gate-design rule banked.**

# COUNCIL VERDICT (Opus stream - v17 P-SEL-2 clearance, conditional A1-A5)

## Verdict

**CLEAR packet P-SEL-2 (E57–E59) by name** — one print-only build, one full-window run, same ini/range — **conditional on the five amendments in Ask 1 being folded in before the build.** Not halting. Boundary in Ask 3 confirmed as stated, with one addition.

Scope note on my own read: I have no repo access in this exchange, so this is a review of the packet **as written** plus the closed P-SEL-1 record you quoted. I have not re-read `BUILDER_FINDING_SEL1_FORENSIC.md`, the `SrjSelVariant` loop at 2958–3001, or `SrjSelSnapTF`. Anything below that depends on their internals is stated as a requirement on the instrument, not as a finding about the code.

---

## Ask 1 — Scope: accepted with five amendments

The core targeting is right. R4 list-vs-walk is the one open boundary the forensic explicitly could not close; R5 is narrowed to tie-break; S1 belongs in the sample now that the shared selection path is established; R1/R3 as agreeing controls is the correct way to prove the instrument renders a walk faithfully. Amendments are all pre-build, because a single paid run gives no second chance.

### A1 (blocking) — E58 must be event-driven, not counter-driven

§3 says the traces will show "every scanned event with counted/skipped outcome and the existing reason counters." The phrase **"walk lands 08:20 with zero skip witness"** is the exact signature of a skip path that increments no counter. If E58 is built on the existing counters, it inherits the same blind spot at higher cost and will print "absent from list" where the truth is "silently dropped."

Requirement: emit one trace line per event **unconditionally at the top of the loop body, before any branch or filter**. Counters stay, as secondary corroboration only. Then the diagnosis is a set difference between the E57 list and the E58 trace, and it is decidable rather than inferred.

This also means the binary framing in §3 ("absent-from-list vs stepped-past") is too narrow. E57 already carries confirmed-at-decision and extremity flags, so the outcome vocabulary must be three-way:

- **absent** — no 08:40 event in the shadow's pre-walk list
- **present-but-filtered-pre-walk** — in the list, disqualified by flag before ranking
- **present-and-stepped-past** — reached the walk, ordinal step named

Collapsing the middle case into either edge points at a different fix later.

### A2 — Extend E58 to all 7 bars (add R2 and S2)

Add **R2**: the eventual ordinal or tie-break change applies to every bar, and R2's frozen expectation is a *negative* assertion (MUST-DECLINE). Without a baseline trace you cannot state whether a fix keeps the decline for the right reason (R < 1.0 on a correctly selected stop) or preserves it by a compensating error. That is the case most likely to flip unnoticed.

Add **S2**, stop-side only. TARGET_UNSTATED kills the R computation and the ranking, but S2 still has a *stated stop* (1.16274), and stop selection is the entire subject of this packet. Report target and R as UNSTATED; the gap stays a gap. Since S1 was just established to run the same `SrjSelVariant` path, this takes the S-side from one sample to two.

Cost is two more bars of trace on a run the operator is already paying for, and it removes the most likely reason to need a second print-only run.

### A3 — Truncation must be distinguishable from absence

The packet's epistemics rest on counts of zero (384 mentions, 0 defined at 08:40). With 7 bars × 12 variants × per-TF per-event lines, log truncation is a live risk, and a dropped line reads identically to an event that was never scanned.

Require a per-`(bar, TF, variant)` line-count assertion plus an explicit end-of-trace sentinel. Missing sentinel is a REPORTED GAP under §4, not a silent zero.

### A4 — Latch the flags, do not recompute them

`confirmed-at-decision` and `extremity` must be captured at the decision instant and printed from the latch. If either is re-derived at print time from a later bar state, the flag is a repaint and the whole confirmation column is worthless. Standard fractal look-ahead trap; cheap to get right, invisible if wrong.

### A5 — R5 compare operands at full stored precision

1.16238 vs 1.16239 is one point. Print both raw operands at stored precision and the normalization/epsilon in force **at the moment of the compare**. If any path normalizes to 4 digits, those two collapse to equal and "tie-break" is really encounter order — a different diagnosis with a different fix than a filter. The existing equality-skip counter tells you a skip fired; it does not tell you the operands were equal by rounding.

### One scope question

§3 fixes E57 at M5 + H1. Is that the **union of TFs consulted by all 12 eligible variants**? R4's 08:20 and 08:40 are both M5-grain, so M5+H1 looks sufficient for that bar, but if any eligible variant reads another grain (M15/M30), D1's asserted counts certify completeness over a set that has a hole exactly where a variant looks. Confirm the TF set is derived from the variant table rather than assumed.

---

## Ask 2 — Clearance

**Cleared** for ONE print-only build + ONE full-window run, same ini/range, adoption off, with A1–A5 in place. Adoption remains off; no selection, rank, or threshold moves; HAND values appear only in frozen expectations for labeling.

Add to **D3**: assert **zero order-send attempts** over the run. Print-only should be evidenced by the artifact, not only by build intent — particularly if the diagnostic shares a path with the live EA.

The ~1 hour of operator time is his call. My clearance is technical only and does not presume it; the packet correctly flags it rather than assuming it.

---

## Ask 3 — Boundary confirmed, plus one pre-registration

Confirmed, without qualification:

- P-SEL-2 moves no selection, no rank, no threshold.
- Any rule change — ordinal fix, tie-break, or otherwise — requires a **later frozen packet + fresh dual-key + operator auth**.
- **Nothing commits** on this packet. Records ride the next authorized snapshot, build stays uncommitted, RECON17 stays frozen.

Addition: **pre-register the freeze order for the successor packet.** Once E58 shows why 16:05 outranks 16:15, there will be an obvious one-line change available. Reading it here is not a license to apply it. The later packet must state its **predicted effect on all 7 bars — including R1/R3 (currently agreeing) and R2 (MUST-DECLINE) — before any fix is run.** Fixing R4 and R5 while silently breaking a passing bar or flipping the decline is the specific failure mode this whole structure exists to prevent.

That requirement is also the second reason for A2: a frozen 7-bar prediction is not constructible without 7-bar baseline traces, and P-SEL-2 is the run that can produce them at no extra risk.

---

## What would make me halt on the next packet

Any of: adoption toggled on, a selection or threshold edit bundled with prints, HAND values entering a computation path rather than an expectation label, or a rerun triggered by a missing print instead of being reported as a gap.

# COUNCIL VERDICT (Opus stream - v18 rerun clearance, same-build + 90min)

# RULING v18 — RECON21-SEL2 rerun clearance

**Stream:** Opus (v18). **Ruling-ID:** OPUS-v18-RECON21-SEL2.
**Basis:** measurements as reported in `06_HANDOFFS\BUILDER_RESULT_RECON21-SEL2.md` and this relay's §1–§2. I have not independently verified the journal, hash, or counts; the file governs, and this ruling is void on any material correction to it.

**Not halting.** All three asks cleared, with one amendment on Ask 2 and three conditions.

## Ask 1 — CLEARED BY NAME

Rerun the SAME build `150A6159…`, same ini/range, adoption off. **No rebuild.**

Rationale:
- The failure is harness-side truncation, not EA behavior. The zero counts on SEL57/SEL58T/SEL58CMP/SEL58END/SEL53 are the expected signature of a run that never reached end-of-run, and they also discharge the instrument-cost question: gating held, zero live prints, so the instrument cannot be the pace cause.
- Rebuilding identical source produces no new information. It would only churn artifact provenance and cost a re-verification cycle. The static grades (0/0 EA+Flow, parity 196/196, OrderSend-src 0, adoption off) are unaffected by a timeout and carry forward unchanged.
- D3 is UNEVALUABLE only because isolation needs the full 481. A completed run is the only thing that can move it. That is a sufficient reason to spend the wall time once.

Observation for the rerun, so it is not misread as a defect: **SLIMB 425/481 against walks 424/481 is an expected off-by-one at truncation** — one walk entered, not closed. If the rerun completes, both should land 481/481. If they land 481/480, that is a real finding, not truncation noise.

## Ask 2 — AMENDED: RAISE the ceiling to **90 minutes**

I do not clear keeping 60. Holding a 60-min ceiling against a measured ~68–70 min requirement is a coin flip that risks spending another full hour to produce a second D1 GAP / D2 GAP / D3 UNEVALUABLE. That is the worst trade on the table: identical cost to the successful path, zero graded evidence.

Named value and its derivation from §2, not from preference:
- RECON20b total/mark ratio = 55:23 / 47:52 ≈ 1.157.
- Applied to RECON21's 59:55 at the mark → **≈ 69 min** projected completion. Consistent with the relay's 68–70.
- RECON21 ran ≈ 25% slower than RECON20b to the mark. With the cause unknown, two samples cannot bound the tail, so the ceiling must absorb at least one more excursion of that size: 69 × 1.25 ≈ 87 min.
- **90 min** tolerates ~30% further degradation beyond the slowest pace yet observed.

The reasoning behind the number matters more than the number: a ceiling is a runaway guard, not a pace target. 60 was set below the actual requirement, which is why it fired on a healthy run. It should sit high enough that firing means *something is wrong*.

Stated cost and tradeoff, explicitly for the operator: worst-case exposure rises 60 → 90 min. Expected completion stays ~70. The full 90 is billed only when the run is genuinely stuck — and raising the ceiling does weaken hang detection by that margin. Heartbeats were continuous and the agent stayed alive throughout RECON21, so a heartbeat-gap condition is the better hang guard than a wall-clock ceiling. That is wrapper-only and in scope, but I am **not** making it a condition of this clearance — flagging it as optional follow-on so this rerun is not blocked on harness work.

Scope of the change: wrapper only. No EA, indicator, or Include file moves.

## Ask 3 — CONFIRMED

Nothing commits on the rerun. Build stays uncommitted, records ride the next authorized snapshot, RECON17 stays frozen, P-SEL-1 stays DEAD. D1/D2 gap-not-rerun and D3 evidence-validity stand unchanged as the grading basis. Graded object remains P-SEL-2 (D1–D3).

One hazard to name, since it is not in the asks: **the rerun must not write to `RECON21-SEL2_JOURNAL.log`.** If it inherits that path, the timeout evidence (16992 lines, SHA `8C0D0FB8…`, bounds [40980..57971]) is destroyed by the thing meant to supersede it. Use a distinct run name.

## Conditions

1. Byte-verify the artifact before launch — size 474883 B and hash prefix `150A6159…`. Cheap, and it is what makes "same build" a measurement rather than an assumption.
2. Distinct journal path for the rerun; RECON21-SEL2 artifacts preserved read-only.
3. Ceiling set to exactly 90 min, wrapper only, and the new value recorded in the result file alongside the observed wall time.

## Halt condition for the next iteration

If the rerun times out at 90 min, **do not clear a third attempt under these conditions.** Two unexplained pace excursions is already the edge of what a rerun can be justified on; a third would establish that the environmental-variance model is wrong, and the correct next move is cause investigation on the host or harness, not more wall time. Report and halt.

# COUNCIL VERDICT (Opus stream - v20 fundamentals + FP-LIMBSEAT-1 issued)

# Ruling Opus-v20 — Council seat (Opus stream)

**Receipt:** v20 received and treated as the single live relay. v19 acknowledged as SUPERSEDED before verdict; no ruling issued on it. Its filed evidence (`BUILDER_RESULT_RECON21b-SEL2`, `BUILDER_FINDING_SEL1_FORENSIC`) is read as standing. v18 dual clearance, v16 joint close (P-SEL-1 DEAD), and RECON17 freeze are carried forward unchanged.

---

## Ask 1 — ACCEPTED

**P-SEL-2 DELIVERED.** The §3 diagnostic record is accepted as closed on the evidence as filed:

- R4 absence is established on the searched space (M5-1072 + H1-156, trace 09:10→08:20, 197 scanned) — this is an *enumeration* finding, not a selection finding.
- R5 is established as a side-drop at i=897 with the surviving chain exact to 8 digits (dPts −2.00, no rounding artifact). Exactness of the wrong answer is what makes this diagnostic rather than noisy.
- S1 is established as ordinal, not level: 09:40 is in-list, seated #1 against his #2.
- Isolation (481×3 + 10/10 vs frozen RECON17) and the R1/R3 controls walking correctly on the same instrument are what let the class statement stand.

**Withdrawal of the pre-registered one-line-swap expectation for R5 is accepted and recorded as correct practice.** A pre-registration that dies on evidence is worth more than one that survives by reinterpretation. Nothing in this packet reintroduces it.

Status carried: P-SEL-1 DEAD, RECON17 FROZEN, class statement adopted (R4/R5 = HAND limb outside fractal-candidate space; S1 = ordinal off-by-one-near).

---

## Ask 2 — ISSUED: `FP-LIMBSEAT-1` (FROZEN)

Frozen by name. This text is the packet; any edit requires a new ID (`FP-LIMBSEAT-2`) and a fresh dual clearance. Builder builds only what is named here.

### F1 (limbs) — enumerator `limbs_v2`. Scope: **FIX + MANDATORY PRINT**

Three switches, independently toggleable and independently attributable. Each targets a named rejection mode. No switch introduces a fitted numeric.

| ID | Change | Rejection mode it addresses | Primary target |
|---|---|---|---|
| **L1** | Side-independence: evaluate `is_pivot_high(i)` and `is_pivot_low(i)` as separate predicates; one bar may emit both. | side-drop (rawL EMPTY when the upper fires) | R5 / 16:15 low |
| **L2** | Non-strict extremes with exact-tie shelf collapse: comparisons become `>=`/`<=`; bars sharing an extreme at **exact equality only** (`eps = 0`, no tolerance parameter) collapse to one limb, representative = the bar nearest the decision. | equal-extreme / shelf rejection | R4 / 08:40 |
| **L3** | Displacement confirmation: a pivot confirms when the right window completes (legacy path, unchanged) **OR** the next leg displaces — body close beyond the pivot bar's opposite extreme with imbalance present, using **the imbalance test the STOP rule already requires**. No second definition, no new threshold. | unconfirmed-right on an impulsive reversal | R4 / 08:40; supplies the forming limb F2 needs |

**Hard constraints.**
- **No timeframe widening.** 08:40 must be admitted on M5/H1 or not at all. Adding a TF to make it appear is fitting.
- **Anti-fitting clause:** no switch ships on a HAND-value match alone. Each shipped switch must carry one independent structural justification stated in the print. L1 has it (side-drop is a defect regardless of R5). L2 and L3 must earn it.
- **Fail-route, not force-fit:** if L1–L3 all fail to admit 08:40 on the searched space, F1 does **not** get extended. R4 routes to **his blank (b)** (08:40 formation detail at 09:15) as an open question. Builder invents nothing.

**Mandatory print (per bar, all 7):** candidate list with `bar_id`, `side(s) emitted`, and `admitted_by ∈ {legacy, L1, L2, L3}`. Attribution is the deliverable; a passing level with unattributed admission is a FAIL.

### F2 (seat) — count anchor. Scope: **PRINT-FIRST, FIX PRE-SPECIFIED**

Two candidate seat rules. Both stated without his blank (a) value.

- **S-A (origin-limb seat):** ordinal 1 = the limb the setup itself consumed (MR: the swept limb; TF: the limb carrying the named POI tier line). "ONE away" = the next limb beyond origin; "TWO away" = one beyond that. Under S-A, 09:40 seats #2 iff an origin limb sits between it and the decision.
- **S-B (forming-limb seat):** the anchor is unchanged, but the in-progress limb at the decision bar becomes countable under **L3**, taking #1 and pushing 09:40 to #2.

**S-B is a consequence of F1, not an independent change.** Discriminator print, no fit: under `limbs_v2`, list every limb between the S1 decision bar and 09:40 with its `admitted_by`. If exactly one appears via L3 → S-B holds, ship no separate seat change. If none appears → S-A is the live rule and its origin-limb definition ships. If more than one appears → HALT and relay; that is a new class, not a tuning problem.

**Blank (a) handling:** the seat rule ships stated in structural terms and does **not** name his first swing. If neither S-A nor S-B resolves, blank (a) routes to him unfilled. No builder-supplied first swing under any outcome.

**Regression flag, highest in the packet:** R1's filed anchor is 09:55→06:30 and S1's seat lives in the same session. Any seat change must re-walk R1 with the full ordinal print, not just a level check. If R1's level survives but its ordinal path changed, that is reported as a partial regression, not a pass.

### F3 (generation) — side severed from signal. Scope: **PRINT-THEN-FIX, both halves pre-specified**

**Why LONG is carried.** The council does not have the provenance and will not guess it. Two named candidates: **(i)** the row generator inherits the `direction` field off the legacy signal object (consistent with "the four still fire unchanged" — they fire, and their polarity is being reused); **(ii)** a sidecar-era pipeline default supplies side upstream of the meters. One provenance print settles it: at the two Sep-8 morning bars, emit the ordered write-chain for the side field (`producer → value`), plus each meter's raw read. That print is a required deliverable of the packet, not a design gap.

**Replacement (ships regardless of which provenance the print names):**

1. **Row-local side resolver is the sole side authority.** TF row: side = sign of the bias read over **the row's own declared HTF set** — the row carries its `htf_set` from his journal (Sep-8 morning: 1H + 15m). MR row: side = the most recent sweep only. No cross-row read, no aggregate, no majority.
2. **4H is readable, never gating.** It prints as context with a `non_blocking` stamp. Any code path where 4H can change an outcome is a defect.
3. **Legacy four keep firing, unchanged, as presence/trigger evidence only.** Their `direction` is retained as `legacy_dir` **label** and is barred from the side path. Assert: fire log byte-identical to pre-fix.
4. **Polarity agreement gate.** His divergence code must agree with resolver side (long ∈ {1,3}, short ∈ {2,4}); X = no trade. Disagreement declines with reason `POLARITY_MISMATCH` and prints both operands. Never coerced, never silently resolved — that coercion is the bug class we are closing.
5. **His-read override sits above code as veto and promoter-of-record only** (Sep-4 morning decline is the filed precedent), keyed by row ID, sourced from his record, empty by default.
6. **INDEPENDENCE assert:** alignment of bias and sweep produces no size, weight, or confidence multiplier anywhere. Alert-only, so any such field is itself the finding.

### F4 (wick rule) — single-resolver residency. Scope: **FIX + INVARIANT TEST**

The rule lives **inside the stop resolver, as a post-selection adjustment on the ONE-away branch, at a single exit.** It fires only when all four predicates hold:

1. Base level came from the **1-away + imbalance** branch (the rule's own scope text).
2. A named POI block exists on the row (PLACE tier line non-empty).
3. The block is **uninvalidated** at decision time — no bar close beyond its far edge between formation and decision.
4. A wick extreme lies beyond `max(1-away level, block far edge)` in the stop direction, formed inside the formation→decision interval.

Then `stop := most extreme qualifying wick`, stamped `stop_source = WICK_EXT`.

**Containment mechanics (the "nowhere else" half):**
- Every resolver return carries a mandatory `stop_source` enum. A return without one fails the build.
- One writer: an invariant test asserts no module outside the resolver writes the stop field.
- **Scoped-exception registry:** pure-two-swings-no-imbalance is a row-ID-keyed entry in `SCOPED_EXCEPTIONS`, not a general branch. An assertion fires if any row not in the registry reaches it. This is how "scoped to ONE trade only" becomes enforceable rather than remembered.

---

## Successor predictions — all 7 bars, stated BEFORE any run

| Bar | Predicted state | Mechanism | Fail condition |
|---|---|---|---|
| **R1** | NO CHANGE — 1.16508@06:30, anchor 09:55→06:30 intact | control | any level move, **or** same level via a changed ordinal path (partial regression) |
| **R2** | DECLINES, and declines **for the filed reason** (no XOB and no POI) | PLACE gate, upstream of side | declines on a different reason string, or F3's resolver manufactures a side |
| **R3** | NO CHANGE — 1.15847@15:30 | control | any level move |
| **R4** | 08:40 enters the candidate list on M5/H1; stop matches HAND label 1.16098@08:40 | L2 or L3, attributed | admitted only by TF widening, or unattributed, or absent → **route to blank (b)** |
| **R5** | rawL populates at i=897; chain 16:30→16:15; stop 1.16239@16:15; prior 1.16238@16:05 demotes to 2-back; expected delta +2.00 pts | L1 | 16:15 still side-dropped, or the 16:30-first anchor shifts |
| **S1** | 09:40 reseats to #2, 09:05 to #3; 2-away selection lands 09:40 = 1.16258 | F2 (S-A or S-B per discriminator) | discriminator returns >1 forming limb → **HALT**; or reseat achieved by anchor invention |
| **S2** | INTENDED CHANGE — side flips to SHORT at the Sep-8 morning bars on 1H+15m bear, 4H bull printed non-blocking; four legacy signals fire unchanged. **Stop/target print-only:** S2's filed level is not named in this relay, so no pass/fail is asserted on it | F3 | side stays LONG; any legacy fire-log drift; or a level is asserted against an unfiled expectation |

**Global anti-fitting guard (build-time, blocking):** the filed HAND constants (1.16508, 1.15847, 1.16098, 1.16239, 1.16238, 1.16258) must appear in **no file outside the expectations/labels fixture**, and that fixture must be test-import-only. A grep gate enforces it. HAND values are labels for comparison, never operands.

---

## Ask 3 — CONFIRMED

Nothing builds, runs, or commits until `FP-LIMBSEAT-1` is dual-cleared **BY NAME** by both streams, with operator authorization where run cost attaches. Records ride the next authorized snapshot; builds stay uncommitted. Either stream may halt instead of clearing — including on this packet.

**What I would reject on:** a level that matches with `admitted_by` blank; a seat change that resolves S1 while silently altering R1's ordinal path; any HAND value reaching an operand; R4 force-fit by TF widening rather than routed to blank (b); or a second design cycle smuggled in as "clarification" of a frozen item.

**Next expected relay:** dual clearance or halt on `FP-LIMBSEAT-1` by name. If cleared, the first authorized run is the print set only (F2 discriminator + F3 provenance), before any of F1's switches ship.

*Scope note: this packet governs faithful reproduction of his documented decisions in an alert-only tool. It makes no claim about the strategy's edge or profitability, and none of the above should be read as trading advice.*
