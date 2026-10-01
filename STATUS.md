# Preparation status

Last updated: 2026-10-01

## Scope completed

The GitHub repository has been prepared without changing Home Assistant.

Prepared:

- Home Assistant repository metadata
- Lexware Office MCP App wrapper
- OpenAI Secure MCP Tunnel App wrapper
- masked Home Assistant App options for secrets
- manual-only boot configuration
- read-only Lexware default
- separate Write and Finalize options
- no Home Assistant API permissions
- no Supervisor API permissions
- no host-network mode
- no inbound host port for Lexware MCP
- rollback protocol
- pre-install checklist
- upstream license/notice files

## Pinned upstreams

Lexware MCP:

`marselsel/Lexware-MCP-Server`

commit:

`8da792d08146665036943a9ee7d1b7f444225939`

OpenAI tunnel-client:

`ghcr.io/openai/tunnel-client:v0.0.15`

## Validation completed

- `lexware_mcp/config.yaml`: YAML parse successful
- `openai_mcp_tunnel/config.yaml`: YAML parse successful
- `lexware_mcp/run.sh`: POSIX shell syntax check successful
- `openai_mcp_tunnel/run.sh`: POSIX shell syntax check successful
- OpenAI tunnel-client v0.0.15 existence verified from the official OpenAI GitHub release
- Linux ARM64 availability verified in the official release documentation

## Validation not yet completed

A full Docker image build has not yet been executed.

Reason: the current preparation runtime does not provide Docker or Podman.

This must be completed before calling version 0.1.0 production-ready. It can be done with a suitable Docker environment or during a controlled Home Assistant App build before either App is ever started.

## Home Assistant status

No Home Assistant write operation has been performed for this preparation.

Not performed:

- repository registration
- App Store refresh
- App installation
- App configuration
- API key entry
- tunnel ID entry
- App start
- App restart
- App stop
- boot setting changes
- dashboard changes
- YAML changes
- .storage changes
- router/network changes

The existing Home Assistant MCP installation is not modified.

## Next boundary

The next Home Assistant-related action, when explicitly approved, should be repository registration only.

Before that action, decide whether to:

1. make this repository public so Supervisor can clone it normally, or
2. keep it private and use a controlled local-App copy/install workflow.

Do not embed GitHub credentials in the repository URL.
