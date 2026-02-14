#!/bin/bash
set -e

echo "🦞 Starting ClawdBot on Render..."

# Create config directory
mkdir -p ~/.openclaw/agents/main/agent

# Create configuration file
cat > ~/.openclaw/openclaw.json << 'EOF'
{
  "env": {
    "ZAI_API_KEY": "$ZAI_API_KEY",
    "TELEGRAM_BOT_TOKEN": "$TELEGRAM_BOT_TOKEN"
  },
  "agents": {
    "defaults": {
      "model": {
        "primary": "zai/glm-5"
      }
    }
  },
  "channels": {
    "telegram": {
      "enabled": true,
      "botToken": "${TELEGRAM_BOT_TOKEN}",
      "dmPolicy": "pairing"
    }
  },
  "gateway": {
    "mode": "local",
    "bind": "0.0.0.0",
    "port": 8000
  }
}
EOF

# Create auth profiles
cat > ~/.openclaw/agents/main/agent/auth-profiles.json << 'EOF'
{
  "zai": {
    "apiKey": "$ZAI_API_KEY"
  }
}
EOF

chmod 600 ~/.openclaw/agents/main/agent/auth-profiles.json

echo "✅ Configuration created"
echo "🚀 Starting OpenClaw gateway..."

# Start the gateway
npx openclaw gateway start --allow-unconfigured
