# Prompt: Headings & Structure (USA • WCAG 2.1 AA • Reduce Legal Risks)

![[(Component) Lead Magnet Role Section]]

![[(Component) Lead Magnet Scope and Goal]]

![[(Component) Lead Magnet Output Format]]

# WCAG 2.1 AA Criteria in Scope

## 1) WCAG 1.3.1 Info and Relationships

Rules:

- Use native semantic HTML heading elements (`<h1>`–`<h6>`) to represent headings, not visual styling alone.
    
- Headings must be programmatically identifiable — not just bold or larger font text.
    
- Heading hierarchy must be logical and consistent; do not skip levels (e.g., `<h2>` → `<h4>`).
    
- Provide a single `<h1>` per page or logical document scope.
    
- Use ARIA `role="heading"` with `aria-level` only when native headings are not possible (last resort).
    
- Do not repeat identical headings for different sections unless content is the same.
    

## 2) WCAG 2.4.6 Headings and Labels

Rules (deterministic):

- Headings must be clear and descriptive of the section content.
    
- Avoid vague headings (e.g., “Introduction”, “More info”) when more specificity is possible.
    
- Headings should be concise; avoid overly long headings that reduce scannability.
    
- Headings introducing distinct sections must be unique within the same context.
    
- Maintain consistent heading levels for similar section types across the site.
    

# False-Positive Controls (Explicit Exemptions)

- Decorative text styled like a heading but intended purely for visual effect can be ignored if not conveying section structure.
    
- Skipped heading levels may be acceptable inside specialized widgets where levels are managed internally (document this rationale).
    
- Multiple `<h1>` elements are allowed in HTML5 sectioning contexts if each is at the top of its section.
    

# Proximity & Context Definitions

- Same context (for duplicate heading checks) = same visual grouping, section, or region landmark.
    

# Machine-Checkable Rule Table (Truth Table)

|Check ID|WCAG|Selector / Condition|Fail when…|Severity|
|---|---|---|---|---|
|HEAD-SEM-1|1.3.1|Text visually styled as heading without `<h1>`–`<h6>` or `role="heading"`|No semantic heading markup|ERROR|
|HEAD-ORDER-1|1.3.1|`<hN>` followed by `<hM>` where M > N+1|Skipped heading level|ERROR|
|HEAD-DESC-1|2.4.6|`h1`–`h6` text|Heading text is vague or non-descriptive|ERROR|
|HEAD-UNIQUE-1|2.4.6|Two or more headings in same context have identical text but different content|Duplicate heading text causing confusion|ERROR|
|HEAD-LONG-1|2.4.6|`h1`–`h6` text length > 150 characters|Excessively long heading|NOTE (Needs human review)|

![[(Component) Lead Magnet Steps]]

# Human-Review Lane (when to use `NOTE (Needs human review)`)

Label the following as `NOTE (Needs human review)` instead of `ERROR`:

- Headings that may be decorative but are visually prominent.
    
- Excessively long headings (>150 characters) — may be acceptable in some contexts.
    
- Ambiguity in heading descriptiveness.
    

![[(Component) Lead Magnet Excel Export Spec]]

# Fixed List of Issue Type Names

Use only these names for `Issue Type` (expand as needed but do not rename):

- Missing semantic heading markup
    
- Skipped heading level
    
- Vague/non-descriptive heading
    
- Duplicate heading text in same context
    
- Excessively long heading
    

# Implementation Notes for the Checker (non-user-visible)

- Determine line/column by first character of the failing node.
    
- For heading order, compare numeric values of consecutive headings in DOM order.
    
- Consider HTML5 sectioning context rules for multiple `<h1>` allowances.
    

---