# Watch-Run.ps1 - lightweight completion watcher for a tester run (B-34 lesson, his order 2026-10-06).
# WHY: the old auto-detect polled with long Start-Sleep blocks that looked stuck and got
# aborted; the heavy wrapper (full day-log re-read every 10 s) must stay dead per the RAM
# order. This watcher reads ONLY the day-log tail (last 64 KB, UTF-16 safe) every 25 s,
# so it burns kilobytes, not gigabytes, and writes the DONE file the builder polls for.
# Usage (detached via WMI, same pattern as the launchers):
#   powershell -NoProfile -ExecutionPolicy Bypass -File "<this>" -RunName <RUN> -DayLog "<Tester\logs\YYYYMMDD.log>" -StatusPath "<RUN_STATUS.txt>" -CeilingMin 90 [-PreBytes <log byte length at launch>]
# It appends RESULT= + DONE= to the STATUS file and writes <RunName>_DONE.txt next to it,
# then exits. Timeout writes RESULT=TIMEOUT_<n>MIN.
# B-250 STALE-TAIL-MARKER defect (owned 2026-10-17): at a fresh launch the 64 KB tail can
# still hold the PREVIOUS run's completion marker, so the plain tail match fires a false
# DONE seconds in. -PreBytes floors the marker to a byte position beyond the log length at
# launch; 0 (default) keeps the old permissive behavior.
param(
  [Parameter(Mandatory=$true)][string]$RunName,
  [Parameter(Mandatory=$true)][string]$DayLog,
  [Parameter(Mandatory=$true)][string]$StatusPath,
  [int]$CeilingMin = 90,
  [int64]$PreBytes = 0
)
$ErrorActionPreference = 'Continue'
$Work = Split-Path -Parent $StatusPath
$DonePath = Join-Path $Work ($RunName + '_DONE.txt')
$startedAt = Get-Date
function Get-TailText {
  param([string]$Path, [int]$MaxBytes = 65536)
  try {
    $fs = [System.IO.File]::Open($Path, 'Open', 'Read', 'ReadWrite')
    try {
      $len = $fs.Length
      $take = 65536
      if ($len -lt $take) { $take = [int]$len }
      $fs.Seek(-$take, [System.IO.SeekOrigin]::End) | Out-Null
      $buf = New-Object byte[] $take
      $read = $fs.Read($buf, 0, $take)
      if ($read -lt 2) { return $null }
      $off = 0
      if ($buf[0] -eq 255 -and $buf[1] -eq 254) { $off = 2 }
      elseif (($read % 2) -eq 1) { $off = 1 }
      return @{ Text = [System.Text.Encoding]::Unicode.GetString($buf, $off, $read - $off); StartByte = ($len - $read + $off) }
    } finally { $fs.Close() }
  } catch { return $null }
}
while ($true) {
  Start-Sleep -Seconds 25
  $t = Get-TailText $DayLog
  if ($null -ne $t) {
    $tail = $t.Text
    $tailStartByte = $t.StartByte
    $m = [regex]::Match($tail, '(Test passed[^\r\n]*|test stopped[^\r\n]*)')
    if ($m.Success -or ($tail -match 'log file .*written' -and $tail -match 'connection closed')) {
      $markerByte = $tailStartByte + 2 * [int64]$m.Index
      if ($PreBytes -eq 0 -or ($m.Success -and $markerByte -gt $PreBytes)) {
        $result = $(if ($m.Success -and $m.Value -match 'Test passed') { 'PASSED' } else { 'STOPPED' })
        Add-Content -LiteralPath $StatusPath -Value @('RESULT=' + $result, 'DONE=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')) -Encoding UTF8
        [System.IO.File]::WriteAllLines($DonePath, @('RUN=' + $RunName, 'RESULT=' + $result, ('DONE=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'))), (New-Object System.Text.UTF8Encoding($true)))
        'WATCHER_DONE ' + $RunName + ' ' + $result
        exit 0
      }
    }
  }
  if (((Get-Date) - $startedAt).TotalMinutes -gt $CeilingMin) {
    Add-Content -LiteralPath $StatusPath -Value @('RESULT=TIMEOUT_' + $CeilingMin + 'MIN', 'DONE=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')) -Encoding UTF8
    [System.IO.File]::WriteAllLines($DonePath, @('RUN=' + $RunName, 'RESULT=TIMEOUT_' + $CeilingMin + 'MIN', ('DONE=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'))), (New-Object System.Text.UTF8Encoding($true)))
    'WATCHER_TIMEOUT ' + $RunName
    exit 5
  }
}
