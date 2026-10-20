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

The constraints compete. A browser run with a saved trace can catch a broken click path, and it costs enough that the agent will pick a cheaper command whenever one exists. Select the cheapest check that can still fail the claim, and retain the command and the output.

The inner loop is the checks the agent runs before it reports the change done. It has a time box: about two minutes with no browser, or a few minutes more for one broader check. Continuous integration runs after that.

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

Make the selection with the repo's selection rule and the existing test runner. The rule is a build graph where one exists, and a path map otherwise. A model asked to survey the whole suite spends the budget on reading, then selects whichever command is easiest to turn green.

1. Write the claim in one sentence, from the task, before inspecting a passing result.
2. Classify the diff: logic, a boundary, persisted data, an external contract, UI behavior, appearance, or config.
3. Run the set the selection rule names, inside the time box. If the set does not fit, run the small tests first, send the overflow to CI, and record the split.
4. Escalate once when that set cannot see part of the claim. Escalation means one broader check. Retry the same command only for an infra failure, and only once. If the broader check passes while the claim is still partly uncovered, or the broader check is inconclusive, write the gap in the record and stop.
5. Add a test only when nothing already in the repository can fail the claim. Add one case, at the layer just selected, with the assertion taken from the requirement.
6. Attach four lines to the change: the claim, the command, the result, and the part still uncovered. A later rollback can be tied to the policy only when this record is on the change.

A logic change or a single boundary should finish within the two-minute box, with no browser. One broader check, a browser path or a replay, gets a few minutes more. The broad end-to-end pack, the visual baselines, and the full replay corpus run in CI.

When two checks can both fail the claim, run the one more likely to fail if the change is wrong. Count runtime, the retries a flake will consume, and the tokens spent reading the log.

### Let the build graph choose the set

A path prefix does not know which tests depend on a changed file. A build graph does.

Pants names the changed targets and their transitive dependents. Turborepo names the changed packages and the packages that depend on them:

```text
pants --changed-since=origin/main --changed-dependents=transitive test
turbo run test --filter='...[origin/main]'
# or: turbo run test --affected
```

Run the affected set that fits the time box. Do not drop a target because it looks slow. A change to a core library can fan out to a large set, and that set will not finish in two minutes. Run the small tests first, and let the cache skip work whose inputs did not change. Hand the rest to CI. The record lists what ran, which results were cache hits, and what CI still has to run.

A cache hit is a skipped run. It means those inputs did not change.

Pants runs a test in a sandbox, so the result does not depend on files the target did not declare. Turborepo does not sandbox the task. In both, timing, randomness, and races still flake.

End-to-end paths, screenshots, and traffic replays often have no edge from the changed target. Those claims use the one escalation above. `pants test ::`, or `turbo run test` with no filter, is not the inner loop.

### Two changes

A pricing rule changes in one module. The claim is: orders over $100 get 10% off, and the discount ignores shipping. The selection rule names the tests that depend on that module. Run the ones that fit the time box, and record any overflow. An end-to-end checkout would fail the same claim later, at a higher cost per minute.

A Submit button is added on the settings page. The claim is: Submit adds a row and the empty state goes away. The button and its handler are in the graph. No impacted test clicks the button, so a unit test of the handler can pass while the page never calls it. Escalate once. One scripted path clicks Submit, asserts the row, and saves the trace. The screenshot of the form is attached to that run. If that path is inconclusive, record the gap and stop.

### Put this in the agent instructions

The procedure above is the policy. Write it into the harness so the model follows it on the next task.

1. Require a claim before any check runs. One sentence, taken from the task. Verification waits until that sentence is written down.
2. Use the selection rule. With a graph, run the impacted targets that fit the time box and record the overflow. Without one, use this path map and replace the paths with your own:

```text
src/lib, src/domain          unit tests for the touched modules
src/api, db, jobs            integration test on that boundary
src/pages, src/components    one scripted path when behavior changed
styles, copy                 screenshot of the touched states
schemas, generated clients   existing contract test or replay
```

