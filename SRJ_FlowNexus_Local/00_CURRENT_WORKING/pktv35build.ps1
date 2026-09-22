$ErrorActionPreference = 'Stop'
$EA = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$Packet = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_EXT1LIVE-001.md'
$eaH = '9C79FC1E39CD6B9A7B49443A8F50EEE7394FB09B163208943E0415F037B918B8'
$pkH = '22475D22971B87A0040942F3D7B09C482CE33E7023A7BB3E9D9CB2FAC0CA5E0F'
function CountOf([string]$x, [string]$a) {
  if ($a.Length -eq 0) { return -1 }
  return (($x.Length - $x.Replace($a, '').Length) / $a.Length)
}
function Need($c, $want, $what) { if ($c -ne $want) { throw ('gate halt: ' + $what + ' count=' + $c + ' want=' + $want) } }
$h = (Get-FileHash -Algorithm SHA256 -LiteralPath $EA).Hash
if ($h -ne $eaH) { throw 'EA drift, halt' }
$hp = (Get-FileHash -Algorithm SHA256 -LiteralPath $Packet).Hash
if ($hp -ne $pkH) { throw 'packet drift, halt' }
$pl = [System.IO.File]::ReadAllLines($Packet)
Need $pl.Length 58 'packet lines'
$P50 = $pl[49]
$p5 = $P50.Split(@('`'), [System.StringSplitOptions]::None)
Need $p5.Length 3 'backtick parts P050'
$D1 = $p5[1]
if (-not $D1.StartsWith('         PrintFormat("[SRJ-EA] LOTDIAG')) { throw 'D1 head, halt' }
if (-not $D1.EndsWith('((lots < volMin) ? 1 : 0));')) { throw 'D1 tail, halt' }
Need (CountOf $D1 '%') 8 'D1 specifiers'
$P52 = $pl[51]
$p2 = $P52.Split(@('`'), [System.StringSplitOptions]::None)
Need $p2.Length 11 'backtick parts P052'
$D2aO = $p2[1]
$D2aN = $p2[3]
$D2bO = $p2[5]
$D2bN = $p2[7]
$D2cN = $p2[9]
if ($D2aO -ne '       if(!inWindow) return;') { throw 'D2a old, halt' }
if (-not $D2aN.StartsWith('       if(!inWindow) { if(InpDebugLog')) { throw 'D2a new head, halt' }
if (-not $D2aN.EndsWith('return; }')) { throw 'D2a new tail, halt' }
if ($D2bO -ne '        if(!DetectPoiRetest(barShift, pr) || !pr.found) return;') { throw 'D2b old, halt' }
if (-not $D2bN.Contains('branch=RETEST')) { throw 'D2b new, halt' }
if (-not $D2cN.StartsWith('         if(InpDebugLog')) { throw 'D2c head, halt' }
if (-not $D2cN.Contains('branch=SESSION')) { throw 'D2c branch, halt' }
$et = [System.IO.File]::ReadAllText($EA)
if (-not $et.Contains("`r`n")) { throw 'EA not CRLF, halt' }
Need (CountOf $et 'LOTDIAG') 0 'pre-existing LOTDIAG'
Need (CountOf $et 'SEEDDIAG') 0 'pre-existing SEEDDIAG'
$EOL = "`r`n"
$aD1 = '         lots = MathFloor(lots / volStep) * volStep;' + $EOL + '         if(lots < volMin)'
Need (CountOf $et $aD1) 1 'D1 anchor'
$aD2a = '       if(!inWindow) return;'
Need (CountOf $et $aD2a) 1 'D2a anchor'
$aD2b = '        if(!DetectPoiRetest(barShift, pr) || !pr.found) return;'
Need (CountOf $et $aD2b) 1 'D2b anchor'
$sp24 = (' ' * 24)
$sp11 = (' ' * 11)
$sp9 = (' ' * 9)
$sp8 = (' ' * 8)
$aD2c = $sp24 + 'SessionName(sess));' + $EOL + $sp11 + '}' + $EOL + $sp9 + 'return;' + $EOL + $sp8 + '}'
Need (CountOf $et $aD2c) 1 'D2c anchor'
$et = $et.Replace($aD1, ('         lots = MathFloor(lots / volStep) * volStep;' + "`n" + $D1 + $EOL + '         if(lots < volMin)'))
$et = $et.Replace($aD2a, $D2aN)
$et = $et.Replace($aD2b, $D2bN)
$et = $et.Replace($aD2c, ($sp24 + 'SessionName(sess));' + $EOL + $sp11 + '}' + $EOL + $D2cN + $EOL + $sp9 + 'return;' + $EOL + $sp8 + '}'))
Need (CountOf $et 'LOTDIAG bar=') 1 'post D1'
Need (CountOf $et 'branch=WINDOW') 1 'post D2a'
Need (CountOf $et 'branch=RETEST') 1 'post D2b'
Need (CountOf $et 'branch=SESSION') 1 'post D2c'
Need (CountOf $et '       if(!inWindow) return;') 0 'old D2a gone'
Need (CountOf $et '|| !pr.found) return;') 0 'old D2b gone'
Need (CountOf $et 'InpDebugLog') 168 'post census 168'
[System.IO.File]::WriteAllText($EA, $et)
$raw = [System.IO.File]::ReadAllBytes($EA)
$cr = 0
foreach ($b in $raw) { if ($b -eq 13) { $cr++ } }
$lf = 0
foreach ($b in $raw) { if ($b -eq 10) { $lf++ } }
'WROTE bytes=' + $raw.Length
'CR=' + $cr + ' LF=' + $lf
'post hash=' + (Get-FileHash -Algorithm SHA256 -LiteralPath $EA).Hash
