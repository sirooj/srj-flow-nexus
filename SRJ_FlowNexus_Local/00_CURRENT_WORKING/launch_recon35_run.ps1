# Launch RECON35-LIVE (filed script, run-the-file per tooling lesson).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON35-LIVE'
$Ini = Join-Path $Work 'RECON1_P1.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# S2-CROSS-DIR-PREEMPT live transfer (Luna V87-LIVE-PREEMPT-001 CLEAR-by-name
# + his selection token + fresh run word this turn; nothing else spent).
# Build EA FAF8442B/573129 (transfer at t78, Region-P mirror, D1-D4 recorded;
# g_dir 3->4, OrderSend 0, no fresh scan, both compile 0/0 fresh logs);
# FlowLogic 3606BFB4 untouched. Same ini/range as RECON34 (Model=4 real-ticks,
# InpDebugLog=true, same terminal and machine, spread live-floating as all
# prior runs; same-range consequence run first, new-span proving stays owed
# per Luna section 9). Ceiling 90 min, wrapper-only. ONE build (done) + ONE
# run. No third run. Timeout REPORT+HALT.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
