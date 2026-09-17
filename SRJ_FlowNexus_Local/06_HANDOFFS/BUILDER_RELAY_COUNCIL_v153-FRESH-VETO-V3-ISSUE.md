CODE REVIEW REQUEST — v153 — 2026-09-18

Change (one plain sentence): give the Sept-4 morning opposing-gap abort a veto that kills exactly one latch then releases, so the refused short cannot fire off the next candle but no later setup is held hostage.

File / function / lines: `Experts\SRJ_FlowNexus_EA.mq5` — abort defines OLD L295-305 (E1a adds one line at L297); globals OLD L1003-1007 (E1b adds five lines at L1007); `CheckFreshness` OLD L2204-2214 whole (E1e adds one line after L2210); S4 poll OLD L7198-7207 (E1c); S5 latch OLD L9833-9843 (E1d inserts above L9839).
Source digest: EA SHA256 `AE436EBC96A1A5142EEB8484DFBE752E8E3B203B49FF73CC560BF899D7CBCFEC` / 599014 B (verified this turn — re-read regions below; uncommitted, no drift). Draft packet `01_TASKS\PACKET_P-FRESH-S5OPP.md` v3: 240 lines / `1AA718A1` / 14506 B.

Complete code, verbatim, no elisions (OLD regions, re-read from disk this turn):

R1 — abort defines:
//====================== Abort reason codes ============================
#define ABORT_FRESH_OB_DEAD    "FRESH_OB_DEAD"
#define ABORT_FRESH_OPP_FVG    "FRESH_OPP_FVG"
#define ABORT_TP_RR_FAIL       "TP_RR_FAIL"
#define ABORT_NO_REGIME        "NO_REGIME"
#define ABORT_LTF_MISALIGN     "LTF_MISALIGN"
#define ABORT_UPSTREAM_UNREADY "UPSTREAM_UNREADY"
#define ABORT_SESSION_LIMIT    "SESSION_LIMIT"
#define ABORT_SESSION_CLOSED   "SESSION_CLOSED"
#define ABORT_LOT_TOO_SMALL    "LOT_TOO_SMALL"
#define ABORT_CONCURRENCY      "CONCURRENCY_LIMIT"

R2 — globals context:
//--- [P-CONFIRM-ANYSTATE E4 2026-09-11] the promotion-origin state: set at every
//--- confirmation promotion (the S4 edge and the new pre-bind site), read by the
//--- CONFIRM_DIV_WAIT rollback. Cleared in ResetSequence() and therefore a
//--- working-set member (field 20, the membership rule).
ENUM_SRJ_STATE   g_confirmFromState = ST_IDLE;

R3 — CheckFreshness, whole function:
string CheckFreshness(int barShift, bool twoOfThreeKills)
  {
   double obValid, oppFvg;
   if(!ReadFlow(FL_BUF_LTF_OB_VALID, obValid, barShift))
      return ABORT_UPSTREAM_UNREADY;
   if(!ReadFlow(FL_BUF_LTF_OPP_FVG,  oppFvg,  barShift))
      return ABORT_UPSTREAM_UNREADY;
   double t88_fvg = 0.0; if(!ReadFlow(FL_BUF_LTF_FVG_VALID, t88_fvg, barShift)) return ABORT_UPSTREAM_UNREADY; bool t88_a1 = ((int)MathRound(obValid) == 0); bool t88_a2 = ((int)MathRound(t88_fvg) == 0); bool t88_a3 = ((int)MathRound(oppFvg) == 1); int t88_n = (t88_a1 ? 1 : 0) + (t88_a2 ? 1 : 0) + (t88_a3 ? 1 : 0); static int s_t88_ev = 0; static int s_t88_c1 = 0; static int s_t88_c2 = 0; static int s_t88_c3 = 0; s_t88_ev++; if(t88_n == 1) s_t88_c1++; if(t88_n == 2) s_t88_c2++; if(t88_n == 3) s_t88_c3++; if(InpDebugLog && t88_n > 0) PrintFormat("[SRJ-EA] FRESHCOUNT #%d bar=%s state=%s obDead=%d fvgDead=%d oppFvg=%d adverse=%d verdict=%s scope=%s cum1=%d cum2=%d cum3=%d", s_t88_ev, TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES), StateName(g_state), (int)t88_a1, (int)t88_a2, (int)t88_a3, t88_n, (twoOfThreeKills && t88_n >= 2 ? "ABORT" : "HOLD"), (twoOfThreeKills ? "pre" : "post"), s_t88_c1, s_t88_c2, s_t88_c3);
   if(t88_n >= 2 && twoOfThreeKills) return (t88_a3 ? ABORT_FRESH_OPP_FVG : ABORT_FRESH_OB_DEAD);
   return "";
  }

