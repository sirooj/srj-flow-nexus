# run_tester_v2.ps1 - the SRJ headless tester harness v2 (reliability-hardened 2026-09-09
# after the operator's second reliability warning: "the strategy tester has not run yet...
# your command to conduct the automatic strategy tester is not reliable. improve it!").
#
# THE V1 DEFECT THIS FIXES: v1 waited for the TERMINAL PROCESS to exit. A /config tester
# terminal does NOT self-exit after the test (observed T161L: test passed 07:34:38, terminal
# still alive), so v1 sat silent for up to 45 minutes with NO STATUS - an invisible failure.
#
# V2 CONTRACT:
#   1. STATUS is written IMMEDIATELY at launch (pre-flight facts) and REWRITTEN every ~10 s
#      (HEARTBEAT lines: terminal alive + journal growth + the journal's last line). A dead
#      or stuck run is VISIBLE WITHIN SECONDS, not after 45 minutes.
#   2. COMPLETION IS JOURNAL-BASED, not process-based: the run is DONE when the terminal
#      journal prints its completion marker ("Test passed" / "test stopped" / the agent
#      "log file ... written" line). A leftover terminal is REPORTED (TERMINAL_ALIVE=true),
#      never killed - the wrapper NEVER kills a terminal (invariant kept).
#   3. Pre-flight gates: ini missing / terminal missing / TERMINAL_BUSY -> REFUSED_* in
#      STATUS within seconds (exit codes 2/3/4).
#   4. Early-fail capture: if the terminal exits BEFORE the completion marker, the journal
#      tail goes into STATUS for diagnosis.
#   5. Midnight split handled: the polled journal file flips at midnight.
# Builder protocol (V2.3 POLL LAW, hardened 2026-09-09 after the operator's THIRD
# reliability warning — the poll COMMANDS were being aborted by the IDE shell whenever
# they carried sleep loops): launch DETACHED, then poll with ONE SUB-SECOND COMMAND PER
# TOOL CALL — Test-Path <RunName>_DONE.txt — and NOTHING ELSE. Sleep loops inside poll
# commands are FORBIDDEN. This wrapper writes the DONE marker at EVERY terminal state
# (PASSED / TERMINAL_EXITED_EARLY / TIMEOUT_60MIN / UNDETERMINED / REFUSED_*). If DONE is
# absent the run is still going — issue another single Test-Path later; never wait inside
# a command. STATUS carries the full pre-flight + heartbeat + GATE block (GATE lines scan
# ONLY the new journal segment — the day-log's earlier runs must never pollute them).
param(
  [Parameter(Mandatory=$true)][string]$RunName,
  [Parameter(Mandatory=$true)][string]$IniPath,
  # V2.4: council dual-clearance v18 (Astra-9 + OPUS-v18-RECON21-SEL2) raised
  # the ceiling 60 -> 90. A ceiling is a runaway guard, not a pace target.
  [int]$CeilingMin = 90
)
$ErrorActionPreference = 'Continue'
$Root = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06'
$Hand = Join-Path $Root 'MQL5\SRJ_FlowNexus_Local\06_HANDOFFS'
$Work = Join-Path $Root 'MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Term = 'C:\Program Files\Dukascopy MetaTrader 5\terminal64.exe'
$StatusPath = Join-Path $Work ($RunName + '_STATUS.txt')
$O = New-Object System.Collections.Generic.List[string]
function Flush-Status { [System.IO.File]::WriteAllLines($StatusPath, $O, (New-Object System.Text.UTF8Encoding($true))) }
$DonePath = Join-Path $Work ($RunName + '_DONE.txt')
function Write-DoneMarker {
  param([string]$Result)
  $lines = @(('RUN=' + $RunName), ('RESULT=' + $Result), ('DONE=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')))
  [System.IO.File]::WriteAllLines($DonePath, $lines, (New-Object System.Text.UTF8Encoding($true)))
}
function Read-Journal {
  param([string]$Path)   # lock-tolerant full read; returns $null if unreadable
  try {
    # O(n): List.Add, NEVER $lines += $L (array-append is O(n^2) and cost
    # 15 silent pre-flight minutes on the 54 MB day log, RECON13 2026-09-12).
    $fs = [System.IO.File]::Open($Path,'Open','Read','ReadWrite')
    $sr = New-Object System.IO.StreamReader($fs)
    $list = New-Object System.Collections.Generic.List[string]
    while($null -ne ($L = $sr.ReadLine())){ $list.Add($L) }
    $sr.Close(); return $list.ToArray()
  } catch { return $null }
}
$O.Add(('RUN=' + $RunName))
$O.Add(('WRAPPER=V2'))
$O.Add(('CEILING_MIN=' + $CeilingMin))
$O.Add(('WRAPPER_STARTED=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')))
$O.Add(('INI=' + $IniPath))
if(Test-Path -LiteralPath $StatusPath){ Remove-Item -LiteralPath $StatusPath -Force }
if(Test-Path -LiteralPath $DonePath){ Remove-Item -LiteralPath $DonePath -Force }
$O.Add(('INI_EXISTS=' + (Test-Path -LiteralPath $IniPath).ToString()))
$O.Add(('TERM_EXISTS=' + (Test-Path -LiteralPath $Term).ToString()))
$busy = $null -ne (Get-Process -Name terminal64 -ErrorAction SilentlyContinue)
$O.Add(('TERMINAL_BUSY=' + $busy.ToString()))
Flush-Status
if($busy){ $O.Add('RESULT=REFUSED_TERMINAL_BUSY'); $O.Add(('DONE=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'))); Write-DoneMarker 'REFUSED_TERMINAL_BUSY'; Flush-Status; exit 2 }
if(-not (Test-Path -LiteralPath $IniPath)){ $O.Add('RESULT=REFUSED_INI_MISSING'); $O.Add(('DONE=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'))); Write-DoneMarker 'REFUSED_INI_MISSING'; Flush-Status; exit 3 }
if(-not (Test-Path -LiteralPath $Term)){ $O.Add('RESULT=REFUSED_TERMINAL_MISSING'); $O.Add(('DONE=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'))); Write-DoneMarker 'REFUSED_TERMINAL_MISSING'; Flush-Status; exit 4 }
$day   = Get-Date -Format 'yyyyMMdd'
$Tlog  = Join-Path $Root ('Tester\logs\' + $day + '.log')
$pre   = 0
$preLines = Read-Journal $Tlog
if($null -ne $preLines){ $pre = $preLines.Count }
$O.Add(('JOURNAL=' + $Tlog))
$O.Add(('PRE_JOURNAL_LINES=' + $pre))
$p = Start-Process -FilePath $Term -ArgumentList ('/config:' + $IniPath) -PassThru
$O.Add(('PID=' + $p.Id))
$O.Add(('LAUNCHED_AT=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')))
$O.Add('STAGE=RUNNING (completion = the journal marker, NOT process exit)')
Flush-Status
$done = $false; $lines = $pre; $earlyExit = $false; $timeout = $false; $startedAt = Get-Date
while(-not $done){
  Start-Sleep -Seconds 10
  $today = Get-Date -Format 'yyyyMMdd'
  if($today -ne $day){ $day = $today; $Tlog = Join-Path $Root ('Tester\logs\' + $day + '.log'); $lines = 0 }
  $alive = $null -ne (Get-Process -Id $p.Id -ErrorAction SilentlyContinue)
  $jl = Read-Journal $Tlog
  $last = ''
  if($null -ne $jl -and $jl.Count -gt $lines){
    # scan ALL new lines, not just the last: the terminal's final line is
    # "connection closed", which sits AFTER the real completion markers.
    $new = $jl[$lines..($jl.Count - 1)]
    $lines = $jl.Count
    $last  = $jl[$jl.Count - 1]
    if(@($new | Where-Object { $_ -match 'Test passed' -or $_ -match 'test stopped' -or $_ -match 'log file .*written' -or $_ -match 'connection closed' }).Count -gt 0){
      $done = $true
    }
  }
  $O.Add(('HEARTBEAT=' + (Get-Date -Format 'HH:mm:ss') + ' terminal_alive=' + $alive + ' journal_lines=' + $lines))
  if($last -ne ''){ $O.Add(('JOURNAL_LAST=' + $last)) }
  Flush-Status
  if($done){ break }
  if(-not $alive){ $earlyExit = $true; break }
   if(((Get-Date) - $startedAt).TotalMinutes -gt $CeilingMin){ $timeout = $true; break }
}
Start-Sleep -Seconds 5
$O.Add(('TERMINAL_ALIVE=' + (($null -ne (Get-Process -Id $p.Id -ErrorAction SilentlyContinue))).ToString()))
if($earlyExit){
  $O.Add('NOTE=terminal exited BEFORE the journal completion marker - journal tail follows')
  $jl = Read-Journal $Tlog
  if($null -ne $jl){ $jl | Select-Object -Last 10 | ForEach-Object { $O.Add(('TAIL: ' + $_)) } }
}
# --- archive + gates (lock-tolerant: the leftover terminal may hold the write lock) ---
$archived = 0
$all = $null
for($i = 0; $i -lt 6; $i++){
  $all = Read-Journal $Tlog
  if($null -ne $all -and $all.Count -gt $pre){ break }
  Start-Sleep -Seconds 10
}
if($null -ne $all -and $all.Count -gt $pre){
  $seg = $all[$pre..($all.Count - 1)]
  [System.IO.File]::WriteAllLines((Join-Path $Hand ($RunName + '_JOURNAL.log')), $seg)
  $archived = $seg.Count
}
$O.Add(('ARCHIVED_LINES=' + $archived))
$passed = $false
$result = 'UNDETERMINED'
if($archived -gt 0){
  # V2.3: gates scan ONLY the new segment - the day-log's earlier runs must never pollute.
  $g = @($seg | Where-Object { $_ -match 'Test passed|final balance|WS161_CENSUS|WS161_LOAD_COUNT|WS161_MISMATCH_COUNT|BIASCENSUS_FINAL|ZONECENSUS_FINAL|ALERT SRJ SIGNAL' })
  foreach($m in $g){ $O.Add(('GATE: ' + $m)) }
  $passed = @($g | Where-Object { $_ -match 'Test passed' }).Count -gt 0
  $O.Add(('XOB_PROMOCENSUS_COUNT=' + @($seg | Where-Object { $_ -match 'XOB-PROMOCENSUS' }).Count))
}
$result = $(if($passed){'PASSED'}elseif($earlyExit){'TERMINAL_EXITED_EARLY'}elseif($timeout){'TIMEOUT_' + $CeilingMin + 'MIN'}else{'UNDETERMINED'})
$O.Add(('RESULT=' + $result))
$O.Add(('DONE=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')))
Write-DoneMarker $result
Flush-Status
