$ErrorActionPreference = 'Stop'
$work = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$dirH = Join-Path $work 'SRJ_FlowNexus_Local\06_HANDOFFS'
$dirT = Join-Path $work 'SRJ_FlowNexus_Local\01_TASKS'
$relFile = Join-Path $dirH 'BUILDER_RELAY_COUNCIL_v191-EXT1LIVE-RECLEAR27.md'
$prevFile = Join-Path $dirH 'BUILDER_RELAY_COUNCIL_v190-EXT1LIVE-RECLEAR26.md'
$pktFile = Join-Path $dirT 'PACKET_EXT1LIVE-001.md'
$eaFile = Join-Path $work 'Experts\SRJ_FlowNexus_EA.mq5'
function Cnt([string]$x, [string]$a) { if ($a.Length -eq 0) { return -1 }; return (($x.Length - $x.Replace($a, '').Length) / $a.Length) }
$relLines = [System.IO.File]::ReadAllLines($relFile)
if ($relLines.Count -ne 471) { throw ('pre lines ' + $relLines.Count) }
if ((Get-FileHash -Algorithm SHA256 -LiteralPath $relFile).Hash -ne '369F05CE120E96E417A1B9F46209D55F5FEAE1671D795168B5BAD4CB2421E9EC') { throw 'relay drift, halt' }
if (-not $relLines[18].StartsWith('P001:')) { throw 'p1 moved' }
if (-not $relLines[63].StartsWith('P046:')) { throw 'p46 moved' }
if (-not $relLines[458].StartsWith('Delta applications since v189')) { throw 'v189 anchor missed' }
if ($relLines[459] -ne '') { throw 'blank anchor missed' }
if (-not $relLines[460].StartsWith('Question (one, specific): rule the RECON47')) { throw 'oldQ anchor missed' }
if ($relLines[470] -ne 'Nothing else is asked. Thank you.') { throw 'close anchor missed' }
$eaHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $eaFile).Hash
if ($eaHash -ne 'C375D6A52FA54129FA1C9D9839F03F6CAEECB231AAD9AFC094B8A3CCB7F8AA90') { throw 'EA drift, halt' }
$eaBytes = (Get-Item -LiteralPath $eaFile).Length
if ($eaBytes -ne 612385) { throw 'EA bytes moved, halt' }
$pktDig = (Get-FileHash -Algorithm SHA256 -LiteralPath $pktFile).Hash
if ($pktDig -ne '12CAE9006E28FCDB52D641E61E3D262265E2934A6FB8C2D645BD9E8229E9E99C') { throw 'packet drift, halt' }
$pktLines = [System.IO.File]::ReadAllLines($pktFile)
if ($pktLines.Count -ne 46) { throw 'packet lines moved, halt' }
$v190h = (Get-FileHash -Algorithm SHA256 -LiteralPath $prevFile).Hash
if ($v190h -ne 'B2A70523678B9CB1905EA3B4E57D7AB477C47141E089ABE1A5D71507D52D7715') { throw 'v190 drift, halt' }
$v190n = ([System.IO.File]::ReadAllLines($prevFile)).Count
if ($v190n -ne 471) { throw 'v190 lines moved, halt' }
$preNonAscii = ([regex]::Matches([System.IO.File]::ReadAllText($relFile), '[^\x00-\x7F]')).Count
Write-Output ('pre_nonascii=' + $preNonAscii)
$delta = 'Delta applications since v190 (this trip: Luna-v190-1-8 plus Astra-v190-A1-A14/B-1-B-4 plus Opus-v190-A-1-A-16/B-1-B-6, filed whole as LUNA-V190-001, ASTRA-V190-001, OPUS-V190-001; triple-AMEND = NO BUILD, v27 never builds, superseded by v28). Adopted as text: Luna-8 transport/prefix deltas with chunking direction via the B-1 shape (P001); Astra A1-A14 (P001); Opus A-1-A-16 with B-1/B-2 literal adoption (P001/P032/P038 - C literal 3-part split with 38-field payload in 3 part-frames + fixed per-part envelope, three range-bounded NORMAL part loops 0-12/13-25/26-37, one Print per part, six emission Prints SCHEMA + NORMAL x3 + CAP + BSAVE_FAIL); halt answered by the 3-part shape (P001/P046); FAILED-transport grade with findings (P001/P042 - RECON47 grade: instrument fired, probe acceptance FAILED on transport shortfall (Opus core: not an instrument defect, not a strike); the INCOMPLETE-plus-prefix-partial label is retired as a grade; surviving prefix results ride as named FINDINGS below, never as partial acceptance; EXECUTION=PASSED, FULL-ROW ACCEPTANCE=UNPROVEN); structural finding (P038 - envelope 83 + key structure 416 = 499 message bytes before a single value byte, against the measured 489-character message budget; minimum deficit 10; observed shortfall about 300; filed worst case 535); precedence (P038 - a truncated NORMAL part fails complete-record validation and makes full-row acceptance INCOMPLETE; salvage satisfies no grammar, discharges no missing mandatory check, and resumes no acceptance; an observed contradiction in a complete prefix field remains a failure, never merely missing evidence); graded_prefix with per-row register (P001/P038 - graded_prefix = all complete key=value tokens before the first incomplete token; everything from that incomplete token onward is WITHHELD, never parsed/compared/counted, and the final key=value pair on any cut row is withheld unconditionally, completeness notwithstanding (Opus-A5); the prefix is determined per row (Astra-A5): each row records last demonstrably complete field, cut/withheld field, checks passed, checks failed, checks unavailable; partial credit attaches to checks, never to rows); byte anomaly rule (P038 - a key appearing past the measured cap in bytes, or a row longer than the cap in bytes, is an anomaly and halts (Opus-A6: the cut byte is constant, the cut key is not)); proxy rule (P028 - entry==currentPrice inside the probe record holds by construction (proxy rule, stated once here (Opus-A4): the duplicate is not a runtime falsifier of the mapping, and the cleared literal establishes the value by shared store); N-constancy answered (P038 - 13/13 RECON47 NORMAL journal lines measure 537 chars, so N=48 holds every row and the 537 total cap stands; the bound is ruled as the observed 537-character journal-line cutoff on this transport path (Luna-2); universal sink capacity remains unproven); measure names fixed (P038 - segment payload = 468, as-wire STOPRESOLVE = 489, journal line = 537); buckets refiled (P038 - key structure EA-measured 116/156/144; value maxima contract-table 217/110/198; part 1/3 worst 439, part 2/3 worst 372 (poison-inclusive 404), part 3/3 worst 448; all inside 489 with margins 50/117/41; bucket history (A-14) with 340/416/525); discharged findings (P042 - 6-of-11 post-activation fire count; three-source-changed rule measured 10/13; ext1-tuple corroboration 3/3); wire-tag invariant (P042 - the wire pkt= tag names the build generation, not the clearing packet version); hunk-D disposed (P046 - OMITTED under the v28 three-part shape; the stamp transports on the wire; rationale narrowed to the stamp alone per A-14); complete templates, corroboration join, strategy-pure census, tag roll, INVALID scoping, position convention, 3-class mapping, BSAVE figure, headroom naming, loop census per the P001 fold list. Parked visible in P046: Opus B-3/B-4/B-5 plus Astra B-1/B-2/B-3 carried for council disposal (literal/validator changes need own tokens); Astra B-4 via the B-2 gate flip (P001/P038 - tester-log sink equivalence WITHDRAWN as a gate).'
$n1 = 'N-CONSTANCY evidence (P038 anchor, Opus-A7 answered on packet): 13/13 RECON47 NORMAL journal lines measure 537 chars, so N=48 holds every row and the 537 total cap stands. The bound is ruled as the observed 537-character journal-line cutoff on this transport path (Luna-2); universal sink capacity remains unproven. Measure names (Luna-1), fixed: segment payload = 468, as-wire STOPRESOLVE = 489, journal line = 537.'
$n2 = 'BUCKET evidence (P038 anchor, per-part ledger with A-14 history): key structure EA-measured 116/156/144; value maxima contract-table 217/110/198; part 1/3 worst 439, part 2/3 worst 372 (poison-inclusive 404), part 3/3 worst 448; all inside 489 with margins 50/117/41 (1024 = 83 + 416 + 525; 1056 = 1024 + 32 poison). Bucket history (A-14): v15 filed 13 integer fields = 42 with 339/415/526 totals (relay-v178-filed; per-field widths never itemized on any transported page); v19 files 15 integer fields = 41 fully itemized by field name above with 340/416/525 (v18 filed the same itemized 41); the field-level width delta between the two filings is unreconstructible beyond these class totals, stated here not hidden.'
$n3 = 'DISCHARGED-FINDINGS evidence (P042 anchor, run-discharged on RECON47, previously predicted): 6-of-11 post-activation fire count (wouldGate=1 on exactly six TP_ELECT bars - 08-28 10:00, A1 08-28 16:20, 09-04 15:55, 09-07 09:15, 09-07 16:40, 09-08 10:05 - with A2 wouldGate=1 excluded as a non-TP_ELECT bar and 08-26 14:40 carrying no TP_ELECT row); three-source-changed rule measured 10/13 (all ten sel=1 rows byte-identical slLive==pxExt1 and rLive==rExt1; only A1/A2/A3 differ); ext1-tuple corroboration 3/3 per the slots above.'
$q191 = 'Question (one, specific): clear PACKET_EXT1LIVE-001 v28 by name for exactly one print-only probe build plus one run under the envelope above, and rule the v28 contract (FAILED-transport grade with findings plus the 3-part record shape) - accept, amend-with-delta, or halt, with line numbers?'
$droll = 'Digest roll (measured in-run after the stage-B write, hash-fresh at filing): EA `@@EAHASH@@` / @@EABYTES@@ B (v25-built C, instrumented, uncommitted); packet `@@PDIG@@` / @@PBYTES@@ B / 46 lines; v190 base `@@V190H@@` / @@V190B@@ B / 471 lines; landed base EA `6C2E4028` / 602894 B; this relay @@RLINES@@ lines with twin 46/46 zero mismatches, ellipsis 0, P001-P046 unbroken.'
$snip = 'Snippet presence-assert (battery, case-sensitive byte-compare vs landed-base blob 3a932b9): 285 pasted EA lines, 285 match, 0 mismatches; endpoints L9607, L9779, L8770, L8776, L8777, L5442, L5498, L5305, L5306 all present; ranges L9607-L9779, L8770-L8777, L5442-L5499 pasted complete with L5305-L5306 present.'
$newBlock = @($delta, '', $n1, '', $n2, '', $n3, '', $q191)
foreach ($s in $newBlock) {
  if (([regex]::Matches($s, '[^\x00-\x7F]')).Count -ne 0) { throw 'new text non-ascii, halt' }
  if ((Cnt $s '...') -ne 0) { throw 'new text ellipsis, halt' }
}
if ((Cnt $droll '...') -ne 0) { throw 'droll ellipsis, halt' }
if ((Cnt $snip '...') -ne 0) { throw 'snip ellipsis, halt' }
$out = New-Object System.Collections.ArrayList
for ($k = 0; $k -lt $relLines.Count; $k++) {
  if ($k -eq 460) { foreach ($s in $newBlock) { [void]$out.Add($s) } }
  elseif ($k -eq 470) { [void]$out.Add($droll); [void]$out.Add($snip); [void]$out.Add($relLines[$k]) }
  else { [void]$out.Add($relLines[$k]) }
}
if ($out.Count -ne 481) { throw ('post lines ' + $out.Count) }
$joined = ($out -join ([string][char]13 + [string][char]10))
$joined = $joined.Replace('@@EAHASH@@', $eaHash)
$joined = $joined.Replace('@@EABYTES@@', [string]$eaBytes)
$joined = $joined.Replace('@@PDIG@@', $pktDig)
$joined = $joined.Replace('@@PBYTES@@', '147252')
$joined = $joined.Replace('@@V190H@@', $v190h)
$joined = $joined.Replace('@@V190B@@', '221352')
$joined = $joined.Replace('@@RLINES@@', '481')
[System.IO.File]::WriteAllText($relFile, $joined)
'WROTE bytes=' + ([System.IO.File]::ReadAllBytes($relFile).Length)
$CR13 = [string][char]13; $LF10 = [string][char]10
$norm = { param($s) $x = $s.Replace($CR13, ''); if ($x.EndsWith($LF10)) { $x = $x.Substring(0, $x.Length - 1) }; return $x }
$pa = (& $norm ([System.IO.File]::ReadAllText($pktFile))) -split $LF10
$ra = (& $norm ([System.IO.File]::ReadAllText($relFile))) -split $LF10
$rp = @()
foreach ($ln in $ra) { if ($ln -match '^P[0-9][0-9][0-9]: ') { $rp += $ln.Substring(6) } }
'twin_packet=' + $pa.Count + ' twin_relay=' + $rp.Count
$mis = 0
for ($k = 0; $k -lt 46; $k++) { if ($pa[$k] -ne $rp[$k]) { $mis++ } }
'twin_mismatches=' + $mis
$final = [System.IO.File]::ReadAllText($relFile)
'ellipsis_relay=' + (Cnt $final '...') + ' ellipsis_packet=' + (Cnt ([System.IO.File]::ReadAllText($pktFile)) '...')
'post_nonascii=' + (([regex]::Matches($final, '[^\x00-\x7F]')).Count)
'rlines=' + ([System.IO.File]::ReadAllLines($relFile)).Count
'rdigest=' + (Get-FileHash -Algorithm SHA256 -LiteralPath $relFile).Hash
'rbytes=' + (Get-Item -LiteralPath $relFile).Length
$m64 = [regex]::Matches($final, '[0-9A-Fa-f]{64}')
'distinct64=' + ((($m64 | ForEach-Object { $_.Value }) | Select-Object -Unique).Count)
foreach ($h in @('Delta applications since v190', 'N-CONSTANCY evidence', 'BUCKET evidence', 'DISCHARGED-FINDINGS evidence', 'clear PACKET_EXT1LIVE-001 v28 by name', 'Digest roll (measured in-run', 'Snippet presence-assert (battery', 'rule the RECON47 grade split')) {
  'rep[' + $h.Substring(0, [Math]::Min(34, $h.Length)) + ']=' + (Cnt $final $h)
}
'09448475_hits=' + (Cnt $final '09448475')
'ea_rehash=' + (Get-FileHash -Algorithm SHA256 -LiteralPath $eaFile).Hash
'pkt_rehash=' + (Get-FileHash -Algorithm SHA256 -LiteralPath $pktFile).Hash