R4 — S4 poll:
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

R5 — S5 latch context:
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

The change (packet §1, verbatim from the filed draft v3):
## 1. WHAT CHANGES (4 small sites, entry pipeline only)
E1a — abort-reason define (EA L297): add `#define ABORT_FRESH_VETO "FRESH_VETO"`
after the `ABORT_FRESH_OPP_FVG` line. OLD: `#define ABORT_FRESH_OPP_FVG    "FRESH_OPP_FVG"`.
E1b — veto globals (EA L1007, after `g_confirmFromState`): ResetSequence-EXEMPT
(survives the abort's own reset, like the SLIMBR shadows; never working-set
members; WS161 fields stay 21). V3 K3 CONTRACT (answers Sonnet/Opus D1): the
veto kills EXACTLY ONE latch per stamp, then releases. CLEAN clears only
after the veto has refused one latch (`spent==1`); pre-kill clean reads
(Luna's case included) do NOT clear, BY DESIGN — the contract changed, the
ordering hole is closed by removing the promise, not by reordering. BOUND +
DAY clear anytime. STATE QUALIFIER (Opus D5): the S4 clears below run only
while `g_state == ST_S4_ARMED`; E1d enforces BOUND/DAY independently at the
latch. Stale-safe: `g_freshLastOpp` initializes -1 (unknown = keep).
NEW:
```
//--- [P-FRESH-S5OPP E1-K3 2026-09-18] S4 FRESH-OPP-abort veto, exactly-once:
//--- stamped on abort, kills one latch, then releases. CLEAN only when spent;
//--- BOUND/DAY anytime (S4) and at the latch (E1d). ResetSequence-EXEMPT +
//--- non-working-set; WS161 stays 21.
datetime         g_freshVetoBar    = 0;
int              g_freshVetoAnchor = -1;
int              g_freshVetoDir    = -1;
int              g_freshLastOpp    = -1;
int              g_freshVetoSpent  = 0;
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
NEW (K3 per Sonnet/Opus-D1 v152; OPP-only stamp per Luna v151 STANDS;
P-SCOPE34 comment byte-untouched; scope stands SOLELY via the OPP gate —
Opus D2 correction adopted: UPSTREAM_UNREADY S5 returns (EA L2208/2210/2211)
exist but never equal OPP_FVG, so no S5 stamp is reachable):
```
   if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
     {
      //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
      //--- poll kills as built; at S5_GATE_CHECK (post-confirming-close) it is
      //--- diagnostic-only (scope=post, verdict=HOLD) - the only cancellation
      //--- there is the live bias flip (the three-flag conjunction is the same
      //--- event per spec sections 3.4/5.5).
      string fail = CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK);
      //--- [P-FRESH-S5OPP E1-K3] veto persistence, S4 ONLY, BEFORE any abort
      //--- return (Luna/Astra v152: the clear sees the fresh read even when
      //--- this poll aborts on another predicate). CLEAN only when spent
      //--- (exactly-once — pre-kill clean reads do NOT clear, by design);
      //--- BOUND/DAY anytime, audited by VETOCLEAR. Stale-safe: unknown keeps.
      if(g_state == ST_S4_ARMED && g_freshVetoBar != 0)
        {
         bool sameSetup = (g_freshVetoDir == (int)g_dir && g_freshVetoAnchor == g_anchorLine);
         string vday = StringSubstr(TimeToString(g_freshVetoBar, TIME_DATE), 0, 10);
         string cday = StringSubstr(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE), 0, 10);
         if(!sameSetup || vday != cday)
           {
            if(InpDebugLog)
               PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=%s",
                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                           DirName(g_dir), (!sameSetup ? "BOUND" : "DAY"));
            g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1; g_freshVetoSpent = 0;
           }
         else if(g_freshLastOpp == 0 && g_freshVetoSpent == 1)
           {
            if(InpDebugLog)
               PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=CLEAN",
                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                           DirName(g_dir));
            g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1; g_freshVetoSpent = 0;
           }
        }
      if(fail == ABORT_FRESH_OPP_FVG)
        {
         g_freshVetoBar = iTime(_Symbol, PERIOD_CURRENT, barShift);
         g_freshVetoAnchor = g_anchorLine;
         g_freshVetoDir = (int)g_dir;
         g_freshVetoSpent = 0;
         GoAbort(fail, g_state); return;
        }
      if(fail != "") { GoAbort(fail, g_state); return; }
     }
