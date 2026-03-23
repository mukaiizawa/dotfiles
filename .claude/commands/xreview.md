Review and fix the current uncommitted changes. Follow these steps:

1. Run `git diff` (both staged and unstaged) to see all changes.
2. If the project has a CODESTYLE.md (or CLAUDE.md references code style rules), read it and review the diff against those rules. Fix any violations found (naming conventions, formatting, language, framework-specific restrictions, etc.).
3. Check for dead code in the diff: unused variables, unreachable code, unused imports/usings, functions that are no longer called. Remove any dead code found.
4. After making fixes, run `git diff` again and summarize what was fixed.

Important:
- Only review and fix code that is part of the current diff — do not touch unrelated code.
- If no issues are found, say so and do not make unnecessary changes.
- Only review text files — skip binary files (images, audio, etc.) in the diff.
