CODE REVIEW REQUEST — v152 — 2026-09-17

Change (one plain sentence): give the Sept-4 morning opposing-gap abort persistence so the refused short cannot fire off the next candle, using a sticky veto that clears on a clean read, a setup change, or a day rollover.

File / function / lines: `Experts\SRJ_FlowNexus_EA.mq5` — abort defines OLD L295-305 (E1a adds one line at L297); globals OLD L1003-1007 (E1b adds four lines at L1007); `CheckFreshness` OLD L2204-2214 whole (E1e adds one line at L2210); S4 poll OLD L7198-7207 (E1c); S5 latch OLD L9833-9843 (E1d inserts above L9839).
Source digest: EA SHA256 `AE436EBC96A1A5142EEB8484DFBE752E8E3B203B49FF73CC560BF899D7CBCFEC` / 599014 B (verified this turn, uncommitted, no drift). Draft packet `01_TASKS\PACKET_P-FRESH-S5OPP.md` v2: 188 lines / `C5577419` / 11095 B.

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

The change (packet §1, verbatim from the filed draft v2):
## 1. WHAT CHANGES (4 small sites, entry pipeline only)
E1a — abort-reason define (EA L297): add `#define ABORT_FRESH_VETO "FRESH_VETO"`
after the `ABORT_FRESH_OPP_FVG` line. OLD: `#define ABORT_FRESH_OPP_FVG    "FRESH_OPP_FVG"`.
E1b — veto globals (EA L1007, after `g_confirmFromState`): ResetSequence-EXEMPT
(survives the abort's own reset, like the SLIMBR shadows; never working-set
members; WS161 fields stay 21). V2 K2 RATIONALE (Opus amendment): the veto
holds while the same setup lives and no clean OPP read arrives for it; it
clears on (a) a clean OPP read (oppFvg==0) for the same dir+anchor, (b) a
different seeded setup (dir/anchor mismatch = stale veto), or (c) calendar
day rollover. Stale-safe: `g_freshLastOpp` initializes -1 (unknown = keep).
NEW:
```
//--- [P-FRESH-S5OPP E1-K2 2026-09-17] S4 FRESH-OPP-abort bar-veto: stamped on
//--- abort, read at the S5 latch, cleared by clean read / setup change / day
//--- rollover. ResetSequence-EXEMPT + non-working-set; WS161 stays 21.
datetime         g_freshVetoBar    = 0;
int              g_freshVetoAnchor = -1;
int              g_freshVetoDir    = -1;
int              g_freshLastOpp    = -1;
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
NEW (OPP-only stamp per Luna v151; S4-scoped K2 persistence per Opus v151;
P-SCOPE34 comment byte-untouched; S5 UNREACHABLE for stamps — CheckFreshness
returns "" whenever kills=false (EA L2212-2213), so Astra's S5-stamp half is
refuted on code and only the S4-OB_DEAD narrowing stands):
```
   if(g_state >= ST_S4_ARMED && g_state <= ST_S5_GATE_CHECK)
     {
      //--- [P-SCOPE34] the 2-of-3 kill is PRE-CONFIRMATION ONLY: at S4_ARMED the
      //--- poll kills as built; at S5_GATE_CHECK (post-confirming-close) it is
      //--- diagnostic-only (scope=post, verdict=HOLD) - the only cancellation
      //--- there is the live bias flip (the three-flag conjunction is the same
      //--- event per spec sections 3.4/5.5).
      string fail = CheckFreshness(barShift, g_state != ST_S5_GATE_CHECK);
      if(fail != "" && fail == ABORT_FRESH_OPP_FVG)
        {
         g_freshVetoBar = iTime(_Symbol, PERIOD_CURRENT, barShift);
         g_freshVetoAnchor = g_anchorLine;
         g_freshVetoDir = (int)g_dir;
         GoAbort(fail, g_state); return;
        }
      if(fail != "") { GoAbort(fail, g_state); return; }
      //--- [P-FRESH-S5OPP E1-K2] veto persistence, S4 ONLY (frozen for the S5
      //--- latch below): keep while the same setup lives with no clean OPP
      //--- read; clear on clean read / setup change / day rollover, audited
      //--- by VETOCLEAR. Stale-safe: unknown (-1) keeps.
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
            g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
           }
         else if(g_freshLastOpp == 0)
           {
            if(InpDebugLog)
               PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=CLEAN",
                           TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                           DirName(g_dir));
            g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
           }
        }
     }
```
E1d — check at the S5 latch (before `g_latchedEntry` assignment). OLD:
```
      g_latchedEntry = currentPrice;
