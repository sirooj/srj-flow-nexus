# PACKET_P-RETEST-2 v2 DRAFT - R2 voids MEANREV-classified seeds only (trend setups never void; v1 SAME-CANDLE yield superseded)

Status: v2 DRAFT (supersedes v1 7FB01FAA, never transported - v1's confirm-yield replaced by regime scoping per his TREND-SWEEP-IRRELEVANT ruling). Nothing builds, runs, or commits on this file. Clearance via a clearance relay plus token plus his run word, all owed. Canonical files: exactly ONE - Experts\SRJ_FlowNexus_EA.mq5 (E1: scope the R2 void branch to classified mean-reversion, 1 line modified, +0/-0). No new indicator buffers. Nothing under 02_TASK_CHECKPOINTS. No commit without token. Booking (closed by proof)/classifier (EA untouched)/exits/rank-guard/R-floor/confirmation-terms/alert/SL/TP/HTF/session code: all UNCHANGED.
Successor context: RECON57 (built tree 98F6BBAC, graded 5 of 7 valid with fills); this packet restores the 2 sweep-then-retest takes, graded per fix below.

## Authority (all on record, no invention)

- His sweep-then-retest validity 2026-09-22 with chart proof (strategy skill section 2): 8/28 London valid (AS.L sweep, then D VWAP retest) + 9/7 New York LONG valid (liquidity swept, then W POC retest latest). His trend read on 9/7 (4H/1H/15m all bullish).
- His FRESH-SWEEP RULE 2026-09-23 (strategy skill section 5, verbatim-filed): previous-day lines count for mean-reversion setups ONLY if freshly swept same-session current-day.
- His TREND-SWEEP-IRRELEVANT ruling + TAKE DEMAND 2026-09-23 (strategy skill section 5, verbatim-filed): on trend-following setups session sweeps do not matter - the 9/7 LONG takes. Later words amend the unscoped renewal rule; the any-demo/login-param/OnInit parks are untouched by this packet.
- His SEED-CARRY EXPECTATION (ledger 618 + strategy skill section 5): seeds persist to confirmation; dropping them bar-to-bar regresses RECON51.
- 51 fills as target figures: 8/28 10:05 SHORT entry 1.16466 R3.43 (carried 09:55, confirm=1 on 10:00 bar) + 9/7 16:45 LONG entry 1.16261 R2.34 (carried 14:55, confirm=1 on 16:40 bar).
- Disk mechanism this tree (RECON55/57 segments): R2 SEEDVOID kills 8/28 09:55 SHORT at 10:00 wall (buf=12 line 1.16482) + 9/7 14:55 LONG at 15:00 wall (buf=15 line 1.16218, tester lo touches to the pip); both seeds die in S1 with regime NONE (never classified pre-void - rows show S1-to-IDLE with no S2 transition); 51 predates R2 (built RECON53) so carried both.
- H1 answered (his chart image, data window: 9/7 15:00 low 1.16224 vs line 1.16218): no touch on his feed. E1 makes the answer moot for takes (both feeds take - tester via scoping, his via no-touch).
- Journal: row 257 (8/28 TAKEN +0.10/1.21R) + rows 283/284 (9/7 VALID LONG).

## Rule (one scoping condition)

- The R2 renewal void fires ONLY on MEANREV-classified seeds (g_regime == REGIME_MEANREV at void time). Unclassified (NONE, incl every fresh S1 seed) and TREND/BOTH-classified seeds never void on liquidity touch: trend setups are sweep-irrelevant per his ruling, and unclassified seeds must default-keep (EA classifier silence plus his TAKE demand force it - voiding the unknown reproduces exactly the misses he demands fixed).
- His renewal rule survives intact where it was designed: classified mean-reversion setups still void on touch (freshness semantics unchanged); the 9/4 10:35 INVALID SHORT path is preserved (S1-NONE seeds reach S5 veto refusal regardless - defense in depth, graded in G2).

## Scope (retest restoration only)

- REQUIRED (both hard gates): 8/28 take 10:05 entry 1.16466 R3.43 + 9/7 take 16:45 entry 1.16261 R2.34 (51 fills as targets; lots balance-sized).
- Session-mark consequences of both takes (used sessions, MTCOLLISION boundary, post-take re-seed deaths) itemized at grade, never assumed.
- Untouched: booking (closed by proof), classifier code (EA untouched - scoping reads its output only), exits, rank gate, R floor, votes, terms, alerts, legs, sessions. PD-bit staleness (bits 14-21 never set) carried as named council debt, not this packet.

## Edit set (exact verbatim; STAGE-1 exact-diff gated; byte-verified anchors)

- E1 scope R2 void to mean-reversion (EA R2 block L7782 `      if(r2_touch)`, 6-space indent, +1 modified, +0/-0 new/deleted):
  old L7782: `      if(r2_touch)`
  new L7782: `      if(r2_touch && g_regime == REGIME_MEANREV)`
  (g_regime global in scope; ENUM compare, no casts; fresh S1 seeds read NONE via ResetSequence; S2-classified seeds read their label; single-hit verified for the old line)

## Stages (T161N discipline; RECON57 precedent)

S1 Pre-hash gate: re-hash EA (must equal 98F6BBACEE96A182D1C46D7605886E45886316FB636C3031C2CD7FD6083B736C / 622124 B / 11317 lines) plus Panels 4335F703/17047/456 plus ImbalanceMgr 568F4CE9/26422/612 plus State 80A466AC/18231 plus Sessions E12076C4/27178 plus FlowLogic 956BF3E3/70308 plus single-hit (old L7782 line + REGIME_MEANREV uses) plus char-code assert every OLD anchor above; assert no new buffers. Miss = DIAGNOSE, never assume, never revert. S2 Apply E1 exact-diff (expected post-build EA 11317 +0/-0/+1 modified; lines 11317; rest +0). S3 Post-hash plus budget arithmetic from literal counts. S4 Compile both targets 0 errors 0 warnings. S5 Run under RECON50_DEMO_USD (same terminal, InpMode 1, 2026-08-26 to 2026-09-10, InpDebugLog=true), ceiling 90 min - ONLY on token plus his run word.

## Acceptance (grade segment-vs-RECON57)

G1 Build: 0 errors 0 warnings both targets; post-hashes recorded; budget EA 11317 +0/-0/+1 modified from literals, lines 11317, rest +0; commit text prepared, commit only on token.
G2 Takes-restored (double hard gate): 8/28 take 10:05 entry 1.16466 R3.43 + 9/7 take 16:45 entry 1.16261 R2.34 (MTSNAP/SIGNAL/OrderSend chains; lots balance-sized); other 5 takes identical bars/entries; SEEDVOID rows absent on 8/28 09:55-seed and 9/7 14:55-seed paths (void-class rows re-derived machine-side); 9/4 10:35 INVALID SHORT still refused at S5 (defense in depth); MTCOLLISION reads itemized. Session-mark consequences of both takes itemized. Any unpredicted election delta HALTS.
G3 State-identical plus takes: all non-exit families count-identical vs RECON57 except downstream of the two takes; verdict deltas itemized bar-for-bar; alert kinds SIGNAL/EXIT/HEADS-UP/STAND-DOWN only.
G4 Exits: 8/28 exit 11:40 1.16439 higher-break (51 shape; rank gate preserved: anchor D-VWAP vs breaking D-POC); 9/7 exit per tester geometry itemized against 51's shape (TP 1.16315 under his chart line - touch attribution proved, never assumed); other 5 exits identical bars/reasons; DAY_CLOSE count re-derived.
L-final Graded set authoritative: G1/G2/G3/G4 above.

## Run cost and novel evidence

One build (EA one-line condition, STAGE-1 exact-diff gated) plus one tester run, ceiling 90 minutes, explicit values authoritative (same settings as RECON57). Novel evidence vs RECON57: (a) first sweep-then-retest takes on the R2 tree (8/28 + 9/7); (b) SEEDVOID silence on both seed paths; (c) 9/4-invalid refusal preserved post-scoping. Exit figures are target figures until fills print, never realized before.

(End of file)