```
E1d — check at the S5 latch (before `g_latchedEntry` assignment). OLD:
```
      g_latchedEntry = currentPrice;
```
NEW (K3 per v152 — exactly-once; BOUND/DAY enforced at the latch per Astra
v152, so a stale veto can never refuse without a same-day same-setup stamp;
spent=1 arms the CLEAN release):
```
      //--- [P-FRESH-S5OPP E1-K3] veto (exactly-once): an S4 FRESH-OPP abort
      //--- for this anchor+direction refuses ONE latch (his ruled decline
      //--- rides the abort), then releases. K2's open CLEAN WITHDRAWN v3
      //--- (Sonnet/Opus-D1: pre-kill clean reads must not clear).
      if(g_freshVetoBar != 0
         && (g_freshVetoDir != (int)g_dir || g_freshVetoAnchor != g_anchorLine))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=BOUND",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir));
         g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1; g_freshVetoSpent = 0;
        }
      if(g_freshVetoBar != 0
         && StringSubstr(TimeToString(g_freshVetoBar, TIME_DATE), 0, 10)
            != StringSubstr(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE), 0, 10))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=DAY",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir));
         g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1; g_freshVetoSpent = 0;
        }
      if(g_freshVetoBar != 0
         && g_freshVetoDir == (int)g_dir
         && g_freshVetoAnchor == g_anchorLine)
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] FRESHVETO bar=%s dir=%s anchor=%s vetoBar=%s",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir), AnchorStr(),
                        TimeToString(g_freshVetoBar, TIME_DATE|TIME_MINUTES));
         SrjOrderEmit(barShift, "FRESH_VETO");
         g_freshVetoSpent = 1;
         GoAbort(ABORT_FRESH_VETO, g_state); return;
        }
      g_latchedEntry = currentPrice;