```
NEW (K2 per Sonnet/Opus/Astra v151 — no barTime equality; stamped bar rides
as a log field only; vetoBar asserted by G3):
```
      //--- [P-FRESH-S5OPP E1-K2] veto (sticky-until-clean-read): an S4
      //--- FRESH-OPP abort for this anchor+direction refuses the latch (his
      //--- ruled decline rides the abort; cleared only by clean read, setup
      //--- change, or day rollover per E1c). K1 WITHDRAWN v2 (proven no-op:
      //--- stamp 10:30 vs latch 10:35/10:40 on the motivating sequence).
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
         GoAbort(ABORT_FRESH_VETO, g_state); return;
        }
      g_latchedEntry = currentPrice;
```
E1e — expose oppFvg for the clean-read clear (EA L2210, after the OPP read;
one global already declared in E1b; early-return paths leave it stale = keep,
fail-closed toward his decline):
OLD: `   if(!ReadFlow(FL_BUF_LTF_OPP_FVG,  oppFvg, barShift))`
`      return ABORT_UPSTREAM_UNREADY;`
NEW: same two lines plus `   g_freshLastOpp = (int)MathRound(oppFvg);` after
the read (before any return that has a value).


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

Prior review (v151) — quoted complete from the verdict files, ruled by name:
Filed BUILDER_VERDICTS_ASTRA.md:
## Luna answer - 2026-09-17 - answers v151 (DISCREPANCY: stamp-any-fail broader than OPP scope; marker LUNA-V151-FILED-001)

discrepancy — lines 159–171: E1c stamps `g_freshVetoBar/Anchor/Dir` for **any** `fail != ""`, not specifically `ABORT_FRESH_OPP_FVG`. E1d then consumes that stamp at lines 203–223, so the veto can suppress S5 after an unrelated freshness abort as well. The drafted change therefore is broader than the stated S5-opposing-FVG persistence scope.


## Astra answer - 2026-09-17 - answers v151 (DISCREPANCY: K1 bar-miss + stamp-scope + K2-comment-only; marker ASTRA-V151-FILED-001)

discrepancy

- **E1c, OLD L7198–7207; E1d, OLD L9833–9843:** K1 stamps the **evaluated bar**, not the abort-instant bar. On the supplied sequence, that is **10:30**; the subsequent **10:35-eval** latch cannot match it. K1 therefore does not persist this abort into the offending latch. REPORT+HALT detects the miss; it does not correct the key.
- **E1c, OLD L7198–7207:** The stamp covers **every nonempty `CheckFreshness` return at S4 or S5**, not exclusively an S4 abort as documented. An S5 live-bias-flip abort also stamps the veto.
- **E1d, OLD L9833–9843:** K2 is a comment-only alternative, not an implemented substitute. Its clean-read clearing logic is absent; issuing it requires an explicit code amendment, not merely selecting the alternate.

Filed BUILDER_VERDICTS_SLDEF4-5.md:
## Sonnet answer - 2026-09-17 - answers v151 (DISCREPANCY: K1 misses 10:30-vs-10:35; substitute K2; marker SONNET-V151-FILED-001)

**Discrepancy** — the K1 bar-equality check in E1d would not have vetoed this trade, based on the log evidence given.

**Where the mismatch is:**

- E1c stamps `g_freshVetoBar = iTime(_Symbol, PERIOD_CURRENT, barShift)` at the moment `CheckFreshness(barShift, …)` returns non-empty — i.e., using the *same* `barShift` that produced the FRESHCOUNT line.
- The FRESHCOUNT line that triggered this abort is:
  `FRESHCOUNT #155 bar=2026.09.04 10:30 … verdict=ABORT`
  So `g_freshVetoBar` gets stamped to **10:30**, not 10:35.
- But the setup that actually re-armed, confirmed, and fired is keyed to bar **10:35** (confirmed at 10:40):
  `TP_ELECT … bar=2026.09.04 10:35 latchBar=2026.09.04 10:40`
- E1d's check is:
  `g_freshVetoBar == iTime(_Symbol, PERIOD_CURRENT, barShift)`
  evaluated at the S5 latch, where `barShift` resolves to the signal bar, **10:35**.

`10:30 != 10:35`, so the K1 equality test fails, `g_freshVetoBar` never matches, and the veto does not trip. The E1d block falls through to `g_latchedEntry = currentPrice;` exactly as it did before the patch — the same SHORT/R=10.35 fire would still occur under the drafted code.

