# Global Instructions

These instructions apply to every Claude Code session.

## Code Style

<!-- TODO: Define your preferred code style -->
<!-- Examples: -->
<!-- - Use TypeScript with strict mode -->
<!-- - Prefer functional components in React -->
<!-- - Use 2-space indentation -->

## Preferred Tools & Frameworks

<!-- TODO: List your go-to tools and frameworks -->
<!-- Examples: -->
<!-- - React 19 + Next.js 15 for web apps -->
<!-- - Tailwind CSS for styling -->
<!-- - Drizzle ORM for database access -->

## Commit Conventions

<!-- TODO: Define your commit message format -->
<!-- Examples: -->
<!-- - Use conventional commits: feat:, fix:, docs:, refactor:, test:, chore: -->
<!-- - Reference issues with #number -->
<!-- - Keep subject line under 72 characters -->

## Security & Privacy

<!-- TODO: Set your security boundaries -->
<!-- Examples: -->
<!-- - Never commit secrets or API keys -->
<!-- - Always validate user input at system boundaries -->
<!-- - Use parameterized queries for database access -->

## Testing

<!-- TODO: Define your testing expectations -->
<!-- Examples: -->
<!-- - Write unit tests for business logic -->
<!-- - Use React Testing Library for component tests -->
<!-- - Maintain minimum 80% coverage on critical paths -->

## Project Structure

<!-- TODO: Describe your preferred project layout -->
<!-- Examples: -->
<!-- - src/components/ for React components -->
<!-- - src/lib/ for utility functions -->
<!-- - src/hooks/ for custom React hooks -->

## NestJS Skill Usage

When working on NestJS code, load rules from the nestjs-best-practices skill on-demand by prefix:
- `arch-*` for architecture decisions
- `di-*` for dependency injection patterns
- `security-*` for security review
- `perf-*` for performance optimization
- `test-*` for testing patterns
- `db-*` for database/ORM patterns
- `error-*` for error handling
- `api-*` for API design
- `micro-*` for microservices patterns
- `devops-*` for deployment/config

Never load AGENTS.md in full — use individual rule files from rules/ directory.
