---
title: "Everyone Knows the Recipe"
description: "I've been thinking about cooking and AI-era software: everyone knows the recipe, few turn it into a business; mini UI feels like a ghost kitchen; and kids may see less tech while talking to agents."
publishDate: "2026-10-27T13:00:00.000Z"
tags: ["ai", "engineering", "leadership", "product", "culture"]
---

I've been thinking about cooking and the software industry in the AI era.

Everyone knows the recipe. Only a few turn it into a business.

You can recreate the dish at home. A professional chef still has some secret that makes it efficient.

And maybe more points.

---

### Everyone knows the recipe. Few turn it into a business.

Recipes used to sit in a notebook or in someone's head. Now YouTube, blogs, and comment threads will walk you through almost any dish. Following along at home is easy. Paying rent with a restaurant on a Tuesday night is not.

Shipping software with AI feels the same. Prompt patterns, open frameworks, sample repos, weekend tutorials. The "how" is public. Pick a model, wire an agent, generate a UI, ship a demo. That sequence is no longer a moat.

A business is the hard part: customers, pricing, support, hiring, cash, distribution, and the boring reliability that makes people come back. Plenty of people can plate one nice dish for friends. Far fewer can serve a hundred covers without collapsing.

> A great idea is maybe 10%. The other 90% is still execution. AI made the recipe cheaper to share. It did not make the restaurant automatic.

If the strategy is "we also use the same model and the same agent loop," you are competing on a public cookbook page.

---

### You can recreate the dish at home. The chef's secret is efficiency.

Same ingredients. Different outcome when tickets pile up, something burns, or you need 7pm quality to match 5pm.

The chef's secrets are usually unglamorous:

- Mise en place before the rush
- Timing across stations
- Recovery when a ticket changes
- Batching without killing quality
- Fifty tiny decisions the recipe never lists

In engineering those secrets look like agent settings, evals, permissions, CI, cost control, incident habits, and the context pack that stops the model from inventing a second architecture. You can remake the demo at home. You still do not have the line cook's economy of motion. Teams that treat AI as a demo oven keep finding that gap in production.

---

### Mise en place before you generate

Home cooking can improvise. A restaurant that improvises every ticket dies.

Before an agent run, prep still matters:

- Problem framing and acceptance checks
- Architecture boundaries the model should not blur
- Data and tool access matched to the risk
- A verification path that does not depend on "the chat looked good"

Skip the prep and one plate feels fast. A week of tickets later you have leftovers nobody wants to reheat.

---

### Taste is still on you

A kitchen that never tastes the food will serve something complete and wrong. AI raised how much plausible output you can get. It did not raise taste.

Taste here means: thin design, theater tests, UX that confuses the next person, demo-works vs we-can-operate-this. Design review and verification are the tasting spoons. Without them you just plate mistakes faster.

> Models generate candidates. Someone still decides what leaves the pass.

---

### The dining room still matters

Perfect food in a closed kitchen can still fail. People need a seat, a clear bill, help when something is wrong, and a reason to return.

Onboarding, trust, support, brand, distribution. AI can speed up the stove. It does not fill the dining room. Copying a competitor's feature list is copying their menu without their reservation book.

---

### One great chef is not a restaurant

One person can cook a great dinner. Lunch rush needs training, SOPs, station design, and quality when the star is off the floor.

AI can make one engineer look like a bigger kitchen for a while. The org still needs review, shared context, ownership after the chat closes, and managers who raise the bar instead of celebrating plate count. Throughput without a kitchen system just moves the fire.

---

### Food safety is non-negotiable

Ignore hygiene and the clever sauce does not save you. In AI systems that means security, privacy, permissions, auditability, data handling. Speed talk does not help after a bad incident. Put the sinks on the line before you celebrate ticket speed.

---

### Signature dish vs daily specials

Trends move. Menus fill with the same specials because recipes are public. Places that last usually have a signature they can defend and improve.

