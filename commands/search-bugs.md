# Search Bug Reports and Fixes

The user wants to find existing bug reports, fixes, or workarounds in an `issue-tracking` workspace.

## Your Task

1. Ask the user what they are looking for. They may provide:
   - A keyword or error message
   - A component/service name
   - A status filter (e.g., "all open bugs", "resolved issues")
   - A severity level
   - A date range

2. Search across `bugs/`, `fixes/`, and `workarounds/` directories. Read file contents to match against the user's query — do not rely solely on filenames.

3. Present results in a clear summary table:

```
| File | Status | Severity | Component | Summary |
|------|--------|----------|-----------|---------|
| bugs/nginx/2025-03-15-502-gateway-timeout.md | Confirmed | High | nginx | 502 errors under load |
| fixes/2025-03-18-nginx-upstream-timeout.md | -- | -- | nginx | Increased upstream timeout |
```

4. Offer to open or display the full content of any matching report.

## Search Strategies

- **By keyword**: Search file contents for the term across all directories.
- **By component**: List all files within a specific `bugs/[component]/` subfolder and any related fixes/workarounds.
- **By status**: Read bug report headers and filter by the Status field.
- **By severity**: Read bug report headers and filter by the Severity field.
- **By date**: Filter based on the date prefix in filenames or the Date Filed field.
- **Unresolved bugs**: Find all bug reports where Status is not `Resolved`.

## If No Results Found

Let the user know no matches were found and suggest broadening the search terms or checking for alternate spellings/component names.
