# Launch RECON74-V11-UJ (2026-09-29; v26 build 8C6468F4 on his build+run word + Luna key KEY-IMPL2-V26).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON74-V11-UJ'
$Ini = Join-Path $Work 'USDJPY_DEMO_JUNE.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# Tree 8C6468F4/676326/12202 (key build-leg spent at compile 0/0, ex5 rebuilt).
# Window 6/1 00:00 to 6/13 00:00 UTC via terminal.ini [Tester]
# 1780272000/1781308800 (no terminal running at proof, read-back verified,
# InpDebugLog=true in run ini, InpMode=1 EXECUTE-under-tester same as RECON71).
# Ceiling 90. Grade per v26 acceptance: A-SL1 + A-S2P + A-POIV + A-FB + EU-pending.
# EU preservation is NOT in this run (one-run grant).
# No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
