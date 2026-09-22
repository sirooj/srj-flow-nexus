$ErrorActionPreference = 'Stop'
$led = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_LEDGER_QUEUE.md'
$L = [System.IO.File]::ReadAllLines($led)
if ($L.Count -ne 7263) { throw ('ledger lines moved: ' + $L.Count) }
if (-not $L[7262].StartsWith('454. ')) { throw 'ledger anchor missed' }
$entry = '455. V191 STAGE-B FILED + REVIEW/ASSURANCE PASS 2026-09-19 (scripts relayv191d_stageb.ps1 + relayv191f_fixup.ps1 ASCII-only; tail splice at stale v190 Q with fail-closed anchors; delta-since-v190 + N-constancy/bucket/discharged evidence + Q191 + digest roll + snippet assert; review pass found 4 wording fixes, assurance re-run green). Battery same turn: RLINES 481, TWIN 46/46-0, ELL 0/0, PSEQ 46 unbroken, SNIP 285/285-0, ADOPT 73/73, NUMBERS 23/23, LEFTOVER adjudicated (v27-Q 0x, 09448475 0x, register hits history-only), distinct64 3 (EA C375/pkt 12CA/v190 B2A7), nonAscii 275 to 274 (stale em-dash out with old Q). Relay BUILDER_RELAY_COUNCIL_v191-EXT1LIVE-RECLEAR27.md 2111756B/237706 B/481 lines. EA C375/612385 + packet 12CAE900/147252/46 untouched. NO build/run/commit. Owed: transport (him).'
if (([regex]::Matches($entry, '[^\x00-\x7F]')).Count -ne 0) { throw 'entry non-ascii, halt' }
[System.IO.File]::AppendAllText($led, [string][char]13 + [string][char]10 + $entry)
$L2 = [System.IO.File]::ReadAllLines($led)
if ($L2.Count -ne 7264) { throw 'append failed' }
if (-not $L2[7263].StartsWith('455. ')) { throw 'new entry misfiled' }
if (-not $L2[7262].StartsWith('454. ')) { throw 'anchor disturbed' }
'ledger_lines=' + $L2.Count
'tail=' + $L2[7263].Substring(0, 60)
