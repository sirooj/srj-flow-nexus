CODE REVIEW REQUEST — v152 — 2026-09-17 — FRESH-SESSION SELF-CONTAINED (no thread memory assumed; everything needed rides inline)

Background (complete on this page): packet P-TP-FAMILYPASS v4 built and ran as FAMILYPASS-V4 (DONE=PASSED, 3168 bars, archive `736C24E8`). All five expected fires fired. One extra fire contradicts his filed decline: Sept-4 10:35/10:40 SHORT fired R=10.35 AFTER the machine aborted the setup at 10:35:06 for opposing-gap confirmation (his exact reason). His kill ruling on this setup is on record twice (v14 MUST-DECLINE + this week's kill-all: A2 KILL). This packet (draft `01_TASKS\PACKET_P-FRESH-S5OPP.md` v2 `4460A628`) gives the S4 OPP-abort persistence into the S5 latch via sticky-until-clean-read veto (K2 — K1 withdrawn after all four seats proved it a no-op on the packet's own numbers). TP/SL/management untouched.

His ruling on this setup, verbatim (operator 2026-09-17 kill-all message — operator holds the chat original):
HIS-A2

His prior ruling on this exact bar (filed `06_HANDOFFS\BUILDER_RELAY_COUNCIL_v14-SEL1-PACKET.md`):
Q-V14

The deliberate design this packet is scoped against (filed `01_TASKS\PACKET_P-SCOPE34.md` lines 3-11 — header says DRAFT-NOT-ISSUED though the code carries it; recorded, not reopened):
Q-SCOPE

What this packet does NOT do: give the 2-of-3 any teeth at S5 (his Q4 ruling above + spec §3.4 forbid post-confirmation kills except the bias flip; a cleared packet violating his rule fails closed). S5 scope stays HOLD-only. At S5 CheckFreshness always returns empty (EA L2212-2213, carried below) — stamps are S4-only by construction.

File / function / lines: `Experts\SRJ_FlowNexus_EA.mq5` — S4 poll OLD L7198-7207, freshness body OLD L2204-2214, S5 latch OLD L9839-9843, all carried whole below verbatim (landed `AE436EBC`/599014, built, run, committed nowhere). Draft packet §1 (E1a define + E1b globals + E1c OPP-only stamp + S4-scoped persistence + E1d K2 check + E1e exposure) carried whole below byte-identical to the filed draft.
Source digest: SHA256 `AE436EBC` / 599014 B.

S4 poll block, verbatim, no elisions (OLD L7198-7207):
CODE-OLD-C

Freshness body, verbatim, no elisions (OLD L2204-2214 — note the S5-always-empty return):
CODE-FRESH

S5 latch context, verbatim, no elisions (OLD L9839-9843):
CODE-OLD-D

Draft packet §1, verbatim (E1a–E1e with K2 NEW code):
PACKET-SEC

Kill-then-fire sequence, raw (machine-pulled byte-verbatim, FAMILYPASS-V4 archive `736C24E8`):
SEQ-ROWS

S4 HOLD rows at the four wanted LONG fires, raw (same archive — opposing-gap 0, veto never sets):
HOLD-ROWS

Prior round quoted complete and ruled (four texts; K1 withdrawn, K2 drafted, OPP-only stamp, staleness flagged):
(A) v151 Luna, filed at `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md` marker LUNA-V151-FILED-001 — ACCEPTED (E1c stamps OPP-only now):
Q-LUNA
(B) v151 Sonnet, filed at `06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md` marker SONNET-V151-FILED-001 — ACCEPTED (K1 withdrawn; K2 drafted; his stamp-next-bar alternative NOT taken — unreviewed change, stated plainly):
Q-SONNET
(C) v151 Astra, filed at `06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md` marker ASTRA-V151-FILED-001 — ACCEPTED in the K1-bar-miss and comment-only-K2 halves (both fixed by implemented K2); PARTIALLY REFUTED on "S5 live-bias-flip abort also stamps" — at S5 the function always returns empty (CODE-FRESH above), so no stamp is reachable there; only the S4-OB_DEAD narrowing stands, fixed by OPP-only stamp:
Q-ASTRA
(D) v151 Opus, filed at `06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md` marker OPUS-V151-FILED-001 — ACCEPTED: E1b/E1d rewritten to K2 with his clear paths (clean read / setup change / day rollover) + VETOCLEAR audit row + G3 positive FRESHVETO assertion; anchor label fixed to Daily-POC; anchor-index residual carried in Risks; Q4-scope confirmed untouched; his clean-section 135/53 figure flagged superseded by entry-consistent 2.51 (verdict unaffected):
Q-OPUS

Gates inline (no prior text needed): S1 pre-hash gate `AE436EBC` (599014 B); compile "Result: 0 errors, 0 warnings"; run window 08-26→09-09 (3168 bars) "Test passed"; WS161 loads=stores mismatch=0 (veto globals non-mirror); G3 MUST-FIRE the five FAMILYPASS names + MUST-SILENT 9/4 10:40 SIGNAL (TP_ELECT shadow allowed) + POSITIVE exactly one FRESHVETO row dir=SHORT vetoBar 2026.09.04 10:30 + zero FRESHVETO across the five + VETOCLEAR informational; MUST-SILENT declined days; G4 adjudication + C5 block; G5 digests, FlowLogic untouched; any deviation = REPORT+HALT, revert nothing.

Question (one, specific): issue packet P-FRESH-S5OPP v2 exactly as drafted (E1a define + E1b K2 globals + E1c OPP-only stamp with S4-scoped persistence/clear + E1d K2 latch check + E1e exposure; S1 gate `AE436EBC`; G3 positive) — yes means issue as drafted; any discrepancy, with line numbers?

Answer form: plain yes / issue-amended (state change) / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
