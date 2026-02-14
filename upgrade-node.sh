#!/bin/bash

# Script to upgrade Node.js to a version compatible with OpenClaw

echo "🔄 Upgrading Node.js for OpenClaw..."
echo ""

# Check current version
CURRENT_NODE=$(node --version)
echo "Current Node version: $CURRENT_NODE"
echo ""

# Try Homebrew first
if command -v brew &> /dev/null; then
    echo "✅ Homebrew detected"
    echo ""
    echo "Option 1: Using Homebrew (Recommended)"
    echo "Run: brew install node@latest"
    echo ""
    echo "This will install the latest Node.js LTS version"
    echo ""
    
    # Ask if they want to proceed
    read -p "Would you like to proceed with Homebrew installation? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Installing latest Node.js via Homebrew..."
        brew install node@latest
        
        # Verify
        echo ""
        echo "New Node version: $(node --version)"
        echo "✅ Node.js upgraded successfully!"
        exit 0
    fi
fi

echo ""
echo "Option 2: Download from nodejs.org"
echo "Visit: https://nodejs.org/"
echo "Download: Node.js 24.13.0 LTS or later"
echo ""
echo "After installation, verify with: node --version"
echo ""

# Check nvm
if [ -s "$HOME/.nvm/nvm.sh" ]; then
    echo "Option 3: Using nvm (already installed)"
    echo ""
    read -p "Would you like to use nvm? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        
        echo "Installing Node.js 22.13.0..."
        nvm install 22.13.0
        
        echo "Switching to Node.js 22.13.0..."
        nvm use 22.13.0
        
        # Verify
        echo ""
        echo "New Node version: $(node --version)"
        echo "✅ Node.js upgraded successfully!"
        exit 0
    fi
fi

echo ""
echo "⚠️  Please upgrade Node.js manually, then try:"
echo "   openclaw --version"
echo ""
