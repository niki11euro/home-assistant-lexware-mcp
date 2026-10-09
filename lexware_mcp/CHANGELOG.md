# Changelog

## 0.1.3

- Update production transitive dependency security floor for current MCP SDK, Handlebars, proxy-addr and source-map-js advisories.
- Replace vulnerable production Chokidar 3.x via a reviewed Chokidar 4.0.3 override, removing its unpatched braces dependency from the Skybridge/Nodemon dependency chain.
- Share one version-pinned overrides file between Docker builds and CI dependency audits. Keep the fail-closed `npm audit --omit=dev --audit-level=moderate` gate enabled.


## 0.1.2

- Permit opt-in Home Assistant Start on boot while keeping manual as the installation default.
- Migrate tunnel handling to the shared multi-target Home Assistant tunnel App in the separate iCloud MCP repository.


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
