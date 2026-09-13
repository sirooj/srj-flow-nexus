$Work='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run='RECON15-SLDEF4'
$Ini=Join-Path $Work 'RECON1_P1.ini'
foreach($suf in @('_STATUS.txt','_DONE.txt')){ $p=Join-Path $Work ($Run + $suf); if(Test-Path -LiteralPath $p){ Remove-Item -LiteralPath $p -Force } }
# Detached launch via cmd /c start (verdict note on RECON14: the Start-Process
# form hung the builder-side call though the launch itself stayed reliable).
# Prints one line and returns; completion is detected via the DONE file only.
# Quoting discipline for cmd: NEVER pass the argument string as one variable
# (PowerShell wraps it in a single quote pair and the wrapper dies instantly).
# Splat an argv array so cmd sees separate tokens; the title keeps its quotes
# (triple-quote form); inner paths carry NO quotes (no space below).
$psiArgs = @('/c', 'start', """$Run""", 'powershell', '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', (Join-Path $Work 'run_tester_v2.ps1'), '-RunName', $Run, '-IniPath', $Ini)
& cmd @psiArgs
'LAUNCHED ' + $Run
