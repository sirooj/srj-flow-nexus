# file_verdict.ps1 - verbatim council-verdict filer (AGENTS.md relay discipline).
# Appends staged verdict text under its source header as bytes (explicit UTF-8),
# then verifies: Ruling-ID occurs exactly once + file tail byte-matches the block.
# Refuses duplicates (identical re-pastes are filed once by rule).
# No anchor matching, no in-place edits: the placeholder method is retired.
# Use: paste the whole verdict to a staging file, then run with -Stream/-RulingId/-AnswersRelay.
# -TestTarget is a verification hook only (temp copies). Live filing never uses it.
param(
  [Parameter(Mandatory=$true)][ValidateSet("Opus","Astra")][string]$Stream,
  [Parameter(Mandatory=$true)][string]$RulingId,
  [Parameter(Mandatory=$true)][string]$AnswersRelay,
  [Parameter(Mandatory=$true)][string]$SourceFile,
  [string]$TestTarget = ""
)
$utf8 = [System.Text.Encoding]::UTF8
$opusFile = "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_SLDEF4-5.md"
$astraFile = "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local\06_HANDOFFS\BUILDER_VERDICTS_ASTRA.md"
$target = $TestTarget
if ($target -eq "") { if ($Stream -eq "Opus") { $target = $opusFile } else { $target = $astraFile } }
if (-not (Test-Path -LiteralPath $SourceFile)) { "REFUSED: source file missing: {0}" -f $SourceFile; exit 1 }
if (-not (Test-Path -LiteralPath $target)) { "REFUSED: target file missing: {0}" -f $target; exit 1 }
$before = (Select-String -LiteralPath $target -Pattern $RulingId -SimpleMatch | Measure-Object).Count
if ($before -ge 1) { "REFUSED: {0} already present {1}x in target (duplicates filed once by rule)" -f $RulingId, $before; exit 1 }
$raw = [System.IO.File]::ReadAllText($SourceFile, $utf8)
$stamp = (Get-Date).ToUniversalTime().ToString("yyyy-MM-dd")
$block = "`r`n## VERDICT {0} {1} (answers {2})`r`n`r`n{3}" -f $RulingId, $stamp, $AnswersRelay, $raw
if (-not $block.EndsWith("`r`n")) { $block += "`r`n" }
$blockBytes = $utf8.GetBytes($block)
[System.IO.File]::AppendAllText($target, $block, $utf8)
$after = (Select-String -LiteralPath $target -Pattern $RulingId -SimpleMatch | Measure-Object).Count
$inBlock = ([regex]::Matches($block, [regex]::Escape($RulingId))).Count
$tgt = [System.IO.File]::ReadAllBytes($target)
$match = $false
if ($tgt.Length -ge $blockBytes.Length) {
  $tail = $tgt[($tgt.Length - $blockBytes.Length)..($tgt.Length - 1)]
  $match = ($tail.Length -eq $blockBytes.Length)
  if ($match) { for ($i = 0; $i -lt $blockBytes.Length; $i++) { if ($tail[$i] -ne $blockBytes[$i]) { $match = $false; break } } }
}
$sha = (Get-FileHash -Algorithm SHA256 -LiteralPath $target).Hash
"TARGET: {0}" -f $target
"RULING: {0} count {1} -> {2} (block carries {3})" -f $RulingId, $before, $after, $inBlock
"BYTES APPENDED: {0}" -f $blockBytes.Length
"FILE SHA256: {0}" -f $sha
"TAIL MATCH: {0}" -f $match
if (($after -eq $inBlock) -and $match) { "RESULT: FILED + VERIFIED"; exit 0 }
"RESULT: VERIFY FAILED"; exit 1
