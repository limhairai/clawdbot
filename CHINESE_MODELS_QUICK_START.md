# 中文 + 🤖 Chinese AI Models Quick Reference

## TL;DR - Get Started Now!

### Option 1: Moonshot/Kimi (Easiest) ⭐

**1. Get API Key:**
```
Go to: https://platform.moonshot.ai/
Sign up → Generate API key → Copy it
```

**2. Start Onboarding:**
```bash
export PATH="$HOME/.npm-global/bin:$PATH"
openclaw onboard --install-daemon
```

**3. When asked for AI provider:**
- Look for "Moonshot" or "Custom"
- Enter: `moonshot` or `kimi`
- Paste your API key

**4. Done!** Test it:
```bash
openclaw agent --message "你好"
```

---

### Option 2: Z.AI/GLM

**1. Get API Key:**
```
Go to: https://open.bigmodel.cn/
Sign up → Get API key
```

**2. During onboarding:**
```bash
openclaw onboard --auth-choice zai-api-key
```

**3. Done!**

---

## Model Comparison

| | Moonshot (Kimi) | Z.AI (GLM) | Together AI |
|---|---|---|---|
| **Best for** | General Chinese | Reasoning | Multiple options |
| **Setup** | Very easy | Easy | Moderate |
| **Context** | 256K tokens | Large | Large |
| **Price** | Varies | Free tier available | Varies |
| **Chinese support** | Excellent | Excellent | Good |

---

## Models Available

### Moonshot/Kimi
- `kimi-k2.5` (Fastest)
- `kimi-k2-turbo-preview` (Speed-optimized)
- `kimi-k2-thinking` (Better reasoning)

### Z.AI/GLM
- `glm-4.7` (Latest)

### Together AI (Many options)
- Alibaba Qwen
- DeepSeek models
- And more!

---

## Manual Configuration

If onboarding doesn't show your model, edit:

```bash
~/.openclaw/openclaw.json
```

Add this for Moonshot:

```json
{
  "env": {
    "MOONSHOT_API_KEY": "sk-your-key-here"
  },
  "agents": {
    "defaults": {
      "model": {
        "primary": "moonshot/kimi-k2.5"
      }
    }
  },
  "models": {
    "mode": "merge",
    "providers": {
      "moonshot": {
        "baseUrl": "https://api.moonshot.ai/v1",
        "apiKey": "${MOONSHOT_API_KEY}",
        "api": "openai-completions",
        "models": [{
          "id": "kimi-k2.5",
          "name": "Kimi K2.5"
        }]
      }
    }
  }
}
```

Then restart:
```bash
openclaw gateway restart
```

---

## Troubleshooting

**Model not found?**
```bash
# Edit ~/.openclaw/openclaw.json manually
# Or restart:
openclaw gateway restart
```

**API key error?**
```bash
# Check environment variable is set
echo $MOONSHOT_API_KEY

# Verify no typos in key (Moonshot keys start with "sk-")
```

**No response?**
```bash
# Check logs
openclaw logs

# Restart
openclaw gateway restart
```

---

## Test Commands

```bash
# Test with Chinese
openclaw agent --message "你好，你可以帮我什么？"

# English also works
openclaw agent --message "Hello, what can you do?"

# Check status
openclaw status
```

---

## For More Details

See: `CHINESE_MODELS_GUIDE.md` (full documentation)

---

## Recommended Setup Order

1. ✅ Get Moonshot API key (5 min)
2. ✅ Run `openclaw onboard --install-daemon`
3. ✅ Select Moonshot/Kimi during onboarding
4. ✅ Start using: `openclaw gateway start`
5. ✅ Chat on Telegram!

**Total time: ~10 minutes** ⏱️

---

好运! (Good luck!) 🚀
