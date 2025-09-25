# Prompt: Images — Missing or Poor Alt Text (USA • WCAG 2.1 AA • Reduce Legal Risks)

![[(Component) Lead Magnet Role Section]]

![[(Component) Lead Magnet Scope and Goal]]

![[(Component) Lead Magnet Output Format]]

# (Bespoke) WCAG 2.1 AA Criteria in Scope

## 1) WCAG 1.1.1 Non‑text Content — Text alternatives

**Rules** (deterministic):

- Do not include a meaningful `<img>` without a **non‑empty, descriptive** `alt`. (Alt should be concise, <= 125 characters.)
    
- Avoid vague alt text (e.g., `image`, `photo`, filenames).
    
- If `alt` content is fully redundant with nearby visible text, that alt attribute should instead be empty.
    
- Decorative images must use `alt=""` or be CSS background images (and not be focusable or referenced by ARIA).
    
- `<input type="image">` must have an `alt` that conveys **function**.
    
- **Functional images** (buttons, image links): `alt` must convey **function/destination** (e.g., `Search`, not `Magnifying glass`).
    
- **Image + text link**: if an image and visible text are within the same link, set the image `alt=""` to avoid duplicate accessible names.
    
- **SVG**: When meaningful (`role="img"`, focusable, or inside a link), require a non‑empty accessible name via `<title>`, `aria-label`, or `aria-labelledby` (prefer `<title>`). If decorative, require `aria-hidden="true"` and not focusable.
    
- **Background images**: Do not flag unless they are the sole conveyance of essential information.
    
- **CAPTCHA**: Must provide an alternative modality (e.g., audio) and explanatory text.
    
- **Complex images (charts/graphs)**: `alt` must include **type + topic** (e.g., “Line chart of monthly sales, Jan–Jun 2025”). Provide **equivalent data** in nearby text or a table. Absence is an `ERROR`.
    
- **Client‑side image maps**: Each `<area>` needs an accessible name (`alt`, `aria-label`, or `aria-labelledby`).
    
- If image info is fully duplicated in nearby text (e.g., `figcaption` that serves as the label), allow `alt=""` to avoid duplication.

## 2) WCAG 1.4.5 Images of Text — Use real text

**Rules** (deterministic):

- Do not use images to render text that could be HTML/CSS.
    
- Do not rely on `alt` to convey non‑essential text in images.
    
- Do not embed important, changeable info (e.g., dates, prices) into images.
    
