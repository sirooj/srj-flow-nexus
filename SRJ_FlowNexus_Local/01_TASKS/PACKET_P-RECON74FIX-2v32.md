# PACKET_P-RECON74FIX-2 v32 DRAFT - V381 page-only fold; Q1 conditional/Q2 OBJECT repairs; EA code unchanged

Status: v32 DRAFT (V381 replies filed whole and graded separately: Q1 conditional CONFIRM; Q2 OBJECT / AMEND-WITH-HALT. V382 is pending. This page-only fold corrects acceptance ordering, evidence classes, unresolved cells, and stale/history labels from V381. The 5M-FLIP-KILL rule remains the operator pin. Proposed v26 3-insert/2-line EA edit set unchanged; EA base 977B0FB5/684499/12295. V382 required seats: Sonnet and GLM; Astra/Opus optional only by operator choice. No EA edit, build, run, key request, commit, or push is authorized by this page.


Canonical files: Experts\SRJ_FlowNexus_EA.mq5 ONLY (v27 proposed fence set carried byte-identical: 3 inserts + 2 modified lines, three-state encoding; indicator + FlowLogic untouched). No new inputs, buffers, or handles; one file-scope int, one set, one clear, one modified condition, one modified print (3 added lines, 2 replaced, zero deleted). Identity claim is limited to the pinned v29 EA digest 977B0FB597F880C46BEB824937669F863C4452C48A6F9FA506311F04267B414E; this packet proposes no source edit. Historical v29 status/roster wording is not a current change summary.

## Authority (his words verbatim + disk, no invention)

- V31 (V381) was behavior round 16; V32 is round 17 if transported. V379 on v29 was round 14 and V380 on v30 round 15; V25 and V378 were untransported and add no completed round. V32 is the next page-only fold. Earlier outcomes remain in the packet history. No strategy or EA code change.
- V380 tallies: Q1 Sonnet conditional CONFIRM + GLM conditional CONFIRM = conditional CONFIRM with named conditions; Q2 Sonnet OBJECT + GLM OBJECT = OBJECT / AMEND-WITH-HALT under council section 47. C1 duplicated fences and the Q2 fired-path pin gap block splice/clearance pending this fold. Vote-free GO/HOLD was not supplied; it is separate from seat tallies.
- V354 Q1(a) kill-stands SUPERSEDED by his later Rebuild word for the reseed-direction-matched path only; kill stands everywhere else. Council prose never overruled; his later word governs.
- V356 Q1 2-0 CONFIRM CLEAR (telemetry parent) + RECON77 lifecycle (60 UJPROV rows, carriage joins in the result file).
- Strategy pins (section plus verbatim core with banked-rule pointers, GATE-NEEDS-PIN satisfied):
- SEED-CARRY EXPECTATION (s5; verbatim core: seeds persist across unconfirmed bars to confirmation; expectation text rides the v26 answer cited at P037/P043: 09:55-to-10:00 carry plus 14:55-to-16:40 carry on RECON51). Authorizes restoring killed seeds to the confirmation bar; three-state encoding rides this pin as mechanism detail (v23); overnight carry authorized for trend setups by TREND-SWEEP-IRRELEVANT at P016, no day bound on record.
  - BIAS-SOURCE-INSTANCES (s8) with CHART-READS-6/5 verbatim (s7, verbatim: The 1H is bearish [Image 1] and the 15m is also bearish [Image 2] hence the valid short): direction-specific reads authorize direction terms; 8 June invalid on 5m flip. Timeframe hierarchy stays OPEN; LONG-vs-SHORT is not timeframe-hierarchy. TREND-SWEEP-IRRELEVANT (s8; verbatim core: "the sessional sweep does not matter cause this is a trend following setup. SO THE TRADE SHOULD BE TAKEN"): trend takes need no fresh sweep; authorizes the 6/4-arm carry into the 6/5 trend-short with SEED-CARRY. 5M-FLIP-KILL (his 2026-10-01 words verbatim: "it must kill the trade if the 5m structure bias has flipped"): any 5m-structure-bias flip kills the potential pre-confirmation; joins OB+FVG and in-bias-plus-OPP invalidation (CHARTER L144-145 2-of-3 rule; FVG-validity strategy s2; 9/4-invalid strategy s2; his Q4: pre-confirmation kills only, after entry he holds); structural 8-June fence (his chart: 5m bullish flip during setup).
  - NO-OVERFIT (s2; verbatim core: "i am not trying to overfit this test window by having the best result or 100 percent winrate, i want you to apply my rules as is"; full text in srj-strategy s2): invalid winners rejected. The 8-June keep is pinned here plus Rebuild plus chart-read, never on the quote's 9/8 example alone.
  - CONFIRMATION-CANONICAL (s8, verbatim: keep it either valid retest rouch or break with a candle body close, typos his): restored seeds still pass confirmation geometry; no confirm predicate changed.
  - CONFIRM-ONCE + TIMING-N/N+1 (s2, verbatim: the latest D POC retest is at 9:35 and then the confirmation candle is the 9:40 and the EA should enter at 9:45 open candle price): 09:40 bar evaluates at the 09:45 pass, entry 09:45 open. N/N+1 convention with floor semantics: every S2-edge/CONFIRMPOLL row's log floor(barPeriod) equals its bar time plus one bar; passes may land seconds into the bar.
  - BOOKING-INNOCENT (s2): booking never causes a selection miss; booking untouched.

## Settled-rules audit (RULES-COMPLETENESS output; seedBiasAl 8-occurrence census closed)

- S5.4 pre-confirmation body-break + S3.3 flip-kill: the S2 CheckLtfAlign gate at EA-8405/8407 is level admission only and does not distinguish 5m-opposite from neutral. The 5M-FLIP-KILL pin at P016 remains binding. This packet does not claim the unchanged edge edit proves the pin; Q1 remains conditional/run-graded at P094. A fired same-chain admission with flip evidence is a PIN-VIOLATION/FAIL under P123-P126; missing attribution is UNPROVEN/HOLD, never pass.
- S5 election + R-at-open 1R floor + nearest-TP booking: downstream, untouched. Disposition: carried, no fence.
 - seedBiasAl census, eight distinct source lines / nine occurrences (EA-1155 declaration; EA-7881 and EA-8201 producers; EA-8412 and EA-8413 reads; EA-8417 print; EA-10436 comment; EA-10447 SIDE1R print). The print/comment are observational, not predicate readers. LONG-leg call EA-7885 assigns S2ResolveLive result to g_dir; EA-4258 returns legDir but does not exhibit its equality to the input. Only the return statement is claimed; LONG argument identity/runtime remain unclaimed. R03/R05 exhibit SHORT runtime only.
- seedBiasAl = -1 align-failure sentinel (EA-7881) satisfies != 0 and can promote under the pre-existing v29 first arm at EA-8413; this is disclosed, unchanged, and not redefined by the new disjunct. The gated run must separately count and flag every UJPROV/S2PROMOTE chain with seedBiasAl=-1; do not silently include it in ordinary promotion counts or infer a new kill rule.
- R2 renewal (MEANREV void): untouched; unclassified seeds default-keep. Disposition: carried, no fence.
- One-take-per-session: untouched cap. Disposition: carried, no fence.
- 8-June keep + never-reseeded keep: unset kills persist. Disposition: keep, negative controls in acceptance.
- EU sibling check: no August run on this packet (structural fence). EU takes-move watch rides a future word plus key scope, never this run.

## Record-first trail (spec + restatement + findings + journal + segments + verdicts searched before council)

- Spec Part A v4.2: confirmation geometry in his later words (s7/s8); S5 election + R floor conformant, unchanged.
- Findings: RECON77 result (behavior-neutral PASS + lifecycle PROVEN) + V354/V356/V358/V360/V361/V362 dissent dispositions + RECON76 result (B1/B2/B3 mechanisms).
- Segments: RECON77-V29-UJ (AABDBD53/6172800/32086; rows below) + RECON74-V11-UJ (v26 T2 reference, foreign-build rows for H-TAKE only).
 - Verdict history: V374 Q1 is 2 CONFIRM / 1 OBJECT; Q2 is 1 CONFIRM / 2 OBJECT. V376 Q1 is 2 CONFIRM / 1 OBJECT; Q2 is 0 CONFIRM / 3 OBJECT. V377 Q1 is 1 CONFIRM / 2 OBJECT; Q2 is 0 CONFIRM / 3 OBJECT. The V374/V376 Q1 tallies in the older page were reversed and are corrected here against filed grade files. V379 and V380 were separately graded Q1 conditional CONFIRM / Q2 OBJECT; V381 is filed and graded below. V378 was not transported, zero markers.
- Journal: no new rows rule these venues (register B1-3 stand).

## Death chains (reference behavior, all on-segment RECON77 unless noted; rows R01-R28 carried in the relay (spliced once by match): R01-R24 carried scheme + R25-R28 8/6 KILL rows)

- B1 chain (5 June London USDJPY SHORT, his frame: retest 09:35 bar, confirmation 09:40 bar, entry 09:45 open 159.948 R2.00 TP 12:15): 09:05 KILL (R01, stale 6/4 SHORT value per R02) + 09:15 reseed (R03, SHORT; same-pass edge g_dir agrees per R05; R01 is the cross-pass 09:05 event) + kills 09:15/09:30/09:35 (R04/R06/R08) with values (R05/R07/R09) + CONFIRMPOLL 09:35 confirm=0 shadow poll (R10, not live-path evidence) + 09:40-bar absent run-wide (dead seed). R03 al=0/ok=1 means unaligned-or-neutral, never flip-proven. Same-pass tie-break uses journal line number within the pass; the code emits UJPROV before KILL, and R-list order is not log order. v26 reference is foreign-build hypothesis only. R03 interim LONG holder breaks nothing under SETUP-DEFINED; the SHORT chain continues on the observed qualifying path.
 - 8-June keep (invalid SHORT, never a take): kills 09:25/17:30/17:35/17:45/18:00 (R11 + R25-R28) with unset values (R12-R16), all persist in the cited base rows. No LTFFLIP/FRESHCOUNT emitter or value-bearing attribution is exhibited in the supplied regions. Therefore the 8-June attribution venue is UNRESOLVED/HOLD-terminal and cannot clear on this packet; no flip-versus-neutral result is inferred. Any fired admission with same-chain pre-confirmation flip evidence is PIN-VIOLATION/FAIL.
- Direction keeps (scoping proof): 6/5 16:00 LONG kill on SHORT value (R17/R18) persists withdrawn, unset-keep fired; 6/11 14:45 SHORT kill on LONG value (R22/R23, 10:35 reseed LONG per R21) persists withdrawn, unset-keep fired; 6/9 09:50 SHORT kill unset (R19/R20) persists; 6/10 15:45/17:10 LONG and 6/12 10:55/18:10 LONG kills on SHORT values persist (fallback proof bars).
- 6/4 11:20 SHORT kill FLIPS (reseed 6/4 10:20 SHORT precedes, direction-matched). 6/9 split disjoined: 09:50 unset-keep vs 7 nonzero flips (10:20/10:30/15:35/15:55/16:10/16:15/17:30).
- B3 CONFIRMPOLL 14:35 (R24, SHORT confirm=0 shadow poll stamped 14:40:22 pass-time, not live-path evidence).

## Edit set (exact anchors; STAGE-1 censuses each; 3 inserts + 2 modified lines; duplicate page copies removed; convention: NET per site = new minus old)

- FIX DIR-DECL (file-scope home, after the CARRY decl EA-303; siting: single insert after EA-303, indent 0, no other line touched):
```mql5-old-DIR-DECL
datetime g_ujOpReseedBarTime = 0;
```
```mql5-new-DIR-DECL
datetime g_ujOpReseedBarTime = 0;
int      g_ujOpReseedDir = 0;
```
- FIX DIR-SET (H1 post-overwrite, after the CARRY set EA-7899; siting: single insert after EA-7899, sibling indent 17sp; SET-order proof: H1 overwrite EA-7885 precedes SET in the same branch (R-H1HEAD), reseed print EA-7879 shows the same t78 event direction with edge g_dir agreeing same pass per R03/R05; S1C block EA-7902-7909 may rewrite g_dir post-SET in the same pass - on agreement the term matches, on opposing-direction disagreement it fails closed to kill (safe); same-direction wrong-anchor promotion possible (identity-blindness per P096, disclosed); never a wrong-direction promotion from this path; t78_dir re-stamp declined 2-1 with quoted reasons: same-pass agreement exhibited, fail-closed proven, transform-safety argued, print audit in place): record the reseed direction. Three-state stored-nonzero makes wrong-direction promotion structural (v23).
```mql5-old-DIR-SET
                 g_ujOpReseedBarTime = barTime;
```
```mql5-new-DIR-SET
                 g_ujOpReseedBarTime = barTime;
                 g_ujOpReseedDir = (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0));
```
- FIX DIR-CLEAR (admission consumes provenance, after the CARRY clear EA-10727; siting: single insert after EA-10727, sibling indent 6sp): mirror the reset.
```mql5-old-DIR-CLEAR
      g_ujOpReseedBarTime = 0;
```
```mql5-new-DIR-CLEAR
      g_ujOpReseedBarTime = 0;
      g_ujOpReseedDir = 0;
```
- FIX EXEMPT-TERM (S2 edge, B2 condition EA-8413; one if-condition line at 9 spaces, machine-verified equal to current EA-8413; between UJPROV print EA-8412 and PROMOTE block EA-8414): m15-conditioned exemption; m15 match is eligible for kill or promotion, non-match remains S2WAIT. Stored provenance is three-state, and promotion requires nonzero stored direction matching g_dir. The level gate does not prove the 5m-flip pin; P123-P126 supply the same-chain failure rule.
```mql5-old-EXEMPT-TERM
         if(uj_m15r && uj_m15b == uj_wantb && s1g_seedBiasAl != 0)
```
```mql5-new-EXEMPT-TERM
         if(uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0)))))
```
 - FIX PRINT-DIR (S2 edge print EA-8412; proposed append reseedDir and exempt flag): exempt=1 names the complete promotion condition, not the arm. P115(1) separately isolates the new disjunct with seedBiasAl=0. No print/code alteration beyond the shown proposal is included.
```mql5-old-PRINT-DIR
         if(InpDebugLog) PrintFormat("[SRJ-EA] UJPROV bar=%s dir=%s reseedBar=%s seedBiasAl=%d - reseed provenance at S2 edge (Fix CARRY)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), TimeToString(g_ujOpReseedBarTime, TIME_DATE|TIME_MINUTES), s1g_seedBiasAl);
```
```mql5-new-PRINT-DIR
         if(InpDebugLog) PrintFormat("[SRJ-EA] UJPROV bar=%s dir=%s reseedBar=%s seedBiasAl=%d reseedDir=%d exempt=%d - reseed provenance at S2 edge (Fix CARRY)", TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), DirName(g_dir), TimeToString(g_ujOpReseedBarTime, TIME_DATE|TIME_MINUTES), s1g_seedBiasAl, g_ujOpReseedDir, ((uj_m15r && uj_m15b == uj_wantb && (s1g_seedBiasAl != 0 || (g_ujOpReseedBarTime != 0 && g_ujOpReseedDir != 0 && g_ujOpReseedDir == (g_dir == DIR_LONG ? 1 : (g_dir == DIR_SHORT ? -1 : 0))))) ? 1 : 0));
```
- Scope: reseedDir declaration/SET/CLEAR remain the v29 proposed sites; g_dir and its writers are carried unchanged. The print flag equals the complete promotion predicate, not an arm discriminator. P115(1) uses seedBiasAl=0 to isolate the new disjunct. The 9-space TERM/PRINT lines are machine-verified against the old 9-space source lines; the 10-space duplicate copies are removed. SHORT runtime is exhibited; LONG runtime and S2ResolveLive argument identity are not claimed. No edge guard is included.
 - Census after proposed edit (post-build lines): reseedDir initialization/write sites EA-304/7901/10730; CARRY reseedBar initialization/write sites EA-303/7900/10729. seedBiasAl occurs 9 times on 8 lines: six reads (print format arg and exempt ternary at EA-8414; TERM EA-8415; promotion print EA-8419; comment EA-10438; SIDE1R EA-10449), declaration EA-1155 and producers EA-7882/EA-8203. EA-8414 carries two occurrences. These are proposed-tree census claims, not runtime evidence. The listed sites are disk-census-backed; only EA lines physically carried in relay regions are page-exhibited, and unshown sites prove no runtime behavior.

## Interaction (carried gates met on paper, fire behavior named, not just sites)

- LTF_MISALIGN and freshness aborts downstream remain cited, not exhibited as universal proof. A fired admission with same-chain pre-confirmation flip evidence is a non-clearing PIN-VIOLATION/FAIL; absent evidence is UNPROVEN/HOLD, not a pass. Q1 remains conditional until run-grade evidence addresses P024.
- One-take-per-session cap (s5 pin): at most one take per session whatever promotes. No global direction lock broken.
- Same-direction stale churn stays exempt (identity-blindness limit, all seats concur): stated openly with the 09:05 class as its exhibit.
- 6/11 10:35 flip (LONG on LONG) vs 14:45 keep (SHORT on LONG value): tie-order proof decides same-pass pairs; both binding below.

## Scope-disclaimer (sibling cases this guard cannot see, pinned outright)

- B2 detector gap: untouched path, separate entry-gated packet, never this kill fold.
- B3 margins: untouched predicates; exemption restores paths, not terms.
- E2 touch-or-break predicate: parked with cause (needs EU sibling check + council ruling; one behavior per round).
- Identity-scoped provenance (per-holder stamp, uj_memo_dir candidate with write-site census owed): parked with cause (bigger fence incl. death-path clears, own round).
- Session-boundary CARRY clear: declined with cause (no pin + extra write site).
- Enum-typed provenance (GLM-B1 alternative): parked quoted (same sites, same NET; int form demanded by two seats).
- uj_exempt local (Sonnet zero-code option adopted as battery text-identity assert; code option declined: +1 NET for drift-guard the battery already covers).
- EU takes: no August run on this packet; EU move-watch rides a future word plus key scope.

## Acceptance (FIX-2v26 validation on a future UJ 6/1-6/13 run; proposed code edit set unchanged from v26; branch-complete PATH_CLASS with non-clearing unresolved states; 16 prior transported rounds through V381, excluding untransported V25/V378; v32 folds V381; no new EA code delta)

 - PATH_CLASS and dispatcher (binding, one order): first reject UNEXPECTED_TAKE; then freeze exactly one H_STATUS under P114; select the WW/FW/WF/FF branch; determine expected-edge presence. Existing edge with missing required evidence is UNRESOLVED/HOLD, never NA; absent-by-design edge is NA/HOLD-terminal. On a present edge, fired admission plus same-chain pre-confirmation flip evidence is PIN-VIOLATION/FAIL before parity. CAUSE_ADVANCE requires a same-chain S2PROMOTE, PREBIND, or ADMIT row at/after the promotion anchor; UJRESEED/UJPROV are supporting evidence only when followed by one of those advancement rows before chain break. A UJPROV at a bar whose same-chain S2SEEDBIAS_KILL follows is provenance-only and cannot be cause. A session-cap block is cause only with an explicit same-chain cap row and the next expected edge materializes. No other row qualifies by label alone. If the next expected same-chain edge materializes as confirmation/PREBIND/admission, classify EXPECTED_ADVANCE (neutral, clearing-compatible). If the expected edge is absent with a positive same-chain cause, classify DIVERGED (non-clearing). If absent with a pin-compliant abort explanation, classify PIN-KILL-EXPLAINED/HOLD; if absent without either, UNRESOLVED/HOLD unless a separately stated binding failure is proven. For other present-edge cases, classify WITHDRAWN_TERM, FIRED, or UNRESOLVED. PATH_CLASS contains no duplicate H_STATUS and never recomputes admission status.
 - Axes: M grades row mechanics; T grades take, hypothesis, no-false-take and parity predicates. Both axes must be PASS to clear. No PASS-B1-unproven exception exists on this page. NA, UNRESOLVED, PIN-KILL-EXPLAINED, or DIVERGED are non-clearing. Forecasts are never passes. P137-P141 remain unresolved forecasts; 8-June attribution is HOLD-terminal on current exhibits. The fired-path pin check applies to baseline and hypothesis takes before parity.
 - H_STATUS (the sole admission/withdrawal status field): exactly one of FIRED / WITHDRAWN_NEGATIVE / WITHDRAWN_NO_EVAL / WITHDRAWN_FLIP_KILL / BLOCKED_NO_ADMISSION. Freeze at the admission bar when admission exists; otherwise at the first bar fixing the withdrawal/block class. PARITY_OUTCOME is independent: NONE / LATE_TP_INTERFERENCE. The dispatcher is UNEXPECTED_TAKE precheck, H_STATUS, branch selection, edge-presence, PATH_CLASS, axes, then parity/allowed-set. No later evidence rewrites H_STATUS.
 - P-CARRY assertions for a future run: M(1) is SHORT UJPROV with reseedDir=-1, seedBiasAl=0, exempt=1, nonzero reseedBar, followed on the same chain by S2PROMOTE_M15; expected evaluated bar is 09:40, pass floor 09:45. M(2) is the LONG twin on 6/11 16:05 and/or 16:25 for every present edge: reseedDir=1, seedBiasAl=0, exempt=1, nonzero reseedBar, then same-chain S2PROMOTE_M15. If both edges exist, both are required; if neither is exhibited, remain UNRESOLVED. T(1) requires live-path shadow=false CONFIRMPOLL for bar 09:40 (pass floor 09:45); only shadow=true examples are currently exhibited, so no present proof. T(2) requires PREBIND bar 09:40 at pass 09:45. SHORT=-1, LONG=1, unset=0.
 - Edge-presence table rule: NA-if-absent-by-branch-design, HOLD-terminal; if the edge is present, grade it from the required row evidence, with missing evidence UNRESOLVED/HOLD (never convert a present cell to NA). Apply this rule to P154-P157 and P159-P161. P158/P162 are Km in WW/FW and Ku in WF/FF only when the 17:45 arm is blocked and those edges are present. The branch table is a forecast until the future run establishes branch and edge membership.
 - P-KILLOUT census: retire aggregate 9-first-flip/13-continuation and 21 counts for gating. For each candidate bar, record membership (FIRST-FLIP / CONTINUATION / OUTSIDE / UNKNOWN) separately from its expected edge grade; assign every bar exactly once, with explicit producer/evidence rows per class. 6/11 10:35 remains UNKNOWN membership. Any unassigned, duplicate, or UNKNOWN membership blocks M as UNRESOLVED/HOLD; a bar-level F grade does not resolve census membership.
 - P-PROMOTE-FIRST: candidate membership is established only from the future run row series and chain breaks (date, direction change, or intervening opposite-direction S2 edge); the prior-build R rows are context and cannot determine the proposed run branch. 6/11 10:35 is UNKNOWN membership until that run resolves it. P115(1), not census membership, tests the new disjunct. Forecast class is owned by P117/P119.
 - P-PROMOTE-CONT: continuation candidates require the explicit same-chain producer rows and next-edge result. S2WAIT is life-only. A missed continuation with a proven positive cause is DIVERGED/non-clearing; missing cause evidence is UNRESOLVED/HOLD, not FAIL by default. A first-flip miss is binding FAIL only when candidate membership and expected edge are both established and complete evidence proves the binding miss. 10:35 stays outside a pass until assigned.
 - P-KEEP: a KILL assertion is conditional on a present edge and resolved sub-branch. If absent by design, mark NA/HOLD; if present but required evidence is missing, UNRESOLVED/HOLD. P137-P141 are forecasts only. P044 attribution is mandatory; current 8-June source evidence does not exhibit flip-versus-neutral attribution, so it cannot PASS.
- P-DIRSCOPE (KILL 1x at 6/5 16:00 + 6/11 14:45 with S2PROMOTE 0x at those bars in the withdrawn branch; unset-keep form in fired branches with 6/10 15:45/17:10 + 6/12 10:55/18:10 as fallback mismatch-proof bars; MISMATCH-UNPROVEN rule: no containing row with set+mismatched reseedBar/reseedDir means UNPROVEN, never PASS).
- P-PARITY-WITHDRAWN (takes 6/3 + 6/5-16:55 row-identical, signals 2 same bars, balance 10027.13; FIX-vs-divergence pre-class: displaced take with ADVANCE rows is a FIX finding, never-reached path is divergence).
 - P-PARITY-FIRED: before parity can clear, inspect every same-chain pre-confirmation path for baseline and hypothesis takes. Only affirmative 5m-opposite evidence (LTFFLIP-adverse with value, or an S2PROMOTE ltf value opposite to direction) is direct flip evidence. LTF_MISALIGN and FRESHCOUNT ABORT alone are not asserted to prove an opposite 5m structure; classify them PIN-KILL-EXPLAINED/HOLD unless accompanied by direct flip evidence. Missing attribution is UNRESOLVED/HOLD. Fired admission plus affirmative flip evidence is PIN-VIOLATION/FAIL.
 - P-NOFALSE: UNEXPECTED_TAKE precheck precedes H_STATUS. The pinned-invalid 8-June London 09:25 SHORT cannot be a clearing take; current page evidence makes its attribution UNRESOLVED/HOLD-terminal. Any admitted take with affirmative same-chain pre-confirmation flip evidence is PIN-VIOLATION/FAIL; missing evidence cannot clear. No S5 one-position gate is asserted; per-session cap and cross-session coexistence are grounded in spec Part A v4.2 L283/L291. The 6/5 London 16:55 admission and its later 6/11 stop are a cross-session example in RECON77 record, not a universal daily-flat rule. Frozen identity key: venue, date, session, direction, admission bar, entry price +/-5-point band; match union of branch identities before branch selection.
 - H-TAKE identity 6/5 London SHORT, admission bar 09:45, entry 159.948 +/-5 points. H_STATUS follows P114. WITHDRAWN_FLIP_KILL only with no matching admission and affirmative same-chain pre-confirmation flip evidence through the 09:40 confirmation bar. LTF_MISALIGN or FRESHCOUNT alone is PIN-KILL-EXPLAINED/HOLD, not proof of a flip. Fired admission plus direct flip evidence is PIN-VIOLATION/FAIL. Confirm=0 is NEGATIVE; no confirm evaluation is NO_EVAL; confirm=1 without admission is BLOCKED. Late-TP at 16:55 is parity-only.
 - H-B3TAKE identity 6/11 LONG admission bar 14:40, entry 160.524 +/-5 points. Evaluated bar=14:35, pass floor 14:40; R24 is SHORT/shadow=true and is neither LONG life nor a negative. FIRED requires matching admission and separate LONG life row from 10:35 through 14:40; missing either is UNRESOLVED/HOLD. Without admission, classify only on exhibited evidence: no evaluation=WITHDRAWN_NO_EVAL; confirm negative=WITHDRAWN_NEGATIVE; affirmative flip-kill=WITHDRAWN_FLIP_KILL; confirm=1=BLOCKED. Fired plus direct same-chain flip evidence is PIN-VIOLATION/FAIL. A mismatched take is UNEXPECTED_TAKE. Post-admission absent edges follow P116.
 - Per-chain table: row IDs R01-R28 are prior-build context, not evidence of which branch the proposed future run takes. Future observed branch and arm are determined only by that run. The 6/5 SHORT 09:15 alternatives (carry 6/4 10:20 versus reseed 6/5 09:15), 6/9 per-bar arms, and all other forecasts remain conditional until then; unknown branch membership is UNRESOLVED/HOLD, never selected from the old rows.
 - Arming ledger schema: evaluated bar | actual arm-reseed date/direction or unset | R-row/context or future-run row | WW | FW | WF | FF. In column headers only, W=admission fired and F=not fired (first letter B1, second B3); as a cell token F means expected eligible promotion/fire. Other cell tokens: Km=expected kill for direction mismatch; Ku=expected kill for unset provenance; NA=edge absent by design; UNRESOLVED=present/unknown evidence. A symbol is not a runtime result. Conditional cells are annotated and cannot pass without future edge/seedBiasAl evidence. P115(1) isolates the proposed disjunct; P044 attribution remains unresolved.
  06.02 10:40 LONG R=disk-asserted arm=06.02 10:40/LONG WW=F FW=F WF=F FF=F
  06.02 14:25 LONG R=disk-asserted arm=06.02 10:40/LONG WW=F FW=F WF=F FF=F
  06.04 11:20 SHORT R=disk-asserted arm=06.04 10:20/SHORT WW=F FW=F WF=F FF=F
  06.05 09:05 SHORT R=R01,R02 arm=06.04 10:20/SHORT WW=F FW=F WF=F FF=F
  06.05 09:15 SHORT R=R03,R04,R05 arm=06.04 10:20/SHORT if the 09:05 promotion preserves the holder; arm=06.05 09:15/SHORT only if R03 reseed fires WW=F FW=F WF=F FF=F
  06.05 09:30 SHORT R=R06,R07 arm follows the row-proven 09:15 reseed or carried 06.04 arm; WW=F FW=F WF=F FF=F
  06.05 09:35 SHORT R=R08,R09,R10 arm follows the row-proven 09:15 reseed or carried 06.04 arm; WW=F FW=F WF=F FF=F
  06.05 16:00 LONG R=R17,R18 arm=06.05 09:15/SHORT WW=Km FW=Ku WF=Km FF=Ku
  06.08 09:25 SHORT R=R11,R12 arm=-/- WW=Ku FW=Ku WF=Ku FF=Ku
  06.08 17:30 SHORT R=R25,R13 arm=-/- WW=Ku FW=Ku WF=Ku FF=Ku
  06.08 17:35 SHORT R=R26,R14 arm=-/- WW=Ku FW=Ku WF=Ku FF=Ku
  06.08 17:45 SHORT R=R27,R15 arm=-/- WW=Ku FW=Ku WF=Ku FF=Ku
  06.08 18:00 SHORT R=R28,R16 arm=-/- WW=Ku FW=Ku WF=Ku FF=Ku
  06.09 09:50 SHORT R=R19,R20 arm=-/- WW=Ku FW=Ku WF=Ku FF=Ku
  06.09 10:20 SHORT R=disk-asserted arm=06.09 10:05/SHORT WW=F FW=F WF=F FF=F
  06.09 10:30 SHORT R=disk-asserted arm=06.09 10:05/SHORT WW=F FW=F WF=F FF=F
  06.09 15:35 SHORT R=disk-asserted arm=06.09 15:10/SHORT WW=F FW=F WF=F FF=F
  06.09 15:55 SHORT R=disk-asserted arm=06.09 15:55/SHORT WW=F FW=F WF=F FF=F
  06.09 16:10 SHORT R=disk-asserted arm=06.09 16:10/SHORT WW=F FW=F WF=F FF=F
  06.09 16:15 SHORT R=disk-asserted arm=06.09 16:10/SHORT WW=F FW=F WF=F FF=F
  06.09 17:30 SHORT R=disk-asserted arm=06.09 16:10/SHORT WW=F FW=F WF=F FF=F
  06.10 09:15 SHORT R=disk-asserted arm=06.09 16:10/SHORT WW=F FW=F WF=F FF=F
  06.10 15:45 LONG R=disk-asserted arm=06.09 16:10/SHORT WW=Km FW=Km WF=Km FF=Km
  06.10 17:10 LONG R=disk-asserted arm=06.09 16:10/SHORT WW=Km FW=Km WF=Km FF=Km
  06.11 10:35 LONG R=R21 arm=06.11 10:35/LONG WW=UNRESOLVED FW=UNRESOLVED WF=UNRESOLVED FF=UNRESOLVED; candidate membership UNKNOWN independently; no census PASS.
  06.11 14:45 SHORT R=R22,R23 arm=06.11 10:35/LONG WW=Km FW=Km WF=NA-if-absent/else-UNRESOLVED FF=NA-if-absent/else-UNRESOLVED
  06.11 16:05 LONG R=disk-asserted arm=06.11 10:35/LONG WW=F FW=F WF=NA-if-absent/else-UNRESOLVED FF=NA-if-absent/else-UNRESOLVED
  06.11 16:25 LONG R=disk-asserted arm=06.11 10:35/LONG WW=F FW=F WF=NA-if-absent/else-UNRESOLVED FF=NA-if-absent/else-UNRESOLVED
  06.11 17:45 SHORT R=disk-asserted arm=06.11 17:45/SHORT WW=F FW=F WF=NA-if-absent/else-UNRESOLVED FF=NA-if-absent/else-UNRESOLVED
  06.12 10:55 LONG R=disk-asserted arm=06.11 17:45/SHORT WW=Km FW=Km WF=Ku FF=Ku
  06.12 16:55 SHORT R=disk-asserted arm=-/- WW=UNRESOLVED FW=UNRESOLVED WF=NA-if-absent/else-UNRESOLVED FF=NA-if-absent/else-UNRESOLVED
  06.12 17:00 SHORT R=disk-asserted arm=-/- WW=UNRESOLVED FW=UNRESOLVED WF=NA-if-absent/else-UNRESOLVED FF=NA-if-absent/else-UNRESOLVED
  06.12 17:05 SHORT R=disk-asserted arm=-/- WW=UNRESOLVED FW=UNRESOLVED WF=NA-if-absent/else-UNRESOLVED FF=NA-if-absent/else-UNRESOLVED
  06.12 18:10 LONG R=disk-asserted arm=06.11 17:45/SHORT WW=Km FW=Km WF=Ku FF=Ku
- Route per venue: B1 exemption-at-S2 (this packet) + term-at-confirm (E2 round or feed procedure); B3 term-owned; B2 detector-owned; 8-June preserved-invalid.
- Sibling envelope: this proof is UJ June only (single run, own key scope); EU behavior is a separate sibling proof under its own word plus key scope.
 - H1-expiry watch: UJHOLDEXPIRE + ABORT_HOLDER_EXPIRED two-pattern zero is carried as a watch. An expiry abort is not itself a 5m flip. If it explains a later absent edge, classify PIN-KILL-EXPLAINED/HOLD; do not route it to blanket FAIL or DIVERGED. An absent expected edge with neither proven cause nor pin-kill explanation is UNRESOLVED/HOLD unless a separately stated binding predicate is proven.
- N/N+1 timing assert: every S2-edge/CONFIRMPOLL row's log floor(barPeriod) equals its bar time plus one bar (battery asserts it on the new run; passes may land seconds into the bar).
- Divergence-bar defined: the first bar where the baseline expects an S2 row and the tester shows neither PROV nor S2WAIT.

## Prior fold maps: v27/v30 maps were not retained as separate blocks; their dispositions are summarized in the versioned packet history at P038.

## Fold map (V382 dispositions of V381; v31 remains the predecessor)
 - Q1 carried, not discharged: one-line fences and unchanged edit set accepted conditionally. P024/P094 opposite-versus-neutral 5m limitation, P027 sentinel monitoring, P115 M(2) LONG rows, and P166 N/N+1 assertions remain run-graded/UNRESOLVED. P026 remains narrowly stated; no LONG identity/runtime claim. No source edit is authorized.
 - V381 Q2 fold: Sonnet OBJECT findings are corrected or held non-clearing at P044/P112-P128/P153-P165; prior-page reference v31 P169 is retired: census grade vs membership separated; NA only for absent edges; status/dispatcher order made single; CAUSE_ADVANCE no longer circular; kill evidence is distinguished from affirmative 5m flip; missing 8-June attribution, T(1) emitter, LONG twin, and 10:35 census membership stay UNRESOLVED/HOLD; stale-build rows cannot determine future branch; notation/schema are defined; pin-kill explanation cannot become blanket FAIL. GLM precision asks are addressed at P006/P026/P038/P057/P082/P090/P110/P117/P124/P128.
 - Parked with cause: opposite-LTF edge conjunct/ReadFlow hoist, ltf print, direction helper, identity-scoped provenance, and S1C re-stamp would expand the proposed EA change set. They remain alternatives only and require the cleared council gate plus separate exact grant words. No code alternative is adopted; build/run also require their own key and run word.
 - V381 Ask B: page-only distinctions are adopted at P123-P126; code mechanisms remain parked. The current packet does not convert any missing source or run evidence into a pass.
 - Remaining unresolved carry: vote-free GO/HOLD remains a separate operator signal and is not inferred. Current 8-June attribution and any unshown LONG/CONFIRMPOLL rows are non-clearing. R13/R26 duplicated NN is source data, not row identity. No post-V381 run evidence exists.
## Budget recount (mechanical): proposed DIR-DECL +1 / DIR-SET +1 / DIR-CLEAR +1 / EXEMPT-TERM +0 / PRINT-DIR +0. NET +3 vs v29 EA tree 12295; proposed final tree 12298. V32 changes page text only; no EA delta. S3 recount/build proof remain future gated work.

## Run cost and novel evidence

- No run proposed (draft round; build gated on a NEW key + his run word, neither spent nor asked here). Cost when gated: build + ~50m UJ June window (measured RECON77 0:48:09) + grade battery; key scope per seat (one build + one UJ run; EU sibling needs its own word + key scope).
 - Novel page evidence vs V381: Sonnet/GLM V381 replies and their page findings only; no new runtime evidence. Current packet explicitly preserves UNRESOLVED/HOLD for absent source exhibits, census membership, and future-run branches.

(End of file - total 184 lines)
