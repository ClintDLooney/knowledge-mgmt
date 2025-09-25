# Custom Context Generator Prompt

Purpose
Create a deterministic, machine-readable Check Rules Table for the WCAG 2.1 Success Criterion or Criteria (SC) specified at the end of this prompt. The table drives automated scanning and must include all legally relevant edge/corner cases for the SC. Outputs are consumed by a separate boilerplate (reporting/export) that is kept in lockstep with this format.

Output rules
- Output exactly one markdown table, enclosed in plain triple backticks when you run this prompt at inference time.
- Do not output any commentary before or after the table.
- Column order and names must match the list below exactly.
- Use WCAG 2.1 Understanding, Techniques, and Failures pages only (do not cite WCAG 2.2 or AAA). Copy Technique and Failure titles verbatim from W3C.
- If no official WCAG Failure exists for a rule, write: No directly mapped WCAG Failure — referenced per WCAG Understanding doc. Put N/A in the corresponding Failure URL cell.
- Use ERROR for deterministic violations; use WARNING for items requiring human judgment.
- In Notes / Gray Areas, always begin with: Requires human review:
- Never leave a cell blank; use N/A if not applicable.
- Use backticks around inline HTML/ARIA tokens (for example, `<img>`, `alt`, `aria-label`).
- Do not use bold or italic formatting anywhere.

Check ID convention
- Format: {CATEGORY}-{DETAIL}-{NUMBER}
  - CATEGORY is a domain like IMG, SVG, FORM, LINK, MAP, MEDIA, CSS, PARSE, HEAD, TABLE.
  - DETAIL is a short mnemonic like ALT, NAME, LABL, DESC, ORDER, PURP.
  - NUMBER is a sequential integer per CATEGORY-DETAIL series, never reused (for example, IMG-ALT-1, IMG-ALT-2).
- Check IDs are canonical once emitted; do not rename or reuse at runtime.

Required column order (lockstep with boilerplate)
1. Check ID
2. WCAG Criterion
3. WCAG Criterion URL
4. Selector / Condition
5. Fail Condition
6. Severity
7. Issue Type
8. Sufficient Technique(s)
9. Sufficient Technique URL(s)
10. Relevant WCAG Failure(s)
11. WCAG Failure URL(s)
12. Notes / Gray Areas

Content requirements
- Each row maps to the target SC and represents one distinct, testable condition.
- Include all edge/corner cases cited by the official WCAG 2.1 Understanding page for the SC.
- Cite at least one Sufficient Technique and, when available, at least one WCAG Failure per row.
- Links must be direct W3C URLs.

How to use
- When you run this prompt, the assistant must respond with only the table, inside a single triple-backtick fence, using the exact column order above.

Target WCAG SC(s):
