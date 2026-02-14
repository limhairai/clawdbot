#!/bin/bash

# Complete OpenClaw/ClawdBot setup script
# This script will guide you through the entire setup process

set -e

echo "🦞 OpenClaw / ClawdBot Complete Setup"
echo "======================================"
echo ""

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check Node version
echo -e "${BLUE}Checking Node.js version...${NC}"
CURRENT_NODE=$(node --version)
echo "Current Node: $CURRENT_NODE"

MAJOR=$(echo $CURRENT_NODE | cut -d. -f1 | sed 's/v//')
MINOR=$(echo $CURRENT_NODE | cut -d. -f2)
PATCH=$(echo $CURRENT_NODE | cut -d. -f3)

# Check if version is >= 22.12.0
if [ "$MAJOR" -lt 22 ] || ([ "$MAJOR" -eq 22 ] && [ "$MINOR" -lt 12 ]); then
    echo -e "${YELLOW}⚠️  Node.js $CURRENT_NODE detected${NC}"
    echo -e "${YELLOW}OpenClaw requires Node.js >= 22.12.0${NC}"
    echo ""
    echo "Please upgrade Node.js first:"
    echo ""
    echo "  Option 1: brew install node@latest"
    echo "  Option 2: bash upgrade-node.sh"
    echo ""
    exit 1
fi

echo -e "${GREEN}✓ Node.js version OK${NC}"
echo ""

# Check if PATH is set up
echo -e "${BLUE}Checking PATH configuration...${NC}"
if [[ "$PATH" == *"$HOME/.npm-global/bin"* ]]; then
    echo -e "${GREEN}✓ PATH already configured${NC}"
else
    echo -e "${YELLOW}Adding to ~/.zshrc...${NC}"
    echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.zshrc
    echo -e "${GREEN}✓ Added to PATH${NC}"
    echo -e "${YELLOW}Run: source ~/.zshrc${NC}"
fi
echo ""

# Check OpenClaw installation
echo -e "${BLUE}Checking OpenClaw installation...${NC}"
if command -v openclaw &> /dev/null; then
    OPENCLAW_VERSION=$(openclaw --version 2>/dev/null || echo "unknown")
    echo -e "${GREEN}✓ OpenClaw installed: $OPENCLAW_VERSION${NC}"
else
    echo -e "${RED}✗ OpenClaw not found in PATH${NC}"
    echo "Run: source ~/.zshrc"
    exit 1
fi
echo ""

# Summary
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}Setup Prerequisites Complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo "Next steps:"
echo ""
echo "1️⃣  Prepare your Telegram credentials:"
echo "   • Create bot with @BotFather → get token"
echo "   • Get user ID from @userinfobot"
echo "   • Get API key from Claude/GPT-4o/Gemini"
echo ""
echo "2️⃣  Save credentials (for reference):"
echo "   • Check: TELEGRAM_SETUP_CHECKLIST.md"
echo ""
echo "3️⃣  Run the onboarding wizard:"
echo "   $ openclaw onboard --install-daemon"
echo ""
echo "4️⃣  Start your bot:"
echo "   $ openclaw gateway start"
echo ""
echo "5️⃣  Chat with your bot on Telegram!"
echo ""
echo -e "${BLUE}For detailed instructions, see:${NC}"
echo "   • README.md"
echo "   • SETUP_GUIDE.md"
echo "   • TELEGRAM_SETUP_CHECKLIST.md"
echo ""
echo -e "${GREEN}Happy chatting! 🤖${NC}"
