# Launch RECON50-EXT1LIVE-V38 (2026-09-20; RUN on Luna-V201-001 ACCEPT on PACKET_EXT1LIVE-001 v38 plus Sonnet/GLM advisory ACCEPT/AMEND, Astra waived per operator order, run word on his proceed).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON50-EXT1LIVE-V38'
$Ini = Join-Path $Work 'RECON50_DEMO_USD.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# v38 packet (Luna-V201-001 ACCEPT + Sonnet/GLM advisory, live E-hunk v2 tag -v37; Astra waived by operator order).
# Build EA A8977905/614371 (E-hunk v2 with currentPrice-finite conjunct on carried A/B/C/D1/D2, 0/0 log
# EXT1LIVE-V38_EACOMPILE). New USD ini (Currency USD, Deposit 10000 unchanged) and range
# 08-26 to 09-09, same terminal+machine. Ceiling 90 min, wrapper-only. ONE build
# (done) + ONE run. Timeout REPORT+HALT. No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
