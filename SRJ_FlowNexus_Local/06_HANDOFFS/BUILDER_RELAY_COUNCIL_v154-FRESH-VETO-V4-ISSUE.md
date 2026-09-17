CODE REVIEW REQUEST — v154 — 2026-09-18

Change (one plain sentence): give the Sept-4 morning opposing-gap abort a veto that refuses exactly one latch and is zeroed as it refuses, so the refused short dies at 10:40 and anything later is decided in the open with a halt row.

File / function / lines: `Experts\SRJ_FlowNexus_EA.mq5` — abort defines OLD L295-305 (E1a inserts after L297, lands L298); globals OLD L1003-1007 (E1b inserts after L1007, lands L1008-1010); `CheckFreshness` OLD L2204-2214 whole (no change in v4 — E1e dropped); S4 poll OLD L7198-7207 (E1c); S5 latch OLD L9833-9843 (E1d inserts above L9839).
Source digest: EA SHA256 `AE436EBC96A1A5142EEB8484DFBE752E8E3B203B49FF73CC560BF899D7CBCFEC` / 599014 B (OLD regions re-read from disk this turn; uncommitted, no drift). Draft packet `01_TASKS\PACKET_P-FRESH-S5OPP.md` v4: 240 lines / `0B4F470B` / 14809 B.

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

R3 — CheckFreshness, whole function (unchanged by v4; carried so the no-E1e claim is checkable):
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

The change (packet §1, verbatim from the filed draft v4):
## 1. WHAT CHANGES (4 small sites, entry pipeline only)
E1a — abort-reason define: inserts AFTER EA L297 (`ABORT_FRESH_OPP_FVG`, so the
new line lands at L298 — Opus D4 convention): add `#define ABORT_FRESH_VETO "FRESH_VETO"`.
E1b — veto globals: inserts AFTER EA L1007 (`g_confirmFromState`, so the new
lines land at L1008-1010): ResetSequence-EXEMPT (survives the abort's own
reset, like the SLIMBR shadows; never working-set members; WS161 fields stay
21). V4 K4 CONTRACT (answers Astra + Opus-D2 v153): the veto kills EXACTLY
ONE latch — E1d zeroes it as it refuses, so a second refusal is impossible
by construction (no spent flag needed; Astra's gate superseded by consume,
which is stronger). Release = BOUND/DAY only (Opus-D1(a) adopted; the CLEAN
arm is GONE — Luna/Opus-D3 stale-0 fail-open dies with it). STATE QUALIFIER
(Opus D5): the S4 clears below run only while `g_state == ST_S4_ARMED`; E1d
enforces BOUND/DAY independently at the latch.
NEW:
```
//--- [P-FRESH-S5OPP E1-K4 2026-09-18] S4 FRESH-OPP-abort veto, consume-on-fire:
//--- stamped on abort, kills one latch, zeroed as it refuses. BOUND/DAY
//--- release (S4) and at the latch (E1d). ResetSequence-EXEMPT +
//--- non-working-set; WS161 stays 21.
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
NEW (K4 per v153 — consume replaces K3's spent gate; OPP-only stamp per Luna v151 STANDS;
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
      //--- [P-FRESH-S5OPP E1-K4] veto persistence, S4 ONLY, BEFORE any abort
      //--- return (Luna/Astra v152: the clear sees the fresh read even when
      //--- this poll aborts on another predicate). BOUND/DAY only — no CLEAN
      //--- arm (Luna/Opus-D3 v153: a stale-0 fail-open is unfixable in this
      //--- shape, so the arm is dropped, not narrowed). Audited by VETOCLEAR.
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
        }
      if(fail == ABORT_FRESH_OPP_FVG)
        {
         g_freshVetoBar = iTime(_Symbol, PERIOD_CURRENT, barShift);
         g_freshVetoAnchor = g_anchorLine;
         g_freshVetoDir = (int)g_dir;
         GoAbort(fail, g_state); return;
        }
      if(fail != "") { GoAbort(fail, g_state); return; }
     }
```
E1d — check at the S5 latch (before `g_latchedEntry` assignment). OLD:
```
      g_latchedEntry = currentPrice;
```
NEW (K4 per v153 — consume-on-fire; BOUND/DAY enforced at the latch per Astra
v152; no spent flag anywhere — Astra's gate and Opus-D2 superseded by consume,
which is stronger: a second refusal is impossible because the stamp is gone):
```
      //--- [P-FRESH-S5OPP E1-K4] veto (consume-on-fire): an S4 FRESH-OPP abort
      //--- for this anchor+direction refuses ONE latch (his ruled decline
      //--- rides the abort) and is zeroed as it refuses. K3's spent flag and
      //--- K2's CLEAN arm WITHDRAWN v4 (Sonnet/Opus-D1 + Luna/Opus-D3 v153).
      if(g_freshVetoBar != 0
         && (g_freshVetoDir != (int)g_dir || g_freshVetoAnchor != g_anchorLine))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=BOUND",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir));
         g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
        }
      if(g_freshVetoBar != 0
         && StringSubstr(TimeToString(g_freshVetoBar, TIME_DATE), 0, 10)
            != StringSubstr(TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE), 0, 10))
        {
         if(InpDebugLog)
            PrintFormat("[SRJ-EA] VETOCLEAR bar=%s dir=%s why=DAY",
                        TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                        DirName(g_dir));
         g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
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
         g_freshVetoBar = 0; g_freshVetoAnchor = -1; g_freshVetoDir = -1;
         GoAbort(ABORT_FRESH_VETO, g_state); return;
        }
      g_latchedEntry = currentPrice;
```
E1e — DROPPED in v4 (no reader remains: the CLEAN arm is gone, so no poll
needs the last OPP value; Luna/Opus-D3 stale issue dies with the arm).


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

