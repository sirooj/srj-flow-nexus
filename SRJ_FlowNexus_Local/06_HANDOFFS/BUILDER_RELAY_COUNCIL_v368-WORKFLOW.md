CODE REVIEW REQUEST — v368-WORKFLOW — 2026-10-01

Session: CONTINUE workflow session (remembered round V367-WORKFLOW: Luna Q1 DISCREPANCY plus Q2 DISCREPANCY, Sonnet Q1 DISCREPANCY plus Q2 DISCREPANCY; filed whole LUNA lines 15403-15581 plus SONNET lines 5015-5068; this page folds every point. Line convention: physical lines, blank lines counted, title = line 1).

Project brief (standing — read first):
- Money: probe/print-only. Alert-only EA. No live trades. Nothing here moves money. Live activation needs a separate relay plus his explicit word.
- People: one operator (trader, strategy owner, money authority) plus AI seats. He carries every text both ways verbatim. Shipped-text equality is detected by intake hash: the builder hashes each seat text at intake and quotes the intake hash in the grade, so a carried text that differs from the ruled text is caught the same turn.
- History: v367 transcript filed `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v367-WORKFLOW.md` 9E87B6520D00BA679462F8E5E4168A17CA885CD87009B365059184A6E96F2A42 / 7727 B / 55 lines. Grade `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RESULT_V367-GRADE.md` (Q1 0-2 OBJECT, Q2 0-2 OBJECT, amend-with-delta). Tie rule (stated here, binds this and later two-seat rounds): any DISCREPANCY/OBJECT forces amend; confirm needs YES+YES or better; a split with no OBJECT grades conditional-confirm with the named conditions.
- Take bar unchanged (context only — not asked): `SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_REGISTER_VALID_TRADES.md` 10B5B933D91A5AAEC45762BF8EEC42CBFD6100B0E40C4EE247D7F561D63E0AAC / 5584 B / 51 lines (7 first-window takes reproduce; second window 4 valid with 1 takes plus 3 miss; invalids never progress). No trading-gate content on this page; strategy pins untouched.
- Your verdict: rules on the page only. Disk truth (digests plus counts below) is proven on disk and is not answerable from chat by any model tier; the operator carry above is the separate anti-fake check. Do not ask for files.

Change (one plain sentence): replace the remaining prose-defined checks with a manifest-driven contract and an improvement-aware slice ratchet, so the pipeline fix itself stops burning council rounds.

Cost evidence (volume labeled volume; cost measured in minutes plus trips):
- Full command (workdir MQL5, no recurse, three disjoint globs, one pipeline each; duplicates: same-name different-extension counted separately, renames retired with their round): Get-ChildItem -LiteralPath "SRJ_FlowNexus_Local\06_HANDOFFS" -Filter "BUILDER_RELAY_COUNCIL_*.md" | Measure-Object; Get-ChildItem -LiteralPath "SRJ_FlowNexus_Local\06_HANDOFFS" -Filter "BUILDER_RESULT_RECON*.md" | Measure-Object; Get-ChildItem -LiteralPath "SRJ_FlowNexus_Local\06_HANDOFFS" -Filter "BUILDER_RESULT_V*.md" | Measure-Object. Outputs: 370 plus 79 plus 81 (370 at draft plus this v368 at file time; ruled 528 = 368 plus 79 plus 81; expected total now 531). Verbatim Count objects ride the battery, not this prose.
- Battery cache key: file path plus file digest; re-read only on digest change.
- Run-cost figures bind ONLY on run-bearing relays, re-derived from existing runner logs (last two qualifying runs: completed, same window plus manifest plus tool generation; range = min-max wall minutes with median beside). Fewer than two qualifying runs: figure rides labeled PROVISIONAL with its sample size, council rules its weight. Re-derivation never spends new runs.
- Stage log (machine-written): the checker or runner appends round|stage|start|end lines; the operator adds only the trip count per round. Round cost = sum of stage wall minutes plus trip count. Light path projects saving of one human trip per light round; the 2-trip floor stands unchanged by either question.

