# Launch RECON77-V29-UJ (2026-09-30; v29 build on Luna KEY-FIX2-V14 + his UJ run word).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON77-V29-UJ'
$Ini = Join-Path $Work 'USDJPY_DEMO_JUNE.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# Tree v29 977B0FB5 (FIX-2v14 CARRY telemetry on v28 E516EBFF; +4 lines; 0 errors 0 warnings; alert-only stands).
# Window 6/1 00:00 to 6/13 00:00 UTC via terminal.ini [Tester]
# 1780272000/1781308800 (read-verified this turn with no terminal running, no edit needed, no orphan agent; InpDebugLog=true via run ini).
# Key scope: exactly one build (spent, commit 71f1e55) + exactly one UJ June run (this launch; Luna KEY-FIX2-V14 + his word this turn; EU own word+scope, never this run).
# Ceiling 90. Grade on DONE: behavior-neutral vs RECON76 (takes/balance/signals identical) + UJPROV lifecycle rows.
# No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
