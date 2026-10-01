# Changelog

## 0.1.1

- run Lexware MCP with NODE_ENV=production
- patch current brace-expansion and ip-address production advisories with exact dependency overrides
- fail container builds on Moderate-or-higher production npm advisories
- add runtime smoke validation for /status and the /mcp authentication gate
- preserve upstream and wrapper licenses in the image

## 0.1.0

Initial preparation release.

- manual-only startup
- no Home Assistant or Supervisor API permissions
- no public host ports
- masked App options for credentials
- Lexware read-only default
- separate write and finalize options
- official OpenAI tunnel-client pinned
