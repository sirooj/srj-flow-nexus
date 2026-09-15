# PACKET `STAGE-C-SIDE-1P-FIX-SPLIT` — Stage-C frozen landing authorship

## BUILDER FILING HEADER (not packet text — record only, no authority)

- Status: AUTHORED-UNBUILT. Council authorship landed (Luna v71 packet + Sonnet v71 analysis); NO clearance, NO token, NO word, NO build, NO run, NO commit.
- Source verdicts: `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md` (Luna v71, filed via filer) + `06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md` (Sonnet v71 review, keyless).
- Source binds: EA `88700710…` 565059 B (pre-build re-hash required) + FlowLogic `3606BFB4` frozen.
- Carried Sonnet refinements (fold into clearance, confirm-or-correct): B_BODY-only live-gating semantics (non-B_BODY false = pass); E-number reverify vs `88700710`; split/abstain partition pin-down vs RECON32 result.
- Next: clearance relay (fresh dual-key + tokens + fresh run word). Nothing builds/runs/commits on this file.

## FROZEN PACKET TEXT VERBATIM (Luna v71 authorship — begins below, ends at end of file)

---

The Stage-C packet below freezes the live boundary at the existing seed write and resolver ownership points, while keeping diagnostic shadow code and all unrelated gate terms out of the landing. The cited source confirms the current seed direction write, the B_BODY/A_OPP/A2/C_TOUCH ordering, the buffer mapping/shift, and the existing resolver pass-through surface.   

# STAGE-C FROZEN LANDING PACKET

**Packet ID:** `STAGE-C-SIDE-1P-FIX-SPLIT`
**Status:** AUTHORITATIVE DESIGN TEXT ONLY — NO CLEARANCE, TOKEN, WORD, BUILD, RUN, COMMIT
**Stage order:** C → D → E
**Stage-C claim:** ownership/validity only; NOT 4-exact + 2-present by itself

## 1. Objective and hard boundary

Stage-C lands exactly two already-converged changes:

1. **Track-1:** the seed-path confirmation gate is a **B_BODY-only live suppression criterion** for the S1/void-class decision.
2. **Track-2:** live seed-side ownership uses the **FlowLogic 4H/1H buffer vote at the exact seed bar**; on 4H/1H conflict it **ABSTAINS and leaves legacy direction unchanged**.

Nothing else becomes live in Stage-C.

`A_OPP`, `A2_CLOSE_BREAK`, and `C_TOUCH` remain diagnostic/non-enforcing. The Stage-C resolver does not create a new suppression path. There are no Stage-C changes to stop, latch, order, fixture, eligibility, price constants, FlowLogic implementation, or downstream fire logic.

The existing confirmation function orders its checks as A_OPP, A2_CLOSE_BREAK, B_BODY, C_TOUCH, and the existing B_BODY branch is the terminal rejection at that stage. 

## 2. Source bind and E-numbered surface

**Primary file:** `Experts\SRJ_FlowNexus_EA.mq5`

**Required source bind:** current Stage-C candidate must be the re-verified tree identified by the packet issuer as EA `88700710…`, 565059 B, with the companion/current digest recorded before clearance. The builder must re-hash before mutation.

**Mechanical source anchors:**

### E-C01 — Confirmation gate / S1 boundary

**Region:** `IsConfirmationCandle(...)`, current source location corresponding to the known gate region around EA 2075–2116.

The source gate obtains prior/current candle OHLC, reads the POI line, evaluates opponent candle, close-side, body direction, and touch. The B_BODY rejection is the specific Stage-C live gate; A_OPP, A2, and C_TOUCH are not promoted. 

**Required Stage-C behavior:**

* B_BODY failure continues to yield the existing void/reject result.
* A_OPP remains observable but non-enforcing under Stage-C ownership.
* A2_CLOSE_BREAK remains observable but non-enforcing.
* C_TOUCH remains observable but non-enforcing.
* The existing N1/tally counters remain semantically unchanged.
* No new gate branch may be added to any of these three non-B_BODY terms.

