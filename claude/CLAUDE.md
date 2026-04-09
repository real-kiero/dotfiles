# Global Claude Code Instructions

## Versioning
- Follow Semantic Versioning: `MAJOR.MINOR.PATCH`
- Increment PATCH for backwards-compatible fixes, MINOR for new backwards-compatible features, MAJOR for breaking changes

## Git Commits
- Use Conventional Commits: `type(scope): description`
- Types: `feat`, `fix`, `refactor`, `chore`, `docs`, `test`, `perf`, `ci`
- Commit in logical chunks — one concern per commit, never batch unrelated changes
- No emojis in commit messages
- Keep subject lines under 72 characters; use the body for the why

## Code Style
- Balance DRY and KISS: eliminate duplication where it adds clarity, but do not abstract prematurely
- Three similar instances may justify an abstraction; one or two do not
- Favour explicit over clever; non-esoteric naming throughout
- Comments explain why, not what; keep them concise
- No emojis in code, comments, or documentation

## Types
- Target ~60% type coverage — annotate public interfaces, function signatures, and non-obvious data shapes
- Do not annotate every internal variable; let inference do its job
- Prefer narrower types over `any` / `unknown` where the shape is known

## Code Quality
- Only validate at system boundaries (user input, external APIs); trust internal guarantees
- Do not add error handling or fallbacks for scenarios that cannot occur
- Do not add speculative abstractions or future-proofing beyond the current requirement
- Prefer editing existing files over creating new ones

## Explanations and Output
- Responses and inline comments must be concise and non-esoteric
- No trailing summaries restating what was just done
- Lead with the answer or change, not the rationale
