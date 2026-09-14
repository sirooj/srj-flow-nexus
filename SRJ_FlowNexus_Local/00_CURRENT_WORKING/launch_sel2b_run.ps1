$Work='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run='RECON21b-SEL2'
$Ini=Join-Path $Work 'RECON1_P1.ini'
foreach($suf in @('_STATUS.txt','_DONE.txt')){ $p=Join-Path $Work ($Run + $suf); if(Test-Path -LiteralPath $p){ Remove-Item -LiteralPath $p -Force } }
# Detached launch via cmd /c start with splatted argv (quoting discipline:
# never pass the argument string as one variable; title keeps its quotes;
# inner paths carry NO quotes). Prints one line and returns; completion is
# detected via the DONE file only. Distinct run name preserves RECON21
# timeout evidence read-only (Opus-v18 condition 2). Ceiling 90 min lives
# in the wrapper (dual-cleared v18, wrapper-only).
$psiArgs = @('/c', 'start', """$Run""", 'powershell', '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', (Join-Path $Work 'run_tester_v2.ps1'), '-RunName', $Run, '-IniPath', $Ini)
& cmd @psiArgs
'LAUNCHED ' + $Run