"We use AI" is rarely the signature. Domain depth, distribution, proprietary evals and context, a workflow customers already trust you with. Specials are fine for learning. A business needs something worth repeating when the trend page refreshes.

---

### Software is like dishes. You use it, done, leave. Or do you?

You eat a dish, done, leave. You use software, done, leave. That is how it feels in the moment.

What about personal data, usage records? Are they transferable?

At a restaurant the memory of you is thin: regular status, allergies, card on file. In software the residue is thicker: personal data, usage history, preferences, files, chat logs, agent memory, how you work. You left. The product did not fully leave you.

Can you take that history to another table?

- Export a human can read is not the same as import another product can use
- Usage graphs and model memory often sit in a vendor format
- "Delete my data" and "move my data" are different jobs
- The sticky layer is often context: prompts, evals, memory that made the tool feel smart for you

> The meal ends. The account and the learned preferences may not. Portability is whether you leave with more than a receipt.

Lock-in used to mean file formats. Now it often means accumulated context that is expensive to rebuild elsewhere. Holding leftovers in the freezer and calling it loyalty is a choice. Making the dish good enough that people come back is another.

---

### Schools pull digital back. How do kids see software?

Schools are pulling back digital learning. Phone bans. Chromebooks back in carts. Less one-to-one for younger grades. More paper, more teacher-led work.

Maybe the whole world moves backward into minimum technology.

But still relying on AI agents as the primary interface.

That sounds contradictory until you picture the restaurant. Strip gadgets from the tables. Guests talk and eat. Behind the wall the kitchen still runs. Guests meet a waiter. They do not meet the industrial oven.

Software may go that way:

- Less visible surface: fewer apps, fewer dashboards for kids
- Primary interface: ask an agent for the outcome
- Software in the closed kitchen: policies, tools, data, evals, workflows agents run for you

Kids may not see software the way we did: folders, settings, install wizards. They may see a conversation, a result, and a teacher who still wants handwriting. The stack gets denser. The interface gets thinner.

### Mini UI is like a ghost kitchen

That line keeps sticking with me.

A ghost kitchen has no dining room. No storefront. Orders come through a delivery app; food leaves in a bag. The customer meets DoorDash, not your floor plan.

Mini UI works the same way. Almost no screens of your own. Capabilities as tools and APIs. Fulfillment through an agent the user already talks to. The agent is the delivery app. Your software is the kitchen that never needed a lease on Main Street.

Upside: stop spending roadmap on empty dining rooms. Optimize the dish, the ticket time, the contract the agent can call.

Trap: the platform owns the relationship. Your brand becomes a line item in someone else's chat. If you are interchangeable with the next ghost kitchen down the block, margins look like delivery-app margins.

> Mini UI is a ghost kitchen. The agent takes the order. You cook out of sight.

One more gap: if the only interface is an agent, who teaches kids what the kitchen can do, what it must not do, and how to taste a bad plate before they swallow it? Pull screens out of class without teaching judgment about agents, and you swap distraction for opaque dependence.

So the product question shifts. Another app icon on a crowded home screen may not be the win. Being a ghost kitchen the agent prefers might be: clear permissions, portable records, food safety the waiter does not re-explain, a dish distinctive enough that the platform cannot silently swap you out. Or being the waiter people trust when the dining room goes quiet.

---

### So what

Most teams can follow the recipe now. Better questions:

1. What is our mise en place before we generate?
2. Where is the efficiency edge under real load?
3. Who tastes before it leaves the pass?
4. What is still hard after the demo works?
5. What is the signature dish when everyone can remake tonight's special?
6. When the user is done and leaves, what data stays, and can they take it?
7. If mini UI is a ghost kitchen, are we the waiter, a kitchen the agent prefers, or a line item it can swap out?

Cooking did not stop mattering when cookbooks went mass market. The scarce skills just got clearer. Software is in that clarifying moment: recipe public, demo easy, restaurant still hard, plate gone but data maybe not, dining room quiet while the agent takes the order.
