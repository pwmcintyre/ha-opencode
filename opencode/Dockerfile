ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:3.21
FROM ${BUILD_FROM}

# Install runtime dependencies
RUN apk add --no-cache \
    curl \
    git \
    bash

# Install OpenCode binary
RUN curl -fsSL https://opencode.ai/install | bash \
    && mv /root/.local/bin/opencode /usr/local/bin/opencode \
    && chmod +x /usr/local/bin/opencode

# Create persistent data directory
RUN mkdir -p /data/opencode

# Copy run script
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]

LABEL \
    io.hass.type="addon" \
    io.hass.name="OpenCode" \
    io.hass.description="AI coding agent with web UI" \
    io.hass.version="1.0.0" \
    io.hass.arch="aarch64|amd64"
