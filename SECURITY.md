# Security and privacy

## Never commit secrets

Do not commit any of the following to this repository:

- Lexware API keys
- OpenAI API keys or Runtime API keys
- OpenAI Tunnel IDs if you consider the identifier sensitive
- MCP bearer/authentication tokens
- Home Assistant tokens
- Nabu Casa URLs
- router credentials
- private hostnames, addresses, or internal network details

Runtime credentials belong in the Home Assistant App configuration only.

## Public repository design

This repository is intentionally designed to be safe to publish:

- no Home Assistant configuration is included
- no entity, device, area, room, person, or location data is included
- no private network addresses are required
- no Nabu Casa URL is required
- no API credential is stored in source
- example values are placeholders only

The literal address `127.0.0.1`, where present, is the standardized local loopback address and does not identify a user's private network.

## Home Assistant permissions

The Apps intentionally request no Home Assistant API permission and no Supervisor API permission and do not use host networking.

The Lexware MCP host port is not published to the Home Assistant host.

## Reporting

If a credential is ever committed accidentally, deleting it in a later commit is not sufficient because Git history remains public. Revoke/rotate the credential immediately and rewrite repository history before publishing or continuing public use.

## Shared tunnel architecture

The OpenAI Secure MCP Tunnel wrapper is maintained in the separate iCloud MCP App repository. Its Lexware entry must have a dedicated tunnel ID, runtime API key and MCP bearer token. Only the Lexware Office MCP App should have the Lexware API key.

Be aware that the shared tunnel App administrator can inspect multiple endpoints' runtime secrets. Keep Home Assistant administrative access restricted and do not reuse credentials across personal and business targets.