The `A6REFUSED`/`STAND-DOWN` lines are stamped `bar=10:35` (one bar later than the FRESHCOUNT that actually decided ABORT), which is the tell: whatever prints the abort-event lines is using a different bar reference than `CheckFreshness`'s own `barShift`. E1c inherits `CheckFreshness`'s `barShift` (10:30), while the thing it needs to match at S5 is the 10:35 bar. A single-bar exact-equality veto can't bridge that one-bar gap by construction.

**Call:** issue-amended, substitute K2 (sticky-until-clean-read: hold the veto until a FRESHCOUNT with `oppFvg=0` prints for the same anchor/dir) rather than K1. K1 as literally specified in E1d fails on the packet's own motivating case.

If the real intent is closer to K1's spirit (bar-scoped, not sticky), the alternative fix is to change what `barShift` E1c stamps against — e.g. stamp on the *next* bar open rather than the aborted bar's close — but that's a different, unreviewed change, not what's drafted. Given only the two options offered, K2 is the one that actually vetoes the logged case.


## Opus answer - 2026-09-17 - answers v151 (ISSUE-AMENDED K2 + E1b/G3 changes; secondaries; marker OPUS-V151-FILED-001)

## Verdict

**issue-amended — substitute K2** (sticky-until-clean-read), and amend E1b to match. E1a and E1c ship as drafted.

## Why K1 cannot pass its own gate

K1's predicate is `g_freshVetoBar == iTime(_Symbol, PERIOD_CURRENT, barShift)` evaluated at the insertion point immediately above OLD **L9839** (`g_latchedEntry = currentPrice;`). That is the same expression the OLD latch block uses five lines down at **L9843** (`g_latchBarTime = iTime(_Symbol, PERIOD_CURRENT, barShift);`), and the archive prints what it resolves to:

```
TP_ELECT ... bar=2026.09.04 10:35 latchBar=2026.09.04 10:40
```

So the latch-side value on the target bar is **10:40**.

The stamp side, inserted in the fail branch of the OLD **L7198-7207** block, resolves to the poll's own bar — and the archive gives two labels for that single abort, neither of them 10:40:

- `FRESHCOUNT #155 bar=2026.09.04 10:30 ... verdict=ABORT scope=pre`
- `A6REFUSED bar=2026.09.04 10:35 ... predicate=FRESH_OPP_FVG`

Under either resolution (10:30 or 10:35), `10:30 != 10:40` and `10:35 != 10:40`. The equality is false on the one bar the packet exists to silence. Your own read states the gap plainly: "the 10:35-eval seed latched and SIGNAL-fired at 10:40 with no intervening FRESH row for 10:35 … one candle." K1 is a no-op against that geometry, G3's "9/4 10:40 silent" fails, and the run REPORT+HALTs on the sequence it was built for.

K2 clears it: no clean `oppFvg=0` SHORT read prints between 10:35:06 and the 10:40 latch, so the veto is still held and the latch is refused. The four wanted LONG fires all show `oppFvg=0` at S4 and never stamp, and dir-inequality against the stamped SHORT keeps them untouched; 8/28 has no FRESH row at all. Five fires stand, extra fire dies.

### Changes to state in the amendment

1. **E1d** — replace the K1 conjunct with K2: veto holds while `g_freshVetoBar != 0` and `g_freshVetoDir == (int)g_dir` and `g_freshVetoAnchor == g_anchorLine`; drop the barTime equality term entirely (keep the stamped barTime as a log field only).
2. **E1b** — the rationale comment is now wrong and must change with it. "Single-bar scope via barTime equality — stale bars never match, no reset hook, no tolerance" no longer describes the mechanism. K2 needs an explicit clear path: clear on a `FRESHCOUNT` with `oppFvg=0` for the same dir+anchor, and bound it on anchor change / session or day rollover so a veto cannot ride indefinitely. Still ResetSequence-EXEMPT, still non-working-set, WS161 stays 21.
3. **G3** — silence at 9/4 10:40 is not proof under K2, since any other path can also produce silence. Assert positively: exactly one `FRESHVETO` row, `dir=SHORT`, bar-stamp 2026.09.04 10:30 or 10:35, and zero `FRESHVETO` rows across the five wanted fires. Add a held-count print so over-suppression is visible rather than inferred.

### Re-verified independently

- Subsumption of the omitted POI fallback (L53–L57), on the POI candidate set: correct.
- `anchorRank` hoisted to L30 and still in scope for the census: correct.
- Census rank filter now matches E1 (anchor skip dropped in the second loop), `winner` overwrite order session→POI is correct, print-only, no control-flow effect.
- Arithmetic re-verified from the latch rows: 144/42 = 3.43, 297/171 = 1.74, 180/37 = 4.86, 54/23 = 2.35, 135/53 = 2.55. Yearly-VWAP is self-consistent at 1.16315 across the three September bars.
- Zone containment: margins 62–292 points against 11–26 point zones, so adjacent-bar staleness cannot flip any of the five. The in-zone guard does not exclude the predicted winners.

