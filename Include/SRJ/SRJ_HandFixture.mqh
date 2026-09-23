//+------------------------------------------------------------------+
//| SRJ_HandFixture.mqh — HAND expectations/labels fixture          |
//| [FP-LIMBSEAT-1 global anti-fitting guard]                       |
//| Sole sanctioned home of the six filed HAND stop constants       |
//| (1.16508, 1.15847, 1.16098, 1.16239, 1.16238, 1.16258).         |
//| Test-import-only: imported solely by SRJ_FlowNexus_EA for its   |
//| tester-diagnostic print/compare paths (SEL force-eval/census    |
//| parity, SWINGDUMP/ORIGINREG/SLEXT1/SLEXT45/E44/E46 comparisons).|
//| No selection, memo, working-set or state consumer may call the  |
//| functions below; HAND values are labels for comparison, never   |
//| operands. Build-time grep gate: the six literals must appear in |
//| NO .mq5/.mqh outside this file.                                |
//| Included mid-file AFTER ENUM_SRJ_DIR (defined in the EA), NOT   |
//| at top. Bodies moved byte-identical from SRJ_FlowNexus_EA.mq5.  |
//+------------------------------------------------------------------+
#property strict

//--- [P-SLDEF-5 E37] filed operator levels with provenance (RESCOPE Ruling
//--- 2 as amended: all four now HAND — Aug-28 promoted by his Q1 YES; the
//--- prov-token flip rides the adoption packet, so the code token stays
//--- INFERRED until then and the row still grades PROVISIONAL_MATCH).
//--- Keyed by S5 eval barTime — the only key unique across the two 09.07
//--- rows. No CODE row exists here: CODE is refused as an operator level
//--- by construction. [P-SLDEF-6 E45.4] filedT carried per filed level:
//--- Aug-28 now 06:30 (HAND-sourced); barDiff stops resting on inspection.
bool SrjFiledLevel(const string barT, double &px, string &prov, string &filedT)
   {
    if(barT == "2026.08.28 10:00") { px = 1.16508; prov = "INFERRED"; filedT = "2026.08.28 06:30"; return true; }
    if(barT == "2026.09.04 15:55") { px = 1.15847; prov = "HAND"; filedT = "-"; return true; }
    if(barT == "2026.09.07 09:15") { px = 1.16098; prov = "HAND"; filedT = "-"; return true; }
    if(barT == "2026.09.07 16:40") { px = 1.16239; prov = "HAND"; filedT = "2026.09.07 16:15"; return true; }
    return false;
   }

//--- [P-SLDEF-6 E44] Sep-8 targeted probe levels, hardcoded, provenance
//--- HAND (his words, BUILDER_FINDING_SLDEF5_FIVEEXAMPLES Addendum 2).
//--- Keyed by eval barTime; the 481-site shadow covers these bars when
//--- they are evaluated, and then this only labels the shadow row.
bool SrjSep8Filed(const string barT, double &px)
   {
    if(barT == "2026.09.08 10:10") { px = 1.16258; return true; }
    if(barT == "2026.09.08 17:00") { px = 1.16274; return true; }
    return false;
   }

//--- frozen expected: G1 target (filed-only for R5), retained code-under-test,
//--- HAND target, decline/hypothetical flags, G2 stop price.
bool SrjSelExpected(const string exID, int &g1def, double &g1Px, string &g1BT,
                    double &retPx, string &retBT, double &tpPx, int &tpUnst,
                    int &decline, int &hypo, double &g2Px, string &g2BT)
   {
    g1def = 0; g1Px = 0.0; g1BT = "-"; retPx = 0.0; retBT = "-";
    tpPx = 0.0; tpUnst = 0; decline = 0; hypo = 0; g2Px = 0.0; g2BT = "-";
    if(exID == "R1") { g1def = 1; g1Px = 1.16508; g1BT = "2026.08.28 06:30"; retPx = 1.16508; retBT = g1BT; tpPx = 1.16364; return true; }
    if(exID == "R2") { tpPx = 1.16224; decline = 1; hypo = 1; g2Px = 1.16299; g2BT = "2026.09.04 09:30"; return true; }
    if(exID == "R3") { g1def = 1; g1Px = 1.15847; g1BT = "2026.09.04 15:30"; retPx = 1.15847; retBT = g1BT; tpPx = 1.16302; return true; }
    if(exID == "R4") { g1def = 1; g1Px = 1.16098; g1BT = "2026.09.07 08:40"; retPx = 1.16098; retBT = g1BT; tpPx = 1.16200; return true; }
    if(exID == "R5") { g1def = 1; g1Px = 1.16239; g1BT = "2026.09.07 16:15"; retPx = 1.16238; retBT = "2026.09.07 16:05"; tpPx = 1.16318; return true; }
    if(exID == "S1") { g2Px = 1.16258; g2BT = "2026.09.08 09:40"; tpPx = 1.16102; return true; }
    if(exID == "S2") { g2Px = 1.16274; g2BT = "2026.09.08 16:20"; tpUnst = 1; return true; }
    return false;
   }

