$Work='c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run='RECON14-SLDEF3'
$Ini=Join-Path $Work 'RECON1_P1.ini'
foreach($suf in @('_STATUS.txt','_DONE.txt')){ $p=Join-Path $Work ($Run + $suf); if(Test-Path -LiteralPath $p){ Remove-Item -LiteralPath $p -Force } }
# Detached launch with file redirection (launcher detach law): prints one
# line and returns in <1s; the wrapper never inherits this shell's pipes.
$WrapLog=Join-Path $Work ($Run + '_WRAPPER.log')
$WrapErr=Join-Path $Work ($Run + '_WRAPPER.err.log')
$args='-NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '"'
$p=Start-Process -FilePath 'powershell' -ArgumentList $args -WindowStyle Hidden -RedirectStandardOutput $WrapLog -RedirectStandardError $WrapErr -PassThru
'LAUNCHED wrapper PID=' + $p.Id
