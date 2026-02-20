# Global Instructions

These instructions apply to every Claude Code session and every sub-agent in this workspace.

## Code Style

- TypeScript strict mode for all projects
- Functional components with React Hooks (no class components)
- Explicit typing — avoid `any`, prefer `unknown` when type is uncertain
- Named exports over default exports
- Barrel files (`index.ts`) for public module APIs only
- 2-space indentation, single quotes, trailing commas
- **Banned**: styled-components — use Tailwind CSS or CSS Modules instead
- Every shared UI component must have a Storybook story
- Use design tokens for all visual values (colors, spacing, typography) — no hardcoded values

## Design Tokens

All design tokens follow the [W3C Design Tokens Format Module](https://www.designtokens.org/TR/2025.10/format/) (DTCG 2025.10).

- Token files use the `.tokens.json` extension
- Each token declares `$value`, `$type`, and optionally `$description`
- Group tokens in nested objects; use `{}` groups for logical namespaces (e.g., `color.brand.primary`)
- Reference other tokens with alias syntax: `"{color.base.blue}"`
- Supported types include `color`, `dimension`, `fontFamily`, `fontWeight`, `duration`, `cubicBezier`, `number`, and `shadow`
- Transform tokens into platform outputs (CSS custom properties, Tailwind theme, Swift/Kotlin constants) with **Style Dictionary**
- Never hardcode visual values — always reference tokens from the shared design tokens package

## Naming Conventions

- Files: `kebab-case.ts` (e.g., `user-profile.service.ts`)
- Classes: `PascalCase` (e.g., `UserProfileService`)
- Functions / variables: `camelCase`
- Constants: `UPPER_SNAKE_CASE`
- React components: `PascalCase` file and export (e.g., `UserCard.tsx`)
- Test files: `*.spec.ts` (co-located with source)

## Import Ordering

Separate each group with a blank line:

1. Node built-ins (`node:fs`, `node:path`)
2. External packages (`react`, `@nestjs/*`)
3. Workspace imports (`@libs/*`, `@shared/*`)
4. Relative imports (`./`, `../`)

## Tech Stack

| Domain | Default | Also used |
|--------|---------|-----------|
| Language | TypeScript (strict) | — |
| Frontend Web | Next.js (React) | Remix, Astro (SSR alternatives) |
| Styling | Tailwind CSS | CSS Modules |
| Backend | NestJS | Express (legacy only) |
| Mobile | React Native + Expo | Swift / Kotlin (native modules) |
| State Management | Context API / Zustand | Redux (complex flows only) |
| ORM | Prisma | TypeORM (legacy only) |
| Testing | Vitest + React Testing Library | Playwright (E2E) |
| Monorepo | NX | Turborepo |
| Design Tokens | Style Dictionary | — |
| UI Library | Storybook | — |
| CI/CD | GitHub Actions | — |

## Core Development Philosophy

All agents and sessions follow these principles. Do not duplicate them in individual agent files.

### 1. SOLID Principles

- **Single Responsibility**: One module, one reason to change
- **Open/Closed**: Extend behavior without modifying existing code
- **Liskov Substitution**: Subtypes must be substitutable for their base types
- **Interface Segregation**: Prefer small, focused interfaces over large ones
- **Dependency Inversion**: Depend on abstractions, not implementations

### 2. Process & Quality

- **KISS**: Choose the simplest solution that meets the requirements. Avoid over-engineering.
- **Iterative Delivery**: Ship small, vertical slices of functionality — each deployable independently
- **Understand First**: Analyze existing patterns, read the code, before writing new code
- **Test-Driven**: Write tests before or alongside implementation. All code must be tested.
- **Quality Gates**: Every change must pass linting, type checks, and tests before merge. Failing builds never merge.

### 3. Craftsmanship Standards

- **Readability over cleverness**: Code is read 10x more than it is written
- **Composition over inheritance**: Favor composable functions and modules
- **Explicit error handling**: Fail fast with descriptive errors. Log meaningful context.
- **API contract integrity**: Never change API contracts without updating documentation and consumers
- **No dead code**: Remove unused imports, functions, and variables. No commented-out code.

### 4. Decision Framework

When multiple solutions exist, prioritize in this order:
1. **Testability** — Can this be tested in isolation?
2. **Readability** — Will another developer understand this in 6 months?
3. **Consistency** — Does it follow existing patterns in the codebase?
4. **Simplicity** — Is it the least complex option that works?
5. **Reversibility** — How easily can this be changed or replaced?

## Commit Conventions

- Conventional commits: `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`, `perf:`
- Use scopes matching NX project names: `feat(api):`, `fix(web):`, `chore(ui):`
- Reference issues with `#number` when applicable
- Subject line under 72 characters
- Body explains the "why", not the "what"

## Security & Privacy

- Never commit secrets, API keys, or tokens
- Always validate user input at system boundaries
- Use parameterized queries for database access
- Environment variables for all configuration — never hardcode
- Deny patterns in settings.json: `.env`, `.env.*`

## Testing

- Vitest for unit tests and integration tests
- React Testing Library for component tests (test behavior, not implementation)
- Playwright for E2E tests on critical user flows
- Minimum 80% coverage on critical paths (auth, payments, data mutations)

## Project Structure

NX monorepo with shared UI library, shared packages, and applications. Hexagonal architecture with module-first organization inside each package/app. Domain layer (entities, use-cases, ports) has zero framework dependencies. Adapters are wired via dependency injection at the module level. Each agent receives framework-specific hexagonal mapping in its own instructions.

## Workflows

Infer the appropriate workflow from the user's prompt. Do not ask which workflow to use — detect the intent and follow the sequence. Each arrow (→) means: complete the current step fully before starting the next.

### Feature (new feature, significant change, new module)

```
technical-analysis
  → [for each subtask]: subtask-validation → implement → test-automator
  → feature-validation
  → code-reviewer + security-auditor + performance-engineer (parallel)
  → devops-engineer (only if the feature requires CI/CD or infra changes)
```

### Debug (bug, crash, test failure, unexpected behavior)

```
debugger
  → implement fix
  → test-automator (add regression test)
  → code-reviewer
```

### Refactor (code improvement, optimization, tech debt)

```
technical-analysis
  → implement
  → test-automator (verify no regressions)
  → code-reviewer + performance-engineer (parallel)
```

### Review (PR review, pre-deploy audit)

```
code-reviewer + security-auditor + performance-engineer (parallel)
```

## NestJS Skill Usage

When working on NestJS code, load rules from the nestjs-best-practices skill on-demand by prefix: `arch-*` for architecture, `di-*` for dependency injection, `security-*` for security, `perf-*` for performance, `test-*` for testing, `db-*` for database, `error-*` for error handling, `api-*` for API design, `micro-*` for microservices, `devops-*` for deployment. Never load AGENTS.md in full — use individual rule files from rules/ directory.

## Agents

Sub-agents are defined in the `agents/` directory. They inherit all conventions from this file. Do not duplicate Core Development Philosophy or Tech Stack in agent files.
