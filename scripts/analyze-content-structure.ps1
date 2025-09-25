# Content Structure Analysis Script
# Analyzes chatgpt-projects content and suggests migration plan

param(
    [string]$SourcePath = "chatgpt-projects",
    [string]$OutputFile = "migration-plan.md"
)

Write-Host "=== CONTENT STRUCTURE ANALYSIS ===" -ForegroundColor Green
Write-Host "Analyzing: $SourcePath" -ForegroundColor Yellow
Write-Host "Output: $OutputFile" -ForegroundColor Yellow
Write-Host ""

# Get all files in source
$Files = Get-ChildItem -Path $SourcePath -Recurse -File | Where-Object { $_.Extension -match '\.(md|txt|py|js|json|yaml|yml)$' }

# Categorize files
$Categories = @{
    "Prompts" = @()
    "Learning" = @()
    "Templates" = @()
    "Business" = @()
    "Technical" = @()
    "Documentation" = @()
    "Other" = @()
}

foreach ($File in $Files) {
    $RelativePath = $File.FullName.Replace((Get-Location).Path + "\", "").Replace("\", "/")
    $FileName = $File.Name.ToLower()
    $Content = Get-Content $File.FullName -Raw -ErrorAction SilentlyContinue
    
    # Categorize based on filename and content
    if ($FileName -match "prompt|sop|workflow|template") {
        $Categories["Prompts"] += $RelativePath
    }
    elseif ($FileName -match "learn|skill|tutorial|guide") {
        $Categories["Learning"] += $RelativePath
    }
    elseif ($FileName -match "template|boilerplate|starter") {
        $Categories["Templates"] += $RelativePath
    }
    elseif ($Content -match "business|revenue|client|customer|consulting") {
        $Categories["Business"] += $RelativePath
    }
    elseif ($FileName -match "\.(py|js|json|yaml|yml)$" -or $Content -match "code|function|class|import") {
        $Categories["Technical"] += $RelativePath
    }
    elseif ($FileName -match "readme|doc|manual") {
        $Categories["Documentation"] += $RelativePath
    }
    else {
        $Categories["Other"] += $RelativePath
    }
}

# Generate migration plan
$MigrationPlan = @"
# Content Migration Plan

## Analysis Summary
- **Total Files Analyzed**: $($Files.Count)
- **Source Directory**: $SourcePath
- **Analysis Date**: $(Get-Date -Format "yyyy-MM-dd")

## Proposed Migration Structure

### Prompts & Workflows → \`shared/prompts/\`
"@

foreach ($File in $Categories["Prompts"]) {
    $MigrationPlan += "`n- \`$File\` → \`shared/prompts/\`"
}

$MigrationPlan += @"

### Learning Materials → \`shared/learning/\`
"@

foreach ($File in $Categories["Learning"]) {
    $MigrationPlan += "`n- \`$File\` → \`shared/learning/\`"
}

$MigrationPlan += @"

### Templates → \`shared/templates/\`
"@

foreach ($File in $Categories["Templates"]) {
    $MigrationPlan += "`n- \`$File\` → \`shared/templates/\`"
}

$MigrationPlan += @"

### Business Content → \`a11y-ai/business-mgmt/\`
"@

foreach ($File in $Categories["Business"]) {
    $MigrationPlan += "`n- \`$File\` → \`a11y-ai/business-mgmt/\`"
}

$MigrationPlan += @"

### Technical Content → Project-Specific Folders
"@

foreach ($File in $Categories["Technical"]) {
    $MigrationPlan += "`n- \`$File\` → \`[determine target project]/\`"
}

$MigrationPlan += @"

### Documentation → \`docs/\`
"@

foreach ($File in $Categories["Documentation"]) {
    $MigrationPlan += "`n- \`$File\` → \`docs/\`"
}

$MigrationPlan += @"

### Other Content → \`other-projects/\`
"@

foreach ($File in $Categories["Other"]) {
    $MigrationPlan += "`n- \`$File\` → \`other-projects/\`"
}

$MigrationPlan += @"

## Migration Commands

### Phase 1: Create Target Directories
\`\`\`powershell
New-Item -ItemType Directory -Path "shared/prompts" -Force
New-Item -ItemType Directory -Path "shared/learning" -Force
New-Item -ItemType Directory -Path "shared/templates" -Force
New-Item -ItemType Directory -Path "a11y-ai/business-mgmt" -Force
\`\`\`

### Phase 2: Move Files (Preserve Git History)
\`\`\`powershell
# Example commands - customize based on analysis above
git mv chatgpt-projects/prompts/ai-skills.md shared/prompts/
git mv chatgpt-projects/learning/python-basics.md shared/learning/
# ... continue for each file
\`\`\`

### Phase 3: Update References
\`\`\`powershell
# Search for references to old paths
Get-ChildItem -Recurse -File | Select-String "chatgpt-projects" | Select-Object Filename, LineNumber, Line
\`\`\`

### Phase 4: Cleanup
\`\`\`powershell
# Remove empty directories
Get-ChildItem -Path "chatgpt-projects" -Recurse -Directory | Where-Object { (Get-ChildItem $_.FullName).Count -eq 0 } | Remove-Item
# Remove empty chatgpt-projects folder
Remove-Item "chatgpt-projects" -Force
\`\`\`

## Risk Mitigation
1. **Backup**: Create branch before migration
2. **Incremental**: Move files in small batches
3. **Test**: Verify all references work after each batch
4. **Rollback**: Keep original structure in git history

## Benefits
- **Better Organization**: Content grouped by function, not project
- **Improved Discoverability**: Related content together
- **Reduced Duplication**: Eliminate scattered similar content
- **Cleaner Architecture**: Topic-organized structure
"@

# Save migration plan
Set-Content -Path $OutputFile -Value $MigrationPlan

Write-Host "=== ANALYSIS COMPLETE ===" -ForegroundColor Green
Write-Host "Migration plan saved to: $OutputFile" -ForegroundColor Cyan
Write-Host ""
Write-Host "Categories found:" -ForegroundColor Yellow
foreach ($Category in $Categories.Keys) {
    if ($Categories[$Category].Count -gt 0) {
        Write-Host "  $Category`: $($Categories[$Category].Count) files" -ForegroundColor White
    }
}
Write-Host ""
Write-Host "Review $OutputFile for detailed migration plan" -ForegroundColor Cyan
