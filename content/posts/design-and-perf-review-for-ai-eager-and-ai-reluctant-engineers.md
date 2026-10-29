---
title: "Design Review and Perf Review for AI-Eager and AI-Reluctant Engineers"
description: "A note to engineers at every level. Code got cheaper to produce, so the bar on your architecture and your tests goes up. Design review and perf review are where you show that, whether you reach for a model first or last."
publishDate: "2026-10-17T12:00:00.000Z"
updatedDate: "2026-10-29T14:00:00.000Z"
tags: ["leadership", "ai", "engineering", "management", "culture"]
ogImage: "/images/two-ai-mindsets-cover.jpg"
---

![Design review and perf review for two AI adoption patterns](/images/two-ai-mindsets-cover.jpg)
*The bar is higher. The packet is the same at every level.*

AI makes it cheaper to produce code. The bar goes up with that.

I have run design review and perf review. You are the engineer in the room, at any level. The packet is the same whether the work is a function or a boundary.

The scarce skills are **architecture quality** and **verification depth**: clearer boundaries, better failure handling, stronger invariants, and higher meaningful test coverage. Ship more lines on the same design discipline and the same thin tests, and you are accumulating debt faster.

You are in one of two habits. Both still have to clear that bar.

**You reach for a model before you finish framing the problem.** Throughput goes up. Your ownership of the design and the tests sometimes goes down.

**You stay on the pre-AI loop.** You read the code, sketch the design, ask a teammate. The craft stays high. The leverage stalls, including the leverage to raise architecture and coverage on a larger surface.

Neither habit is a performance issue by itself. If you are eager, "use the model less" is the wrong correction. If you are reluctant, "prompt more" is the wrong correction. Treat AI speed as permission for a weaker design or thinner tests, and that is what the review will record.

You meet the bar in two rooms you already sit in. **Design review** is where the work gets its shape. **Performance review** is where your growth gets named.

---

### The bar moves up

Eager or reluctant, you are held above the pre-AI default:

1. **Architecture:** explicit boundaries, trade-offs, operability, and failure modes. "It compiles and demos" is where the review starts.
2. **Test coverage:** meaningful unit, integration, and regression coverage for the paths that matter, including code an agent wrote.
3. **Ownership:** you can explain, debug, and evolve the system without the chat history.

Use the model to hit that bar faster. It is not a reason to negotiate the bar down.

---

### Pattern A: AI-eager, under-specified thinking

The artifact looks complete. The rationale does not. Design choices arrive as prompt residue. Your tests are sparse, or generated without asserting the hard cases. Latency, security, migration, and rollback are still yours, and the artifact skipped them.

#### Design review: show the judgment before the tooling

Walk in with this, in your own words:

1. **Problem statement.** No pasted prompt transcript.
2. **Architecture options** you considered and rejected, with the trade-offs and the boundary you chose.
3. **Decision ownership.** Why this design survives production constraints.
4. **Verification plan.** What is tested, what is not, and how agent-generated code is covered, happy path and failure modes.

The model output is an input you already reviewed. The design and the tests are still yours.

> If you cannot explain the design and its critical tests without the chat history, you do not own the change yet.

#### Perf review: higher-bar outcomes, not raw volume

Velocity still counts. It counts less than architecture and verification quality:

- Strength of your design rationale across reviews
- Meaningful coverage growth on the risky paths, not a line count
- Avoidable defects that still landed late
- You can debug and operate what the agent produced
- The loop you run: *frame → design → ask → verify → own*, not *ask → ship*

What belongs on the record is that you used AI to raise architecture quality and test depth. More code, with nothing else, is a weak story.

---

### Pattern B: AI-reluctant, high craft, limited leverage

Your instincts about correctness are strong, and they compound slowly. Useful caution hardens into skipping tools that would help you raise architecture quality and coverage faster, across a larger surface.

#### Design review: same bar, with or without the model

The criteria stay the same, and they are stricter than the pre-AI default:

1. Interface clarity and system boundaries
2. Risk, operability, and migration path
3. Evidence quality (data, prototypes, prior art)
4. Test strategy for critical paths and regressions
5. Open questions, and the date you will decide them

You do not owe the room an AI demo. When a narrow use makes the packet better, bring it: a test matrix, property or fuzz ideas, an API diff, a migration checklist, a search for related code. The room evaluates your decision.

> Your craft counts. Stronger architecture, deeper verification, and faster learning than the pre-AI baseline still apply to you.

#### Perf review: selective leverage toward the higher bar

Show growth in what you can take on. You do not have to change who you are:

- One workflow that improved architecture or coverage without a quality loss
- One investigation where you used AI as a research or test-design assistant
- A clear call about when you left the model alone
- Scope you took on while holding the higher quality bar

If reluctance caps your architecture, your verification, how fast you learn, or the work the team can give you, say so in the review. Widen one workflow before the harder work goes to someone else.

---

### What to refuse

| If this is the rule | What it costs you |
| --- | --- |
| A mandate to use AI on everything | You optimize for looking compliant. Judgment drops out. |
| Prompt counts or lines generated | Activity gets scored as engineering quality. |
| Thinner tests because "AI wrote it fast" | You lowered the bar in the year it should have risen. |
| Praise for speed alone | Hollow ownership gets the reward, so you repeat it. |
| Shelter from the tools | The harder work goes to someone else. |

---

### What you bring

| Review | Your job | If you reach for the model first | If you hold back |
| --- | --- | --- | --- |
| Design review | Show the thinking against the higher bar | Trade-offs and a real test plan, in your words | The same architecture and coverage bar. AI only where it helps the packet. |
| Perf review | Make the habit visible | Verify and own, not volume | Selective leverage that raised quality |

Same standards for architecture, coverage, ownership, and impact. The habit you already have changes the path. It does not change the packet.