3. Keep the time box. About two minutes and no browser for a logic change or one boundary. A few minutes more for one broader check. Anything that does not fit, including the full end-to-end pack, visual baselines, and the replay corpus, goes to CI and is named in the record.
4. Run a test this change did not author. When no existing test can fail the claim, add one case and take the assertion from the claim. Say that in the record.
5. Keep the fixture that was already in the repo when the diff does not modify that collaborator. A new mock belongs in the patch only when this change owns the logic and the collaborator is out of scope.
6. Attach four lines to the change: the claim, the command, the result, and the part still uncovered. A screenshot with no command is an image, not a result.
7. Broaden once. If that check is inconclusive, record the gap and stop.

This is the block to paste:

```text
Before reporting done:
1. Write the claim in one sentence, from the task.
2. Run the set the selection rule names, inside the time box. If it does not fit, run the small tests, send the rest to CI, and record the split.
3. If that set cannot see part of the claim, run one broader check. If it is inconclusive, record the gap and stop.
4. Attach four lines to the change: claim, command, result, and what you did not check.
Use a fixture that already exists for any collaborator this diff did not change.
Leave the full end-to-end pack, visual baselines, and replay corpus to CI.
```

### Read the system after it ships

Judge the policy by what happens after merge. A green inner loop only says the selected check passed. Tie a signal to that policy only when the four-line record is attached to the change. Without the record, you know the change failed in production and not which check ran.

**Rollback.** The change was reverted. Read the attached record for the suite that ran and compare it with the failure production saw. When the record shows only unit tests and the failure was a click path or a contract mismatch, widen the selection rule one level. In a graph repo, add the missing edge. If the record shows every impacted target was a cache hit, the edge was missing, or the failure sat outside the graph.

**P0.** A P0 is a severe production incident: data loss, an outage, or a broken critical path that forces an immediate fix or rollback. When one traces to a change the agent verified, add the single case that would have failed, where the selection rule will keep selecting it. The next similar diff then fails inside the time box. The full end-to-end pack stays in CI.

**Regression.** A behavior that used to work breaks, and the selected set stayed green. The rule missed the module, or no test encoded the old behavior. Add the case to the suite the rule already names. If the graph had no edge to that module, add the edge.

Two signals come from the loop itself, before an incident.

**The agent edits the product until a check goes quiet.** The check is flaky. Remove it from the inner loop. Put it back only after two consecutive runs, with no product change between them, fail on the same assertion and the same failure message. A red result on a different assertion is a different failure. CI may keep running the check. The agent does not, until that pair of runs exists.

**The first red result appears in CI, after the agent has stopped.** The selection rule did not include a check that could fail the claim. Widen the rule, or add the edge.

| Signal | What failed in the policy | Change one rule |
| --- | --- | --- |
| Rollback | The recorded suite could not see the production failure | Widen the rule one level, or add the missing edge |
| P0 | No case covered a severe failure | Add one case the rule will keep selecting |
| Regression | An old behavior was not selected, or not encoded | Add the case, or add the missing edge |
| Flake chased to green | The check is unreliable | Remove it until the same assertion fails twice, with no product change |
| First red result is in CI | The rule could not fail the claim | Widen the rule, or add the edge |

### The improvement cycle

![Check, ship, read rollback P0 and regression, change one rule, then check again](/images/agentic-verification-cycle.png)

Each turn changes the harness. The incident is the evidence for that one rule.

1. **Check.** Run the set the selection rule names, inside the time box. Record any overflow sent to CI.
2. **Ship.** Attach the four-line record to the change: claim, command, result, uncovered part. Without it, a later rollback cannot be tied to the check that ran.
3. **Signal.** For changes the agent verified, collect rollbacks, P0s, and regressions. Also note flakes the agent tried to fix, and claims whose first failure showed up in CI.
4. **Adjust.** Classify the miss: wrong claim, rule one level too narrow, missing edge, missing case, flaky check, or missing record. Change one of those. Leave the rest of the rule alone.
5. The next change starts at Check under the new rule. Wait for the same miss to repeat, unless the missing case is already obvious from one severe incident.

### Further reading

- [Agent Settings Is the New Dotfiles](/posts/agent-settings-is-the-new-dotfiles/)
- [Design Review and Perf Review for AI-Eager and AI-Reluctant Engineers](/posts/design-and-perf-review-for-ai-eager-and-ai-reluctant-engineers/)
