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
3. Run the cheapest existing suite that covers that surface. With a build graph, that suite is every impacted test target. Affected tests from the graph beat a command the model invents.
4. Escalate once, and only for the part of the claim the first check cannot see. Cap the escalation at one extra run.
5. Add a test only when nothing already in the repository can fail the claim. Add one case, at the layer just selected, with the assertion taken from the requirement.
6. Record what ran, how long it took, and which part of the claim remains uncovered.

Bound the inner loop. A logic change or a single boundary should finish within a couple of minutes, with no browser. One scripted browser path, or one replay, may take a few minutes more. The loop ends there. The broad end-to-end pack, the visual baselines, and the full replay corpus run in continuous integration.

When two checks can both fail the claim, run the one more likely to fail if the change is wrong. Count runtime, the retries a flake will consume, and the tokens spent reading the log. If the check passes and part of the claim is still uncovered, spend the remaining budget on the next check.

### Let the build graph choose the set

A path map written by hand both over-selects and under-selects. `src/components` does not know which tests depend on the file that changed. A build graph does. Bazel is the common case. Buck2, Pants, Nx, and Turborepo's affected set are the same mechanism: changed files become targets, and the tests to run are the test targets that depend on them.

Run every test target in that set. The agent does not drop targets to save a minute. The set is already the tests that can see this diff, and thinning it is how a wiring bug ships behind a green unit test. Hermetic sandboxing is what makes the set safe to run: inputs are declared, the result does not depend on whatever the agent left in the workspace, and the same inputs fail the same way twice. A remote cache is what makes the set cheap. A cache hit means those inputs did not change. It is a skipped run, and the record should say so.

The graph does not see every claim. End-to-end paths, screenshots, and traffic replays often sit outside it, or they are too expensive to attach to every library change. When the claim is a user path, a visual change, or an external contract the graph does not encode, escalate once. `bazel test //...` on every edit still pays analysis, cache lookups, and unrelated flakes. The inner loop is the impacted targets. The full suite stays in CI.

If a rollback lands while every impacted target was cached green, the graph is missing an edge, or the failure was outside it. Add the edge, or keep the one escalation. Leave the inner loop on the impacted set.

### Two changes

A pricing rule changes in one module. The claim is: orders over $100 get 10% off, and the discount ignores shipping. The build graph names the test targets that depend on that module. Run all of them. An end-to-end checkout would fail the same claim later, at a higher cost per minute.

A Submit button is added on the settings page. The claim is: Submit adds a row and the empty state goes away. The impacted unit tests can pass while the button on the page calls nothing, because the page wiring is outside that graph. Escalate once. One scripted path clicks Submit, asserts the row, and saves the trace. The screenshot of the form is attached to that run.

### Put this in the agent instructions

The procedure above is the policy. Write it into the harness so the model follows it on the next task.

1. Require a claim before any check runs. One sentence, taken from the task. Verification waits until that sentence is written down.
2. Prefer the build graph. Run every impacted test target, and do not thin the set. Use a path map only when the repo has no graph. For a web repo, start here and replace the paths with your own:

```text
src/lib, src/domain          unit tests for the touched modules
src/api, db, jobs            integration test on that boundary
src/pages, src/components    one scripted path when behavior changed
styles, copy                 screenshot of the touched states
schemas, generated clients   existing contract test or replay
```

3. Set two time boxes. A logic change or one boundary gets about two minutes and no browser. One escalation, a browser path or a replay, gets a few minutes more. The full end-to-end pack, visual baselines, and the replay corpus stay in CI.
4. Run a test this change did not author. When no existing test can fail the claim, add one case and take the assertion from the claim. Say that in the record.
5. Keep the fixture that was already in the repo when the diff does not modify that collaborator. A new mock belongs in the patch only when this change owns the logic and the collaborator is out of scope.
6. Close with four lines: the claim, the command, the result, and the part of the claim still uncovered. Attach a screenshot to a behavioral run. A screenshot with no command is an image, not a result.
7. Escalate once. If the first check cannot see the failure, run one broader check, save the output, and stop.

This is the block to paste:

```text
Before reporting done:
1. Write the claim in one sentence, from the task.
2. Run every impacted test target from the build graph. If there is no graph, run the cheapest existing suite for the paths you changed.
3. If that set cannot see the failure, escalate once.
4. Report the claim, the command, the result, and what you did not check.
Use a fixture that already exists for any collaborator this diff did not change.
Leave the full end-to-end pack, visual baselines, and replay corpus to CI.
```

### Read the system after it ships

Judge the policy by what happens after merge. A green inner loop only says the selected check passed.

**Rollback.** The agent's check passed, and the change was reverted. Record the suite that ran and the failure production saw. When a unit test passed and the rollback was wiring or a contract mismatch, move that path up one level in the map.

**P0.** A severe incident traces to a change the agent verified. Add the one case that would have failed, at the layer the map already assigns to those paths, and leave it in that suite. The next similar diff then fails inside the time box. Keep the full end-to-end pack in CI.

**Regression.** A behavior that used to work breaks, and the suite for those paths stayed green. The affected tests missed the module, or no test encoded the old behavior. Add the regression to the suite the map already names.

Two signals come from the loop itself, before an incident.

**The agent edits the product until a check goes quiet.** The check is flaky. Remove it from the inner loop until it fails the same way twice. A retry loop will treat the flake as a product bug.

**The first red result appears in CI, after the agent has stopped.** The inner loop selected a suite that could not fail the claim. Update the path map for that surface.

| Signal | What failed in the policy | Change one rule |
| --- | --- | --- |
| Rollback | The suite that ran could not see the production failure | Move that path up one level |
| P0 | No case covered a severe failure | Add one case at the current layer |
| Regression | An old behavior was not selected, or not encoded | Add the case to the mapped suite |
| Flake chased to green | The check is unreliable | Remove it from the inner loop |
| First red result is in CI | The inner loop could not fail the claim | Update the path map |

### The improvement cycle

![Check, ship, read rollback P0 and regression, change one rule, then check again](/images/agentic-verification-cycle.png)

Each turn changes the harness. The incident is the evidence for that one rule.

1. **Check.** Run the suite the map names, inside the time box.
2. **Ship.** Merge with the four-line record: claim, command, result, uncovered part.
3. **Signal.** For changes the agent verified, collect rollbacks, P0s, and regressions. Also note flakes the agent tried to fix, and claims whose first failure showed up in CI.
4. **Adjust.** Classify the miss: wrong claim, suite one level too low, missing case, flaky check, or missing record. Change one rule. That is one row of the path map, one test added to the mapped suite, or one check removed from the inner loop.
5. The next change starts at Check under the new rule. Wait for the same miss to repeat, unless one incident is severe enough that the missing case is already obvious. Leave the rest of the map alone.

### Further reading

- [Agent Settings Is the New Dotfiles](/posts/agent-settings-is-the-new-dotfiles/)
- [Design Review and Perf Review for AI-Eager and AI-Reluctant Engineers](/posts/design-and-perf-review-for-ai-eager-and-ai-reluctant-engineers/)
