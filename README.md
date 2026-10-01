# Home Assistant Lexware MCP

> This project was created with ChatGPT.

Home Assistant App repository for running a Lexware Office MCP server and the official OpenAI Secure MCP Tunnel as separate Apps.

## Current status

This repository only prepares installation artifacts. Nothing in this repository changes Home Assistant by itself.

Both Apps are configured with `boot: manual_only`. Installing them does not start them automatically.

## Apps

### Lexware Office MCP

Wraps the MIT-licensed `marselsel/Lexware-MCP-Server` project pinned to commit:

`8da792d08146665036943a9ee7d1b7f444225939`

Default security mode:

- Read tools: enabled
- Write / draft tools: disabled
- Finalize / irreversible tools: disabled
- URL upload: disabled
- MCP endpoint protected by a separate bearer token
- No host network
- No Home Assistant API access
- No Supervisor API access
- No host port published

Required secrets are entered only in the Home Assistant App configuration:

- Lexware API key
- Local MCP authentication token

### OpenAI Secure MCP Tunnel

Wraps the official `openai/tunnel-client` container pinned to release:

`v0.0.15`

The tunnel uses outbound HTTPS to the OpenAI control plane and forwards requests to the local Lexware MCP server.

Required secrets are entered only in the Home Assistant App configuration:

- OpenAI Tunnel ID
- OpenAI Runtime API key
- The same local MCP authentication token used by the Lexware App

## Repository URL for Home Assistant

When this repository is ready to install, use this exact URL without `.git`:

`https://github.com/niki11euro/home-assistant-lexware-mcp`

The tunnel App's default local MCP hostname is derived from exactly this repository URL.

> Important: Home Assistant Supervisor must be able to clone this repository for normal repository-based installation, updates, reinstalls, and recovery. The repository is designed to contain no runtime secrets. Do not put GitHub credentials into the repository URL.

## Secrets

No API key or token belongs in Git.

Home Assistant stores App configuration in the App's own persistent data area and exposes password fields masked in the UI. These values are still sensitive configuration and can be included in backups. Treat Home Assistant backups as secrets.

## Reversibility

See [REVERSIBILITY.md](REVERSIBILITY.md) before installation.

## Upstream projects

- Lexware MCP: https://github.com/marselsel/Lexware-MCP-Server
- OpenAI Secure MCP Tunnel: https://github.com/openai/tunnel-client

Licenses are preserved in each App's `LICENSES` directory.

## Licensing and affiliation

The wrapper/integration code in this repository is licensed under the MIT License. Third-party projects retain their own licenses and notices.

See:

- [LICENSE](LICENSE)
- [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)
- [SECURITY.md](SECURITY.md)

This is an independent community integration and is not an official Lexware, OpenAI, or Home Assistant project.
