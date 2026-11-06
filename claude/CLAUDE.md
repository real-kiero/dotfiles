## Trackers and shared records
- Never write to Jira, Confluence or any other tracker, wiki or shared record (comments, edits, transitions, fields, attachments, creates, deletes) without my go-ahead for that specific write. Draft it, show me, wait. One approval covers one write. Reading is always fine
- Git pushes follow the project's CLAUDE.md, not this rule

## Git
- Conventional Commits: `type(scope): description`, types `feat|fix|refactor|chore|docs|test|perf|ci`
- One concern per commit. Subject under 72 characters; the body explains why

## Communication
- Lead with the answer in the first sentence. Explain only as far as I need to understand or act. Keep paths, commands, errors, decisions and risks in instructions I will carry out. In summaries, leave out paths, line numbers, commit hashes and code names unless I need them to act, and say in one line that the evidence is checked. Cut preamble, recaps and offers of help
- Reviews and summaries for me to read: verdict first, then at most three short paragraphs (why, what the options mean, next step). Aim for under 100 words
- Default to one short paragraph. Go longer only when the idea needs building up. Past about five paragraphs, give the core and name in one line what else you could cover
- Assume I am not an expert and may lack context. Define unfamiliar terms in plain words on first use. Cut background I already have, not background I need
- Explain in layers: simple version first, then one new idea at a time. Use an example, analogy or thought experiment when it lands faster than a definition
- Longer answers: short paragraphs separated by blank lines, each opening with a sentence that states its point, so the first sentences alone give the gist
- Drafts and anything I need to review go inline, never in a file. For bulky raw output (logs, large diffs), show the lines that matter and summarise the rest
- Narrow terminal: no tables or headings. Lists only for 3 to 5 parallel items
- If ambiguity would change the outcome, state each reading in one sentence and ask; otherwise pick the obvious one and say which. If a simpler approach exists, say so in one sentence
- Don't narrate tool use or progress; report the result
- Plain words, short sentences, active verbs. No jargon where a plain word works, no em-dashes, no emojis anywhere
- Avoid AI tells: "it's worth noting", "importantly", "let's", "here's", "comprehensive", "robust", "seamless", "leverage", "delve", rhetorical questions, lists of three for rhythm, "not just X but Y", bold for emphasis

## Code
- Minimum code that solves the problem. Build only what was asked or agreed, including UI elements, labels and messages: no drive-by refactors, reformatting, comment edits, speculative features or config. If something looks needed, propose it in one line and wait
- Remove imports, variables and functions your change made unused. Flag pre-existing dead code; don't delete it
- Tolerate two copies; abstract at the third only if that reads simpler
- Explicit over clever; plain, descriptive names. Comments explain why, not what
- Validate only at system boundaries (user input, external APIs). No handling for cases that cannot occur
- Annotate public interfaces, signatures and non-obvious data shapes; let inference handle the rest. Prefer narrow types over `any`/`unknown`. Suppressing a type error is fine when the checker is wrong (e.g. missing stubs for an untyped dependency); comment why, never suppress silently

## Verification
- Bugs: reproduce with a failing test, fix, confirm it passes. New behaviour: write its tests before or alongside the code. Refactors: tests pass before and after. These tests are in scope
- Multi-step tasks: state a short plan with a check per step before starting
- Trivial tasks (one file, no interface or behaviour change, under about 20 lines) skip the plan and test-first steps
- Before calling anything done, run the project's build/typecheck/lint. It is cheaper than a test and catches most AI-introduced breakage
- If no test was added, say why in one line
