# Isolate the Issue

Narrow the failure surface by systematically eliminating variables.

## Your Task

1. Review `context/problem-summary.md` and the latest `debug-log/` entries to understand the current failure mode.

2. Identify the variables in play. For a code bug, these might be: input data, environment (OS, runtime version), configuration, network, concurrency, caller. For a system issue: host, service version, kernel, peripheral, network segment, user account.

3. Propose an isolation plan — a short ordered list of tests that each eliminate one variable. Prefer cheap, fast tests first.

4. For each test, define:
   - What the test is
   - What outcome eliminates which variable
   - What evidence to capture (logs, exit codes, screenshots)

5. Present the plan to the user and ask which test to run first. Wait for approval before executing anything destructive.

## Output

Write the isolation plan to `debug-log/YYYY-MM-DD-isolation-plan.md` with status columns: `pending`, `running`, `eliminated`, `confirmed`.

As tests complete, update the status and append findings to the same file.

## Principles

- Change **one** variable at a time.
- Record the command and full output, not a summary.
- If a test is inconclusive, note why and design a sharper version before moving on.
