---
name: audit-api
description: Use when the user wants to audit an API for deprecated endpoints to remove and missing endpoints to add. Triggers on phrases like "audit the API", "review API endpoints", "api removal and addition audit".
---

Audit the API. Divide into two parts:

1. **Removal Audit:** Find API functions that could be removed (deprecated definitions).
2. **Addition Audit:** Find API functionalities that need to be added. You may reasonably infer that certain application features are lacking endpoints.

If clear, add/remove without consulting the user. If in doubt, ask before proceeding.
