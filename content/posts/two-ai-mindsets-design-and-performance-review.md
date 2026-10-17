---
title: "Two AI Mindsets, Two Review Jobs"
description: "How leaders can use design review and performance review to support both the ask-AI-anything crowd and the people who still prefer the old ways."
publishDate: "2026-10-17T12:00:00.000Z"
tags: ["leadership", "ai", "engineering", "management", "culture"]
---

Most teams now have two kinds of builders sitting next to each other.

One opens a chat before opening the codebase. They ask AI anything — and too often, they skip the thinking that should come first. The other still prefers the old ways: dig into the code, sketch on paper, ask a teammate. AI feels noisy, untrustworthy, or just not their craft.

Neither type is the problem. Treating them the same is.

Design review and performance review are the two places leaders can actually shape this — one for how work gets made, one for how people grow.

---

### Type 1: Ask AI anything — didn't think

Speed is real. So is the cost: shallow problem framing, copy-paste architecture, and pull requests that look complete until you ask "why this?" and get silence.

**In design review, make thinking visible before tooling.**

- Ask for the problem statement in their own words, without pasting the prompt.
- Require trade-offs: what else was considered, what was rejected, and why.
- Treat "the model suggested it" as a starting point, not a decision.
- Push for ownership of failure modes — latency, security, migration, rollback — not just happy-path code.

> If they cannot explain the design without the chat history, they do not own the design yet.

**In performance review, reward judgment, not just output volume.**

Ship velocity still matters. Pair it with signals that force judgment: quality of design rationale, how often reviews catch avoidable issues, and whether they can debug what the agent produced. Coach the habit of "think → ask → verify," not "ask → ship."

---

### Type 2: Doesn't like asking AI — prefers the old ways

Craft and caution are strengths. The risk is falling behind on leverage while the rest of the team compounds with better tooling.

**In design review, lower the threat and raise the bar on outcomes.**

- Do not force AI theater. Force better outcomes: clearer interfaces, fewer open questions, stronger evidence.
- Invite optional AI assistance on narrow jobs — test cases, API summaries, migration checklists — then review the human decision.
- Compare designs on quality and risk, not on whether someone used a model.
- Make space for deep work; just do not let "I don't use AI" become a reason to skip learning how the product is now built.

> Respect the craft. Still expect the same clarity, speed of learning, and delivery bar as everyone else.

**In performance review, measure growth in leverage, not conversion to AI fandom.**

Look for selective adoption: one workflow improved, one review cycle shortened, one investigation that used AI as a research assistant. Celebrate judgment about *when* to use tools. Push back only when resistance becomes a ceiling on impact.

---

### What leaders should stop doing

- One-size-fits-all AI mandates ("everyone must use X daily").
- Counting prompts or lines generated as a proxy for engineering quality.
- Praising Type 1 for speed while ignoring hollow designs.
- Protecting Type 2 from change until the team quietly routes hard work elsewhere.

---

### The job in one line

Use **design review** to inspect thinking. Use **performance review** to reinforce the right habits.

For the ask-anything crowd: slow them down at the decision. For the old-ways crowd: raise the outcome bar without shaming the path. Same standards. Different coaching. That is how both types stay useful — and keep getting better.
