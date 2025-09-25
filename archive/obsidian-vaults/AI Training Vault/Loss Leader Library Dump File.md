### 1️⃣ ChatGPT Custom Instructions Version

**Custom Instructions - "How would you like ChatGPT to respond?"**

> When I ask you to review a PDF or document for accessibility compliance (especially WCAG 2.1 SC 1.3.1 or PDF/UA), first ask me to clarify:
> 
> 1. Country/jurisdiction (e.g., US/Section 508, Canada/AODA, EU/EN 301 549)
>     
> 2. My role (author, editor, dev, remediator, auditor, etc.)
>     
> 3. My goal for the review (authoring guidance, quick fixes, procurement pass/fail, automated remediation plan, etc.)
>     
> 4. Level of detail wanted (broad issues, detailed blow-by-blow, hybrid)
>     
> 5. Tools I plan to use (Acrobat Pro, Word, PAC, axe, Equidox, etc.)
>     
> 
> After clarifying these, review the document’s structure tree, and:
> 
> - Identify whether headings are correctly tagged and nested
>     
> - Detect skipped levels or inconsistencies
>     
> - Provide actionable fixes, using correct technical terms for my role
>     
> - Suggest both low-effort and high-effort options where possible
>     
> - Warn if automated remediation would be difficult
>     
> 
> If the PDF is too long, break responses into parts and offer to continue.

---

### 2️⃣ Claude/Gemini-Friendly Version (Portable Prompt)

"Please review this PDF’s semantic heading structure for conformance with WCAG 2.1 SC 1.3.1 (Info & Relationships), PDF/UA, and relevant local accessibility laws.

Before analyzing, please first ask me these five questions to clarify context:

1. What country or jurisdiction is this for? (Section 508, EN 301 549, AODA, etc.)
    
2. What is my role? (Author, developer, editor, auditor, etc.)
    
3. What is my goal? (Immediate fixes? Procurement report? Template guidance?)
    
4. What level of detail do I want? (Detailed itemization or broad issues?)
    
5. What remediation tools will I use? (Acrobat, Word, Equidox, axe, etc.)
    

After getting these answers, analyze the PDF’s structure tree (not just visual styling), and:

- Identify if headings are properly tagged and logically nested
    
- Find skipped levels or inconsistencies
    
- Provide actionable improvements fitting my role and goals
    
- Offer low- and high-effort remediation paths
    
- Highlight any issues that would block automated remediation
    

If response would exceed context window, break output into smaller parts and offer to continue."

---

### 3️⃣ Boilerplate + Fallback Version (Universal Prompt)

"Review this PDF’s semantic heading structure under WCAG 2.1 SC 1.3.1 and PDF/UA. First, please ask these five questions to clarify my context:

1. Country/jurisdiction?
    
2. My role?
    
3. My goal for this review?
    
4. Detail level desired?
    
5. Tools to be used for remediation?
    

After clarifying, analyze the PDF structure tree and report:

- Heading tagging/nesting quality
    
- Skipped heading levels
    
- Consistency issues
    
- Actionable fixes appropriate to my context
    
- Easy vs. hard remediation options
    
- Automation blockers
    

If token limits or PDF length are an issue, pause and ask me whether to:

- Break response into parts
    
- Prioritize a high-level summary first
    
- Focus only on major issues and skip itemized detail"
    

---

If you want, I can also provide versions tailored for:

- **Team training docs**
    
- **Vendor evaluation RFQs**
    
- **Automated accessibility workflows (Equidox, axe, etc.)**
    
- **Policy/standard-setting (for procurement officers)**
    

Just let me know!

## Freebie Prompt Library

A growing collection of ready-to-use AI prompts, designed to help users explore creative, professional, and personal applications of AI.

---

### Table of Contents

1. Creativity & Writing
    
2. Business & Productivity
    
3. Learning & Personal Growth
    
4. Fun & Exploration
    
5. Community Contributions
    

---

### 1. Creativity & Writing

**Prompt: Story Starter Generator**  
"Give me three unique story starters for a [fantasy / sci-fi / mystery / romance / historical fiction] story."

**Prompt: Poetry Assistant**  
"Help me write a poem about [love / nature / resilience / time / friendship] in the style of [Shakespeare / Emily Dickinson / modern free verse]."

**Prompt: Character Builder**  
"Create a detailed character profile for a [hero / anti-hero / villain] in a [fantasy / cyberpunk / noir / contemporary] setting."

---

### 2. Business & Productivity

**Prompt: Email Drafting**  
"Draft a professional email to [client / colleague / manager] about [project update / meeting follow-up / request for feedback]."

