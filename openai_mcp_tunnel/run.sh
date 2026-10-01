#!/bin/sh
set -eu

CONFIG_PATH="/data/options.json"

fail() {
  echo "[openai-tunnel] Configuration error: $1" >&2
  exit 1
}

[ -f "$CONFIG_PATH" ] || fail "Missing /data/options.json"

CONTROL_PLANE_TUNNEL_ID="$(jq -er '.control_plane_tunnel_id' "$CONFIG_PATH")" || fail "control_plane_tunnel_id is required"
CONTROL_PLANE_API_KEY="$(jq -er '.control_plane_api_key' "$CONFIG_PATH")" || fail "control_plane_api_key is required"
MCP_SERVER_URL="$(jq -er '.mcp_server_url' "$CONFIG_PATH")" || fail "mcp_server_url is required"
MCP_AUTH_TOKEN="$(jq -er '.mcp_auth_token' "$CONFIG_PATH")" || fail "mcp_auth_token is required"

[ -n "$CONTROL_PLANE_TUNNEL_ID" ] || fail "control_plane_tunnel_id is empty"
[ -n "$CONTROL_PLANE_API_KEY" ] || fail "control_plane_api_key is empty"
[ -n "$MCP_SERVER_URL" ] || fail "mcp_server_url is empty"
[ -n "$MCP_AUTH_TOKEN" ] || fail "mcp_auth_token is empty"

case "$MCP_SERVER_URL" in
  http://*|https://*) ;;
  *) fail "mcp_server_url must start with http:// or https://" ;;
esac

LEXWARE_MCP_AUTH_HEADER="Bearer $MCP_AUTH_TOKEN"

export CONTROL_PLANE_TUNNEL_ID
export CONTROL_PLANE_API_KEY
export MCP_SERVER_URL
export LEXWARE_MCP_AUTH_HEADER
export MCP_EXTRA_HEADERS="Authorization: env:LEXWARE_MCP_AUTH_HEADER"
export MCP_DISCOVERY_EXTRA_HEADERS="Authorization: env:LEXWARE_MCP_AUTH_HEADER"
export MCP_STARTUP_WAIT_TIMEOUT="60s"

# Keep the bundled admin/health listener private inside this container in v0.1.0.
export HEALTH_LISTEN_ADDR="127.0.0.1:8080"
export OPEN_WEB_UI=false
export ALLOW_REMOTE_UI=false

echo "[openai-tunnel] Starting Secure MCP Tunnel for configured tunnel ID. MCP target=$MCP_SERVER_URL"
exec /usr/bin/tunnel-client run
