# ClawdBot / OpenClaw Setup Guide

Welcome! This guide will walk you through setting up OpenClaw and connecting it to Telegram.

## Current Status

✅ **Completed:**
- OpenClaw CLI installed globally (`~/.npm-global/bin/openclaw`)
- Node Version Manager (nvm) installed
- npm configured to use user directory

⚠️ **Outstanding:**
- Need to upgrade Node.js from v22.11.0 to v22.12.0+ (OpenClaw requires this)

## Quick Start - Next Steps

### Step 1: Upgrade Node.js

Your system has Node.js v22.11.0 but OpenClaw requires v22.12.0 or later. Choose one of these methods:

**Method A: Using Homebrew (Easiest)**
```bash
# Unlink current version
brew unlink node

# Install latest node
brew install node@latest

# Verify
node --version
```

**Method B: Download from nodejs.org**
1. Visit https://nodejs.org/
2. Download Node.js v24.13.0 LTS (or later v22.x)
3. Run the installer
4. Verify: `node --version`

**Method C: Using nvm (Advanced)**
```bash
# Source nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install latest
nvm install 22.13.0
nvm use 22.13.0

# Verify
node --version
```

### Step 2: Update PATH

Add OpenClaw to your PATH by adding this to your `~/.zshrc`:

```bash
export PATH="$HOME/.npm-global/bin:$PATH"
```

Then reload:
```bash
source ~/.zshrc
```

### Step 3: Verify Installation

```bash
openclaw --version
```

You should see the OpenClaw version number.

## Installation Issues & Solutions

The initial install script encountered npm registry issues. We've resolved this by installing locally:

### Option 1: Try Using npx Directly (Recommended)

Try running the OpenClaw setup directly with npx:

```bash
npx @openclawdbot/cli onboard --install-daemon
```

If that doesn't work, proceed to Option 2.

### Option 2: Manual Installation via npm Global

First, let's try installing globally with a fresh npm configuration:

```bash
# Clear npm cache
npm cache clean --force

# Install OpenClaw globally
npm install -g @openclawdbot/cli
```

Then run the onboarding:

```bash
openclaw onboard --install-daemon
```

### Option 3: Install via Homebrew (if available on macOS)

```bash
# Check if available
brew search openclaw

# If found, install via:
brew install openclaw
```

## Next Steps: Configuration

Once the CLI is installed, follow these configuration steps:

### 1. Create a Telegram Bot

1. Open Telegram on your phone or web (web.telegram.org)
2. Search for **@BotFather**
3. Send the command `/newbot`
4. Follow BotFather's prompts:
   - **Name your bot**: e.g., "My AI Assistant"
   - **Choose username**: must end with `_bot` (e.g., `my_ai_bot`)
5. **Copy the token** that BotFather gives you (looks like: `123456:ABC-DEF1234ghIkl-zyx57W2v1u123ew11`)

### 2. Get Your Telegram User ID

1. Search for **@userinfobot** in Telegram
2. Click "Start"
3. It will show you a JSON with your User ID (a number like: `123456789`)
4. **Save this ID** - you'll need it during setup

### 3. Run OpenClaw Onboarding

```bash
openclaw onboard --install-daemon
```

During the setup, you'll be prompted to enter:
- **Telegram Bot Token** (from BotFather)
- **Your Telegram User ID** (from userinfobot)
- **AI Model Provider**: Choose from:
  - Claude (Anthropic) - Requires API key
  - GPT-4o (OpenAI) - Requires API key
  - Gemini (Google) - Requires API key
  - Or other available models

### 4. Restart Gateway

```bash
openclaw gateway restart
```

### 5. Verify Installation

Open the control dashboard:

```bash
openclaw dashboard
```

This will open a local web interface where you can manage your bot.

## Troubleshooting

### Problem: `openclaw: command not found`

**Solution**: Make sure npm installed the package globally:
```bash
npm install -g @openclawdbot/cli
```

Then restart your terminal or reload your shell:
```bash
source ~/.zshrc
```

### Problem: npm registry errors

**Solution**: Try using a different npm registry:
```bash
npm config set registry https://registry.npmjs.org/
npm cache clean --force
npm install -g @openclawdbot/cli
```

### Problem: Port already in use

**Solution**: OpenClaw uses several ports locally. Make sure ports 3000, 3001, etc. are available.

## Using Your Bot

Once everything is set up:

1. Go to Telegram and find your bot (search for the username you created)
2. Click "Start" or send any message
3. Your AI bot will respond!
4. The bot will remember your conversation history
5. All data stays locally on your machine

## Common Commands

```bash
# View dashboard
openclaw dashboard

# Check bot status
openclaw status

# Restart gateway
openclaw gateway restart

# View logs
openclaw logs

# Stop daemon
openclaw daemon stop

# Get help
openclaw --help
```

## Important Notes

- 🔒 All your data stays local - OpenClaw runs on your machine
- 🔑 You'll need API keys for your chosen AI provider (Claude, GPT-4o, etc.)
- 📱 You can use your bot from any device via Telegram
- 💾 Conversations are stored locally and persist across sessions

---

If you run into any issues, let me know and we can troubleshoot together!
