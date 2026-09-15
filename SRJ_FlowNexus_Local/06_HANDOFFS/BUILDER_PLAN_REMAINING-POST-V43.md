# REMAINING PLAN POST-V43 — banked pre-switch assessment (verbatim)

**Provenance:** operator pasted this text 2026-09-15 as "what you said before the new session switch". It lived only in chat and was lost on switch (defect owned in `AGENTS.md` item 103). Banked here verbatim so it survives the next switch. Read this file, not chat, for the plan.

**Status on banking:** QUIESCENT. Nothing here authorizes a build, run, or commit. Item 1 waits on council geometry ruling. v44 drafts only on his "draft v44" word.

---

Honest picture first: the EA still cannot take your trades by construction. Every build ever cleared was print-only — recorders beside the old machine, adoption OFF. The old machine (trend/confirm/suppress, LONG-carry) is still the one driving. Nothing you saw in RECON26/27 changed what the EA does; it changed what we can prove about it.

Why it doesn't take them — two failure levels, both measured:

1. Never-born rows: at both Sep-8 bars (morning SHORT London, afternoon SHORT New York) no SHORT row is ever evaluated — the code carries LONG through both bars instead. Even a perfect stop/side fix takes nothing there, because there is no candidate to fix.
2. Mis-stopped/mis-sided rows: Sep-7 morning LONG fires but walks away from your stop (fractal path); Sep-7 afternoon keeps the wrong stop (tie-break prefers code's 16:05 over your filed 16:15); Sep-8 side owner reads the wrong rule (retest instead of HTF-bias-only).

Remaining tasks, in dependency order, with owners:

1. Geometry design (council authors). Which path does your conditional stop rule walk — the live leg or the fractal leg? Sep-7 morning proved the live leg already picks your exact stop while the fractal leg finds nothing. The design must name the path. Nothing builds until both models name this packet. (Cost: relays + your pasting.)
2. Side-owner fix (council packet, builder builds). Move live side assignment to HTF-bias-only per your restated rule (spec §3.2). Selection change — dual-key mandatory.
3. Stop-branch fix (council packet, builder builds). Teach the live branch your conditional rule: 1 swing away with imbalance, 2 away without, plus the wick nuance. Selection change — dual-key mandatory.
4. Sep-8 generation fix (council packet, builder builds). The deepest one: birth SHORT candidates at the two Sep-8 bars instead of carrying LONG. This is the replace-not-sidecar decision (deployment bar) — the old pipeline must yield at those bars.
5. Adoption run + grading (builder, ~1h each). Each fix above gets its own print-then-prove cycle: build, run, grade against your four fired trades + two Sep-8 bars, relay. Expect 2–3 run hours total, not one.
6. Your blanks (you, at leisure, blocking nothing now): the 08:40 formation detail ("two away" + triangle — still the only blank that can reshape the R4 design), the N1 wick read, the flats read. S1 first swing is closed (9:50). Sep-8 feed tags are done (Dukascopy always).
7. CQD sequencing (council, later). The volume-divergence feed reads EMPTY at both Sep-8 bars; the repo feed fix is a separate packet after the adoption decision. Your trades don't gate on it.
8. Housekeeping (you, one word each): debris deletion word (2 files), git snapshot/push token, canonical commit token for EA + fixture when council clears them.

The critical path is 1→2→3→4→5. Item 1 is where everything waits: no council geometry ruling, no fix packets, no runs. If you want, I can draft the geometry-issuance relay (v44) now — it asks both models to author the path packet by name, with your restated rules + the Sep-7 per-path split inline so it is answerable in one shot. Say "draft v44" and I file it for your paste.

---

The difference in one line: everything before this measured the old machine; this plan replaces the parts of it that decide.

Why nothing so far could resolve it. Every packet since September 11 was print-only by council order: new printers beside the untouched selection path, adoption OFF, parity proven every run. That was deliberate — you can't redesign what you haven't localized. And it worked as diagnosis: 24-variant death, limb lists, walk traces, O1 absence table, A6 decision rows. Each arc found the next fault layer (branch → matrix → limbs → seat → origin → absence → pairing). But no printer, however precise, changes what the EA does. Your trades live in journals; the EA runs the old pipeline. Those two never met, so agreement was structurally impossible.

Why this plan can — item by item:

1. Geometry ruling picks the correct leg. Sep-7 morning proved both legs exist and disagree: the live leg picks your exact stop, the fractal leg walks away to 08:20. Every prior stop arc (SLDEF-1 through 6) refined the fractal-side walk while your stop sat on the live leg. Ruling "walk the live leg" redirects the fix at the true target instead of tuning the wrong path again.
2. Side-owner fix puts your side rule in the driver's seat. Today the live side comes from the retest resolver (measured at line 6793) — that single line is why LONG carries through both your Sep-8 SHORT bars. Replacing it with your HTF-bias-only rule flips the direction at exactly the bars where the EA currently goes the wrong way. No diagnostic ever touched that line; this is the first plan that does.
3. Stop-branch fix installs your conditional rule. Today's branch knows only "OB valid or not" and never consults imbalance — your "1 away with, 2 away without" rule has no code counterpart. Installing it as the live branch (not a shadow) means the Sep-7 afternoon tie-break and the Sep-4 width cases resolve by your rule, not by the conservative default that currently kills them.
4. Generation fix births the missing rows. This is the one with no predecessor at all: prior arcs classified the Sep-8 absence six ways but never proposed creating candidates there. Birthing SHORT rows at the two Sep-8 bars converts "never-born" into "evaluated" — the precondition for everything else to matter at those bars.
5. Adoption runs prove it on your trades, not on proxies. Prior grades passed on matrices, counts, and joins; the new grades pass only on your four fired stops exact plus the two Sep-8 decisions present. The pass criterion is your journal, not the machine's self-consistency.

The structural difference: old arcs refined the machine's reports (print-only, adoption OFF, isolation diff-zero as the pass mark). The new arc changes the machine's decisions (selection path edits, adoption ON as the pass mark, your journal as the oracle). Diagnosis is complete — six arcs, every fault localized to named lines. What remains is the only thing diagnosis cannot do: the replacement.

(End of file — banked 2026-09-15, operator-pasted source)