```
E1e — expose oppFvg for the spent-gated CLEAN (read at EA L2209, insert after
EA L2210's return; one global already declared in E1b; failed reads leave it
stale = keep, fail-closed toward his decline):
OLD (byte-exact, note TWO spaces before barShift — Opus D3):
`   if(!ReadFlow(FL_BUF_LTF_OPP_FVG,  oppFvg,  barShift))`
`      return ABORT_UPSTREAM_UNREADY;`
NEW: same two lines plus `   g_freshLastOpp = (int)MathRound(oppFvg);` as a
new line directly after the return (i.e. between L2210 and L2211).


Run rows, raw (FAMILYPASS-V4 archive `736C24E8`, machine-pulled this turn; the kill-then-fire sequence):
[SRJ-EA] FRESHCOUNT #155 bar=2026.09.04 10:30 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=1 adverse=2 verdict=ABORT scope=pre cum1=39 cum2=12 cum3=0
[SRJ-EA] A6REFUSED class=ABSENT_DECLINED bar=2026.09.04 10:35 state=S4_ARMED dir=SHORT predicate=FRESH_OPP_FVG
[SRJ-EA] ALERT SRJ STAND-DOWN SHORT EURUSD M5 | Daily-POC | LONDON | reason=FRESH_OPP_FVG
[SRJ-EA] ALERT SRJ HEADS-UP SHORT EURUSD M5 | Daily-POC | LONDON | zone 1.16362-1.16377 awaiting confirm
[SRJ-EA] TP_ELECT shadow=true entry=1.16265 sl=1.16289 tp=1.16017 R=10.35 bar=2026.09.04 10:35 latchBar=2026.09.04 10:40
[SRJ-EA] ALERT SRJ SIGNAL SHORT EURUSD M5 | Daily-POC | LONDON | R=10.35 SL 1.16289 TP 1.16017 spr=4

Same archive (the four wanted LONG fires — opposing-gap 0, veto never sets; 8/28 has no FRESH row at all):
[SRJ-EA] FRESHCOUNT #158 bar=2026.09.04 15:55 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=42 cum2=12 cum3=0
[SRJ-EA] FRESHCOUNT #165 bar=2026.09.07 09:15 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=48 cum2=13 cum3=0
[SRJ-EA] FRESHCOUNT #175 bar=2026.09.07 16:40 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=57 cum2=13 cum3=0
[SRJ-EA] FRESHCOUNT #180 bar=2026.09.08 10:05 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=59 cum2=14 cum3=0

Same archive (why v2 would have failed here — the deciding evidence; Opus D1(a) carried):
[SRJ-EA] FRESHCOUNT #156 bar=2026.09.04 15:45 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=40 cum2=12 cum3=0
[SRJ-EA] FRESHCOUNT #157 bar=2026.09.04 15:50 state=S4_ARMED obDead=0 fvgDead=1 oppFvg=0 adverse=1 verdict=HOLD scope=pre cum1=41 cum2=12 cum3=0
[SRJ-EA] 2026.09.04 10:40:00 STATE S3_ZONE_WAIT->S4_ARMED dir=SHORT poi=Daily-POC
[SRJ-EA] 2026.09.04 10:40:00 STATE S4_ARMED->S5_GATE_CHECK dir=SHORT poi=Daily-POC

Strategy basis (labeled priors — his words, operator holds the chat originals; filed record underneath):
v14 ruling (filed 06_HANDOFFS\\BUILDER_RELAY_COUNCIL_v14-SEL1-PACKET.md):
| R2 | 10:35/10:40 Sep-4 | SHORT | 1.16265 HAND | 1.16299 HAND-hypothetical ("if that was the entry, yes"); bar 09:30 CODE-side only | 1.16224 HAND (moot) — setup MUST-DECLINE, operator-ruled CQD-invalid |
Q4 hold rule (filed 01_TASKS\\PACKET_P-SCOPE34.md L3-8):
STATUS: DRAFT — NOT ISSUED — NOT EXECUTED. Ruled by the operator's Q4 answer of
2026-09-09 (verbatim in BUILDER_FINDING_EXITMODEL-1.md §6): "yes, that is only pre
confirmation entry. even if after entry, the structure flip then i still hold the
trade" — which ratifies spec §3.4's verbatim: "This criteria is before the trade
confirmed, if later the structure is flipped after the confirmation entry, i still
hold the trade." Canonical file: EXACTLY ONE — Experts\SRJ_FlowNexus_EA.mq5 (the
His A2 kill (his chat message 2026-09-17, operator holds original; carried in v151 relay):
> A2: This trade although ended up in a huge R, but it is invalid because the 5m in bias FVG has been invalidated and the validated OPP FVG. this is the same setup as the previous version of the EA which i have rejected. Also i see that the historical trade, if the trade is valid, why did you not put your TP at the previous Asian session low for 1.16224 at 6:45 low?

Prior review (v152) — quoted complete from the verdict files, ruled by name:
Filed BUILDER_VERDICTS_ASTRA.md:
## Luna answer - 2026-09-17 - answers v152 (DISCREPANCY: clean-clear unreachable behind abort return; marker LUNA-V152-FILED-001)

discrepancy — lines 225–273.

The stated K2 clear path says the veto clears on a clean `oppFvg=0` read, but the implementation checks `if(g_freshLastOpp == 0)` only **after**:

* line 225: `if(fail != "") { GoAbort(fail, g_state); return; }`

So when `oppFvg==0` arrives together with a different freshness abort (for example `ABORT_FRESH_OB_DEAD`), execution returns at line 225 and never reaches the clean-read clear at lines 261–273. The ResetSequence-exempt veto can therefore remain latched despite the promised clean read.

The rest of the stated K2 shape is internally consistent on the supplied page, but that clear-path ordering is a real discrepancy.


## Astra answer - 2026-09-17 - answers v152 (DISCREPANCY: clear-before-abort + E1d independent enforcement; marker ASTRA-V152-FILED-001)

discrepancy

- **E1c — OLD L7198–7207, `if(fail != "")` before persistence/clear; E1e — OLD L2210:** A successful clean OPP read with `obValid=0`, `fvgValid=0`, `oppFvg=0` returns `ABORT_FRESH_OB_DEAD`. E1c aborts before clearing the existing veto, violating the promised clean-read clear. Clear the prior veto on that clean read before returning; retain the OB_DEAD abort.
- **E1c — OLD L7198–7207; E1d — insertion above OLD L9839:** Setup-change/day clearing requires a successful S4 poll. E1d checks neither day nor intervening setup changes. Without that poll, a prior-day same-key veto can still refuse the latch; an A→B→A setup transition can revive an uncleared A veto. Enforce those invalidations independently of successful S4 polling before issuing.

Filed BUILDER_VERDICTS_SLDEF4-5.md:
## Sonnet answer - 2026-09-17 - answers v152 (DISCREPANCY: veto self-clears pre-latch, do-not-issue; marker SONNET-V152-FILED-001)

**Discrepancy.** The veto self-clears one poll after it's stamped, before it can ever reach the S5 latch — the patch does not achieve its stated goal.

**Where:** E1c, the persistence block inserted after the stamp-and-`GoAbort` branches:

```
if(g_state == ST_S4_ARMED && g_freshVetoBar != 0)
  {
   bool sameSetup = (g_freshVetoDir == (int)g_dir && g_freshVetoAnchor == g_anchorLine);
   ...
   else if(g_freshLastOpp == 0)
     { ... g_freshVetoBar = 0; ... }   // "CLEAN" clear
  }
