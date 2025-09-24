# Batch pull script for multi-repo knowledge management
# Pulls latest changes from all repository remotes

Write-Host "Starting batch pull across all repositories..." -ForegroundColor Green

 = @("a11y-ai", "obsidian-vaults", "chatgpt-projects", "other-projects")
 = Get-Location

foreach ( in ) {
    if (Test-Path ) {
        Write-Host "
Processing repository: " -ForegroundColor Yellow
        Set-Location 
        
        # Pull latest changes
        Write-Host "Pulling latest changes in " -ForegroundColor Cyan
        git pull origin master
        Write-Host "Pulled changes in " -ForegroundColor Green
        
        Set-Location 
    } else {
        Write-Host "Repository  not found" -ForegroundColor Red
    }
}

Write-Host "
Batch pull completed!" -ForegroundColor Green
