
Generate a WCAG Scan Context component for a WCAG 2.1 AA accessibility prompt focused on the WCAG guideline(s) specified at the end of this prompt. 
Use the target WCAGs' Sufficient Techniques and Failure Conditions (for reference, https://www.w3.org/WAI/WCAG21/Techniques/) to create deterministic rules. Structure the output as follows:

WCAG Scan Context for [WCAG name]

- List the criterion ([ID], [Title]).
- Provide deterministic rules derived from Sufficient Techniques and Failure Conditions, using CSS/JS selectors where applicable. Specify severity (ERROR for clear violations, NOTE for ambiguous cases). False-Positive Controls: List exemptions to avoid over-flagging (e.g., browser defaults meeting requirements). Contextual Definitions: Define technical terms which may be ambiguous, if relevant to the criterion. Machine-Checkable Rule Table: Create a table with columns: Check ID, WCAG, Selector / Condition, Fail when…, Severity. Base on rules above. Human-Review Lane: List cases to mark as NOTE (Needs human review) instead of ERROR (e.g., ambiguous cases needing manual verification). Issue Type Names: Provide specific, fixed names for issue types (e.g., Missing focus indicator). Do not rename. Implementation Notes (non-user-visible): Provide technical instructions for the checker (e.g., line/column detection, specific logic for selectors).

Constraints:

