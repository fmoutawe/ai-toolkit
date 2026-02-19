---
name: feature-validation
description: Comprehensive validation of a completed feature before PR review and PO acceptance testing. Use when all subtasks of a feature are implemented and merged into the feature branch. Checks end-to-end user journey, edge cases, error cases, performance, code complexity, security, and documentation. Do NOT use for individual subtask validation — use subtask-validation instead.
user-invocable: true
---

# Feature Validation

Perform a comprehensive quality validation on a completed feature. All subtasks must be implemented and validated individually before running this validation. This is the final gate before PR review and PO acceptance testing.

## Phase 1 — Full Functional Validation

1. Test the **complete user journey** end-to-end — not individual subtasks, but the entire flow as a user would experience it
2. Verify every feature-level acceptance criterion (not subtask-level)
3. Write and run e2e tests (Playwright) covering the main user journey for non-regression
4. All e2e tests must pass before proceeding

## Phase 2 — Edge Cases & Error Cases

1. Identify and test edge cases that span multiple subtasks
2. Systematically test error cases:
   - Invalid inputs (empty, wrong format, boundary values)
   - Network failures (offline, timeout, slow connection)
   - Permission and authentication edge cases
   - Concurrent actions (double clicks, race conditions)
   - Empty states, loading states, error states
3. Verify appropriate UI feedback for each error case
4. Write tests for critical edge and error cases

## Phase 3 — Performance

1. Run Lighthouse, DevTools profiling, or relevant performance tools
2. Verify no degradation against pre-feature baseline: page load, time to interactive, bundle size, API response times
3. Test with realistic data volumes (100, 1000 items), not minimal test data
4. Check for memory leaks (mount/unmount cycles, long sessions)
5. Flag any regression versus the pre-feature state

## Phase 4 — Code Complexity & Quality

1. Run the linter — zero warnings, zero errors
2. Review for unnecessary complexity (nesting, long functions, large files, duplication, unclear naming)
3. Verify adherence to existing project patterns and conventions
4. Check for dead code, commented-out code, debug statements, console.log

## Phase 5 — Security

1. Verify input validation and sanitization on new inputs
2. Check for exposed secrets, API keys, or tokens
3. Verify authentication and authorization on new endpoints or pages
4. Check for common vulnerabilities: XSS, CSRF, injection

## Phase 6 — Documentation

1. Update technical documentation only for major architectural changes
2. Document new API endpoints (parameters, responses, error codes)
3. Update documentation for changed user-facing behavior
4. Do NOT document minor internal changes

## Final Checklist

All items must pass before requesting PR review:
- [ ] All acceptance criteria validated end-to-end
- [ ] E2e tests written and passing
- [ ] Edge and error cases identified and covered
- [ ] All unit tests passing
- [ ] Coverage above project threshold
- [ ] No performance regression
- [ ] Linter passes (zero warnings, zero errors)
- [ ] Code complexity reasonable
- [ ] No security anomalies
- [ ] Documentation updated if necessary
- [ ] Feature branch clean (no debug code, no stale TODOs)

## Escalation

Stop fixing locally and escalate when:
- A performance regression requires architectural changes
- A security issue cannot be patched without redesigning the feature
- Edge cases reveal that the feature decomposition was fundamentally wrong
- The fix scope exceeds what can be reasonably done before the PR review

## What NOT to Do

- Do NOT validate subtask by subtask — validate the feature as a whole
- Do NOT skip edge case or error case testing
- Do NOT skip performance checks even if the feature seems lightweight
- Do NOT write excessive documentation for minor changes
- Do NOT approve if any item in the final checklist fails
