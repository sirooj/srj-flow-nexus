# search_record.ps1 - record-first question gate helper (AGENTS.md 2).
# Searches the record IN ORDER (spec, restatement, findings, journal docs)
# for a pattern and prints file:line hits plus the sources-checked list.
# Paste the sources-checked list WITH any operator question, plus why each
# hit fails to answer it. A question the record already answers is a
# builder defect, not a relay. Read-only: writes nothing.
param([Parameter(Mandatory=$true)][string]$Pattern)
$local = "C:\Users\winar\AppData\Roaming\MetaQuotes\Terminal\3CA1B4AB7DFED5C81B1C7F1007926D06\MQL5\SRJ_FlowNexus_Local"
$hands = Join-Path $local "06_HANDOFFS\*.md"
$goal = Join-Path $local "00_CURRENT_WORKING\GOAL_STATEMENT.md"
$charter = Join-Path $local "00_CURRENT_WORKING\CHARTER.md"
$restate = Join-Path $local "06_HANDOFFS\BUILDER_STATEMENT_FUNDAMENTAL_RULES.md"
$journal = Join-Path $local "00_CURRENT_WORKING\OPERATOR_TRADE_JOURNAL.csv"
$spec = Join-Path $local ("00_CURRENT_WORKING\SRJ Flow Nexus " + [char]0x2014 + " Part A Specification v4.2")
"SEARCH: {0}" -f $Pattern
"SOURCES CHECKED:"
" - {0}" -f $hands
" - {0}" -f $restate
" - {0}" -f $goal
" - {0}" -f $charter
" - {0}" -f $journal
" - {0}" -f $spec
"HITS (file:line):"
Select-String -Path $hands -Pattern $Pattern | ForEach-Object { " - {0}:{1}: {2}" -f $_.FileName, $_.LineNumber, ($_.Line.Trim()) }
foreach ($f in @($restate, $goal, $charter, $journal)) {
  Select-String -LiteralPath $f -Pattern $Pattern | ForEach-Object { " - {0}:{1}: {2}" -f $_.FileName, $_.LineNumber, ($_.Line.Trim()) }
}
try { Select-String -LiteralPath $spec -Pattern $Pattern | ForEach-Object { " - SPEC:{0}: {1}" -f $_.LineNumber, ($_.Line.Trim()) } }
catch { " - SPEC: skipped (not readable as text)" }
"GATE: file the list above WITH the question, plus why each hit fails to answer it."
