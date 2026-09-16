# BRIEF v106 — probe-design review for the Sonnet seat (plain engineering, no ritual)

**What this is:** a code+design review request, not a ruling relay. No Ruling-ID. No CLEAR/CONFIRM/RULE vocabulary. No verdict wanted. Read the regions, answer the five technical questions in plain words. Paste set — one trip, FOUR pastes to the Sonnet profile: (1) this brief + (2) `06_HANDOFFS\BUILDER_SNIPPET_V101T_WHOLE.md` (transfer/seed/bias, 151 lines) + (3) `06_HANDOFFS\BUILDER_SNIPPET_V103W_WHOLE.md` (eval site, 149 lines) + (4) `06_HANDOFFS\BUILDER_SNIPPET_V104GAP_WHOLE.md` (predicate terms, 87 lines). All numbered lines byte-identical on EA `7BFC7FA3`/FlowLogic `3606BFB4` (re-verified). Nothing is asked of any other stream here.

## 0. Plain context (why this process exists, in full)

The owner is building a personal EURUSD M5 alert-only expert. It places NO live trades: zero `OrderSend` calls (proven by two-pattern grep on every build) and adoption permanently OFF — it prints diagnostics, nothing more. The relay process is his sign-off-before-code-change rule: every build, run, and commit needs his fresh word; nothing moves without him. Correction of an earlier sloppy line: "transport only" describes relay PASTING mechanics, never his judgment — every spend, every strategy call, and every governance change is his, reclaimable anytime. This brief asks for engineering analysis to inform his word, not to replace it.

## 1. The actual decision on the table

Whether to build and run a print-only probe (`P-BIRTH-PROBE-001`, already cleared by the key-bearing stream, held ONLY on his word): it ADDS a read-only predicate check plus prints at each seed site and at the check-bar eval site, on history tester data (~1 machine-hour). It changes no decision, fires nothing, commits nothing. Landing (any live-affecting change) is a separate decision with dual keys plus his tokens, far later and not asked here.

## 2. The probe spec in plain words

At each seed: evaluate the birth predicate read-only (higher-timeframe bias 2-of-3 from buffers 19/20/21, inline-duplicated verbatim because the original's counters can't be restored; sweep tag + direction from buffer 18, which carries the most-recent unexpired sweep; short-confirmation via the existing confirmation ladder with its 8 counters saved and restored like-for-like; carried seed direction, never the possibly-switched live direction) and print identity + direction + both readings + confirmation + linkage + reward + disposition. At the eval site: the existing print blocks (companion Region W) stay exactly as they are. Emission only when a seed evaluates. Zero writes to live/anchor/direction/latch/order/stop/counter state; no order calls; adoption stays off.

## 3. Five technical questions (answer each directly from the regions)

1. Does anything in the three companions write live state (direction, anchor, machine state, latch, order, stop, counters beyond the declared save/restore)?
2. Is every predicate term checkable from the named inputs — or is any term approximated, outcome-derived, or newly invented?
3. The dual-reading shape (trend-reading AND sweep-reading printed separately because the site's row type is unknown): sound, or does it hide a choice?
4. The two handlings (inline-duplicated bias idiom; counter save/restore around confirmation): airtight, or holes?
5. Anything in the Sec.2 spec that could alter live behavior if built exactly as written?

## 4. What happens after (so the stakes are explicit)

If his word comes: print-only build, compile clean, one history-data run, grade vs pre-registered lines (predicate rows, linkage, zero-drift proof across 56 check families, purity), results filed and returned for review — including to this seat. If the grade shows any behavior drift, invented computation, or surfacing: halt with the finding named, no silent pass. Then the owner decides the next step with the graded evidence in hand.

(End — analysis in plain words, no format. The owner judges; this seat informs.)