//--- [P-ORIGIN-1 §3/§5/FREEZE] frozen expected identity per example: the
//--- currently-reproducing stop (RECON18 SLEXT1) + filed level. R5's
//--- standing −1 vs filed is RETAINED (gate = retain, not improve).
bool SrjOriginExpected(const string exID, double &expPx, int &expSlot, datetime &expBT, int &expImb,
                       double &filedPx, string &filedProv)
   {
    expPx = 0.0; expSlot = -1; expBT = 0; expImb = -1; filedPx = 0.0; filedProv = "-";
    if(exID == "R1") { expPx = 1.16508; expSlot = 42; expBT = StringToTime("2026.08.28 06:30"); expImb = 0; filedPx = 1.16508; filedProv = "HAND"; return true; }
    if(exID == "R2") { expPx = 1.16299; expSlot = 13; expBT = StringToTime("2026.09.04 09:30"); expImb = 2; filedPx = 1.16299; filedProv = "HAND"; return true; }
    if(exID == "R3") { expPx = 1.15847; expSlot = 5;  expBT = StringToTime("2026.09.04 15:30"); expImb = 0; filedPx = 1.15847; filedProv = "HAND"; return true; }
    if(exID == "R4") { expPx = 1.16098; expSlot = 7;  expBT = StringToTime("2026.09.07 08:40"); expImb = 0; filedPx = 1.16098; filedProv = "HAND"; return true; }
    if(exID == "R5") { expPx = 1.16238; expSlot = 7;  expBT = StringToTime("2026.09.07 16:05"); expImb = 0; filedPx = 1.16239; filedProv = "HAND"; return true; }
   if(exID == "T1") { expPx = 1.16258; expSlot = 83; expBT = StringToTime("2026.09.08 09:40"); expImb = 0; filedPx = 1.16258; filedProv = "HAND"; return true; }
   if(exID == "T2") { expPx = 1.16274; expSlot = 3;  expBT = StringToTime("2026.09.08 16:20"); expImb = 1; filedPx = 1.16274; filedProv = "HAND"; return true; }
   return false;
  }

//--- [ADOPTION-FIX-P4C5-FIRST-001 O1] absence-discrimination targets (HAND
//--- barTime + entry per filing). R4 filed stop reuses 1.16098 above; S1
//--- 09:50 carries NO filed price on record (hasFiled = 0, PRICE_UNSTATED
//--- by design — the bar pattern/side/buffer tests need no price).
//--- dir: 1 = LONG (protective swing-LOW), -1 = SHORT (protective swing-HIGH).
bool SrjO1Target(const int idx, string &tag, string &tgtBT, int &dir,
                 double &entryPx, double &filedPx, int &hasFiled)
  {
   tag = "-"; tgtBT = "-"; dir = 0; entryPx = 0.0; filedPx = 0.0; hasFiled = 0;
   if(idx == 0) { tag = "R4"; tgtBT = "2026.09.07 08:40"; dir = 1; entryPx = 1.16135; filedPx = 1.16098; hasFiled = 1; return true; }
   if(idx == 1) { tag = "S1"; tgtBT = "2026.09.08 09:50"; dir = -1; entryPx = 1.16205; filedPx = 0.0; hasFiled = 0; return true; }
   return false;
  }

//--- [A6-PRINT-ONLY-RECORDERS-001] decision-instant targets (HAND entry
//--- barTimes + sides + limb barTimes as labels for comparison, never
//--- operands. Decision instant = entry-bar open minus one M5 bar per the
//--- standing signal-bar-close convention, computed at runtime via
//--- PeriodSeconds — no literal offsets. Entry/limb TIMES repeat HAND
//--- record (R4 09:20/08:40, S1 10:10/09:50, S2 17:00); NO prices here at
//--- all — the 09:50 high is always bar-read (Opus#1), R4's px comes from
//--- the live terminal record. S2 row serves the D8 CQD probe only.)
bool SrjA6Decision(const int idx, string &tag, string &entryBT, int &dir,
                   string &limbBT)
  {
   tag = "-"; entryBT = "-"; dir = 0; limbBT = "-";
   if(idx == 0) { tag = "R4"; entryBT = "2026.09.07 09:20"; dir = 1; limbBT = "2026.09.07 08:40"; return true; }
   if(idx == 1) { tag = "S1"; entryBT = "2026.09.08 10:10"; dir = -1; limbBT = "2026.09.08 09:50"; return true; }
   if(idx == 2) { tag = "S2"; entryBT = "2026.09.08 17:00"; dir = -1; limbBT = "-"; return true; }
   return false;
  }
