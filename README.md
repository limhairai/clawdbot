# 🦞 ClawdBot / OpenClaw Setup

Your personal AI assistant via Telegram. Set up in minutes.

## 📋 What You Need

- ✅ macOS (you have this)
- ✅ Node.js (you have v22.11.0, need to upgrade to v22.12.0+)
- ✅ Homebrew (you have this)
- 📱 Telegram account
- 🔑 API key for Claude, GPT-4o, Gemini, or other AI provider

## ⚡ Quick Start (5 minutes)

### 1. Upgrade Node.js

OpenClaw requires Node.js v22.12.0 or later. You currently have v22.11.0.

**Easiest way:**
```bash
brew install node@latest
node --version  # Should show v24+ or v22.13+
```

Or use the provided script:
```bash
bash upgrade-node.sh
```

### 2. Set up PATH

Add OpenClaw to your PATH in `~/.zshrc`:

```bash
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# Verify
openclaw --version
```

### 3. Prepare Telegram Credentials

You'll need these three things:

**a) Telegram Bot Token:**
- Open Telegram → Search for `@BotFather`
- Send `/newbot`
- Follow prompts, save the token it gives you

**b) Your Telegram User ID:**
- Search for `@userinfobot` in Telegram
- Click "Start" 
- Copy your ID number

**c) AI Provider API Key:**
Choose one:
- **Claude**: Get key at https://console.anthropic.com/
- **GPT-4o**: Get key at https://platform.openai.com/api-keys
- **Gemini**: Get key at https://makersuite.google.com/app/apikey

### 4. Run Setup Wizard

```bash
export PATH="$HOME/.npm-global/bin:$PATH"
openclaw onboard --install-daemon
```

The wizard will ask for:
- Telegram bot token
- Your Telegram user ID
- AI provider choice
- API credentials

### 5. Open Your Bot

Go to Telegram and search for your bot (the username you created). Start chatting!

## 📁 Files in This Directory

- **README.md** - This file
- **SETUP_GUIDE.md** - Detailed setup instructions
- **TELEGRAM_SETUP_CHECKLIST.md** - Checklist for configuration  
- **upgrade-node.sh** - Script to upgrade Node.js
- **package.json** - npm configuration

## 🔍 Verify Installation

```bash
# Check OpenClaw is installed
openclaw --version

# Check status
openclaw status

# Open dashboard
openclaw dashboard

# Test agent
openclaw agent --message "Hello, are you working?"
```

## 🚀 Running Your Bot

### One-time Use
```bash
export PATH="$HOME/.npm-global/bin:$PATH"
openclaw onboard --install-daemon
openclaw gateway start
```

### Run as Background Daemon

```bash
# Install daemon
openclaw daemon install

# Start it
openclaw daemon start

# Check status
openclaw daemon status

# Stop it
openclaw daemon stop

# View logs
openclaw logs
```

## 📱 How It Works

1. You send a message to your bot on Telegram
2. OpenClaw (running locally on your Mac) receives it
3. It sends the message to your chosen AI provider (Claude/GPT-4o/etc)
4. The response comes back to your bot
5. You see the reply in Telegram

**All your data stays on your computer!** 🔒

## 🆘 Troubleshooting

### "openclaw: command not found"
```bash
export PATH="$HOME/.npm-global/bin:$PATH"
source ~/.zshrc
```

### "requires Node >=22.12.0"
```bash
brew install node@latest
# or
nvm install 22.13.0 && nvm use 22.13.0
```

### Bot not responding in Telegram
- Check `openclaw status` - gateway should be running
- Verify your Telegram User ID is correct
- Restart: `openclaw gateway restart`
- Check logs: `openclaw logs`

### Port already in use
OpenClaw uses ports 3000-3002. Make sure they're free or configure custom ports.

## 📚 More Help

- OpenClaw Docs: https://docs.openclaw.ai/
- Quick Start: https://docs.openclaw.ai/start/quickstart
- Telegram Integration: https://www.aifreeapi.com/en/posts/openclaw-telegram-setup

## 💡 Next Steps

Once your bot is working:

1. **Test extensively** - Make sure it responds correctly
2. **Configure memory** - Set how long it remembers conversations
3. **Add tools** (optional) - Enable web search, code execution
4. **Set up automations** (optional) - Trigger commands on schedule
5. **Invite others** (optional) - Share with friends

## 🎉 You're All Set!

Your personal AI is now in your pocket. Enjoy!

---

Need help? Check the docs or run `openclaw --help` for all available commands.
