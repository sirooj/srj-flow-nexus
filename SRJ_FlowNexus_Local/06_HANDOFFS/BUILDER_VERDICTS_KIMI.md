# BUILDER VERDICTS — KIMI (new review seat, added 2026-09-21 on his word; same relay text as all seats; keys never from this seat, Luna remains sole key source)

## KIMI-V217 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

**Verdict: AMEND-WITH-DELTA** — clear PACKET_P-EXITMODEL-2 v4 by name for exactly one build plus one run under the stated envelope (RECON50_DEMO_USD / InpMode 1 / 08-26–09-10 / InpDebugLog=true / 90-min ceiling), G1–G4 graded as stated, conditioned on two zero-byte text deltas folded in the same council round. Envelope, stages, S1 assert list, and G1–G4 are unchanged. Nothing here builds, runs, or spends; the clear stands only with the operator's run word plus token plus dual-key, per standing money rule.

The page is substantively sound: the F1 hunk assembles to 15 physical non-blank lines (1 comment + 1 anchorRank + 6 session + 7 POI, P28), the F3 sub-budget checks ((a)+1, (b)+1, (c)0, (d)9, (e)0, (f)+1, (g)+1 = +13, P32), F2 is 4-for-4 net 0 (P30), and 11248 − 24 + 13 = 11237 (P40). The (d) gate, (f) chain, and (g) header are mutually consistent, and the G3 conditionals are correctly hedged (8/28-pm RECON51 SL lands at 17:00, one bar after the 16:55 mark, so DAY_CLOSE at the 16:55-bar evaluation is the primary expected outcome, with the same-bar SL suppression covered by the "earlier-or-same" clause). No halt-grade defect found. The two deltas:

**D1 (required) — P17 (packet L17), Rule-section priority phrase contradicts the edit set.** P17 states "priority SL then booked-TP then BREAK then DAY_CLOSE then HTF (dead while F2 holds)". The shipped header (P32(g)) says HTF_FLIP "beats DAY_CLOSE on shared bars," the chain arms (P32(f)) place the vHTF arm before the vDAY arm, the eval gate (P32(d)) excludes vHTF precisely so a re-enabled flip wins on shared bars, and the folded v216 Luna delta ("explicit HTF-before-DAY_CLOSE chain") is already credited. The edit literals are coherent; the Rule prose is stale. Under F2 there is no behavioral divergence in this run (vHTF is false by construction), but the contradiction sits exactly on the one-line rollback path the packet keeps in scope (P16). Restate P17 as: "priority SL, then booked-TP, then BREAK, then HTF (dead while F2 holds; when re-enabled, beats DAY_CLOSE on shared bars), then DAY_CLOSE." Zero bytes.

**D2 (required) — P30 (packet L30), F2 comment parenthetical enumerates only F3 as persisting.** "one-line re-enable (true) restores the HTF flip leg only, never the whole pre-packet behavior (F3 stays installed; full-rollback gating parked)" — F1's unified nearest booking also persists past re-enable and is unnamed. Restate the parenthetical as "(F1 unified nearest booking and F3 stay installed; full-rollback gating parked)". This touches the F2 new-verbatim comment span only; the hunk stays 4-for-4 and net 0. "Never the whole pre-packet behavior" is accurate as written, so this is an enumeration imprecision, not a behavior claim — but it ships in a code comment and should be exact.

**Analytic ask A — every defect, gap, or imprecision seen, with line numbers:**

1. **P17 priority contradiction** (L17) — D1 above. The only hard internal inconsistency on the page.
2. **P30 incomplete persistence enumeration** (L30) — D2 above.
3. **P32(a) wording looseness** (L32): "comma appended, net 0 lines" then "(a) stays +1 net" reads contradictory in isolation; the comma change is net-0 lines and the new enum entry is +1, total +13 intact. Trivial; fix optionally with D1/D2 fold.
4. **DAYDEF pull truncation** (R-DAYDEF, page shows through L10342): the Friday 17:00-ET branch is off-page, and the comment "Friday marks: 17:00 ET" is misreadable as dayMarks[Friday]=17:00. The S1 assert "16:55 unconditional per date L10338-L10355, ascending" (P36) is the load-bearing cover and must run verbatim at build; from the page alone the Friday shape is assertable only on disk. Covered, but name it so no one waives the assert.
5. **Exit-timing semantic vs name** (L17, L21): barTime==mark means the verdict fires on the mark bar's evaluation, i.e. mark-bar close — at M5 granularity that is the 17:00 day close, while the leg is named minus-5. Adequately disclosed and parked (mark-bar-close figure alternative, his veto decides); restating only so it stays on the record as a standing imprecision, not a new finding.
6. **EXITVERDICT non-exhaustive for vDAY** (L21): recorded observability narrowing; format-frozen print cannot show DAY_CLOSE, vDAY travels only via MtExitName into MTEXIT/MTLIFE. Disclosed; no action.
7. **`dc` identifier collision** (P32(d)): cannot be ruled from the page; the S4 compile gate (0 errors 0 warnings) and S1 exact-diff are the correct covers. Not a page defect — listed because it is the one residual risk the chat cannot close.
8. **Exact-price tie census naming** (L28): two session lines at an identical price are indistinguishable by equality-with-best; the recorded session-first order governs naming and booked value is unaffected. Disclosed; the parked explicit-tie-key remains the remedy if naming ever matters.
9. **G3 8/28-pm phrasing** (P42): correct but leaves the primary expectation implicit. Cosmetic.

**Analytic ask B — better mechanisms, with the lines they would touch:**

- B1: early-break on the ascending mark scan — add `if(g_news_dayMarks[dc] > barTime) break;` to the (d) literal (P32, inserted at the L11188 blank). Correctness-neutral (marks ascending, first-hit already selects the earliest qualifying mark); cosmetic at cap 32. Optional; do not fold into this build.
- B2: precompute the first qualifying mark per trade at admission (fillBarTime is latched at the S5 site, EA L10062–L10068) — already on the page as the parked stored-mark / precomputed-mark alternatives. Recommend it stays parked for this run; the shipped per-evaluation scan is correct and the census join is the graded artifact.
- B3: the parked set otherwise already enumerates the better mechanisms for the stated goal (FindFirstDayCloseMark helper, BOOKCENSUS, mark-bar-close figure, suppressed-vDAY flag, B1-action-side). No non-parked mechanism change is warranted; the packet's design is the right one for a first nearest-booking + no-flip + day-close run.

**Verification split honored:** all digests, byte-counts, tree state, and the day-marks/enum-consumer/EXITVERDICT-format facts are disk truth proven on the operator's machine; nothing above rules on them beyond the page's own arithmetic, which checks. Dual-key, his run word, and token remain owed before anything builds or runs; no commit without token.

