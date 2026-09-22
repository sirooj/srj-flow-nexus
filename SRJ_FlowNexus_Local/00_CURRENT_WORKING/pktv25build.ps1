$ErrorActionPreference = 'Stop'
$EA = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\Experts\SRJ_FlowNexus_EA.mq5'
$Packet = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\01_TASKS\PACKET_EXT1LIVE-001.md'
$eaH = '6C2E402846DB0BFBCDABD40AC2D08BEE7A59D0F92BBD2E9F9D2B8DAC817BCC07'
$pkH = 'DDD82BC1BFC6BB54D114C3CAF6A54A1E80D82F69A7D14F2D390845B72ACCD021'
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
Need $pl.Length 46 'packet lines'
$L32 = $pl[31]
$parts = $L32.Split(@('`'), [System.StringSplitOptions]::None)
Need $parts.Length 33 'backtick parts L32'
$A = $parts[1]
Need $A.Length 288 'insertion A length'
if (-not $A.StartsWith('double probe_inSlRef = slRef;')) { throw 'A head, halt' }
if (-not $A.EndsWith('bool probe_bSaved = false;')) { throw 'A tail, halt' }
$B = $parts[3]
Need $B.Length 213 'insertion B length'
if (-not $B.StartsWith('probe_sel = s1x_sel;')) { throw 'B head, halt' }
if (-not $B.EndsWith('probe_bSaved = true;')) { throw 'B tail, halt' }
$C = $parts[25]
Need $C.Length 8962 'insertion C length'
if (-not $C.StartsWith('static uint probe_seq = 0;')) { throw 'C head, halt' }
if (-not $C.EndsWith('Print(probe_line); }')) { throw 'C tail, halt' }
function AssignCount([string]$x, [string]$arr) {
  $s = 0
  for ($n = 0; $n -le 37; $n++) {
    $a = $arr + '[' + $n + '] ='
    $b = $arr + '[' + $n + ']='
    $s += (CountOf $x $a) + (CountOf $x $b)
  }
  return $s
}
Need (AssignCount $C 'probe_keys') 38 'C key assigns'
Need (AssignCount $C 'probe_vals') 78 'C value assigns'
Need (CountOf $C 'probe_vals[probe_j] =') 1 'C prefill'
Need (CountOf $C 'probe_vals[14] = "-";') 1 'C strike 14'
Need (CountOf $C 'probe_vals[15] = "-";') 1 'C strike 15'
Need (CountOf $C 'PACKET_EXT1LIVE-001-v25') 4 'C envelope tokens'
Need (CountOf $C 'probe_vals[37]') 1 'C stamp store'
$et = [System.IO.File]::ReadAllText($EA)
if (-not $et.Contains("`r`n")) { throw 'EA not CRLF, halt' }
Need (CountOf $et 'probe_') 0 'pre-existing probe_'
$EOL = "`r`n"
$aA = "`n       //--- [S1-LIVE-STOPFIX-001] LIVE REWIRE (Luna V112-AMENDED-STOPFIX-001,"
Need (CountOf $et $aA) 1 'A anchor'
$aB = 'else if(s1x_sel == 1) slRef = s1x_s1px;' + "`r`n" + '        }'
Need (CountOf $et $aB) 1 'B anchor'
$aC = 'bool tpOk = (slDist > 0.0 && (tpDist / slDist) >= InpMinRewardRisk);' + $EOL + '       //--- [S1-CONDSTOP-SHADOW-001]'
Need (CountOf $et $aC) 1 'C anchor'
$et = $et.Replace($aA, ("`n       " + $A + $aA))
$et = $et.Replace($aB, ('else if(s1x_sel == 1) slRef = s1x_s1px;' + "`r`n" + '         ' + $B + "`r`n" + '        }'))
$et = $et.Replace($aC, ('bool tpOk = (slDist > 0.0 && (tpDist / slDist) >= InpMinRewardRisk);' + $EOL + '       ' + $C + $EOL + '       //--- [S1-CONDSTOP-SHADOW-001]'))
[System.IO.File]::WriteAllText($EA, $et)
'WROTE bytes=' + ([System.IO.File]::ReadAllBytes($EA).Length)
'post probe_ total=' + (CountOf $et 'probe_')
'post keys=' + (CountOf $et 'probe_keys[') + ' vals=' + (CountOf $et 'probe_vals[')
'post env25=' + (CountOf $et 'PACKET_EXT1LIVE-001-v25')
'ADDENDUM: both snapshots STRIKE - retained frozen "-" stores at probe_vals[14]/[15]; no hunk (L34 strike rule plus v25 A5 fallback plus Astra-v187-B2); record search found field names only, EA has zero vetoStateAtSite/sessionUseAtSite symbols.'