**Prompt: Brainstorming Ideas**  
"Generate a list of creative ideas for [marketing campaign / product launch / team-building activity]."

**Prompt: Meeting Summary**  
"Summarize the key points and action items from this meeting transcript: [paste transcript here]."

---

### 3. Learning & Personal Growth

**Prompt: Language Practice**  
"Help me practice conversational [Spanish / French / Japanese / Mandarin] by simulating a casual dialogue."

**Prompt: Study Coach**  
"Quiz me on key concepts from [subject / topic / textbook chapter]."

**Prompt: Goal Planner**  
"Help me create a step-by-step plan to achieve my goal of [goal description]."

---

### 4. Fun & Exploration

**Prompt: Trivia Game**  
"Ask me 10 trivia questions about [movies / science / history / pop culture]."

**Prompt: Adventure Scenario**  
"Describe an interactive adventure where I play as a [detective / explorer / wizard / astronaut]."

**Prompt: Personality Quiz**  
"Create a fun personality quiz to reveal what kind of [animal / traveler / mythical creature] I am."

---

### 5. Community Contributions

_This section is reserved for prompts shared by community members. To contribute, please submit your favorite prompt idea to the team!_

## **Freebie Prompt Library Draft** **"10 AI Prompts to Instantly Improve Document Accessibility"**

---

**Cover Title:** "10 AI Prompts to Instantly Improve Document Accessibility" A Free Prompt Library by [Your Name]

**Intro / How to Use:** This free prompt library will help you use AI tools (such as ChatGPT, Claude, Gemini) to quickly identify and address common accessibility issues in digital documents, aligned with WCAG 2.1 and 2.2 standards. These prompts are designed for content creators, educators, instructional designers, developers, and accessibility advocates. Copy and paste the prompts into your preferred AI tool and adjust as needed for your content.

Remember: AI can speed up accessibility work, but human review is still required!

---

**Prompt 1:** "Review the following PDF or document text for correct semantic heading structure (WCAG 1.3.1: Info and Relationships). Identify if heading levels are nested properly and suggest improvements."

**Prompt 2:** "Identify any images in the document that are missing descriptive alt text (WCAG 1.1.1: Non-text Content) and suggest appropriate, concise alt text for each image."

**Prompt 3:** "Scan this document and flag any multimedia elements (video, audio) that may lack captions or transcripts (WCAG 1.2.2: Captions - Prerecorded; WCAG 1.2.1: Audio-only and Video-only - Prerecorded). Provide recommendations for compliance."

**Prompt 4:** "Analyze the document text and background colors for sufficient color contrast (WCAG 1.4.3: Contrast - Minimum, 1.4.11: Non-text Contrast). Flag any combinations that fall below recommended contrast ratios and suggest adjustments."

**Prompt 5:** "Review all tables in the document to ensure they have proper markup, including header cells (WCAG 1.3.1: Info and Relationships) and logical reading order. Identify merged cells or layout tables used improperly and recommend corrections."

**Prompt 6:** "Generate clear and meaningful alt text for this image [insert image description or image link], ensuring it meets WCAG 1.1.1: Non-text Content success criteria."

**Prompt 7:** "Review all hyperlinks in this document for descriptive link text (WCAG 2.4.4: Link Purpose - In Context). Flag any vague or ambiguous links such as 'click here' or 'read more' and suggest clearer alternatives."

**Prompt 8:** "Analyze the document’s reading order, particularly in PDF format (WCAG 1.3.2: Meaningful Sequence), and identify any issues that may confuse screen reader users. Recommend corrections to ensure logical navigation."

**Prompt 9:** "Check this LMS course content for potential accessibility barriers, including missing alt text, improper heading hierarchy, unclear instructions, or inconsistent navigation (WCAG 3.2.3: Consistent Navigation; 1.3.1: Info and Relationships). Provide actionable recommendations."

**Prompt 10:** "Summarize accessibility issues found in this document, mapped to specific WCAG success criteria where applicable, and categorized by severity (high, medium, low)."

---

**Bonus Tips:** When AI Works Well:

- Spotting common structural issues (headings, tables)
    
- Generating draft alt text
    
- Flagging potential risks quickly (color contrast, multimedia captions)
    

When Human Review Is Needed:

- Nuanced decisions about meaning and clarity of alt text and link text
    
- Complex layouts or highly interactive content
    
- Verification of full WCAG compliance in edge cases
    

---

**Call to Action:** "Want even more AI prompts and workflows for accessibility? Check out my full AI Prompt Pack for Accessibility Workflows and join my email list for more tips and tools!"

---

This can easily be formatted into both:

1. PDF (formatted document)
    
2. Notion page (copyable prompt library)
    

Ready to expand/iterate when you are!
