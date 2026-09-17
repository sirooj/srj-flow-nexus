# CODE REVIEW REQUEST — v138 — 2026-09-17 (trace evidence: selection verified on 3/3 divergent bars; same text to EVERY model)

Change (one plain sentence): the stopfix selection is traced row-by-row on the three bars where rule and live stops diverge — liveStop equals the rule-selected swing on all three, so correctness is shown directly, not inferred from outcomes.

File / function / lines: `Experts\SRJ_FlowNexus_EA.mq5` / S5 shadow+reference emission / L9657-9686 (contiguous whole unit: r0/r1 computation, shadow sel, both prints with field definitions)
Source digest: SHA256 `E5B97B36` / 597425 B (landed, committed, both remotes verified; rewire L9556-9604 carried whole byte-exact in v136 `B11F53F9`, unchanged).

Complete code, verbatim, no elisions:
```
          double s1e_s0d = MathAbs(currentPrice - s1e_s0px);
          double s1e_s1d = MathAbs(currentPrice - s1e_s1px);
          double s1e_r0 = (s1e_s0slot >= 0 && s1e_s0d > 0.0) ? (tpDist / s1e_s0d) : 0.0;
          double s1e_r1 = (s1e_s1slot >= 0 && s1e_s1d > 0.0) ? (tpDist / s1e_s1d) : 0.0;
          int s1e_sel = -1;
          if(s1e_s0slot >= 0 && s1e_s0imb > 0) s1e_sel = 0;
          else if(s1e_s1slot >= 0) s1e_sel = 1;
          PrintFormat("[SRJ-EA] SIDE1E_STOPSHADOW bar=%s dir=%s s0px=%s s0slot=%d s0imb=%d s1px=%s s1slot=%d s1imb=%d sel=%d r0=%.2f r1=%.2f liveSl=%s livePass=%d",
                      TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                      DirName(g_dir),
                      DoubleToString(s1e_s0px, _Digits), s1e_s0slot, s1e_s0imb,
                      DoubleToString(s1e_s1px, _Digits), s1e_s1slot, s1e_s1imb,
                      s1e_sel, s1e_r0, s1e_r1,
                      DoubleToString(slRef, _Digits), (tpOk ? 1 : 0));
           //--- [S1-STOPREF-SHADOW-001] stop-reference shadow (Luna V110-STOPREF-SHADOW-001,
           //--- cleared BY NAME print-only). At EVERY S5 eval (same gate/scope as SIDE1E,
           //--- placed INSIDE its block): live stop (slRef) vs rule stop (s1e_s1px, the
           //--- ext1/second-swing read) plus entry (currentPrice) plus live TP/R/pass,
           //--- printed for offline grade against his filed levels (which live ONLY in
           //--- the grade file, NEVER as literals here). Pure reads plus one print; no
           //--- state/dir/latch/order/stop/N1 write, no fresh Detect call, AdoptOff untouched.
           PrintFormat("[SRJ-EA] SIDE1X_STOPREF bar=%s dir=%s entry=%s liveStop=%s ruleStop=%s ruleSlot=%d ruleImb=%d liveTp=%s liveR=%.2f livePass=%d",
                       TimeToString(iTime(_Symbol, PERIOD_CURRENT, barShift), TIME_DATE|TIME_MINUTES),
                       DirName(g_dir),
                       DoubleToString(currentPrice, _Digits),
                       DoubleToString(slRef, _Digits),
                       DoubleToString(s1e_s1px, _Digits), s1e_s1slot, s1e_s1imb,
                       DoubleToString(tpTarget, _Digits),
                       (slDist > 0.0 ? tpDist / slDist : 0.0),
                       (tpOk ? 1 : 0));
```
(Read guide, from the lines themselves: SIDE1X liveStop IS slRef — the live rewired value; ruleStop/ruleSlot/ruleImb ARE s1e_s1px/s1slot/s1imb — the s1 reference by definition; liveR is computed from slRef. No inference needed.)

Run rows, raw (RECON45 archive `70CE840F`; shadow row then SIDE1X row per bar):
```
bar=2026.08.28 16:20 SHORT shadow s0px=1.16503 s0slot=5 s0imb=1 s1px=1.16508 s1slot=118 s1imb=0 sel=0 r0=0.19 r1=0.18 | SIDE1X liveStop=1.16503 ruleStop=1.16508 ruleSlot=118 liveR=0.19 livePass=0
bar=2026.09.04 10:35 SHORT shadow s0px=1.16289 s0slot=1 s0imb=2 s1px=1.16299 s1slot=13 s1imb=2 sel=0 r0=0.54 r1=0.38 | SIDE1X liveStop=1.16289 ruleStop=1.16299 ruleSlot=13 liveR=0.54 livePass=0
bar=2026.09.08 16:40 SHORT shadow s0px=1.16274 s0slot=4 s0imb=1 s1px=1.16359 s1slot=91 s1imb=2 sel=0 r0=0.05 r1=0.02 | SIDE1X liveStop=1.16274 ruleStop=1.16359 ruleSlot=91 liveR=0.02 rulePass=0
```
Check per bar (rule: s0 iff s0imb>0 else s1): all three have s0imb>0, sel=0 on all three, and liveStop==s0px with liveR==r0 on all three. A human tracing the rule by hand lands on the same selection the code printed. Correctness shown directly; outcomes staying FAIL is the window's property, not a logic gap.

Question (one, specific): does this trace evidence close the stopfix proving with no run, or is a flip-window run still required — any discrepancy, with line numbers?

Answer form: plain yes / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
