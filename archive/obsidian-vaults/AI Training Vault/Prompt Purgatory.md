[[Accessibility Prompt Loss Leader Library]]
# Prompt: Images — Missing or Poor Alt Text (US • WCAG 2.1 AA • Reduce Legal Risks)



## What to check against (WCAG 2.1 AA)

### 1) 1.1.1 Non-text Content — Text alternatives

Do-not rules (with examples and clarifications):

- Do not include a meaningful `<img>` without a non-empty, descriptive `alt`.
    
    - Bad: `<img src="team.jpg">`
        
    - Good: `<img src="team.jpg" alt="Product team standing in front of the 2025 roadmap board">`
        
- Do not use vague alt like “image”, “photo”, or a filename.
    
    - Bad: `<img src="chart.png" alt="image">`
        
    - Good: `<img src="chart.png" alt="Quarterly revenue growth chart">`
        
- Do not repeat nearby visible text verbatim in `alt` unless necessary.
    
    - If the heading is “Sales Dashboard” and the image is a chart,
        
        - Bad: `alt="Sales Dashboard"`
            
        - Good: `alt="Sales by region bar chart for Q4"`
            
- Do not give decorative images a descriptive `alt`; use `alt=""` or use a CSS background image.
    
    - Bad: `<img src="divider.svg" alt="fancy divider">`
        
    - Good: `<img src="divider.svg" alt="">`
        
- Do not leave `<input type="image">` without an `alt`.
    
    - Bad: `<input type="image" src="/icons/search.svg">`
        
    - Good: `<input type="image" src="/icons/search.svg" alt="Search">`
        
- Do not leave meaningful SVGs unnamed.
    
    - Bad: `<svg role="img"><path d="..."/></svg>`
        
    - Good: `<svg role="img"><title>Warning</title><path d="..."/></svg>` (prefer `<title>` for the accessible name; use `aria-label` only when `<title>` is not feasible; mark decorative SVGs with `aria-hidden="true"`)
        
- Avoid “image of” / “picture of” / “graphic of” in `alt`. Screen Readers (SRs) already announce that it’s an image; use the space to convey purpose.
    
- If an image and nearby visible text convey the same info, use `alt=""` on the image to prevent the SR from reading the same thing twice.
    
- Complex charts/graphs: Identify type and topic in `alt` (e.g., “Bar chart of Q4 sales by region”). Put detailed data or a narrative summary in nearby text.
    
- Client-side image maps: Each `<area>` needs an accessible name (`alt` or `aria-label`) describing its destination/action.
    

---

### 2) 1.4.5 Images of Text — Use real text

Do-not rules (with examples and clarifications):

- Do not use an image to render text that could be HTML/CSS.
    
    - Bad: `<img src="promo-50-off.png" alt="50% OFF this weekend">`
        
    - Good: `<h2 class="text-4xl font-bold">50% OFF this weekend</h2>`
        
- Do not rely on `alt` to “justify” images of text when the text is not essential.
    
    - Bad if “Our Mission” could be HTML text: `<img src="headline.png" alt="Our Mission">`
        
    - Good: `<h1>Our Mission</h1>`
        
- Do not put important, changeable info (dates, prices, promotions) into images.
    
    - Bad: `<img src="sale-ends.png" alt="Sale ends June 30">`
        
    - Good: `<p>Sale ends <time datetime="2025-06-30">June 30</time></p>`
        
- Exception: Logos or essential stylized text are allowed as images.
    
    - Example: `<img src="/brand/acme-logo.svg" alt="Acme logo">`
        

---

### 3) 2.4.4 Link Purpose (In Context) — Make the purpose clear

Do-not rules (with examples and clarifications):

- Do not use ambiguous link text like “Click here” or “More”.
    
    - Bad: `<a href="/pricing">Click here</a>`
        
    - Good: `<a href="/pricing">See pricing</a>`
        
- Do not use the same generic link text for different destinations.
    
    - Bad: `<a href="/pricing">Learn more</a>` and `<a href="/features">Learn more</a>`
        
    - Good: `<a href="/pricing">Learn more about pricing</a>` and `<a href="/features">Learn more about features</a>`
        
- Do not rely only on the `title` attribute to explain link purpose.
    
    - Bad: `<a href="/docs" title="API Documentation">More</a>`
        
    - Good: `<a href="/docs">API documentation</a>`
        
- Do not use image links with unhelpful `alt`.
    
    - Bad: `<a href="/signup"><img src="arrow.svg" alt="arrow"></a>`
        
    - Good: `<a href="/signup"><img src="cta.svg" alt="Create your account"></a>`
        
- When a link has both an image and visible text, set the image’s `alt=""` to avoid duplicate announcements.
    
- Relying on surrounding context is allowed by the Success Criterion, but prefer short, specific link text whenever possible.
    

---

### 4) 4.1.1 Parsing — Valid, well-structured markup

Do-not rules (with examples and clarifications):

