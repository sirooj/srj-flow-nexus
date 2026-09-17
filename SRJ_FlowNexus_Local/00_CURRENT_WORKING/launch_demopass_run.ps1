# Launch RECON45-DEMO-PASS (filed 2026-09-17; RUN on his word under LUNA-V132 issuance + LUNA-V133 gate confirm, both spent here).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON45-DEMO-PASS'
$Ini = Join-Path $Work 'RECON44_DEMO_P1.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# V132 packet (LUNA-V132-DEMO-PASS-LAND-001 ISSUE CLEAR; V133 gate CONFIRM).
# Build EA E5B97B36/597425 (ONE DEMO_PASS PrintFormat insert after G1, 0/0 log
# T166_DEMOPASS_EACOMPILE); FlowLogic BEC2CBBD/69852 unchanged. Same demo ini
# (InpMode=1 execute), same range 08-26 to 09-09, same terminal+machine, demo
# account 1500183638. Ceiling 90 min, wrapper-only. ONE build (done) + ONE run.
# Timeout REPORT+HALT. His demo terminal is NEVER touched - if TERMINAL_BUSY
# refuses, STOP and ask him (his word or his close), never close it yourself.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
