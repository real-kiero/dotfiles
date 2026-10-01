# Global Claude Code Instructions

## Ticket and Tracker Authority
- Never write to Jira, Confluence or any other tracker, wiki or shared record without my go-ahead for that specific write. This covers comments, edits, transitions, fields, attachments, new items and deletions. Reading is always fine
- Draft it, show me, wait. One approval covers one write only
- Git pushes follow the project's CLAUDE.md, not this rule

## Git Commits
- Use Conventional Commits: `type(scope): description`
- Types: `feat`, `fix`, `refactor`, `chore`, `docs`, `test`, `perf`, `ci`
- One concern per commit; never batch unrelated changes
- Subject lines under 72 characters; explain why in the body
- Version numbers follow SemVer (`MAJOR.MINOR.PATCH`)

## Communication
- Maximum 3 short paragraphs per response. Most answers should be 1 paragraph. Exceed this only when I ask.
- My terminal is narrow. Never use tables or headings. Use a list only for 3 or more parallel items, maximum 5.
- Lead with the answer or change. Keep paths, commands, errors, decisions and risks; cut preamble, recaps, offers of help and background I did not ask for.
- If ambiguity would change the outcome, state each reading in one sentence and ask. Otherwise pick the obvious one and say which.
- If a simpler approach exists than the one requested, say so in one sentence.
- For long output (diffs, logs, plans, file listings), write it to a file. Reply with the path and a two-sentence summary.
- Do not narrate tool use or progress. Report the result.
- Plain words, short sentences, active verbs. No em-dashes.
- Avoid AI tells: "it's worth noting", "importantly", "let's", "here's", "comprehensive", "robust", "seamless", "leverage", "delve", rhetorical questions, lists of three for rhythm, "not just X but Y", bold for emphasis.

## Code Style
- Tolerate two copies; abstract at the third only if that reads simpler than the duplication
- Minimum code that solves the problem: no speculative features, configurability, or flexibility not requested
- Explicit over clever; plain, descriptive names
- Comments explain why, not what; keep them concise
- No emojis in code, comments, commits, docs, or responses

## Surgical Changes
- Every changed line must trace to the request. No drive-by refactors, reformatting or comment edits
- Remove imports, variables and functions your change made unused
- Flag pre-existing dead code; don't delete it

## Types
- Annotate public interfaces, function signatures, and non-obvious data shapes
- Don't annotate every internal variable; let inference do its job
- Prefer narrower types over `any`/`unknown` where the shape is known
- Suppressing a type error is fine when the checker is wrong (e.g. missing stubs for an untyped dependency). Comment why; never suppress silently

## Code Quality
- Validate only at system boundaries (user input, external APIs). No error handling or fallbacks for cases that cannot occur
- Prefer editing existing files over creating new ones

## Goal-Driven Execution
- Trivial task (one file, no public interface or behaviour change, roughly under 20 lines): skip the plan and test-first steps. Still run build/typecheck/lint
- Bugs: reproduce with a test first, then fix, then confirm it passes
- New behaviour or validation: write the test(s) it must satisfy before or alongside implementation
- Refactors: tests pass before and after; behaviour doesn't change unless that's the explicit goal
- Tests added to satisfy this section are in scope, not scope creep
- Before calling a change done, run the project's build/typecheck/lint if one exists. It is cheaper than a test and catches most AI-introduced breakage
- In repos with no test harness, note in one line that no test was added
- If a change cannot sensibly be tested, say why in one line
- For multi-step tasks, state a short plan with a verification check per step before starting
