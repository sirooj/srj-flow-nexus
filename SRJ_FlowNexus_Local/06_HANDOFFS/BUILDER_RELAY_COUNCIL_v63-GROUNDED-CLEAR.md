# RELAY v63 — GROUNDED CLEAR (source slices inline; fresh-session, self-contained)

**Version:** v63. **Answers:** v62-thorough split — ChatGPT-channel `LUNA-V62-SPLIT-0915-01` (ACCEPT + NAMES (B) + ONE clearance key; token + fresh word owed; QUIESCENT pending) vs Sonnet non-verdict review (no Ruling-ID, no key: file-blind, cannot certify descriptions; conditional read supports the split; demands REAL source to review). PLUS the source slices below (new — answers the provenance objection with the thing itself). Paste whole to EACH model. Return whole verdicts with model + date + Ruling-ID (or explicit non-verdict review), one source per message.

## §0. Standing (builder states the boundary openly — no ceremony)
- Dual-convergence proves independent REASONING over shared measurements, never independent measurements: hashes/counts/bounds/extracts are builder-measured on disk (the independent layer); verdicts attest the logic. What follows lets each stream check the call-site facts DIRECTLY from source instead of trusting descriptions. What no stream can check from here: file hashes and full journals beyond the quoted slices — stated, not hidden.
- State: run word SPENT on RECON30. RECON17 frozen. EA `E68E0AE3…` 559189 B UNCOMMITTED + FlowLogic `3606BFB4` frozen + fixture UNCOMMITTED, HEAD `5cc58d3` NO push. No run active. No third run; REPORT+HALT. No-band-aid rule stands.
- Converged packet (B) `SIDE-1P-FIX-SPLIT` (both v61 streams named it; Luna re-names it): Track 1 S1/chain-98 London — wire `IsConfirmationCandle` into the seed path (5 gates); Track 2 S2/chain-105 NY AM — agreeing-4H/1H hierarchy + conflict-residual + single-owner assertion; shared AdoptOff=1 shadow, pre-hash, disjoint `SIDE1F_`, per-track grading. His review stands (London bearish-close kills confirmation; NY AM 4H+1H over 15m). Luna's key for (B)+RECON31 stands recorded; Sonnet's key owed.

## §1. Source slice 1 — the gate (EA:2075–2114, verbatim, current digest)
`bool IsConfirmationCandle(const int barShift, const int anchorLine, const ENUM_SRJ_DIR dir, string &failTerm)` / guards `NO_ANCHOR`/`NO_DATA`/`NO_LINE` / term A `oppCandle = (dir == DIR_LONG) ? (c1 < o1) : (c1 > o1)`, fail `A_OPP` / term A2 `closeSideOk = (dir == DIR_LONG) ? (c1 >= L) : (c1 <= L)`, fail `A2_CLOSE_BREAK` / term B `bodyDir = (dir == DIR_LONG) ? (c0 > o0) : (c0 < o0)`, fail `B_BODY` (his London rule lives here: bullish confirmation must close up) / term C `touch = (h1 >= L - _Point && l1 <= L + _Point)`, fail `C_TOUCH`. N1 counter family by line code at equality (untouched by any fix).

## §2. Source slice 2 — the seed path (EA:7503–7547, verbatim, current digest)
`if(g_state == ST_IDLE)` / `if(!inWindow) return;` / session-used guard / `PoiRetestResult pr; if(!DetectPoiRetest(barShift, pr) || !pr.found) return;` / `g_anchorLine = pr.topLine;` / carried-side comment (single writer, ABSTAIN pass-through) / `g_dir = S2ResolveLive(pr.isLong ? DIR_LONG : DIR_SHORT);` / `SrjSideNote("DetectPoiRetest", g_dir);` / `g_anchorBarTime = barTime;` / price/session/div-latch writes / `g_state = ST_S1_REGIME;` / seed-census comment + `ANCHOR_ELECT ... action=SEED` print. ZERO gate tokens in this span (file-wide inventory: def + comment + exactly two call sites below — the complete set).

