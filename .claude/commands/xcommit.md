Commit the current changes. Follow these steps:

1. Check if arguments were passed to this command (e.g., `/xcommit Assets/Scripts/`, `/xcommit only .cs files`, `/xcommit the UI-related changes`).
   - If **no arguments**: all changed and untracked files are the commit target.
   - If **arguments are provided**: interpret them to determine which files to target. Arguments may be:
     - Explicit file paths or directories (e.g., `Assets/Scripts/Foo.cs`, `Assets/Scenes/`)
     - Glob-style patterns (e.g., `*.java`, `**/*.cs`)
     - Natural language descriptions (e.g., "only Java files", "UI-related changes", "files in the Scripts directory")
     For natural language, run `git status` first, then use your judgment to select the matching files from the changed file list.
2. Run `git status` and `git diff` (both staged and unstaged) in parallel to understand what changed.
3. Determine the final list of files to commit based on step 1. If the argument was ambiguous, briefly state which files you selected and why before proceeding.
4. If any files in the target set contain secrets (.env, credentials, etc.), do NOT proceed to commit. Report the files and stop.
5. If refactoring is needed (dead code, commented-out code, unused variables/imports, etc.) in the target files, perform the cleanup first but do NOT proceed to commit. Report what was cleaned up and stop so the user can verify.
6. Stage the target files:
   - If no arguments: `git add .`
   - If specific files/directories were determined: `git add <file1> <file2> ...`
7. Run `git log --oneline -5` to see the recent commit message style.
8. Draft a concise English commit message (1-2 sentences) that summarizes the intent of the changes.
9. Commit with the drafted message.
10. Run `git status` to verify the commit succeeded.

Important:
- Always write the commit message in English.
- Use a HEREDOC to pass the commit message to `git commit -m`.
- Do NOT push to the remote unless explicitly asked.
- Do NOT amend existing commits — always create a new commit.
- Do NOT include any mention of Claude or AI (e.g., `Co-Authored-By`) in the commit message.
- When no arguments are provided, always use `git add .` to stage all changes.
