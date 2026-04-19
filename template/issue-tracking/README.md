# Bug Tracker Workspace

Provisioned by the [`debugging` Claude Code plugin](https://github.com/danielrosehill/debugging-plugin). A structured, persistent knowledge base for bugs, fixes, workarounds, and root-cause analyses.

## Quick Start

1. `/debugging:new-bug` — file a bug report (from a URL, pasted content, or verbal description)
2. `/debugging:document-fix` — record a fix or workaround for an existing bug
3. `/debugging:search-bugs` — search the knowledge base by keyword, component, status, or severity

## Structure

```
bugs/          bug reports grouped by component (e.g. bugs/nginx/, bugs/kde-plasma/)
fixes/         documented fixes with root-cause analysis
workarounds/   temporary workarounds for unresolved bugs
```

All report files use the naming convention `YYYY-MM-DD-short-description.md`.

## Bug Lifecycle

1. **Report** — filed via `/debugging:new-bug` with status `Suspected` or `Confirmed`
2. **Investigate** — hypotheses, logs, and reproduction steps added to the report
3. **Resolve** — fix documented via `/debugging:document-fix`, or workaround recorded
4. **Close** — bug report status updated to `Resolved`

See CLAUDE.md for the full bug/fix/workaround templates and conventions.
