# Knowledge Body Analysis Prompt Template

## Context Loading Prompt

```
I need to process [KNOWLEDGE_BODY_NAME] content for my [BUSINESS_DOMAIN] business. Here's the complete context:

**Project Goal**: Extract business insights, frameworks, and create reusable knowledge processing SOPs from [KNOWLEDGE_BODY_NAME] content.

**Current State**:
- Archive content preserved in [ARCHIVE_LOCATION]
- Processing workspace ready at km-processing/[KNOWLEDGE_BODY_NAME]-copy/
- Learning documentation framework in shared/learning/knowledge-processing/

**Approach**:
1. File-by-file analysis with high detail
2. Topic-by-topic synthesis for pattern recognition
3. Destructive processing in staging area
4. Integration with [TARGET_INTEGRATION_DIRECTORY]

**Key Files to Read First**:
- docs/MASTER_CONTEXT.md - Overall project context
- [BUSINESS_CONTEXT_FILE] - Business context
- km-processing/[KNOWLEDGE_BODY_NAME]-copy/processing-log.md - Current progress
- shared/learning/knowledge-processing/master-sop.md - Processing methodology

**Success Criteria**: Complete conversion to actionable business strategies + comprehensive learning documentation for future knowledge processing.

**Validation**: Pause after each file, at uncertainties, and at red flags for review and guidance.

Ready to continue systematic processing of [KNOWLEDGE_BODY_NAME] content?
```

## File Analysis Prompt

```
Analyze the following file using the systematic approach:

**File**: [FILE_NAME]
**Business Context**: [BUSINESS_DOMAIN] - [SPECIFIC_CONTEXT]
**Processing Phase**: [CURRENT_PHASE]

**Analysis Requirements**:
1. Complete content analysis and categorization
2. Extract all relevant insights and frameworks
3. Identify content that belongs in multiple categories
4. Create detailed extraction summary
5. Flag any red flags or uncertainties
6. Note cross-references to other content

**Output Format**:
- Content Overview
- Categorization (Primary/Secondary/Relevance Score)
- Key Insights and Frameworks
- Cross-References and Integration Points
- Red Flags and Concerns
- Next Steps and Recommendations

**Quality Standards**:
- High detail and knowledge fidelity
- Preserve original meaning and context
- Identify actionable insights
- Note reusable patterns and templates
- Flag any content that seems irrelevant

Please proceed with the analysis and pause for review.
```

## Pattern Recognition Prompt

```
Conduct topic-by-topic synthesis across all processed files:

**Scope**: [PROCESSED_FILES_LIST]
**Business Domain**: [BUSINESS_DOMAIN]
**Synthesis Phase**: [CURRENT_PHASE]

**Synthesis Requirements**:
1. Identify patterns across all processed files
2. Build comprehensive frameworks and SOPs
3. Create cross-reference mappings
4. Identify gaps and opportunities
5. Develop strategic recommendations
6. Create domain-agnostic processing methods

**Output Format**:
- Pattern Analysis Summary
- Comprehensive Framework Documentation
- Cross-Reference Mapping
- Gap Analysis and Opportunities
- Strategic Recommendations
- Domain-Agnostic Methods

**Focus Areas**:
- Business strategy patterns
- Product development frameworks
- Process and methodology insights
- Reusable templates and structures
- Learning and knowledge management

Please proceed with the synthesis and provide comprehensive analysis.
```

## Integration Planning Prompt

```
Plan integration of processed content into business structure:

**Processed Content**: [CONTENT_SUMMARY]
**Target Integration**: [TARGET_DIRECTORY]
**Business Context**: [BUSINESS_DOMAIN]

**Integration Requirements**:
1. Organize content into logical business structure
2. Create comprehensive business strategies
3. Integrate with existing business content
4. Validate all extractions and frameworks
5. Prepare for final approval

**Output Format**:
- Integration Structure Plan
- Content Organization Strategy
- Business Strategy Documentation
- Integration Validation Checklist
- Final Approval Preparation

**Quality Standards**:
- Logical and intuitive organization
- Complete business strategy coverage
- Seamless integration with existing content
- Validation of all extractions
- Ready for immediate business use

Please proceed with the integration planning.
```

## Red Flag Escalation Prompt

```
RED FLAG DETECTED - Immediate consultation required:

**File**: [FILE_NAME]
**Issue Type**: [ISSUE_CATEGORY]
**Severity**: [HIGH/MEDIUM/LOW]
**Description**: [DETAILED_DESCRIPTION]

**Context**:
- Business Domain: [BUSINESS_DOMAIN]
- Processing Phase: [CURRENT_PHASE]
- Impact: [POTENTIAL_IMPACT]

**Options Considered**:
1. [OPTION_1]
2. [OPTION_2]
3. [OPTION_3]

**Recommendation**: [RECOMMENDED_ACTION]
**Rationale**: [REASONING]

**Questions for User**:
1. [QUESTION_1]
2. [QUESTION_2]
3. [QUESTION_3]

Please advise on how to proceed with this issue.
```

## Learning Documentation Prompt

```
Document learning insights from processing session:

**Session**: [SESSION_IDENTIFIER]
**Files Processed**: [FILE_LIST]
**Key Learnings**: [LEARNING_SUMMARY]

**Documentation Requirements**:
1. Methodology insights and improvements
2. Content analysis findings
3. Framework development learnings
4. Business strategy recommendations
5. Future processing improvements

**Output Format**:
- Session Summary
- Methodology Insights
- Content Analysis Findings
- Framework Development Learnings
- Business Strategy Recommendations
- Future Processing Improvements

**Quality Standards**:
- Comprehensive learning capture
- Actionable improvement recommendations
- Reusable methodology insights
- Business value documentation
- Future processing optimization

Please document the learning insights from this session.
```
