---
name: subtask-validation
description: Validate a completed subtask before moving to the next one. Use after finishing the implementation of a subtask, before committing and pushing. Checks functional correctness against acceptance criteria, visual consistency with mockups, unit tests, and code coverage. Do NOT use for final feature validation — use feature-validation instead.
user-invocable: true
---

# Subtask Validation

Perform a quality check on a single completed subtask before moving to the next one. This is a fast, focused validation — not a comprehensive audit.

## Step 1 — Functional Check

1. Launch the application
2. Manually test each acceptance criterion of the current subtask by following the user journey described in the subtask
3. For each criterion, verify the expected behavior matches the actual behavior
4. If a criterion fails, stop the validation and fix the issue before continuing

## Step 2 — Visual Check

1. If mockups exist, open the corresponding designs in Figma MCP
2. Compare the implemented UI with the mockup — layout, spacing, colors, typography, component usage
3. Flag any visual discrepancy that deviates from the design

## Step 3 — Unit Tests

1. Run the unit tests related to the current subtask
2. All tests must pass — zero tolerance for failing tests
3. If tests fail, fix the code or the test before continuing

## Step 4 — Coverage Check

1. Verify that the code coverage for the modified files meets the project threshold (default: 80%)
2. If coverage is below the threshold, write additional tests to cover the missing paths

## What to Do When Validation Fails

- **Functional failure**: Fix the implementation, re-run the validation from Step 1
- **Visual discrepancy**: Fix the UI, re-run Step 2
- **Test failure**: Determine if the test or the code is wrong. Fix accordingly, re-run Step 3
- **Coverage gap**: Write additional unit tests, re-run Step 4

Only proceed to commit and push when all four steps pass.

## Escalation to Technical Analysis

Stop fixing locally and escalate to a new technical-analysis cycle when:
- The fix would impact other planned subtasks
- The subtask decomposition proves inadequate for the problem encountered
- An acceptance criterion is inconsistent with the overall feature goal
- The problem reveals a gap in the initial analysis (missing dependency, wrong assumption, overlooked constraint)

## What NOT to Do

- Do NOT skip the visual check even if there are no obvious issues
- Do NOT move to the next subtask with failing tests or low coverage
- Do NOT perform edge case testing, performance checks, or documentation updates — those belong to the final feature validation
