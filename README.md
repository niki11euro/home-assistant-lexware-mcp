# Home Assistant Lexware Office MCP

Home Assistant App repository for a Lexware Office MCP endpoint. This repository only installs the Lexware backend. **OpenAI Secure MCP Tunnels** are managed by the independent multi-target App in [home-assistant-icloud-mcp](https://github.com/niki11euro/home-assistant-icloud-mcp), which can connect this backend with its own Lexware tunnel identity.

## App

### Lexware Office MCP

Wraps the MIT-licensed `marselsel/Lexware-MCP-Server` project, pinned to commit `8da792d08146665036943a9ee7d1b7f444225939`.

- Authenticated internal `/mcp` endpoint, port 8080
- Lexware API key remains in this App, not in the shared tunnel
- Separate MCP bearer token, forwarded by the shared tunnel
- Read-only tools by default
- Draft/write tools and finalization are separately opt-in
- URL upload disabled
- No Home Assistant API, Supervisor API, or host-network permissions
- No host port published by default

## Installation and startup

Register this App repository:

`https://github.com/niki11euro/home-assistant-lexware-mcp`

Install the Lexware Office MCP App and configure the Lexware API key and local MCP bearer token.

The App defaults to `boot: manual`: it is **not** started automatically after installation. Home Assistant allows enabling **Start on boot** later.

Use the existing Lexware OpenAI tunnel ID and runtime key in a **Lexware Office** entry inside the multi-target tunnel App from the separate repository. The corresponding `mcp_server_url` is the installed Lexware backend's internal Home Assistant hostname and `/mcp` path. The tunnel App receives the MCP bearer token, not the Lexware API key.

Do not mix private iCloud data or credentials with the Lexware MCP backend. Shared tunnel infrastructure uses separate tunnel identities and per-target credentials.

## Security and rollback

Never put credentials in Git. Home Assistant backups may contain App option secrets, so protect backups.

See [SECURITY.md](SECURITY.md), [REVERSIBILITY.md](REVERSIBILITY.md), and [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

This is an independent community integration, not an official Lexware or OpenAI product.
