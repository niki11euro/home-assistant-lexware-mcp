# Pre-install checklist

1. Verify this is the intended Home Assistant installation.
2. Install the Lexware Office MCP App from this repository. It defaults to a stopped, manual-boot state.
3. Enter the Lexware API key only in this App's configuration.
4. Generate a unique long MCP bearer token. Never reuse the private iCloud token.
5. Start Lexware MCP and inspect its logs. By default, `write_enabled=false` and `finalize_enabled=false`.
6. In the separately installed **OpenAI Secure MCP Tunnels** App from `home-assistant-icloud-mcp`, add an independent `Lexware Office` entry.
7. Reuse the existing dedicated Lexware OpenAI tunnel ID and runtime key if migrating.
8. Set the Lexware tunnel target URL to the exact Supervisor-assigned internal Lexware MCP hostname plus `:8080/mcp` and its matching bearer token.
9. Start or restart the shared tunnel App, verify iCloud Core and Lexware work independently.
10. Enable optional **Start on boot** for each App only after functionality is confirmed.
11. Confirm that no MCP container port is mapped to the Home Assistant host or exposed to the internet.

Do not create, finalize, or delete Lexware records merely to verify connectivity.
