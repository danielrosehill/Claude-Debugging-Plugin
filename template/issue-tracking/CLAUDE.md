# Bug Tracker Workspace

This workspace is a persistent, searchable knowledge base of bugs, fixes, workarounds, and root-cause analyses. The `debugging` plugin provides all commands globally; this repo stores **data only** — structured bug reports and their resolutions.

## Purpose

Track bugs across any software, system, or service. Each bug report captures the problem, environment, symptoms, and diagnostic information. Fixes and workarounds are documented separately so they can be cross-referenced and reused.

## Directory Structure

### `bugs/`

Bug reports organised by service or component. Each subfolder groups related bugs (e.g., `bugs/nginx/`, `bugs/desktop-environment/`). Create subfolders as needed when a new service or component appears.

Each bug report is a markdown file named: `YYYY-MM-DD-short-description.md`.

### `fixes/`

Documented fixes for resolved bugs. Each fix references the original bug report and includes the exact steps taken to resolve the issue, along with root-cause analysis where possible.

### `workarounds/`

Temporary workarounds for bugs that have not yet been fully resolved. Each workaround references the original bug report and notes any limitations or trade-offs.

## Bug Report Format

```markdown
# [Short descriptive title]

**Date Filed:** [Date]
**Status:** Suspected | Confirmed | Resolved | Won't Fix
**Severity:** Critical | High | Medium | Low
**Component:** [Service / software / system affected]
**Source:** [URL or origin of the report, if applicable]

---

## Summary

[One to three sentence description of the problem.]

---

## Environment

| Field | Value |
|-------|-------|
| **OS** | |
| **Version** | |
| **Hardware** | |
| [other relevant fields] | |

---

## Symptoms

- [Observable behaviour]

---

## Logs & Errors

[Relevant log excerpts, error messages, stack traces]

---

## Steps to Reproduce

1. [Step-by-step reproduction if known]

---

## Related

- [Links to upstream issues, forum threads, related bugs in this repo]
```

## Fix Report Format

```markdown
# Fix: [Short title matching the bug]

**Date Resolved:** [Date]
**Bug Reference:** [Relative path to the bug report]
**Root Cause:** [Brief root cause statement]

---

## Solution

[Exact steps, commands, configuration changes, or code changes that resolved the issue.]

---

## Root Cause Analysis

[Detailed explanation of why the bug occurred.]

---

## Verification

[How to confirm the fix worked.]
```

## Workaround Format

```markdown
# Workaround: [Short title matching the bug]

**Date Documented:** [Date]
**Bug Reference:** [Relative path to the bug report]
**Limitations:** [Any trade-offs or limitations of this workaround]

---

## Workaround Steps

[Exact steps to work around the issue.]

---

## Notes

[Any additional context, when a proper fix might be available, etc.]
```

## Conventions

- Always include the date a bug was filed. Use the date from the original report if importing, or the current date for new reports.
- Group bugs by service/component using subfolders inside `bugs/`.
- Use `YYYY-MM-DD-short-description.md` naming for all reports.
- Keep status fields up to date as bugs progress through investigation and resolution.
- Cross-reference between bugs, fixes, and workarounds using relative file paths.
- When importing a bug from an external source (URL, gist, issue tracker), preserve the original content while reformatting to match the templates above.

## Available Commands (from the `debugging` plugin)

- `/debugging:new-bug` — document a new bug report
- `/debugging:document-fix` — document a fix or workaround for an existing bug
- `/debugging:search-bugs` — search existing bug reports and fixes