Same archive (the silent-poll proof + the re-seed path; why v2/v3 died here):
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

Prior review (v153) — quoted complete from the verdict files, ruled by name:
Filed BUILDER_VERDICTS_ASTRA.md:
## Luna answer - 2026-09-18 - answers v153 (DISCREPANCY: stale-read CLEAN, do-not-issue; marker LUNA-V153-FILED-001)

discrepancy — **E1c/E1e stale-read clearing**.

At **L257-L269**, the CLEAN release clears when `g_freshLastOpp == 0`. But **L397-L403** explicitly says a failed OPP read leaves `g_freshLastOpp` stale and that this is supposed to **keep** the veto. A failed read at **L397-L399** can therefore leave a previous `0` in `g_freshLastOpp`, and E1c can incorrectly execute `why=CLEAN` before the `ABORT_UPSTREAM_UNREADY` return.

That contradicts the stated “stale-safe: unknown keeps” contract at **L229-L229**.

So **do not issue v3 exactly as drafted**; the CLEAN branch needs to distinguish a current successful `oppFvg==0` read from a stale value.


## Astra answer - 2026-09-18 - answers v153 (DISCREPANCY: E1d needs spent==0 gate; marker ASTRA-V153-FILED-001)

discrepancy — **E1d, insertion above OLD L9839:** the refusal condition never checks `g_freshVetoSpent == 0`. The first refusal sets `spent = 1` but leaves the stamp active; another same-day, same-anchor/direction latch can therefore be refused again unless an intervening clear occurs. An S4 poll with `obValid=1, fvgValid=1, oppFvg=1` neither aborts nor clears, so repeated refusal is possible without a new stamp.

Add `&& g_freshVetoSpent == 0` to E1d’s final refusal condition. As drafted, v3 does **not** implement “kills exactly one latch then releases.”

Filed BUILDER_VERDICTS_SLDEF4-5.md:
## Sonnet answer - 2026-09-18 - answers v153 (YES: exactly-once ordering traced, issue as drafted; marker SONNET-V153-FILED-001)

**Yes** — v3 as drafted correctly implements the exactly-once contract and closes the D1 hole that killed v2. Traced independently against the pasted code (not disk):

