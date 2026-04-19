# Capture Logs and Evidence

Ingest logs, screenshots, recordings, or configuration files into the current debugging workspace so they can be analysed systematically.

## Your Task

1. Ask the user what evidence they want to capture. Accept:
   - A file path or directory path on disk
   - Pasted log text
   - A URL (fetch the content)
   - A reference to a previous command's output

2. Determine the correct destination under `inputs/`:
   - `inputs/logs/` — text logs, stack traces, journalctl output
   - `inputs/screenshots/` — image evidence
   - `inputs/recordings/` — screen/audio recordings
   - `inputs/data/` — config files, JSON/YAML dumps, CSVs, other structured data

3. Write the evidence to a file named `YYYY-MM-DD-<short-description>.<ext>`. Preserve the original filename as a suffix in the description if it carries useful context.

4. Append a short entry to `debug-log/YYYY-MM-DD-evidence-captured.md` noting:
   - Source of the evidence
   - Destination path
   - Why it was captured (which hypothesis or symptom it relates to)

## Normalisation

- Redact obvious secrets (API keys, bearer tokens, passwords) before writing, and flag any that were redacted.
- For multi-line pasted logs, wrap in a fenced code block if saving as markdown, or save raw as `.log` if it's plain text.

## After Capturing

Report the destination path to the user and suggest follow-up commands:
- `/debugging:diagnose-error` if the evidence is an error/stack trace
- `/debugging:isolate-issue` if the evidence narrows the failure surface
- `/debugging:hypotheses` to update the hypothesis list
