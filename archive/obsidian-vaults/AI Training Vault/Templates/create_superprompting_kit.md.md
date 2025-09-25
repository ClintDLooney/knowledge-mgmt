```javascript
<%*
const vault = app.vault;
const base = "ai/superprompting";

const folders = [
  "prompt_templates",
  "context_sets",
  "example_sets",
  "export_formats",
  "metadata"
];

const files = [
  {
    path: `${base}/roadmap.md`,
    content: `# Superprompting Roadmap\n\n- [ ] Define modular prompt structure\n- [ ] Create and tag prompt templates\n- [ ] Add context_sets with metadata\n- [ ] Set up export templates for PDF / Notion\n`
  },
  {
    path: `${base}/prompt_templates/generate_alt_text_writers.md`,
    content: `---
title: Generate Alt Text Prompt
audience: content_writers
context_sets: [wcag_summary_core, tone_friendly]
tags: [accessibility, alt_text, content]
version: 1.0
status: draft
---

You are a content writer tasked with generating descriptive and inclusive alt text for images.

Task: [Insert image description or URL]

Follow accessibility best practices and WCAG guidelines. Use plain, concise language. Avoid redundancy.`
  },
  {
    path: `${base}/context_sets/wcag_summary_core.md`,
    content: `---
title: WCAG Summary (Core)
category: guidelines
use_case: accessibility_baseline
tags: [accessibility, wcag]
version: 1.0
---

This context set summarizes the most commonly used WCAG 2.1 AA principles for general accessibility tasks.

- Perceivable: Text alternatives, adaptable content
- Operable: Keyboard accessible, enough time, avoid seizures
- Understandable: Readable, predictable navigation
- Robust: Compatible with assistive technologies`
  },
  {
    path: `${base}/export_formats/prompt_export_template.md`,
    content: `## Prompt Export Template

**Title:**  
**Audience:**  
**Tags:**  
**Context Sets Used:**  

---

### Final Prompt:
[Paste here]

---

### Example Output:
[Paste here]`
  }
];

for (const folder of folders) {
  await vault.createFolder(`${base}/${folder}`);
}

for (const file of files) {
  await vault.create(file.path, file.content);
}

tR += "✅ Best-practice superprompting structure created!";
%>

```