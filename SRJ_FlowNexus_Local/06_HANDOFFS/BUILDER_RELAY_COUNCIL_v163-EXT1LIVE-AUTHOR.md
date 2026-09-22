CODE REVIEW REQUEST — v163 — 2026-09-18 (EXT1-LIVE authorship: live the second-swing stop so the declined A3 dies on the gate; no code, no run)

Change (one plain sentence): author living the ext1 read as the live stop within the bounds below so the declined Sept-8 16:40 fire dies on the R-gate and the session window stays unspent for the valid 17:00 seed, with no follow-on birth rule and no session-limit change.

File / function / lines: no code change this relay; tree landed 3a932b9 (EA `6C2E4028` / 602894 B); select site EA L9661-9666 (re-read from disk this turn, carried whole below — the site any rule replaces). Archives: `06_HANDOFFS\FAMILYPASS-V4_JOURNAL.log` (36755 lines / `736C24E8`) and `06_HANDOFFS\FRESHVETO-V1_JOURNAL.log` (37303 lines / `8B2ED676`).

Complete code, verbatim, no elisions (the live-stop select decision, contiguous):
         int s1x_sel = -1;
         if(s1x_s0slot >= 0 && s1x_s0imb > 0) s1x_sel = 0;
         else if(s1x_s1slot >= 0) s1x_sel = 1;
         if(s1x_sel == 0) slRef = s1x_s0px;
         else if(s1x_sel == 1) slRef = s1x_s1px;
        }

Context (labeled priors, same track): v162 (`06_HANDOFFS\BUILDER_RELAY_COUNCIL_v162-BIRTH-AUTHOR.md`, 77 lines, `1E31BDA3`) asked follow-on-birth authorship and drew Luna authorship (declined-fire trigger), Sonnet hindsight flag (9/17 manual decline is look-ahead as a live trigger), Astra discrepancy (no machine-evaluable predicate), Opus suppression-correct — all four filed this turn as LUNA/ASTRA/SONNET/OPUS-V162-001. This relay does not ask council to pick a side: disk audit dissolves the dilemma (below), and all four v162 demands ride quoted complete at the foot, each ruled by name. His figures: 17:00 SHORT entry 1.16220 stop 1.16274 TP 1.16114 (`06_HANDOFFS\BUILDER_CHECKPOINT_POST-V30.md` line 89; valid per `06_HANDOFFS\BUILDER_FINDING_SEP8_MANUAL_REVIEW.md` line 19); 16:45 SHORT invalid RR with true stop two swings out at 1.16359 = 09:05 high (same finding); A3/16:25 declines stand.