### E-C02 — Seed ownership write

**Region:** seed path corresponding to EA 7505–7549; existing owned-direction assignment at the current equivalent of EA 7531.

The current surface detects the POI retest, assigns the anchor, routes the seed direction, and then promotes state to S1. 

**Required Stage-C live ownership:**

* The single live `g_dir` writer at the seed path is the Track-2 owned writer.
* Its input is the candidate/legacy `legDir`.
* The live resolver may return the 4H/1H vote only where the packet-defined agreement condition is satisfied.
* On 4H/1H conflict, the resolver returns **legacy `legDir` unchanged**.
* No second live `g_dir` writer may be introduced.

**Single-writer invariant:** after Stage-C there remains exactly one live seed-path `g_dir` assignment at this ownership point. Any additional `g_dir` writer is a parity failure.

### E-C03 — FlowLogic read semantics

**Region:** current equivalents of:

* `FLOW_SHIFT_OFFSET`
* `FL_BUF_HTF_HIGH`
* `FL_BUF_HTF_MID`
* `FL_BUF_HTF_LOW`
* `ReadFlow(...)`
* `S2Leg(...)`

The known implementation maps the HTF buffers to 19/20/21, applies `FLOW_SHIFT_OFFSET = 1`, and converts buffer values through `S2Leg`. 

**Required Stage-C semantics:**

* 4H = `FL_BUF_HTF_HIGH`
* 1H = `FL_BUF_HTF_MID`
* 15m = `FL_BUF_HTF_LOW`, diagnostic only
* evaluation is at the exact seed bar through the existing `ReadFlow` shift path
* no FlowLogic source edit
* no alternate panel/object source
* no 15m substitution for the 4H/1H owner vote

### E-C04 — Diagnostic vote block

**Region:** current equivalents of EA 7503 and 7551–7593, containing `SIDE1F_VOTE` / `SIDE1F_SHORT`.

The existing block is explicitly print-only, restores the N1 counters after its gate call, and states that it performs no live-state/resolver/latch/order/stop/fixture/eligibility write. 

**Stage-C treatment:**

* retain as shadow/diagnostic only unless a line is mechanically repurposed into the declared live owner path;
* do not create a second resolver;
* do not promote `SIDE1F_VOTE` or `SIDE1F_SHORT` prints into enforcement;
* retain seed-bar exactness;
* preserve N1 restore behavior.

### E-C05 — Resolver replacement point

**Region:** current equivalent of `S2ResolveLive(...)`, historically EA 3839–3847.

The existing implementation is a legacy pass-through that returns `legDir` and increments live-call/agreement counters. 

**Stage-C replacement contract:**

`S2ResolveLive(legDir)` becomes the **single Track-2 live ownership function**.

Its behavior is:

```text
read exact-seed 4H and 1H buffer legs
IF both are nonzero AND equal:
    return that common 4H/1H direction
ELSE:
    return legacy legDir unchanged
```

15m may be printed for evidence but is not part of this decision formula.

The function must not suppress, abort, latch, send, stop, or alter eligibility. It only determines the carried live direction.

### E-C06 — Fire surface prohibition

**Region:** current equivalent of the sole `LogSignal`/`A6Fired` fire site, historically EA 9394–9396.

The known surface has one fire site and a read-only `SIDE1F_WATCH`. 

**Stage-C rule:**

* no edit to `LogSignal(...)`;
* no edit to `A6Fired(...)`;
* no second fire path;
* no Stage-C conditional inserted at the fire site;
* `SIDE1F_WATCH` remains observational.

## 3. AdoptOn boundary

The build must make the boundary mechanically auditable.

**GO LIVE:**

* E-C02 seed-side owned `g_dir` routing;
* E-C05 Track-2 resolver semantics;
* E-C01 B_BODY-only S1/void suppression as the Stage-C live validity boundary.

**STAY SHADOW / DIAGNOSTIC:**

