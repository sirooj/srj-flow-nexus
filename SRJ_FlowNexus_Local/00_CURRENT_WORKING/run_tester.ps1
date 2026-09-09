# run_tester.ps1 - the SRJ headless tester harness (operator-directed 2026-09-09).
# Launches terminal64 /config DETACHED, waits on the REAL process handle (no journal-growth
# guessing), archives the journal segment to 06_HANDOFFS, and writes
# 00_CURRENT_WORKING\<RunName>_STATUS.txt THE MOMENT THE RUN ENDS - that file is the
# completion instrument. The builder polls ONLY for the STATUS file with cheap sub-second
# commands; never again with long sleep loops.
# Builder protocol: (1) close any live terminal64 first WITH THE OPERATOR'S AUTHORIZATION
# (this script NEVER kills a terminal - if one is running it exits with TERMINAL_BUSY=true);
# (2) delete any stale <RunName>_STATUS.txt; (3) launch detached:
#   Start-Process powershell -WindowStyle Hidden -ArgumentList '-NoProfile','-ExecutionPolicy',
#     'Bypass','-File','<this path>','-RunName','T161X','-IniPath','<abs ini path>'
# (4) poll Test-Path <RunName>_STATUS.txt; (5) read it - the gate lines are already inside.
param(
  [Parameter(Mandatory=$true)][string]$RunName,
  [Parameter(Mandatory=$true)][string]$IniPath
)
$ErrorActionPreference = 'Continue'
$Root = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06'
$Hand = Join-Path $Root 'MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$Work = Join-Path $Root 'MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Term = 'C:\Program Files\Dukascopy MetaTrader 5\terminal64.exe'
$Tlog = Join-Path $Root ('Tester\logs\' + (Get-Date -Format 'yyyyMMdd') + '.log')
# NOTE: a run crossing midnight splits the journal across two dated files; this wrapper
# archives from TODAY's file only and records what it archived - handle the split explicitly.
$O = New-Object System.Collections.Generic.List[string]
$O.Add(('RUN=' + $RunName))
$O.Add(('WRAPPED_LAUNCH=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')))
$O.Add(('INI=' + $IniPath))
$stale = Join-Path $Work ($RunName + '_STATUS.txt')
if(Test-Path -LiteralPath $stale){ Remove-Item -LiteralPath $stale -Force }
$busy = $null -ne (Get-Process -Name terminal64 -ErrorAction SilentlyContinue)
$O.Add(('TERMINAL_BUSY=' + $busy.ToString()))
if($busy){
  $O.Add('DONE=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'))
  [System.IO.File]::WriteAllLines($stale, $O, (New-Object System.Text.UTF8Encoding($true)))
  exit 2
}
$pre = 0
if(Test-Path -LiteralPath $Tlog){ $pre = ([System.IO.File]::ReadAllLines($Tlog)).Count }
$O.Add(('PRE_JOURNAL_LINES=' + $pre))
$p = Start-Process -FilePath $Term -ArgumentList ('/config:"' + $IniPath + '"') -PassThru
$O.Add(('PID=' + $p.Id))
$exited = $p.WaitForExit(2700000)   # 45-minute ceiling; a normal run is ~28 min
$O.Add(('EXITED=' + $exited.ToString()))
if(-not $exited){ $O.Add('NOTE=still running after the 45-min wrapper window - the tester is LEFT ALIVE, no kill') }
Start-Sleep -Seconds 5
$O.Add(('TERMINAL_ALIVE=' + (($null -ne (Get-Process -Id $p.Id -ErrorAction SilentlyContinue))).ToString()))
# Archive the segment; retry through the R-180 file-lock class (up to 6 x 10 s).
$archived = 0
for($i = 0; $i -lt 6; $i++){
  try {
    if(Test-Path -LiteralPath $Tlog){
      $lines = [System.IO.File]::ReadAllLines($Tlog)
      if($lines.Count -gt $pre){
        $seg = $lines[$pre..($lines.Count - 1)]
        [System.IO.File]::WriteAllLines((Join-Path $Hand ($RunName + '_JOURNAL.log')), $seg)
        $archived = $seg.Count
      }
    }
    break
  } catch { Start-Sleep -Seconds 10 }
}
$O.Add(('ARCHIVED_LINES=' + $archived))
$J = Join-Path $Hand ($RunName + '_JOURNAL.log')
if(Test-Path -LiteralPath $J){
  $g = @(Select-String -LiteralPath $J -Pattern 'Test passed|final balance|WS161_CENSUS|WS161_LOAD_COUNT|WS161_MISMATCH_COUNT|BIASCENSUS_FINAL|ZONECENSUS_FINAL|ALERT SRJ SIGNAL' -ErrorAction SilentlyContinue)
  foreach($m in $g){ $O.Add(('GATE: ' + $m.Line)) }
  $all = [System.IO.File]::ReadAllLines($J)
  $O.Add(('XOB_PROMOCENSUS_COUNT=' + @($all | Where-Object { $_ -match 'XOB-PROMOCENSUS' }).Count))
}
$O.Add(('DONE=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')))
[System.IO.File]::WriteAllLines($stale, $O, (New-Object System.Text.UTF8Encoding($true)))
