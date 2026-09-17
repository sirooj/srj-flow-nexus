# Launch RECON42-PDSHADOW (filed 2026-09-17; RUN on packet + delegation, no words owed).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON42-PDSHADOW'
$Ini = Join-Path $Work 'RECON1_P1.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# PACKET TP-DATA-SOURCE-COMPLETE-001 (dual-key issued + premise-stands; token for
# LANDING still owed, not spent). Build EA F867114A/594537 (shadow reads+print;
# both compile 0/0 fresh logs); FlowLogic 59F36555/69771 (+8 prev-day session bufs).
# Same ini/range (Model=4 real-ticks, InpDebugLog=true, 08-26 to 09-09, same
# terminal+machine, spread live-floating as all prior runs). Ceiling 90 min,
# wrapper-only. ONE shadow build (done, do NOT rebuild) + ONE proving run.
# Timeout REPORT+HALT. His demo terminal is NEVER touched - if TERMINAL_BUSY
# refuses, STOP and ask him (his word or his close), never close it yourself.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