Volunteered key: **KIMI-V217** (this seat's label for the filed verdict; filed whole 1x).

## KIMI-V223 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

**VERDICT: AMEND-WITH-DELTA** — clear PACKET_P-EXITMODEL-2 v9 by name, conditional on delta D1 folded into the literal before S2 applies it. Envelope unchanged: exactly one build (F1 + F2 + F3 + F0 zero-byte) plus one tester run under the RECON51 envelope, G1–G4 graded as stated, alert-only. This verdict files deltas only; nothing here builds, runs, or spends.

**D1 (defect — the ruling delta).** P32(g), new-verbatim header line 3 (replaces EA L11030–L11032): the literal reads `// (mean-reversion scope) (the conservative stop-first standard; ...`. That parenthetical is stale under the v6 universal-scope ruling it sits inside: P17 ("EVERY managed trade regardless of regime… amends the mean-reversal-only scope"), the P26 v6 fold ("F3 scope universal, regime gate removed"), P42 ("any managed trade"), P43. As written, the exact-diff would ship compile-time priority documentation contradicting the packet's own scope. Fix: `(mean-reversion scope)` → `(universal scope: every managed trade)`. Comment-only, in-place text replacement on an existing line: zero net line change, the 4-for-3 header arithmetic stands, predicted 11236 stands, no S1 assert touches the header (S1 enumerates EXITVERDICT at L11189–L11200, not this comment), no gate text changes.

**D2 (optional wording precision — volunteered, not required for clear).** P32(d) comment literal: "Priority below BREAK" is incomplete on the rollback path (when MT_HTF_EXIT is re-enabled, DAY_CLOSE is also below HTF — the header and the (d) gate both say so). Suggest "Priority below HTF (when re-enabled) and BREAK". Comment-only. D1 alone suffices if he prefers minimal touch.

**Analytic ask A — every defect, gap, or imprecision seen on the page:**

1. **P32(g) line 3 — stale scope word** (D1 above). The single genuine defect; everything else below is precision notes.
2. **P32(d) comment — "Priority below BREAK"** (D2 above). Accurate under F2, incomplete under rollback.
3. **P17 — "no trade holds overnight by design" overbroad.** The operative rule is "no trade survives past the first 16:55-ET mark at/after its fill." A post-mark fill (fillBarTime > that day's mark) waits for the *next* day's mark — G3's own 9/8 17:00 MEANREV row (J07) is the live shape: absent the 17:05 BREAK, that trade holds overnight to the 9/9 mark by design. The sentence should read "no trade survives past the first mark at/after its fill"; the current phrasing invites a false failure reading if a post-mark fill ever does sit overnight.
4. **P26 — duplicated v217 fold paragraph.** The v217-as-v5 fold (Luna P17 restate… Kimi added as fourth transport seat) appears twice with minor wording differences ("budget 11237 stands as the v5 figure, superseded by v6 11236 in G1" vs "budget 11237 stands — credit the check"). Record-language only, zero bytes, cosmetic — but the fold text is the graded F0 artifact, so it should carry each v217 delta once.
5. **R-DAYDEF comment juxtaposition.** The block prose mentions "Friday marks: 17:00 ET (the weekFlat census definition)" adjacent to the day-marks loop, while the visible assignment hardcodes `TC_MakeTime(..., 16, 55)` and S1 asserts "16:55 unconditional, ascending, dayN==16." On the page the operative claims are mutually consistent (16 dates 08-26→09-10 = 6 + 10 = 16; if Fridays were diverted from g_news_dayMarks, dayN would be 14, not 16 — so Fridays sit in g_news_dayMarks at 16:55, and the 17:00 note belongs to the separate friN/friET weekFlat arrays). The comment invites misreading; the S1 assert is the correct guard and stays. Disk-proved, not chat-provable.
6. **Arithmetic, machine-checked:** F1OLD pull = 39 physical lines (matches L2321–L2359 inclusive); assembled F1 = 1 comment + 1 anchorRank + 6 session + 7 POI = 15 → net −24 ✓. F3: (a)+1, (b)+1, (c)0, (d)8 (comment+if+brace+for+brace+if-body+brace+brace) ✓, (e)0, (f)+1 (5-for-4), (g)+1 (4-for-3) = +12 ✓. F2 4-for-4 = 0 ✓. 11248 − 24 + 12 = **11236** ✓. G1's budget holds as stated.
7. **(d) logic checks clean:** first-qualifying-mark break is correct given strictly ascending marks (S1-asserted); gate exclusion of vHTF is correct for the rollback path and is exactly what makes "HTF beats DAY_CLOSE on shared bars" true by construction; fillBarTime == mark consumption and post-mark-fill skip both fall out of `fillBarTime <= mark <= barTime` correctly; no-trailing-else after the (f) chain is unreachable via the L11202 gate that now includes vDAY ✓.
8. **F1 checks clean:** session-first evaluation matches the claimed tie-break (strict-less-than keeps first-arrived, L2246 as quoted); swept/live mask correctly absent from the POI loop; anchor admitted via the carried L2331 anchorRank filter; unified race into best/haveBest is a true single reduction.
9. **G3 winner claims robust:** J10 — even if PDH:71 were valid, YNYH:10 wins by distance, so "PDH/LOH dominated" phrasing is safe either way. J09 — the AS.H-vs-LOH validity hedge is correctly run-graded via SWEPTMASK/in-zone, and "nearest-valid-wins operative for unnamed nearer lines" covers the case where LOH:9 survives filtering.
10. **Known-and-recorded, not new:** EXITVERDICT "logs ALL" header prose vs the recorded vDAY narrowing (P21) — already knowingly narrowed and documented; regime divergence and per-bar recompute anchor-skip both correctly parked as diagnosed-not-retuned.

**Analytic ask B — better mechanism for the stated goal:** the graded goal is "DAY_CLOSE rows provable per managed trade." The packet infers them via an offline mark-join against MTEXIT/MTLIFE (P42), with EXITVERDICT expressly non-exhaustive for vDAY (P21). A direct-evidence mechanism: a `MtDayCloseEmit` at the (d) site (insertion point L11188, paralleling MtFlipEmit), writing MTDAYCLOSE rows at the moment `vDAY` latches (admission key, mark, barTime, nextOpenPx). Touches only the (d) block plus one new helper beside MtFlipEmit; log-only, behavior-neutral, zero effect on any gate or the 11236 budget; converts G3's DAY_CLOSE join from inference into first-class rows and closes the recorded observability gap. The packet's join mechanism is adequate — this is an observability upgrade, operator's call. I do not re-propose the parked items (precomputed mark index, stored-mark helper, mark-bar-close figure, early-break scan all stay parked).

**Verification split honored:** this rules on the page only. Digests, line counts, the L2246 strict-less-than claim, the two-site toggle census, the enum consumer audit, EXITVERDICT format, and day-marks ascending/16 are asserted on the page and are disk-proved on his machine — not answerable from chat by any seat.

**Keys:** no authority key from this seat (Luna remains sole key source). Volunteered delta keys only: **D1** (P32(g) line 3 — required for clear) and **D2** (P32(d) comment — optional).

## KIMI-V220 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

VERDICT: AMEND-WITH-DELTA — PACKET_P-EXITMODEL-2 v7, ruled on the page only. Two deltas, both packet-text (zero bytes, F0-class), neither touches the F1/F2/F3 literals, the STAGE-1 exact-diff, or the 11236 budget. NO CLEARANCE from this seat — dual-key needs Luna; no key volunteered (Luna remains sole key source).

Delta Kimi-D2 (G4 grade path, P43; evidence J09). G4 names exactly two 9/7 09:20 outcomes: booked==AS.H (convergence credit) and admission blocked (not-applicable, no credit no penalty). But J09 shows LOH:9 < ASH:66, and P42 itself makes LOH's 9pts validity run-graded. If LOH passes SWEPTMASK/in-zone, F1 books LOH — rule-conformant under P28/P42 ("nearest-valid-wins operative for unnamed nearer lines") yet divergent from his ledger-535 AS.H word, and G4 assigns that third outcome no grade at all: not fail, not divergence-recorded, not conformant-no-credit. Fold as v8 record language, e.g.: "booked≠AS.H with the admission live and a nearer contender validity-proven grades divergence-recorded, rule-conformant, no credit no penalty." Zero bytes; G-grading only.

Delta Kimi-D3 (P17 qualifier, packet-text). "No trade survives past the first mark at/after its fill" is true only under per-bar evaluation and g_news_init true (P32's gate; P42's weekend-gap figure is the pinned exception). The sentence should carry both qualifiers so a later reader doesn't grade the weekend gap or a false g_news_init run against it. Zero bytes.

Analytic ask A — every defect/gap/imprecision seen, with lines:

1. The G4 gap above (P43, J09) — the only substantive one.
2. P17 universal-survival sentence missing its two qualifiers (above).
3. P32(a) enum literal `MT_EXIT_DAY_CLOSE   = 8` misaligns the `=` column against the L151-L161 style (17-char name + 3 spaces vs the 22-column alignment of the existing entries). Cosmetic, as-quoted, S2 will accept it literally; his veto if he wants the column matched — but any re-space is a literal change and must be re-quoted whole.
4. P32(d) scan is O(dayN) per managed trade per bar — negligible at dayN==16 (S1-asserted), but the L10330-L10342 cap (`g_news_dayN < 32`) truncates silently if the pilot range ever exceeds 32 dates, and trades past the 32nd mark would never day-close. Non-blocking for this run (S1 asserts 16); standing risk only, recorded.
5. P32(g) header retains "the census logs ALL verdicts" — true only under P21's narrowed MTEXIT/MTLIFE reading; already adjudicated and recorded in P21, listed for completeness so the v8 fold doesn't "fix" the frozen-adjacent header without his word.
6. vDAY is invisible in the frozen EXITVERDICT print (L11189), so a same-bar vDAY-plus-higher-verdict instance can't be re-judged from that print alone; P21 records the limitation and the MTEXIT/MTLIFE mark-join is the mitigation. No action; named so G3 grading doesn't reach for EXITVERDICT completeness.
7. P28's winner==booked proof is non-anchor-only (recompute skips anchor); anchor-wins ride MTSNAP/TP_ELECT admission rows — already handled in P28/P42/P47(a); named so the result file tabulation doesn't over-claim TPCENSUS coverage.
8. Nit, no action: the (f) chain preserves the old 4-space `    else if(vTP)` quirk as-quoted (matches L11208); correct under the no-re-indent convention.

Verified clean (so the delta list is the whole list): F1 old block counts 39 lines as quoted (L2321-L2359), new assembles to exactly 15 physical non-blank lines (1+1+6+7), net -24; F2 4-for-4 net 0; F3 nets (a)+1, (b)+1, (c)0, (d)8, (e)0, (f)+1 (5-for-4), (g)+1 (4-for-3) = +12; 11248 − 24 + 12 = 11236 ✓. The (d) block uses only in-scope names (g_news_init, g_news_dayN, g_news_dayMarks, g_mtrade.fillBarTime, barTime — all live at the L11188 insertion point). The guard chain (d)→(e)→(f) is priority-consistent: SL/TP/BREAK/vHTF exclusion in (d) matches the shipped HTF-before-DAY_CLOSE header, and the L11202 gate makes the no-trailing-else chain unreachable-proof. The 9/8 pin is arithmetically right: fillBarTime 17:00 > 16:55 mark → ineligible; 17:05 BREAK precedes the next mark outright, priority never engaged. The J07-style fill==mark boundary (fillBarTime == mark consumes that day's mark at first evaluation, exit one bar later) is pinned in P17 and behaves as stated. S1's two-site MT_HTF_EXIT census (L132 definition, L11168 sole consumer) and the exitReason write/render site list (L289/L10051/L10068/L11071/L11207-L11210; renders L10982/L11214/L11222) are internally consistent with every quoted site. The Friday/weekend nextOpenPx exposure is correctly parked in G3/G4 as a resolved-on-run figure, not an execution claim.

Analytic ask B — better mechanisms: For F3's stated goal, the shipped range-scan (fillBarTime <= mark <= barTime over strictly ascending marks, first-hit break) is already the robust form — it survives missed evaluations and gaps where a mark-crossing detector (prevBar < mark <= barTime) would silently skip; I see no better unparked mechanism. The genuinely better one — precomputing the trade's next mark once and storing it, killing the per-bar scan and the cap-32 exposure — is the already-parked stored-mark/precomputed-mark alternatives; if he ever un-parks them they touch the (d) block (P32), the admission latch site near L10062-L10068, and the MTLIFE row format, which is format-frozen and needs his word. For F1, none better: one race through the kept TpTargetUpdateBest reduction with strict-less-than first-wins (L2246) is minimal; the parked explicit tie key/flag add surface without changing the booked value. For the G4 gap, the fix is packet text, not code (Kimi-D2 above).

Nothing here builds, runs, or spends; disk truth stays on his machine.

## KIMI-V219 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

**VERDICT: AMEND-WITH-DELTA** — clear PACKET_P-EXITMODEL-2 v6 by name, conditional on delta D1 folded into the literal before S2 applies it. Envelope unchanged: exactly one build (F1 + F2 + F3 + F0 zero-byte) plus one tester run under the RECON51 envelope, G1–G4 graded as stated, alert-only. This verdict files deltas only; nothing here builds, runs, or spends.

**D1 (defect — the ruling delta).** P32(g), new-verbatim header line 3 (replaces EA L11030–L11032): the literal reads `// (mean-reversion scope) (the conservative stop-first standard; ...`. That parenthetical is stale under the v6 universal-scope ruling it sits inside: P17 ("EVERY managed trade regardless of regime… amends the mean-reversal-only scope"), the P26 v6 fold ("F3 scope universal, regime gate removed"), P42 ("any managed trade"), P43. As written, the exact-diff would ship compile-time priority documentation contradicting the packet's own scope. Fix: `(mean-reversion scope)` → `(universal scope: every managed trade)`. Comment-only, in-place text replacement on an existing line: zero net line change, the 4-for-3 header arithmetic stands, predicted 11236 stands, no S1 assert touches the header (S1 enumerates EXITVERDICT at L11189–L11200, not this comment), no gate text changes.

**D2 (optional wording precision — volunteered, not required for clear).** P32(d) comment literal: "Priority below BREAK" is incomplete on the rollback path (when MT_HTF_EXIT is re-enabled, DAY_CLOSE is also below HTF — the header and the (d) gate both say so). Suggest "Priority below HTF (when re-enabled) and BREAK". Comment-only. D1 alone suffices if he prefers minimal touch.

**Analytic ask A — every defect, gap, or imprecision seen on the page:**

1. **P32(g) line 3 — stale scope word** (D1 above). The single genuine defect; everything else below is precision notes.
2. **P32(d) comment — "Priority below BREAK"** (D2 above). Accurate under F2, incomplete under rollback.
3. **P17 — "no trade holds overnight by design" overbroad.** The operative rule is "no trade survives past the first 16:55-ET mark at/after its fill." A post-mark fill (fillBarTime > that day's mark) waits for the *next* day's mark — G3's own 9/8 17:00 MEANREV row (J07) is the live shape: absent the 17:05 BREAK, that trade holds overnight to the 9/9 mark by design. The sentence should read "no trade survives past the first mark at/after its fill"; the current phrasing invites a false failure reading if a post-mark fill ever does sit overnight.
4. **P26 — duplicated v217 fold paragraph.** The v217-as-v5 fold (Luna P17 restate… Kimi added as fourth transport seat) appears twice with minor wording differences ("budget 11237 stands as the v5 figure, superseded by v6 11236 in G1" vs "budget 11237 stands — credit the check"). Record-language only, zero bytes, cosmetic — but the fold text is the graded F0 artifact, so it should carry each v217 delta once.
5. **R-DAYDEF comment juxtaposition.** The block prose mentions "Friday marks: 17:00 ET (the weekFlat census definition)" adjacent to the day-marks loop, while the visible assignment hardcodes `TC_MakeTime(..., 16, 55)` and S1 asserts "16:55 unconditional, ascending, dayN==16." On the page the operative claims are mutually consistent (16 dates 08-26→09-10 = 6 + 10 = 16; if Fridays were diverted from g_news_dayMarks, dayN would be 14, not 16 — so Fridays sit in g_news_dayMarks at 16:55, and the 17:00 note belongs to the separate friN/friET weekFlat arrays). The comment invites misreading; the S1 assert is the correct guard and stays. Disk-proved, not chat-provable.
6. **Arithmetic, machine-checked:** F1OLD pull = 39 physical lines (matches L2321–L2359 inclusive); assembled F1 = 1 comment + 1 anchorRank + 6 session + 7 POI = 15 → net −24 ✓. F3: (a)+1, (b)+1, (c)0, (d)8 (comment+if+brace+for+brace+if-body+brace+brace) ✓, (e)0, (f)5-for-4=+1, (g)4-for-3=+1 → +12 ✓. F2 4-for-4 = 0 ✓. 11248 − 24 + 12 = **11236** ✓. G1's budget holds as stated.
7. **(d) logic checks clean:** first-qualifying-mark break is correct given strictly ascending marks (S1-asserted); gate exclusion of vHTF is correct for the rollback path and is exactly what makes "HTF beats DAY_CLOSE on shared bars" true by construction; fillBarTime == mark consumption and post-mark-fill skip both fall out of `fillBarTime <= mark <= barTime` correctly; no-trailing-else after the (f) chain is unreachable via the L11202 gate that now includes vDAY ✓.
8. **F1 checks clean:** session-first evaluation matches the claimed tie-break (strict-less-than keeps first-arrived, L2246 as quoted); swept/live mask correctly absent from the POI loop; anchor admitted via the carried L2331 anchorRank filter; unified race into best/haveBest is a true single reduction.
9. **G3 winner claims robust:** J10 — even if PDH:71 were valid, YNYH:10 wins by distance, so "PDH/LOH dominated" phrasing is safe either way. J09 — the AS.H-vs-LOH validity hedge is correctly run-graded via SWEPTMASK/in-zone, and "nearest-valid-wins operative for unnamed nearer lines" covers the case where LOH:9 survives filtering.
10. **Known-and-recorded, not new:** EXITVERDICT "logs ALL" header prose vs the recorded vDAY narrowing (P21) — already knowingly narrowed and documented; regime divergence and per-bar recompute anchor-skip both correctly parked as diagnosed-not-retuned.

**Analytic ask B — better mechanism for the stated goal:** the graded goal is "DAY_CLOSE rows provable per managed trade." The packet infers them via an offline mark-join against MTEXIT/MTLIFE (P42), with EXITVERDICT expressly non-exhaustive for vDAY (P21). A direct-evidence mechanism: a `MtDayCloseEmit` at the (d) site (insertion point L11188, paralleling MtFlipEmit), writing MTDAYCLOSE rows at the moment `vDAY` latches (admission key, mark, barTime, nextOpenPx). Touches only the (d) block plus one new helper beside MtFlipEmit; log-only, behavior-neutral, zero effect on any gate or the 11236 budget; converts G3's DAY_CLOSE join from inference into first-class rows and closes the recorded observability gap. The packet's join mechanism is adequate — this is an observability upgrade, operator's call. I do not re-propose the parked items (precomputed mark index, stored-mark helper, mark-bar-close figure, early-break scan all stay parked).

**Verification split honored:** this rules on the page only. Digests, line counts, the L2246 strict-less-than claim, the two-site toggle census, the enum consumer audit, EXITVERDICT format, and day-marks ascending/16 are asserted on the page and are disk-proved on his machine — not answerable from chat by any seat.

**Keys:** no authority key from this seat (Luna remains sole key source). Volunteered delta keys only: **D1** (P32(g) line 3 — required for clear) and **D2** (P32(d) comment — optional).

## KIMI-V221 (AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

**VERDICT: AMEND-WITH-DELTA** (two small deltas; everything else checks out on the page). No key volunteered. Nothing here builds, runs, or spends.

---

**D1 — S1 assert "session loop precedes POI loop" is unsatisfiable at S1 (placement defect).**
P36 groups it under "S1 asserts (read-only, before any write)". On the pre-build tree the order is the opposite: the POI loop (famBest pass) runs first and the session walk sits in the else-branch (R-F1OLD, L2321–L2359). Run as written, S1 halts spuriously before any write. The property is only true of the *applied* F1 block. Note G-RULES' own S1 list ("uses-census plus format plus day-marks plus L2246 plus call-cadence") already omits it — so the packet disagrees with itself on whether this is an S1 assert. **Delta:** strike it from the P36 S1 list; carry it into S3 post-write re-audit (coordinates shift with (f) anyway; S3 already re-audits exitReason sites). Zero behavior impact; exact-diff allowlist already pins the F1 bytes, so nothing is lost.

**D2 — TPCENSUS tie-naming order unpinned (proof hole on a measure-zero event).**
P28 pins booking-side tie-break: session pool evaluates first, TpTargetUpdateBest strict-less-than keeps first-arrived (L2246), so exact ties book the session line. But the G2 winner==booked proof rides on TPCENSUS naming "by equality with best" (P15, L2369–L2427, code unchanged). Equality names *some* line at the tied best value; which name it prints depends on TPCENSUS's own iteration order, which the packet never states. If TPCENSUS walks POI-first, an exact tie names the POI line while booking holds the session line, and the G2 winner==booked attribution fails on an event the run could produce. **Delta (either arm, checkable read-only on disk, zero build impact):** (i) add to S1: assert TPCENSUS walk order is session-first (then the existing comment "census tie-naming follows the same order" becomes proved, not assumed); or (ii) declare in G2 that exact-tie naming is exempt (measure-zero, booked value unaffected) and grade winner==booked on strict wins only. This sits exactly in the parked tie-flag/explicit-tie-key alternative family, so arm (ii) is consistent with the standing parks.

---

**Cross-checks that PASS (recorded, no delta owed):**
- Budget: F1 39→15 = −24; F3 (a)+1 (b)+1 (c)0 (d)8 (e)0 (f)+1 (g)+1 = +12; F2 4-for-4 = 0; 11248 − 24 + 12 = **11236** ✓ (P40, P32).
- (d) block counts to 8 physical lines as claimed ✓. First-hit break over ascending marks selects the earliest qualifying mark ✓ (P17, L10338–L10355).
- Priority chain is internally consistent in three places: (d) gate `!vHTF`, the (e) return gate, and the (f) arm order SL→TP→BREAK→HTF→DAY all match the (g) header literal ("HTF when re-enabled; beats DAY_CLOSE on shared bars") ✓.
- 9/8-pm boundary is airtight: fill at 17:00 open ⇒ fillBarTime (17:00) > 16:55 mark ⇒ same-date mark ineligible; 17:05 BREAK precedes the next day's mark outright, so priority never engages ✓ (P42).
- 9/7 09:20 handled honestly: J09 shows LOH:9 nearer than ASH:66, so F1 may book LOH if valid; G4's divergence-recorded branch (no credit, no penalty) covers exactly that ✓.
- F2 comment claim is true: flipping the define restores the leg only; F1/F3 stay installed (P30). MTFLIP-zero by construction (emitter inside vHTF-true branch, L11184) ✓.
- S1 EXITVERDICT prediction under F2 (htfH/M/L 0.0, want 0, anti −1) matches the dead-leg code path (L11165–L11187) ✓.

**Analytic ask A — defects/gaps/imprecisions on the page (freetext, no deltas required unless stated above):**
1. P36 S1 order assert (D1 above).
2. TPCENSUS tie-order unpinned (D2 above).
3. Header wording tension: the new (g) line 3 still says "the census logs ALL verdicts" while P21 records that the property is knowingly narrowed for vDAY (EXITVERDICT frozen, vDAY travels via MtExitName into MTEXIT/MTLIFE only). Defensible as written (the header's "census" reads on the census path), but a reviewer reading L11189 rows alone will think a verdict is missing on DAY_CLOSE bars. Option 2 remains parked for his word — noted, not re-raised.
4. Reading hazard at the day-def comment (L10331): "Friday marks: 17:00 ET" refers to the *friMarks* array; F3 reads only g_news_dayMarks (16:55 unconditional per date). The S1 day-marks assert resolves it, but the comment invites a Friday-17:00 misread of G3's 8/28-pm and 9/4 rows. Annotation-only.
5. J08–J10 show `admitted=` empty; the Luna-D6 duty (result file must show POI participation in winner==booked rows plus terminal/account/mode/benchmark) therefore cannot be verified from census names alone on ties or multi-pool races — the duty stands as written, but the empty field means participation evidence leans on distPts lists. Flagged for the S7 tabulation, not a packet defect.
6. (d) rescans all 16 marks on every managed-trade bar evaluation — O(16) per bar, negligible; noted only because the parked "precomputed mark"/"early-break scan" alternatives exist for the same cost class.

**Analytic ask B — better mechanism for the stated goal:**
A per-trade monotonic mark cursor: since dayMarks are strictly ascending by construction and fillBarTime is fixed at admission, store `int nextMarkIdx` in the managed-trade state (struct near L10038–L10066) and, in EvaluateManagedTrade at the (d) site (post-L11187), advance it while `g_news_dayMarks[nextMarkIdx] < fillBarTime` once at admission, then per bar test a single index instead of the 0-base loop. Touches: struct decl (~L10062 region, one int field), one init line at admission booking, and the (d) block becomes a two-line test. Same semantics as P17's first-hit break (provable by the ascending invariant), O(1) amortized, and it removes the rescan. **It stays parked** — it is the same alternative family as "stored-mark helper"/"precomputed mark"/"early-break scan", operator-vetoable; F3 as drafted is correct, this is cost-only.

**Key statement:** none volunteered; keys come only from the key seat.

**Clearance note (standing):** this verdict is one seat's ruling on the page. Dual-key clearance still needs Luna's clear plus his run word plus token; no build or run is authorized by this text.

## KIMI-V224 (v223 transport return, AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

KIMI SEAT — VERDICT on PACKET_P-EXITMODEL-2 v10 (review request 2026-09-21, packet CD370FF1/32065 B/48 lines quoted whole above; ruling on the page only)

VERDICT: **AMEND-WITH-DELTA** — one build plus one run is the right ask and the page supports it; three precision deltas below, none blocking, all wording/assert-level, zero bytes of code. No key volunteered (keys volunteered only; Luna remains sole key source; dual-key clearance needs Luna regardless of this verdict).

DELTAS (with line numbers)

- **Kimi-D1 (P17, packet L17; extends S1 at P36/L36; grade wording at P43/L43): pin the timebase of the three-way comparison.** The operative rule is `fillBarTime <= mark <= barTime` (P32(d)/L32), but the page states each quantity's timebase in a different place: fillBarTime = fill-bar open (P17), mark = `TC_ZoneToServer(..., TZ_NEWYORK)` output (L10330-L10355), barTime = closed evaluation bar open under the shift-1 cadence (S1, L36). All three are server-time bar-open instants, so the comparison is sound — but no single line on the page says so. Add one pinning sentence to P17 and one S1 assert: fillBarTime, dayMarks[], and the EvaluateManagedTrade barTime are all server-time bar-open times from the same clock, making the <= chain dimensionally homogeneous. Cost: zero bytes.

- **Kimi-D2 (P17/L17 and P43/L43, Friday→Monday boundary; S1 day-marks assert at P36/L36): enumerate weekend marks.** The day-marks loop is quoted only through the mark assignment (L10338-L10355); the increment step is not on the page, so it is unprovable here whether Saturday/Sunday 16:55 marks are generated. No graded row hits this (8/28-pm fills before the Friday mark; 9/7-pm's Monday mark is same-session; 9/8-pm fills after Tuesday's mark and breaks at 17:05), but an *ungraded* post-Friday-mark fill would join its DAY_CLOSE to the first mark at/after the fill — a Saturday 16:55 mark if weekend dates are generated, else Monday's. Add one S1 assert enumerating generated marks across the window including weekend dates, and one P43 grading sentence: a post-Friday-mark fill joined to a weekend mark (if present) grades boundary-conformant under the F3 mark-range attribution (per P42's run-end boundary clause), never unpredicted. Zero bytes.

- **Kimi-D3 (P32(d) comment literal, packet L32): cosmetic tightening, optional.** The comment sentence "the first bar at/after the first 16:55-ET mark at/after the fill exits every managed trade" is loose against the operative semantics (exit priced at nextOpenPx of the first *qualifying evaluation*, stated correctly two lines later in the same literal). No change needed for correctness; flag only so the comment is not quoted back later as the rule. Operator's call.

Analytic ask A — every defect/gap/imprecision seen on the page:

1. **Weekend-mark presence/absence not provable from the page** (P17, DAYDEF pull truncated before the loop increment). Impact confined to ungraded Friday-evening fills; handled as Kimi-D2.
2. **Timebase of the vDAY comparison scattered across three packet regions** (P17, L32(d), S1 at L36). Sound but unstated in one place; Kimi-D1.
3. **S1 census-tie assert missing.** F1's comment (L28) makes disk claims about TPCENSUS walk order (L2391/L2402) and LAST-equal naming via overwrite (L2413) diverging from booking's FIRST-equal (L2246). G2 grades winner==booked by value so this cannot fail a gate, but S1 asserts pin every other disk claim of this class (L2246 strict-less-than IS pinned) — the census overwrite behavior deserves the same pin so a future census edit can't silently break the recorded-not-failed divergence. Assert-level, zero bytes.
4. **(d) scan cost is O(dayN) per bar with an unconsumed early-exit** (L32). dayN≤16 makes this trivial; noted only because "early-break scan" sits in the parks list — the park is correct.
5. **Constant-false HTF leg under F2** (L16, L36): unreachable-code disposition recorded as DIAGNOSE at S1/S4 — adequate; just confirming the page carries it and no warning-grade surprise is pending beyond that.
6. **EXITVERDICT non-exhaustive for vDAY** (P21/L21): the header's "census logs ALL verdicts" property is knowingly narrowed and the substitution to MTEXIT/MTLIFE is mandatory and stated. Not a defect; recorded so no later seat re-raises it.
7. **Enum comma (a) and 5-for-4 arms (f)** (L32): both internally consistent with the +12 budget; verified arithmetically — (a)+1, (b)+1, (c)0, (d)+8, (e)0, (f)+1, (g)+1 = +12; 11248 − 24 (F1 39→15) + 0 (F2 4-for-4) + 12 = **11236**, matching G1's prediction. No defect; confirmed.
8. **G3's seven-row precondition set matches the J-row pulls verbatim** (regimes, directions, tp values J01–J07). Consistent; no defect.
9. **Tie semantics split between booking and census** (L28): booking keeps session on exact ties (session evaluates first, TpTargetUpdateBest strict-less-than first-wins L2246); census names POI (LAST-equal overwrite L2413). The packet discloses this, grades by value, and records the divergence — correct handling; item 3 above is the only gap (no S1 pin).

Analytic ask B — better mechanism for the stated goal:

- None required. The chosen mechanisms (single unified race through TpTargetUpdateBest for F1; first-hit ascending-mark scan with priority-gated vDAY for F3) are the right ones at this scale.
- The only mechanism I would rank higher for F3 — a precomputed next-mark cursor latched at fill — is already in the parks list ("precomputed mark"), touches only the (d) insertion site (EA ~L11188), and is not worth the added fill-time state at dayN≤16. Park stands.
- One mechanism I would *not* take: skipping weekend marks at generation (EA L10338-L10355). It is cleaner grading-wise, but that array also feeds the news blackout census, so touching it is outside this packet's scope. The in-scope answer is exactly what the packet does (first-hit join) plus the Kimi-D2 grading language.
- For F1, no better mechanism exists short of BOOKCENSUS/stored-mark helpers, both correctly parked.

Key: none volunteered (not the key seat; dual-key needs Luna).

Filed as Kimi AMEND-WITH-DELTA on PACKET_P-EXITMODEL-2 v10, one build plus one run under the RECON51 envelope, G1–G4 graded as stated, deltas D1–D3 above. No clearance is or can be issued by this seat.

## KIMI-V225 (v224 transport return, AMEND-WITH-DELTA, no key, pasted 2026-09-21, whole)

Verdict first, then the two analytic asks. I ruled on the page only — quoted spans, counts, and logic inside this document. Nothing here builds, runs, or spends anything. No key is volunteered (none exists from this seat; Luna remains the sole key source).

**VERDICT: AMEND-WITH-DELTA** (one delta, non-blocking; everything else ACCEPT)

**Delta D1 — pin the `dayN==16` hard precondition to the loop's actual boundary semantics (P36 S1 assert; P42 G3 hard preconditions; G-RULES G3).**

The packet quotes the mark generator itself (R-DAYDEF, EA L10330–L10342):

```
datetime cur = TC_DayStart(SRJ_PILOT_FROM);
while(cur < SRJ_PILOT_TO && g_news_dayN < 32)
```

That loop is strict-less-than on `SRJ_PILOT_TO`, stepping one mark per calendar date starting at `TC_DayStart(FROM)`. Under the envelope as worded ("08-26 to 09-10 window", P36/P42):

- If `SRJ_PILOT_TO` denotes **end of 09-10** (i.e., 2026.09.11 00:00 or an inclusive end-of-day), dates 08-26…09-10 inclusive = **16 marks**, and `dayN==16` holds.
- If `SRJ_PILOT_TO` denotes **2026.09.10 00:00** (an exclusive open-of-last-day, a common pilot-range convention), dates 08-26…09-09 = **15 marks**, and the S1 assert `dayN==16` fails → DIAGNOSE, and the G3 hard precondition `dayN==16` fails → FAIL G3/G4 — for a boundary-convention reason, not a code defect.

P36 already says "envelope 08-26 to 09-10 holds 16 dates so dayN==16 expected" — that sentence assumes the inclusive reading. One clause resolves it: state explicitly whether `SRJ_PILOT_TO` is exclusive-open or inclusive-end for this envelope, and make the S1 assert and the G3 precondition read `dayN==15` or `dayN==16` accordingly. This is a one-line prose pin (zero bytes of code); if the disk answer is 16 under the actual `SRJ_PILOT_TO`, no text change is even owed — the pin only prevents a false S1 halt / false G3 failure. Alternatively the S1 assert may be reworded to "dayN == expected count derived from TO semantics" and let the run record the observed value as evidence. Either arm is acceptable; the page as written risks grading against an unproven boundary convention.

Everything else on the page is internally consistent. Spot-verified arithmetic and logic:

- **F1 budget**: R-F1OLD quoted whole = 39 non-blank lines (I recount 39/39: 10 comment + anchorRank + famBest/haveFam decls + 7-line POI loop + 3-line haveFam arm + 6-line session walk + 5-line fallback comment + 2 braces... enumerating the quoted span line-by-line gives 39). New F1 = 1 comment + 1 anchorRank + 6 session-loop + 7 POI-loop = 15. Net **−24** ✓.
- **F3 budget**: (a) comma +1, (b) +1, (c) 0, (d) 8 (comment, if, `{`, for, `{`, condition line, `}`, `}`), (e) 1-for-1, (f) 5-for-4 +1, (g) 4-for-3 +1 = **+12** ✓. F2 net 0 ✓. Predicted 11248 − 24 + 12 = **11236** ✓.
- **(d) gating** `!vSL && !vTP && !vBREAK && !vHTF && g_news_init` is exactly the priority order the header states (HTF beats DAY_CLOSE on shared bars when re-enabled; SL/TP/BREAK ahead) ✓. vDAY as priority-gated probe, not independent, consistent with (e) gate and P21 ✓.
- **Mark-join logic**: `fillBarTime <= mark <= barTime` with strictly ascending marks and early break gives "first mark at/after fill, first bar at/after mark" ✓. 9/8 17:00 fill: same-day mark 16:55 < fillBarTime → ineligible; 17:05 BREAK precedes next (9/9) mark ✓ (P42 pin is derivable from (d), good). Friday 16:55-bar fill carries `fillBarTime == mark` ✓. Weekend marks generated (R-DAYDEF loop has no dow filter; only `friMarks` is Friday-filtered) → Saturday clause consistent with the quoted code ✓.
- **Timebase homogeneity (Kimi-D1)**: fillBarTime = forming-bar open via `iTime(0)` (server clock), dayMarks via `TC_ZoneToServer(..., TZ_NEWYORK)` (server clock), evaluation barTime from the closed-bar cadence (server clock) — the `<=` chain is dimensionally sound as stated ✓.
- **Enum (a)**: comma on `= 7` plus `MT_EXIT_DAY_CLOSE = 8` with no trailing comma is valid MQL5; the S1 consumer audit (no 0..7 loops, no reason-indexed tables, renders only via MtExitName) covers the new value ✓.
- **Tie semantics**: booking keeps FIRST-equal via strict-less-than at L2246 with session loop before POI loop in the new F1; census names LAST-equal via POI overwrite at L2413 after session-then-POI walk (L2391/L2402). Same value, different name — recorded-not-failed, and G2 grades by value ✓. The J09 discriminator (TPCENSUS close 1.16134 ≠ J04 entry 1.16135) is internally consistent with "admission row prints close == MTSNAP entry; S2POLL rows print iClose and are diagnostic" ✓.
- **Rollback framing (F2)**: the toggle kills only the (e) leg (L11165–L11187, sole consumer L11168, sole emitter L11184 inside the branch); F1/F3 stay installed — the "one-line re-enable restores the flip leg only" claim matches the code layout as quoted ✓.
- **EXITVERDICT narrowing**: vDAY travels via MtExitName only into MTEXIT/MTLIFE; the L11189 print stays format-frozen and intentionally non-exhaustive — a conscious observability substitution, recorded in P21 and G3 ✓.
- **vDECL fold**: vDAY added to the existing bool declaration line, net 0, and the 4-line decl block stays 4 lines ✓.

**ANALYTIC A — every defect, gap, or imprecision on the page (freely numbered; all non-blocking except D1 above):**

1. **(P36, P42, G-RULES G3; R-DAYDEF L10330–L10342)** — the D1 boundary-convention gap above. Only item I would file as a delta.
2. **(P15/P28 vs L2391/L2402/L2413)** — census NAME vs booking tie-name divergence: recorded-not-failed, correct as graded, but it is a live trap for any future consumer that keys attribution on the census name rather than the value. One half-sentence in P15 warning "no downstream join may key on winner name at exact ties" would close it permanently. Zero bytes.
3. **(P32 (d))** — the mark scan is O(dayN) per bar per managed trade. At dayN ≤ 32 this is noise, the early-break keeps it at first-hit, and the better mechanisms are already parked. Not a defect; noting it so the parked list stays justified: the scan is only worth replacing if dayN cap ever grows or many trades stay open simultaneously across marks.
4. **(P32 (b))** — `case MT_EXIT_DAY_CLOSE:   return "DAY_CLOSE";` return-column does not align with the REPLACED case above it (MT_EXIT_REPLACED is the longest label). Cosmetic only; zero behavioral effect; exact-diff gating means it ships as-quoted, which is fine.
5. **(P21/P32, L11189)** — EXITVERDICT non-exhaustive for vDAY: correctly recorded as mandatory substitution, but the operator should be aware that on bars where vDAY fires *together with* a higher-priority verdict, the frozen print will show the higher-priority verdict and no trace of vDAY on that bar; the mark-join in MTEXIT/MTLIFE is the only record. Already covered by "priority-gated probe," stated for completeness.
6. **(P17 semantic sentence)** — "no trade survives past the first mark at/after its fill" is exact only "under per-bar evaluation and g_news_init true," as the packet itself immediately qualifies. The qualification is load-bearing (a mark falling inside a bar whose evaluation is somehow skipped — e.g., a terminal restart — shifts exit to the next evaluation). Fine as worded; flagged so no one quotes the sentence without its qualifier.
7. **(P36 S1 v11 "two booking call sites")** — the S2POLL-vs-admission discriminator rests on `close == MTSNAP entry`, which holds because admission is next-open (L10066). If a future entry model ever produces intra-bar or non-next-open fills, the discriminator silently degrades. Not actionable today; one more clause in the parked list would future-proof it.
8. **(P42 8/28 10:05 prediction)** — "BREAK path unchanged" is conditional on booking not moving the exit earlier (a nearer F1 target could TP-touch before 11:40; a farther one could let it survive to the 16:55 mark and exit DAY_CLOSE instead of BREAK). The packet handles this via G2 exemption and G3's conditional phrasing, but the G3 line as written ("BREAK path unchanged") is a shorthand — the operative prediction is "BREAK at the same bar unless F1 target change alters TP-touch timing, else DAY_CLOSE at the mark." Readable as intended; no edit owed.

**ANALYTIC B — better mechanism for the stated goal (analytic only; respects the standing parks):**

The stated goal is "exit every managed trade at the first mark at/after fill, priced nextOpenPx, priority below SL/TP/BREAK/HTF." The (d) block recomputes eligibility by scanning all marks each bar. The strictly-better mechanism — a **persistent per-trade next-mark cursor** — is precisely the parked "precomputed mark" alternative, so I do not propose building it; I state it only to record that the park is the right call and why:

- Add `int nextMarkIdx` to the MTRADE struct (fill site EA L10062–L10068): at admission, walk `g_news_dayMarks` once to the first index with `mark >= fillBarTime` (O(dayN) once per trade, not per bar).
- Replace the (d) loop with a single comparison per evaluation bar: `vDAY = (nextMarkIdx < g_news_dayN && g_news_dayMarks[nextMarkIdx] <= barTime);` — and optionally advance the cursor.
- Lines touched: MTRADE struct + fill (~L10062–L10068), the (d) block (P32), nothing else. Priority gating, EXITVERDICT freeze, and census joins untouched.

Equivalence proof obligation would be: same first-qualifying-mark semantics because marks are strictly ascending (already S1-asserted). Cost: one struct field + one admission walk; benefit: O(1) per bar and removal of the dayN≤32 scan dependency. Verdict: correctly parked — at dayN ≤ 16–32 and one managed trade at a time, the scan is free, and the cursor adds a struct-field persistence obligation (REPLACED/CANCEL_BIAS successor bookkeeping at L10050/L11070 would have to carry or invalidate it) that outweighs its gain. The packet's (d) is the right mechanism at this scale. No code recommended.

**Filing note:** verdict files under V225 markers (V224 markers hold this v223 round). Delta D1 is prose-only (zero bytes); if Luna's key seat rules the disk reading as 16 under the actual `SRJ_PILOT_TO`, D1 can be marked satisfied-by-assertion with no text change. No key from this seat.

## KIMI-V226 (v225 transport return, ACCEPT, no key, pasted 2026-09-21, whole)

# VERDICT: ACCEPT (Kimi seat) — no key volunteered

One build plus one run under the stated envelope, G1–G4 graded as stated. This accept is one seat only; per standing rule, dual-key clearance needs Luna's key, and nothing here builds, runs, or spends. Disk genuineness (digests, counts, builds) is proven on his machine and is not answerable from chat.

Page checks I ran mechanically before ruling, all of which PASS:

- **F1 old-block count (P28):** the quoted R-F1OLD verbatim is exactly 39 non-blank lines — matches the "39/39 machine recount" claim the budget rests on. New assembled F1 = 15 lines (1 comment + 1 anchorRank + 6 session loop + 7 POI loop). Net −24. ✓
- **F2 (P30):** 4-for-4, net 0. ✓
- **F3 (P32):** (a) comma net 0 + new enum entry +1; (b) +1; (c) 1-for-1 net 0; (d) = 8 lines exactly as counted from the spans; (e) 1-for-1 net 0; (f) 5-for-4 +1; (g) 4-for-3 +1. F3 net +12. ✓
- **Budget chain (P40):** 11248 − 24 + 0 + 12 = 11236. ✓
- **dayN correction (P03, P36):** envelope 08-26 through 09-09 inclusive under the TO literal D'2026.09.10 00:00 exclusive-open = 15 dates. The v11→v12 correction 16→15 is arithmetically right; the v11 date-count sentence is properly withdrawn with three-seat credit. ✓
- **Admission-row discriminator (P28) on the quoted J-rows:** J09 close=1.16134 ≠ J04 entry=1.16135 → J09 is the S2POLL diagnostic, admission row is the close==entry one. Consistent with the serial-order collision fallback. ✓
- **(d) chain logic (P17/P32):** `fillBarTime <= mark <= barTime` reproduces every stated edge — 9/8 17:00 fill (fillBarTime 17:00 > 16:55 mark → same-date mark ineligible, 17:05 BREAK preserved by time); 16:55-bar fill (fillBarTime == mark, consumed at first evaluation); post-Friday fill joins the Saturday mark (ascending marks, first-hit break picks the earliest). ✓
- **Priority consistency (P32/P17):** (d) gates on `!vSL && !vTP && !vBREAK && !vHTF && g_news_init`; (f) arms SL→TP→BREAK→HTF→DAY_CLOSE; (g) header lists HTF before DAY_CLOSE. Flip-re-enabled behavior (HTF beats DAY_CLOSE on shared bars) is consistent across all three sites. ✓
- **V225 folds verified present:** Luna-A1 causal qual-3 (P41), A2/A3 + GLM-D3 collision fallback (P28), A5 nextOpenPx validity (P43), A6/A10 model-R terminology (P43), A7 weekend semantic (P42), A8 run-end narrowing (P42), A11 conjunction (P41); GLM-D1 operand pin (P28), D2 insertion-side pin (P32), D4 9/4 carve-out (P43), D5 REPLACED carve-out (P42), D6 optional gap record (P43), A7a/A7b pins (P36); Kimi-D1 satisfied by the 15-pin (P03/P36), Kimi-A2 name-warning (P15), Kimi-A7 parked; Sonnet POI-liveness answered (P15 — POI win frequency non-increasing vs old fork is correct: old fork POI won outright whenever any eligible POI existed; unified race POI wins only when nearest). ✓

## Analytic ask A — every defect/gap/imprecision I see on the page

All non-blocking; none rises to amend-with-delta. Each is either already ruled in the folded deltas or self-disambiguating in the packet text.

1. **P36 S1 parenthetical vs S5 split (wording overlap, not contradiction).** The S1 day-marks assert parenthetically includes "dayN==15," while the v11-adds sentence below moves runtime readiness (g_news_init, dayN, ascending) to S5/pre-G3 per Luna-2. Both mention dayN==15. Reading: S1 asserts the *static envelope expectation* (source construction, 15 dates derivable from the FROM/TO literals); S5 asserts the *runtime value*. The layering is deliberate (Luna-2 V224), but a future reader could trip on the double appearance. Cosmetic.
2. **P42 09:20 arm contender list is illustrative, not exhaustive.** J09 shows PMH:24, which sits between LOH (9) and AS.H (66) in distance. The arm's own clause — "nearest-valid-wins operative for unnamed nearer lines" — plus the v216 D6 non-exhaustive-sets ruling cover this, but the parenthetical naming only {AS.H, LOH} could mislead a builder into treating it as the full set. Worth one conscious read at grading time; no text change required.
3. **P42 09:20 arm lacks the DAY_CLOSE-survival branch the 16:45 arm states.** If the 09:20 admission lives, books a nearer target, and no higher-priority verdict fires by the 16:55 mark, the universal leg exits it DAY_CLOSE. P17's "no trade survives past the first mark at/after its fill" plus non-exhaustive-sets cover it; the asymmetry is stylistic.
4. **No other arithmetic or logic defects found.** Tie-name divergence (census LAST-equal POI-overwrite vs booking FIRST-equal session, P28/P15) is disk-stated and graded by value with the A2 name-warning; EXITVERDICT vDAY non-exhaustiveness is recorded-not-folded (Luna-A9); anchor-collision provenance is recorded-not-assumed (Luna-A3).

## Analytic ask B — better mechanism for the stated goal

None required; the shipped mechanism is sound and the genuine optimizations are already parked by name with reasons. For the record:

- **Loop-start pin (GLM-B, parked):** replace the 0-base per-bar scan with a per-trade next-mark index computed at admission. Touches: admission site (~L10062–L10068) plus the (d) insert at L11188. Current cost is O(dayN=15) per bar per trade — negligible; the pin adds state without adding correctness.
- **Mark-bar-close figure (parked, his veto):** recording the 16:55-bar close instead of nextOpenPx would match the trigger instant more literally, but nextOpenPx is the established convention (BREAK/HTF arms, E2 closure) and the packet correctly grades equality to the L11047–L11048 derived figure (Luna-A5). The mark-bar-close R is already recorded-not-graded per GLM-D6.

**Key: none volunteered** — keys come only from the key seat.

Filed whole, 1×, under V226 markers per the seat packaging rule.

## KIMI-V228 (v227 transport return, AMEND-WITH-DELTA, no key, pasted 2026-09-22, whole)

**VERDICT — PACKET_P-VALIDITY-1 v2 — Kimi seat — [V228 marker]**

**AMEND-WITH-DELTA.** Four deltas, all foldable pre-build without touching scope (three are inside E5's own insertion block or are S1/S3 text asserts; D1 is a single character). No keys volunteered. No checkable discrepancy found, so no halt. Nothing here builds, runs, or spends.

---

## Deltas

**D1 (substantive, one char) — E5 seed-bar exemption leaves his own sentence 3 unimplemented on the retest bar.**
Packet Q18/Q33, E5 block line 2: `barTime > g_anchorBarTime` → `barTime >= g_anchorBarTime`.

His ledger-557 words rule on three events: swept extremes deleted by absorption; entry POI needs a fresh POC/VWAP touch; **a valid retest hit by session liquidity before 5m retracement + confirmation needs another retest.** Sentence 3's subject is the retest bar itself — and the seed bar IS the retest bar (DetectPoiRetest fires on it). The exemption means a retest bar whose wick sweeps one of the 18 keeps its seed alive, and the next bar's R2 tests the *next* bar's wick (barShift+1 lines, current-bar wick), so that hit never surfaces. The stated false-fire rationale doesn't apply: the touch test already reads `barShift + 1` (pre-bar settled state), so the seed bar's own line updates cannot trip it. The exemption is conservatism, not mechanism.

Enabling S1 assert (new): **no seed-assignment path (DetectPoiRetest seeding) appears after the R2 block in file order.** If that assert fails, keep `>` and record the same-bar hole as operator-accepted — his scope word, not a defect either way. Also update E5's comment line ("seed bar exempt via g_anchorBarTime" → "seed bar tested against pre-bar state").

**D2 (log completeness, free inside the insertion) — SEEDVOID row cannot satisfy G2's own join key.**
Q33 print line: G2 (Q43) grades attribution on join key **(bar, direction, buffer index, value)**; the row prints bar + value only. Add `int r2_buf = -1;` next to `r2_val`, capture `r2_buf = r2_bufs[r2_k];` in the hit branch, extend the PrintFormat with direction and buffer index (+2 lines inside E5's 24; zero anchor cost). Without this, G2's SEEDVOID attribution is ungradeable as written.

**D3 (budget units) — Q30 vs Q42 arithmetic mismatch.**
Q30 appends E2 statements **on the same line** (+0 lines, +bytes) and claims "net +4"; Q42 budgets Sessions at +68 (64+4). A line-count budget cannot absorb a same-line append. Define S3 arithmetic explicitly as: State +8 inserted; Sessions **+64 inserted, +4 modified**; FlowLogic +8 inserted; EA **+24 inserted, +1 modified** (E1b). Otherwise S3 will DIAGNOSE on its own literal counts.

**D4 (S1 assert additions, text only):**
(i) the file-order seed-assignment assert from D1; (ii) sweep-tag vocabulary extension (pAS/pLD/pNY/pPM) is anticipated **inside the existing SESSION_LIMIT family rows** — assert the seven-family taxonomy unchanged and no eighth family appears (E3's tags enter a printed row somewhere; families are row types, values may extend, format may not); (iii) multi-line same-bar touch → one SEEDVOID row reporting the **first hit in R-POOL order** — G2 attribution note so a multi-touch bar is not read as a missing kill.

## Concurrence recorded (independent re-derivation, not mere adoption)

- **Kimi-D2 ruling verified by hand.** M05 raw 4869 = bits {12,9,8,2,0} + live 0010 (LSB-first: char0=bit10) → NY live-excluded at consumption; B05 booking YNYH:9 over nearer NYH:21 confirms NYH was not a live candidate. M01 raw 2824 = {3,8,9}+{11} → London live-excluded; B01 booking YPML:7 over LOL:37 confirms. Same error class both bars: swept-clear read as valid. Ruling stands; credit the probe.
- **Kimi-A1 dissolved.** LSB-first print reconstructs all seven masks exactly (spot-checked M01, M04, M05, M07 against the swept/live strings).
- **No-walk-past latch** confirmed on the B03 (R 0.99 latched with YASL:206 admitted behind) / B04 (R 0.62 with ASH:65 behind) pattern — single-winner race; folded G4 precision is correct.
- **G4 chains re-derived:** 9/7 NY: YNYH drop → Yearly-VWAP 54/23 = R 2.35 (stated 2.34, his-line precision) ✓. 9/7 London: YPMH drop → ASH:65, 65/37 = R 1.76 ✓ with pdAsia-clear condition correctly guarding the ASH branch. 9/8 NY: PML/YPML/YNYL triple-drop chain → YLOL, conditional as stated ✓. E2 rotation pairing verified against R-RESET mirror pattern (Asia←cache PM, London←cache Asia, NY←cache London, PM←cache NY) ✓. Bit mapping 10..17→14..21 verified three ways (R-POOL, R-FILTER, E4) ✓. E6 zero-change assert is correct: the consumer at L10907–10914 reads the same buffer-29 mask through the same filter — PD exclusions flow with no EA logic change, which is the whole point of V1 ✓.

## Analytic ask A — every defect/gap/imprecision on the page

- **A-1 = D1** (the only substantive one).
- **A-2 = D2** (join fields).
- **A-3 = D3** (budget units).
- **A-4** — Q45 8/28 London understates its precondition chain. The PDL restoration needs **three** events before 10:00, not one: pdPmLow (bit21, drops YPML:7), pdLondonLow (bit17, drops YLOL:37) — LOL:37 itself is already live-excluded per M01-bit11 — then the 102-pt tie resolves PDL over NYL/YNYL by earliest sessbufs index. "Conditional in-zone" hides two conditions. State them; the run will grade the chain either way.
- **A-5** — Q17 "nearest-VALID then skips to live lines" is wrong wording: it skips to the next-nearest **valid line, live or prev-day** (G4's own predictions rely on prev-day winners: ASH, YNYH-class). One-word-class fix.
- **A-6** — Designed asymmetry, record it: R2's touch is inclusive **without** liquiditySweepBuffer, while V1's exclusions use wick-through-plus-buffer. Coherent with his "hit" (sentence 3) vs "swept" (sentence 1) wording — but it should sit in the result file as a stated design fact, not be discovered there.
- **A-7** — Q3 "8 swept-field decls" is ambiguous: State *gains* 8, holding 18 swept flags post-build. S1's contiguity assert covers it; fix the word anyway.
- **A-8** — Mechanism note (not a defect): with D1 declined, a seed-bar sweep surfaces only if the *following* bar also sweeps a line — the exemption makes sentence 3 cross-bar-only by construction.

## Analytic ask B — better mechanisms for the stated goal

- **B-1 (= D1):** `>=` plus the existing `barShift+1` read is strictly better than the exemption — covers the retest bar, no false-fire possible, one char.
- **B-2:** A table-driven E3 (parallel arrays of cache/flag/tag + loop) would collapse 64 lines to ~14, but MQL5 has no member pointers — flag assignment would need an index switch, and exact-diff byte anchors get *harder*, not easier. The eight explicit blocks mirroring DETECT are the right call. Not recommended.
- **B-3:** The obvious alternative — void to a STALE pseudo-state and re-validate at the confirmation gate — is strictly worse: it touches the state machine, invents a non-named state, and breaks the S1 contiguity assert. Standalone single-pass void before the body is the better mechanism; D1 makes it complete.
- **B-4 (optional):** print the FL_BUF_ *name* (const string table beside r2_bufs) instead of the raw index in the SEEDVOID row — G2 joins read cleaner. Cost-free inside the insertion.

---

— End of verdict, Kimi seat, [V228 marker]. Carried whole, 1x, for his file.

## KIMI-V227 (v226 transport return, AMEND-WITH-DELTA, no key, pasted 2026-09-22, whole)

# VERDICT: AMEND-WITH-DELTA

Clearance for exactly one build (E1–E5, STAGE-1 exact-diff gated) plus one run under the RECON52 envelope is granted **by name — PACKET_P-VALIDITY-1 v1 — conditional on three deltas filed into the packet before issue** (D1–D3). D4–D6 may ride as graded notes or minor amendments; none of them blocks the build. Nothing in this verdict builds, runs, or spends. No key is volunteered by this seat (Kimi); per protocol, keys come only from the key seat.

What I verified clean on the page: the producer→consumer bit map (FlowLogic bits 14–21 ↔ FILTER sessIdx 10–17 → sweptBit 14–21, R-FILTER L2265–2267) is exactly consistent with the E4 literals and the POOL order (R-POOL); the E2 reset lifecycle is correct (each PD flag resets at the same site that overwrites its cache — Asia site/pdPm, London/pdAsia, NY/pdLondon, PM/pdNy, matching R-RESET L275–283); the E5 budget arithmetic checks (24 lines, matching G1's EA +24); the E4/E1 budgets check; the 9/4 New York goal-join is actually reachable (see A-note 5).

---

## Delta D1 (blocking): P27 line count vs P38 budget — checkable arithmetic

P27's PD-Asia-High literal is **8 lines** (comment, if, {, flag, sz, ArrayResize, tags, }), not 9: it omits the `double effAsiaHigh = ...` fallback line that makes the live pattern 9 lines (R-DETECT L365–373). Eight blocks × 8 = **+64**, plus E2 +8 = **Sessions +72**, not "+80" (P38 G1 budget) and not "9 lines each; net +72" (P27). A perfect S2 apply fails S3's own budget arithmetic by 8 lines. **Fix:** restate P27 as 8 lines each (+64) and P38 Sessions budget to +72 — or explicitly add a 9th (blank) line per block to the literal. Either is a one-line packet edit; no code change beyond what is filed.

## Delta D2 (blocking): P41 9/7 New York expectation is unreachable as written; 8/28 London has an unacknowledged intermediate latch

- **9/7 16:40 (B05/C05/M05):** entry 1.16261, SL 1.16238 → risk 23 pts. Candidates above entry: NYH:21 (R = 21/23 = **0.91 < 1.0**), YNYH:9 (R 0.39), Yearly-VWAP:54 (R 2.35). RECON52 evidence shows the pipeline latches TP_RR_FAIL at the nearest candidate with **no walk-past** (B03 latched at R 0.99 with YASL:206/R 1.20 still admitted behind it; B04 latched at R 0.62 with ASH:65/R 1.76 admitted). P21 locks the gate comparator and walk as UNCHANGED. M05 raw bits {12,9,8,2,0} — bit 6 (nyHighSwept) is **clear**, so NYH:21 is valid, and V1 adds only PD exclusions. Therefore: whether YNYH drops (pdNyHigh) or not, the nearest valid target implies R < 1.0 → latch fail → **no take at Yearly-VWAP is possible under the stated scope**. The chain only reaches Yearly-VWAP if NYH is excluded or the walk skips gate failures — both out of scope (P12/P21). **Fix:** restate P41 9/7 New York as "FAIL-latch at NYH R 0.91 (no take; residue stands)" or obtain his amendment widening the walk — which would be a scope change, not a validity change.
- **8/28 10:00 (B01/C01/M01):** risk 42 pts. C01 admits LOL:37 (R 0.88) and M01 raw bits {3,8,9,11} show bit 5 (londonLowSwept) clear — LOL:37 is valid. Even if PML/YPML:7 and YASL:11 all drop under V1, the latch fires at LOL:37 (R 0.88) long before PDL:102 (R 2.43). His bar proof (P11: "SWEPT 8/28 London") must mean the sweep postdates the 10:00 selection bar, or the PDL take cannot restore. **Fix:** state explicitly that LOL:37 latches R 0.88 and the PDL expectation holds only if the London-low sweep precedes selection; also state the 102-pt tie outcome (PDL vs NYL/YNYL at 102 — pool order favors PDL by earlier sessbufs index, but P41 doesn't say so).

## Delta D3 (blocking): P29 E5 touch test is trivially true on extension bars; placement leaves s1f_seedArmed stale

Two defects in the E5 literal as positioned:

1. **Live-line extension = spurious touch.** The session caches include the bar being evaluated ("g_s swept flags reflect bar i's processing", R-MASK comment; extremes update in the same pass). For any of the 10 live session lines, the buffer value at barShift ≥ the void bar's own wick extreme — so on any bar that sets a new session H/L, `r2_lo <= r2_v && r2_v <= r2_hi` holds by construction and the seed dies. That is far broader than the absorption intent (P07/P17: a line "swept even by wick"); it is "any bar extending any session line voids the seed," which in a trending market fires nearly every bar of an S1–S4 window and would make SEEDVOID volume — and kills of RECON52 takes — the dominant delta, contradicting P40's "deltas only downstream of restored takes" and straining G2's attribution. **Fix (preferred):** read the 10 live lines at **barShift+1** (pre-bar state; PD/prev lines are fixed so the slot is immaterial for them) so "touch" means the bar's wick reached a pre-existing line; a one-token change per ReadFlow call in the P29 literal. If his literal word stands as written, then P17 must state the extension semantics openly and G3 must be reworded "deltas downstream of takes changed by validity/renewal" (kills included).
2. **Stale local.** E5 inserts *after* L7657 (`s1f_seedArmed = (g_state == ST_IDLE)`). If the block voids to ST_IDLE and the L7659 branch re-seeds on the same bar (a fresh find — permitted, since the exemption keys on `g_anchorBarTime` reset to 0), the seed-bar-exactness flag was computed from the pre-void state. **Fix:** place the R2 block above L7657 or recompute the local after the block. S1 must re-pin the insertion anchor either way.

---

## Analytic ask A — remaining defects, gaps, imprecisions (line numbers)

1. **M-row print format does not decode to raw** (M01 raw 2824 = bits {3,8,9} vs printed swept field "0001000011" = {0,1,6} under either reading; M04 raw {8,9} vs printed {0,1}; M05 raw {0,2,8,9} vs printed {0,1,7,9}). Either the EA's SWEPTMASK printer uses a different bit order than the producer map, or the pulled field is a different variable. G2 attribution must join on raw `m` + the P38 bit map, never on the `swept=` text.
2. **Settled-slot lag between mask and census is unacknowledged in G2's join idiom:** C01 admits LOL:37 while M01 (same bar) has bit 5 clear, and C02 admits LOL:14 while M02 raw has bit 5 set — the EA reads the mask at the settled slot (R-MASK comment) while census walks current-bar lines. G2 must pin which slot attribution joins against or per-bar joins will mis-assign exclusions.
3. **E3 dual-fire:** when a live cache is NA (post-reset), the live block's fallback (R-DETECT L366 `effAsiaHigh`) and the PD block can both fire on the same bar/level, setting asiaHighSwept AND pdAsiaHighSwept → duplicate tags in thisBarSweeps ("pAS.H" then "AS.H"). Harmless for the mask (both bits exclude the same level), but G2's census attribution should count the exclusion once per level, and any thisBarSweeps-keyed downstream logic (fresh-veto family) should be asserted at S1 for tag-order sensitivity.
4. **G3 wording (P40):** "deltas only downstream of restored takes" cannot hold under V2 — a renewal kill of a RECON52 take is a delta downstream of a *lost* take. Reword as "downstream of takes changed by validity/renewal"; otherwise a correct run fails G3 on a technicality.
5. **Gap (favorable, for the record):** the 9/4 expectation is sound — at 15:55 price 1.16018 sits below YASL (1.16224) and YPML (1.16252, C03), so both were swept by path; after YLOL drops the nearest valid is YNYH:283 → R 1.655, matching P41. The packet never states this path argument; one sentence would harden G4.
6. **E5 pre-emption ordering:** the R2 block runs before the state-machine body (L7659+), so a bar that both touches a line and would confirm the seed (S4→S5) dies first. That matches P17's literal word, but it should be stated, since G3 grades MTEXIT/MTLIFE deltas.
7. **E6 has no literal** (P30) — acceptable under T161N, but S1's "halts into an E6 literal" means the packet can halt *after* clearance; worth one line acknowledging E6 is discovered, not filed.

## Analytic ask B — better mechanisms (with lines touched)

1. **Pre-bar line state for the void test** (Delta D3.1): `ReadFlow(r2_bufs[r2_k], r2_v, barShift+1)` for the 10 live entries in the P29 const-array loop; fixes the extension false-positive with zero structural change.
2. **Kill the mask-print ambiguity at the source:** change the EA's SWEPTMASK PrintFormat (the M-row site) to print raw hex plus decoded bit names from the P38 map; touches only the logger, makes G2 attribution self-joining.
3. **Single-source prev-session state (parked — out of scope):** the live session caches already hold yesterday's levels until the next rise (bits 8/9 persisting at 10:00, M01), so "live" and "prev" duplicate the same level in the race for hours each day. Resetting caches/swept flags at day boundary would make the 8 PD flags unnecessary — but it changes booking visibility, so it stays parked per P12.
4. **Seed-record snapshot:** capture the 18 line values into the seed struct at arm time and void only on touches of lines that predate the seed — stricter than P17's word; offered only if D3.1's pre-bar read still proves too permissive in grading.

---

**Filed as:** v226-round verdict, to file under **V227** markers, identical text carried to all four seats by the operator. Amend-with-delta; deltas D1–D3 are packet-line restatements only; the E1–E5 mechanism design, bit map, reset lifecycle, and gate arithmetic are otherwise sound. No key volunteered by Kimi.

## KIMI-V229 (v228 transport return, AMEND-WITH-DELTA, no key, pasted 2026-09-22, whole)

**VERDICT — PACKET_P-VALIDITY-1 v2 — Kimi seat — [V228 marker]**

**AMEND-WITH-DELTA.** Four deltas, all foldable pre-build without touching scope (three are inside E5's own insertion block or are S1/S3 text asserts; D1 is a single character). No keys volunteered. No checkable discrepancy found, so no halt. Nothing here builds, runs, or spends.

---

## Deltas

**D1 (substantive, one char) — E5 seed-bar exemption leaves his own sentence 3 unimplemented on the retest bar.**
Packet Q18/Q33, E5 block line 2: `barTime > g_anchorBarTime` → `barTime >= g_anchorBarTime`.

His ledger-557 words rule on three events: swept extremes deleted by absorption; entry POI needs a fresh POC/VWAP touch; **a valid retest hit by session liquidity before 5m retracement + confirmation needs another retest.** Sentence 3's subject is the retest bar itself — and the seed bar IS the retest bar (DetectPoiRetest fires on it). The exemption means a retest bar whose wick sweeps one of the 18 keeps its seed alive, and the next bar's R2 tests the *next* bar's wick (barShift+1 lines, current-bar wick), so that hit never surfaces. The stated false-fire rationale doesn't apply: the touch test already reads `barShift + 1` (pre-bar settled state), so the seed bar's own line updates cannot trip it. The exemption is conservatism, not mechanism.

Enabling S1 assert (new): **no seed-assignment path (DetectPoiRetest seeding) appears after the R2 block in file order.** If that assert fails, keep `>` and record the same-bar hole as operator-accepted — his scope word, not a defect either way. Also update E5's comment line ("seed bar exempt via g_anchorBarTime" → "seed bar tested against pre-bar state").

**D2 (log completeness, free inside the insertion) — SEEDVOID row cannot satisfy G2's own join key.**
Q33 print line: G2 (Q43) grades attribution on join key **(bar, direction, buffer index, value)**; the row prints bar + value only. Add `int r2_buf = -1;` next to `r2_val`, capture `r2_buf = r2_bufs[r2_k];` in the hit branch, extend the PrintFormat with direction and buffer index (+2 lines inside E5's 24; zero anchor cost). Without this, G2's SEEDVOID attribution is ungradeable as written.

**D3 (budget units) — Q30 vs Q42 arithmetic mismatch.**
Q30 appends E2 statements **on the same line** (+0 lines, +bytes) and claims "net +4"; Q42 budgets Sessions at +68 (64+4). A line-count budget cannot absorb a same-line append. Define S3 arithmetic explicitly as: State +8 inserted; Sessions **+64 inserted, +4 modified**; FlowLogic +8 inserted; EA **+24 inserted, +1 modified** (E1b). Otherwise S3 will DIAGNOSE on its own literal counts.

**D4 (S1 assert additions, text only):**
(i) the file-order seed-assignment assert from D1; (ii) sweep-tag vocabulary extension (pAS/pLD/pNY/pPM) is anticipated **inside the existing SESSION_LIMIT family rows** — assert the seven-family taxonomy unchanged and no eighth family appears (E3's tags enter a printed row somewhere; families are row types, values may extend, format may not); (iii) multi-line same-bar touch → one SEEDVOID row reporting the **first hit in R-POOL order** — G2 attribution note so a multi-touch bar is not read as a missing kill.

## Concurrence recorded (independent re-derivation, not mere adoption)

- **Kimi-D2 ruling verified by hand.** M05 raw 4869 = bits {12,9,8,2,0} + live 0010 (LSB-first: char0=bit10) → NY live-excluded at consumption; B05 booking YNYH:9 over nearer NYH:21 confirms NYH was not a live candidate. M01 raw 2824 = {3,8,9}+{11} → London live-excluded; B01 booking YPML:7 over LOL:37 confirms. Same error class both bars: swept-clear read as valid. Ruling stands; credit the probe.
- **Kimi-A1 dissolved.** LSB-first print reconstructs all seven masks exactly (spot-checked M01, M04, M05, M07 against the swept/live strings).
- **No-walk-past latch** confirmed on the B03 (R 0.99 latched with YASL:206 admitted behind) / B04 (R 0.62 with ASH:65 behind) pattern — single-winner race; folded G4 precision is correct.
- **G4 chains re-derived:** 9/7 NY: YNYH drop → Yearly-VWAP 54/23 = R 2.35 (stated 2.34, his-line precision) ✓. 9/7 London: YPMH drop → ASH:65, 65/37 = R 1.76 ✓ with pdAsia-clear condition correctly guarding the ASH branch. 9/8 NY: PML/YPML/YNYL triple-drop chain → YLOL, conditional as stated ✓. E2 rotation pairing verified against R-RESET mirror pattern (Asia←cache PM, London←cache Asia, NY←cache London, PM←cache NY) ✓. Bit mapping 10..17→14..21 verified three ways (R-POOL, R-FILTER, E4) ✓. E6 zero-change assert is correct: the consumer at L10907–10914 reads the same buffer-29 mask through the same filter — PD exclusions flow with no EA logic change, which is the whole point of V1 ✓.

## Analytic ask A — every defect/gap/imprecision on the page

- **A-1 = D1** (the only substantive one).
- **A-2 = D2** (join fields).
- **A-3 = D3** (budget units).
- **A-4** — Q45 8/28 London understates its precondition chain. The PDL restoration needs **three** events before 10:00, not one: pdPmLow (bit21, drops YPML:7), pdLondonLow (bit17, drops YLOL:37) — LOL:37 itself is already live-excluded per M01-bit11 — then the 102-pt tie resolves PDL over NYL/YNYL by earliest sessbufs index. "Conditional in-zone" hides two conditions. State them; the run will grade the chain either way.
- **A-5** — Q17 "nearest-VALID then skips to live lines" is wrong wording: it skips to the next-nearest **valid line, live or prev-day** (G4's own predictions rely on prev-day winners: ASH, YNYH-class). One-word-class fix.
- **A-6** — Designed asymmetry, record it: R2's touch is inclusive **without** liquiditySweepBuffer, while V1's exclusions use wick-through-plus-buffer. Coherent with his "hit" (sentence 3) vs "swept" (sentence 1) wording — but it should sit in the result file as a stated design fact, not be discovered there.
- **A-7** — Q3 "8 swept-field decls" is ambiguous: State *gains* 8, holding 18 swept flags post-build. S1's contiguity assert covers it; fix the word anyway.
- **A-8** — Mechanism note (not a defect): with D1 declined, a seed-bar sweep surfaces only if the *following* bar also sweeps a line — the exemption makes sentence 3 cross-bar-only by construction.

## Analytic ask B — better mechanisms for the stated goal

- **B-1 (= D1):** `>=` plus the existing `barShift+1` read is strictly better than the exemption — covers the retest bar, no false-fire possible, one char.
- **B-2:** A table-driven E3 (parallel arrays of cache/flag/tag + loop) would collapse 64 lines to ~14, but MQL5 has no member pointers — flag assignment would need an index switch, and exact-diff byte anchors get *harder*, not easier. The eight explicit blocks mirroring DETECT are the right call. Not recommended.
- **B-3:** The obvious alternative — void to a STALE pseudo-state and re-validate at the confirmation gate — is strictly worse: it touches the state machine, invents a non-named state, and breaks the S1 contiguity assert. Standalone single-pass void before the body is the better mechanism; D1 makes it complete.
- **B-4 (optional):** print the FL_BUF_ *name* (const string table beside r2_bufs) instead of the raw index in the SEEDVOID row — G2 joins read cleaner. Cost-free inside the insertion.

---

**Filed as:** v226-round verdict, to file under **V227** markers, identical text carried to all four seats by the operator. Amend-with-delta; deltas D1–D3 are packet-line restatements only; the E1–E5 mechanism design, bit map, reset lifecycle, and gate arithmetic are otherwise sound. No key volunteered by Kimi.

## KIMI-V230 (v229 transport return, AMEND-WITH-DELTA, no key, pasted 2026-09-22, whole)

## Verdict: AMEND-WITH-DELTA (one required verification delta; three minor folds). No key volunteered.

The page holds where it matters. I re-derived the load-bearing arithmetic and it reconciles: bit map 10..17 → 14..21 matches `TpSessionLevelFiltered` (`sessIdx + 4`) exactly against the R-POOL order; E2 reset sites match the cache-overwrite sites in R-RESET (PM cached at Asia-rising → pdPm resets at Asia site; NY cached at PM-rising → pdNy resets at PM site — the GLM-D1 page-proof correctly reads C01 `YNYL:102 == NYL:102`); R values check out (283/171=1.65, 297/171=1.74, 54/23=2.35, 102/42=2.43, 65/37=1.76); the 102-pt tie resolves to PDL by earliest sessbufs index (0 < 6 < 14); budgets reconcile (Sessions 8×8=64 new + 4 modified; EA 30 new + 1 modified; E5's own literal count is 30). But there is one genuinely unasserted execution-semantics hole, and it sits exactly where Kimi-D1 was folded.

---

## Required delta (blocking)

### 1. R2's execution cadence is nowhere asserted — and Kimi-D1's `>=` adoption silently depends on it (packet L18, L33, L38-S1)

E5 reads `iHigh/iLow(_Symbol, PERIOD_CURRENT, barShift)` — the **forming bar's range so far**. The touch test is only non-degenerate if the R2 block executes **intrabar**, on ticks after the current bar's wick has extended. The packet never states this. If the containing per-bar site runs once at bar open (consistent with "single pass per bar blocks same-bar re-admission," L18), then at execution time `r2_hi == r2_lo == open`, and:

- the adopted Kimi-D1 semantics ("seed bar covered too — the retest bar IS the retest subject," L18) is **vacuous**: the retest bar's own wick is never actually tested;
- a sweep occurring on the bar after seeding is caught only if R2 re-runs during that bar; if it waits for the next bar's open, the Luna-2 pre-bar mask skip (L33) has already excluded the freshly-swept line, and the touch is swallowed silently;
- and G2's "zero SEEDVOID occurrences is not a gate failure" (L43) then launders the whole failure mode — a never-firing mechanism and a non-exercised one produce identical logs.

**Required S1 assert (L38):** "assert the R2 block executes on every tick while the guard holds (`g_state > ST_IDLE && g_state < ST_S5_GATE_CHECK && g_anchorBarTime > 0`), not gated to new-bar; if the containing block is new-bar-gated, HALT and relocate R2 to a tick-driven site." This is verification-only, zero design change — but without it the mechanism's correctness is unprovable from the page.

---

## Minor folds (non-blocking)

**2. Mechanism-presence needs an audit trail when SEEDVOID count is zero (L43, L49, L38-S7).** "Mechanism present vs exercised distinguished" is asserted but not instrumented. Add a cheap counter (e.g., increment a diagnostic int inside the R2 guard, print in the result summary, or log an `R2EVAL` diagnostic row) so a zero-SEEDVOID run can still *prove* the touch test ran N times with a live range. Two lines inside E5, zero anchor cost.

**3. SEEDVOID's census family bucket is unnamed (L22, L33, L38-S1, G2).** G2 makes "zero unpredicted families" a hard gate against a seven-family taxonomy; the SEEDVOID row is a new row prefix. Map it explicitly to **SEEDDIAG** ("SEEDVOID is a SEEDDIAG-family diagnostic row") so the hard gate has a stated bucket and a result file can't be read as an eighth family either way.

**4. R2 voids on a pre-confirmation touch of the would-be TP line too (L18, L38-S7).** R2 fires on touch of *any* of the 18, including the line that would have been the take. That is the correct conservative reading of his sentence 3, but it should sit in the result file as a stated design fact next to the Kimi-A-6 asymmetry — not be discovered there.

**5. The void-trigger pool boundary is the packet's reading, not his verbatim word (L18).** "Session liquidity" is mapped to the 18 R-POOL lines only; Yearly/Monthly/Quarterly/FOMC POC/VWAP and POI are not void triggers. G4's 9/7 New York expectation (take at Yearly-VWAP 1.16315) *depends* on this — the seed survives a Yearly-VWAP touch. Record it as a stated assumption in S7 so a future "his sentence 3 meant all drawn liquidity" reading doesn't retroactively void this run.

**6. The r2 index→bit map is derived twice (L33 vs R-FILTER L2265-2266).** S1's byte-compare assert covers drift, so this is parked, not blocking — but note that a shared one-line helper (`SweptBitForPoolIndex`) would make the equality definitional rather than asserted. Exact-diff minimalism legitimately parks it; the assert is the right call at this stage.

---

## Analytic ask B — better mechanism

For the stated goal (one source of truth for "deleted by absorption," pre-bar semantics, no new state), Luna-B's mask-reuse prescription remains the right mechanism and E5 implements it span-for-span. The only mechanism change I'd advocate is **delta 1's consequence**: make R2's tick-driven execution an explicit property of the design (move it out of any new-bar gate if S1 finds one), because the pre-bar mask read + current-bar wick combination is *correct but only under intrabar execution* — the semantics and the cadence are one decision, and the page currently specifies only half of it. Rejected-by-me-and-parked alternatives, for the record: settle-bar wick testing (a sweep on bar N evaluated at bar N+1 is swallowed by Luna-2's own pre-bar exclusion — self-defeating); macro-generated E3 blocks (cleaner duplication control, violates exact-diff minimalism); `TpSessionLevelFiltered` reuse (already correctly rejected — it would exclude live lines R2 must keep).

---

## On the question asked

I cannot clear v4 by name as-is because of delta 1: not because the design is wrong, but because the page asserts twenty things about R2 and not the one that makes the other nineteen observable. Fold delta 1 into L38-S1, optionally folds 2-5, and the edit set is the cleanest version of this thread — I'd have nothing left to amend. Disk truth, hashes, and the four sites' symmetry remain his machine's proof, not mine. No key volunteered; nothing here builds, runs, or spends.

## KIMI-V232 (v231 transport return, ACCEPT, no key, pasted 2026-09-22, whole)

VERDICT: ACCEPT — clear PACKET_P-VALIDITY-1 v6 TEXT AMENDMENT by name for exactly one build plus one run under the stated envelope. No key volunteered (nothing checkable on the page failed; keys come only from the key seat). File this round under V232 markers.

Why the amendment is sound, against the byte-exact pulls on the page:

1. The reworded cadence asserts (L18, L38) now describe the disk that is actually proven on the page. OnTick (L11218–11235) early-returns unless bar-1 time changed and calls EvaluateClosedBar(1, currentBarTime) once per new bar; the signature at L6587 makes barShift the just-closed bar (finalized wick) and barShift+1 the settled pre-bar. The R2 code reads iHigh/iLow at barShift and ReadFlow(..., barShift+1) — every cadence-dependent statement in the reworded L18/L38 matches this exactly. The old tick-cadence demand was indeed unsatisfiable in this tree; the new assert ("site left that path = HALT") is checkable at S1.

2. Placement claim verified: R2SITE (L7693–7708) shows the seed assign ending at L7706, blank L7707, recorder comment L7708 — the E5 insert point is genuinely after the per-bar seed block and before the state-machine body, so "retest bar IS the retest subject" and single-pass-per-bar hold by construction. The s1f readers at L7777–7778 sit after the insert, consistent with "readers diagnostic-only."

3. The swept-bit map claim verified: R2's `r2_sweptBit = (r2_k <= 9 ? r2_k : r2_k + 4)` is byte-equal to R-FILTER (L2261–2275) for all 18 indices, and r2_bufs order is byte-equal to R-POOL (L2282–2292). The rejection-not-reused reasoning (live-bit rejection differs) is correct on the shown code.

4. The mask-domain predicate (MathIsValidNumber + integral + [0, 4194304)) is arithmetically right for bits 0..21, and R-MASK (L1371–1392) confirms bits 14..21 are unset pre-build, so the tri-state (valid mask excludes / invalid mask = R2SKIP hold) has real content.

5. The reset-rotation in E2 is consistent with the pulls: Asia-rising overwrites prevPM (R-RESET L275–283) and gains the pdPm reset; PMSITE (L302–310) confirms PM-rising overwrites prevNY and gains the pdNy reset; the London/NY sites mirror. First-day NaN prev caches are guarded by SrjIsNa in every E3 block.

6. E6's assert-only span (L10907–L10914) reads the same buffer 29 through the same filter — PD-swept flows through it with zero change, as claimed.

7. Line-count check on E5: counting the verbatim lines in R33 gives exactly 34 (comment through closing brace), matching the budget (EA +34 new +1 modified; Sessions +64 new +4 modified; State +8; FlowLogic +8). The "30 stands; 34 counted" dissent disposition is arithmetically right.

8. The amendment is text-only as claimed: the folded lines (L1, L3, L13, L18, L22, L38-S1) contain no literals, and E1–E5 carry by reference to the 4x-accepted v5 twin. Per the verification split, digest-genuineness is not answerable from chat; ruling is on the page only, and the page is internally consistent.

ANALYTIC ASK A — every defect, gap, or imprecision I see on the page (all non-blocking; none is a checkable discrepancy against the pulls):

- L3 (R03): the sentence "Nothing builds or runs on this file." appears twice consecutively. Cosmetic duplication, predates v6 (v6 fixed only the L22 typo). Suggest a single instance next text touch.
- R33 (E5), R2SKIP row: `evals=%d` prints r2_evals before the `if(r2_mValid) r2_evals++;` increment, so an R2SKIP row reports the count of valid evaluations completed on prior bars, while a SEEDVOID row reports the count including the current bar. Semantics are defensible ("valid evaluations completed") but the two row families read the same counter at different phases of the same code path. Note-level imprecision; S7's "r2_evals max + per-row evals" grading should state which phase the counter is read at.
- L18/R18 (stated assumption, worth keeping visible): the void pool includes PDAY_HIGH/PDAY_LOW (indices 0–1), which are prev-day extremes, not per-session lines. His wording was "session highs/lows" and "session liquidity"; the packet reads the pool as "the 18 session/PD lines of R-POOL only" and labels this a stated assumption. Correctly labeled; flagging only so G2/G4 grading doesn't silently widen or narrow it.
- R33 vs V1 asymmetry (stated, not a defect): R2 touch is inclusive without buffer (`r2_lo <= r2_v && r2_v <= r2_hi`) while V1 sweep exclusion is wick-through-plus-buffer. S7 names this as his hit-vs-swept wording — internally consistent, but the result file must keep the two standards visibly separate or attribution joins will blur them.
- L18: "mask unavailable-or-invalid at barShift+1 = R2SKIP ... never silent all-unswept" — correct, but note the failure mode is sticky per bar while the guard holds (a degraded indicator holds seeds bar-after-bar with one diagnostic row per bar). That is the intended fail-open behavior; just confirm G2's "R2SKIP rows attributed by bar + evals" expects possibly many consecutive rows.
- L13: "Kimi-1 a/b/c/d ruled FALSE/FALSE/FALSE/MOOT" is a history claim, not re-checkable from the pulls given here (a/b/c premises aren't restated in v6). Non-blocking since the operative assert was replaced, not re-argued.
- R33: after SEEDVOID, g_dir is left set while state returns to ST_IDLE. The packet covers this ("assert no stale dir/anchor metadata authorizes seed/admission post-SEEDVOID") — the S1 assert is doing real work here; keep it in the gate list.

ANALYTIC ASK B — better mechanisms considered, with the lines they would touch:

- Reusing TpSessionLevelFiltered with a live-bit mask-out parameter instead of the hand-rolled r2 loop (touches EA L2261–2275 and the E5 block): rejected — the filter's live-bit rejection (bits 10–13) is exactly what R2 must NOT apply, and the page's reason is sound. Current duplication of the swept-bit map is the lesser cost.
- Reading the mask at barShift instead of barShift+1 (touches the E5 ReadFlow line): would be wrong for his rule — the current bar's own sweep would then self-exclude the line and a same-bar sweep would never void. The pre-bar read is the correct mechanism for "a sweep occurring on the current seed bar still counts."
- Placing R2 before the per-bar seed block (touches the E5 insert point at L7706–7708): would permit same-bar void-then-reseed, which his renewal word forbids. Current placement is the better mechanism.
- A dedicated heartbeat/seal buffer to disambiguate "mask unavailable" from "mask invalid" (touches FlowLogic L1371–1392 and the E5 tri-state): marginally cleaner than the tri-state, but it costs a new buffer, breaking the no-new-buffers constraint and the exact-diff budget. The tri-state + R2SKIP row + r2_evals cadence proof achieves the same auditability for zero bytes. Park, as the page does.

No amend-with-delta is needed: every item above is either cosmetic, a labeled assumption, or a grading-clarity note that S7/G2 already covers. Nothing here builds, runs, or spends; build and run wait on dual-key clear plus his run word plus token, and the v6 digest owes a new key post-clearance.

## KIMI-V231 (v230 transport return, ACCEPT, no key, pasted 2026-09-22, whole)

# VERDICT: ACCEPT

Clear **PACKET_P-VALIDITY-1 v5 by name** for exactly one build (E1, E1b, E2, E3, E4, E5 per the v5 literals, STAGE-1 exact-diff gated) plus one run under **RECON50_DEMO_USD using the RECON52 replay segment/acceptance baseline** (InpMode 1, 08-26 to 09-10, InpDebugLog=true, same terminal, 90-minute ceiling, DONE-file based), with **G1-G4 graded as stated**.

**Key: none volunteered.** Luna remains the sole key source. Rules-on-the-page ruling only; nothing here builds, runs, or spends.

---

## Independent re-verification performed this round

I did not rely on the builder's rulings; I re-derived the load-bearing items from the literals:

**1. E5 line count = 34, confirmed by hand enumeration (the Luna-1 class of dispute).** Counting the R33 literal top to bottom: comment(1), guard(2), `{`(3), r2_hi(4), r2_lo(5), r2_bufs(6), r2_touch(7), r2_val(8), r2_buf(9), r2_mask decl(10), ReadFlow-if(11), mValid(12), r2_m(13), static evals(14), R2SKIP print(15), evals-inc(16), for(17), `{`(18), r2_v(19), sweptBit(20), continue-if(21), touch-if(22), hit one-liner(23), `}`(24), if(r2_touch)(25), `{`(26), r2_prev(27), ST_IDLE(28), anchorLine(29), anchorBarTime(30), LogState(31), SEEDVOID print(32), `}`(33), `}`(34). The decomposition also reconciles against v4's 30: the loop-condition `&& r2_mValid` and the `r2_m` ternary are *modifications* of existing v4 lines, not insertions; the four true insertions are mValid, R2SKIP, eval-decl, eval-inc. 30+4 = 34, internally consistent with R33's own parenthetical, R38-S3, and R42.

**2. Mask domain bound is exact.** `4194304.0 = 2^22`; with the integral check, the largest admissible mask is 4194303 = bits 0..21 all set. EMPTY_VALUE (≈1.8e308) range-rejects, NaN fails MathIsValidNumber, negatives fail `>= 0.0`, non-integrals fail the floor test. The Luna-3 list is fully covered by one predicate (R33).

**3. Bit-map equality across all three sites, re-walked.** Producer (R-MASK): bits 0..9 = pdHigh..pmLow, 14..21 = pdAsia..pdPm. Filter (R-FILTER L2265-L2266): sessIdx 10..17 → sessIdx+4 = 14..21. R2 (R33): `r2_k <= 9 ? r2_k : r2_k + 4`. Identical. R2 never consults live bits 10..13 — swept-only rejection, correctly *not* reusing TpSessionLevelFiltered, which would also reject live lines.

**4. r2_bufs vs sessbufs ordering, index for index (0..17).** Exact match, same order as R-POOL. The fragile assumption holds.

**5. E2 reset/cache symmetry re-derived.** Asia-rising caches PM → pdPm resets at Asia site; London-rising caches Asia → pdAsia resets at London site; NY-rising caches London → pdLondon resets at NY site; PM-rising caches NY (R-PMSITE L305-306 quoted whole) → pdNy resets at PM site. Flags reset exactly where their underlying prev-line is overwritten. GLM-D1 stays dissolved; E2 rests on the four equal-value pairs plus the quoted PM-site.

**6. Budget arithmetic.** State +8, Sessions +64 new +4 modified (8 blocks × 8 lines, each block hand-counted), FlowLogic +8, EA +34 new +1 modified. Sums consistent with R42 and R38-S3.

**7. G4 expectation arithmetic under the corrected rounding convention.** 283/171=1.65 ✓; 297/171=1.74 ✓; 54/23=2.35 ✓ (was 2.34); 102/42=2.43 ✓; 65/37=1.76 ✓; 11/42=0.26 ✓; 137/54=2.54 ✓. The corrected conditional chains check against the C01/C04/C07 admitted walks as folded (8/28 London pdPmLow+pdAsiaLow with YASL:11 fallback; 9/7 London pdPmHigh+pdLondonLow with ASH idx2 beating YASH idx10 on the tie regardless of pdAsia; 9/8 NY pdPmLow+pdNyLow). M01 already shows bits 3 and 8 swept in the baseline, which is exactly why ASL:11 and PML:7 are absent from C01 — the walk rows and the mask rows corroborate each other.

**8. My own v230 deltas (Kimi-1..5), checked as folded.** Cadence assert with HALT+relocate (R38-S1) ✓; eval counter with decl/inc and S7 max+per-row reporting (R33, R49) ✓; SEEDDIAG bucket for SEEDVOID/R2SKIP (R22, G2) ✓; would-be-TP-line fact (S7) ✓; 18-line pool-boundary assumption (S7) ✓. Kimi-6 stays parked; the byte-compare assert is the right call under exact-diff minimalism.

No blocking defect survives. The edit set is the cleanest version of this thread.

---

## Analytic A — remaining defects, gaps, imprecisions (all non-blocking; none touches the edit set)

**A-1 (R33, R2SKIP print site; R38-S1, R43).** The R2SKIP row fires on *every tick* the guard holds while the mask is invalid — there is no per-bar dedup. SEEDVOID cannot repeat (the guard exits on void) but R2SKIP can print N rows per bar through a warmup-long invalid stretch. Grading is unaffected (G2 attributes by bar), and InpDebugLog=true bounds it to one 90-minute replay, so this is volume, not correctness. Optional delta: dedup to first-invalid-tick-per-bar. Absorbed as-is by G2 attribution.

**A-2 (R33, guard line 2).** Seed-ness is tested via `g_anchorBarTime > 0` only; `g_anchorLine >= 0` is not in the guard. Stale-metadata safety therefore rests on the S1 stale-authorization assert rather than the guard itself. The S1F idiom (R-S1F) shows the codebase testing both for seed-ness, so this is a deliberate-or-inherited asymmetry, not an error — but it is the one place where correctness depends on an assert rather than the literal. Absorbed by the existing S1 assert; no edit-set change proposed under exact-diff minimalism.

**A-3 (R49(e), S7).** "r2_evals proving evaluation cadence" is precise only for mValid bars: the counter increments solely on valid masks. Invalid-mask bars are proven by R2SKIP rows instead (InpDebugLog-gated). One S7 clause — "max r2_evals counts valid-mask evaluations; invalid-mask bars evidenced by R2SKIP rows" — removes a possible future misread of the summary. Wording only.

**A-4 (R45, 9/4 New York clause).** "pdNyHigh expected set pre-16:00" is looser than the mechanism requires: under the pre-bar read, the exclusion must be *settled in the mask at the admission bar* (i.e., swept by the close of the 15:50 bar for the 15:55 take). A pdNyHigh sweep occurring on the 15:55 bar itself would not exclude YNYH from that bar's election. Expectation-layer wording only; the pass rule is the deterministic recomputation, so no grade can flip on it.

That is the complete list. Each item lands in a gate that already exists (S1 / G2 / S7); none requires an edit-set change.

---

## Analytic B — better mechanism

None. Luna-B's prescription (E3 → existing swept fields → buffer-29 mask → E5 pre-bar filter → existing consumer) remains the right mechanism, and v5's tri-state mask read is the right resolution of the fail-open defect — conservative in the safe direction (hold the seed, never void on unknown), with the R2SKIP row keeping the hold observable rather than silent. Rejected-and-stayed alternatives: settle-bar wick testing (self-defeating against Luna-2's own pre-bar exclusion), TpSessionLevelFiltered reuse (correctly rejected — it would drop live lines R2 must keep), shared bit-map helper (Kimi-6, parked; the byte-compare assert is definitional enough at this stage). For A-1, per-bar dedup of the R2SKIP row is the only mechanism touch I'd consider, and it is optional.

---

## Verification split

Ruled on the page only. Genuineness vs disk (digests, byte counts, the four reset sites, compile, run) is proven on your machine and is not answerable from chat. Do not send files.

**Accept by name. No key volunteered. Nothing here builds, runs, or spends.**
