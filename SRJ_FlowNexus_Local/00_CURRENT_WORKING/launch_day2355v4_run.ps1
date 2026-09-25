# Launch RECON61-DAY2355-V4 (2026-09-25; RUN on Luna key DAY2355-1 v4 CLEARED-one-build-one-run 7C915C61 + his run word banked this turn, SPENT HERE).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON61-DAY2355-V4'
$Ini = Join-Path $Work 'RECON50_DEMO_USD.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# v4 packet (EA A82F15E7/post-S2, 0/0 logs DAY2355-V4).
# SCOPED envelope (RECON50_DEMO_USD ini, InpMode 1, Fri 9/4 00:00 to Mon 9/8 00:00
# via terminal.ini [Tester], InpDebugLog=true). Ceiling 90 min, wrapper-only.
# ONE build (done) + ONE scoped run. Timeout REPORT+HALT. No terminal is ever
# killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
