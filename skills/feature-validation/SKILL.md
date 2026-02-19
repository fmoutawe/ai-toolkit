---
name: feature-validation
description: Perform a comprehensive validation of a completed feature before requesting PR review and merge. Use when all subtasks of a feature are implemented and merged into the feature branch. Covers full functional validation, edge cases, error cases, performance, code complexity, security, and documentation. Do NOT use for individual subtask validation — use subtask-validation instead.
user-invocable: true
---

# Feature Validation

You are a Senior SWE performing a comprehensive quality validation on a completed feature. All subtasks have been implemented and validated individually. This is the final gate before requesting a PR review and handing off to the product owner for acceptance testing.

## Phase 1 — Full Functional Validation

1. Launch the application on the feature branch
2. Test the **complete user journey** end-to-end — not just individual subtasks, but the entire flow as a user would experience it
3. Verify every acceptance criterion of the feature (not subtask-level — feature-level)
4. Write and run e2e tests using Playwright to cover the main user journeys for non-regression purposes
5. All e2e tests must pass

## Phase 2 — Edge Cases & Error Cases

1. Identify and test edge cases that span multiple subtasks — these are cases that could not be tested at the subtask level because they depend on the full feature being assembled
2. Test error cases systematically:
   - Invalid user inputs (empty fields, wrong formats, boundary values)
   - Network failures (offline, timeout, slow connection)
   - Permission and authentication edge cases
   - Concurrent actions (double clicks, race conditions)
   - Empty states, loading states, error states
3. For each edge case and error case, verify that the UI provides appropriate feedback to the user
4. Write unit tests or e2e tests to cover critical edge cases and error cases

## Phase 3 — Performance

1. Run performance checks using appropriate tools (Lighthouse, browser DevTools, profiling)
2. Verify that the feature does not degrade existing performance metrics:
   - Page load time
   - Time to interactive
   - Bundle size impact
   - API response times
3. If the feature involves data lists, test with realistic data volumes (not just 3 items — test with 100, 1000)
4. Check for memory leaks on pages with dynamic content (mount/unmount cycles, long sessions)
5. Flag any performance regression compared to the state before the feature

## Phase 4 — Code Complexity & Quality

1. Run the project linter and ensure zero warnings/errors on modified files
2. Review the code for unnecessary complexity:
   - Deeply nested conditionals or loops
   - Functions that are too long (> 50 lines as a guideline)
   - Files that have grown too large
   - Duplicated logic that should be extracted
   - Unclear naming or misleading abstractions
3. Verify that the code follows the existing patterns and conventions of the project
4. Check that no dead code, commented-out code, or debug statements remain

## Phase 5 — Security

1. Verify that user inputs are properly validated and sanitized
2. Check for exposed secrets, API keys, or sensitive data in the code
3. Verify that authentication and authorization are correctly enforced on new endpoints or pages
4. Check for common vulnerabilities relevant to the feature (XSS, CSRF, injection)

## Phase 6 — Documentation

1. If the feature introduced major architectural changes, verify that technical documentation is updated
2. If new APIs were created, verify that they are documented (endpoints, parameters, responses)
3. If the feature changes existing user-facing behavior, verify that relevant documentation reflects the changes
4. Do NOT create documentation for minor changes — only for changes that would confuse a developer joining the project

## Final Checklist

Before requesting PR review, confirm:

- [ ] All acceptance criteria validated end-to-end
- [ ] E2e tests written and passing (non-regression)
- [ ] Edge cases and error cases identified and covered
- [ ] All unit tests passing
- [ ] Code coverage above project threshold (default: 80%)
- [ ] No performance regression
- [ ] Linter passes with zero warnings/errors
- [ ] Code complexity is reasonable
- [ ] No security anomalies
- [ ] Documentation updated if necessary
- [ ] Feature branch is clean (no debug code, no TODOs related to this feature)

## What NOT to Do

- Do NOT validate subtask by subtask — this skill is for the assembled feature
- Do NOT skip edge cases testing because subtask validation passed — integration creates new edge cases
- Do NOT skip performance checks even if the feature seems lightweight
- Do NOT write documentation for every change — only for significant ones
- Do NOT approve the feature if any checklist item fails — fix first, re-validate
