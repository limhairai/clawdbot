# Deploy ClawdBot to Render

## Quick Setup (5 minutes)

### Step 1: Push to GitHub

From your Clawdbot directory:

```bash
git init
git add .
git commit -m "Initial ClawdBot setup for Render deployment"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/clawdbot.git
git push -u origin main
```

### Step 2: Deploy on Render

1. Go to https://dashboard.render.com
2. Click **"New +"** → **"Web Service"**
3. Connect your GitHub repository
4. Select the `clawdbot` repository
5. Fill in the settings:
   - **Name**: `clawdbot`
   - **Environment**: `Node`
   - **Build Command**: `npm install`
   - **Start Command**: `bash start.sh`
   - **Plan**: Free (or paid if you prefer)

### Step 3: Add Environment Variables

In Render dashboard, add these environment variables:

- **ZAI_API_KEY**: `f6efdf6a032847099770f91f4a3dfaf6.yT7y2qcysEHOFwam`
- **TELEGRAM_BOT_TOKEN**: `8413151749:AAGFs46EBFr3wq7cjcKDUtNi9FkR_vkQOkQ`

### Step 4: Deploy!

Click **"Create Web Service"**

Render will:
1. Clone your repo
2. Install dependencies
3. Start the ClawdBot gateway
4. Your bot goes live! 🎉

## Testing

Once deployed:

1. Send a message to your new Telegram bot
2. It should respond within seconds!
3. The bot runs 24/7 on Render

## Troubleshooting

**Check logs in Render dashboard:**
- Click your service
- Go to "Logs" tab
- See real-time output

**If bot doesn't respond:**
- Verify environment variables are set correctly
- Check Z.AI account has credits
- Look at Render logs for errors

## Files Included

- `openclaw.json` - Main config (created at runtime)
- `package.json` - Dependencies
- `start.sh` - Startup script
- `render.yaml` - Render configuration

## Notes

- Free tier on Render will spin down after 15 minutes of inactivity
- Upgrade to paid for always-on service
- Your conversation history is stored on Render's filesystem (ephemeral - lost on redeploy)

Ready to deploy? Push to GitHub and follow the steps above! 🚀
