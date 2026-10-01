#!/bin/sh
set -eu

CONFIG_PATH="/data/options.json"

fail() {
  echo "[lexware-mcp] Configuration error: $1" >&2
  exit 1
}

[ -f "$CONFIG_PATH" ] || fail "Missing /data/options.json"

LEXWARE_API_KEY="$(jq -er '.lexware_api_key' "$CONFIG_PATH")" || fail "lexware_api_key is required"
MCP_AUTH_TOKEN="$(jq -er '.mcp_auth_token' "$CONFIG_PATH")" || fail "mcp_auth_token is required"

[ -n "$LEXWARE_API_KEY" ] || fail "lexware_api_key is empty"
[ -n "$MCP_AUTH_TOKEN" ] || fail "mcp_auth_token is empty"
[ "${#MCP_AUTH_TOKEN}" -ge 16 ] || fail "mcp_auth_token must contain at least 16 characters"

WRITE_ENABLED="$(jq -r '.write_enabled // false' "$CONFIG_PATH")"
FINALIZE_ENABLED="$(jq -r '.finalize_enabled // false' "$CONFIG_PATH")"
URL_UPLOAD_ENABLED="$(jq -r '.url_upload_enabled // false' "$CONFIG_PATH")"

case "$WRITE_ENABLED" in true|false) ;; *) fail "write_enabled must be true or false" ;; esac
case "$FINALIZE_ENABLED" in true|false) ;; *) fail "finalize_enabled must be true or false" ;; esac
case "$URL_UPLOAD_ENABLED" in true|false) ;; *) fail "url_upload_enabled must be true or false" ;; esac

if [ "$WRITE_ENABLED" != "true" ]; then
  LEXWARE_READ_ONLY=true
  LEXWARE_ENABLE_DRAFTS=false
  LEXWARE_ENABLE_FINALIZE=false
  LEXWARE_ENABLE_URL_UPLOAD=false
elif [ "$FINALIZE_ENABLED" = "true" ]; then
  LEXWARE_READ_ONLY=false
  LEXWARE_ENABLE_DRAFTS=true
  LEXWARE_ENABLE_FINALIZE=true
  LEXWARE_ENABLE_URL_UPLOAD=false
else
  LEXWARE_READ_ONLY=false
  LEXWARE_ENABLE_DRAFTS=true
  LEXWARE_ENABLE_FINALIZE=false
  LEXWARE_ENABLE_URL_UPLOAD=false
fi

# The Home Assistant wrapper intentionally disables the browser upload-ticket
# flow because this app has no public/host port. Inline MCP file uploads remain
# available when the upstream drafts tier is enabled.
HA_DISABLE_UPLOAD_TICKETS=true

export LEXWARE_API_KEY
export MCP_AUTH_TOKEN
export LEXWARE_READ_ONLY
export LEXWARE_ENABLE_DRAFTS
export LEXWARE_ENABLE_FINALIZE
export LEXWARE_ENABLE_URL_UPLOAD
export HA_DISABLE_UPLOAD_TICKETS
export PORT=8080
export LEXWARE_DEBUG_LOGGING=false

echo "[lexware-mcp] Starting. read_only=$LEXWARE_READ_ONLY drafts=$LEXWARE_ENABLE_DRAFTS finalize=$LEXWARE_ENABLE_FINALIZE url_upload=$LEXWARE_ENABLE_URL_UPLOAD"
exec node /app/lexware-mcp/dist/server.js
