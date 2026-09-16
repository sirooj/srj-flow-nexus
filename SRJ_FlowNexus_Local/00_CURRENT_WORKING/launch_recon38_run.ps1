# Launch RECON38-STAGED (filed at build 2026-09-16; RUN ONLY on the
# operator's fresh run word - the build session files this, the word spends at launch.
# See AGENTS.md queue 224 + BUILDER_BUILD_RECON38-STAGED.md.)
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON38-STAGED'
$Ini = Join-Path $Work 'RECON1_P1.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# V96-STAGED-CLEAR-001 (Luna CLEAR-by-name print-only STAGE-D-S2-RGATE-001 +
# R2-CQD-ELIGIBILITY-002, staged pair; NO tokens; fresh run word spent at
# launch). Build EA 7BFC7FA3/584698 (SIDE1R link + SIDE1W CQD window +
# s1g_seedBiasAl carriage; all null-effect, both compile 0/0 fresh logs);
# FlowLogic 3606BFB4 untouched. Same ini/range (Model=4 real-ticks,
# InpDebugLog=true, 08-26 to 09-09, same terminal+machine, spread
# live-floating as all prior runs). Ceiling 90 min, wrapper-only. ONE build
# (done, do NOT rebuild) + ONE run. No third run. Timeout REPORT+HALT. His demo
# terminal is NEVER touched - if TERMINAL_BUSY refuses, STOP and ask him.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
