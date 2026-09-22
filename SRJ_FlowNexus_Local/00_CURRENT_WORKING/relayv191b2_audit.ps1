$ErrorActionPreference = 'Stop'
$dirH = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$relFile = Join-Path $dirH 'BUILDER_RELAY_COUNCIL_v191-EXT1LIVE-RECLEAR27.md'
$relLines = [System.IO.File]::ReadAllLines($relFile)
Write-Output '---tail-459-471-first220---'
for ($k = 458; $k -lt $relLines.Count; $k++) {
  $ln = $relLines[$k]
  if ($ln.Length -gt 220) { $ln = $ln.Substring(0, 220) }
  $num = [string]($k + 1)
  Write-Output ($num + ' :: ' + $ln)
}
Write-Output '---leftover-ctx-line21---'
$ln21 = $relLines[20]
Write-Output ('len=' + $ln21.Length)
$i1 = $ln21.IndexOf('single-line')
Write-Output ($ln21.Substring([Math]::Max(0, ($i1 - 200)), 500))
$relText = [System.IO.File]::ReadAllText($relFile)
Write-Output '---full-64hex---'
$m64 = [regex]::Matches($relText, '[0-9A-Fa-f]{64}')
Write-Output ('full64_count=' + $m64.Count)
foreach ($m in $m64) { Write-Output ($m.Value.Substring(0, 12) + '...') }
