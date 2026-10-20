---
title: "Which Test an Agent Should Run"
description: "Agentic verification is choosing the existing suite that can fail this change, on a budget short enough to rerun."
publishDate: "2026-10-20T16:00:00.000Z"
tags: ["ai", "agents", "engineering", "testing"]
draft: true
---

An agent reported a UI change done. The command it ran searched the repo for the button label it had just added. The label was in the file. The click handler was never attached to the button.

Unit tests, integration tests, end-to-end tests, screenshots, mocks, and traffic replay still do the same jobs. Agentic verification is the choice of which one can fail this change, on a budget small enough that the agent will run it again after the next edit.

### A check has to be able to fail

**Efficiency.** The check has to be cheap enough to sit inside the retry loop. Put a four-minute browser pack next to an eight-second unit test and the agent takes the unit test, including when that test cannot see the bug.

**Reliability.** The check has to fail when the claim is wrong. Write that claim from the task, in one sentence that can be false. Prefer a test that already lived in the repo, or write the assertion from that sentence. A test produced by reading the new implementation passes with the bug still in it. A flake is its own defect. The agent will edit the product until the noisy check goes quiet.

**Observability.** Keep the claim, the command, the output, and the part of the claim still uncovered. That record is how a later reader tells a pass from a skipped step. A screenshot of the finished screen shows that a page rendered. Attached to a behavioral run, it is part of the record. Used alone, it never shows that Submit was clicked.

These three pull against each other. A browser run with a saved trace catches wiring bugs. It also takes long enough that the retry loop will dodge it when a cheaper command exists. Take the cheapest check that can still fail the claim, and keep the command and the output.

### Match the suite to the claim

| Suite | Claim it can fail | Where it belongs |
| --- | --- | --- |
| Unit | A pure rule in the modules this diff touches | Inner loop |
| Integration | A boundary: handler and database, client and API, job and queue | Inner loop |
| End to end | A user path whose wiring no lower check can see | One path in the inner loop; the full pack in CI |
| Screenshot | Pixels or layout on the states this diff touches | Inner loop when the claim is visual; otherwise attach the shot to a behavioral run |
| Mock | Your logic, given a contract you specify | When this change owns the logic and the collaborator is out of scope |
| Traffic replay | Handling of what the other side actually sent | When the risk is drift from a dependency you do not control |

A mock and a replay are both fixtures. The mock sets the collaborator's behavior so you can test your side. The replay uses traffic the collaborator actually sent. Agents can write a mock in the same patch, and the new mock will pass. When the diff leaves the collaborator alone, use a fixture that was already in the repo: a contract file, a replay corpus, or a test this change did not author.

### Pick before you run

Path rules and the existing test runner should make this choice. A model asked to survey the whole suite spends the budget on reading, then picks whichever command is easiest to turn green.

1. Write the claim in one sentence, from the task, before looking at a passing result.
2. Tag the diff from the paths: logic, a boundary, persisted data, an external contract, UI behavior, appearance, or config.
3. Run the cheapest existing suite that covers that surface. Affected tests from the diff beat a model inventing a command.
4. Escalate once, and only for the part of the claim the first check cannot see. One extra run, with a cap.
5. Add a test when nothing already in the repo can fail the claim. One case, at the layer you just picked, asserted from the requirement.
6. Write down what ran, how long it took, and what the claim still does not cover.

Keep the inner loop on a short clock. Logic or a single boundary should come back in a couple of minutes, with no browser. One scripted browser path, or one replay, can take a few minutes more, and then the loop stops. The broad end-to-end pack, the visual baselines, and the full replay corpus stay in CI.

If two checks can both fail the claim, run the one more likely to go red when the change is wrong. Count the wait, the retries a flake will burn, and the tokens spent reading the log. If it passes and part of the claim is still invisible, spend what budget remains on the next check. Then stop.

### The same picker, two diffs

A pricing rule changes in one module. The claim is "orders over $100 get 10% off, and the discount ignores shipping." Unit tests on that module can fail the claim. Stop there. A full checkout flow would fail it too, much later, and tell you less per minute.

A Submit button lands on the settings page. The claim is "Submit adds a row and the empty state goes away." A unit test of the handler can pass while the button on the page calls nothing. The first check cannot see the wiring, so escalate once: one scripted path that clicks Submit, asserts the row, and saves the trace. A screenshot of the form stays attached to that run.

> Run the cheapest existing check that can fail this claim. If it cannot see the failure, escalate once. The broad suites belong in CI.

### Related

- [Agent Settings Is the New Dotfiles](/posts/agent-settings-is-the-new-dotfiles/)
- [Design Review and Perf Review for AI-Eager and AI-Reluctant Engineers](/posts/design-and-perf-review-for-ai-eager-and-ai-reluctant-engineers/)
