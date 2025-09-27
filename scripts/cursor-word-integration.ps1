# Cursor Word Integration Script
# =============================
# 
# This script provides seamless integration between Cursor and Word documents.
# It automatically extracts, converts, and makes Word documents accessible
# within Cursor's context window.

param(
    [Parameter(Mandatory=$true)]
    [string]$Action,
    
    [Parameter(Mandatory=$false)]
    [string]$FilePath,
    
    [Parameter(Mandatory=$false)]
    [string]$OutputPath,
    
    [Parameter(Mandatory=$false)]
    [string]$Format = "markdown",
    
    [Parameter(Mandatory=$false)]
    [string]$Directory,
    
    [Parameter(Mandatory=$false)]
    [switch]$Summary,
    
    [Parameter(Mandatory=$false)]
    [switch]$OpenInCursor
)

# Configuration
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$WordProcessor = Join-Path $ScriptDir "word-processor.py"
$PythonExe = "python"

# Ensure python-docx is installed
function Test-PythonDocx {
    try {
        $null = & $PythonExe -c "import docx" 2>$null
        return $true
    }
    catch {
        return $false
    }
}

function Install-PythonDocx {
    Write-Host "Installing python-docx..." -ForegroundColor Yellow
    & $PythonExe -m pip install python-docx
    if ($LASTEXITCODE -eq 0) {
        Write-Host "python-docx installed successfully!" -ForegroundColor Green
        return $true
    } else {
        Write-Host "Failed to install python-docx" -ForegroundColor Red
        return $false
    }
}

function Show-Usage {
    Write-Host @"
Cursor Word Integration
======================

USAGE:
    .\cursor-word-integration.ps1 -Action <action> [options]

ACTIONS:
    extract     Extract text from Word document
    convert     Convert Word document to markdown/text
    batch       Process multiple Word documents
    analyze     Analyze document structure and content
    install     Install required dependencies
    help        Show this help message

EXAMPLES:
    # Extract text from a Word document
    .\cursor-word-integration.ps1 -Action extract -FilePath "document.docx"
    
    # Convert to markdown and open in Cursor
    .\cursor-word-integration.ps1 -Action convert -FilePath "document.docx" -Format markdown -OpenInCursor
    
    # Batch process directory
    .\cursor-word-integration.ps1 -Action batch -Directory ".\documents" -OutputPath ".\markdown"
    
    # Analyze document with summary
    .\cursor-word-integration.ps1 -Action analyze -FilePath "document.docx" -Summary
    
    # Install dependencies
    .\cursor-word-integration.ps1 -Action install

"@ -ForegroundColor Cyan
}

function Invoke-WordExtract {
    param(
        [string]$FilePath,
        [string]$OutputPath,
        [string]$Format
    )
    
    if (-not (Test-Path $FilePath)) {
        Write-Host "Error: File not found: $FilePath" -ForegroundColor Red
        return
    }
    
    $args = @("extract", $FilePath, "--format", $Format)
    if ($OutputPath) {
        $args += "--output", $OutputPath
    }
    
    & $PythonExe $WordProcessor @args
}

function Invoke-WordConvert {
    param(
        [string]$FilePath,
        [string]$OutputPath,
        [string]$Format,
        [switch]$OpenInCursor
    )
    
    if (-not (Test-Path $FilePath)) {
        Write-Host "Error: File not found: $FilePath" -ForegroundColor Red
        return
    }
    
    # Generate output path if not provided
    if (-not $OutputPath) {
        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($FilePath)
        $extension = if ($Format -eq "markdown") { "md" } else { "txt" }
        $OutputPath = Join-Path (Split-Path $FilePath) "$baseName.$extension"
    }
    
    $args = @("convert", $FilePath, "--format", $Format, "--output", $OutputPath)
    
    Write-Host "Converting $FilePath to $Format..." -ForegroundColor Yellow
    & $PythonExe $WordProcessor @args
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Conversion successful!" -ForegroundColor Green
        Write-Host "Output saved to: $OutputPath" -ForegroundColor Cyan
        
        if ($OpenInCursor) {
            Write-Host "Opening in Cursor..." -ForegroundColor Yellow
            & code $OutputPath
        }
    } else {
        Write-Host "Conversion failed!" -ForegroundColor Red
    }
}

