[[Paid Creators Lead Magnet Accessibility Prompt 1]]
[[Paid Creators Lead Magnet Accessibility Prompt 2]]
[[Paid Creators Lead Magnet Accessibility Prompt 3]]
[[Paid Creators Lead Magnet Accessibility Prompt 4]]
[[Paid Creators Lead Magnet Accessibility Prompt 5]]
[[Paid Creators Lead Magnet Accessibility Prompt 6]]
[[Paid Creators Lead Magnet Accessibility Prompt 7]]
[[Paid Creators Lead Magnet Accessibility Prompt 8]]
[[Paid Creators Lead Magnet Accessibility Prompt 9]]
[[Paid Creators Lead Magnet Accessibility Prompt 10]]

# 1. Images — Missing or Poor Alt Text

**Goal:** Safe fixes for non-text content. WCAG 2.2 SC 1.1.1.  
**Prompt:**  
You are my accessibility coach. Step back first and briefly state the best approach for writing alt text per WCAG 2.2 SC 1.1.1 (describe purpose, not pixels; decorative = empty alt). Then analyze the HTML I paste for images and meaningful SVGs. List issues such as missing, empty, or vague alt text, and images of text. Propose concise, purpose-focused alt text (125 characters or less). For decorative images, recommend alt="" and when to add aria-hidden="true". Provide copy-ready replacements and a one-line “why it helps” for each.  
Example fixes:=
- Bad: alt="button" → Good: alt="Submit order"
- Bad: alt="img_1234" → Good: alt="Quarterly revenue chart"
- Decorative flourish: alt=""
---

# 2. Color Contrast

**Goal:** Identify low contrast; suggest passable alternatives. WCAG 2.2 SC 1.4.3 AA.  
**Prompt:**  
Step back and summarize how to check text contrast for WCAG 2.2 SC 1.4.3 (normal 4.5:1, large/bold 3:1). From the HTML or CSS I paste, list any likely low-contrast text. For each, suggest 2–3 color fixes that meet AA while keeping the original feel. Note when a manual check is needed.

---

# 3. Forms — Missing or Unclear Labels

**Goal:** Every form control has a clear, programmatic name. WCAG 2.2 SC 3.3.2 and 4.1.2.  
**Prompt:**  
Step back and explain the preferred order: visible label with for/id, else aria-labelledby, last resort aria-label. Scan the form HTML I paste. Flag controls with no label, placeholder-as-label, or mismatched for/id. Provide fixes including label text suggestions and corrected attributes.  
Example fixes:

- Bad: `<input id="email" placeholder="Email">` → Good: `<label for="email">Email</label><input id="email">`
    
- Radio/checkbox groups: each option needs its own visible label.
    

---

# 4. Links — Empty or Vague Text

**Goal:** Link purpose clear from text/context. WCAG 2.4.4.  
**Prompt:**  
Step back and state the rule for SC 2.4.4: link purpose should be clear from the link text alone. Review my HTML for empty links, icon-only links without a name, and vague text like “click here” or “read more.” Suggest replacements based on surrounding content or target.  
Example fixes:

- "Read more" → "Read more about pricing"
    
- Icon-only magnifier → add “Search” as visually hidden text.
    

---

# 5. Buttons — Empty Name or Wrong Element

**Goal:** Buttons have names; use the correct element type. WCAG 4.1.2.  
**Prompt:**  
Step back and clarify when to use a button vs a link. Find buttons with no visible/accessible name, links used as buttons, and buttons used for navigation. Suggest fixes: add text or aria-label, or change element type.  
Example fixes:

- Bad: `<button><svg></svg></button>` → Good: `<button>Save</button>` or with aria-label="Save"
    
- Bad: `<a onclick="openModal()">` → Good: `<button type="button" onclick="openModal()">`
    

---

# 6. Page Language

**Goal:** Correct primary language and inline language changes. WCAG 3.1.1, 3.1.2.  
**Prompt:**  
Step back and explain why `<html lang="…">` matters for screen readers and search. Check if the lang attribute exists and matches the page’s primary language. Suggest corrections for the lang attribute and examples of marking inline changes.

---

# 7. Heading Structure
[[Paid Creators Lead Magnet Accessibility Prompt 7]]

---

# 8. Landmarks

**Goal:** Provide semantic structure with landmarks. WCAG 1.3.1, ARIA best practices.  
**Prompt:**  
Step back and explain why landmarks like header, nav, main, and footer help screen reader navigation. Review the HTML I paste and identify missing or misused landmarks. Suggest where to add or label them.

---

# 9. ARIA Labels

**Goal:** Accessible names for interactive elements. WCAG 4.1.2.  
**Prompt:**  
Step back and explain the correct use of aria-label and aria-labelledby. Review pasted HTML for missing or incorrect ARIA labels. Suggest the simplest fix for each element.

---

# 10. Page Title and Keyboard Traps

**Goal:** Clear page title and safe keyboard navigation. WCAG 2.4.2, 2.1.2.  
**Prompt:**  
Step back and explain the importance of a clear, specific page title and keyboard accessibility. Review HTML for missing or generic titles. Suggest improvements. Check for tabindex values above 0 or focus traps, and recommend fixes.