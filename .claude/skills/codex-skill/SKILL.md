---
name: codex-skill
description: Select the Codex skill under ~/.codex/skills that fits the given request and execute it as Codex would for `$<skill> <request>`.
argument-hint: <request>
disable-model-invocation: true
---

# Codex Skill

Run a Codex skill from Claude Code. `/codex-skill <request>` should behave like
invoking the matching Codex skill with the same request in Codex.

## Invocation boundary

- Execute this skill only when the user explicitly invokes it with
  `/codex-skill`. Never activate it based on semantic task matching.
- The explicit `/codex-skill` invocation counts as the explicit invocation
  (`$<skill>`) that a Codex skill may require.

## Request

$ARGUMENTS

## Workflow

1. If the request is empty, ask the user for it and stop.
2. Read the frontmatter (`name`, `description`) of every
   `~/.codex/skills/*/SKILL.md`. Exclude `~/.codex/skills/.system`.
3. Select the single skill that best fits the request.
   - If the request names a skill, use it.
   - If no skill fits, report that and stop. Do not handle the request
     without a skill.
   - If multiple skills fit equally, ask the user which one to use.
4. Tell the user which skill was selected in one line.
5. Read the selected `SKILL.md` in full. Read referenced files (`references/`,
   `scripts/`, and so on) as the skill instructs. Resolve relative paths
   against the skill directory.
6. Follow the skill instructions with the request as the user input.

## Adapting Codex-specific instructions

- Ignore `agents/` directories; they hold Codex-only configuration.
- Treat Codex sandbox escalation instructions as ordinary command execution
  under Claude Code permissions.
- Treat `.codex/project-context/` and similar paths as they are written; do not
  substitute `.claude/` paths.
- If an instruction depends on Codex internals that do not exist in Claude Code
  (for example, Codex session files), report it and stop instead of
  improvising a substitute.
- Do not modify files under `~/.codex/skills`.
