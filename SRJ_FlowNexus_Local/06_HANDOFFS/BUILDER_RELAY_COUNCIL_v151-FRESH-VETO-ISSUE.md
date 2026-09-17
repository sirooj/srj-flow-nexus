CODE REVIEW REQUEST — v151 — 2026-09-17 — FRESH-SESSION SELF-CONTAINED (no thread memory assumed; everything needed rides inline)

Background (complete on this page): packet P-TP-FAMILYPASS v4 built and ran as FAMILYPASS-V4 (DONE=PASSED, 3168 bars). All five expected fires fired with family-line winners. One extra fire contradicts his filed decline: Sept-4 10:35/10:40 SHORT fired R=10.35 after the machine itself aborted the setup for opposing-gap confirmation at 10:35:06. His kill ruling on this setup is on record twice (v14 MUST-DECLINE + this week's kill-all). This packet (draft `01_TASKS\PACKET_P-FRESH-S5OPP.md` `7B306D7B`) gives the S4 abort persistence into the S5 latch — nothing else changes.

His ruling on this setup, verbatim (operator 2026-09-17, kill-all message — operator holds the chat original):
> A2: This trade although ended up in a huge R, but it is invalid because the 5m in bias FVG has been invalidated and the validated OPP FVG. this is the same setup as the previous version of the EA which i have rejected. Also i see that the historical trade, if the trade is valid, why did you not put your TP at the previous Asian session low for 1.16224 at 6:45 low?

His prior ruling on this exact bar (filed `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v14-SEL1-PACKET.md`):
| R2 | 10:35/10:40 Sep-4 | SHORT | 1.16265 HAND | 1.16299 HAND-hypothetical ("if that was the entry, yes"); bar 09:30 CODE-side only | 1.16224 HAND (moot) — setup MUST-DECLINE, operator-ruled CQD-invalid |

The deliberate design this packet partially overrides (filed `01_TASKS\PACKET_P-SCOPE34.md` — header says DRAFT-NOT-ISSUED though the code carries it; recorded, not reopened):
STATUS: DRAFT — NOT ISSUED — NOT EXECUTED. Ruled by the operator's Q4 answer of
2026-09-09 (verbatim in BUILDER_FINDING_EXITMODEL-1.md §6): "yes, that is only pre
confirmation entry. even if after entry, the structure flip then i still hold the
trade" — which ratifies spec §3.4's verbatim: "This criteria is before the trade
confirmed, if later the structure is flipped after the confirmation entry, i still
hold the trade." Canonical file: EXACTLY ONE — Experts\SRJ_FlowNexus_EA.mq5 (the
post-P-EXITMODEL baseline, hashed at this packet's own Stage 1). KEPT SEPARATE from
P-EXITMODEL: it touches the ENTRY pipeline (spec §7's separation), and bundling it
would break P-EXITMODEL's entry-side identity gates.

What this packet does NOT do: give the 2-of-3 any teeth at S5 (his Q4 ruling + spec §3.4 forbid post-confirmation kills except the bias flip — quoted in Q-SCOPE; a cleared packet violating his rule fails closed). S5 scope stays HOLD-only. TP/SL/management untouched (stop second, exit last, his delegated priority).

File / function / lines: `Experts\SRJ_FlowNexus_EA.mq5` — S4 poll block OLD L7198-7207 and S5 latch context OLD L9833-9843 carried whole below verbatim (landed `AE436EBC`/599014, built, run, committed nowhere). Draft packet §1 (E1a–E1d with NEW code) carried whole below byte-identical to the filed draft.
Source digest: SHA256 `AE436EBC` / 599014 B.

S4 poll block, verbatim, no elisions (OLD):
   if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
     {
      //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
      //--- poll kills as built; at S5_GATE_CHECK (post-confirming-close) it is
      //--- diagnostic-only (scope=post, verdict=HOLD) - the only cancellation
      //--- there is the live bias flip (the three-flag conjunction is the same
      //--- event per spec sections 3.4/5.5).
      string fail = CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK);
      if(fail != "") { GoAbort(fail, g_state); return; }
     }

S5 latch context, verbatim, no elisions (OLD):
       //--- [P-CONFIRM-GATE E3/E4] the R latch: measured ONCE at the confirmation
      //--- close (entry = the next open, SL = the swing, TP = the closest line -
      //--- the selector unchanged per the operator's ruling, "whichever is the
      //--- closest"). Tested ONCE below: >= 1.0 fires; < 1.0 aborts TP_RR_FAIL
      //--- with the latch values. NEVER recomputed - single-shot, so latch
      //--- monotonicity holds by construction.
      g_latchedEntry = currentPrice;
      g_latchedSl    = slRef;
      g_latchedTp    = tpTarget;
      g_latchedR     = (slDist > 0.0) ? (tpDist / slDist) : 0.0;
      g_latchBarTime = iTime(_Symbol, PERIOD_CURRENT, barShift);

Draft packet §1, verbatim (E1a define + E1b globals + E1c stamp + E1d check with K1/K2):
## 1. WHAT CHANGES (4 small sites, entry pipeline only)
E1a — abort-reason define (EA L297): add `#define ABORT_FRESH_VETO "FRESH_VETO"`
after the `ABORT_FRESH_OPP_FVG` line. OLD: `#define ABORT_FRESH_OPP_FVG    "FRESH_OPP_FVG"`.
E1b — veto globals (EA L1007, after `g_confirmFromState`): ResetSequence-EXEMPT
(survives the abort's own reset, like the SLIMBR shadows; never working-set
members; WS161 fields stay 21). Single-bar scope via barTime equality — stale
bars never match, no reset hook, no tolerance. NEW:
```
//--- [P-FRESH-S5OPP E1 2026-09-17] S4 FRESH-abort bar-veto: stamped on abort,
//--- read at the S5 latch. ResetSequence-EXEMPT + single-bar scoped.
datetime         g_freshVetoBar    = 0;
int              g_freshVetoAnchor = -1;
int              g_freshVetoDir    = -1;
```
E1c — stamp on abort (EA L7198-7207 block). OLD:
```
   if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
     {
      //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
      //--- poll kills as built; at S5_GATE_CHECK (post-confirming-close) it is
      //--- diagnostic-only (scope=post, verdict=HOLD) - the only cancellation
      //--- there is the live bias flip (the three-flag conjunction is the same
      //--- event per spec sections 3.4/5.5).
      string fail = CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK);
      if(fail != "") { GoAbort(fail, g_state); return; }
     }
```
NEW (stamp before GoAbort; P-SCOPE34 comment byte-untouched):
```
   if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
     {
      //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
      //--- poll kills as built; at S5_GATE_CHECK (post-confirming-close) it is
      //--- diagnostic-only (scope=post, verdict=HOLD) - the only cancellation
      //--- there is the live bias flip (the three-flag conjunction is the same
      //--- event per spec sections 3.4/5.5).
      string fail = CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK);
      if(fail != "")
        {
         g_freshVetoBar = iTime(_Symbol, PERIOD_CURRENT, barShift);
         g_freshVetoAnchor = g_anchorLine;
         g_freshVetoDir = (int)g_dir;
         GoAbort(fail, g_state); return;
        }
     }
```
E1d — check at the S5 latch (before `g_latchedEntry` assignment). OLD:
```
      g_latchedEntry = currentPrice;
```
NEW:
```
      //--- [P-FRESH-S5OPP E1] bar-veto: an S4 FRESH abort for this bar, anchor
      //--- and direction refuses the latch (his ruled decline rides the abort;
      //--- re-seed next bar unaffected). K1 KEY (recommended): latch-barTime
      //--- equals abort-instant barTime. K2 ALTERNATE (council may substitute):
      //--- sticky-until-clean-read (veto holds until a FRESHCOUNT with
      //--- oppFvg=0 prints for the same dir). Run arbitrates; HALT on miss.
      if(g_freshVetoBar != 0
         && g_freshVetoBar == iTime(_Symbol, PERIOD_CURRENT, barShift)
         && g_freshVetoAnchor == g_anchorLine
         && g_freshVetoDir == (int)g_dir)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] FRESHVETO bar=%s dir=%s anchor=%s",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir), AnchorStr());
         SrjOrderEmit(barShift, "FRESH_VETO");
         GoAbort(ABORT_FRESH_VETO, g_state); return;
        }
      g_latchedEntry = currentPrice;
```


Kill-then-fire sequence, raw (machine-pulled byte-verbatim, FAMILYPASS-V4 archive `736C24E8`):
[SRJ-EA] FRESHCOUNT #155 bar=2026.09.04 10:30 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=1 adverse=2 verdict=ABORT scope=pre cum1=39 cum2=12 cum3=0
[SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.09.04 10:35 state=S4_ARMED dir=SHORT predicate=FRESH_OPP_FVG
[SRJ-EA] ALERT SRJ STAND-DOWN SHORT EURUSD M5 | Daily-POC | LONDON | reason=FRESH_OPP_FVG
[SRJ-EA] ALERT SRJ HEADS-UP SHORT EURUSD M5 | Daily-POC | LONDON | zone 1.16044-1.16063 awaiting confirm
[SRJ-EA] TP_ELECT shadow=true entry=1.16265 sl=1.16289 tp=1.16017 R=10.35 bar=2026.09.04 10:35 latchBar=2026.09.04 10:40
[SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-POC | LONDON | R=10.35 SL 1.16289 TP 1.16017 spr=4

S4 HOLD rows at the four wanted LONG fires, raw (same archive — oppFvg=0, veto never sets):
[SRJ-EA] FRESHCOUNT #158 bar=2026.09.04 15:55 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=42 cum2=12 cum3=0
[SRJ-EA] FRESHCOUNT #165 bar=2026.09.07 09:15 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=48 cum2=13 cum3=0
[SRJ-EA] FRESHCOUNT #175 bar=2026.09.07 16:40 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=57 cum2=13 cum3=0
[SRJ-EA] FRESHCOUNT #180 bar=2026.09.08 10:05 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=59 cum2=14 cum3=0

Read: at 10:30-eval the poll returned ABORT (bias gap dead + opposing gap confirmed, adverse=2); the abort executed at event 10:35:06 (S4) with STAND-DOWN; then the 10:35-eval seed latched and SIGNAL-fired at 10:40 with no intervening FRESH row for 10:35. Same anchor (Daily average), same direction, one candle. The four wanted LONG fires show opposing-gap 0 at S4 — a veto never sets for them (8/28 has no FRESH row at all — pre-binding skip, never aborted). The run arbitrates the K1/K2 key question; any miss = REPORT+HALT.

Question (one, specific): issue packet P-FRESH-S5OPP exactly as drafted (E1a define + E1b ResetSequence-exempt globals + E1c stamp + E1d K1 bar-equality check with K2 sticky-until-clean as the council-substitutable alternate; S1 pre-hash gate `AE436EBC`; G3 the five fires plus 9/4 10:40 silent; mismatch REPORT+HALT) — yes means issue as drafted (K1), issue-amended means substitute K2 (state the change); any discrepancy, with line numbers?

Answer form: plain yes / issue-amended (state change) / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
