# Launch RECON36-STOPSHADOW (filed script, run-the-file per tooling lesson).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON36-STOPSHADOW'
$Ini = Join-Path $Work 'RECON1_P1.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# S1-CONDSTOP-SHADOW-001 stop-source recorder (Luna V89-STOP-CLEAR-001
# CLEAR-by-name print-only + his fresh run word this turn; no tokens spent).
# Build EA 7F01804E/576968 (shadow-local rung-0 walk read-only at Region W
# pre-latch reusing currentPrice/tpTarget/slRef/tpOk; SrjResolveExt1
# untouched; N1 untouched; g_dir writers stay 4; OrderSend 0; no fresh scan;
# both compile 0/0 fresh logs); FlowLogic 3606BFB4 untouched. Same ini/range
# as RECON35 (Model=4 real-ticks, InpDebugLog=true, same terminal and
# machine, spread live-floating as all prior runs). Ceiling 90 min,
# wrapper-only. ONE build (done) + ONE run. No third run. Timeout REPORT+HALT.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