- **Allow** logos or essential stylized branding with appropriate `alt` (e.g. `alt="Microsoft logo")
    
- Heuristics: Without OCR, treat raster detections cautiously—see “Human‑review lane”. Promote to `ERROR` only when unequivocal (e.g., inline SVG `<text>` is present).
    

## 3) WCAG 2.4.4 Link Purpose (In Context)

**Rules** (deterministic):

- Compute the **accessible name** using the Accessible Name and Description Computation order:  
    inner text → `aria-label` → `aria-labelledby` → `title` (last resort).
    
- Ambiguous/generic link text such as: 
    `["here","click here","read more","more","learn more","details","info","this","that","link"]`.
    
- Do not rely only on `title` to explain link purpose.
    
- Do not use the same generic link text for different destinations **within the same context** (same paragraph, list, or table cell group). If identical names point to different `href`s without disambiguating context (e.g., unique `aria-describedby`), flag as `ERROR`.
    
- Image‑only links require meaningful `alt` (function or destination). If link has both image and text, the image `alt` **must be empty**.    

## 4) WCAG 4.1.1 Parsing — Valid, well‑structured markup

**Rules** (deterministic):

- Do not use duplicate `id` values.
    
- Do not leave tags unclosed; do not nest elements illegally; only use spec‑allowed elements/attributes; avoid malformed attributes.
    
- **Accessibility‑critical parsing checks**:  
    a) Duplicate `id` values that are referenced by ARIA (`aria-labelledby`, `aria-describedby`) → `ERROR`.  
    b) Focusable elements with `aria-hidden="true"` → `ERROR` (focusable but hidden via ARIA).

# (Bespoke) False‑Positive Controls (Explicit Exemptions)

- Skip `<img alt="">` when the image is not focusable, not referenced by ARIA, and appears in a decorative context (spacers, purely visual icons).
    
- When a `figure > figcaption` fully conveys the same purpose as the image, allow `alt=""` (document this rationale).
    
- Automated raster “image of text” detection without SVG `<text>`: mark as `NOTE (Needs human review)` instead of `ERROR`.
    

# (Bespoke) Proximity & Context Definitions

- **Nearby** = within the same `figure`, the same table cell, or within **150 characters after** the image in DOM order.
    
- **Same context** (for duplicate link text) = same paragraph, same list (including nested items at the same level), or same table cell group.
    

# (Bespoke) Machine‑Checkable Rule Table (Truth Table)

|Check ID|WCAG|Selector / Condition|Fail when…|Severity|
|---|---|---|---|---|
|IMG-ALT-1|1.1.1|`img:not([alt])` OR `img[alt=""]` where image is functional or conveys info|Missing/empty `alt` on non‑decorative image|ERROR|
|IMG-ALT-2|1.1.1|`input[type="image"]:not([alt])`|No `alt`|ERROR|
|IMG-ALT-3|1.1.1|`a:has(img):not(:has-text)` AND `img[alt=""]`|Image‑only link with empty alt|ERROR|
|IMG-ALT-4|1.1.1|`svg[role="img"], svg[focusable], a svg`|No `<title>`/`aria-label`/`aria-labelledby`|ERROR|
|IMG-DECOR-1|1.1.1|`img[alt=""]`|Image is focusable OR referenced by ARIA|ERROR|
|IMG-COMPLEX-1|1.1.1|`img, svg[role="img"]` identifiable as chart/graph (data-* or filename heuristic)|No nearby equivalent data (per Proximity)|ERROR|
|IMGTEXT-1|1.4.5|`svg text` present|Text rendered as image that could be HTML|ERROR|
|LINK-NAME-1|2.4.4|`a`|Accessible name ∈ ambiguous list|ERROR|
|LINK-NAME-2|2.4.4|Siblings in same context|Same link text → different hrefs without disambiguation|ERROR|
|PARSE-ID-1|4.1.1|any|Duplicate `id` referenced by ARIA|ERROR|
|PARSE-HIDE-1|4.1.1|focusable element with `aria-hidden="true"`|Focusable but hidden via ARIA|ERROR|
![[(Component) Lead Magnet Steps]]

# (Bespoke) Human‑Review Lane (when to use `NOTE (Needs human review)`)

Label the following as `NOTE (Needs human review)` instead of `ERROR`:

- Potential images of text in raster formats (`.png`, `.jpg`, `.gif`) detected heuristically without OCR.
    
- Cases where `alt` duplication vs. useful reinforcement is ambiguous.
    
- Charts/graphs where nearby data **might** be sufficient but proximity is borderline.
    

![[(Component) Lead Magnet Excel Export Spec]]

# (Bespoke) Fixed List of Issue Type Names

Use only these names for `Issue Type` (expand with more as needed but **do not rename**):

- Missing `alt` text on meaningful images
    
- Unhelpful `alt` text (vague or filename)
    
- Functional image missing functional `alt`
    
- Image link has empty/incorrect `alt`
    
- Decorative image not correctly hidden
    
- SVG lacks accessible name
    
- Complex image lacks equivalent data
    
- Image of text used where HTML is possible
    
- Ambiguous link text
    
- Duplicate link text for different destinations
    
- Duplicate `id` referenced by ARIA
    
- Focusable element hidden via ARIA
    
- Malformed/invalid markup affecting accessibility
    

# (Bespoke) Implementation Notes for the Checker (non‑user‑visible)

- Determine line/column by first character of the failing node.
    
- For “nearby” data checks, search in‑order across sibling/descendant text nodes up to the 150‑character threshold or inside the same `figure`/cell.
    
- Record the computed accessible name used for each link in the report (include it in the `Why this is a problem` text when relevant).
    
- For SVG, prefer `<title>` as the name source; fall back to ARIA only if `<title>` absent.