# debugging-plugin

Claude Code plugin for systematic debugging — code-level bugs, system-level issues, and long-running bug/fix tracking. Ships primitives for capturing logs, forming and testing hypotheses, diagnosing errors, and documenting fixes, plus a provisioning skill that scaffolds a fresh debugging workspace.

Part of the [danielrosehill Claude Code marketplace](https://github.com/danielrosehill/Claude-Code-Plugins).

## What you get

### Primitives (always available once the plugin is installed)

**Investigation commands** (`/debugging:*`):
- `onboarding` — start a new debugging session and capture the problem statement
- `capture-logs` — ingest and normalise logs, screenshots, or other evidence into the workspace inputs tree
- `isolate-issue` — narrow the failure surface by eliminating variables
- `diagnose-error` — analyse a specific error/stack trace and propose root causes
- `hypotheses` — review, categorise, and update debugging hypotheses
- `status` — report current state of the debugging effort
- `summarize` — generate a comprehensive debugging summary

**Bug-tracking commands** (`/debugging:*`):
- `new-bug` — file a structured bug report
- `document-fix` — record a fix or workaround for a tracked bug
- `search-bugs` — search the bug/fix/workaround knowledge base

**Agents**:
- `analyst` — examines evidence and identifies patterns
- `investigator` — designs and executes hypothesis tests

### Provisioning skill

- `/debugging:new-workspace <name> [--variant=code-debugging|system-debugging|issue-tracking] [--local-only]`

Scaffolds a new workspace (CLAUDE.md + the right directory structure for the chosen variant), personalises it from `~/.claude/CLAUDE.md`, and (by default) creates a public GitHub repo for it.

### Bug Catcher (KDE quick-capture utility)

- `/debugging:bug-catcher`

Installs a hotkey-launchable kdialog quick-pick (`Super+B` recommended) that captures common Linux issues — GPU freeze, audio dropout, crash, OOM, USB, network, recurring — and immediately launches Claude in a fresh konsole with a prompt asking it to grep `journalctl --since '5 minutes ago'` and `dmesg` and propose a fix. Adaptable to GNOME (zenity + gnome-terminal).

## Pattern

Primitives live in the plugin — globally available from any cwd.
Workspace scaffolds are provisioned as **data** — no `.claude/` tree inside provisioned workspaces.
Plugin updates never touch your workspace data.

See [PLAN.md in Claude-Workspace-Reshaping-190426](https://github.com/danielrosehill/Claude-Workspace-Reshaping-190426) for the full pattern spec this plugin follows.

## Variants

- `code-debugging` (default) — investigating a specific software bug. Inputs/outputs structure for logs, screenshots, analysis, and remediation attempts. Includes chronological `debug-log/` and `context/` for the problem statement.
- `system-debugging` — same evidence/analysis shape, oriented for OS/infrastructure/integration-level issues rather than a single codebase.
- `issue-tracking` — long-running bug knowledge base. `bugs/` grouped by component, `fixes/` with root-cause analysis, `workarounds/` for unresolved issues.

## Install

Via the danielrosehill marketplace:

```
/plugin marketplace add danielrosehill/Claude-Code-Plugins
/plugin install debugging
```

## License

MIT.
