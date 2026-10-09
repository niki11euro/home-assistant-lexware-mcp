# Current repository status

Updated: 2026-10-09

The Home Assistant repository contains one App: **Lexware Office MCP**.

The dedicated one-target OpenAI tunnel App has been retired from this repository. Its runtime configuration can be migrated, using the existing Lexware tunnel ID and keys, to the multi-target **OpenAI Secure MCP Tunnels** App maintained in `niki11euro/home-assistant-icloud-mcp`.

The Lexware backend is still independently configured and protected by its own token. No credentials are committed to Git.

The App's default boot policy is `manual`: it remains stopped after a fresh installation, and Home Assistant exposes an optional **Start on boot** switch.

The upstream Lexware MCP project remains pinned to commit `8da792d08146665036943a9ee7d1b7f444225939`. Build/smoke checks are maintained in `.github/workflows/validate.yml`.

See README and the install/rollback documents for the up-to-date steps.