```

combined with E1e, which sets `g_freshLastOpp` from the **current bar's** OPP read at the top of the very same `CheckFreshness()` call that just ran earlier in this same poll invocation.

**Trace on the motivating case:**
- 10:30, S4_ARMED: `CheckFreshness` returns `ABORT_FRESH_OPP_FVG` (oppFvg=1). E1c stamps `g_freshVetoBar/Dir/Anchor`, calls `GoAbort`, returns. `g_freshLastOpp` is *not* set on this call, because the OPP-read guard only sets it on success and this abort path returns before reaching the CLEAN-check block anyway — that's not the issue.
- 10:35, state re-enters `ST_S4_ARMED` for the re-armed setup (same dir/anchor). The poll block runs `CheckFreshness(barShift, true)` again. This time `oppFvg=0` (it has to be clean, or the setup couldn't re-arm and proceed to `TP_ELECT`/`SIGNAL` at all) — per E1e this sets `g_freshLastOpp = 0` **in this same call**.
- `fail == ""`, so the poll falls through to the persistence block. `g_freshVetoBar != 0` (still 10:30's stamp), `sameSetup` is true, `vday == cday`. So it hits `else if(g_freshLastOpp == 0)` — which is true, because it was *just* set to 0 a few lines above in the same function invocation. **CLEAN clear fires immediately**, zeroing `g_freshVetoBar` at 10:35.
- 10:40, S5 latch (E1d): `g_freshVetoBar == 0` → the veto conjunct is false → falls through to `g_latchedEntry = currentPrice;` unchanged. **The SHORT still fires at R=10.35, same as before the patch.**

This isn't an edge case — it's structural. Any time the vetoed setup re-arms and survives S4 (the only scenario the persistence block is meant to protect), the OPP read on that same poll must be clean, or it would simply re-abort with a fresh stamp instead. A clean read is therefore always available on the very first post-abort poll, and the code clears on exactly that read in the same pass. The veto has no effective window between S4 re-arm and S5 latch; K2 as coded can't survive to the site it exists to gate.

**None of the four filed verdicts (Luna/Astra/Sonnet/Opus) caught this** — they checked the OPP-only stamp scope, the K1 bar-equality miss, and the S5-unreachable-stamp claim, but none traced whether the CLEAN-clear branch could fire before the S5 latch ever consults the stamp. G3 as specified ("exactly one FRESHVETO row... zero across the five wanted fires") would actually pass **for the wrong reason** — zero FRESHVETO rows everywhere, including the 9/4 10:40 case, because the veto is already gone by 10:35. That's the silence Astra warned isn't proof under K2, and it isn't: here it's proof of failure, not success.

**Recommendation, not adopted as code:** the CLEAN-clear check needs to key off a read that is provably *later* than the stamped abort's own re-arm poll (e.g., require the clean read's bar to differ from the setup's current re-arm bar, or only allow CLEAN-clear once the setup has survived one full S4→S5 cycle without re-tripping), otherwise gate CLEAN-clear only from a state outside the active S4_ARMED re-arm path.

Do not issue v2 as drafted. Digest `AE436EBC96A1A5142EEB8484DFBE752E8E3B203B49FF73CC560BF899D7CBCFEC` reviewed as given; issue stands independent of file/on-disk verification, which I'm not adjudicating per your note.


## Opus answer - 2026-09-17 - answers v152 (DISCREPANCY D1-blocking + D2-D5; marker OPUS-V152-FILED-001)

## Verdict

**discrepancy** — three sites: **E1c clear branch (insert after OLD L7207)** + **E1e write (insert after OLD L2210)** interacting with **E1d (insert above OLD L9839)**. One blocking, three secondary. Do not issue v2 as drafted.

---

### D1 (blocking) — the clean-read clear can void the veto before the 10:40 latch, and the page's own counters say the deciding rows are missing

Mechanism as drafted, in execution order inside the OLD L7198-7207 block:

1. `CheckFreshness(barShift, …)` runs → E1e (after L2210) writes `g_freshLastOpp` from **this bar's** OPP read.
2. Non-OPP / empty return falls through to the new S4 persistence block, whose `else if(g_freshLastOpp == 0)` branch clears the veto **using the value just written in step 1**.

So the veto survives to E1d only if `oppFvg == 1` on **every** `ST_S4_ARMED` poll between the stamp and the confirming close. Every path to the S5 latch passes through `ST_S4_ARMED`, so every such path gets a clear opportunity first. That is a much narrower survival condition than the packet asserts.

On the motivating sequence the page cannot show that condition holds — and its own cumulative counters show the deciding evaluations exist and are withheld:

| event | cum1 | cum2 | inference |
|---|---|---|---|
| #155 (9/4 10:30, n=2) | 39 | 12 | stamp bar |
| #156 | — | — | not on page |
| #157 | — | — | not on page |
| #158 (9/4 15:55, n=1) | 42 | 12 | contributes 1 → pre-#158 cum1 = 41 |

39 → 41 across #156 and #157 with `cum2` flat at 12 means **both intervening evaluations were n == 1**, both printed (`InpDebugLog` on, print gate `t88_n > 0` at R3 L2211), and both fall between 9/4 10:30 and 9/4 15:55 — i.e. they are the 10:35 `S4_ARMED` poll and the 10:40 `S5_GATE_CHECK` poll of the re-seeded setup. Their `oppFvg` field is the single datum that decides the patch:

- `#156 oppFvg=1` (n=1 from OPP alone) → veto holds → E1d refuses the latch → G3 passes.
- `#156 oppFvg=0` (n=1 from `fvgDead`, the exact shape of all four wanted LONG rows) → `VETOCLEAR … why=CLEAN` at 10:35 → veto gone → `g_latchedEntry` assigned at L9839 → **the same SHORT/R=10.35 fires**. K2 is then a no-op by a different route than K1.

