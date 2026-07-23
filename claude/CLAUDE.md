# Global Claude Code Instructions

Bias toward caution over speed. Skip ceremony on trivial tasks — single file, no public interface or behaviour change, roughly under 20 lines; everything else is non-trivial.

## Versioning
- Follow Semantic Versioning: `MAJOR.MINOR.PATCH`
- PATCH for backwards-compatible fixes, MINOR for backwards-compatible features, MAJOR for breaking changes

## Git Commits
- Use Conventional Commits: `type(scope): description`
- Types: `feat`, `fix`, `refactor`, `chore`, `docs`, `test`, `perf`, `ci`
- One concern per commit — never batch unrelated changes
- Subject lines under 72 characters; explain why in the body

## Communication
- When a task is ambiguous, name competing interpretations rather than silently picking one
- Flag simpler approaches than what was asked
- Otherwise skip the preamble: lead with the answer or change, no trailing summary of what was done

## Code Style
- Duplicate up to two similar instances; abstract on the third only if the result is simpler to follow than the duplication
- Minimum code that solves the problem — no speculative features, configurability, or flexibility not requested
- Explicit over clever; non-esoteric naming throughout
- Comments explain why, not what — keep concise
- No emojis — code, comments, commits, docs, or responses

## Surgical Changes
- Touch only what the task requires; every changed line should trace to the request
- Don't "improve" adjacent code, comments, or formatting while you're in there
- Don't refactor working code; match existing style even if you'd choose differently
- Clean up only your own mess: remove imports/variables/functions your change made unused
- Flag pre-existing dead code; don't delete it

## Types
- Annotate public interfaces, function signatures, and non-obvious data shapes
- Don't annotate every internal variable; let inference do its job
- Prefer narrower types over `any`/`unknown` where the shape is known
- Suppressing a type error is fine when the checker is wrong (e.g. missing stubs for an untyped dependency) — comment why; never suppress silently

## Code Quality
- Validate only at system boundaries (user input, external APIs); trust internal guarantees
- No error handling or fallbacks for scenarios that cannot occur
- Prefer editing existing files over creating new ones

## Goal-Driven Execution
- Bugs: reproduce with a test first, then fix, then confirm it passes
- New behaviour or validation: write the test(s) it must satisfy before or alongside implementation
- Refactors: tests pass before and after; behaviour doesn't change unless that's the explicit goal
- Tests added to satisfy this section are in scope, not scope creep
- Before calling a change done, run the project's build/typecheck/lint if one exists — cheaper than a test, catches most AI-introduced breakage
- Applies to non-trivial changes in projects with an existing or reasonable test harness. Trivial edits skip silently; non-trivial changes in harness-less repos still get a one-line note that no test was added
- For multi-step tasks, state a short plan with a verification check per step before starting
