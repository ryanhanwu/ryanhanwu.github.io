---
title: "The PRD Never Met the Product"
description: "A note to engineers. PRDs and demos got cheap, so they stopped proving the data model, auth, migrations, and fit. Treat the packet as a question, and write the reality check before you build."
publishDate: "2026-10-28T18:30:00.000Z"
tags: ["ai", "product", "design", "engineering", "leadership"]
ogImage: "/images/the-prd-never-met-the-product-cover.jpg"
---

![A white architectural model on a steel table, with the real city block visible through the window](/images/the-prd-never-met-the-product-cover.jpg)
*The model is finished. The block outside is the product.*

A PRD lands in the channel. Then a demo. Both look finished. You take them and start the feature. Then it blows up, and you are the one in the branch when it does.

---

### Why it blows up

PRDs and demos now cost almost nothing, so they stop being proof of anything. A thick spec and a clickable flow used to mean someone had sat with the problem long enough to hit a wall. You can now receive both before anyone has opened the product.

What still costs money is the data model, the edge cases, auth, migrations, performance, and whether the change fits the product you already run. If nobody upstream owns those, you discover them last, after the routes exist.

You get a PRD for a manager view: every team's work in one table. The demo draws that table on clean sample data, a chart above it, and a share button that always works. You implement the picture.

The access check is on the workspace, and half the rows are private to the person who created them. "Every team" is an unbounded query the demo never paginated. People already have saved filters, and a bookmarks list nobody maintains. A new Views object is either a migration or a third way to save the same thing. The demo showed you none of that. The doc, the demo, and your branch agree with each other. They disagree with the product.

> Cheap artifacts stopped being evidence. If you build from them, the data model, the auth, and the migration are yours whether anyone named them or not.

---

### What you hold them to

Generation will keep writing the first draft of the doc, the screen, and your diff. Send back the part the draft skipped. Sign the part only you can sign.

**PM.** They own the problem, the constraints, and the success metric. Before you estimate, ask whether they did the diligence on the product you already ship: what is already built, and what breaks if this ships. The PRD you accept is a spec with acceptance criteria.

For the manager view, those criteria have to say what happens to private rows, what happens to filters people already saved, what "done" means in a number you can fail, and which constraints are fixed: auth, existing data, support. That is the handoff. If the doc is a narrative around a prompt, send it back. Tell them which sentences are false in this product. Leave the success metric with them.

**Design.** They own the system, the states, and the taste. A demo shows you the happy path. Ask for what that path leaves out: empty, error, edge, accessibility, and consistency with the design system you already have.

A generated demo has no component library in it until someone puts the system back in the loop. Ask which existing component the screen uses, and what was faked: the share button, the chart, the rows that were all visible. Given only the picture, you will build the picture.

**You.** You own correctness, architecture, and review. Say it while the demo is still a file: this implies a schema change and a migration. Said once you are already implementing, that sentence is a rewrite. Said at the demo, PM and design can still change scope.

Review covers your agent's diff too. If the only way you can explain the data model is the chat scrollback, you do not own the change yet.

---

### Where this hits your work

Generic UI is where you feel it first. Forms, dashboards, and CRUD screens are the easiest surface to demo and the easiest for a model to draft. If that is the whole of your week, you are competing with the demo.

Depth on the backend holds up better. Mistakes in data, distributed systems, reliability, security, and cost are expensive, and a demo does not show them to you. The manager view failed on auth, query shape, and existing saved state. The picture on top was the cheap part.

The same depth holds up on the frontend: performance, accessibility, complex state, design systems. A happy-path demo hides those the way it hides a bad migration.

The engineers I want on this work can take a change end to end and verify it, whatever the FE or BE label on the req says. AI, eval, and infra work are growing in the same window. That is my read. The market is shifting fast enough that I would not plan your career on the labels staying put.

---

### Before you pick it up

> Treat a demo as a question, not an answer.

Before you start, write a short reality check:

1. Which existing systems does this touch?
2. What is faked in the demo?
3. What is out of scope?

Get into the demo review while those three answers are still cheap. Ask PM what is already built and what breaks. Ask design for the states, the design-system fit, and what the picture faked. You write the schema, the migration, the performance risk, and the parts you will not build.

Wait for a ticket that says "implement this," and auth, migrations, and fit show up as surprises in your pull request. One page first. Then generate code against a product you actually have.
