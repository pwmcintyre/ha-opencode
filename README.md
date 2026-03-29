# ha-opencode

Home Assistant add-on that runs [OpenCode](https://opencode.ai) as a web server on your HA instance.

## What this does

Runs `opencode web` inside a Docker container on your Home Assistant OS, giving you a browser-based AI coding agent accessible from your local network.

## Installation

1. In Home Assistant, go to **Settings → Add-ons → Add-on Store**
2. Click the three dots menu (top right) → **Repositories**
3. Add this repository URL: `https://github.com/pwmcintyre/ha-opencode`
4. Find "OpenCode" in the store and click **Install**
5. Configure your API key(s) and server password in the add-on settings
6. Start the add-on
7. Access the web UI at `http://<your-ha-ip>:4096`

## Configuration

| Option | Required | Description |
|---|---|---|
| `server_password` | Yes | Password for HTTP basic auth (username: `opencode`) |
| `anthropic_api_key` | No | Anthropic API key for Claude models |
| `openai_api_key` | No | OpenAI API key for GPT models |
| `port` | Yes | Port for the web UI (default: 4096) |

## Adding Cloudflare Tunnel (remote access)

For remote access without port forwarding, install the [Cloudflare add-on](https://github.com/brenner-tobias/addon-cloudflared) separately and configure it to proxy `http://localhost:4096`.

## Architecture

Supports `aarch64` (Raspberry Pi 4) and `amd64`.
