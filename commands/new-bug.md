# Document a New Bug Report

The user wants to document a new bug in an `issue-tracking` workspace. They may provide a URL to an existing report, paste raw text, or describe the problem verbally.

## Your Task

1. Gather the bug details from the user. If they provide a URL, fetch and parse the content. If they describe the problem verbally, ask clarifying questions to fill in the template.

2. Determine the appropriate component subfolder inside `bugs/`. If a matching folder already exists, use it. If not, create one with a short, lowercase, hyphenated name (e.g., `bugs/nginx/`, `bugs/kde-plasma/`).

3. Create the bug report file using the naming convention `YYYY-MM-DD-short-description.md`.

4. Use the bug report format defined in the workspace's CLAUDE.md. Fill in all fields you have information for. Leave fields blank (with a placeholder like `[Unknown]`) if the information is not available.

## Information to Capture

- **Date**: Use the date from the original report if importing. For new reports, use the current date.
- **Status**: Default to `Suspected` unless the user has confirmed reproduction.
- **Severity**: Ask the user or infer from context (Critical = system crash/data loss, High = major feature broken, Medium = feature degraded, Low = cosmetic/minor).
- **Component**: The service, software, or system affected.
- **Summary**: A clear one-to-three sentence problem description.
- **Environment**: OS, software versions, hardware, and any other relevant system details.
- **Symptoms**: Observable behaviours.
- **Logs & Errors**: Any error messages, log excerpts, or stack traces.
- **Steps to Reproduce**: If known.
- **Related links**: Upstream issues, forum threads, documentation.

## After Creating the Report

1. Confirm the file path and summary with the user.
2. If the user already has a fix or workaround, offer to run `/debugging:document-fix` next.
