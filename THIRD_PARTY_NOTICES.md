# Third-party notices

This repository contains wrapper and integration code created for Home Assistant. The wrapper code in this repository is licensed under the MIT License in the repository root.

Third-party projects retain their own licenses and notices. The repository's MIT License does not replace or relicense those components.

## Lexware MCP Server

Upstream project:

https://github.com/marselsel/Lexware-MCP-Server

Pinned revision used by the Lexware Home Assistant App:

`8da792d08146665036943a9ee7d1b7f444225939`

Upstream license:

MIT License

Upstream copyright notice:

`Copyright (c) 2026 marselsel`

The complete upstream MIT license is preserved at:

`lexware_mcp/LICENSES/LEXWARE_MCP_MIT.txt`

The Lexware App build clones the upstream source at the pinned revision and makes wrapper-specific deployment changes:

- disables the browser upload-ticket registration for this private-network deployment
- forces production mode at runtime
- applies exact transitive dependency security overrides for `brace-expansion` and `ip-address` when building the container

Current security override versions:

- `brace-expansion` 5.x → `5.0.12`
- `filelist > brace-expansion` 2.x → `2.1.7`
- `ip-address` → `10.7.2`

The container build runs `npm audit --omit=dev --audit-level=moderate` after pruning development dependencies and fails if a Moderate-or-higher production advisory remains.

The upstream MIT license permits modification and redistribution provided its copyright and permission notice are retained. The upstream license file remains in the cloned source and is also copied to the resulting image's license directory.

## Dependencies

The Lexware upstream project installs its dependencies from its pinned lockfile during the image build. Those packages retain their respective upstream licenses. Their license files remain subject to the packages' own terms.


## Trademarks and affiliation

"Lexware", "Lexware Office", "OpenAI", "ChatGPT", and "Home Assistant" are names and/or trademarks of their respective owners.

This repository is an independent community integration. It is not an official Lexware, OpenAI, or Home Assistant project and is not endorsed by those organizations.

Names are used only to identify compatibility and the upstream software/services involved.

## ChatGPT disclosure

This project and its integration files were created with assistance from ChatGPT.