- Align with WCAG 2.1 AA only[](https://www.w3.org/TR/WCAG21/).
- Use deterministic, testable rules with CSS/JS selectors where possible.
- Match the technical style, detail, detail level, tone, and structure of the following example: [Insert the WCAG Scan Context from the Images prompt above]
- Ensure rules are actionable, avoid vague terms, and assign severity (ERROR or NOTE).
- Reference Sufficient Techniques and Failure Conditions explicitly (e.g., G195 for 2.4.7).
# Example Input
Generate WCAG prompt context for a scan of the following WCAG: 

# Example Output
## WCAG Scan Context (Images — Missing or Poor Alt Text)

WCAG 2.1 AA Criteria:

- 1.1.1 Non-text Content — Text alternatives:
    - Meaningful <img> must have non-empty, descriptive alt (<= 125 characters).
    - Avoid vague alt text (e.g., image, photo, filenames).
    - If alt is redundant with nearby visible text, use alt="".
    - Decorative images: Use alt="" or CSS background images (not focusable, not ARIA-referenced).
    - : alt must convey function.
    - Functional images (buttons, image links): alt must convey function/destination (e.g., Search, not Magnifying glass).
    - Image + text link: Image alt="" to avoid duplicate accessible names.
    - SVG (meaningful, role="img", focusable, or in link): Require non-empty accessible name via `<title>`, aria-label, or aria-labelledby (prefer `<title>`). Decorative SVG: Use aria-hidden="true", not focusable.
    - Background images: Do not flag unless sole conveyance of essential information.
    - CAPTCHA: Must provide alternative modality (e.g., audio) and explanatory text.
    - Complex images (charts/graphs): alt must include type + topic (e.g., “Line chart of monthly sales, Jan–Jun 2025”). Equivalent data in nearby text or table required (absence is ERROR).
    - Client-side image maps: Each <area> needs accessible name (alt, aria-label, or aria-labelledby).
    - If image info duplicates nearby text (e.g., figcaption), allow alt="".
- 1.4.5 Images of Text — Use real text:
    - Do not use images for text renderable by HTML/CSS.
    - Do not rely on alt for non-essential text in images.
    - Do not embed important, changeable info (e.g., dates, prices) in images.
    - Allow logos or stylized branding with appropriate alt (e.g., alt="Microsoft logo").
    - Heuristics: Without OCR, treat raster text detections cautiously (see Human-Review Lane). Promote to ERROR only for unequivocal cases (e.g., SVG `<text>` present).`</text>`
- 2.4.4 Link Purpose (In Context):
    - Compute accessible name: inner text → aria-label → aria-labelledby → title (last resort).
    - Avoid ambiguous link text: ["here", "click here", "read more", "more", "learn more", "details", "info", "this", "that", "link"].
    - Do not rely only on title for link purpose.
    - Avoid same generic link text for different destinations in same context (same paragraph, list, or table cell group). Flag as ERROR if identical names point to different hrefs without disambiguation (e.g., aria-describedby).
    - Image-only links: Require meaningful alt (function/destination). Image + text links: Image alt must be empty.
- 4.1.1 Parsing — Valid, well-structured markup:
    - No duplicate id values.
    - No unclosed tags, illegal nesting, non-spec elements/attributes, or malformed attributes.
    - Accessibility-critical checks:
        - Duplicate id values referenced by ARIA (aria-labelledby, aria-describedby) → ERROR.
        - Focusable elements with aria-hidden="true" → ERROR.

False-Positive Controls:

- Skip `<img alt="">` if not focusable, not ARIA-referenced, and in decorative context (e.g., spacers, visual icons).
- Allow alt="" if figure > figcaption fully conveys image purpose (document rationale).
- Raster “image of text” detection without SVG <text>: Mark as NOTE instead of ERROR.</text>

Proximity & Context Definitions:

- Nearby: Within same figure, table cell, or 150 characters after image in DOM order.
- Same context: Same paragraph, list (including nested items at same level), or table cell group.

Machine-Checkable Rule Table:

|Check ID|WCAG|Selector / Condition|Fail when…|Severity|
|---|---|---|---|---|
|IMG-ALT-1|1.1.1|img:not([alt]) OR img[alt=""] (functional/info)|Missing/empty alt on non-decorative image|ERROR|
|IMG-ALT-2|1.1.1|input[type="image"]:not([alt])|No alt|ERROR|
|IMG-ALT-3|1.1.1|a:has(img):not(:has-text) AND img[alt=""]|Image-only link with empty alt|ERROR|
|IMG-ALT-4|1.1.1|svg[role="img"], svg[focusable], a svg|No <title>/aria-label/aria-labelledby|ERROR|
|IMG-DECOR-1|1.1.1|img[alt=""]|Image is focusable OR referenced by ARIA|ERROR|
|IMG-COMPLEX-1|1.1.1|img, svg[role="img"] (chart/graph via data-* or filename)|No nearby equivalent data (per Proximity)|ERROR|
|IMGTEXT-1|1.4.5|svg text present|Text rendered as image that could be HTML|ERROR|
|LINK-NAME-1|2.4.4|a|Accessible name in ambiguous list|ERROR|
|LINK-NAME-2|2.4.4|Siblings in same context|Same link text → different hrefs without disambiguation|ERROR|
|PARSE-ID-1|4.1.1|any|Duplicate id referenced by ARIA|ERROR|
|PARSE-HIDE-1|4.1.1|focusable element with aria-hidden="true"|Focusable but hidden via ARIA|ERROR|

Human-Review Lane:

- Raster images (.png, .jpg, .gif) detected as text heuristically without OCR: Mark as NOTE.
- Ambiguous alt duplication vs. reinforcement cases: Mark as NOTE.
- Charts/graphs with borderline sufficient nearby data: Mark as NOTE.

Issue Type Names:

- Missing alt text on meaningful images
- Unhelpful alt text (vague or filename)
- Functional image missing functional alt
- Image link has empty/incorrect alt
- Decorative image not correctly hidden
- SVG lacks accessible name
- Complex image lacks equivalent data
- Image of text used where HTML is possible
- Ambiguous link text
- Duplicate link text for different destinations
- Duplicate id referenced by ARIA
- Focusable element hidden via ARIA
- Malformed/invalid markup affecting accessibility

Implementation Notes (non-user-visible):

- Determine line/column by first character of failing node.
- For “nearby” checks, search in-order across sibling/descendant text nodes up to 150-character threshold or within same figure/cell.
- Record computed accessible name for links in report (include in Why this is a problem).
- For SVG, prefer `<title>`; fall back to ARIA if <title> absent.

# Actual Input