The v151 Opus rationale carried into the dispositions — "no clean `oppFvg=0` SHORT read **prints** between 10:35:06 and the 10:40 latch" — is a print-based test; the implemented clear is **read**-based and unconditional (E1e), and printing is gated on `t88_n > 0`. Absence of a row is not absence of a clean read. Two distinct surfaces, and the one that matters was never checked.

Required before issue, either:
- **(a)** the packet carries FRESHCOUNT #156 and #157 verbatim in the run rows, and G3's expected `FRESHVETO` row is re-ruled against `#156.oppFvg`; or
- **(b)** E1c's `else if(g_freshLastOpp == 0)` branch is narrowed so a clean read cannot clear the veto within the life of the re-armed setup that carries it (clear on setup change / day rollover only, or require the clean read to be strictly after a new seed). That matches the change's one-sentence intent — the refused short must not fire off the next candle — where the clean-read clear is precisely what re-opens it.

### D2 (rationale false on code) — E1c NEW header
"S5 UNREACHABLE for stamps — CheckFreshness returns `""` whenever kills=false (EA L2212-2213)" is wrong. `ABORT_UPSTREAM_UNREADY` returns at **L2208**, **L2210**, and inside the packed line at **L2211** (the `FL_BUF_LTF_FVG_VALID` read) are all independent of `twoOfThreeKills`. Non-empty S5 returns are reachable. The stamp-scope conclusion still stands, but solely because of the `fail == ABORT_FRESH_OPP_FVG` gate — not because S5 returns empty. Reword; the Luna/Astra "S5 half refuted on code" disposition rests on the false premise.

