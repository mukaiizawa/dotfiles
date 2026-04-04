Lint and fix the current uncommitted changes. Follow these steps:

1. Run `git diff HEAD` to see all changes. If nothing is staged, run `git diff` instead.
2. Skip binary files (images, audio, fonts, compiled assets, etc.) — only lint text/code files.
3. Read CODESTYLE.md if it exists, and any code style rules referenced in CLAUDE.md.
4. For each changed code file, check and fix:
   - **Naming conventions** (e.g. _camelCase for private fields, PascalCase for public)
   - **Formatting rules** (e.g. no blank lines inside function bodies)
   - **Language rules** (e.g. all comments and identifiers must be in English)
   - **Framework-specific rules** (e.g. no `?.` / `??` in Unity MonoBehaviours)
   - **Unused imports / usings** — remove any that are not referenced
   - **Unused variables or parameters** declared in the diff — remove them
   - **Unreachable or dead code** introduced in the diff — remove it
   - **Functions that are no longer called** as a result of the diff — remove them
5. After making fixes, run `git diff HEAD` again and summarize what was fixed.

Important:
- Only lint code introduced or modified in the current diff — do not touch unrelated code.
- Fix violations directly; do not just report them.
- Do not refactor, simplify, or improve logic — only enforce rules.
- If no violations are found, say so and stop.
