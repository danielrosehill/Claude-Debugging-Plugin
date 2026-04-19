# Document a Fix for an Existing Bug

The user wants to document a fix or workaround for a bug that has been tracked in this workspace (`issue-tracking` variant).

## Your Task

1. Identify which bug the fix applies to. Ask the user to specify the bug, or list recent/open bugs for them to choose from. Search the `bugs/` directory for reports with status other than `Resolved`.

2. Determine whether this is a **permanent fix** or a **temporary workaround**.

3. Create the appropriate document:
   - For fixes: create a file in `fixes/` using the naming convention `YYYY-MM-DD-short-description.md` and the fix report format from the workspace's CLAUDE.md.
   - For workarounds: create a file in `workarounds/` using the naming convention `YYYY-MM-DD-short-description.md` and the workaround format from the workspace's CLAUDE.md.

4. Update the original bug report:
   - Change the **Status** field to `Resolved` (for fixes) or leave as-is but add a note linking to the workaround.
   - Add a `## Resolution` section at the bottom of the bug report linking to the fix or workaround file.

## Information to Capture

### For Fixes

- **Date resolved**
- **Root cause**: Why did the bug occur?
- **Solution**: Exact steps, commands, configuration changes, or code changes.
- **Verification**: How to confirm the fix works.

### For Workarounds

- **Date documented**
- **Workaround steps**: Exact steps to mitigate the issue.
- **Limitations**: Any trade-offs, side effects, or conditions where the workaround does not apply.
- **Notes**: When a proper fix might be available, upstream issue status, etc.

## After Creating the Document

1. Confirm the fix/workaround file path with the user.
2. Confirm the bug report has been updated with a cross-reference.