## §3. Source slice 3 — the only two call sites (condensed to decision lines, current digest)
- EA:8163 (CONFIRM_PREBIND, S3-zone-wait path): `if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTermPB))` → promote to `ST_S5_GATE_CHECK`, print `CONFIRM_PREBIND`; else print `CONFIRM_PREBIND_FAIL`. Pre-binding only; S2 candidates outside ruled scope.
- EA:8300 (CONFIRM-GATE E2, S4→S5 edge): `if(IsConfirmationCandle(barShift, g_anchorLine, g_dir, cfTerm))` → promote to `ST_S5_GATE_CHECK`; else print `CONFIRM_STRUCT_FAIL`. One-bar validity, no carry-forward, touch fallback stays.
- Producer anchor: `bool DetectPoiRetest(int barShift, PoiRetestResult &r)` def EA:1889 (matches run-evidenced `VOTEPROD=DetectPoiRetest`).

## §4. Run lines under review (verbatim extracts; full archives + hashes on disk per v62 §10)
SRC1: `DIRUSED=LONG STOREDBAR=2026.09.08 09:15 ATSRC=CARRIED VOTEPROD=DetectPoiRetest VOTEVAL=LONG CHAINN=98 BIASA=-1.0 BIASB=-1.0 SITE=2026.09.08 10:10` / SRC2: `DIRUSED=NODIR STOREDBAR=NONE ATSRC=NOHISTORY VOTEPROD=ResetSequence VOTEVAL=NODIR CHAINN=105 BIASA=-1.0 BIASB=-1.0 SITE=2026.09.08 17:00 SITEDIR=LONG SITESRC=2026.09.08 16:45`.

## §5. Asks
- Ask 1 — ACCEPT §§0–4 (slices rule the call-site question from source: gate exists with his close-direction term; seed path carries no gate token; the only two calls sit downstream — state any line you find that contradicts this, by line number, or accept the measurement).
- Ask 2 — CLEAR `SIDE-1P-FIX-SPLIT` BY NAME for ONE shadow build + ONE run `RECON31-FIXSPLIT` (v62 §7 envelope/grading/artifacts unchanged: same ini/range, ceiling 90, AdoptOff=1, per-track thresholds, isolation vs RECON30, STATUS/DONE, result+extract+archive pre-declared). Threshold: DUAL-KEY (Luna's key stands; this return supplies-or-withholds the second) + HIS selection token + HIS fresh run word (both flagged owed, neither manufactured here).
- Ask 3 — CONFIRM nothing builds/runs/commits on THIS relay; nothing lands/adopts without later dual-key + tokens; RECON17 frozen; E68E0AE3 + fixture uncommitted; no third run; REPORT+HALT; run word SPENT.

## §6. Branch coverage
- Second key here + token + word → builder builds + runs immediately, no pauses; result → grading relay (dual-key further; landing needs its own dual-key + tokens).
- Key withheld with named defects/conditions → QUIESCENT stands; defects owned; conditions answered with source, not prose; no rerun, no tuning.
- Non-verdict review again → filed as keyless review; QUIESCENT stands; operator decides whether to keep this channel for authorship/review with keys waived.
- Landing/commit/push → NOT covered; fresh dual-key + tokens.

## §7. Proof set (on disk; streams rule on the inline record above)
- This relay's §§1–4 (source + run lines); `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md` (`LUNA-V62-SPLIT-0915-01`); Opus file (v62 non-verdict review, builder header); `06_HANDOFFS\BUILDER_FINDING_CONFIRM_CALLSITES.md`; `06_HANDOFFS\BUILDER_FINDING_SEP8_MANUAL_REVIEW.md`; RECON29/30 results + extracts + journals; v56–v62 relays + verdict sections; readiness pair; restatement + plan + pointer + checkpoint.

(End — v63 awaits the second key + selection token + fresh run word; build/run only then)
