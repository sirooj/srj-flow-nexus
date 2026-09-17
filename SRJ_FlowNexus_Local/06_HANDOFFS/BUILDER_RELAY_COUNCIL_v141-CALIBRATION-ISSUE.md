# CODE REVIEW REQUEST — v141 — 2026-09-17 (packet-2 issuance: calibration behavior; same text to EVERY model)

Change (one plain sentence): issue the already-designed behavior packet that makes the EA take his three missed winners — higher-authority line supersession, R latched at the confirmation close, confirmation-candle gate — with his ruled safety intact.

File / function / lines: no code change in this relay — packet-2 edit set gets written after issuance (as packet 1 was). Tree: landed `E5B97B36`/597425, committed, both remotes verified.
Source digest: SHA256 `E5B97B36` / 597425 B. Prior design record: `01_TASKS\PACKET_P-CONFIRM-SHADOW.md` (build 1, log-only, LANDED — RETESTBOOK/CONFIRMPOLL/TP_ELECT print in RECON45) + `06_HANDOFFS\COUNCIL_RESPONSE_POI-R.md` (all four design questions answered; packet-2 gate CLEARED).

Complete code, verbatim, no elisions: none carried — no code claim is made; every claim below rests on run rows and his filed verbatim rulings, all inline.

His ruled standards, verbatim on record (no paraphrase): "FIX THE SRJ POI MARKER or how the EA sees them. find the root problem and not banaid solution." / "this is the same with the first question, that was a valid trade but early exit." (8/28 valid; R check must not kill it) / "there is a valid Y POC superseed the M POC" (higher-authority supersedes) / TP for a setup = the family's AVP line, not the nearest session level / 1R gate KEEP, entry = next candle open KEEP / safety: the 8/18 false positive must stay dead / ALL EA-only signals BAD ("my valid trades is what i want to replicate").

Miss evidence (provenance labeled per line — RECON1-era filed record vs current tree RECON45 archive `70CE840F`):
```
8/28 SHORT D-VWAP (his +0.10, 1.21R held): [RECON1-era, POI-R relay filed] EA seeded same setup, TP picked NYL 1.16364 not his AVP ~1.1638, R decayed 1.13->0.95, ABORT TP_RR_FAIL Daily-VWAP 10:30. [RECON45 today] 10:00 seed R 0.17 fail — the kill persists.
9/4 LONG Y-POC (his +0.84): [RECON1-era, POI-R relay filed] EA seeded M-POC 15:35, SUPPRESSED his Y-POC retests 15:45/15:50/15:55, held seed died R=0.06 on Monthly-VWAP 6-7pts away. [RECON45 today] no suppression rows at 15:xx; 15:55 LONG R 0.99 fail — one point short.
9/7 LONGs (his +2.03 LDN / +1.06 NY, W AVP) [both RECON45 today]: timing AGREES — CONFIRMPOLL confirm=1 anchor=Weekly-POC bar=2026.09.07 09:15 (oppCandle=1 bodyDir=1 body=21pts touchAttr=1) and bar=2026.09.07 16:40 (oppCandle=1 bodyDir=1 body=11pts touchAttr=1). Gap is POI+R: his W AVP vs EA Weekly-POC anchor; his 2.03/1.06 vs EA 0.62/0.39.
```
Settled design (council response, quoted): C1 rank supersession unchanged; C2 = R latch at confirmation close ONLY (AVP-selector ruled OFF, closest-line stays); C3 8/18 safety unchanged; C4 confirmation model §3.6 (nonzero body in trade direction after opposing candle, true doji only rejected). STEP 4 EXIT-POCVWAP unbuilt, out of scope here.

Proposed packet 2: behavior change ONLY per the settled design (supersede + latch + gate), NOTHING else; observables: 8/28 signal returns, 9/4 yearly survives, 9/7 fires, 8/18 stays dead, censuses reproduce except designed deltas; compile 0/0; mismatch REPORT+HALT. Builder writes the edit set after issuance, builds on his token+word.

Question (one, specific): issue packet 2 exactly as the settled design specifies — any discrepancy, with line numbers?

Answer form: plain yes / issue-amended (state change) / no / discrepancy, with line numbers.
Verification split: rule on the page only — genuineness vs disk is proven on disk (digests + counts above) and is not answerable from chat by any model tier. Do not ask for files.
Nothing else is asked. Thank you.
