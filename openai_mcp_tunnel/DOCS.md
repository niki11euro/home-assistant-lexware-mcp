# OpenAI Secure MCP Tunnel

This Home Assistant App wraps the official OpenAI project:

https://github.com/openai/tunnel-client

Pinned container release:

`ghcr.io/openai/tunnel-client:v0.0.15`

## Purpose

The tunnel-client establishes outbound HTTPS connectivity from this private Home Assistant environment to OpenAI and forwards MCP requests to the local Lexware MCP App.

No inbound router port or public MCP endpoint is required.

## Before first start

Configure all four required values.

### Tunnel ID

A dedicated OpenAI Secure MCP Tunnel ID.

Example form:

`tunnel_...`

### Runtime API key

Use an OpenAI Runtime API key intended for the tunnel runtime.

Do not use an OpenAI Admin API key for the long-lived daemon.

### MCP server URL

The internal URL of the Lexware Office MCP App.

Expected form:

`http://<repository-id>-lexware-mcp:8080/mcp`

Home Assistant derives the repository identifier from the repository URL. Do not guess this value. After the Git repository has been registered in Home Assistant, inspect the resulting App metadata and enter the exact internal hostname here.

### MCP authentication token

Enter exactly the same random token configured in the Lexware Office MCP App.

The wrapper forwards it only to the configured MCP origin using the tunnel-client's supported static MCP header facility:

`Authorization: Bearer <token>`

It is not used as the OpenAI control-plane credential.

## Security defaults

- manual start only
- no host network
- no Home Assistant API permission
- no Supervisor API permission
- no host ports
- tunnel health/admin UI remains loopback-only inside the container
- no credentials in Git

## Startup order

When first testing:

1. Start Lexware Office MCP.
2. Confirm its App logs show a successful read-only startup.
3. Start OpenAI Secure MCP Tunnel.
4. Inspect tunnel App logs for readiness/connectivity.
5. Only then configure or test the ChatGPT connector.

## Stopping

Stop the tunnel App first, then stop the Lexware App.

## Removal

See the repository root [REVERSIBILITY.md](../REVERSIBILITY.md).
