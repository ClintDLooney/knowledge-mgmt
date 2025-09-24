# Batch push script for multi-repo knowledge management
# Pushes changes to all repository remotes

Write-Host "Starting batch push across all repositories..." -ForegroundColor Green

 = @("a11y-ai", "obsidian-vaults", "chatgpt-projects", "other-projects")
 = Get-Location

foreach ( in ) {
    if (Test-Path ) {
        Write-Host "
Processing repository: " -ForegroundColor Yellow
        Set-Location 
        
        # Check if there are commits to push
         = git status --porcelain
         = git status --porcelain=v1 2> | Select-String "ahead"
        
        if () {
            Write-Host "Pushing changes in " -ForegroundColor Cyan
            git push origin master
            Write-Host "Pushed changes in " -ForegroundColor Green
        } else {
            Write-Host "No changes to push in " -ForegroundColor Gray
        }
        
        Set-Location 
    } else {
        Write-Host "Repository  not found" -ForegroundColor Red
    }
}

Write-Host "
Batch push completed!" -ForegroundColor Green
