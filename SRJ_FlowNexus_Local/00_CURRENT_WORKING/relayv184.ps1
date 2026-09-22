$ErrorActionPreference = 'Stop'
$H = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$T = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS'
$RP = Join-Path $H 'BUILDER_RELAY_COUNCIL_v183-EXT1LIVE-RECLEAR19.md'
$RN = Join-Path $H 'BUILDER_RELAY_COUNCIL_v184-EXT1LIVE-RECLEAR20.md'
$PK = Join-Path $T 'PACKET_EXT1LIVE-001.md'
if (Test-Path -LiteralPath $RN) { throw 'v184 exists, halt' }
$hea = (Get-FileHash -Algorithm SHA256 -LiteralPath 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5').Hash
if ($hea -ne '6C2E402846DB0BFBCDABD40AC2D08BEE7A59D0F92BBD2E9F9D2B8DAC817BCC07') { throw 'EA drift, halt' }
$pdig = (Get-FileHash -Algorithm SHA256 -LiteralPath $PK).Hash
$pbytes = (Get-Item -LiteralPath $PK).Length
'packetdigest=' + $pdig
'packetbytes=' + $pbytes
$plines = [System.IO.File]::ReadAllLines($PK)
if ($plines.Count -ne 46) { throw 'packet lines changed, halt' }
$rlines = [System.IO.File]::ReadAllLines($RP)
if ($rlines.Count -ne 457) { throw 'relay v183 lines changed, halt' }
$p1 = -1; $p46 = -1
for ($i = 0; $i -lt $rlines.Count; $i++) {
  if ($rlines[$p1,$p46] -contains $null) { }
  if ($rlines[$i].StartsWith('P001:')) { $p1 = $i }
  if ($rlines[$i].StartsWith('P046:')) { $p46 = $i }
}
if ($p1 -ne 18 -or $p46 -ne 63) { throw 'P-block bounds moved, halt' }
$head = @($rlines[0..($p1 - 1)])
$tail = @($rlines[($p46 + 1)..($rlines.Count - 1)])
function CountOf([string]$x, [string]$a) {
  if ($a.Length -eq 0) { return -1 }
  return (($x.Length - $x.Replace($a, '').Length) / $a.Length)
}
$hj = $head -join "`n"
$must = @(
  @('packet v20 `01_TASKS\PACKET_EXT1LIVE-001.md` (46 lines, `9C64CCE2`',
    'packet v21 `01_TASKS\PACKET_EXT1LIVE-001.md` (46 lines, `@@PDIG@@`'),
  @('v19 plus the v182-verdict deltas below, code untouched',
    'v20 plus the v183-verdict deltas below, code untouched'),
  @('six successful-branch temps',
    'eight successful-branch temps'),
  @('38+38 step-3a/5b stores, two loops, four Prints',
    '38+38 step-3a/5b stores, three loops, four Prints'),
  @('Clearable body (packet v20 sections 1 through 5, byte-exact twin of the filed packet; relay lines numbered P001 onward for citation):',
    'Clearable body (packet v21 sections 1 through 5, byte-exact twin of the filed packet; relay lines numbered P001 onward for citation):'),
  @('(insertions A, B, and C as literal source text pasted in P032; the STAGE-1 exact-diff gate checks the build tree against that text)',
    '(insertions A, B, and C as literal source text pasted in P032, except the two explicitly named STAGE-1-bound RHS expressions covered by the addendum hunk; the STAGE-1 exact-diff gate checks the build tree against that text plus the hunk)'),
  @('absence-proof class (no earlier probe existed to void).',
    'absence-proof class (no earlier probe existed to void); v21 re-freeze (brace relocated plus stamp stored) makes this the first output from the corrected instrument, same class.'),
  @('The L5305-L5498 debug-gate block rides below with the machine brace census.',
    'The L5442-L5498 debug-gate block rides below with the L5305-L5306 opener plus the machine brace census.')
)
foreach ($pair in $must) {
  $c = CountOf $hj $pair[0]
  if ($c -ne 1) { throw ('head anchor count ' + $c + ': ' + $pair[0].Substring(0, [Math]::Min(60, $pair[0].Length))) }
  $hj = $hj.Replace($pair[0], $pair[1])
}
if (-not $head[0].StartsWith('CODE REVIEW REQUEST')) { throw 'title line moved, halt' }
if (-not $head[2].StartsWith('Change (one plain sentence): clear PACKET_EXT1LIVE-001 v20')) { throw 'change line moved, halt' }
$ha = @($hj -split "`n")
if ($ha.Count -ne 18) { throw 'head split moved, halt' }
$ha[0] = 'CODE REVIEW REQUEST - v184 - 2026-09-19 (RE-CLEARANCE 20: packet v21 folds Luna-v183 stamp+wording + Astra-v183-A1-A10/B1-B3 + Opus-v183-F-1-F-12/B-1-B-8; supersedes v183 (v20 withdrawn: brace relocated, stamp stored, census recounted, bound-"-" base, quotient checks, round-temp, gates split, dir arms); dir {1,-1} on dir-carrying types (NORMAL, BSAVE_FAIL); 1024/1056 ledger; corroboration join; format v2)'
$ha[2] = 'Change (one plain sentence): clear PACKET_EXT1LIVE-001 v21 by name for exactly one print-only probe build plus one run under the envelope below so selector to stop to R-gate to shadow is settled by output (downstream veto/latch/SIGNAL/session-mark ordering stays source-mapped, never probe-proven). This authorization, if granted, clears ONLY the section-3 probe instrumentation as re-frozen in v21 (brace relocated, stamp stored, bound-"-" base with addendum hunk, quotient/result checks, round-temp, gates split, dir arms) - never the future rule, never live activation (insertions A, B, and C as literal source text pasted in P032, except the two explicitly named STAGE-1-bound RHS expressions covered by the addendum hunk; the STAGE-1 exact-diff gate checks the build tree against that text plus the hunk).'
$hj = $ha -join "`n"
$tj = $tail -join "`n"
$tmust = @(
  @('A1/A3 leg-(b) now PRE-RESOLVED confirmed on archive rows',
    'A1/A3 leg-(b) now archive-confirmed at display precision on archive rows'),
  @('PACKET_EXT1LIVE-001 v20 by name',
    'PACKET_EXT1LIVE-001 v21 by name'),
  @('(A, B, and C as literal source text pasted in P032)',
    '(A, B, and C as literal source text pasted in P032, except the two explicitly named STAGE-1-bound RHS expressions covered by the addendum hunk)')
)
foreach ($pair in $tmust) {
  $c = CountOf $tj $pair[0]
  if ($c -ne 1) { throw ('tail anchor count ' + $c + ': ' + $pair[0].Substring(0, [Math]::Min(60, $pair[0].Length))) }
  $tj = $tj.Replace($pair[0], $pair[1])
}
$pblock = @()
for ($k = 0; $k -lt 46; $k++) {
  $n = 'P{0:000}' -f ($k + 1)
  $pblock += ($n + ': ' + $plines[$k])
}
if (-not $pblock[0].StartsWith('P001:')) { throw 'pblock head broken' }
if (-not $pblock[45].StartsWith('P046:')) { throw 'pblock tail broken' }
$out = @()
$head2 = @($hj -split "`n")
if ($head2.Count -ne 18) { throw 'head line count moved, halt' }
$out += $head2
$out += $pblock
$out += ($tj -split "`n")
$text = $out -join "`r`n"
$text = $text.Replace('@@PDIG@@', $pdig)
[System.IO.File]::WriteAllText($RN, $text)
'WROTE relay bytes=' + ([System.IO.File]::ReadAllBytes($RN).Length)
$norm = { param($s) $x = $s.Replace("`r", ''); if ($x.EndsWith("`n")) { $x = $x.Substring(0, $x.Length - 1) }; return $x }
$pa = (& $norm ([System.IO.File]::ReadAllText($PK))) -split "`n"
$ra = (& $norm ([System.IO.File]::ReadAllText($RN))) -split "`n"
$rp = @()
foreach ($ln in $ra) { if ($ln -match '^P[0-9][0-9][0-9]: ') { $rp += $ln.Substring(6) } }
'twin_packet=' + $pa.Count + ' twin_relay=' + $rp.Count
$mis = 0
for ($k = 0; $k -lt 46; $k++) { if ($pa[$k] -ne $rp[$k]) { $mis++ } }
'twin_mismatches=' + $mis
'ellipsis=' + (CountOf ([System.IO.File]::ReadAllText($RN)) '...')
'rdigest=' + (Get-FileHash -Algorithm SHA256 -LiteralPath $RN).Hash
