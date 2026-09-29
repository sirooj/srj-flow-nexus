# Launch RECON75-V11-UJ (2026-09-29; v27 build on Luna KEY for FIX-2v11 + his UJ run word).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON75-V11-UJ'
$Ini = Join-Path $Work 'USDJPY_DEMO_JUNE.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# Tree v27 21501194 (FIX-2v11 on v26 8C6468F4; 0 errors 0 warnings; alert-only stands).
# Window 6/1 00:00 to 6/13 00:00 UTC via terminal.ini [Tester]
# 1780272000/1781308800 (read-verified this turn, no edit needed; terminal was
# closed, no orphan agent; InpDebugLog=true via run ini).
# Key scope: exactly one build + exactly one UJ June run (Luna GRANT + his word
# this turn; EU own word+scope, never this run).
# Ceiling 90. Grade: R-venue retarget (5 June NY 19:00), B-venue kill (8 June
# 09:25, no promotion), S-venue telemetry (11 June 14:35 term rows) + Q2
# regression (lifecycle demo rows, admissions backstop, B-venue kill preserved).
# No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
