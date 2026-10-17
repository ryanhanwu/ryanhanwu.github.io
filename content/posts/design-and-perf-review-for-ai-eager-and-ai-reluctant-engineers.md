---
title: "Design Review and Perf Review for AI-Eager and AI-Reluctant Engineers"
description: "A practical coaching model: use design review to inspect engineering judgment, and performance review to reinforce the right AI habits for both eager and reluctant teammates."
publishDate: "2026-10-17T12:00:00.000Z"
tags: ["leadership", "ai", "engineering", "management", "culture"]
ogImage: "/images/two-ai-mindsets-cover.jpg"
---

![Design review and perf review for two AI adoption patterns](/images/two-ai-mindsets-cover.jpg)
*Same engineering bar. Different coaching path.*

Most engineering teams now have two adoption patterns on the same roster.

**AI-eager engineers** reach for a model before they finish framing the problem. Throughput goes up. Ownership sometimes goes down.

**AI-reluctant engineers** prefer the pre-AI loop: read the code, sketch the design, ask a teammate. Craft stays high. Leverage can stall.

Neither pattern is a performance issue by itself. Applying one coaching model to both is.

The two highest-leverage places to intervene are already in the org: **design review** (how work is shaped) and **performance review** (how growth is rewarded).

---

### Pattern A: AI-eager, under-specified thinking

**Failure mode:** The artifact looks complete. The rationale does not. Design choices arrive as prompt residue. Failure modes — latency, security, migration, rollback — are under-owned.

#### Design review: inspect judgment before tooling

Require the engineer to present:

1. **Problem statement** in their own words (no pasted prompt transcript).
2. **Options considered** and rejected, with trade-offs.
3. **Decision ownership** — why this design survives contact with production constraints.
4. **Verification plan** — how they will prove the system behaves correctly, including agent-generated code.

Treat model output as an input to review, not a substitute for design.

> Principle: if the design cannot be explained without the chat history, ownership is incomplete.

#### Perf review: reward decision quality, not raw volume

Keep velocity as a signal. Add judgment signals:

- Quality of design rationale across reviews
- Rate of avoidable defects caught late
- Ability to debug and operate what the agent produced
- Habit loop: *frame → ask → verify → own*, not *ask → ship*

Promote engineers who increase leverage **without** lowering the bar on system understanding.

---

### Pattern B: AI-reluctant, high craft, limited leverage

**Failure mode:** Strong designs, slower compounding. Useful instincts about correctness can harden into avoidance of tools the rest of the team now uses to deliver impact.

#### Design review: judge outcomes, not tool affiliation

Keep the review criteria constant:

1. Interface clarity and system boundaries
2. Risk, operability, and migration path
3. Evidence quality (data, prototypes, prior art)
4. Open questions and decision deadlines

Do not require AI theater. Do invite optional, narrow use where it improves the review packet: test matrices, API diffs, migration checklists, related-code search. Then evaluate the human decision.

> Principle: respect craft. Hold the same clarity, learning velocity, and delivery bar as everyone else.

#### Perf review: measure selective leverage, not conversion

Look for growth in impact, not identity change:

- One workflow shortened without quality loss
- One investigation that used AI as a research assistant
- Clear judgment about when *not* to use a model
- Willingness to learn how adjacent systems are now built and operated

Push only when reluctance becomes a ceiling on scope, speed of learning, or team throughput.

---

### Anti-patterns for managers

| Anti-pattern | Why it fails |
| --- | --- |
| Universal AI mandates | Optimizes for compliance, not judgment |
| Prompt / LOC generation metrics | Confuses activity with engineering quality |
| Praising Pattern A for speed alone | Rewards hollow ownership |
| Sheltering Pattern B from change | Quietly routes hard work away from them |

---

### Operating model

| Lever | Job | Pattern A focus | Pattern B focus |
| --- | --- | --- | --- |
| Design review | Inspect thinking | Force problem framing and trade-offs | Hold outcome bar; optional narrow AI assist |
| Perf review | Reinforce habits | Reward verify-and-own | Reward selective leverage |

Same standards for correctness, ownership, and impact. Different coaching for how each person gets there.

That is the managerial job: keep the engineering bar fixed, and vary the coaching path.
