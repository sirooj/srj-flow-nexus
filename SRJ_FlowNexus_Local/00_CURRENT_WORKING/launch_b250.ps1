# launch_b250.ps1 - detached tester launch + detached tail watcher (B-249/B-250 lane pattern).
# Usage: powershell -NoProfile -ExecutionPolicy Bypass -File launch_b250.ps1 -RunName <RUN> -IniPath <path>
param(
  [Parameter(Mandatory=$true)][string]$RunName,
  [Parameter(Mandatory=$true)][string]$IniPath
)
$Root = 'C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06'
$Work = Join-Path $Root 'MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Term = 'C:\Program Files\Dukascopy MetaTrader 5\terminal64.exe'
$StatusPath = Join-Path $Work ($RunName + '_STATUS.txt')
$Day = Get-Date -Format 'yyyyMMdd'
$DayLog = Join-Path $Root ('Tester\logs\' + $Day + '.log')
$ErrorActionPreference = 'Continue'

if(Test-Path -LiteralPath $StatusPath){ Remove-Item -LiteralPath $StatusPath -Force }
$pre = 0
$preLen = 0
try {
  $fs = [System.IO.File]::Open($DayLog,'Open','Read','ReadWrite')
  $preLen = $fs.Length
  $sr = New-Object System.IO.StreamReader($fs)
  $l = New-Object System.Collections.Generic.List[string]
  while($null -ne ($x = $sr.ReadLine())){ $l.Add($x) }
  $sr.Close()
  $pre = $l.Count
} catch { $pre = 0 }
@('RUN=' + $RunName,
  'LAUNCHER=launch_b250.ps1',
  ('INI=' + $IniPath),
  ('DAYLOG=' + $DayLog),
  ('PRE_JOURNAL_LINES=' + $pre),
  ('PRE_JOURNAL_BYTES=' + $preLen),
  ('LAUNCHED_AT=' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss')),
  'STAGE=LAUNCHED (watcher writes RESULT=/DONE= on completion)') |
  ForEach-Object { [System.IO.File]::AppendAllText($StatusPath, $_ + "`r`n", (New-Object System.Text.UTF8Encoding($true))) }

$p = Start-Process -FilePath $Term -ArgumentList ('/config:' + $IniPath) -PassThru
@(('PID=' + $p.Id)) | ForEach-Object { [System.IO.File]::AppendAllText($StatusPath, $_ + "`r`n", (New-Object System.Text.UTF8Encoding($true))) }
$wmicmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'watch_run.ps1') + '" -RunName ' + $RunName + ' -DayLog "' + $DayLog + '" -StatusPath "' + $StatusPath + '" -CeilingMin 90 -PreBytes ' + $preLen
Start-Process -FilePath 'powershell.exe' -ArgumentList $wmicmd -WindowStyle Hidden | Out-Null
'LAUNCHED ' + $RunName + ' PID=' + $p.Id + ' DAYLOG=' + $DayLog