function Invoke-WordBatch {
    param(
        [string]$Directory,
        [string]$OutputPath
    )
    
    if (-not (Test-Path $Directory)) {
        Write-Host "Error: Directory not found: $Directory" -ForegroundColor Red
        return
    }
    
    $args = @("batch", $Directory)
    if ($OutputPath) {
        $args += "--output", $OutputPath
    }
    
    Write-Host "Processing Word documents in: $Directory" -ForegroundColor Yellow
    & $PythonExe $WordProcessor @args
}

function Invoke-WordAnalyze {
    param(
        [string]$FilePath,
        [switch]$Summary,
        [string]$OutputPath
    )
    
    if (-not (Test-Path $FilePath)) {
        Write-Host "Error: File not found: $FilePath" -ForegroundColor Red
        return
    }
    
    $args = @("analyze", $FilePath)
    if ($Summary) {
        $args += "--summary"
    }
    if ($OutputPath) {
        $args += "--output", $OutputPath
    }
    
    Write-Host "Analyzing document: $FilePath" -ForegroundColor Yellow
    & $PythonExe $WordProcessor @args
}

function Invoke-WordInstall {
    Write-Host "Checking dependencies..." -ForegroundColor Yellow
    
    if (Test-PythonDocx) {
        Write-Host "python-docx is already installed!" -ForegroundColor Green
    } else {
        Write-Host "python-docx not found. Installing..." -ForegroundColor Yellow
        if (Install-PythonDocx) {
            Write-Host "Installation complete!" -ForegroundColor Green
        } else {
            Write-Host "Installation failed!" -ForegroundColor Red
            return
        }
    }
    
    Write-Host "`nCursor Word Integration is ready to use!" -ForegroundColor Green
    Write-Host "Try: .\cursor-word-integration.ps1 -Action help" -ForegroundColor Cyan
}

# Main execution
switch ($Action.ToLower()) {
    "extract" {
        if (-not $FilePath) {
            Write-Host "Error: FilePath is required for extract action" -ForegroundColor Red
            Show-Usage
            exit 1
        }
        
        if (-not (Test-PythonDocx)) {
            Write-Host "Error: python-docx not installed. Run: .\cursor-word-integration.ps1 -Action install" -ForegroundColor Red
            exit 1
        }
        
        Invoke-WordExtract -FilePath $FilePath -OutputPath $OutputPath -Format $Format
    }
    
    "convert" {
        if (-not $FilePath) {
            Write-Host "Error: FilePath is required for convert action" -ForegroundColor Red
            Show-Usage
            exit 1
        }
        
        if (-not (Test-PythonDocx)) {
            Write-Host "Error: python-docx not installed. Run: .\cursor-word-integration.ps1 -Action install" -ForegroundColor Red
            exit 1
        }
        
        Invoke-WordConvert -FilePath $FilePath -OutputPath $OutputPath -Format $Format -OpenInCursor:$OpenInCursor
    }
    
    "batch" {
        if (-not $Directory) {
            Write-Host "Error: Directory is required for batch action" -ForegroundColor Red
            Show-Usage
            exit 1
        }
        
        if (-not (Test-PythonDocx)) {
            Write-Host "Error: python-docx not installed. Run: .\cursor-word-integration.ps1 -Action install" -ForegroundColor Red
            exit 1
        }
        
        Invoke-WordBatch -Directory $Directory -OutputPath $OutputPath
    }
    
    "analyze" {
        if (-not $FilePath) {
            Write-Host "Error: FilePath is required for analyze action" -ForegroundColor Red
            Show-Usage
            exit 1
        }
        
        if (-not (Test-PythonDocx)) {
            Write-Host "Error: python-docx not installed. Run: .\cursor-word-integration.ps1 -Action install" -ForegroundColor Red
            exit 1
        }
        
        Invoke-WordAnalyze -FilePath $FilePath -Summary:$Summary -OutputPath $OutputPath
    }
    
    "install" {
        Invoke-WordInstall
    }
    
    "help" {
        Show-Usage
    }
    
    default {
        Write-Host "Error: Unknown action: $Action" -ForegroundColor Red
        Show-Usage
        exit 1
    }
}
