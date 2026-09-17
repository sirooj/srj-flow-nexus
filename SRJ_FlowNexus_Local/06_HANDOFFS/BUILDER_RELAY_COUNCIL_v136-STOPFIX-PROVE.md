# CODE REVIEW REQUEST — v136 — 2026-09-17 (stopfix proving-run spec + token; same text to EVERY model)

Change (one plain sentence): prove the staged stopfix on the register window with no code change — the rewire already landed, only the proving run is owed.

File / function / lines: `Experts\SRJ_FlowNexus_EA.mq5` / S5 take-path region / L9556-9604 (rewire block, contiguous whole unit below)
Source digest: SHA256 `E5B97B36` / 597425 B, landed (commit `5904e3a`, tag `RECON45-DEMO-PASS`, both remotes at tip). No edit proposed, no build needed.

Complete code, verbatim, no elisions:
```
       //--- [S1-LIVE-STOPFIX-001] LIVE REWIRE (Luna V112-AMENDED-STOPFIX-001,
       //--- RE-CLEARED BY NAME, staged). Rule-defined stop selection replaces the
       //--- W OB-anchored take-path value at THIS S5 evaluation only (slRef is the
       //--- function-local from EA:8675; upstream diagnostics keep resolver values).
       //--- Walk mirrors the SIDE1E idiom verbatim (same buffers, side test, ext
       //--- numbering); sel mirrors its rule (s0 iff imb nonzero, else s1). No staleness
       //--- patch (REJECTED design, not built). Pure reads; no state/dir/latch/order/
       //--- stop/N1 write beyond the local slRef take-path select; no Detect call.
        {
         int s1x_swBuf = ((g_dir == DIR_LONG) ? FL_BUF_SWING_LOW : FL_BUF_SWING_HIGH);
         int s1x_imBuf = ((g_dir == DIR_LONG) ? FL_BUF_SWING_LOW_IMB : FL_BUF_SWING_HIGH_IMB);
         double s1x_s0px = 0.0; int s1x_s0slot = -1; int s1x_s0imb = -1;
         double s1x_s1px = 0.0; int s1x_s1slot = -1; int s1x_s1imb = -1;
         double s1x_best = 0.0; int s1x_extN = 0; int s1x_rungs = 0;
         for(int s1x_s = barShift; s1x_s <= barShift + SRJ_LAD_ABS_SLOT_CAP; s1x_s++)
           {
            double s1x_v = 0.0;
            if(!ReadFlow(s1x_swBuf, s1x_v, s1x_s)) break;
            if(s1x_v == EMPTY_VALUE || s1x_v <= 0.0) continue;
            if(!SlimbProtectiveSideOk(g_dir, s1x_v, currentPrice)) continue;
            int s1x_ext = -1;
            if(s1x_rungs == 0) { s1x_ext = 0; s1x_best = s1x_v; s1x_extN = 1; }
            else
              {
               bool s1x_more = (g_dir == DIR_LONG) ? (s1x_v < s1x_best - _Point) : (s1x_v > s1x_best + _Point);
               if(s1x_more) { s1x_ext = s1x_extN; s1x_extN++; s1x_best = s1x_v; }
              }
            if(s1x_ext == 0 && s1x_s0slot < 0)
              {
               s1x_s0px = s1x_v; s1x_s0slot = s1x_s;
               double s1x_f = 0.0;
               if(ReadFlow(s1x_imBuf, s1x_f, s1x_s) && s1x_f != EMPTY_VALUE) s1x_s0imb = (int)s1x_f;
              }
            if(s1x_ext == 1 && s1x_s1slot < 0)
              {
               s1x_s1px = s1x_v; s1x_s1slot = s1x_s;
               double s1x_f = 0.0;
               if(ReadFlow(s1x_imBuf, s1x_f, s1x_s) && s1x_f != EMPTY_VALUE) s1x_s1imb = (int)s1x_f;
              }
            s1x_rungs++;
            if(s1x_rungs >= 512) break;
            if(s1x_s0slot >= 0 && s1x_s1slot >= 0) break;
           }
         int s1x_sel = -1;
         if(s1x_s0slot >= 0 && s1x_s0imb > 0) s1x_sel = 0;
         else if(s1x_s1slot >= 0) s1x_sel = 1;
         if(s1x_sel == 0) slRef = s1x_s0px;
         else if(s1x_sel == 1) slRef = s1x_s1px;
        }
```

Run rows, raw (register-window baseline RECON45, archive `70CE840F` — the predictions below must MOVE these or explain why not):
```
A6FIRED count = 1 (FL 10:05 only; no DH fire row; no SIDE1X 10:35 bar on 09-08)
TP_RR_FAIL_LATCH = 13 (DH/IE among FAILs under live path)
```
Amended prediction set (V112, accepted row-by-row, TP-independence assumed): FL FIRE; DH 10:35 FIRE (was declined-silent); IE 16:55 FIRE (was R-gate-killed); GQ/JJ R-changed-but-pass; rest identical; ML fail carried as outlier. Collisions ruled: DH stands, IE scoped-fire, ML carried. Caveats carried open (V115 partial row-bindings; TP-selector unaudited diagnostic).

Proposed spec: ONE proving run, register window 08-26→09-09 (the terminal's sticky default — no window work needed), same demo settings, NO build; grade = purity gates + amended-set row match (DH+IE fire; GQ/JJ changed-R-pass; ML fail; rest identical) + isolation vs RECON45; mismatch REPORT+HALT. Run word owed separately by him.

Question (one, specific): confirm this proving-run spec and grant the token for the single run — any discrepancy, with line numbers?

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
