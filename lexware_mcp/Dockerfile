FROM node:24.14.1-alpine AS builder

ARG LEXWARE_MCP_COMMIT=8da792d08146665036943a9ee7d1b7f444225939

RUN apk add --no-cache git

WORKDIR /build
RUN git clone https://github.com/marselsel/Lexware-MCP-Server.git source \
    && cd source \
    && git checkout "$LEXWARE_MCP_COMMIT" \
    && sed -i 's/registerUploadTools(server, uploadTickets, config.publicBaseUrl);/if (process.env.HA_DISABLE_UPLOAD_TICKETS !== "true") registerUploadTools(server, uploadTickets, config.publicBaseUrl);/' src/tools/index.ts \
    && npm ci \
    && npm run build \
    && npm prune --omit=dev

FROM node:24.14.1-alpine

ARG BUILD_VERSION
ARG BUILD_ARCH

LABEL \
    io.hass.version="$BUILD_VERSION" \
    io.hass.type="app" \
    io.hass.arch="$BUILD_ARCH"

RUN apk add --no-cache ca-certificates jq

WORKDIR /app
COPY --from=builder /build/source /app/lexware-mcp
COPY --from=builder /build/source/LICENSE /licenses/lexware-mcp/LICENSE
COPY LICENSES/WRAPPER_MIT.txt /licenses/home-assistant-lexware-wrapper/LICENSE
COPY run.sh /run.sh

RUN chmod 0755 /run.sh

EXPOSE 8080

CMD ["/run.sh"]