**Why the self-clear hole is closed:** In v2, `g_freshLastOpp` was set (E1e) *and* consumed by the CLEAN branch (E1c) within the same poll pass, so the very first clean re-arm poll after a stamp would clear the veto before it ever reached the L9839 latch. v3's CLEAN branch adds `&& g_freshVetoSpent == 1`, and the only site that ever sets `g_freshVetoSpent = 1` is the veto-fire branch inside E1d (the latch, OLD L9839) — nowhere in E1c. So on the first re-arm poll after a stamp, `spent` is still 0, the clean-read branch's guard fails, and the veto survives untouched into the S5 latch. Only *after* E1d has actually fired the veto once (`spent=1`) does a subsequent clean S4 poll get permission to clear it. That ordering can't be raced within a single tick either — E1c's persistence block runs and exits before E1d's latch code ever executes in that same cycle, so `spent` can't flip to 1 in time to affect the same pass's CLEAN check.

**Trace against the motivating rows:** 10:30 stamps (oppFvg=1, `ABORT_FRESH_OPP_FVG`). The silent (`t88_n==0`, unprinted) re-arm poll around 10:35 sets `g_freshLastOpp=0` via E1e but can't clear (spent still 0). At the 10:40 confirmation close, E1d finds `g_freshVetoBar≠0`, same dir/anchor, same day → fires `FRESH_VETO`, sets `spent=1`, aborts the latch. The four wanted LONG rows never have `oppFvg=1` in any FRESHCOUNT row shown, so no stamp is ever created for them — unaffected, as required.

**Astra's ordering fix and D-items:** confirmed present — persistence/clear block runs before both `fail==ABORT_FRESH_OPP_FVG` restamping and the generic `fail!=""` abort return (Astra bullet 1); E1d's BOUND/DAY clears are self-contained and don't depend on a successful S4 poll (Astra bullet 2); dead conjunct dropped (Opus D4); two-space anchor matches disk as stated (Opus D3, unverifiable by me but consistent with the packet's claim).

**One non-blocking point worth keeping visible, not hidden by "clean" status:** the CLEAN/BOUND/DAY clears in E1c only run while `g_state == ST_S4_ARMED` (E1b/E1d comments already flag this). If a killed, spent=1 veto's setup never revisits `ST_S4_ARMED` before its anchor/dir/zone is reused, it can only be released via BOUND/DAY at a *future* E1d latch call, not via E1c. That's the documented S4-only qualifier (Opus D5), already disclosed in the comments — not a new discrepancy, just flagging that it's a real (accepted) scope limit rather than a hypothetical one.

No line-number discrepancies found in E1a–E1e against the OLD anchors as given. Issue as drafted.


## Opus answer - 2026-09-18 - answers v153 (DISCREPANCY D1-blocking + D2-D4; marker OPUS-V153-FILED-001)

## Verdict

**discrepancy** — three sites, one blocking: **E1d consume block (insert above OLD L9839)** + **E1c CLEAN arm (inside OLD L7198-7207)** + **G3**, plus two secondary (**E1e write after OLD L2210 / E1b comment at L1007**). Do not issue v3 as drafted.

---

### D1 (blocking) — "then releases" releases *to the refused setup*, and G3 cannot see it

As coded, the release predicate is **"the first successful `oppFvg == 0` read on any `ST_S4_ARMED` poll after the kill, same day, same anchor+dir"** (E1c `else if(g_freshLastOpp == 0 && g_freshVetoSpent == 1)`). Nothing in that predicate distinguishes *a later setup* from *the same refused setup re-seeding*.

Trace on the motivating case, using the packet's own disk finding:

