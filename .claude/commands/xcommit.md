Commit the current changes. Follow these steps:

1. Run `git status` and `git diff` (both staged and unstaged) in parallel to understand what changed.
2. If any changed files contain secrets (.env, credentials, etc.), do NOT proceed to commit. Report the files and stop.
3. If refactoring is needed (dead code, commented-out code, unused variables/imports, etc.), perform the cleanup first but do NOT proceed to commit. Report what was cleaned up and stop so the user can verify.
4. Stage ALL changed and untracked files with `git add .`. Do NOT selectively stage files — always stage everything.
5. Run `git log --oneline -5` to see the recent commit message style.
6. Draft a concise English commit message (1-2 sentences) that summarizes the intent of the changes.
7. Commit with the drafted message.
8. Run `git status` to verify the commit succeeded.

Important:
- Always write the commit message in English.
- Use a HEREDOC to pass the commit message to `git commit -m`.
- Do NOT push to the remote unless explicitly asked.
- Do NOT amend existing commits — always create a new commit.
- Do NOT include any mention of Claude or AI (e.g., `Co-Authored-By`) in the commit message.
- Do NOT selectively stage files. Always use `git add .` to stage all changes, even if some changes appear unrelated to the current task.
