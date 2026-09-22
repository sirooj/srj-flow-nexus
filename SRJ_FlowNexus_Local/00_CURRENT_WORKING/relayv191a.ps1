$ErrorActionPreference = 'Stop'
$dirH = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$dirT = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS'
$eaFile = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$relPrev = Join-Path $dirH 'BUILDER_RELAY_COUNCIL_v190-EXT1LIVE-RECLEAR26.md'
$relNew = Join-Path $dirH 'BUILDER_RELAY_COUNCIL_v191-EXT1LIVE-RECLEAR27.md'
$pktFile = Join-Path $dirT 'PACKET_EXT1LIVE-001.md'
if (Test-Path -LiteralPath $relNew) { throw 'v191 exists, halt' }
$eaHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $eaFile).Hash
if ($eaHash -ne 'C375D6A52FA54129FA1C9D9839F03F6CAEECB231AAD9AFC094B8A3CCB7F8AA90') { throw 'EA drift, halt' }
$eaBytes = (Get-Item -LiteralPath $eaFile).Length
if ($eaBytes -ne 612385) { throw 'EA bytes moved, halt' }
$prevHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $relPrev).Hash
if ($prevHash -ne 'B2A70523678B9CB1905EA3B4E57D7AB477C47141E089ABE1A5D71507D52D7715') { throw 'v190 drift, halt' }
$pktDig = (Get-FileHash -Algorithm SHA256 -LiteralPath $pktFile).Hash
'pktdigest=' + $pktDig
$pktLines = [System.IO.File]::ReadAllLines($pktFile)
if ($pktLines.Count -ne 46) { throw 'packet lines changed, halt' }
$prevLines = [System.IO.File]::ReadAllLines($relPrev)
if ($prevLines.Count -ne 471) { throw 'relay v190 lines changed, halt' }
$p1idx = -1; $p46idx = -1
for ($k = 0; $k -lt $prevLines.Count; $k++) {
  if ($prevLines[$k].StartsWith('P001:')) { $p1idx = $k }
  if ($prevLines[$k].StartsWith('P046:')) { $p46idx = $k }
}
if ($p1idx -ne 18 -or $p46idx -ne 63) { throw 'P-block bounds moved, halt' }
$headArr = @($prevLines[0..($p1idx - 1)])
$tailArr = @($prevLines[($p46idx + 1)..($prevLines.Count - 1)])
function CountOf([string]$x, [string]$a) {
  if ($a.Length -eq 0) { return -1 }
  return (($x.Length - $x.Replace($a, '').Length) / $a.Length)
}
$headJoined = $headArr -join [char]10
$pairs = @(
  @('CODE REVIEW REQUEST - v190 - 2026-09-19 (RE-CLEARANCE 26: packet v27 folds v189 council verdicts (Luna-9, Astra-A1-A9, Opus-D-1-D-14/A-1-A-10) as text with repair-in-place per operator word (B-items carried for council disposal, not folded; no rebuild, tree stands as run); supersedes v189 (v26 withdrawn: see v27 supersede list); dir {1,-1} on dir-carrying types (NORMAL, BSAVE_FAIL); 1024/1056 ledger; corroboration join; format v2)',
    'CODE REVIEW REQUEST - v191 - 2026-09-19 (CLEARANCE 27: packet v28 folds V190 verdicts (Luna-8, Astra A1-A14/B-1-B-4, Opus A-1-A-16/B-1-B-6) as text with B-1/B-2 literal adoption + tag roll (B-3/B-4/B-5 + Astra B-1/B-2/B-3 carried); supersedes v190 (v27 withdrawn: see v28 supersede list); dir {1,-1} on dir-carrying types (NORMAL, BSAVE_FAIL); per-part ledger 439/372/448; corroboration join; format v2)'),
  @('rule the RECON47 grade split (INCOMPLETE acceptance plus prefix partial-pass) and the v27 narrowed contract on the evidence below so the grade and the sink-cap bound settle by council ruling',
    'clear PACKET_EXT1LIVE-001 v28 by name for exactly one print-only probe build plus one run under the envelope below, and rule the v28 contract (FAILED-transport grade with findings plus the 3-part record shape)'),
  @('clears ONLY the section-3 probe instrumentation as recorded in v27 (grade split-label, per-row prefix, arity withdrawal, mandatory mapping, strike relabel, hunk-D reopen, sink-gate record, canonical stripping, payload definitions, sweep scoping, fire restatement, poison inventory, prefix N-48, strike pre-filing, coupling suspension, hierarchy note, terminal positive, 2-of-3 split, headroom note, anomaly rule, split register, INVALID coverage)',
    'clears ONLY the section-3 probe instrumentation as frozen in v28 (3-part NORMAL shape, per-part ledger and grammar, FAILED-transport grade with findings, proxy rule, position convention, INVALID scoping, hunk-D disposal, wire-tag rule)'),
  @('this packet v1 through v26; relays v162 through v189 on disk',
    'this packet v1 through v27; relays v162 through v190 on disk'),
  @('File / function / lines: no code change this relay; tree landed 3a932b9',
    'File / function / lines: code-change relay (P032 3-part literal + tag roll); working tree carries the v25-built C over landed base 3a932b9'),
  @('(EA `6C2E4028` / 602894 B, re-hashed this turn',
    '(EA `@@EA@@` / @@EBYTES@@ B, re-hashed this turn (v25-built C, instrumented, uncommitted); landed base EA `6C2E4028` / 602894 B'),
  @('digest identical, disk unchanged); packet v27 `01_TASKS\PACKET_EXT1LIVE-001.md` (46 lines, `0944847535627A751E3DA89F0D322D28AB6C3634963CDCEF9957B7920367EBF0`',
    'working tree identical to the verified build state, disk unchanged since build); packet v28 `01_TASKS\PACKET_EXT1LIVE-001.md` (46 lines, `@@PDIG@@`'),
  @('v26 plus the v189-verdict deltas below, code untouched)',
    'v27 plus the v190-verdict deltas below, C literal 3-part split + tag roll)'),
  @('three loops, four Prints',
    'five loops, six Prints'),
  @('RUN-COST: one print-only build plus one tester run, ceiling 90 minutes, same ini and range (RECON44_DEMO_P1, InpMode 1, 08-26 to 09-09, InpDebugLog=true pre-run assertion); code untouched since 3a932b9.',
    'RUN-COST: one print-only build plus one tester run, ceiling 90 minutes, same ini and range (RECON44_DEMO_P1, InpMode 1, 08-26 to 09-09, InpDebugLog=true pre-run assertion); build from landed base via gated applier (STAGE-1 exact-diff against the v28 literal plus tag, 0/0 compile, post-build re-hash).'),
  @('and the tree stands as run.',
    'and the tree stands as run. v28 presenter (why-not-last-time): the cleared 3-part shape has never run; the authorized run returns first per-part transport proof (each part inside the measured sink), emitSeq survival on every part, stamp transport, and full-row acceptance - evidence no prior run could return (RECON47 single-line rows cannot carry keys 24-38 by structure, 499 over 489).')
)
foreach ($pair in $pairs) {
  $c = CountOf $headJoined $pair[0]
  if ($c -ne 1) { throw ('head anchor count ' + $c + ': ' + $pair[0].Substring(0, [Math]::Min(60, $pair[0].Length))) }
  $headJoined = $headJoined.Replace($pair[0], $pair[1])
}
if (-not $headArr[0].StartsWith('CODE REVIEW REQUEST')) { throw 'title line moved, halt' }
$headOut = @($headJoined -split [char]10)
if ($headOut.Count -ne 18) { throw 'head split moved, halt' }
if (-not $headOut[0].StartsWith('CODE REVIEW REQUEST - v191 -')) { throw 'title rep missed, halt' }
$pblock = @()
for ($k = 0; $k -lt 46; $k++) {
  $n = 'P{0:000}' -f ($k + 1)
  $pblock += ($n + ': ' + $pktLines[$k])
}
if (-not $pblock[0].StartsWith('P001:')) { throw 'pblock head broken' }
if (-not $pblock[45].StartsWith('P046:')) { throw 'pblock tail broken' }
$out = @()
$out += $headOut
$out += $pblock
$out += $tailArr
$text = $out -join ([char]13 + [char]10)
$text = $text.Replace('@@EA@@', $eaHash)
$text = $text.Replace('@@EBYTES@@', [string]$eaBytes)
$text = $text.Replace('@@PDIG@@', $pktDig)
[System.IO.File]::WriteAllText($relNew, $text)
'WROTE relay bytes=' + ([System.IO.File]::ReadAllBytes($relNew).Length)
$CR13 = [string][char]13; $LF10 = [string][char]10
$norm = { param($s) $x = $s.Replace($CR13, ''); if ($x.EndsWith($LF10)) { $x = $x.Substring(0, $x.Length - 1) }; return $x }
$pa = (& $norm ([System.IO.File]::ReadAllText($pktFile))) -split $LF10
$ra = (& $norm ([System.IO.File]::ReadAllText($relNew))) -split $LF10
$rp = @()
foreach ($ln in $ra) { if ($ln -match '^P[0-9][0-9][0-9]: ') { $rp += $ln.Substring(6) } }
'twin_packet=' + $pa.Count + ' twin_relay=' + $rp.Count
$mis = 0
for ($k = 0; $k -lt 46; $k++) { if ($pa[$k] -ne $rp[$k]) { $mis++ } }
'twin_mismatches=' + $mis
'ellipsis=' + (CountOf ([System.IO.File]::ReadAllText($relNew)) '...')
'rdigest=' + (Get-FileHash -Algorithm SHA256 -LiteralPath $relNew).Hash
'rbytes=' + (Get-Item -LiteralPath $relNew).Length
'rlines=' + ([System.IO.File]::ReadAllLines($relNew)).Count
