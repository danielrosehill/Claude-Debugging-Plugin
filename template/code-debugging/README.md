# Debugging Workspace — Code

Provisioned by the [`debugging` Claude Code plugin](https://github.com/danielrosehill/debugging-plugin). This repo is the **data scaffold** for a code-level debugging effort — the plugin's commands and agents are installed globally.

## Quick Start

1. `/debugging:onboarding` — describe the bug
2. `/debugging:capture-logs` — file evidence under `inputs/`
3. `/debugging:diagnose-error` — analyse errors
4. `/debugging:isolate-issue` — eliminate variables
5. `/debugging:hypotheses` / `/debugging:status` — track progress
6. `/debugging:summarize` — produce a handover doc when done

## Structure

```
context/       problem summary, constraints
inputs/        logs, screenshots, recordings, data
outputs/       analysis, attempts, resolution
debug-log/     chronological hypothesis / test log
```