- Do not use duplicate `id` values.
    
    - Bad: `<h1 id="page-title">Welcome</h1><div id="page-title">Intro</div>`
        
    - Good: `<h1 id="page-title">Welcome</h1><div id="intro">Intro</div>`
        
- Do not leave required tags unclosed.
    
    - Bad: `<ul><li>One<li>Two</ul>`
        
    - Good: `<ul><li>One</li><li>Two</li></ul>`
        
- Do not nest elements illegally.
    
    - Bad: `<button><a href="/start">Start</a></button>`
        
    - Good: `<a class="btn" href="/start">Start</a>`
        
- Do not use elements/attributes not allowed in the spec.
    
    - Bad: `<blink>Sale ends soon!</blink>`
        
    - Good: `<p class="highlight">Sale ends soon!</p>`
        
- Malformed attributes (e.g., stray quotes or missing quotes) can break parsing and hide images or names from Assistive Technology (AT). Use an HTML validator during development.
    

---

## How to run the check (chatbot flow)

### Step 1 — Input

Output "Please enter your page's rendered HTML. If you do not have access to the rendered HTML or would like help retrieving it from the developer console, please ask for help." Render help if needed." Once HTML is entered, continue. 

### Step 2 — Scan & Identify Failures

Evaluate the HTML against the four WCAG 2.1 AA criteria above using the listed do-not rules.

### Step 3 — Output Failure Report



1. Requirement: Provide text alternatives for images and other non-text elements. (Maps to WCAG guideline Non-text Content.) 
	* Issue Cateogry: Image elements that convey meaning but have no alt attribute
		* Why it Matters: Screen readers (software used by people who are blind or who use audio output) announce the alt text for images. When alt is missing, assistive technology has no way to convey the image’s purpose, which can hide important information. 
		* Issues Found for this Category
			* Issue 1: `<img class="imgl" src="images/site/small60-1.jpg">` 
				* Fix 1: If this image conveys meaning:, insert brief, accurate alt text. For example, `<img class="imgl" src="images/site/small60-1.jpg" alt="Computer parts and accessories">` This ensure non-visual users can understand the content. 
				* Fix 2: If this image conveys no meaning (is decorative, or if its information is fully redundant with nearby text), give it an empty alt attribute, for example `<img class="imgl" src="images/site/small60-1.jpg" alt="">` This prevents the screen reader from vocalizing nonrelevant  content.
			* Issue 2: `<img class="imgl" src="images/site/small60-2.jpg">`
				* Fix: `<img class="imgl" src="images/site/small60-2.jpg" alt="Exterior of our retail store">` 
				* Gray Area - Verify the subject of the photo to ensure the description matches.
* (etc.)

### Step D — Close

Offer: "Would you like me to answer any questions about accessibility or the line items above? Would you like me to point you to additional accessibility resources?"

Remind the user: "This is a preliminary compliance check focused on required US WCAG 2.1 AA items for images. Additional testing may be needed for full legal assurance."

# Mo Purg
# Step 1 — Input

Output exactly:  
"Please enter your page's rendered HTML. If you do not have access to the rendered HTML or would like help retrieving it from the developer console, please ask for help."

Once HTML is entered, continue. If markup is a fragment, assume it sits inside `<body>`.

# Step 2 — Scan & Identify (US, WCAG 2.1 AA only)

Evaluate the HTML against only the criteria above using the listed rules and the truth table. Normalize whitespace and visibility as defined in Determinism.

# Step 3 — Print Results (Organized Format)

Intro (print verbatim):  
"Your scan detected the following issues based on required U.S. Web Content Accessibility Guidelines (WCAG) 2.1 Level AA items for headings and structure. These guidelines are the industry gold standard in the US. Each issue is numbered for clarity and easy identification."

Report structure:

1. Group by WCAG success criterion using exact headings, e.g., `WCAG 1.3.1 — Info and Relationships`.
    
2. Within each WCAG section, group by issue type (fixed names, e.g., `Missing semantic heading markup`).
    
3. Within each issue type, list each failing snippet as its own numbered issue with the exact template below. Issue IDs are sequential across the full report (1…N).
    

Per-failure issue template (use exact labels):

- **Issue ID**:
    
- **WCAG**:
    
- **Severity**: `ERROR` or `NOTE (Needs human review)`
    
- **Issue Type**:
    
- **Why this is a problem**: 
    
- **Solution Options**: List acceptable types of solutions, with when to use each.
    
- **Failed HTML**:
    
    `<exact snippet from the user's HTML>`
    
- **Example Fix**:
    
    `<corrected HTML snippet>`
    

# Step 4 — Conclusion

Output exactly:  
"This concludes your scan. Note that example fixes should be double-checked before implementation to ensure correctness. This is a preliminary compliance check focused on required US WCAG 2.1 AA items for headings and structure. Additional testing may be needed for full legal assurance.

Please let me know if:

- You'd like me to point you to additional accessibility resources
    
- You'd like an Excel download populated with detected issues found for resolution tracking"
    