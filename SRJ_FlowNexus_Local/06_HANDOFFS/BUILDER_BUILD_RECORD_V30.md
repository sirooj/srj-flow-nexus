# BUILDER BUILD RECORD V30 (2026-09-19, print-only probe build)

## Authority (all three present before the first write)
- Council clearance: Luna-V193-001 ACCEPT, clear PACKET_EXT1LIVE-001 v30 by name (filed `06_HANDOFFS\BUILDER_VERDICTS_LUNA.md`).
- Advisory concurs (zero weight): Sonnet-V193-001 clear, GLM-V193-001 accept.
- Operator key-config order + run word, verbatim: `Run v30 on Luna key plus advisories, Astra waived for this print-only probe only.`

## Packet
- `SRJ_FlowNexus_Local\01_TASKS\PACKET_EXT1LIVE-001.md` v30: `5CD5FAD374FB410BF54C1609C3C324EF04DAF7C0F3DD9D53BDBCFE09F1D549E8` / 148086 B / 46 lines.

## STAGE-0/1 (script `pktv30build.ps1`, ASCII-only, all fail-closed)
- Pre-gates: EA at recorded v25-built state C375 (expected, not drift); packet v30 digest match; 46 lines.
- Landed base restored byte-exact via blob stream: `6C2E4028` / 602894 B verified after write.
- P032 backtick segments: 39; A idx 1 (288 B), B idx 3 (213 B), C idx 31 (9621 B); heads/tails match.
- C census: keys 38, vals 78, prefill 1, strikes 14/15 retained `-` 1x each, v28 envelope tokens 6, no v29/v30 tag, stamp store 1x, loops 5, prints 6, no ExpertRemove/iTime/DirName, no return in A/B/C.
- Base anchors A/B/C 1x each on CRLF tree; pre-existing `probe_` 0x.
- Post-build EA: `9C79FC1E39CD6B9A7B49443A8F50EEE7394FB09B163208943E0415F037B918B` / 613044 B; `probe_` 330; env28 6x.
- Raw-byte audit: CR 11099 / LF 11228 (129 LF-only lines = inserted LF-based insertion text, same method as the v25 build which compiled 0/0).

## Addendum bindings (sole bounded exception, from this record)
- probe_vals[14]/[15]: STRIKE-retained frozen `-` stores; no hunk; positions/ledger maxima per packet.

## Compile
- `compile_ext1live_ea.ps1` via metaeditor64; log `06_HANDOFFS\EXT1LIVE-V1_EACOMPILE.log` (7852 B, 2026-09-19): Result 0 errors, 0 warnings.

## Standing pending (run side)
- One run under the v30 envelope (RECON44_DEMO_P1, InpMode 1, 08-26 to 09-09, InpDebugLog=true pre-run assertion, 90-min ceiling). STAGE-0 triage on record (v28 relay).
