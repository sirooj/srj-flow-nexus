$ErrorActionPreference = 'Stop'
$Packet = 'PACKET_EXT1LIVE-001.md'
$Bak = 'PACKET_V21_FROZEN.bak'
$h = (Get-FileHash -Algorithm SHA256 -LiteralPath $Packet).Hash
if ($h -ne 'ECE0A00883A530E0EED0F5B4F3A97B75AE8A39EA7D85CDD61FFBF7BC5461100A') { throw 'not v21 state, halt' }
if (Test-Path -LiteralPath $Bak) {
  $hb = (Get-FileHash -Algorithm SHA256 -LiteralPath $Bak).Hash
  if ($hb -ne 'ECE0A00883A530E0EED0F5B4F3A97B75AE8A39EA7D85CDD61FFBF7BC5461100A') { throw 'backup not v21, halt' }
} else {
  Copy-Item -LiteralPath $Packet -Destination $Bak
}
$t = [System.IO.File]::ReadAllText($Packet)
function CountOf([string]$x, [string]$a) {
  if ($a.Length -eq 0) { return -1 }
  return (($x.Length - $x.Replace($a, '').Length) / $a.Length)
}
$must = @(
  @('double probe_rLiveV = -1e308; double probe_extRnd = 0.0;',
    'double probe_rLiveV = -1e308; double probe_extRnd = 0.0; double probe_extDifD = 0.0;'),
  @('else { if(g_dir == DIR_LONG) probe_extDistD = ((currentPrice - g_sl41_px) / _Point); else probe_extDistD = ((g_sl41_px - currentPrice) / _Point); probe_extRnd = MathRound(probe_extDistD); if(!MathIsValidNumber(probe_extRnd) || MathAbs(probe_extRnd) > 99999.0) probe_vals[26] = "INVALID"; else probe_vals[26] = DoubleToString(probe_extRnd, 0); }',
    'else { if(g_dir == DIR_LONG) probe_extDifD = (currentPrice - g_sl41_px); else probe_extDifD = (g_sl41_px - currentPrice); if(!MathIsValidNumber(probe_extDifD)) probe_vals[26] = "INVALID"; else { probe_extDistD = (probe_extDifD / _Point); if(!MathIsValidNumber(probe_extDistD)) probe_vals[26] = "INVALID"; else { probe_extRnd = MathRound(probe_extDistD); if(!MathIsValidNumber(probe_extRnd) || MathAbs(probe_extRnd) > 99999.0) probe_vals[26] = "INVALID"; else probe_vals[26] = DoubleToString(probe_extRnd, 0); } } }'),
  @('double probe_rLiveV (live quotient result, validated before formatting); double probe_extRnd (rounded displacement, range-tested after rounding);',
    'double probe_rLiveV (live quotient result, validated before formatting); double probe_extRnd (rounded displacement, range-tested after rounding); double probe_extDifD (signed pre-division displacement, checked before dividing);'),
  @('(3a) populate the key array',
    '(3b) populate the value array with the constant-only "?" prefill (initialization, exempt from the ordering restriction below); (3a) populate the key array'),
  @('(5) shadow computation populating the named numeric/Boolean temporaries',
    '(5) common serialization including probe_rLiveV plus branch-local shadow computation populating the named numeric/Boolean temporaries'),
  @('reservation-in-branch, THEN key array',
    'reservation-in-branch, THEN constant-only prefill (initialization only), THEN key array'),
  @('THEN shadow computation plus value array, THEN NORMAL-from-pairs',
    'THEN common serialization plus branch-local shadow computation interleaved with branch value stores, THEN NORMAL-from-pairs'),
  @('values never evaluated before the authorized arithmetic phase',
    'no value position is stored before its own operand is computed (constant-only prefill excepted)'),
  @('used four times with interleaved encode-store per step 5b',
    'used five times: four NORMAL-path encode-stores per step 5b plus the BSAVE_FAIL barTime encode'),
  @('prints on EVERY record including undefined rows',
    'prints on every NORMAL record including undefined rows'),
  @('separation interval (0.678082, 1.384615) graded by the P042 exact-rational rule',
    'separation interval (0.678082, 1.384615] graded by the P042 exact-rational rule'),
  @('the archive SLIMBR rExt1=7.30 for A2 is provenance context only',
    'the archive SIDE1E r1=7.30 for A2 (SLIMBR-carried value) is provenance context only'),
  @('key structure 416 (keys 340, the sum of the 38 SCHEMA key spellings + 38 separators + 37 spaces + 1 envelope space',
    'key structure 416 (= key spellings 340 + 38 separators + 38 spaces: 37 inter-field + 1 envelope'),
  @('failed intermediate checks after availability is established (non-finite subtraction, non-finite point quotient, out-of-range rounding)',
    'failed intermediate checks after availability is established (non-finite subtraction, non-finite point quotient, out-of-range rounding); unavailable _Point (non-finite or non-positive) authorizes a third - cause on extDistPts with extSideOk unaffected'),
  @('extSideOk keeps the 0/1/- domain and wouldAdopt_monotone keeps 0/1 - neither ever serializes as INVALID',
    'extSideOk keeps the 0/1/- domain and wouldAdopt_monotone keeps 0/1 - neither ever serializes as INVALID (disambiguation: DIR_NONE rows join dir=0 as instrument failure; shadowOk-false rows join pxExt1 INVALID as unavailable counterfactual)'),
  @('plus slRef and tpTarget write-censuses over L8779 to L9626/L9669',
    'plus slRef and tpTarget write-censuses over L8779 to L9626/L9669 plus origin-quadruple (g_sl41_oPx/_oBT/_oSite/_oStamp, EA L1108-11) and ext1-tuple (g_sl41_def/_px/_slot/_bt/_imb, EA L1112-17) write-censuses whole-file alongside'),
  @('the micro-check line is sized poison-inclusive so the falsifier survives transport',
    'the micro-check line is sized 1056 poison-inclusive so the falsifier survives transport'),
  @('the micro-check synthetic line is built from the filed maxima ledger',
    'the micro-check synthetic line is built 1056 from the filed maxima ledger'),
  @('printed independently BEFORE any invalid/zero-denominator handling',
    'printed independently of ratio-field guard state, still INVALID on its own finite-check failure'),
  @('allow-listed as exactly Print, PrintFormat',
    'allow-listed as Print, PrintFormat (superset; PrintFormat unused in the hunks)'),
  @('holds single authoritative status as a conservative bound over the specified field domains',
    'holds single authoritative status as a conservative bound over the specified field domains (coupled: a domain violation in ext1Defined or ladOriginSite can exceed the filed ceiling, so ceiling proof and domain halt stand or fall together)'),
  @('if the compiler flags anything at the hunks, the design choice fails this gate and halts with the compiler output filed)',
    'if the compiler flags anything at the hunks, the design choice fails this gate and halts with the compiler output filed (known gate risk filed here: the empty if(probe_capped || probe_dead) { } guard relies on no empty-block diagnostic; pre-decided disposition is file-the-output-and-halt, never post-clearance text touch)'),
  @('channel (i) is not an N-2 consequence',
    'channel (i) is not an N-2 consequence (hardest-load point: s1slot=-1-with-defined-ext1 rows widen only if producer rung 0 equals selector s0 - inside channel (ii) as written)'),
  @('rejection at build if any enumerated string violates it',
    'rejection (at build for literals; run-time source/domain binding plus offline parser rejection for runtime-sourced strings) if any enumerated string violates it'),
  @('identical shape on all four types',
    'common envelope shape on all four types'),
  @('always available)',
    'never strikable; a non-finite currentPrice prints INVALID as a live-input failure)'),
  @('(must parse to 1.0 and byte-equal StringFormat("%.17g", InpMinRewardRisk)',
    '(must equal numeric 1.0 and byte-equal StringFormat("%.17g", InpMinRewardRisk)'),
  @('all four non-fire rows sit far from 1.0',
    'all four non-fire rows sit outside the exact grading boundary'),
  @('eight successful-branch numeric/Boolean temps (double probe_slDistExt1 + double probe_rExt1v + bool probe_shadowOk + bool probe_wouldGateV + double probe_extDistD + int probe_extSideI + double probe_rLiveV + double probe_extRnd,',
    'nine successful-branch numeric/Boolean temps (double probe_slDistExt1 + double probe_rExt1v + bool probe_shadowOk + bool probe_wouldGateV + double probe_extDistD + int probe_extSideI + double probe_rLiveV + double probe_extRnd + double probe_extDifD,'),
  @('cleared solely against received review material (Luna-v183, Astra-v183, Opus-v183); no known-requested sliver stays unfolded',
    'cleared solely against received review material (Luna-v184, Astra-v184, Opus-v184); no known-requested sliver stays unfolded'),
  @('stays unfolded. Supersedes v20 (withdrawn:',
    'stays unfolded. Supersedes v21 (withdrawn: post-round-only range test (staged A1); prefill unplaced (3b); EVERY-record overstatement (NORMAL-scoped); open-open interval (half-closed)) + v20 (withdrawn:')
)
foreach ($pair in $must) {
  $c = CountOf $t $pair[0]
  if ($c -ne 1) { throw ('anchor count ' + $c + ' expected 1: ' + $pair[0].Substring(0, [Math]::Min(70, $pair[0].Length))) }
  $t = $t.Replace($pair[0], $pair[1])
}
$nl = $t.IndexOf("`n")
$first = $t.Substring(0, $nl).TrimEnd("`r")
if (-not $first.StartsWith('# PACKET_EXT1LIVE-001 v21')) { throw 'title moved, halt' }
$newTitle = '# PACKET_EXT1LIVE-001 v22 - live the ext1 stop (print-only probe; v22 folds Luna-v184 wording + Astra-v184-A1-A3/B1 (staged calc, prefill order, NORMAL-scope, interval spelling) + Opus-v184-F-1-F-16 prose (order renumber, census labels, precedence, censuses, figures, notes) with repair-in-place per operator word (Opus B-1/B-2/B-3/B-4 carried for council disposal, not folded): dir domain {1,-1}; 38-row 1024/1056 ledger; complete templates; corroboration join; strategy-pure census; 38-field payload + fixed envelope; code untouched)'
$t = $newTitle + $t.Substring($nl)
$c = CountOf $t 'PACKET_EXT1LIVE-001-v21'
'v21pktcount=' + $c
$t = $t.Replace('PACKET_EXT1LIVE-001-v21', 'PACKET_EXT1LIVE-001-v22')
[System.IO.File]::WriteAllText($Packet, $t)
'WROTE bytes=' + ([System.IO.File]::ReadAllBytes($Packet).Length)
'difD=' + (CountOf $t 'probe_extDifD')
'step3b=' + (CountOf $t '(3b)')
'ninetherm=' + (CountOf $t 'nine successful-branch')
