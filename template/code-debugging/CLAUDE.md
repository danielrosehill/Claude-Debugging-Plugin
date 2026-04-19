# Debugging Workspace — Code

This workspace tracks a code-level debugging effort. The `debugging` plugin provides all commands and agents globally — this repo stores **data only**: problem statement, evidence, hypotheses, attempts, and (eventually) the resolution.

## Workspace Variables

- **Workspace name**: [fill in]
- **Problem (one line)**: [fill in via `/debugging:onboarding`]
- **Affected component / codebase**: [fill in]
- **Severity**: [Critical | High | Medium | Low]

## Workflow

1. Run `/debugging:onboarding` to capture the problem and seed `context/problem-summary.md`.
2. As evidence arrives (logs, stack traces, screenshots), run `/debugging:capture-logs` to file it under `inputs/`.
3. Run `/debugging:diagnose-error` on each error to generate ranked root causes in `outputs/analysis/`.
4. Use `/debugging:isolate-issue` to design variable-elimination tests.
5. Run `/debugging:hypotheses` to review the live hypothesis list and `/debugging:status` for an overview.
6. When resolved, run `/debugging:summarize` to produce a handover document in `outputs/analysis/`.

## Directory Structure

```
├── CLAUDE.md                # This file
├── context/                 # Problem summary, background, constraints
├── inputs/                  # User-provided evidence
│   ├── logs/                # Text logs, stack traces
│   ├── screenshots/         # Visual evidence
│   ├── recordings/          # Screen / audio recordings
│   └── data/                # Configs, data dumps
├── outputs/                 # Agent-generated content
│   ├── analysis/            # Diagnosis and analysis documents
│   ├── attempts/            # Remediation attempts and their outcomes
│   └── resolution/          # Final resolution docs (once fixed)
└── debug-log/               # Chronological hypothesis / test log
```

## Debugging Protocol

- **Change one variable at a time** during isolation tests.
- **Log everything** in `debug-log/` with dates.
- **Mark excluded hypotheses** explicitly — do not silently drop them.
- **Cite evidence** by path (e.g. `inputs/logs/2026-04-19-auth-trace.log`) in every analysis document.
- **Never speculate beyond the evidence.** If the stack trace is truncated, say so.

## Naming

- Files in `debug-log/`, `outputs/analysis/`, `outputs/attempts/`: `YYYY-MM-DD-<short-kebab>.md`
- Input files: `YYYY-MM-DD-<short-kebab>.<ext>`
