# AstrBot — AI Agent Assistant & Chatbot Platform

[![Deploy to Railway](https://railway.app/button.svg)](https://railway.com/deploy/astrbot-1)

AstrBot is an open-source AI agent assistant and chatbot platform that supports multiple messaging platforms, LLM providers, and plugin extensions. Deploy a self-hosted instance on Railway in one click.

# Deploy and Host AstrBot

Deploying AstrBot on Railway gives you a self-hosted AI agent platform with persistent storage, automatic scaling, and a managed environment. No server maintenance required.

## About Hosting

AstrBot runs as a single container on Railway with a persistent volume for SQLite data. The WebUI is served on port 6185 and accessible via your Railway public domain.

## Why Deploy

- **One-click deploy**: No manual server setup — Railway handles provisioning, networking, and SSL
- **Persistent storage**: SQLite data survives restarts via Railway volume mounts
- **Auto-redeploy**: Push to your connected GitHub repo to trigger fresh deploys
- **Managed infrastructure**: Railway handles health checks, logging, and DNS

## Common Use Cases

- **Personal AI assistant**: Connect to your preferred LLM and chat from any platform
- **Multi-platform bot**: Bridge QQ, Telegram, Discord, WeChat, and more through one backend
- **Plugin development**: Build and test community plugins in a live environment
- **Team chatbot**: Deploy a shared agent with session isolation and persona management

## Dependencies for AstrBot

AstrBot is fully self-contained. It bundles:
- FastAPI web server
- SQLite database (no external DB needed)
- Plugin runtime with sandboxed execution
- Multi-platform message adapters

### Deployment Dependencies

| Dependency | Type | Notes |
|------------|------|-------|
| Volume | Storage | Auto-mounted at `/AstrBot/data` for persistence |
| Port 6185 | Network | WebUI + API (exposed publicly) |

No external databases or third-party services are required.

## Features

- **Multi-platform support**: QQ, WeChat, Telegram, Discord, DingTalk, Feishu, and more via OneBot v11 adapters
- **LLM provider agnostic**: OpenAI, Anthropic, Google Gemini, DeepSeek, Qwen, Ollama, and any OpenAI-compatible API
- **Plugin ecosystem**: Extend functionality with community plugins — moderation, tools, knowledge bases, and more
- **Visual dashboard**: WebUI at port 6185 for configuration, chat, logs, and plugin management
- **Agent sandbox**: Optional native Python/Shell code execution environment (Shipyard)
- **Conversation management**: Session isolation, persona switching, and conversation history
- **Multi-agent orchestration**: Sub-agent support for complex task delegation

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `TZ` | `UTC` | Container timezone |
| `ASTRBOT_DASHBOARD_INITIAL_PASSWORD` | `Astrbot1` | Initial dashboard password (set before first boot) |

All other configuration is done through the WebUI after first login.

## Ports

| Port | Purpose |
|------|---------|
| `6185` | WebUI + API (primary, public) |
| `6199` | OneBot v11 WebSocket (optional) |

## License

[AGPL-3.0](https://github.com/AstrBotDevs/AstrBot/blob/master/LICENSE)
