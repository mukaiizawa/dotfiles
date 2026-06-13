Stage all changes and commit.

1. Run `git add .`
2. Only if the argument is not `nodiff`, run `git diff --staged` to understand the changes.
3. Create the commit with a message derived from the diff (or from
   session context if `nodiff` was specified):
   - Subject: imperative mood, ≤72 chars, no trailing period
   - Body: only if the subject alone is insufficient; bullet points,
     wrapped at 72 chars
   - No trailer lines

Output only the final commit message after committing.