* `A_OPP`;
* `A2_CLOSE_BREAK`;
* `C_TOUCH`;
* `SIDE1F_VOTE`;
* `SIDE1F_SHORT`;
* 15m vote/dissent;
* any census/tally print added solely to prove parity.

**STAY UNTOUCHED:**

* FlowLogic implementation;
* downstream fire path;
* stop/latch/order/fixture/eligibility machinery;
* all unrelated gates and writers.

The stage therefore has no authority to alter the function's established A_OPP/A2/C_TOUCH ordering; those branches remain visible in the source and remain non-promoted for Stage-C. 

## 4. Carry-over regression gates

Stage-C is PASS only if every gate below is satisfied.

### G-C01 — R1 census reproduction

Reproduce the RECON32 56-seed classification census:

`B_BODY / A_OPP / A2_CLOSE_BREAK / C_TOUCH / PASS = 8 / 34 / 2 / 6 / 6`

No category may acquire a new live enforcement role.

### G-C02 — R1 fire parity

**Threshold: zero fire/no-fire divergence** against the RECON32 reference.

Any unpredicted fire/no-fire delta is **FAIL → REPORT + HALT**. The builder may not grade such a delta as a Stage-C pass.

### G-C03 — R2 population reproduction

Reproduce the three RECON32 populations:

* agreement: **14**
* abstain: **31**
* split: **11**

### G-C04 — conflict semantics

For every Stage-C conflict row:

`4H != 1H` ⇒ Track-2 abstains ⇒ live result remains legacy `legDir`.

Required threshold:

**zero direction/output delta from the reference legacy path on conflict rows.**

### G-C05 — S1 row prediction

On the existing corpus:

* the known S1 B_BODY seed remains suppressed/void;
* A_OPP rows remain untouched by Track-2 promotion;
* A2 rows remain untouched;
* C_TOUCH rows remain untouched;
* agreement rows route according to common 4H/1H direction;
* conflict rows preserve legacy direction.

### G-C06 — Isolation

Reproduce the RECON32 isolation proof:

* 38-family isolation intact;
* payload hashes identical to the reference set where the packet declares parity;
* 4/4 signal checks retained;
* Adopt/order accounting consistent with the new Stage-C ownership boundary.

### G-C07 — N1/tally preservation

N1 and tally behavior must remain unchanged except for the explicitly declared ownership accounting.

No diagnostic call may leave persistent unintended N1 deltas. The established shadow pattern restores the six N1 counters after its diagnostic gate call; that parity requirement remains binding. 

### G-C08 — zero unintended delta

Outside the explicitly declared Stage-C ownership changes:

**threshold = zero unintended behavioral delta.**

A changed output that is not one of the pre-declared Stage-C predictions is not a discretionary interpretation; it is a failed build/run.

## 5. Build gates

Exactly **one build** is permitted.

Before build, record:

* source path;
* exact source hash;
* file length;
* expected modified/untracked set;
* FlowLogic hash;
* fixture state;
* AdoptOn setting.

The build must produce:

* compile result `0 errors / 0 warnings`;
* fresh build log;
* exact modified-file manifest;
* writer-count report;
* OrderSend-source count;
* prefix-disjoint report.

**Parity invariants:**

* one live `g_dir` writer at the declared ownership point;
* no new fire writer;
* no new OrderSend source;
* no new stop/latch/fixture/eligibility writer;
* diagnostic `SIDE1F_*` namespace remains disjoint from unrelated output;
* N1 restore pattern preserved.

Any build/parity mismatch is **REPORT + HALT**.

## 6. Run envelope

Exactly **one** Stage-C run is permitted.

**Run label:** `STAGE-C-LANDING-RECON`

**Input range:** the existing RECON32 ini/range only.

**Purpose:** regression validation of the already-authored C landing. It is **not** a proving run for D/E and it is **not** a novel-evidence run.

**Ceiling:** 90.

Required markers:

* `STATUS`
* `DONE`

Required purity checks:

* MAXLEN
* SELHALT
* output-prefix purity
* expected-record accounting.

