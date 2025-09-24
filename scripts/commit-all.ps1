# Batch commit script for multi-repo knowledge management
# Commits changes across all repositories

Write-Host "Starting batch commit across all repositories..." -ForegroundColor Green

 = @("a11y-ai", "obsidian-vaults", "chatgpt-projects", "other-projects")
 = Get-Location

foreach ( in ) {
    if (Test-Path ) {
        Write-Host "
Processing repository: " -ForegroundColor Yellow
        Set-Location 
        
        # Check if there are changes to commit
         = git status --porcelain
        if () {
            Write-Host "Changes found in " -ForegroundColor Cyan
            git add .
            git commit -m "Batch commit: 2025-09-24 14:27:51"
            Write-Host "Committed changes in " -ForegroundColor Green
        } else {
            Write-Host "No changes to commit in " -ForegroundColor Gray
        }
        
        Set-Location 
    } else {
        Write-Host "Repository  not found" -ForegroundColor Red
    }
}

Write-Host "
Batch commit completed!" -ForegroundColor Green
