$ErrorActionPreference = 'Stop'
$work = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$relFile = Join-Path $work 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v191-EXT1LIVE-RECLEAR27.md'
$pktFile = Join-Path $work 'SRJ_FlowNexus_Local\01_TASKS\PACKET_EXT1LIVE-001.md'
function Cnt([string]$x, [string]$a) { if ($a.Length -eq 0) { return -1 }; return (($x.Length - $x.Replace($a, '').Length) / $a.Length) }
$t = [System.IO.File]::ReadAllText($relFile)
$pairs = @(
  @('headroom naming, loop census', 'headroom named, loop census'),
  @('prefix deltas with chunking direction via the B-1 shape (P001)', 'prefix deltas taken as text, chunking direction taken via the B-1 shape (P001)'),
  @('wire-tag invariant (P042', 'Wire-tag invariant (P042'),
  @('hunk-D disposed (P046', 'hunk-D disposal (P046')
)
foreach ($pr in $pairs) {
  if ((Cnt $t $pr[0]) -ne 1) { throw ('anchor count for fixup: ' + $pr[0]) }
  $t = $t.Replace($pr[0], $pr[1])
}
if (([regex]::Matches($t, '[^\x00-\x7F]')).Count -ne 274) { throw 'nonascii moved, halt' }
[System.IO.File]::WriteAllText($relFile, $t)
'WROTE bytes=' + ([System.IO.File]::ReadAllBytes($relFile).Length)
'rlines=' + ([System.IO.File]::ReadAllLines($relFile)).Count
'rdigest=' + (Get-FileHash -Algorithm SHA256 -LiteralPath $relFile).Hash
$CR13 = [string][char]13; $LF10 = [string][char]10
$norm = { param($s) $x = $s.Replace($CR13, ''); if ($x.EndsWith($LF10)) { $x = $x.Substring(0, $x.Length - 1) }; return $x }
$pa = (& $norm ([System.IO.File]::ReadAllText($pktFile))) -split $LF10
$ra = (& $norm ([System.IO.File]::ReadAllText($relFile))) -split $LF10
$rp = @()
foreach ($ln in $ra) { if ($ln -match '^P[0-9][0-9][0-9]: ') { $rp += $ln.Substring(6) } }
'twin=' + $pa.Count + '/' + $rp.Count
$mis = 0
for ($k = 0; $k -lt 46; $k++) { if ($pa[$k] -ne $rp[$k]) { $mis++ } }
'twin_mismatches=' + $mis
'ellipsis=' + (Cnt ([System.IO.File]::ReadAllText($relFile)) '...')
$pkt = [System.IO.File]::ReadAllText($pktFile)
$fr = @('Luna-8 transport/prefix deltas taken as text', 'chunking direction taken via the B-1 shape', 'Astra A1-A14 taken as text', 'B-1/B-2 adopted', 'C literal 3-part split + tag roll', '38-field payload in 3 part-frames + fixed per-part envelope', 'three range-bounded NORMAL part loops 0-12/13-25/26-37', 'one Print per part', 'six emission Prints', 'NORMAL x3', 'halt answered by the 3-part shape', 'FAILED-transport label', 'FAILED acceptance on transport', 'instrument fired, probe acceptance FAILED on transport shortfall', 'not an instrument defect, not a strike', 'the INCOMPLETE-plus-prefix-partial label is retired as a grade', 'surviving prefix results ride as named FINDINGS below, never as partial acceptance', 'EXECUTION=PASSED, FULL-ROW ACCEPTANCE=UNPROVEN', 'envelope 83 + key structure 416 = 499 message bytes', 'measured 489-character message budget', 'minimum deficit 10', 'observed shortfall about 300', 'filed worst case 535', 'a truncated NORMAL part fails complete-record validation', 'salvage satisfies no grammar, discharges no missing mandatory check, and resumes no acceptance', 'an observed contradiction in a complete prefix field remains a failure, never merely missing evidence', 'graded_prefix = all complete key=value tokens before the first incomplete token', 'WITHHELD, never parsed/compared/counted', 'the final key=value pair on any cut row is withheld unconditionally, completeness notwithstanding (Opus-A5)', 'The prefix is determined per row (Astra-A5)', 'each row records last demonstrably complete field, cut/withheld field, checks passed, checks failed, checks unavailable', 'partial credit attaches to checks, never to rows', 'A key appearing past the measured cap in bytes, or a row longer than the cap in bytes, is an anomaly and halts', 'the cut byte is constant, the cut key is not', 'entry==currentPrice inside the probe record holds by construction', 'the duplicate is not a runtime falsifier of the mapping, and the cleared literal establishes the value by shared store', '13/13 RECON47 NORMAL journal lines measure 537 chars, so N=48 holds every row and the 537 total cap stands', 'The bound is ruled as the observed 537-character journal-line cutoff on this transport path (Luna-2); universal sink capacity remains unproven', 'segment payload = 468, as-wire STOPRESOLVE = 489, journal line = 537', 'key structure EA-measured 116/156/144; value maxima contract-table 217/110/198', 'part 1/3 worst 439, part 2/3 worst 372 (poison-inclusive 404), part 3/3 worst 448; all inside 489 with margins 50/117/41', '1024 = 83 + 416 + 525; 1056 = 1024 + 32 poison', 'bucket history (A-14)', '340/416/525', '339/415/526 totals', '13 integer fields = 42', '15 integer fields = 41 fully itemized by field name above', 'the field-level width delta between the two filings is unreconstructible beyond these class totals, stated here not hidden', 'Run-discharged on RECON47, previously predicted', '6-of-11 post-activation fire count', 'wouldGate=1 on exactly six TP_ELECT bars', 'three-source-changed rule measured 10/13', 'all ten sel=1 rows byte-identical slLive==pxExt1 and rLive==rExt1; only A1/A2/A3 differ', 'ext1-tuple corroboration 3/3 per the slots above', 'Wire-tag invariant (Opus-A12)', 'the wire pkt= tag names the build generation, not the clearing packet version', 'OMITTED under the v28 three-part shape', 'the stamp transports on the wire', 'rationale narrowed to the stamp alone per A-14', 'positions ladOriginStamp 38 / ladOriginSite 25', 'complete templates', 'corroboration join', 'strategy-pure census', 'tag roll', 'INVALID scoping', 'position convention', '3-class mapping', 'BSAVE figure', 'headroom named', 'loop census', 'B-3/B-4/B-5 plus Astra B-1/B-2/B-3 carried for council disposal', 'tester-log sink equivalence WITHDRAWN as a gate', 'B-4 taken via the B-2 gate flip')
$bad = 0
foreach ($f in $fr) { if ($pkt.IndexOf($f) -lt 0) { Write-Output ('ADOPT-MISS: ' + $f); $bad++ } }
'adopt_checked=' + $fr.Count + ' adopt_miss=' + $bad
$relLines = [System.IO.File]::ReadAllLines($relFile)
foreach ($ot in @('partial-pass', 'single-line 38-field', 'INCOMPLETE-plus-prefix-partial', 'v27 narrowed contract', '09448475', 'rule the RECON47 grade split')) {
  $hits = @()
  for ($k = 0; $k -lt $relLines.Count; $k++) { if ($relLines[$k].IndexOf($ot) -ge 0) { $hits += ($k + 1) } }
  Write-Output ('LEFTOVER[' + $ot + ']=' + ($hits -join ','))
}
$final = [System.IO.File]::ReadAllText($relFile)
$m64 = [regex]::Matches($final, '[0-9A-Fa-f]{64}')
'distinct64=' + ((($m64 | ForEach-Object { $_.Value }) | Select-Object -Unique).Count)
foreach ($d in @(($m64 | ForEach-Object { $_.Value }) | Select-Object -Unique)) { Write-Output ('DIGEST64 ' + $d.Substring(0, 12)) }
$pb = ''
for ($k = 0; $k -lt $relLines.Count; $k++) { if ($relLines[$k] -match '^P[0-9][0-9][0-9]: ') { $pb += $relLines[$k] } }
$nb = 0
foreach ($n in @('439', '372', '448', '404', '489', '499', '416', '535', '537', '468', '144', '198', '217', '110', '525', '526', '415', '339', '1024', '1056', 'N=48', '50/117/41', 'deficit 10')) { if ($pb.IndexOf($n) -lt 0) { Write-Output ('NUM-MISS: ' + $n); $nb++ } }
'numbers_checked=23 numbers_miss=' + $nb
$tot = 0; $hit = 0
$blob = @(git --no-pager -C $work show '3a932b9:Experts/SRJ_FlowNexus_EA.mq5')
foreach ($ln in $relLines) {
  if ($ln -match '^EA L([0-9]+): (.*)$') {
    $tot++
    if ($blob[[int]$Matches[1] - 1] -ceq $Matches[2]) { $hit++ }
  }
}
'snippet_total=' + $tot + ' snippet_match=' + $hit
'line1=' + $relLines[0].Substring(0, 60)
'line3has_q=' + ($relLines[2].IndexOf('clear PACKET_EXT1LIVE-001 v28 by name') -ge 0)
