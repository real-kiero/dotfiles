## Trackers and shared records
- Never write to Jira, Confluence or any other tracker, wiki or shared record (comments, transitions, field edits, attachments, creates, deletes) without my go-ahead for that specific write. Draft it, show me, wait. One approval covers one write. Reading is fine
- Git pushes follow the project's CLAUDE.md, not this rule

## Git
- Commit subjects and PR titles use Conventional Commits: `type(scope): description`, types `feat|fix|refactor|chore|docs|test|perf|ci`
- One concern per commit. Subject under 72 characters; the body says why

## Writing for other people
- It stands alone: the reader can understand and act without opening linked tickets, specs or chats. Links are for detail and evidence, not explanation
- PR descriptions: open with a plain-English overview of the problem, what users saw, and what the change does and for whom. Then changes grouped by area, how it was tested, where to look hardest, and what is deliberately left out and why (one line each). Ticket keys, spec sections and earlier PRs go last, as references

## Communication
- Lead with the answer. Default to one short paragraph. Reviews and summaries: verdict, then at most three short paragraphs, under 100 words. Past about five paragraphs, give the core and name in one line what else you could cover
- Longer answers: short paragraphs, each opening with its point, so the first sentences alone give the gist
- Explain only as far as I need to understand or act. Cut preamble, recaps, offers of help and background I already have. Don't narrate tool use; report the result
- Assume I am not an expert. Define unfamiliar terms and internal labels (rule IDs, gate codes, shorthand) in plain words on first use, here and in anything for others. Explain in layers, one new idea at a time; use an example or analogy when it lands faster
- In summaries, leave out paths, line numbers, hashes and code names unless I need them to act, and say in one line that the evidence is checked. Keep them in instructions I will carry out
- Drafts and anything I review go inline, never in a file. For bulky output (logs, large diffs), show the lines that matter and summarise the rest
- Narrow terminal: no tables or headings. Lists only for 3 to 5 parallel items
- If ambiguity would change the outcome, give each reading in one sentence and ask; otherwise pick the obvious one and say which. Name any simpler approach in one sentence
- Plain words, short sentences, active verbs. No em-dashes or emojis anywhere
- Avoid AI tells: "it's worth noting", "importantly", "let's", "here's", "comprehensive", "robust", "seamless", "leverage", "delve", rhetorical questions, lists of three for rhythm, "not just X but Y", bold for emphasis

## Code
- Minimum code that solves the problem. Build only what was asked or agreed, UI, labels and messages included: no drive-by refactors, reformatting, comment edits, speculative features or config. If something looks needed, propose it in one line and wait
- Remove what your change made unused. Flag pre-existing dead code; don't delete it
- Tolerate two copies; abstract at the third only if that reads simpler
- Explicit over clever; plain, descriptive names; comments say why, not what
- Validate only at system boundaries (user input, external APIs); no handling for impossible cases
- Annotate public interfaces and non-obvious data shapes; let inference do the rest. Narrow types over `any`/`unknown`. Suppress a type error only when the checker is wrong, with a comment saying why

## Verification
- Bugs: failing test, fix, confirm it passes. New behaviour: tests before or alongside the code. Refactors: tests pass before and after. These tests are in scope
- Multi-step tasks: state a short plan with a check per step first. Trivial tasks (one file, no interface or behaviour change, under about 20 lines) skip the plan and test-first
- Before calling anything done, run the project's build, typecheck and lint; it catches most AI-introduced breakage cheaply
- If no test was added, say why in one line
