# Public release check

Date: 2026-10-01

This document records the checks performed before changing this repository from private to public.

## Privacy and secret scan

Result: PASS

The repository source tree was scanned before public release, including the complete App source, documentation, license files, and workflow configuration.

Checked for:

- OpenAI-style API keys
- GitHub personal/access tokens
- JWTs
- PEM/private-key material
- generic credential assignments
- Nabu Casa URLs
- RFC1918/private IPv4 addresses
- personal names used during development
- private place and room names
- Home Assistant entity/device/area data

No private credential, private network address, Nabu Casa URL, Home Assistant entity/device/area data, private room data, or personal address was found.

The only account-identifying information intentionally present is the public GitHub identity used to own/maintain the repository:

`niki11euro`

Git commit metadata uses GitHub's noreply address:

`38863831+niki11euro@users.noreply.github.com`

No personal email address is present.

The literal `127.0.0.1` is used by the tunnel wrapper as the standard loopback address. It does not reveal any private network information.

## Git history scan

Result: PASS

The pre-publication Git history was reviewed for:

- committed secrets
- private IP addresses
- Nabu Casa URLs
- private names/locations/room names
- credential material

No such data was found.

If a secret is ever committed after publication, removing it in a later commit is not sufficient. Revoke/rotate it and rewrite history.

## License verification

Result: PASS

### Wrapper code

Repository wrapper/integration code:

MIT License

See:

`LICENSE`

### Lexware MCP Server

Pinned upstream:

`marselsel/Lexware-MCP-Server@8da792d08146665036943a9ee7d1b7f444225939`

License:

MIT

The license stored at:

`lexware_mcp/LICENSES/LEXWARE_MCP_MIT.txt`

was verified byte-for-byte against the LICENSE file at the pinned upstream commit.

The Lexware image build also copies the upstream license into:

`/licenses/lexware-mcp/LICENSE`

The Home Assistant-specific wrapper MIT license is copied separately.

### OpenAI tunnel-client

Pinned upstream:

`openai/tunnel-client v0.0.15`

License:

Apache License 2.0

The following files were verified byte-for-byte against the pinned upstream release:

- `openai_mcp_tunnel/LICENSES/OPENAI_TUNNEL_APACHE2_FULL.txt`
- `openai_mcp_tunnel/LICENSES/OPENAI_TUNNEL_NOTICE.txt`

The derived Home Assistant wrapper image copies the upstream LICENSE and NOTICE into its image and keeps the wrapper's own MIT license separate.

## Attribution and trademark clarity

Result: PASS

`THIRD_PARTY_NOTICES.md` documents:

- both upstream projects
- exact pinned versions
- their respective licenses
- the small Lexware wrapper modification
- dependency licensing
- independent/community status
- non-affiliation with Lexware, OpenAI, or Home Assistant
- the ChatGPT-assisted creation disclosure

## Repository safety controls

Result: PASS

Added:

- `.gitignore` for common secrets and local runtime files
- `SECURITY.md` with explicit no-secret guidance
- manual-only App startup
- no host network
- no Home Assistant API access
- no Supervisor API access
- no public Lexware MCP host port

## Runtime/build validation

Result: PASS

GitHub Actions workflow `36888772356` completed successfully.

Successful checks:

- repository/shell syntax validation
- Lexware MCP build for Linux AMD64
- Lexware MCP build for Linux ARM64/aarch64
- OpenAI Secure MCP Tunnel build for Linux AMD64
- OpenAI Secure MCP Tunnel build for Linux ARM64/aarch64

The ARM64 builds cover the architecture intended for the Raspberry Pi deployment.

## Public repository conclusion

From the performed privacy, secret, attribution, and license checks, the repository is prepared for public source publication.

This is a technical compliance review, not legal advice.
