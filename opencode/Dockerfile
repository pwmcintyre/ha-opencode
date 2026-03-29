ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:3.21
FROM ${BUILD_FROM}

# Install runtime dependencies
# - curl: for OpenCode install script
# - git: OpenCode expects git for VCS features
# - nodejs: OpenCode server runtime (Bun not available on Alpine arm64 via apk)
RUN apk add --no-cache \
    curl \
    git \
    bash

# Install OpenCode binary
RUN curl -fsSL https://opencode.ai/install | bash \
    && mv /root/.local/bin/opencode /usr/local/bin/opencode \
    && chmod +x /usr/local/bin/opencode

# Create workspace directory
RUN mkdir -p /data/opencode

# Copy root filesystem (s6 service scripts)
COPY rootfs /

LABEL \
    io.hass.type="addon" \
    io.hass.name="OpenCode" \
    io.hass.description="AI coding agent with web UI" \
    io.hass.version="1.0.0" \
    io.hass.arch="aarch64|amd64" \
    org.opencontainers.image.title="OpenCode" \
    org.opencontainers.image.description="OpenCode AI coding agent as a Home Assistant add-on" \
    org.opencontainers.image.source="https://github.com/pwmcintyre/ha-opencode" \
    org.opencontainers.image.licenses="MIT"