No third run exists under this packet.

Timeout ⇒ **REPORT + HALT**.

## 7. Grading table

| Gate         | Prediction                          | PASS threshold                      |
| ------------ | ----------------------------------- | ----------------------------------- |
| R1 census    | 8/34/2/6/6                          | exact reproduction                  |
| R1 B_BODY    | S1 remains void                     | exact expected suppression          |
| A_OPP        | no new suppression                  | zero unintended delta               |
| A2           | no new enforcement                  | zero unintended delta               |
| C_TOUCH      | no new enforcement                  | zero unintended delta               |
| R2 agreement | 14                                  | exact population reproduction       |
| R2 abstain   | 31                                  | exact population reproduction       |
| R2 split     | 11                                  | exact population reproduction       |
| conflict     | leave legacy                        | zero output/direction delta         |
| isolation    | unchanged                           | 38-family / payload / signal parity |
| N1/tally     | unchanged                           | no unexplained delta                |
| adoption     | boundary-accounted                  | expected AdoptOn-only effects       |
| OrderSend    | unchanged                           | no new source                       |
| fire/no-fire | unchanged except predicted C effect | zero unpredicted divergence         |

## 8. Explicit non-goals

Stage-C does **not** claim to:

* create the missing Sep-8 10:10 SHORT candidate;
* preserve the 16:30 SHORT through confirmation/R;
* establish 4-exact + 2-present;
* prove D or E;
* create novel evidence;
* replace the Track-2 conflict-abstain rule with conflict suppression;
* promote 15m to the governing vote;
* alter the FlowLogic implementation.

Those propositions belong to **Stage D** and **Stage E** and require the separately frozen new-data proving range.

## 9. D/E and proving-range queue

The queue is CONFIRMED.

**Stage D — BIRTH:** separately authored SHORT-candidate birth mechanism for the S1 census gap, with an explicit object/bar/trigger contract and a fresh-data proof.

**Stage E — SURVIVAL:** separately authored preservation of the already born-right S2 SHORT through confirmation and the R gate, with a rule-change plus proof threshold rather than threshold-only weakening.

**Proving range:** separately selected and frozen before D/E grading. It must contain the seven required strata:

1. A_OPP first-fail carriers;
2. A2 first-fail carriers;
3. C_TOUCH first-fail carriers;
4. 4H/1H conflict bars;
5. 15m-dissent bars;
6. genuine SHORT-birth candidates;
7. genuine SHORT-survival candidates.

The D/E proving range must be **new data and/or a new evaluation span**, never a relabeled reuse of RECON32.

## 10. Halt law

Any of the following is an immediate **REPORT + HALT**:

* source hash drift;
* unexpected source edit;
* compile error or warning;
* writer-count mismatch;
* new OrderSend source;
* fire-site modification outside declared surface;
* N1/tally parity failure;
* isolation/payload failure;
* timeout;
* output-length/purity failure;
* unpredicted fire/no-fire divergence;
* unpredicted live-direction delta;
* any attempted promotion of A_OPP/A2/C_TOUCH;
* any attempted 15m governance;
* any attempt to treat a D/E result as Stage-C proof.

The builder never converts a divergence into a pass.

## 11. Authorization boundary

This document is **frozen authorship only**.

It grants **no**:

* landing clearance;
* dual-key approval;
* builder token;
* run word;
* build authorization;
* run authorization;
* commit authorization.

The next relay is the clearance relay. That relay requires the fresh dual-key approvals/tokens and fresh run word before any Stage-C landing build/run may occur.

## 12. Final Stage-C statement

**Stage-C proves one thing: the already-established Track-1 validity boundary and Track-2 seed-side ownership can be landed without unintended collateral behavior.**

It does not solve birth or survival.

**C is necessary. D and E remain queued.**

**Verdict:** the queue is confirmed, and the clearance path is correctly **authorship → fresh dual-key + tokens + fresh word → Stage-C build/run**. No authorization is issued here.
