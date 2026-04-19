# Debugging Workspace — System

This workspace tracks a system-level debugging effort — OS, infrastructure, peripherals, networking, or integration issues (rather than a single codebase). The `debugging` plugin provides all commands and agents globally; this repo stores **data only**.

## Workspace Variables

- **Workspace name**: [fill in]
- **Problem (one line)**: [fill in via `/debugging:onboarding`]
- **Affected host / service / segment**: [fill in]
- **Severity**: [Critical | High | Medium | Low]
- **Reproducible?**: [Yes / Intermittent / Unknown]

## Workflow

1. Run `/debugging:onboarding` to capture the problem and seed `context/problem-summary.md`. Include host/service identifiers and any recent changes (upgrades, config edits, hardware swaps).
2. Collect evidence with `/debugging:capture-logs` — system logs (`journalctl`, `dmesg`), config snapshots, network captures, screenshots.
3. Use `/debugging:isolate-issue` aggressively — system bugs often come down to an unknown peripheral, kernel module, or config drift. Eliminate one at a time.
4. `/debugging:diagnose-error` on each specific error from logs.
5. `/debugging:hypotheses` and `/debugging:status` to track.
6. `/debugging:summarize` when resolved.

## Directory Structure

```
├── CLAUDE.md                # This file
├── context/                 # Problem summary, host topology, recent changes
├── inputs/                  # Collected evidence
│   ├── logs/                # journalctl, dmesg, service logs
│   ├── screenshots/         # UI / dashboard screenshots
│   ├── recordings/          # Screen / audio recordings
│   └── data/                # Config files, network dumps, metrics exports
├── outputs/                 # Analysis and remediation
│   ├── analysis/
│   ├── attempts/            # Each remediation attempt and its outcome
│   └── resolution/
└── debug-log/               # Chronological hypothesis / test log
```

## Protocol

- **Snapshot before you change.** Copy any config file to `inputs/data/` before editing it on the live system.
- **Record the exact command and full output** of every diagnostic step — not a summary.
- **Note intermittency.** Timestamp every observation; correlate with system events.
- **Test safely.** Prefer read-only diagnostics first. Destructive tests (restarts, reinstalls, reboots) go through explicit user approval via `/debugging:isolate-issue`.

## Naming

- Files in `debug-log/`, `outputs/analysis/`, `outputs/attempts/`: `YYYY-MM-DD-<short-kebab>.md`
- Input files: `YYYY-MM-DD-<short-kebab>.<ext>`
