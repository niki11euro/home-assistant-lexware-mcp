# Reversibility and removal protocol

This file documents every planned persistent change before Home Assistant is touched.

## What this repository creates in Home Assistant

Only if the repository is later added and the Apps are installed:

1. One custom App repository entry pointing to:
   `https://github.com/niki11euro/home-assistant-lexware-mcp`
2. One App named `Lexware Office MCP`
3. One App named `OpenAI Secure MCP Tunnel`
4. Separate persistent `/data` areas managed by Supervisor for those Apps
5. Container images built or pulled by Supervisor

No planned change writes to:

- `/config/configuration.yaml`
- `/config/automations.yaml`
- `/config/scripts.yaml`
- `/config/secrets.yaml`
- `.storage`
- existing dashboards
- existing Home Assistant MCP configuration
- Nabu Casa
- router/firewall configuration

## Default start state

Both Apps declare:

`boot: manual_only`

They must therefore be explicitly started by a human after installation.

The Lexware App additionally defaults to:

- `write_enabled: false`
- `finalize_enabled: false`
- `url_upload_enabled: false`

## Full rollback

If installed later, remove in this order:

1. Stop `OpenAI Secure MCP Tunnel`
2. Stop `Lexware Office MCP`
3. Uninstall `OpenAI Secure MCP Tunnel`
4. Uninstall `Lexware Office MCP`
5. Remove the custom App repository from Home Assistant
6. Delete/revoke the OpenAI Runtime API key used for this tunnel
7. Delete the dedicated OpenAI tunnel
8. Revoke the Lexware API key if it was created only for this integration
9. Optionally delete this GitHub repository

After uninstalling the Apps, their Supervisor-managed App data is no longer used. If a backup was made while secrets were configured, that backup may still contain App configuration and should be handled accordingly.

## Git-only rollback before installation

Before Home Assistant is touched, deleting this GitHub repository is sufficient. No Home Assistant cleanup is required because this repository has no execution path into Home Assistant until it is explicitly registered there.
