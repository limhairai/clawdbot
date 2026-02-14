# 🇨🇳 Using Chinese AI Models with OpenClaw

Great news! OpenClaw natively supports several Chinese AI models! Here are your options:

## ✨ Recommended Chinese Models

### 1. **Moonshot AI (Kimi) - ⭐ RECOMMENDED**

Kimi is a powerful Chinese AI model with excellent support in OpenClaw.

**Models available:**
- `kimi-k2.5` - Latest and fastest
- `kimi-k2-turbo-preview` - Optimized for speed
- `kimi-k2-thinking` - Advanced reasoning
- `kimi-k2-thinking-turbo` - Reasoning + speed

**Features:**
- Context window: 256,000 tokens (excellent for long conversations!)
- Reasoning capabilities available
- Excellent for Chinese language

**Setup:**
1. Get API key: https://platform.moonshot.ai/
2. During onboarding, select "Moonshot" or custom provider
3. Or edit `~/.openclaw/openclaw.json`:

```json
{
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

Then set environment variable:
```bash
export MOONSHOT_API_KEY="sk-your-key-here"
```

### 2. **Z.AI (GLM) - Zhipu's GLM Models**

Chinese AI models from Zhipu (maker of ChatGLM).

**Models available:**
- `glm-4.7` - Latest GLM model
- Other GLM variants

**Setup:**
1. Get API key: https://open.bigmodel.cn/ (or regional endpoint)
2. Add to config:

```json5
{
  agents: {
    defaults: {
      model: { primary: "zai/glm-4.7" },
      models: { "zai/glm-4.7": {} },
    },
  },
  env: { ZAI_API_KEY: "..." },
}
```

Or during onboarding:
```bash
openclaw onboard --auth-choice zai-api-key
```

### 3. **Other Chinese Models via Together AI**

Together AI supports many open-source models, including:
- **Qwen** (Alibaba)
- **DeepSeek** (reasoning models)
- **Llama** variants
- Many others

All accessible through Together AI's API.

## 🚀 Quick Start with Moonshot/Kimi (Easiest)

### Step 1: Get Moonshot API Key
1. Visit: https://platform.moonshot.ai/
2. Sign up with your account
3. Generate API key
4. Copy the key

### Step 2: Run Onboarding
```bash
export PATH="$HOME/.npm-global/bin:$PATH"
openclaw onboard --install-daemon
```

During onboarding, when asked for AI provider:
- Select "Other" or "Custom"
- Or look for "Moonshot" if available in the list

### Step 3: Configure (if needed)
Edit `~/.openclaw/openclaw.json` and add:

```json
{
  "env": {
    "MOONSHOT_API_KEY": "sk-your-actual-key"
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

### Step 4: Restart OpenClaw
```bash
openclaw gateway restart
```

## 📊 Comparison of Chinese Models

| Model | Provider | Best For | Context | Language |
|-------|----------|----------|---------|----------|
| **Kimi K2.5** | Moonshot | General use | 256K | 中文/English |
| **GLM-4.7** | Z.AI | Reasoning | Large | 中文/English |
| **Qwen** | Alibaba | Code/Tech | Large | 中文/English |
| **DeepSeek** | DeepSeek | Reasoning | Large | 中文/English |

## ⚙️ Configuration File Location

```bash
# Edit your configuration here:
~/.openclaw/openclaw.json

# Or view current config:
cat ~/.openclaw/openclaw.json
```

## 🔧 Troubleshooting

**Problem: Model not responding**
```bash
# Check logs
openclaw logs

# Restart gateway
openclaw gateway restart

# Verify API key is set correctly
echo $MOONSHOT_API_KEY
```

**Problem: "Invalid API key"**
- Double-check your key doesn't have typos
- Ensure you've set the environment variable correctly
- For Moonshot: prefix should be `sk-`

**Problem: Can't find model in onboarding**
- Manually edit `~/.openclaw/openclaw.json` as shown above
- Restart OpenClaw after editing

## 💡 Pro Tips

1. **Test your model:**
   ```bash
   openclaw agent --message "你好，你好吗？" 
   # (Hello, how are you?)
   ```

2. **Use aliases for convenience:**
   ```json5
   "models": {
     "kimi": { "alias": "Kimi (Chinese)" }
   }
   ```

3. **Set billing limits** on your provider's dashboard to avoid unexpected charges

4. **Keep multiple models configured** - switch between them easily:
   ```bash
   # In ~/.openclaw/openclaw.json, change "primary" model
   ```

## 📚 Useful Links

- **Moonshot AI**: https://platform.moonshot.ai/
- **Z.AI (GLM)**: https://open.bigmodel.cn/
- **OpenClaw Docs**: https://docs.openclaw.ai/
- **Model Providers**: https://docs.openclaw.ai/concepts/model-providers

## 🎯 Which One Should I Choose?

### Use **Moonshot/Kimi** if:
- ✅ You want the easiest setup
- ✅ You need excellent Chinese support
- ✅ You prefer a single, well-integrated provider
- ✅ You want long context windows

### Use **Z.AI/GLM** if:
- ✅ You're familiar with GLM models
- ✅ You want open-source transparency
- ✅ You prefer Zhipu's ecosystem

### Use **Together AI** if:
- ✅ You want variety (Qwen, DeepSeek, Llama)
- ✅ You like having backup options
- ✅ You want to experiment with different models

---

**Ready to set up with a Chinese model?** Start with Moonshot/Kimi - it's the most seamlessly integrated! 🚀
