$ErrorActionPreference = 'Stop'
$P = 'PACKET_EXT1LIVE-001.md'
$B = 'PACKET_V20_FROZEN.bak'
$hp = (Get-FileHash -Algorithm SHA256 -LiteralPath $P).Hash
if (Test-Path -LiteralPath $B) {
  $hb = (Get-FileHash -Algorithm SHA256 -LiteralPath $B).Hash
  if ($hb -ne $hp) { throw 'backup hash differs, halt' }
  if ($hp -ne '9C64CCE27BF2A1F9356F4ED450ABBEF8E5D415D34DA924A7EE9C1F7546065E00') { throw 'packet already modified, halt' }
} else {
  Copy-Item -LiteralPath $P -Destination $B
}
$t = [System.IO.File]::ReadAllText($P)
function CountOf([string]$x, [string]$a) {
  if ($a.Length -eq 0) { return -1 }
  return (($x.Length - $x.Replace($a, '').Length) / $a.Length)
}
$must = @(
  @('else probe_vals[28] = StringFormat("%.17g", slDist); } probe_vals[14] = <<VETO_SYM>>; probe_vals[15] = <<SESSION_SYM>>; if(g_sl41_def == 1) {',
    'else probe_vals[28] = StringFormat("%.17g", slDist); probe_vals[14] = "-"; probe_vals[15] = "-"; if(g_sl41_def == 1) {'),
  @('probe_vals[24] = g_sl41_oSite;',
    'probe_vals[24] = g_sl41_oSite; probe_tmpA = TimeToString(g_sl41_oStamp, TIME_DATE|TIME_MINUTES); StringReplace(probe_tmpA, " ", "-"); probe_vals[37] = probe_tmpA;'),
  @('double probe_extDistD = 0.0; int probe_extSideI = -2147483647;',
    'double probe_extDistD = 0.0; int probe_extSideI = -2147483647; double probe_rLiveV = -1e308; double probe_extRnd = 0.0;'),
  @('if(!MathIsValidNumber(slDist) || !MathIsValidNumber(tpDist)) probe_vals[10] = "INVALID"; else { if(slDist > 0.0) probe_vals[10] = StringFormat("%.17g", tpDist / slDist); else probe_vals[10] = "-"; }',
    'if(!MathIsValidNumber(slDist) || !MathIsValidNumber(tpDist)) probe_vals[10] = "INVALID"; else { if(slDist > 0.0) probe_rLiveV = tpDist / slDist; if(slDist > 0.0 && MathIsValidNumber(probe_rLiveV)) probe_vals[10] = StringFormat("%.17g", probe_rLiveV); else if(slDist > 0.0) probe_vals[10] = "INVALID"; else probe_vals[10] = "-"; }'),
  @('if(!probe_shadowOk || !MathIsValidNumber(tpDist)) probe_vals[11] = "INVALID"; else { if(probe_slDistExt1 > 0.0) probe_vals[11] = StringFormat("%.17g", probe_rExt1v); else probe_vals[11] = "-"; }',
    'if(!probe_shadowOk || !MathIsValidNumber(tpDist) || !MathIsValidNumber(probe_slDistExt1) || !MathIsValidNumber(probe_rExt1v)) probe_vals[11] = "INVALID"; else { if(probe_slDistExt1 > 0.0) probe_vals[11] = StringFormat("%.17g", probe_rExt1v); else probe_vals[11] = "-"; }'),
  @('if(!probe_shadowOk) probe_vals[30] = "INVALID"; else probe_vals[30] = StringFormat("%.17g", probe_slDistExt1);',
    'if(!probe_shadowOk || !MathIsValidNumber(probe_slDistExt1)) probe_vals[30] = "INVALID"; else probe_vals[30] = StringFormat("%.17g", probe_slDistExt1);'),
  @('if(probe_shadowOk && (probe_sel == 0 || probe_sel == 1) && MathIsValidNumber(probe_slLive)',
    'if(probe_shadowOk && (g_dir == DIR_LONG || g_dir == DIR_SHORT) && (probe_sel == 0 || probe_sel == 1) && MathIsValidNumber(probe_slLive)'),
  @('entryPx:NUM:24:%.17g; tpPx:NUM:24:%.17g; incomingSlRef:NUM:24:%.17g;',
    'entryPx:NUM:24:%.17g/INVALID; tpPx:NUM:24:%.17g/INVALID; incomingSlRef:NUM:24:%.17g/INVALID;'),
  @('slLive:NUM:24:%.17g; pxExt1:NUM:24:--undef;',
    'slLive:NUM:24:%.17g/INVALID; pxExt1:NUM:24:--undef/INVALID;'),
  @('ladOriginPx:NUM:24:%.17g;',
    'ladOriginPx:NUM:24:%.17g/INVALID;'),
  @('rawNumLive:NUM:24:%.17g; rawDenLive:NUM:24:%.17g; rawNumExt1:NUM:24:%.17g; rawDenExt1:NUM:24:%.17g;',
    'rawNumLive:NUM:24:%.17g/INVALID; rawDenLive:NUM:24:%.17g/INVALID; rawNumExt1:NUM:24:%.17g/INVALID; rawDenExt1:NUM:24:%.17g/INVALID;'),
  @('currentPrice:NUM:24:%.17g; s0px:NUM:24:0-with-slot--1; s1px:NUM:24:0-with-slot--1;',
    'currentPrice:NUM:24:%.17g/INVALID; s0px:NUM:24:0-with-slot--1/INVALID; s1px:NUM:24:0-with-slot--1/INVALID;'),
  @('gateConst:NUM:24:anticipated-1;',
    'gateConst:NUM:24:anticipated-1/INVALID;'),
  @('strike substitution is spelled once here: a struck veto field reads probe_vals[14] = - and a struck session field reads probe_vals[15] = - (grading-side substitution applied by the grader, never probe code)',
    'strike substitution is spelled once here: the base literal carries probe_vals[14] = "-"; and probe_vals[15] = "-"; inside the success arm, and the STAGE-1 addendum hunk overwrites those two statements with the named landed-symbol bindings; a strike is deletion of the addendum (no grading-side code substitution, never probe code)'),
  @('six successful-branch numeric/Boolean temps (double probe_slDistExt1 + double probe_rExt1v + bool probe_shadowOk + bool probe_wouldGateV + double probe_extDistD + int probe_extSideI, initialized at declaration, populated only in the successful branch at P032 step 5)',
    'eight successful-branch numeric/Boolean temps (double probe_slDistExt1 + double probe_rExt1v + bool probe_shadowOk + bool probe_wouldGateV + double probe_extDistD + int probe_extSideI + double probe_rLiveV + double probe_extRnd, initialized at declaration, populated only in the successful branch at P032 step 5)')
)
foreach ($pair in $must) {
  $c = CountOf $t $pair[0]
  if ($c -ne 1) { throw ('anchor count ' + $c + ' expected 1: ' + $pair[0].Substring(0, [Math]::Min(80, $pair[0].Length))) }
  $t = $t.Replace($pair[0], $pair[1])
}
$c = CountOf $t 'PRE-RESOLVED confirmed'
if ($c -ne 3) { throw ('PRE-RESOLVED count ' + $c + ' expected 3') }
$t = $t.Replace('PRE-RESOLVED confirmed', 'archive-confirmed at display precision; new-run checks remain mandatory')
$c = CountOf $t '+7 +7 +9 +9'
if ($c -ne 1) { throw 'poison order anchor miss' }
$t = $t.Replace('+7 +7 +9 +9', '+7 +9 +7 +9')
$c = CountOf $t 'PACKET_EXT1LIVE-001-v20'
'v20pktcount=' + $c
$t = $t.Replace('PACKET_EXT1LIVE-001-v20', 'PACKET_EXT1LIVE-001-v21')
[System.IO.File]::WriteAllText($P, $t)
'WROTE bytes=' + ([System.IO.File]::ReadAllBytes($P).Length)
'probe_vals37=' + (CountOf $t 'probe_vals[37]')
'vetosym=' + (CountOf $t '<<VETO_SYM>>')
'stampstore=' + (CountOf $t 'probe_vals[37] = probe_tmpA;')
