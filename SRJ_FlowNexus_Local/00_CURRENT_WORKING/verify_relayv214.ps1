# verify_relayv214.ps1 - battery for BUILDER_RELAY_COUNCIL_v214 (read-only, console assertions only)
$ErrorActionPreference = 'Stop'
$base = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$relayPath = Join-Path $base 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v214-EXITMODEL2-CLEAR1.md'
$pktPath = Join-Path $base 'SRJ_FlowNexus_Local\01_TASKS\PACKET_P-EXITMODEL-2.md'
$eaPath = Join-Path $base 'Experts\SRJ_FlowNexus_EA.mq5'
$segPath = Join-Path $base 'SRJ_FlowNexus_Local\06_HANDOFFS\RECON51-EXITGATE-V1_JOURNAL.log'
function NormLines([string[]]$a) {
  $b = @($a | ForEach-Object { $_ -replace "`r", '' })
  if ($b.Count -gt 0 -and $b[$b.Count - 1] -eq '') { $b = $b[0..($b.Count - 2)] }
  return $b
}
$relay = NormLines([IO.File]::ReadAllLines($relayPath))
$pkt = NormLines([IO.File]::ReadAllLines($pktPath))
$ea = NormLines([IO.File]::ReadAllLines($eaPath))
$fail = 0
# 1. Twin: P01-P48 bodies vs packet lines
$prows = @($relay | Where-Object { $_ -match '^P\d\d \(= packet L\d+, whole\): ?' })
Write-Output ('TWIN-COUNT prow={0} pkt={1}' -f $prows.Count, $pkt.Count)
if ($prows.Count -ne 48 -or $pkt.Count -ne 48) { Write-Output 'TWIN-COUNT FAIL'; $fail++ } else { Write-Output 'TWIN-COUNT PASS' }
$seq = @($prows | ForEach-Object { [int]([regex]::Match($_, '^P(\d\d)').Groups[1].Value) })
$exp = 1..48
if ((Compare-Object $seq $exp).Count -eq 0) { Write-Output 'PSEQ PASS' } else { Write-Output 'PSEQ FAIL'; $fail++ }
$tm = 0
for ($i = 0; $i -lt 48; $i++) {
  $tag = 'P{0:d2}' -f ($i + 1)
  $row = @($prows | Where-Object { $_.StartsWith($tag + ' ') })[0]
  if ($null -eq $row) { Write-Output ('TWIN {0} MISSING' -f $tag); $tm++; continue }
  $ln = [int]([regex]::Match($row, 'packet L(\d+)').Groups[1].Value)
  $t = $row.Substring($row.IndexOf('whole):') + 7); if ($t.StartsWith(' ')) { $t = $t.Substring(1) }; $body = $t
  if ($ln -ne ($i + 1)) { Write-Output ('TWIN {0} LABEL-L{1} FAIL' -f $tag, $ln); $tm++; continue }
  if ($body -cne $pkt[$i]) { Write-Output ('TWIN {0} BODY-MISMATCH plen={1} rlen={2}' -f $tag, $pkt[$i].Length, $body.Length); $tm++ }
}
if ($tm -eq 0) { Write-Output 'TWIN-BODIES PASS 48/48' } else { Write-Output ('TWIN-BODIES FAIL miss={0}' -f $tm); $fail++ }
# 2. Ellipsis + non-ASCII in relay
$ell = @(Select-String -LiteralPath $relayPath -Pattern '\.\.\.').Count
$nas = @(Select-String -LiteralPath $relayPath -Pattern '[^\x00-\x7F]').Count
Write-Output ('ELLIPSIS={0} NONASCII={1}' -f $ell, $nas)
if ($ell -eq 0 -and $nas -eq 0) { Write-Output 'TEXT-HYGIENE PASS' } else { Write-Output 'TEXT-HYGIENE FAIL'; $fail++ }
# 3. Region byte-diffs relay-vs-EA
$regions = @(
  @('R-F1OLD', 2321, 2359), @('R-F2OLD', 129, 132), @('R-F3ENUM', 151, 161),
  @('R-F3NAME', 259, 272), @('R-VDECL', 11087, 11090), @('R-HDR', 11030, 11032),
  @('R-HTF', 11165, 11187), @('R-RET', 11202, 11210), @('R-DAYDEF', 10330, 10342)
)
foreach ($r in $regions) {
  $bMark = '[[' + $r[0] + '-B]]'; $eMark = '[[' + $r[0] + '-E]]'
  $bi = -1; $ei = -1
  for ($k = 0; $k -lt $relay.Count; $k++) {
    if ($relay[$k] -ceq $bMark) { $bi = $k }
    if ($relay[$k] -ceq $eMark) { $ei = $k }
  }
  if ($bi -lt 0 -or $ei -lt 0 -or $ei -le $bi) { Write-Output ('REGION {0} MARKER-FAIL' -f $r[0]); $fail++; continue }
  $rbody = @($relay[($bi + 1)..($ei - 1)])
  $ebody = @($ea[([int]$r[1] - 1)..([int]$r[2] - 1)])
  $d = @(Compare-Object $rbody $ebody -CaseSensitive)
  if ($d.Count -eq 0 -and $rbody.Count -eq $ebody.Count) { Write-Output ('REGION {0} PASS n={1}' -f $r[0], $rbody.Count) }
  else { Write-Output ('REGION {0} FAIL rlines={1} elines={2} diff={3}' -f $r[0], $rbody.Count, $ebody.Count, $d.Count); $fail++ }
}
# 4. J-rows present in segment
$segRaw = [IO.File]::ReadAllText($segPath).Replace("`r", '')
$jrows = @($relay | Where-Object { $_ -match '^J\d\d \S' })
Write-Output ('JROW-COUNT={0}' -f $jrows.Count)
$jm = 0
foreach ($j in $jrows) {
  $tail = $j.Substring($j.IndexOf('[SRJ-EA]'))
  if ($segRaw.Contains($tail)) { $jm++ } else { Write-Output ('JROW MISSING: {0}' -f $j.Substring(0, 3)); }
}
if ($jm -eq $jrows.Count -and $jrows.Count -eq 10) { Write-Output 'JROWS PASS 10/10' } else { Write-Output ('JROWS FAIL hit={0}' -f $jm); $fail++ }
# 5. Fresh digests
$rh = (Get-FileHash -LiteralPath $relayPath -Algorithm SHA256).Hash
$rl = (Get-Item -LiteralPath $relayPath).Length
Write-Output ('RELAY-HASH={0} BYTES={1} LINES={2}' -f $rh, $rl, $relay.Count)
Write-Output ('BATTERY-FAILURES={0}' -f $fail)
