---
title: "Which Test an Agent Should Run"
description: "Agentic verification is a selection policy: choose the existing suite that can fail this change, under constraints of efficiency, reliability, and observability."
publishDate: "2026-10-20T16:00:00.000Z"
tags: ["ai", "agents", "engineering", "testing"]
draft: true
ogImage: "/images/agentic-verification-cover.jpg"
---

![Three concrete pillars and a narrow gate](/images/agentic-verification-cover.jpg)
*A change is done only when a check passes the gate.*

A recurring failure is an agent reporting a user-interface change complete after searching the repository for a label it just added. The label is present in the file. The click handler is not attached to the button.

Unit tests, integration tests, end-to-end tests, screenshot diffs, mocks, and traffic replay still answer the same questions they answered before agents. Agentic verification is the policy that selects among them for a specific change. The policy has to be cheap enough that the agent runs it again after the next edit.

### Three constraints

![Claim, then efficiency, reliability, and observability, then the selected check](/images/agentic-verification-pillars.png)

Three constraints determine whether a selected check is worth trusting.

**Efficiency.** The check has to be inexpensive enough to sit inside the edit-and-retry loop. Given a four-minute browser pack and an eight-second unit test, the agent selects the unit test. Use that result when the unit test can falsify the claim. Escalate when the bug is in wiring the unit test cannot see.

**Reliability.** The check has to fail when the claim is wrong. Write the claim from the task, as one sentence that can be false. Prefer a test that already exists in the repository. When a new assertion is required, derive it from that sentence. A test written by reading the new implementation agrees with the implementation, including its bugs. A flaky check is a separate defect: the agent edits the product until the noise disappears.

**Observability.** Record the claim, the command, the output, and the portion of the claim the check did not cover. A later reader uses that record to distinguish a pass from a skipped step. A screenshot of the finished screen shows that a page rendered. Attached to a behavioral run, the image is part of the record. On its own, the image does not show that Submit was clicked.

The constraints compete. A browser run with a saved trace can catch wiring bugs, and it costs enough that the retry loop avoids it whenever a cheaper command is available. Select the cheapest check that can still fail the claim, and retain the command and the output.

### Match the suite to the claim

| Suite | Claim it can fail | Where it belongs |
| --- | --- | --- |
| Unit | A pure rule in the modules this diff touches | Inner loop |
| Integration | A boundary: handler and database, client and API, job and queue | Inner loop |
| End to end | A user path whose wiring no lower check can see | One path in the inner loop; the full pack in CI |
| Screenshot | Pixels or layout on the states this diff touches | Inner loop when the claim is visual; otherwise attach the shot to a behavioral run |
| Mock | Local logic, given a contract the test specifies | When this change owns the logic and the collaborator is out of scope |
| Traffic replay | Handling of what the other side actually sent | When the risk is drift from a dependency the team does not control |

A mock and a traffic replay are both fixtures. A mock specifies the collaborator's behavior so the test can exercise local logic. A replay uses traffic the collaborator actually sent. An agent can author a mock in the same patch, and that mock will pass. When the diff does not modify the collaborator, use a fixture that already existed: a contract file, a replay corpus, or a test this change did not author.

### Selection procedure

Make the selection with path rules and the existing test runner. A model asked to survey the whole suite spends the budget on reading, then selects whichever command is easiest to turn green.

1. Write the claim in one sentence, from the task, before inspecting a passing result.
2. Classify the diff from its paths: logic, a boundary, persisted data, an external contract, UI behavior, appearance, or config.
3. Run the cheapest existing suite that covers that surface. Affected tests derived from the diff are preferable to a command the model invents.
4. Escalate once, and only for the part of the claim the first check cannot see. Cap the escalation at one extra run.
5. Add a test only when nothing already in the repository can fail the claim. Add one case, at the layer just selected, with the assertion taken from the requirement.
6. Record what ran, how long it took, and which part of the claim remains uncovered.

Bound the inner loop. A logic change or a single boundary should finish within a couple of minutes, with no browser. One scripted browser path, or one replay, may take a few minutes more. The loop ends there. The broad end-to-end pack, the visual baselines, and the full replay corpus run in continuous integration.

When two checks can both fail the claim, run the one more likely to fail if the change is wrong. Count runtime, the retries a flake will consume, and the tokens spent reading the log. If the check passes and part of the claim is still uncovered, spend the remaining budget on the next check.

### Two changes

A pricing rule changes in one module. The claim is: orders over $100 get 10% off, and the discount ignores shipping. Unit tests on that module can fail the claim, so the procedure stops. An end-to-end checkout would fail the same claim later, at a higher cost per minute.

A Submit button is added on the settings page. The claim is: Submit adds a row and the empty state goes away. A unit test of the handler can pass while the button on the page calls nothing. The first check cannot see the wiring, so the procedure escalates once. One scripted path clicks Submit, asserts the row, and saves the trace. The screenshot of the form is attached to that run.

Run the cheapest existing check that can fail the claim. If that check cannot see the failure, escalate once. Leave the broad suites to continuous integration.

### Further reading

- [Agent Settings Is the New Dotfiles](/posts/agent-settings-is-the-new-dotfiles/)
- [Design Review and Perf Review for AI-Eager and AI-Reluctant Engineers](/posts/design-and-perf-review-for-ai-eager-and-ai-reluctant-engineers/)