### Changes to state in the amendment

1. **E1d** — replace the K1 conjunct with K2: veto holds while `g_freshVetoBar != 0` and `g_freshVetoDir == (int)g_dir` and `g_freshVetoAnchor == g_anchorLine`; drop the barTime equality term entirely (keep the stamped barTime as a log field only).
2. **E1b** — the rationale comment is now wrong and must change with it. "Single-bar scope via barTime equality — stale bars never match, no reset hook, no tolerance" no longer describes the mechanism. K2 needs an explicit clear path: clear on a `FRESHCOUNT` with `oppFvg=0` for the same dir+anchor, and bound it on anchor change / session or day rollover so a veto cannot ride indefinitely. Still ResetSequence-EXEMPT, still non-working-set, WS161 stays 21.
3. **G3** — silence at 9/4 10:40 is not proof under K2, since any other path can also produce silence. Assert positively: exactly one `FRESHVETO` row, `dir=SHORT`, bar-stamp 2026.09.04 10:30 or 10:35, and zero `FRESHVETO` rows across the five wanted fires. Add a held-count print so over-suppression is visible rather than inferred.

### Secondary notes, non-blocking

- Anchor label mismatch on the page: the prose says "Same anchor (Daily average)", the raw alerts say `Daily-POC` on both the STAND-DOWN and the SIGNAL. The comparison is int equality on `g_anchorLine` and holds either way, but reconcile the label before filing.
- `g_freshVetoAnchor` is captured pre-abort and read post-re-seed. Both alerts print the same anchor here, so it holds on this run; if a re-seed can ever re-derive the same line to a different index, that conjunct becomes a silent false-negative. Worth a note in the packet, not a code change now.
- Scope: the refusal lands at the confirmation close, before the entry open, and its cause is a pre-confirmation S4 abort at 10:35:06 — so it does not reach the post-confirmation hold that Q4 and spec §3.4 protect. S5 stays HOLD-only as claimed. No conflict found.

### What is clean

- Subsumption of the omitted POI fallback (L53–L57), on the POI candidate set: correct.
- `anchorRank` hoisted to L30 and still in scope for the census: correct.


Ruled by name (builder dispositions — v2 answers each; council arbitrates on the run):
- Luna (stamp-any-fail broader than OPP scope): ACCEPTED. v2 E1c stamps only on `fail == ABORT_FRESH_OPP_FVG`. S5-stamp half REFUTED on code: CheckFreshness returns "" whenever kills=false (R3 OLD L2212-2213 above), so no S5 stamp is reachable; only the S4 OB_DEAD narrowing stands (unstamped abort, behavior unchanged).
- Sonnet (K1 misses 10:30-vs-10:35; substitute K2): ACCEPTED. K1 WITHDRAWN in v2 (packet E1d NEW states the withdrawal with the 10:30-vs-10:35/10:40 proof); E1d is K2 with no barTime term; the stamped bar rides as a log field only.
- Astra (K1 bar-miss + stamp-scope + K2-comment-only): ACCEPTED on all three. K2 is now implemented code (E1b globals + E1c stamp/persistence/clear + E1d check + E1e expose), not comment-only, with the VETOCLEAR audit row; stamp is OPP-only; S5 half refuted on code as above.
- Opus (issue-amended K2 + E1b/G3 changes; secondaries): ACCEPTED. E1b rationale rewritten with the three clear paths (clean read / BOUND / DAY), still ResetSequence-exempt, non-working-set, WS161 stays 21. G3 asserts exactly one FRESHVETO (dir SHORT, vetoBar 2026.09.04 10:30) plus zero across the five, with VETOCLEAR rows reported — held-count visibility rides on the existing rows, no new print (deviation from the letter of the amendment, stated here). Secondaries: anchor label fixed to Daily-POC throughout; anchor-index false-negative note added to packet section 5 (note, not code); Q4/spec-3.4 scope confirmed — the refusal lands at the confirmation close on a pre-confirmation S4 cause, S5 stays HOLD-only.

Question (one, specific): issue packet P-FRESH-S5OPP v2 exactly as drafted (E1a define + E1b exempt globals + E1c OPP-only stamp with S4 persistence/clear + E1d K2 check + E1e oppFvg expose; S1 gate `AE436EBC`; G3 the five fires plus exactly-one-FRESHVETO silence at 9/4 10:40; any miss REPORT+HALT) — yes, or discrepancy with line numbers?

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