1. Bar 10:30, `S4_ARMED`: `CheckFreshness` → `ABORT_FRESH_OPP_FVG` (#155, oppFvg=1). E1c stamps, `spent=0`.
2. Event 10:40:00, re-seed `S3→S4→S5`: the S4 poll is the **silent n==0 read** the builder confirmed on disk. n==0 means `oppFvg=0`, so E1e (after L2210) writes `g_freshLastOpp = 0`. `spent==0` → no CLEAN, correct.
3. Latch (L9839): E1d fires `FRESHVETO`, `spent=1`, `GoAbort`. The 10:40 SHORT is refused. ✓
4. `GoAbort` resets the sequence; the veto is exempt and survives with `spent=1`. The Daily-POC SHORT re-seeds later the same session. Its S4 poll reads `oppFvg=0` again — the same silent n==0 shape just proven present on this setup at this anchor — and the CLEAN arm fires: `VETOCLEAR why=CLEAN`.
5. Next latch: `g_freshVetoBar == 0`, E1d falls through to `g_latchedEntry = currentPrice;` at L9839. **The same SHORT fires, one or two candles later than before.**

So the change buys a one-latch delay on the operator-ruled MUST-DECLINE setup (v14 R2, his A2: "it is invalid because the 5m in bias FVG has been invalidated and the validated OPP FVG"), not a decline. The one-sentence intent's second clause ("no later setup is held hostage") is implemented as "no *anything* is held hostage, including the setup that was just refused."

G3 as drafted cannot fail on this. It asserts (i) the five fires, (ii) exactly one `FRESHVETO` row at 9/4 10:40, (iii) no pre-kill `CLEAN`. All three hold in the trace above — and (iii) is unfalsifiable by construction, since `spent==1` makes a pre-kill CLEAN unreachable. The criterion that would catch the failure — **zero SHORT `SIGNAL`/`TP_ELECT` on Daily-POC after 9/4 10:40 through session close** — is absent. Nor can the archive settle it: the pre-patch run entered the trade at 10:40, so no post-10:40 re-seed rows for that setup exist to inspect.

Required before issue, either:
- **(a)** bind the release to something the refused setup cannot satisfy — setup change / day rollover only (i.e. drop the CLEAN arm from E1c and keep E1d's BOUND/DAY), or require the clean read to carry a seed identity distinct from the stamp's; or
- **(b)** keep the CLEAN arm and add the missing G3 row: no Daily-POC SHORT fire on 9/4 after 10:40, REPORT+HALT on any.

### D2 — "EXACTLY ONE latch per stamp" is false as coded (E1d L9839 consume block + E1c CLEAN arm)

E1d sets `spent=1` but never clears the veto; the clear is owed entirely to E1c's CLEAN arm, which needs `oppFvg == 0`. Reachable counter-case, straight off R3 L2212: `obValid=1`, `fvgValid=1`, `oppFvg=1` → `t88_n == 1` → verdict HOLD, no abort, no re-stamp. `g_freshLastOpp = 1`, so no CLEAN. The setup confirms, reaches L9839, and E1d consumes **again** (`spent` already 1, unchanged). Repeat per candle for as long as the opposing gap stays validated with the other two flags recovered.

Bounded only by BOUND/DAY. So the veto kills *N* latches, not one. That may even be the behaviour you want — but it is not the contract in E1b's comment or packet §1 K3, and it is the contract the council is being asked to ratify. Either reword both, or clear the veto in E1d immediately after emitting `FRESH_VETO`.

### D3 (secondary, doc-vs-code + wrong fail direction) — E1e write after OLD L2210, E1b comment at L1007

`g_freshLastOpp` is a process-lifetime global written on **every** successful OPP read, from any state and any `barShift` (E1e sits above L2211, so it also survives an FVG_VALID read failure). E1e's stated behaviour — "failed reads leave it stale = keep, fail-closed toward his decline" — holds only for the `-1` initial value. Once any successful `oppFvg=0` read has landed, a *failed* read on the post-kill poll leaves that stale `0` in place, the CLEAN arm accepts it, and the veto **releases**. That is fail-**open** toward the fire, the opposite of the stated direction. Either say so in E1b/E1e, or gate CLEAN on a value written by this poll's own call (per-call success flag, or an epoch stamped alongside `g_freshLastOpp`).

### D4 (cosmetic) — E1a / E1b line labels

Header says "adds one line at L297" and "adds five lines at L1007", but both are stated as insertions *after* those anchors (`ABORT_FRESH_OPP_FVG` = L297; `g_confirmFromState` = L1007), so the new text lands at L298 and L1008. The byte-exact anchors disambiguate, so this is not an application hazard — but match E1e's convention ("after L2210, read at L2209") for the other two.

---

### What is clean

- **E1a** define — fits the L295-305 block, no collision with the ten existing codes.
- **E1b** placement at L1007 — ahead of all read/write sites (L2210, L7198+, L9833+); exempt + non-working-set consistent with the field-20/21 rule; `-1` default is the right direction.
- **E1c** OPP-only stamp gate — Luna v152 scope finding stays resolved; D2(v152) rewording is correct (`UPSTREAM_UNREADY` at L2208/L2210/L2211 never equals `OPP_FVG`); D4(v152) dead conjunct dropped; `P-SCOPE34` comment byte-untouched.
- **E1c** clear-before-return ordering — closes Astra bullet 1 as a mechanism; the withdrawn-promise framing in §5 is stated plainly rather than papered over.
- **E1d** latch-side BOUND/DAY — closes Astra bullet 2; a stale veto can no longer refuse without a same-day same-setup stamp. K1 withdrawal still correct (10:30 stamp vs 10:40 latch).
- **E1e** OLD anchor — two spaces before `barShift` now byte-exact against L2209 (D3 v152 closed).
- **Q4 / spec §3.4** — refusal lands at the confirmation close on a pre-confirmation S4 cause; S5 stays HOLD-only. No conflict.
- The A→B→A revival consequence is declared under G4 rather than hidden. Accepted as declared.

Not adjudicated from the page: `GoAbort`'s handling of the new `ABORT_FRESH_VETO` code (alert text, A6REFUSED class, session counters) and `SrjOrderEmit(barShift, "FRESH_VETO")` — neither function body is on the page. Genuineness vs disk out of scope per your split; I ruled the page only.


Ruled by name (builder dispositions — v4 answers each; verified against packet v4 on disk this turn; council arbitrates on the run):
- Luna (stale-0 CLEAN fail-open; do-not-issue): ACCEPTED. The CLEAN arm is DROPPED whole (with E1e and both globals), not narrowed — the fail-open shape no longer exists anywhere in the change. There is no branch left that reads a possibly-stale OPP value, so no per-call freshness flag is needed. Verified: packet v4 §1 contains no CLEAN branch and no lastOpp reference outside history notes.
- Astra (E1d needs spent==0 gate): SUPERSEDED by consume, which is stronger and answers it literally. E1d zeroes bar/anchor/dir in the same block that emits FRESHVETO, before GoAbort — a second refusal is impossible because the stamp is gone, with or without any flag. The spent global itself is deleted. No new-stamp-less refusal path remains: re-stamping still requires a fresh OPP abort at S4.
- Opus D1 (blocking; release-to-refused-setup + G3 blind): ACCEPTED on both halves. (a) The CLEAN arm is dropped, release is BOUND/DAY only — the refused setup cannot be released to itself by any read. (b) The no-refire row is added to G3 exactly as specified (no Daily-POC SHORT SIGNAL on 9/4 after 10:40 through close, REPORT+HALT). One deliberate fence, stated in packet sections 2 and 5: the HALT routes to HIS adjudication and is never auto-failed — his decline covers the 10:35/10:40 bar, and a day-long veto (the other D1(a) variant, seed-identity binding) would presume an extension only he can rule, so it was rejected with reason on record.
- Opus D2 (N latches, not one): ACCEPTED and closed by construction — consume-on-fire zeroes the veto at refusal, so the oppFvg==1-persists counter-case now fires exactly once (first latch refused, stamp gone, subsequent latches unvetoed and reported under G3/G4). E1b comment and §1 K4 state the consume contract; no rewording gap remains.
- Opus D3 (stale-0 doc-vs-code): MOOT — E1e deleted, no global glosses any fail direction anymore.
- Opus D4 (line labels): ACCEPTED — E1a/E1b now state after-anchor/lands-at convention (L298, L1008-1010); E1e label gone with E1e.
- Sonnet YES on v3: credited for the spent-ordering trace (correct as far as it went — pre-kill CLEAN correctly shown unreachable under K3) but OUTRANKED per dissent-priority: it did not trace post-kill re-fire or the missing consume, which three seats proved on the page and disk. Its S4-only scope note is carried (comments still flag it; E1d enforcement is the compensating control, unchanged).

Question (one, specific): issue packet P-FRESH-S5OPP v4 exactly as drafted (E1a define + E1b three exempt globals + E1c OPP-only stamp with pre-abort BOUND/DAY persistence and no CLEAN arm + E1d latch-side BOUND/DAY enforcement with consume-on-fire; S1 gate `AE436EBC`; G3 the five fires plus exactly-one-FRESHVETO silence at 9/4 10:40 plus the no-refire HALT row; any miss REPORT+HALT) — yes, or discrepancy with line numbers?

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
