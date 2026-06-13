Commit the currently staged changes with an appropriate commit message.

1. Run `git diff --staged`. If nothing is staged, stop.
2. Create the commit with a message derived from the diff:
   - Subject: imperative mood, ≤72 chars, no trailing period
   - Body: only if the subject alone is insufficient; bullet points,
     wrapped at 72 chars
   - No trailer lines

Output only the final commit message after committing.
