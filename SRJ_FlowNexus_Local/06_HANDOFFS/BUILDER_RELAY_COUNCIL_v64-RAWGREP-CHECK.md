# RELAY v64 — RAW-GREP CHECK (fresh-session, self-contained)

**Version:** v64. **Answers:** v63 split — Luna `LUNA-V63-SPLIT-0915-02` (ACCEPT + SECOND key for (B); token + word owed; QUIESCENT) vs Sonnet non-verdict (no key on principle: curated slices can't prove the exhaustive claim; demands RAW whole-file grep output; offers an actual check, explicitly not a key). This relay supplies exactly what was demanded: the raw outputs, uncurated, complete. Paste whole to EACH model. Return whole verdicts — or explicit non-verdict review — with model + date (+ Ruling-ID if ruling), one source per message.

## §0. Standing (unchanged unless he amends)
- State: run word SPENT on RECON30. RECON17 frozen. EA `E68E0AE3…` 559189 B UNCOMMITTED + FlowLogic `3606BFB4` frozen + fixture UNCOMMITTED, HEAD `5cc58d3` NO push. No run active. No third run; REPORT+HALT. No-band-aid rule stands.
- Authority accounting (stated plainly): Luna holds TWO keys for (B) (v62 + v63, same stream — counts once toward dual-key). Sonnet holds ZERO keys and states it will never key from pasted text (principled, permanent). DUAL-KEY FOR THE FIX IS UNREACHABLE ON THIS ROUTING — no future paste changes that; only HIS governance order can (decision in §5, his alone).
- Converged packet (B) `SIDE-1P-FIX-SPLIT` + his review (London bearish-close kills confirmation; NY AM 4H+1H over 15m) + fork legend + v62 envelope stand as ruled; nothing here re-authors them.

## §1. Raw whole-file grep 1 — `IsConfirmationCandle`, case-sensitive, every hit, nothing withheld
`2029 //--- IsConfirmationCandle; nothing here gates anything.`
`2075 bool IsConfirmationCandle(const int barShift, const int anchorLine,`
`8163 if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermPB))`
`8300 if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))`
Four hits total: one comment, one definition, two calls. The "exactly two call sites, complete set" claim is checkable against THESE four lines: any fifth call site would have to appear here and does not.

## §2. Raw whole-file grep 2 — `DetectPoiRetest`, case-sensitive, every hit, nothing withheld
`108 //--- DEFINED after DetectPoiRetest: they need g_hPoi, ReadBuf1, ENUM_SRJ_DIR`
`1021 //--- DetectPoiRetest's return (true = setup lived despite equality); A2 site =`
`1889 bool DetectPoiRetest(int barShift, PoiRetestResult &r)`
`1986 //--- RETESTBOOK: the per-line retest census - DetectPoiRetest returns only the`
`7321 //--- DetectPoiRetest is read-only - it fills a caller-owned struct from the`
`7346 if(DetectPoiRetest(barShift, t78_pr) && t78_pr.found)`
`7435 //--- DetectPoiRetest is read-only: it fills a caller-owned struct from the`
`7457 if(DetectPoiRetest(barShift, t73_pr) && t73_pr.found)`
`7497 if(DetectPoiRetest(barShift, sh_pr) && sh_pr.found)`
`7523 if(!DetectPoiRetest(barShift, pr) || !pr.found) return;`
`7530 SrjSideNote("DetectPoiRetest", g_dir);`
`9972 //--- DetectPoiRetest (`l <= L-P+EPS && bodyLo >= L-EPS`, SHORT mirror),`
Twelve hits: comments + def + census/shadow reads (7346/7457/7497, local structs, no direction write) + THE seed vote (7523, feeds the EA:7529 write) + side-note tag (7530) + one distant comment (9972). Single voting call site: 7523. (Single-owner assertion for chain-105 stays a BUILD gate, verified at build time, not claimed here.)

## §3. Asks
- Ask 1 (Sonnet answers expressly) — THE CHECK, review-only, never a key: do the two raw outputs above sustain or break the claims (a) exactly two `IsConfirmationCandle` call sites, both downstream of the EA:7529 seed write; (b) zero gate tokens in EA:7503–7560; (c) single voting `DetectPoiRetest` call at 7523? State line numbers for any contradiction, or confirm the logic holds on this evidence. No Ruling-ID and no key are asked of this stream — a plain check is the deliverable.
- Ask 2 (Luna answers) — STANDING CONFIRMATION only: does anything in §§1–2 change your recorded ACCEPT/second-key for (B)? YES/NO with reason; no new key asked (both your keys stand recorded).
- Ask 3 (both) — CONFIRM nothing builds/runs/commits on THIS relay; RECON17 frozen; E68E0AE3 + fixture uncommitted; no third run; REPORT+HALT; run word SPENT.

## §4. Branch coverage
- Check confirms + Luna standing confirmed → evidence hardens as REVIEWED (still not dual-key; authority decision stays §5).
- Check breaks a claim (line-numbered contradiction) → defect owned; finding corrected on disk; v62-envelope grading re-examined; no rerun, no tuning.
- Either halts → QUIESCENT; nothing moves without a separately-authored cleared packet.
- Landing/commit/push → NOT covered; fresh dual-key + tokens.

## §5. HIS DECISION (operator only — not asked of either stream; builder recommends, he disposes)
Dual-key for the selection-scope fix is unreachable: Sonnet will never key from text (principled), Luna keyed twice on one stream (counts once). Paths: (1) SHADOW-ORDER EXTENSION (RECOMMENDED): his one sentence extends the standing order to AdoptOff=1 shadow proving runs — same protections (mechanically-verified AdoptOff=1, isolation-join REPORT+HALT, per-track thresholds, no landing/adoption/commit without dual-key+tokens, fresh word per run, no staging without it) — unlocks RECON31-FIXSPLIT on his token + word with both reviews recorded-not-gating; (2) QUIET: hold QUIESCENT until routing changes (real file-read council or new streams); (3) his own alternative. Draft order text rides with the builder the moment he picks (1).

## §6. Proof set (on disk; streams rule on the inline record above)
- This relay's §§1–2 (raw greps); EA `E68E0AE3…` (the searched file); `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md` (`LUNA-V62/V63` keys); Opus file (v62/v63 non-verdicts, builder headers); v63 relay; findings pair; RECON29/30 results + extracts + journals; v56–v63 relays + verdict sections; readiness pair; restatement + plan + pointer + checkpoint.

(End — v64 awaits the plain check + standing confirm; build/run only on his §5 word)
