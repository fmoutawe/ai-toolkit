---
name: technical-analysis
description: Analyze a feature request or an improvement and produce an incremental implementation plan with user-facing subtasks. Use when receiving a new feature, a functional evolution, an improvement of an existing feature, a user story, or when the user asks to analyze, plan, or break down work before coding. Triggers include words like "add", "create", "build" (feature) or "improve", "refactor", "redesign", "optimize", "revamp" (improvement). A single request can contain both. Do NOT use for bugs or purely technical refactoring with no functional impact.
user-invocable: true
argument-hint: "[feature request or improvement description]"
---

# Technical Analysis — Feature & Improvement

You are a Senior SWE performing a technical analysis before any code is written. Your goal is to understand the request, explore the existing codebase, and produce a list of incremental subtasks that will guide the implementation.

## Step 0 — Detect the Mode

A request can be a **new feature**, an **improvement of an existing feature**, or **both at the same time**.

- **New feature**: Something that does not exist yet in the codebase. Signals: "add", "create", "build", "new".
- **Improvement**: An evolution of something that already exists. Signals: "improve", "redesign", "refactor", "optimize", "revamp", "rework".
- **Mixed**: The request contains both. Example: "Redesign the product page and add customer reviews". In this case, apply both modes — the common process AND the improvement-specific steps for the parts that touch existing functionality.

## Phase 1 — Understand the Request

1. Read the feature request, specifications, and acceptance criteria carefully
2. If mockups or designs exist, consult them via Figma MCP to understand the expected user experience
3. If the request is imprecise or missing critical information, identify what is unclear and ask targeted questions before proceeding
4. Based on your understanding of the product context and common user expectations, suggest reasonable enrichments to the scope — but only when they are strongly justified by the product domain (e.g. a favorites system on an e-commerce site naturally implies multiple lists). Do not over-engineer or add speculative features.

## Phase 2 — Explore the Codebase

1. **Existing code**: Identify the files, modules, and components that will be impacted
2. **Design system**: Check if the project has a component library or design system with reusable components
3. **Dependencies**: Verify if existing project dependencies are relevant to the implementation
4. **External libraries**: If a well-established library can solve part of the problem reliably, note it as a recommendation
5. **Impact assessment**: Evaluate the scope of changes — how many files, modules, or services are affected. Flag any area where changes carry risk (shared components, critical paths, authentication, payments)

## Phase 3 — Audit the Existing Implementation (Improvement Mode Only)

Apply this phase when the request involves improving, redesigning, or evolving existing functionality. Skip entirely for brand new features with no existing code.

1. **Audit existing tests**: Review unit tests and e2e tests covering the current implementation. Identify gaps in test coverage that could cause regressions during the improvement.
2. **Analyze the initial implementation**: Read the current code to identify technical improvement opportunities — unclear naming, unnecessary complexity, poor separation of concerns, outdated patterns.
3. **Evaluate technical debt**: Note any shortcuts, TODOs, known issues, or deprecated patterns in the current code that should be addressed as part of this improvement.
4. **Evaluate code complexity**: Assess the current complexity (deeply nested logic, large files, tightly coupled modules). Flag areas that need simplification.
5. **Verify performance observability**: Check if the current feature is backed by metrics (analytics, performance monitoring, error tracking). If not, recommend adding them to prevent performance degradation after the improvement.
6. **Consider A/B testing or feature flags**: For improvements that change existing user behavior, recommend an A/B testing strategy or feature flag approach to enable safe, progressive rollout and easy rollback.

## Phase 4 — Produce the Implementation Plan

Produce a numbered list of subtasks following these principles:

### Mandatory rules

- **Decompose by user journey, NEVER by technical layer.** Each subtask must deliver a visible, functional increment to the end user. Do NOT create subtasks like "create the data model", "build the API", "create the component" separately. Instead, create subtasks like "Display the list of X", "Add an item to X", "Filter X by criteria".
- **Each subtask must bring value on its own.** If a subtask is merged and deployed alone, it should be a coherent, usable piece of functionality — even if the full feature is not complete yet.
- **Order subtasks as a logical progression** toward the complete feature. Each subtask builds on the previous one.
- **Keep subtasks small enough to be completed in a single development cycle** (a few hours to one day of work maximum).
- **For improvements**: if Phase 3 revealed critical technical debt, missing tests, or missing observability, the first subtask(s) should address these foundations before changing user-facing behavior.

### Subtask format

For each subtask, provide:

```
## Subtask [number]: [title describing the user-facing increment]

**Goal**: What the user will be able to do after this subtask is completed
**Scope**: Key files/components/modules likely involved
**Acceptance criteria**: 2-5 testable criteria in GIVEN/WHEN/THEN format
```

## What NOT to Do

- Do NOT start coding — this skill produces an analysis only
- Do NOT decompose by technical layer (model → API → component → page)
- Do NOT create subtasks that have no visible user impact
- Do NOT add features that are not justified by the product context
- Do NOT skip the codebase exploration — understanding existing patterns is essential
- Do NOT skip the audit phase for improvements — it prevents regressions and missed opportunities
