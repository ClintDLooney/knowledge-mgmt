# Master Knowledge Base Session Start Script
# Run this before starting a new Cursor chat for master-level oversight

param(
    [string]$Focus = "Master Knowledge Base Management",
    [int]$MaxTokens = 15000,
    [int]$SessionHours = 2
)

# Create master journal entry
$Date = Get-Date -Format "yyyy-MM-dd"
$JournalFile = "journal/$Date.md"

if (-not (Test-Path "journal")) {
    New-Item -ItemType Directory -Path "journal" -Force
}

if (-not (Test-Path $JournalFile)) {
    $JournalContent = @"
# Master Knowledge Base Session - $Date

## Session Focus
$Focus

## Token Budget
- Max Tokens: $MaxTokens
- Session Duration: $SessionHours hours
- Estimated Tokens/Hour: $([math]::Round($MaxTokens / $SessionHours))

## Context Files to Load
- docs/MASTER_CONTEXT.md
- docs/MASTER_DECISIONS.md
- a11y-ai/docs/CONTEXT.md
- a11y-ai/docs/DECISIONS.md
- a11y-ai/shared/workflows/MASTER_WORKFLOW.md

## Session Goals
- [ ] Review all subproject status
- [ ] Identify cross-project opportunities
- [ ] Plan next priorities
- [ ] Update master documentation

## Notes
"@
    Set-Content -Path $JournalFile -Value $JournalContent
}

# Generate context loading prompt
$ContextPrompt = @"
Read these files first for master knowledge base context:
- docs/MASTER_CONTEXT.md
- docs/MASTER_DECISIONS.md
- a11y-ai/docs/CONTEXT.md
- a11y-ai/docs/DECISIONS.md
- a11y-ai/shared/workflows/MASTER_WORKFLOW.md

Focus: $Focus
Token Budget: $MaxTokens tokens
Duration: $SessionHours hours

Based on these files, what's the current state across all projects and what should be prioritized next?
Use batch requests and reference files to minimize token usage.
"@

Write-Host "=== MASTER KNOWLEDGE BASE SESSION START ===" -ForegroundColor Green
Write-Host "Focus: $Focus" -ForegroundColor Yellow
Write-Host "Token Budget: $MaxTokens" -ForegroundColor Yellow
Write-Host "Duration: $SessionHours hours" -ForegroundColor Yellow
Write-Host ""
Write-Host "Journal created: $JournalFile" -ForegroundColor Cyan
Write-Host ""
Write-Host "=== CONTEXT LOADING PROMPT (Copy to Cursor) ===" -ForegroundColor Green
Write-Host $ContextPrompt -ForegroundColor White
Write-Host ""
Write-Host "=== SESSION STARTED ===" -ForegroundColor Green

