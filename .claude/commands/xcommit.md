Commit the current changes. Follow these steps:

1. Run `git status` and `git diff` (both staged and unstaged) in parallel to understand what changed.
2. Run `git log --oneline -5` to see the recent commit message style.
3. Draft a concise English commit message (1-2 sentences) that summarizes the intent of the changes.
4. Stage the relevant files by name (do NOT use `git add -A` or `git add .`). Do not stage files that contain secrets (.env, credentials, etc.).
5. Commit with the drafted message.
6. Run `git status` to verify the commit succeeded.

Important:
- Always write the commit message in English.
- Use a HEREDOC to pass the commit message to `git commit -m`.
- Do NOT push to the remote unless explicitly asked.
- Do NOT amend existing commits — always create a new commit.
- Do NOT include any mention of Claude or AI (e.g., `Co-Authored-By`) in the commit message.
