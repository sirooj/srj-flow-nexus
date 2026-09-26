# BUILDER RESULT V287-GRADE - four verdicts tallied NO-CLEAR (HALT 3/3), fold v3 owed (2026-09-26)

## 1. Inbound + novelty (two-ways, before analysis)
- 4 pasted texts ruling packet P-ENTRY-2 v2 / relay v287: Luna Q1-NO/Q2-YES/Q3-YES; Astra Q1-NO/Q2-NO/Q3-NO; Sonnet Q1-NO/Q2-YES/Q3-YES; GLM Q1-NO/Q2-NO/Q3-YES.
- Bash: distinctive substrings 0 hits each (Luna "E1 does not exactly implement"; Astra "AnchorStr()`, so the S54VOID"; Sonnet "I can only judge the logic"; GLM "Ruled on the page only (packet text, code companion, rows fence)"); V287 markers 0x pre-file all four files; controls 1x each (Luna V285-END; Astra V284-END; Sonnet V285-END; GLM V285-END). Read tails: Luna closes V285, Astra V284, Sonnet V285, GLM V285. NOVEL all four.
- Stop-condition: EA D74FE972/633552/11502 + packet E1C20F3C/18786/172 + relay 76E47DDF/41055/407 all re-measured PASS (Count-method parity: [IO.File] counts; the handoff resume line's "11552" is a typo against the everywhere-filed 11502).

## 2. Filing (whole 1x, verified OPEN=1 END=1 each + tail read-back)
- LUNA (10377 -> 10387, +10); ASTRA (16966 -> 16998, +32); SONNET (2047 -> 2063, +16); GLM (4643 -> 4706, +63). Staged via literal-Edit params (ASCII anchors).

## 3. Tally: NO-CLEAR (dual-key: either seat halts; halt on all three questions)
- Q1: 0-4 NO (Luna + Astra + Sonnet + GLM). HALT.
- Q2: 2-2 (Luna YES + Sonnet YES vs Astra NO + GLM NO). HALT.
- Q3: 3-1 (Luna + Sonnet + GLM YES vs Astra NO). HALT.
- No key spent, no build, no run, no transport.

## 4. Same-turn disk verification of every checkable dissent claim
- D1 seed-edge (all 4): HOLDS. Packet L21 "(seedbar, evaluation bar] - seed-exclusive" vs L68 `s54_s <= s54_seedShift` (walks the seed bar). Text, code, and P158 "(seed, 16:40]" disagree at the edge.
- D2 S54VOID poi-field (Astra): HOLDS. Packet L84 clears `g_anchorLine = -1` before L88 `AnchorStr()`; EA L1718 returns "-" for line < 0. The row always prints poi=-. Fix: capture before clearing.
- D3 P156 tuple (Astra): HOLDS. P156 demands "S54VOID at the 18:10 evaluation (bbar 18:10)"; rows fence shows RETESTBOOK bar=18:10 printed at pass 18:15:00 + CONFIRMPOLL bar=18:15 at 18:20:01. Evaluation/evaluated/break-bar must be specified separately.
- D4 A-STALE-901 route (GLM): HOLDS, then RESOLVED-BY-ROWS. EA PREBIND_S2/CONFIRM_PREBIND_S2 = 0 hits (P030 holds); R67 PD/KO rows are build E8B0E582, not D74. Triage join: RECON60 ran D74FE972 (result L16) and its segment shows the 9/1 15:25 pass routing S1->S2_LTF_ALIGN (S2WAIT retained) - never reaches site (a)/(b). R60: PREBIND-any=76 (all _FAIL kinds), STALE=0 (re-proved, second pattern), S54VOID=0 (re-proved). So no STALE row can print at 15:30 on D74; the non-take is S2-hold structure. Fold re-targets A-STALE-901 to D74 rows + defense-in-depth.
- D5 stale "owed" lines (GLM): HOLDS. L25 "(E3 owed)" vs L40-42 retirement; L169 "UJ detector owed"; L160 A-UJ-OWED beside L161-163 PROPOSED criteria. Fold amends all.
- D6 FRESHCOUNT pin (GLM): HOLDS, RESOLVED. EA refs = 2286/2295/7190/7220/7222/7223 (6). L35 vs L151 disagree. Fold pins the 6-id set in both.
- D7 UJ2 census-vs-booking (Astra/GLM): HOLDS as predicate-time precision. EA L2410-2413 census read-only ("names the winner without touching it"); booking race L2396-2409; naming loops L2441-2465; booked store best/haveBest (15 refs). Fold says booking+census pool with all four cites + retarget store/degenerate pins.
- D8 UJ1 limit-vs-lock + DIV reach (Astra): HOLDS as reconcile items. L13 limit-at-close vs L35 next-open lock; C8851-8869 region contains DIV_WAIT + evict-abort (relay C8856-8868). Fold reconciles (lock commits at confirming close, entry next-open per next-open precedent) and bounds option (i) outside DIV-refusal machinery.
- D9 UJ3 generality (Astra): HOLDS as proposal-shaping. Pasted rows show only the 14:45 failure (MH confirm=0); no 14:35 flip row. Fold fields the exact flip predicate + timing + replaced terms + E1 precedence + FVG-yield boundary (FRESH_OPP_FVG/FRESH_OB_DEAD 7 hits each).
- Mechanics affirmed (carried into v3 unchanged): E1 fence/predicate-idiom/fail-open/reseed (Sonnet recompute agrees); E2 strict-</retain at both sites (Luna + Sonnet agree); S3 v2 arithmetic +46/post 11548 (GLM recount agrees); 9/7 preserved by rule text modulo the seed-edge fix.

## 5. Owed next (in order, this block)
- Packet v3 (code-side `<` + poi-capture + re-tupled P156 + re-targeted A-STALE-901 on D74 rows + hygiene + UJ predicate notes) + relay v288 (re-twinned, D74-labeled rows fence, battery-green). No council transport until battery-green.
- After battery-green: transport memo (no key/build/run asked).

(End of file)
