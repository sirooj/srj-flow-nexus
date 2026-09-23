# Launch RECON58-RETEST-V1 (2026-09-23; RUN on Luna key RETEST-2 CLEARED-one-build-one-run for P-RETEST-2 v2 053D85FD + his build+run word banked this turn, commit token NOT granted).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON58-RETEST-V1'
$Ini = Join-Path $Work 'RECON50_DEMO_USD.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# v2 packet (EA B01CBA64/622155/11317 post-S2, 0/0 logs RETEST-V1).
# Same envelope as RECON57 (RECON50_DEMO_USD ini, InpMode 1, 08-26 to 09-10,
# InpDebugLog=true). Ceiling 90 min, wrapper-only. ONE build (done) + ONE run.
# Timeout REPORT+HALT. No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
