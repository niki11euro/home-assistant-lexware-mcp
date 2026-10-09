# Reversibility

## Components

This repository installs only the **Lexware Office MCP** App.

The separately maintained **OpenAI Secure MCP Tunnels** App in `niki11euro/home-assistant-icloud-mcp` contains the Lexware tunnel entry alongside other independent targets. Do not uninstall that shared tunnel App merely to retire Lexware if other endpoints still use it.

## Disable Lexware access

1. Remove only the Lexware entry from the shared tunnel App configuration.
2. Restart the shared tunnel App and verify the remaining entries.
3. Stop the Lexware Office MCP App.
4. If no longer needed, uninstall this Lexware App from Home Assistant.
5. Revoke any no-longer-needed dedicated OpenAI tunnel runtime credentials and Lexware API credentials.
6. Optionally remove this repository from the Home Assistant App store.

The App does not modify Home Assistant Core configuration or business records when uninstalled. Its configuration may persist in older Home Assistant backups.

## Startup defaults

`boot: manual` is the default, so a newly installed App stays stopped; the user can enable **Start on boot** later.
