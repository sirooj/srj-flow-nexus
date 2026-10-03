# Launch RECON68-V7-PROOF (2026-09-26; revert-proof on restored tree CD95241F, his explicit order this turn: quick 9/4-9/8 EU slice, cheaper than 50+50).
$Work = 'c:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\00_CURRENT_WORKING'
$Run = 'RECON68-V7-PROOF'
$Ini = Join-Path $Work 'EU_DEMO_FULL.ini'
foreach ($suf in @('_STATUS.txt','_DONE.txt')) { $p = Join-Path $Work ($Run + $suf); if (Test-Path -LiteralPath $p) { Remove-Item -LiteralPath $p -Force } }
# Detached launch via Win32_Process.Create (WMI, parent=wmiprvse) per the
# launcher-detach amendment (AGENTS 8, 2026-09-14). WMI prints PID + RC and
# returns instantly; completion is detected via the DONE file only.
# Restored tree CD95241F/637583/11552 (revert commit 9fdae4d, compile 0/0).
# EU slice 9/4 00:00 to 9/8 00:00 (Fri + full Monday, no Tuesday per his
# exclusive-end rationale, ledger 740) via terminal.ini [Tester]
# 1788480000/1788825600: close-first (no terminal running, verified gone),
# convention-calibrated offset, span 4 days, read-back verified once,
# backup terminal.ini.pre-recon68, InpDebugLog=true. Ceiling 90 min.
# Grade criteria: 9/4 NY + 9/7 London takes present, 9/7 NY missed (known),
# 9/4 10:40 dead, zero E4B_GUARD/SKIP/S54 rows (revert proof on-row).
# No terminal is ever killed by the wrapper or here.
$cmd = 'powershell -NoProfile -ExecutionPolicy Bypass -File "' + (Join-Path $Work 'run_tester_v2.ps1') + '" -RunName ' + $Run + ' -IniPath "' + $Ini + '" -CeilingMin 90'
$r = ([wmiclass]'Win32_Process').Create($cmd)
'WMI_PID=' + $r.ProcessId + ' RC=' + $r.ReturnValue
'LAUNCHED ' + $Run
