$ErrorActionPreference = 'Stop'
$work = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5'
$relFile = Join-Path $work 'SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_RELAY_COUNCIL_v191-EXT1LIVE-RECLEAR27.md'
$blob = @(git --no-pager -C $work show '3a932b9:Experts/SRJ_FlowNexus_EA.mq5')
Write-Output ('blob_lines=' + $blob.Count)
Write-Output ('blob_L9661=' + $blob[9660].Trim())
Write-Output ('blob_L57=' + $blob[56].Trim())
$relLines = [System.IO.File]::ReadAllLines($relFile)
$tot = 0; $hit = 0; $miss = @()
$nums = @()
foreach ($ln in $relLines) {
  if ($ln -match '^EA L([0-9]+): (.*)$') {
    $n = [int]$Matches[1]
    $code = $Matches[2]
    $tot++
    $nums += $n
    if ($n -ge 1 -and $n -le $blob.Count -and $blob[$n - 1] -ceq $code) { $hit++ }
    else {
      if ($miss.Count -lt 8) {
        $exp = ''
        if ($n -ge 1 -and $n -le $blob.Count) { $exp = $blob[$n - 1] }
        if ($exp.Length -gt 120) { $exp = $exp.Substring(0, 120) }
        $got = $code
        if ($got.Length -gt 120) { $got = $got.Substring(0, 120) }
        $miss += ('L' + $n + ' exp=[' + $exp + '] got=[' + $got + ']')
      }
    }
  }
}
Write-Output ('snippet_total=' + $tot + ' match=' + $hit + ' miss=' + ($tot - $hit))
foreach ($m in $miss) { Write-Output $m }
$nums = @($nums | Sort-Object -Unique)
Write-Output ('ea_first=' + $nums[0] + ' ea_last=' + $nums[$nums.Count - 1] + ' ea_distinct=' + $nums.Count)
$runs = @()
$rs = $nums[0]; $pr = $nums[0]
for ($k = 1; $k -lt $nums.Count; $k++) {
  if ($nums[$k] -ne ($pr + 1)) { $runs += ($rs.ToString() + '-' + $pr.ToString()); $rs = $nums[$k] }
  $pr = $nums[$k]
}
$runs += ($rs.ToString() + '-' + $pr.ToString())
Write-Output ('runs=' + ($runs -join ' | '))
foreach ($e in @(9607, 9779, 8770, 8776, 8777, 5442, 5498, 5305, 5306)) {
  Write-Output ('endpoint L' + $e + '=' + ($nums -contains $e))
}
