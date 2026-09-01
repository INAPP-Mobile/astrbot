# AstrBot — AI Agent Assistant & Chatbot Platform

[![Deploy to Railway](https://railway.app/button.svg)](https://railway.app/deploy/astrbot)

AstrBot is an open-source AI agent assistant and chatbot platform that supports multiple messaging platforms, LLM providers, and plugin extensions. Deploy a self-hosted instance on Railway in one click.

## Features

- **Multi-platform support**: QQ, WeChat, Telegram, Discord, DingTalk, Feishu, and more via OneBot v11 adapters
- **LLM provider agnostic**: OpenAI, Anthropic, Google Gemini, DeepSeek, Qwen, Ollama, and any OpenAI-compatible API
- **Plugin ecosystem**: Extend functionality with community plugins — moderation, tools, knowledge bases, and more
- **Visual dashboard**: WebUI at port 6185 for configuration, chat, logs, and plugin management
- **Agent sandbox**: Optional native Python/Shell code execution environment (Shipyard)
- **Conversation management**: Session isolation, persona switching, and conversation history
- **Multi-agent orchestration**: Sub-agent support for complex task delegation

## Architecture

```
┌─────────────────────────────────────────────┐
│  Messaging Platforms (QQ, Telegram, etc.)   │
└──────────────────┬──────────────────────────┘
                   │ WebSocket / HTTP
                   ▼
┌─────────────────────────────────────────────┐
│  AstrBot Core (FastAPI on :6185)            │
│  ┌─────────┐ ┌──────────┐ ┌──────────────┐ │
│  │Platform │ │Provider  │ │Plugin        │ │
│  │Manager  │ │Manager   │ │Manager       │ │
│  └─────────┘ └──────────┘ └──────────────┘ │
│  ┌─────────┐ ┌──────────┐ ┌──────────────┐ │
│  │Conversa-│ │Persona   │ │Pipeline      │ │
│  │tion Mgr │ │Manager   │ │Scheduler     │ │
│  └─────────┘ └──────────┘ └──────────────┘ │
└──────────────────┬──────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│  LLM Providers (OpenAI, Claude, etc.)       │
└─────────────────────────────────────────────┘
```

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `TZ` | `UTC` | Container timezone |

All other configuration is done through the WebUI after first login. The initial admin password is generated at startup and printed in the deployment logs.

### Data Storage

AstrBot uses SQLite for persistence, stored at `/AstrBot/data`. A Railway volume is automatically mounted to preserve data across deploys.

## Deployment

1. Click the **Deploy to Railway** button above
2. Railway will provision the service and mount a persistent volume
3. Once deployed, open the service URL to access the WebUI
4. Check the deployment logs for the initial admin password
5. Log in with username `astrbot` and the generated password
6. Configure your LLM provider and messaging platform integrations

## Ports

| Port | Purpose |
|------|---------|
| `6185` | WebUI + API (primary, public) |
| `6199` | OneBot v11 WebSocket (optional) |

## License

[AGPL-3.0](https://github.com/AstrBotDevs/AstrBot/blob/master/LICENSE)