### D3 (OLD anchor byte mismatch) — E1e
Packet OLD: `if(!ReadFlow(FL_BUF_LTF_OPP_FVG,  oppFvg, barShift))`. Disk **L2209** (R3, re-read this turn): `if(!ReadFlow(FL_BUF_LTF_OPP_FVG,  oppFvg,  barShift))` — **two** spaces before `barShift`. Exact-match anchor fails as drafted. Also state the insertion as "after L2210 (the return), read at L2209" rather than "L2210, after the OPP read".

### D4 (minor, cosmetic) — E1c
`if(fail != "" && fail == ABORT_FRESH_OPP_FVG)` — first conjunct is dead; `ABORT_FRESH_OPP_FVG` is non-empty by construction.

### D5 (doc-vs-code) — E1b comment
"cleared by clean read / setup change / day rollover" omits that all three clears are reachable only while `g_state == ST_S4_ARMED` (E1c gate), while E1d consumes the veto on dir+anchor alone. Benign on current paths since any latch passes `S4_ARMED` first, but the comment should carry the state qualifier.

---

### What is clean

- **E1a** (L297 define) — fits the block, no collision with the ten existing codes.
- **E1b** globals at L1007 — declared ahead of all three read/write sites (L2210, L7198+, L9833+); ResetSequence-exempt + non-working-set is consistent with the field-20/21 membership rule as stated; `g_freshLastOpp = -1` "unknown keeps" is the right default direction.
- **E1c** stamp narrowing to OPP-only — resolves Luna's scope finding as claimed.
- **E1d** K1 withdrawal — the 10:30-stamp vs 10:40-latch proof holds; dropping the barTime term is correct.
- **Q4 / spec §3.4 scope** — the refusal lands at the confirmation close on a pre-confirmation S4 cause; S5 stays HOLD-only. No conflict, unchanged from v151.
- `StringSubstr(TimeToString(t, TIME_DATE), 0, 10)` is a no-op on a 10-char date string, harmless.

Genuineness vs disk (digest `AE436EBC`, 599014 B, packet `C5577419`) is out of scope per your split; I ruled the page only.


