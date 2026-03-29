#!/usr/bin/with-contenv bashio
# ==============================================================================
# Start the OpenCode web server
# ==============================================================================

declare server_password
declare anthropic_api_key
declare openai_api_key
declare port

server_password=$(bashio::config 'server_password')
anthropic_api_key=$(bashio::config 'anthropic_api_key')
openai_api_key=$(bashio::config 'openai_api_key')
port=$(bashio::config 'port')

export OPENCODE_SERVER_PASSWORD="${server_password}"

if bashio::var.has_value "${anthropic_api_key}"; then
    export ANTHROPIC_API_KEY="${anthropic_api_key}"
    bashio::log.info "Anthropic API key configured"
fi

if bashio::var.has_value "${openai_api_key}"; then
    export OPENAI_API_KEY="${openai_api_key}"
    bashio::log.info "OpenAI API key configured"
fi

cd /data/opencode || true

bashio::log.info "Starting OpenCode web server on port ${port}..."

exec opencode web \
    --hostname 0.0.0.0 \
    --port "${port}"
