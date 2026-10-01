# Pre-install checklist

Nothing in this checklist has been executed on Home Assistant yet.

## Current repository state

Prepared Apps:

1. Lexware Office MCP
2. OpenAI Secure MCP Tunnel

Both are version 0.1.0 and declare:

`boot: manual_only`

Neither App can start successfully until its required configuration values are supplied.

## Before registering this repository in Home Assistant

- [ ] Review all files in this repository.
- [ ] Decide how Home Assistant will clone the repository.
- [ ] Do not put GitHub credentials in the repository URL.
- [ ] Keep all API keys out of Git.

### Important private-repository note

The normal Home Assistant custom App repository flow clones the configured repository URL.

This repository is currently private. The standard URL does not contain authentication and should not be changed to embed a GitHub token.

Before installation choose one of these paths:

1. Make this repository public. It contains no secrets and all runtime secrets are Home Assistant App options.
2. Keep it private and use a deliberate local-App installation/copy workflow instead of registering it as a remote repository.

Do not decide this by placing a personal access token in a clone URL.

## Values required before first Lexware App start

- [ ] Lexware Office Public API key
- [ ] Random local MCP authentication token, at least 16 characters
- [ ] `write_enabled = false`
- [ ] `finalize_enabled = false`

The first start must be read-only.

## Values required before first Tunnel App start

- [ ] Dedicated OpenAI Secure MCP Tunnel ID
- [ ] OpenAI Runtime API key for that tunnel
- [ ] Exact internal Home Assistant URL of Lexware MCP
- [ ] Same local MCP authentication token used by Lexware MCP

The internal MCP hostname must be discovered from Home Assistant after the repository/App exists. Do not guess the repository identifier.

## Planned first-start order

1. Verify both Apps are installed but stopped.
2. Verify both Apps show manual-only boot behavior.
3. Configure Lexware secrets/options.
4. Start only Lexware MCP.
5. Confirm logs show read-only mode.
6. Perform a read-only local MCP health/tool discovery test.
7. Stop Lexware MCP if anything is unexpected.
8. Configure the Tunnel App.
9. Start Lexware MCP again.
10. Start OpenAI Secure MCP Tunnel.
11. Confirm tunnel readiness.
12. Only then configure/test the ChatGPT connection.

## Forbidden during first test

- Do not enable write tools.
- Do not enable finalize tools.
- Do not create invoices, quotations, contacts, articles, vouchers, files, webhooks, or other Lexware objects.
- Do not expose port 8080 on the Home Assistant host.
- Do not add router port forwarding.
- Do not modify Home Assistant configuration.yaml or .storage.
- Do not modify the existing Home Assistant MCP App.

## Rollback

See [REVERSIBILITY.md](REVERSIBILITY.md).