Ruled by name (builder dispositions — v3 answers each; disk-verified this turn; council arbitrates on the run):
- Sonnet (veto self-clears pre-latch; do-not-issue): ACCEPTED and CONFIRMED on disk. The re-seed's S4 poll at event 10:40:00 runs with n==0 (no FRESHCOUNT row for bar 10:35 although STATE S3->S4->S5 all print — rows carried above), so v2's open CLEAN would have fired silently and the SHORT would still fire. v3 gates CLEAN on spent==1 (exactly-once): the pre-kill clean read is seen but does not clear, BY DESIGN. The one guaranteed kill lands at the 10:40 latch with a positive FRESHVETO row; G3 additionally forbids any pre-kill CLEAN in that window (REPORT+HALT). Sonnet's recommendation (key the clear off something later than the re-arm poll) is implemented as the spent arm.
- Luna (clean-clear unreachable behind the abort return): ACCEPTED on mechanism; contract CHANGED, stated plainly in packet section 5. The E1c clear block now runs BEFORE any abort return (sees the fresh read on every S4 poll including aborting ones), but pre-kill clean reads do not clear under exactly-once — the K2 promise is withdrawn, not reordered. A clean read with a same-poll OB_DEAD abort therefore keeps a live veto alive while the current setup still dies on OB_DEAD: correct under the new contract (that setup never reaches a latch; the veto's single kill is preserved for the setup that does).
- Astra bullet 1 (clear-before-abort): ACCEPTED as implemented above (clear evaluated pre-return; spent-gated). Bullet 2 (E1d independent enforcement): ACCEPTED — E1d now BOUND/DAY-clears at the latch before consuming, so no S4 poll is needed to invalidate a stale veto. Declared consequence (packet section 5): an A→B→A interleaving lets B's latch clear A's veto — reported under G4, never auto-failed.
- Opus D1 (blocking; clean-clear voids veto): ACCEPTED and CONFIRMED (same disk proof as Sonnet). Option (b) taken: CLEAN narrowed to post-kill (spent==1) rather than carrying #156.oppFvg as the decider. D1(a) rows carried anyway in PROOF-ROWS. Correction owed on the row inference: #156 is NOT the 10:35 poll — disk shows #156=15:45, #157=15:50 (both S4 HOLD oppFvg=0 for the afternoon LONG setup), and the 10:35 re-arm poll is the SILENT n==0 read proven by the STATE rows. The blocking mechanism stands; the guess is corrected with thanks — absence of a row is not absence of a read, as Opus itself warned.
- Opus D2 (S5-UNREACHABLE false): ACCEPTED — header reworded; scope stands solely via the OPP gate (UPSTREAM_UNREADY S5 returns exist at L2208/2210/2211 but never equal OPP_FVG). The v152 Luna/Astra disposition premise is corrected on record here.
- Opus D3 (E1e anchor two-spaces): ACCEPTED and CONFIRMED on disk (L2209 `oppFvg,  barShift` dotted this turn) — packet OLD is now byte-exact with the spacing called out; insertion stated as after-L2210/read-at-L2209.
- Opus D4 (dead conjunct): ACCEPTED — dropped (`if(fail == ABORT_FRESH_OPP_FVG)`).
- Opus D5 (comment state qualifier): ACCEPTED — E1b comment carries the S4-only qualifier plus the E1d independent enforcement.
- Opus clean section: carried, no action (E1a/E1b placement/exemption, OPP narrowing, K1 withdrawal, Q4 scope, StringSubstr no-op).

Question (one, specific): issue packet P-FRESH-S5OPP v3 exactly as drafted (E1a define + E1b five exempt globals + E1c OPP-only stamp with pre-abort exactly-once persistence/clear + E1d latch-side BOUND/DAY enforcement with spent arm + E1e oppFvg expose with byte-exact anchor; S1 gate `AE436EBC`; G3 the five fires plus exactly-one-FRESHVETO silence at 9/4 10:40 with no pre-kill CLEAN; any miss REPORT+HALT) — yes, or discrepancy with line numbers?

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