Disk finding (machine-pulled this turn — the ext1 read already holds his exact true stop): at the A3 16:40 bar the shadow ext1 read is 1.16359 slot 91 imb 2 off ext1BarTime 09:05, while live latched 1.16274 and fired R 1.62:
HP	0	02:00:44.015	Core 04	2026.09.08 16:45:01   [SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Monthly-POC | NYAM | R=1.62 SL 1.16274 TP 1.16114 spr=1
[SRJ-EA] SLSRC site=S5 dir=SHORT src=OB_SWING obStruct=1.16377 obSwing=1.16379 nearest=1.16274 chosen=1.16379 deltaPts=2
[SRJ-EA] SL_REF branch=1-swing obValid=1 slRef=1.16379 distPts=167 site=S5 zoneLo=1.16362 zoneHi=1.16377
[SRJ-EA] SLEXT481 fields=17 bar=2026.09.08 16:40 site=S5 dir=SHORT ladOriginPx=1.16213 ladOriginBarTime=2026.09.08 16:45 ladOriginSite=S5 ext1Defined=1 slExt1=1.16359 ext1Slot=91 ext1BarTime=2026.09.08 09:05 ext1Imb=2 deepestExt=29 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
[SRJ-EA] TP_ELECT shadow=true entry=1.16213 sl=1.16274 tp=1.16114 R=1.62 bar=2026.09.08 16:40 latchBar=2026.09.08 16:45

Seven-bar ext1 table (machine rows below; R builder-computed as reward-over-risk in points, predictions for the probe run — entries and TPs from live TP_ELECT rows, stops from S5 ext1 reads):
[SRJ-EA] TP_ELECT shadow=true entry=1.16466 sl=1.16508 tp=1.16322 R=3.43 bar=2026.08.28 10:00 latchBar=2026.08.28 10:05
[SRJ-EA] TP_ELECT shadow=true entry=1.16430 sl=1.16503 tp=1.16322 R=1.48 bar=2026.08.28 16:20 latchBar=2026.08.28 16:25
[SRJ-EA] TP_ELECT shadow=true entry=1.16018 sl=1.15847 tp=1.16315 R=1.74 bar=2026.09.04 15:55 latchBar=2026.09.04 16:00
[SRJ-EA] TP_ELECT shadow=true entry=1.16135 sl=1.16098 tp=1.16315 R=4.86 bar=2026.09.07 09:15 latchBar=2026.09.07 09:20
[SRJ-EA] TP_ELECT shadow=true entry=1.16261 sl=1.16238 tp=1.16315 R=2.34 bar=2026.09.07 16:40 latchBar=2026.09.07 16:45
[SRJ-EA] TP_ELECT shadow=true entry=1.16205 sl=1.16258 tp=1.16072 R=2.52 bar=2026.09.08 10:05 latchBar=2026.09.08 10:10
[SRJ-EA] TP_ELECT shadow=true entry=1.16213 sl=1.16274 tp=1.16114 R=1.62 bar=2026.09.08 16:40 latchBar=2026.09.08 16:45
[SRJ-EA] SLEXT481 fields=17 bar=2026.08.28 10:00 site=S5 dir=SHORT ladOriginPx=1.16466 ladOriginBarTime=2026.08.28 10:05 ladOriginSite=S5 ext1Defined=1 slExt1=1.16508 ext1Slot=42 ext1BarTime=2026.08.28 06:30 ext1Imb=0 deepestExt=27 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
[SRJ-EA] SLEXT481 fields=17 bar=2026.08.28 16:20 site=S5 dir=SHORT ladOriginPx=1.16430 ladOriginBarTime=2026.08.28 16:25 ladOriginSite=S5 ext1Defined=1 slExt1=1.16508 ext1Slot=118 ext1BarTime=2026.08.28 06:30 ext1Imb=0 deepestExt=27 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
[SRJ-EA] SLEXT481 fields=17 bar=2026.09.04 15:55 site=S5 dir=LONG ladOriginPx=1.16018 ladOriginBarTime=2026.09.04 16:00 ladOriginSite=S5 ext1Defined=1 slExt1=1.15847 ext1Slot=5 ext1BarTime=2026.09.04 15:30 ext1Imb=0 deepestExt=10 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
[SRJ-EA] SLEXT481 fields=17 bar=2026.09.07 09:15 site=S5 dir=LONG ladOriginPx=1.16135 ladOriginBarTime=2026.09.07 09:20 ladOriginSite=S5 ext1Defined=1 slExt1=1.16098 ext1Slot=7 ext1BarTime=2026.09.07 08:40 ext1Imb=0 deepestExt=16 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
[SRJ-EA] SLEXT481 fields=17 bar=2026.09.07 16:40 site=S5 dir=LONG ladOriginPx=1.16261 ladOriginBarTime=2026.09.07 16:45 ladOriginSite=S5 ext1Defined=1 slExt1=1.16238 ext1Slot=7 ext1BarTime=2026.09.07 16:05 ext1Imb=0 deepestExt=23 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
[SRJ-EA] SLEXT481 fields=17 bar=2026.09.08 10:05 site=S5 dir=SHORT ladOriginPx=1.16205 ladOriginBarTime=2026.09.08 10:10 ladOriginSite=S5 ext1Defined=1 slExt1=1.16258 ext1Slot=5 ext1BarTime=2026.09.08 09:40 ext1Imb=0 deepestExt=31 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0
[SRJ-EA] SLEXT481 fields=17 bar=2026.09.08 16:40 site=S5 dir=SHORT ladOriginPx=1.16213 ladOriginBarTime=2026.09.08 16:45 ladOriginSite=S5 ext1Defined=1 slExt1=1.16359 ext1Slot=91 ext1BarTime=2026.09.08 09:05 ext1Imb=2 deepestExt=29 sep8FiledPx=- sep8ResidPts=-999 sep8BarDiffBars=-999 sep8Prov=- sep8Covered=0

Read: ext1 equals the live stop on five fires (identical R), moves A1 trivially (1.48 to 1.38, survives; declined anyway), and kills exactly the declined A3 (1.62 to 0.68, R-gate). A2 widens 10pts of risk (1.16289 to 1.16299) and stays far above the gate near 7.3 on the seed-close entry basis, and the veto refuses it pre-latch regardless (resolution-then-veto order) — both declines preserved independent of any R number. The 16:55 seed then proceeds normally (window unspent, no follow-on rule, no session change); the 17:00 R is run-measured with operands printed (ext1 at 16:55 unmeasured: zero S5-scope rows there, proven 0/0 two patterns).

Bounds (from record, no invention): SESSION_LIMIT untouched; veto order untouched; A3/16:25/A2 declines preserved exactly; no-band-aid standing rule; authorship states predicate, site, replacement semantics, ext1-undefined fallback (defined 7/7 here), the table above as must-reproduce-or-explain, and print-only-probe-first with live only via later dual-key plus tokens. Novel evidence for the run: first live-behavior deltas of ext1 stops — A3 R-gate kill with no fire, 16:55 seed present, 17:00 R recomputed, six others per table.

Filed-record appendix (the four v162 demands, quoted complete under builder markers — each ruled here, never attributed to any current seat):
[Luna v162 demand, filed entry LUNA-V162-001:]
**discrepancy — seed gate L7677–7725; specifically L7682–7699.**

The one-per-window suppression is **not correct as-is** for the stated Sept-8 sequence. At **L7682**, `SessionAlreadyUsed(sess, barTime)` causes an unconditional return before `DetectPoiRetest()`, so the already-spent NYAM window suppresses the 16:55 SHORT candidate and prevents the 17:00 birth.

**Authored narrow follow-on rule:** at the `SessionAlreadyUsed()` branch around **L7682**, retain the normal suppression for ordinary post-fire candidates, but permit **exactly one post-fire follow-on birth** when all of these operands are true: the current session/window is already marked used by a prior fire; that prior fire is subsequently classified as **declined rather than a surviving/accepted signal**; the EA is back in `ST_IDLE`; the current candidate independently passes `DetectPoiRetest()`; and the candidate's confirmation remains valid. The allowance is **one candidate only, then suppression resumes**, with no resurrection of the declined 16:45 SHORT, no resurrection of the invalid 16:25 LONG, and no blanket removal of `SESSION_LIMIT`.

Applied to the filed sequence, that authors the **Sept-8 17:00 SHORT** as a new ordinary SHORT birth after the 16:45 declined fire, with the recorded entry **1.16220**, stop **1.16274**, TP **1.16114**, and **R = 1.96**, while leaving the existing one-per-window rule intact outside that narrow declined-fire follow-on case.


[Astra v162 demand, filed entry ASTRA-V162-001:]
**discrepancy — L7682–7697:** The spent-window return explains the missing birth, but does not establish that suppression is correct as a trading rule. It precedes `DetectPoiRetest` and all seed-state writes; the confirmed 16:55 shadow poll therefore cannot itself create the 17:00 candidate.

A narrow standing exception is **not specified by the supplied evidence**. Missing is a machine-evaluable predicate that authorizes this post-fire successor while excluding other spent-window candidates, together with its re-arm/consumption hold. “The earlier fire was his declined A3” is an authorship finding, not an implemented eligibility operand; “a later SHORT confirms” would admit an unsupported class of follow-ons. Neither can be silently substituted for the missing rule.

**Site: L7682, retaining L7681 and the ordinary suppression path through L7697.** Any proposed exception belongs at that decision, initially as print-only shadow, without live seeding or changes to session-use accounting. The recorded target is entry **1.16220**, SL **1.16274**, TP **1.16114**, **R=1.96**; bypassing this gate alone does not establish those operands, since RECON40 demonstrates the stale-stop failure downstream.

Accordingly, neither a bounded birth rule nor “suppression correct as-is” is proven here. Preservation of the seven existing signals, A2 silence, silent days, and both declines remains an acceptance requirement—not an established result. No live exemption is authorized; later activation still requires the stated dual-key plus tokens.

[Sonnet v162 demand, filed entry SONNET-V162-001 — hindsight section complete:]
But there's a real problem with how you've scoped the invalidation: you're using the 16:45 decline (`kill-all 2026-09-17`) as the trigger, and that ruling is dated nine days after the Sept-8 session. If the follow-on rule keys off *that* decline record, it's using information that didn't exist yet at 17:00 on Sept-8 — that's hindsight bias, not a live-computable rule, no matter how narrowly you scope it. It would "work" in this backtest and be unusable live.

The way around that: your own note says the 16:45 fire was declined for "true stop two swings out." If that's a live, intrabar-observable event — the fire actually gets stopped out within the same session, before the window would otherwise close — then a rule like "if the window's claiming fire is stopped out within-session, release the window for one subsequent qualifying candidate" is legitimately live-computable and doesn't touch SESSION_LIMIT behavior anywhere else. If instead the "decline" is a discretionary/manual ruling made later (which the 09-17 date suggests), it can't be the trigger for a live rule without smuggling in look-ahead.

So: authorable, but only if you re-anchor the trigger to an intrabar stop-out condition rather than the dated manual decline — otherwise the suppression-as-is is the correct call, because the alternative bakes in future knowledge. I can't give you exact line numbers for where this lands in your real file since I haven't seen it; in the snippet you pasted it would go immediately after the `SessionAlreadyUsed` check and before its `return`.


[Opus v162 demand, filed entry OPUS-V162-001 — complete:]
## Code Review — v162 Follow-On Birth Rule

**Answer: suppression-correct**

---

### Analysis

The current one-per-window suppression (L7682–7695) is operating as designed and should remain unchanged.

**Predicate at 16:55 seed poll:**
- `inWindow` = true (NYAM active)
- `SessionAlreadyUsed(sess, barTime)` = true (16:45 fire marked window used at 16:50:01)
- Suppression triggers, no seed planted

**What would be required to birth 17:00 SHORT:**
A follow-on rule would need to either:
1. Exempt the 16:55 seed from suppression (violates SESSION_LIMIT standing rule — blast radius uncapped)
2. Plant a second seed after the first fire (violates one-per-window model — SESSION_LIMIT loses meaning)
3. Carry the 16:55 seed state forward through 17:00 despite IDLE return at L7684 (no state exists to carry — suppression returns immediately, no writes occur)

**RECON40 context:**
The 16:55 seed evaluated in RECON40 because no fire occurred in the 16:40–17:00 span (window unspent). Current tree spends the window on 16:45 fire. The 16:55 seed → 17:00 eval chain exists only when the window remains unspent.

**Family-pass consequence:**
The valid 17:00 SHORT is architecturally unreachable under one-per-window + fire-marks-used. This is not a bug in the suppression logic — it is the designed tradeoff of the session limit model. The 16:45 A3 fire (later declined) consumed the window before the valid seed appeared.

---

### Conclusion

No follow-on birth rule can be authored within the stated bounds:
- SESSION_LIMIT must stay for everything else (bound stated)
- A3 decline preserved (bound stated)
- No band-aid rule (bound stated)
- One-per-window model enforced by L7682–7695

The suppression is correct. The 17:00 SHORT is unbirthable under the current session-limit architecture.

**Lines: L7682–7695 (SessionAlreadyUsed check + return) — no change required.**


Rulings: Luna authorship ACCEPTED as goal, DECLINED as specified (declined-fire trigger is hindsight as a live operand — Sonnet/Astra convergent; alert-only tree hosts no stop-out events to re-anchor it); Sonnet re-anchor examined and UNAVAILABLE on this tree (no live positions exist to be stopped out; STEP 4 unbuilt); Astra predicate-gap CLOSED by this authorship (ext1 read at the bar is the machine-evaluable operand); Opus suppression-correct ACCEPTED as far as it goes (no follow-on rule needed — and none proposed here) but its unbirthable claim is SUPERSEDED by the A3-decline path (window frees naturally). Credit to all four seats; the split dissolves on disk, no adjudication asked.

Question (one, specific): author the ext1-live stop rule within the bounds above — authored rule text or discrepancy, with line numbers?

Answer form: plain authored-rule / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files. Same text goes to every model; file-access proof is builder-disk plus his-eyes only.
Nothing else is asked. Thank you.
