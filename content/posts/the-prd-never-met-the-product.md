---
title: "The PRD Never Met the Product"
description: "PRDs and demos got cheap, so they stopped proving the expensive parts: data model, auth, edge cases, migrations, performance, and fit. PM, design, and engineering stay in the work by owning those before anyone builds."
publishDate: "2026-10-28T18:30:00.000Z"
tags: ["ai", "product", "design", "engineering", "leadership"]
ogImage: "/images/the-prd-never-met-the-product-cover.jpg"
---

![A white architectural model on a steel table, with the real city block visible through the window](/images/the-prd-never-met-the-product-cover.jpg)
*The model is finished. The block outside is the product.*

PM generates a PRD and never checks it against the product you already ship. Design generates a demo. Engineering takes the doc and the demo and starts the feature. Then it blows up.

---

### Why it blows up

PRDs and demos now cost almost nothing, so they stop being proof of anything. A thick spec and a clickable flow used to mean someone had sat with the problem long enough to hit a wall. You can now produce both before you have opened the product.

What still costs money is the data model, the edge cases, auth, migrations, performance, and whether the change fits the product you already run. Nobody upstream owned those, so engineering discovers them last, in a branch, after the routes exist.

Say the PRD asks for a manager view: every team's work in one table. The demo draws that table on clean sample data, a chart above it, and a share button that always works. Engineering implements the picture.

The access check is on the workspace, and half the rows are private to the person who created them. "Every team" is an unbounded query the demo never paginated. People already have saved filters, and a bookmarks list nobody maintains. A new Views object is either a migration or a third way to save the same thing. The demo showed none of that. The doc, the demo, and the branch agreed with each other. They disagreed with the product.

> Cheap artifacts stopped being evidence. The data model, the auth, and the migration still have to be owned by someone.

---

### What each role still owns

Generation will keep writing the first draft of the doc, the screen, and the diff. The role stays in the work by owning the part the draft skips.

**PM.** Own the problem, the constraints, and the success metric. Do the diligence on the product you already ship before you generate anything: what is already built, and what breaks if this ships. The PRD that leaves your hands is a spec with acceptance criteria.

For the manager view, the criteria have to say what happens to private rows, what happens to filters people already saved, what "done" means in a number you can fail, and which constraints are fixed: auth, existing data, support. Those criteria are the handoff. A model can draft them after you have used the product. You sign the ones that are only true here.

**Design.** Own the system, the states, and the taste. A demo shows the happy path. The work that still takes a designer is everything the happy path leaves out: empty, error, edge, accessibility, and consistency with the design system you already have.

Figma used to force that pass when the component library lived in the file. A generated demo has no library until someone puts the system back in the loop. Designing against the components you ship is the same pass. Hand engineering the states the demo skipped, and mark what was faked: the share button, the chart, the rows that were all visible.

**Eng.** Own correctness, architecture, and review. Say it while the demo is still a file: this implies a schema change and a migration. Said at implementation time, that sentence is a rewrite. Said at the demo, it is a scope decision the other two roles can still make.

Review covers the agent's diff too. If the only explanation of the data model is the chat scrollback, the change has no owner yet.

---

### Where FE and BE feel it

Generic UI is where the pressure shows up first. Forms, dashboards, and CRUD screens are the easiest surface to demo and the easiest for a model to draft. An FE role that only produces that work is competing with the demo.

Backend work with depth holds up better. Mistakes in data, distributed systems, reliability, security, and cost are expensive, and a demo does not show them. The manager view failed on auth, query shape, and existing saved state. The picture on top was the cheap part.

FE work with that same kind of depth holds up too: performance, accessibility, complex state, design systems. A happy-path demo hides those the way it hides a bad migration.

The people I expect to be in demand are product-minded engineers who can take a change end to end and verify it, whatever the FE or BE label says. AI, eval, and infra work are growing in the same window. That is my read. The market is shifting fast enough that I would not plan a career on the labels staying put.

---

### The reality check

> Treat a demo as a question, not an answer.

Before engineering picks it up, require a short reality check:

1. Which existing systems does this touch?
2. What is faked in the demo?
3. What is out of scope?

Pull engineering in at the demo, while those three answers are still cheap. The PM writes what is already built and what breaks. Design writes the states, the design-system fit, and what the picture faked. Engineering writes the schema, the migration, the performance risk, and the parts they will not build.

Waiting until the ticket says "implement this" is how auth, migrations, and fit become surprises in the pull request. One page of reality check, then generate code against a product you actually have.
