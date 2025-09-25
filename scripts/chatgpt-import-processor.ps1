# ChatGPT Import Processing Script
# Processes ChatGPT exports and organizes content for master knowledge base

param(
    [string]$ImportPath = "chatgpt-imports",
    [string]$OutputPath = "processed-content",
    [switch]$CreateStructure = $true
)

Write-Host "=== CHATGPT IMPORT PROCESSOR ===" -ForegroundColor Green
Write-Host "Import Path: $ImportPath" -ForegroundColor Yellow
Write-Host "Output Path: $OutputPath" -ForegroundColor Yellow
Write-Host ""

if ($CreateStructure) {
    # Create directory structure
    $Directories = @(
        "$ImportPath/raw-exports",
        "$ImportPath/processed/extracted-insights",
        "$ImportPath/processed/organized-content",
        "$ImportPath/processed/archived-artifacts",
        "$OutputPath/insights",
        "$OutputPath/content",
        "$OutputPath/archives"
    )
    
    foreach ($Dir in $Directories) {
        if (-not (Test-Path $Dir)) {
            New-Item -ItemType Directory -Path $Dir -Force
            Write-Host "Created: $Dir" -ForegroundColor Cyan
        }
    }
}

# Generate processing instructions
$ProcessingInstructions = @"
# ChatGPT Content Processing Instructions

## Phase 1: Content Analysis
For each imported file, analyze and extract:

### Chat History Analysis
- **Project Context**: What was the main project/goal?
- **Key Decisions**: Important decisions made during conversations
- **Technical Insights**: Code, solutions, or technical approaches discussed
- **Learning Points**: New skills, concepts, or methodologies learned
- **Current State**: What was the final state/status of the project?
- **Next Steps**: What were the planned next actions?

### Canvas Content Analysis
- **Visual Elements**: Diagrams, flowcharts, mind maps
- **Structured Information**: Lists, tables, organized data
- **Creative Outputs**: Designs, wireframes, mockups
- **Process Flows**: Workflows, procedures, methodologies
- **Reference Materials**: Links, resources, documentation

## Phase 2: Content Categorization
Organize extracted content into:

### By Content Type
- **Prompts & SOPs** → `shared/prompts/`
- **Learning Materials** → `shared/learning/`
- **Templates** → `shared/templates/`
- **Business Content** → `a11y-ai/business-mgmt/`
- **Technical Content** → Project-specific folders
- **Documentation** → `docs/`

### By Project Relevance
- **A11y AI Related** → `a11y-ai/` subfolders
- **Knowledge Management** → `shared/` subfolders
- **Other Projects** → `other-projects/` or new project folders
- **General Learning** → `shared/learning/`

### By Urgency/Priority
- **Active Projects** → Current project folders
- **Future Ideas** → `shared/ideas/` or `other-projects/`
- **Archived Content** → `processed/archived-artifacts/`

## Phase 3: Content Processing Commands

### For Cursor AI Processing
Use these prompts to process each file:

\`\`\`
Analyze this ChatGPT export file and extract:

1. **Project Context**: What was the main project/goal?
2. **Key Decisions**: Important decisions made
3. **Technical Insights**: Code, solutions, approaches
4. **Learning Points**: New skills/concepts learned
5. **Current State**: Final project status
6. **Next Steps**: Planned actions
7. **Content Categories**: What type of content is this?
8. **Target Location**: Where should this content be organized?

Provide output in structured format for easy processing.
\`\`\`

### Batch Processing
Process multiple files with:
\`\`\`
Process all files in the chatgpt-imports/raw-exports/ directory:

1. Analyze each file for content type and relevance
2. Extract key insights and decisions
3. Categorize content by type and project relevance
4. Suggest optimal organization structure
5. Create migration plan for content distribution
6. Identify duplicate or overlapping content
7. Recommend content consolidation opportunities

Output: Comprehensive analysis and migration plan
\`\`\`

## Phase 4: Content Migration
After analysis, execute migration:

1. **Create target directories** based on analysis
2. **Move content** using git mv (preserve history)
3. **Update references** across all files
4. **Create index files** for easy navigation
5. **Archive original files** in organized structure

## Phase 5: Quality Assurance
- **Verify all content** is properly categorized
- **Check for broken references** or missing content
- **Test discoverability** of reorganized content
- **Update documentation** to reflect new structure
- **Create navigation aids** for complex content

## Expected Outcomes
- **Organized Knowledge Base**: Content logically structured by topic/function
- **Preserved History**: All original content archived but accessible
- **Improved Discoverability**: Related content grouped together
- **Reduced Duplication**: Consolidated similar content
- **Better Context**: Clear project states and next steps
- **Scalable Structure**: Easy to add new content in future

## Risk Mitigation
- **Backup Everything**: Keep original files in archives
- **Incremental Processing**: Process in small batches
- **Test References**: Verify all links work after migration
- **Rollback Plan**: Keep original structure in git history
"@

# Save processing instructions
$InstructionsFile = "$ImportPath/processing-instructions.md"
Set-Content -Path $InstructionsFile -Value $ProcessingInstructions

Write-Host "=== PROCESSING SETUP COMPLETE ===" -ForegroundColor Green
Write-Host "Instructions saved to: $InstructionsFile" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Yellow
Write-Host "1. Export your ChatGPT content to: $ImportPath/raw-exports/" -ForegroundColor White
Write-Host "2. Organize by project: project-name/chat-001.docx, canvas-001.docx" -ForegroundColor White
Write-Host "3. Run this script again to generate processing plan" -ForegroundColor White
Write-Host "4. Use Cursor to process content with provided instructions" -ForegroundColor White
Write-Host ""
Write-Host "Directory structure created in: $ImportPath" -ForegroundColor Cyan
