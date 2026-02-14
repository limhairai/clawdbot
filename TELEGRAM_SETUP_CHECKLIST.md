# OpenClaw Telegram Setup Checklist

Use this checklist to keep track of your setup process.

## Pre-Setup Checklist

- [ ] Node.js upgraded to v22.12.0 or later (verify: `node --version`)
- [ ] PATH updated to include OpenClaw (`which openclaw` works)
- [ ] OpenClaw command works (`openclaw --version` works)

## Telegram Bot Creation

### Create Bot with @BotFather

1. Open Telegram (web.telegram.org or mobile app)
2. Search for **@BotFather** and open the chat
3. Send `/newbot`
4. Follow these steps:
   - **Bot name**: e.g., "My AI Assistant" or "Claude Bot"
   - **Bot username**: e.g., `my_ai_assistant_bot` (must end with `_bot`)
5. **⭐ SAVE THIS TOKEN**: `_______________:_____________________________`
   
   Token saved: ________________________________

### Get Your Telegram User ID

1. Search for **@userinfobot** in Telegram
2. Click "Start" to see your profile info
3. Look for **id** field (a number like: 123456789)

   Your ID saved: ________________________________

### Prepare Your AI Credentials

Choose which AI provider you want to use:

**🌍 Western Models:**
- [ ] **Claude (Anthropic)**
  - Get API key at: https://console.anthropic.com/
  - Key saved: ________________________________

- [ ] **GPT-4o (OpenAI)**  
  - Get API key at: https://platform.openai.com/api-keys
  - Key saved: ________________________________

- [ ] **Gemini (Google)**
  - Get API key at: https://makersuite.google.com/app/apikey
  - Key saved: ________________________________

**🇨🇳 Chinese Models (Built-in Support!):**
- [ ] **Moonshot AI (Kimi)** ⭐ RECOMMENDED
  - Get API key at: https://platform.moonshot.ai/
  - Key saved: ________________________________
  - See: CHINESE_MODELS_GUIDE.md

- [ ] **Z.AI (GLM)**
  - Get API key at: https://open.bigmodel.cn/
  - Key saved: ________________________________
  - See: CHINESE_MODELS_GUIDE.md

- [ ] **Together AI** (Multi-model, includes Qwen/DeepSeek)
  - Get API key at: https://www.together.ai/
  - Key saved: ________________________________

- [ ] **Other provider** (enter name):
  - Provider: ________________________________
  - Key saved: ________________________________

## Running OpenClaw Onboarding

Once all above is ready, run:

```bash
# Make sure PATH is set up
export PATH="$HOME/.npm-global/bin:$PATH"

# Run the interactive setup
openclaw onboard --install-daemon
```

### During Setup, You'll Be Prompted For:

1. **Telegram Bot Token** - paste the token from BotFather
2. **Telegram User ID** - paste your user ID from userinfobot  
3. **AI Provider** - select your provider
4. **API Credentials** - provide your API key for the provider
5. **Model Selection** - choose the model you want to use

## Verification

Once setup completes:

```bash
# Check status
openclaw status

# View dashboard
openclaw dashboard

# Test with a message
openclaw agent --message "Hello! Are you working?"
```

## Access Your Bot

1. Go to Telegram
2. Search for your bot username (e.g., `my_ai_assistant_bot`)
3. Click "Start" to begin chatting
4. Send messages - your AI will respond!

## Troubleshooting

### Problem: "openclaw: command not found"
**Solution**: Add to ~/.zshrc:
```bash
export PATH="$HOME/.npm-global/bin:$PATH"
```
Then: `source ~/.zshrc`

### Problem: "requires Node >=22.12.0"
**Solution**: Upgrade Node.js
```bash
brew install node@latest
# or
nvm install 22.13.0 && nvm use 22.13.0
```

### Problem: Bot not responding
**Solution**: Check these things:
1. Make sure `openclaw gateway` is running: `openclaw status`
2. Verify bot token is correct
3. Check your Telegram User ID is correct (should only give YOUR ID access)
4. Restart gateway: `openclaw gateway restart`

### Problem: Something else?
**Solution**: Check logs:
```bash
openclaw logs
```

## Running OpenClaw Continuously

To keep your bot running even when your terminal closes:

```bash
# Install as daemon (one-time)
openclaw daemon install

# Start the daemon
openclaw daemon start

# Check status
openclaw daemon status

# Stop the daemon
openclaw daemon stop
```

## Next Steps After Setup

Once everything is working:

1. **Test your bot** - Have a conversation to make sure it works
2. **Configure memory** - Set conversation memory settings
3. **Add tools** (optional) - Enable web search, code execution, etc.
4. **Invite others** (optional) - Share your bot with friends

Enjoy your personal AI assistant! 🤖
