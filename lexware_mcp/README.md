# Lexware Office MCP App

Private Home Assistant wrapper around `marselsel/Lexware-MCP-Server`.

Security defaults:

- manual start by default, with optional Start on boot
- read only
- no finalize tools
- no URL upload
- no host port
- no Home Assistant or Supervisor API permission
- separate local bearer token on `/mcp`

See [DOCS.md](DOCS.md) before the first start.
