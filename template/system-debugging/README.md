# Debugging Workspace — System

Provisioned by the [`debugging` Claude Code plugin](https://github.com/danielrosehill/debugging-plugin). This repo is the **data scaffold** for a system-level debugging effort (OS, infrastructure, networking, peripherals).

## Quick Start

1. `/debugging:onboarding` — describe the issue and capture host/service context
2. `/debugging:capture-logs` — file logs, config snapshots, network captures under `inputs/`
3. `/debugging:isolate-issue` — eliminate variables one at a time
4. `/debugging:diagnose-error` — analyse specific errors
5. `/debugging:hypotheses` / `/debugging:status` — track progress
6. `/debugging:summarize` — produce a handover doc when done

## Structure

```
context/       problem summary, host topology, recent changes
inputs/        logs, screenshots, recordings, configs/data
outputs/       analysis, attempts, resolution
debug-log/     chronological hypothesis / test log
```
