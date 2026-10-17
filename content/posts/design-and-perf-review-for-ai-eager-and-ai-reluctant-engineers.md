---
title: "Design Review and Perf Review for AI-Eager and AI-Reluctant Engineers"
description: "In the AI era the engineering bar should rise — stronger architecture, higher test coverage. Use design review and perf review to coach both AI-eager and AI-reluctant engineers against that higher bar."
publishDate: "2026-10-17T12:00:00.000Z"
tags: ["leadership", "ai", "engineering", "management", "culture"]
ogImage: "/images/two-ai-mindsets-cover.jpg"
---

![Design review and perf review for two AI adoption patterns](/images/two-ai-mindsets-cover.jpg)
*Higher engineering bar. Different coaching path.*

AI makes it cheaper to produce code. That should raise the engineering bar, not lower it.

When generation is abundant, the scarce skills are **architecture quality** and **verification depth**: clearer boundaries, better failure handling, stronger invariants, and higher meaningful test coverage. Shipping more lines with the same design discipline and the same thin tests is not progress — it is accelerated technical debt.

Most teams now have two adoption patterns on the same roster. Both need coaching against that higher bar.

**AI-eager engineers** reach for a model before they finish framing the problem. Throughput goes up. Ownership of design and tests sometimes goes down.

**AI-reluctant engineers** prefer the pre-AI loop: read the code, sketch the design, ask a teammate. Craft stays high. Leverage can stall — including the leverage to raise architecture and coverage standards faster.

Neither pattern is a performance issue by itself. Applying one coaching model to both is. Treating AI speed as permission to accept weaker designs or thinner tests is worse.

The two highest-leverage places to intervene are already in the org: **design review** (how work is shaped) and **performance review** (how growth is rewarded).

---

### The bar moves up

Hold every engineer — eager or reluctant — to a higher expectation than the pre-AI default:

1. **Architecture:** explicit boundaries, trade-offs, operability, and failure modes — not “it compiles and demos.”
2. **Test coverage:** meaningful unit, integration, and regression coverage for the paths that matter, including agent-generated code.
3. **Ownership:** the author can explain, debug, and evolve the system without the chat history.

AI is an input to hitting that bar faster. It is not a reason to negotiate the bar down.

---

### Pattern A: AI-eager, under-specified thinking

**Failure mode:** The artifact looks complete. The rationale does not. Design choices arrive as prompt residue. Tests are sparse or generated without asserting the hard cases. Failure modes — latency, security, migration, rollback — are under-owned.

#### Design review: inspect judgment before tooling

Require the engineer to present:

1. **Problem statement** in their own words (no pasted prompt transcript).
2. **Architecture options** considered and rejected, with trade-offs and boundary decisions.
3. **Decision ownership** — why this design survives production constraints.
4. **Verification plan** — what is tested, what is not, and how agent-generated code is covered (happy path plus failure modes).

Treat model output as an input to review, not a substitute for design or for tests.

> Principle: if the design and its critical tests cannot be explained without the chat history, ownership is incomplete.

#### Perf review: reward higher-bar outcomes, not raw volume

Keep velocity as a signal. Weight it below architecture and verification quality:

- Strength of design rationale across reviews
- Meaningful coverage growth on high-risk paths (not vanity line counts)
- Rate of avoidable defects caught late
- Ability to debug and operate what the agent produced
- Habit loop: *frame → design → ask → verify → own*, not *ask → ship*

Promote engineers who use AI to raise architecture quality and test depth — not merely to emit more code.

---

### Pattern B: AI-reluctant, high craft, limited leverage

**Failure mode:** Strong instincts about correctness, slower compounding. Useful caution can harden into avoidance of tools that would help raise architecture quality and coverage faster across a larger surface area.

#### Design review: judge outcomes against the higher bar

Keep the review criteria constant — and stricter than before:

1. Interface clarity and system boundaries
2. Risk, operability, and migration path
3. Evidence quality (data, prototypes, prior art)
4. Test strategy for critical paths and regressions
5. Open questions and decision deadlines

Do not require AI theater. Do invite optional, narrow use where it improves the review packet: test matrices, property/fuzz case ideas, API diffs, migration checklists, related-code search. Then evaluate the human decision.

> Principle: respect craft. Still expect stronger architecture, deeper verification, and faster learning than the pre-AI baseline.

#### Perf review: measure selective leverage toward the higher bar

Look for growth in impact, not identity change:

- One workflow that improved architecture or coverage without quality loss
- One investigation that used AI as a research or test-design assistant
- Clear judgment about when *not* to use a model
- Willingness to expand scope while holding a higher quality bar

Push when reluctance becomes a ceiling on architecture quality, verification depth, learning speed, or team throughput.

---

### Anti-patterns for managers

| Anti-pattern | Why it fails |
| --- | --- |
| Universal AI mandates | Optimizes for compliance, not judgment |
| Prompt / LOC generation metrics | Confuses activity with engineering quality |
| Accepting thinner tests because “AI wrote it fast” | Lowers the bar exactly when it should rise |
| Praising Pattern A for speed alone | Rewards hollow ownership |
| Sheltering Pattern B from change | Quietly routes hard work away from them |

---

### Operating model

| Lever | Job | Pattern A focus | Pattern B focus |
| --- | --- | --- | --- |
| Design review | Inspect thinking against a higher bar | Force architecture trade-offs and a real test plan | Hold architecture + coverage bar; optional narrow AI assist |
| Perf review | Reinforce habits | Reward verify-and-own, not volume | Reward selective leverage that raises quality |

Same raised standards for architecture, coverage, ownership, and impact. Different coaching for how each person gets there.

That is the managerial job: **raise the engineering bar**, and vary the coaching path.
