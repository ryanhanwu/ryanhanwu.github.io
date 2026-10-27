---
title: "Everyone Knows the Recipe"
description: "Cooking is a useful map for software in the AI era: the recipe is public, home cooks can remake the dish, and after you leave the table the hard question is what data stays and whether it moves with you."
publishDate: "2026-10-27T13:00:00.000Z"
tags: ["ai", "engineering", "leadership", "product", "culture"]
---

Recipes used to be scarce. You learned from a parent, a teacher, or a battered notebook. Now every dish has a video, a blog post, and three variations in the comments. Almost anyone can follow along at home. Very few people turn that into a restaurant that pays rent on a Tuesday night.

Software in the AI era feels the same.

The "how" of shipping a feature with models and agents is increasingly public: prompt patterns, open frameworks, sample repos, weekend tutorials. You can remake a lot of demos in an evening. Running the kitchen is a different job.

---

### 1. Everyone knows the recipe. Few turn it into a business.

A recipe is a sequence. Heat the pan. Add the aromatics. Don't overcook the protein. In product terms: pick a model, wire an agent, generate the UI, ship a demo. That sequence is no longer a moat.

A business is something else. Customers, pricing, support load, hiring, cash timing, distribution, and the boring reliability that keeps people coming back. Plenty of kitchens can plate one nice dish for friends. Far fewer can serve a hundred covers without collapsing.

> Execution still eats the recipe. AI made the recipe cheaper to share. It did not make the restaurant automatic.

If your strategy is "we also use the same model and the same agent loop," you are competing on a public cookbook page. Differentiating work lives in the parts that do not fit in a tutorial: domain judgment, distribution, compounding context, and the habit of shipping under real constraints.

---

### 2. You can remake the dish at home. The chef's edge is efficiency under pressure.

Home cooks and professionals often start from the same ingredients. The gap shows up when something goes wrong mid-service, when tickets pile up, when you need the same quality at 7pm that you had at 5pm.

A chef's "secrets" are usually unglamorous:

- Mise en place before the rush
- Timing that keeps stations in sync
- Recovery when a pan burns or a ticket changes
- Batching and prep that cut waste without killing quality
- Muscle memory for the fifty tiny decisions a recipe never lists

In AI-era engineering, those secrets look like the operating surface around generation: agent settings, evals, permissions, CI, cost controls, incident habits, and the context pack that keeps the model from inventing a second architecture.

You can recreate a dish at home. You still do not have the line cook's economy of motion. Teams that treat AI as a demo oven keep rediscovering that gap in production.

---

### 3. Mise en place beats improvisation at scale

Great home cooking can be improvisational. A restaurant that improvises every ticket dies.

Before an agent run, the prep work that matters looks ordinary:

- Clear problem framing and acceptance checks
- Architecture boundaries the model is not allowed to blur
- Data and tool access that match the risk
- A verification path that does not depend on "the chat looked good"

Skipping mise en place feels fast for one plate. Across a week of tickets, it is how you get confident-looking leftovers that nobody wants to reheat.

---

### 4. Taste is still a human job

A kitchen that never tastes the food will eventually serve something technically complete and wrong. AI raised the volume of plausible output. It did not raise the volume of taste.

Taste in software is knowing when the design is thin, when the tests are theater, when the UX will confuse the next person, and when "it works in the demo" is not the same as "we can operate this." Design review and verification are the tasting spoons. Without them, abundance just means you plate mistakes faster.

> Models generate candidates. Someone still has to decide what leaves the pass.

---

### 5. The dining room matters as much as the stove

You can cook a perfect plate in a closed kitchen and still fail. People need a seat, a bill they understand, service when something is wrong, and a reason to come back.

For software products: onboarding, trust, support, brand, and distribution. AI can accelerate the stove. It does not automatically fill the dining room. Copying a competitor's feature list is copying their menu without their reservation book.

---

### 6. One great chef is not a restaurant

A brilliant individual can cook an excellent dinner. Scaling that into lunch rush needs training, SOPs, station design, and quality that holds when the star is off the floor.

AI can make one engineer look like a larger kitchen for a while. The org still needs review habits, shared context, ownership after the agent closes the chat, and managers who raise the bar instead of celebrating raw plate count. Throughput without a kitchen system just moves the fire to another station.

---

### 7. Food safety is non-negotiable

A restaurant that ignores hygiene does not get a second chance because the sauce was clever. In AI systems, the equivalent is security, privacy, permissions, auditability, and data handling. Speed arguments do not help after a bad incident. Build the sinks and the gloves into the line before you celebrate how fast tickets move.

---

### 8. Signature dish vs. daily specials

Trends move fast. Menus fill with the same specials because the recipes are public. The places that last usually have a signature: a dish they can defend, improve, and serve consistently.

In product terms, that signature is rarely "we use AI." It is domain depth, a distribution wedge, proprietary evals and context, or a workflow customers already trust you with. Specials are fine for learning. A business needs something worth repeating when the trend page refreshes.

---

### 9. You eat, you leave. Software often keeps the plate.

A dish is mostly done when you finish it. You pay, you leave, the meal is gone. Software often feels the same in the moment: open the app, get the result, close the tab.

What stays is different.

At a restaurant, the kitchen might remember you as a regular. Your order history, allergies, and card on file are thin. In software, the residue is thicker: personal data, usage records, preferences, files, chat logs, agent memory, embeddings of how you work. You used the product and left. The product did not fully leave you.

That raises the transfer question. Can you take that history to another table?

- Export that a human can read is not the same as import another product can use
- Usage graphs and model memory are often trapped in a vendor format
- "Delete my data" and "move my data" are different jobs; many products only half-solve the first
- In the AI era, the sticky layer is often context: the prompts, evals, and memory that made the tool feel smart for *you*

> The meal ends. The account, the logs, and the learned preferences may not. Portability is whether you can leave with more than a receipt.

Lock-in used to mean file formats and integrations. It increasingly means accumulated context that is expensive to rebuild elsewhere. If your product's value depends on holding that residue hostage, you are running a kitchen that keeps the customer's leftovers in the freezer and calls it loyalty.

Builders get a sharper design choice: make the dish good enough that people come back, or make leaving so lossy that they cannot afford to switch. The first compounds trust. The second compounds until regulation, a competitor with better export, or a bad incident forces the issue.

---

### What this changes for builders

The useful question is no longer "can we follow the recipe?" Most teams can.

Better questions:

1. What is our mise en place before we generate?
2. Where is our efficiency edge under real load: cost, latency, recovery, verification?
3. Who tastes the output before it leaves the pass?
4. What part of the business is still hard after the demo works?
5. What is the signature dish if every competitor can remake tonight's special?
6. When the customer is done and leaves, what personal data and usage record stay behind, and can they take it with them?

Cooking did not stop mattering when cookbooks went mass-market. Professional kitchens just made the scarce skills clearer: prep, judgment, efficiency, service, and the ability to survive dinner service. Software adds another constraint the plate never had: what happens to the record after the meal. Builders are learning both lessons the hard way.