Manifest-driven light path (binary; honest count is E0 plus C1-C5):
- E0 wording-only classifier: regions derived BY PARSER (fences, marker lines, fence delimiters are code-class by rule; no builder-declared prose). Locked-token class: any change to a 64-hex digest, a byte/line count, or a verbatim-quoted line fails E0 even inside prose (a wording fold that edits an attested digest or quoted tally is an attestation change). Changed-range map proves every changed byte inside allowed prose ranges AND every code-fence range byte-identical; runs on carried bytes receiver-side. Code-fence discovery: the manifest enumerates every code-bearing range by anchor pair; an unenclosed executable region fails E0 open, never assumed prose.
- C1 twin-equivalence: pair = packet body bytes vs relay P-block bytes by content hash ids; normalization named: CRLF to LF, strip one trailing empty element both sides, no other folding; pass = normalized diff 0. Code-free pages carry no P-block: checker prints C1 VACATED (recorded status, never bare pass, never silent skip).
- C2 predecessor link: predecessor named by acceptance id (round plus file plus digest of the last accepted fold); checker verifies predecessor equals the recorded last-accepted id, then verifies current-vs-predecessor changed-region proof against the region manifest. A hash string alone never passes.
- C3 edit-list mapping: every changed word-span maps to an entry in the declared edit list; no span outside it passes. Non-word classes (whitespace, punctuation, endings, delimiters, marker names) are code-class-by-boundary where structural, advisory-with-print elsewhere; the boundary table rides the manifest.
- C4 anchor-bearing cites: each cite carries file plus hash plus line range plus key string; checker verifies all four (hash match, range contains key string). Cite taxonomy (enumerated): file-measure, row-claim, rule-pin, history-label. Stale or ambiguous reference fails with reason.
- C5 tag-namespace (counted, not folded): verdict-marker names substring-disjoint both directions; a marker rename fails C5 even when cites resolve.
- Checker grammar: one record per run, e.g. LIGHT_PASS or FULL_PATH with per-check states plus reason codes; single mandatory FAIL suffices for FULL_PATH; N/A prints as N/A with the vacate rule named. Checker script changes ride the full path with its hash pinned. Trust proof: fault-injection fixtures (one code byte changed, one digest edited, one cite to the wrong file, one marker renamed) must all print FAIL before first use.

Advisories (binary triggers, retained evidence): printed in the carried result with check name plus fold plus observed values plus fold hash. Escalation: same check fires on two consecutive folds, or an operator-filed fault record names the check, promotes to blocking. Same-fold double-fire means two consecutive folds, stated once here.

Estimate freshness (run-bearing pages only): defined above; this code-free page carries no estimate and is not blocked by it.

Slice ratchet (improvement-aware; poisoning-proof):
- Green predicate (set relations): slice takes superset of golden takes; every new take is a member of the frozen-bar take list; misses unchanged unless they become that window's takes; invalids emit no take and no alert (reject prints allowed).
- Golden provenance: first golden derived once from a full-window run with a filed slice-vs-full equivalence proof on the same days. Promotion ONLY on full-window green or the operator's explicit word. Slices compare, never rewrite. Prior baseline kept immutable beside the golden, so a bad accept can be rolled back by hash.
- Canonical hashing: the hashed object is the canonical take list (take id, entry bar, line, outcome class), never raw logs; timestamps and incidental text excluded by construction.
- Manifest (fixed plus hashed pre-run): slice days = all 7 first-window take days plus the 3 miss days plus the second-window take day plus a bounded invalid set (named days, fixed count, coverage = one per invalid class: declined bar, sub-1R refusal, invalid-winner rejection). Warmup: state reset to flat plus identical lookback bars; equivalence proof filed once per manifest change.
- Process-only enforcement: EA plus indicator plus includes hashes verified unchanged across the slice gate; any delta forces FULL_PATH with the reason named.
- Result label: every slice result prints ADMISSION ONLY, never bar evidence.
- Feasibility arithmetic: per-day slice cost plus one warmup cost, times manifest days, must total under 15 wall-clock minutes (human wait plus machine runtime counted together); the arithmetic rides the manifest or the gate stays shut.
- Falsifiability: escapes (slice-green then full-red) and false-reds (slice-red then full-green) counted with minutes each way; horizon 6 rounds; rollback to full-window-only on 2 escapes.

Decouple rule (adopted): a prose-question OBJECT never holds a code question on the same round; separate verdict lines already enforce it.

Q1 (pipeline): close the light path with parser regions plus locked tokens plus C1-C5 binary contracts plus the checker grammar with fault fixtures, as defined on this page?
Answer form Q1: plain yes / no / discrepancy, with line numbers.

Q2 (pipeline): adopt the subset ratchet plus canonical goldens plus the bounded manifest plus ADMISSION ONLY labeling with the two-dimensional falsifiable metric, as defined on this page?
Answer form Q2: plain yes / no / discrepancy, with line numbers.

Vote-free light path (proposed, ACTIVATION ON HIS WORD): a checker LIGHT_PASS passes the fold with seats advisory-read-only; code relays keep full verdicts. Activation needs his one word because vote architecture is his. Until then seats keep full halt power and this page's Q1/Q2 still need ruled verdicts.

Review-seat packaging: the same text ships to every seat; no keys exist on this round, so no verdict slot is excused and nothing is refused.

Analytic ask A (standing, every relay): name every defect, gap, or imprecision you see in the page, each with line numbers — freetext, no length limit.

Analytic ask B (standing): state any better mechanism you see for the stated goal, with the lines it would touch.

Verification split: rule on the page only — disk truth (digests plus counts above) is proven on disk and is not answerable from chat by any model tier; the operator carry above is the separate anti-fake check. Do not ask for files.
Nothing else is asked. Thank you.
