# Diagnose an Error

Analyse a specific error message, stack trace, or failure mode and propose likely root causes.

## Your Task

1. Get the error from the user. Accept a pasted error, a path to a log file under `inputs/logs/`, or a reference like "the last error we captured".

2. Parse the error:
   - Extract the error type/code/category
   - Identify the originating component (file, module, service, subsystem)
   - Note any stack frames that cross component boundaries
   - Extract timestamps and correlate with other recent events in `debug-log/`

3. Classify the error:
   - Configuration / environment
   - Input validation / data shape
   - Resource exhaustion (memory, disk, file descriptors, connections)
   - Concurrency / timing
   - Upstream dependency failure
   - Logic error in the code itself
   - Permissions / access

4. Propose ranked root causes with evidence. For each, note:
   - Why this cause fits the observed error
   - What additional evidence would confirm or exclude it
   - Suggested remediation if confirmed

5. Write the diagnosis to `outputs/analysis/YYYY-MM-DD-diagnosis-<short>.md` and add the top candidates as hypotheses in `debug-log/`.

## Constraints

- Do not speculate beyond the evidence. If the stack trace is truncated, say so.
- Distinguish between the error's *symptom* and its likely *cause*.
- Flag any cases where the error message is misleading relative to the real cause (common with wrapped exceptions, signal handlers, and async boundaries).
