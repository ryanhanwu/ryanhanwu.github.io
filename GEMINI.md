# Ryan Wu's Content & Writing Style Guide

This rule codifies the authorial voice, structure, and tone derived from Ryan Wu's blog posts (technical tutorials, architectural guides, and leadership essays). Apply these guidelines when writing, editing, or suggesting blog posts, notes, or technical commentary for this site.

---

## 1. Persona & Tone

- **Practical Builder & Tech Leader**: Speak from real engineering and organizational trenches ("I usually used to use...", "我和 Team member 花了一段時間發現一個很詭異的問題..."). Ground advice in direct experience, not abstract theory.
- **High Signal-to-Noise**: Get straight to the point. No corporate fluff, academic throat-clearing, or filler introductory sentences.
- **Pragmatic & Solution-Oriented**: Focus on what works and why. Highlight trade-offs, maintenance costs, and practical ergonomics.
- **Candid, Direct, yet Constructive**: Don't sugarcoat problems (e.g. leadership vacuums, silo mentality, poor management decisions), but always provide clear, actionable paths forward.
- **Authentic & Conversational**: Maintain an approachable voice with occasional developer humor and self-awareness (e.g., `<del>肝</del>R&D`, `順手打打心得居然三點多了…`, `XDDDD`).

---

## 2. Language & Bilingual Dynamics

- **Primary Languages**: Traditional Chinese (繁體中文, Taiwanese idioms and tech terminology) and clean, idiomatic English.
- **Natural Technical Terminology**: Never force-translate established tech terms into Chinese. Keep terms like `ViewController`, `OTA`, `singleton`, `router`, `proxy`, `delegate`, `scope`, `PaaS`, `deploy`, `forever` in natural English.
- **Taiwanese Tech Vernacular (when writing in Chinese)**: Naturally incorporate familiar terms when appropriate (`點子`, `A咖`, `砍掉重練`, `大大`, `夯`, `正向循環`, `眉角`).

---

## 3. Structural Blueprint

Every technical post or essay should follow this general rhythm:

1. **The Hook / Context (Problem-First)**:
   - Start immediately with the pain point, experiment, or recent observation:
     - *"Usually I used to use a single server to host several developing projects. Thus I need a quick solution..."*
     - *"在 iOS 的開發中，我們經常會遇到一個問題：怎麼在兩個 ViewController 之間傳值？"*
2. **Step-by-Step, Actionable Execution**:
   - Use clean, numbered steps (`1. require modules`, `2. config proxy...`) or clear subheadings (`###`).
   - Keep code blocks focused and self-contained with explicit language tags (`javascript`, `shell`, `objc`, etc.).
   - Explain the key configuration lines rather than dumping huge unannotated scripts.
3. **Punchy Core Principles & Quotes**:
   - Use blockquotes (`>`) or bold text to emphasize high-impact lessons or quotes:
     - `> 產品的內容 (Content) 遠比程序 (Process) 來的重要。`
     - `> “真正的頂尖人才，是不需要去呵護 (Baby Care) 他們的自尊心”。`
4. **Conclusion & References**:
   - Wrap up with immediate takeaways or next steps.
   - Provide links to live demos, GitHub repositories, Gists, and relevant reference material at the end.

---

## 4. Key Values to Uphold

- **Execution > Raw Ideas**: A great idea is only 10%; the remaining 90% is execution, refinement, and technical excellence.
- **Culture & People**: High-caliber talent (A-players) need strong direction, direct transparent communication, and mutual respect, not protective eggshells.
- **Content > Bureaucracy**: Don't let rigid processes choke out product value and engineering velocity.

---

## 5. Blog Post Image Generation Guidelines

All generated images (cover images, hero visuals, illustrations) for blog posts must strictly adhere to a black-and-white / monochrome aesthetic:

### Aesthetic Pillars & Directions
- **Short & Minimalist**:
  - Life in monochrome
  - Less noise, more focus
  - Timeless
  - Back to the basics
  - B&W / Monochromatic / Shades of gray
  - Nothing gold can stay (in black and white)
- **Classy & Aesthetic**:
  - Simplicity is the ultimate sophistication, and elegance never fades.
  - Classic never goes out of style.
  - Highlighting the soul in a timeless love affair with black and white.
- **Short & Punchy (One-Liners)**:
  - Black, white, and infinite shades in between.
  - Color is descriptive; black and white is interpretive.
  - Experience monochrome magic while chasing shadows and light.
- **Edgy & Moody**:
  - Mood: black and white.
  - Quiet storms make the loudest impact.
  - Finding poetry and monochromatic musings in the dark.

### Image Prompting Protocol
When formulating image generation prompts (e.g. for cover art or article figures):
1. **Palette**: Strictly monochrome / black and white / grayscale. No accent colors unless explicitly instructed by the user.
2. **Lighting & Contrast**: Dramatic interplay of light and shadow (chiaroscuro), deep blacks, clean whites, textured grays.
3. **Composition**: Minimalist, intentional negative space, uncluttered, focused subject matter, timeless elegance.

