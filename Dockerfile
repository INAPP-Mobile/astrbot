# AstrBot — AI Agent Assistant & Chatbot Platform
# https://github.com/AstrBotDevs/AstrBot
FROM soulter/astrbot:v4.29.4

# Railway healthcheck: root serves the FastAPI WebUI
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=5 \
  CMD curl -f http://localhost:6185/ || exit 1

EXPOSE 6185

# Run as root (required for volume mounts on Railway)
USER root

# Existing CMD from upstream: ["python", "main.py"]
