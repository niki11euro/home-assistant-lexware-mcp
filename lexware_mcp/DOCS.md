# Lexware Office MCP

This Home Assistant App wraps the upstream MIT-licensed project:

https://github.com/marselsel/Lexware-MCP-Server

Pinned upstream commit:

`8da792d08146665036943a9ee7d1b7f444225939`

## Before first start

Enter these values in the App configuration:

### Lexware API key

Your Lexware Office Public API key.

This value is stored as a Home Assistant App option and is exposed to the MCP process only as the environment variable `LEXWARE_API_KEY`.

Do not put the key in Git.

### MCP authentication token

Create a random token with at least 16 characters. Use a long random value.

The exact same value must later be entered in the shared OpenAI Secure MCP Tunnels App as `MCP authentication token`.

This token protects the local `/mcp` endpoint even though no host port is exposed.

## Permission modes

### Safe default

`write_enabled: false`

`finalize_enabled: false`

Effective upstream configuration:

`LEXWARE_READ_ONLY=true`

`LEXWARE_ENABLE_DRAFTS=false`

`LEXWARE_ENABLE_FINALIZE=false`

### Draft/write mode

Set:

`write_enabled: true`

`finalize_enabled: false`

This exposes upstream draft/write tools, including creating draft sales documents and supported updates.

### Finalize mode

Set:

`write_enabled: true`

`finalize_enabled: true`

This enables the upstream finalize tier, including legally binding or irreversible operations.

If `write_enabled` is false, finalization is forcibly disabled regardless of the saved finalize option.

## Applying permission changes

The current version reads the permission options at process startup.

After changing Write or Finalize in the App configuration, restart this App for the new tool set to take effect.

This is intentional for the first release: the permission boundary stays small and does not require Home Assistant API access, Supervisor API access, Ingress, or an extra writable service.

## File upload limitation in this wrapper

The upstream short-lived browser upload-ticket flow is intentionally disabled in this Home Assistant wrapper because no host/public port is exposed for the ticket URL.

Normal inline MCP file functionality from the upstream project remains available where supported.

Server-side URL upload remains disabled.

## Networking

The process listens on container port 8080.

No host port is mapped.

Another Home Assistant App can reach it over the internal App network using the Supervisor-generated App hostname.

The exact hostname is determined only after this repository is registered in Home Assistant. Configure that complete URL in the OpenAI Secure MCP Tunnel App before starting it.

Expected form:

`http://<repository-id>-lexware-mcp:8080/mcp`

Do not guess the repository ID. Read it from Home Assistant after repository registration.

## Startup

This App declares:

`boot: manual`

The App will not start automatically after installation. The user may later enable **Start on boot** in Home Assistant.
