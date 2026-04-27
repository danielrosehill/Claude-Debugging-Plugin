---
name: audit-openapi-conformance
description: Use when the user wants to verify API conformance with the OpenAPI standard and generate an OpenAPI JSON definition. Triggers on phrases like "openapi audit", "check openapi conformance", "generate openapi spec".
---

Audit the API to ensure conformity with the OpenAPI standard:

1. Verify the API has a proper definition and there are no partially implemented backend functions.
2. Check if the API is OpenAPI standard compatible.
3. Programmatically generate an OpenAPI JSON definition.

If the server has an MCP, ensure the OpenAPI-compatible JSON's existence is advertised to the agent within the MCP configuration.
