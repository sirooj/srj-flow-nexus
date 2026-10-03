# Launch RECON71-V8-UJ (2026-09-27; v8 build on his 1-13 June USDJPY word).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON71-V8-UJ'
$Ini = Join-Path $Work 'USDJPY_DEMO_JUNE.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# Tree 14C7476C/660687/11975 (key build-leg spent, EA 0/0 + FlowLogic 0/0).
# Window 6/1 00:00 to 6/13 00:00 UTC via terminal.ini [Tester]
# 1780272000/1781308800 (close-first: terminal gone at edit, backup
# pre-recon71, read-back verified, TickLoad untouched, InpDebugLog=true).
# HTF-debug instrument note: inHtfDebugLog defaults false with no EA
# passthrough, so UJDBG rows are expected-0; acceptance rests on EA-side
# rows and the flag row pins actuals.
# Ceiling 90. Grade: A-IMPL1 (6/5 09:45) + A-IMPL2 (admissions/provenance) +
# A-IMPL3 (6/11 14:40:22). EU preservation is NOT in this run (one-run grant).
# No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
