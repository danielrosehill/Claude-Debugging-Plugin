---
name: new-workspace
description: Provision a new debugging workspace on disk. Use when the user wants to start a new debugging effort (a specific code bug, a system-level issue, or a long-running bug/fix knowledge base). Accepts a workspace name and optional variant (code-debugging | system-debugging | issue-tracking). Scaffolds the workspace, personalises CLAUDE.md from the user's global memory, and (by default) creates a GitHub repo.
disable-model-invocation: true
allowed-tools: Bash(mkdir *), Bash(cp *), Bash(cat *), Bash(git init *), Bash(git add *), Bash(git commit *), Bash(gh repo create *), Bash(gh auth status), Bash(git push *), Read
---

# Provision Debugging Workspace

Creates a new workspace for a debugging effort. This plugin's commands (`/debugging:onboarding`, `/debugging:capture-logs`, `/debugging:diagnose-error`, `/debugging:new-bug`, etc.) are globally available once installed — this skill only provisions the **data scaffold** (CLAUDE.md, context/, inputs/, outputs/, debug-log/ or bugs/fixes/workarounds/) that those commands read from and write to.

## Arguments

`$ARGUMENTS` is parsed as:

- **First positional**: workspace name (kebab-case, used as directory and GitHub repo name). Required.
- **Second positional** (optional): target parent path. Defaults to `~/repos/github/my-repos`.
- **`--variant=<code-debugging|system-debugging|issue-tracking>`** (optional): which scaffold to copy. Default: `code-debugging`.
- **`--local-only`** (optional): skip GitHub repo creation and push. Default: create a public GitHub repo and push.
- **`--private`** (optional): create the GitHub repo as private. Default: public.

### Examples

```
/debugging:new-workspace auth-500-investigation
/debugging:new-workspace nas-smb-dropouts --variant=system-debugging
/debugging:new-workspace personal-bug-tracker --variant=issue-tracking
/debugging:new-workspace scratch-debug --local-only
```

## Procedure

### 1. Parse arguments

Extract workspace name, target parent path, variant, and flags from `$ARGUMENTS`. If workspace name is missing, ask the user for it before proceeding.

### 2. Resolve the scaffold path

The bundled scaffold lives at `${CLAUDE_SKILL_DIR}/../../template/<variant>/`. Confirm it exists. If the variant isn't one of `code-debugging`, `system-debugging`, or `issue-tracking`, tell the user which variants are available.

### 3. Read ambient facts

Read `~/.claude/CLAUDE.md` if it exists. Extract OS, locale, timezone, and user identity facts. These will personalise the workspace's CLAUDE.md at step 5.

### 4. Create the workspace directory

```bash
mkdir -p <target-parent>/<workspace-name>
cp -r ${CLAUDE_SKILL_DIR}/../../template/<variant>/. <target-parent>/<workspace-name>/
```

Do **not** copy any `.claude/` tree. The plugin's primitives are global.

### 5. Personalise CLAUDE.md

Open the new workspace's `CLAUDE.md` and:

- Add a short header noting the workspace name and variant.
- Embed OS/locale/timezone facts from step 3 so downstream commands can skip re-asking.
- Leave problem-specific fields (bug description, target system, affected component) as placeholders for the user to fill via `/debugging:onboarding` or `/debugging:new-bug`.

### 6. Prompt for workspace-specific facts (optional)

If the user volunteered a one-line problem description when invoking the skill, write it into `context/problem-summary.md` (code-debugging/system-debugging) or leave it for `/debugging:new-bug` (issue-tracking). Otherwise, skip — the user will run `/debugging:onboarding` next.

### 7. Initialise git and (optionally) publish

```bash
cd <target-parent>/<workspace-name>
git init
git add .
git commit -m "Initial workspace from debugging plugin"
```

Unless `--local-only` is set:

```bash
gh repo create <workspace-name> --<public|private> --source=. --push
```

Use `--public` by default, `--private` if flag was passed.

### 8. Print next steps

Tell the user:

- Workspace path.
- Variant chosen.
- Suggested first command:
  - `code-debugging` / `system-debugging` → `/debugging:onboarding` to capture the problem, then `/debugging:capture-logs` as evidence arrives.
  - `issue-tracking` → `/debugging:new-bug` to file the first report.
- Reminder that the workspace is **data** — they can delete/move it freely without losing the plugin's commands.

## Notes

- The scaffold path must be resolved via `${CLAUDE_SKILL_DIR}/../../template/` (not `${CLAUDE_PLUGIN_ROOT}` — that variable isn't exported in skill bash injection, only in hooks/MCP).
- Never copy `.claude/commands/`, `.claude/agents/`, or `.claude/skills/` into the new workspace. If the user wants workspace-local overrides, they can add them manually later.
- Don't hard-code any personal paths or identifiers here — everything comes from user memory or prompts.
