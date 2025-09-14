#!/bin/bash

# === Overlord Runner Update Script ===
# Updates the runner repo, installs dependencies, and restarts the bot.

RUNNER_PATH="$HOME/Megatron-Runner"

echo "🔄 [$(date '+%H:%M:%S')] Checking for Megatron updates..."

# 1️⃣ Go to runner repo
cd "$RUNNER_PATH" || { echo "❌ Runner repo not found at $RUNNER_PATH"; exit 1; }

# 2️⃣ Stop any running instance
if command -v pm2 >/dev/null 2>&1; then
    pm2 stop megatron >/dev/null 2>&1
fi

# 3️⃣ Pull latest code
git reset --hard
git pull origin main --rebase || { echo "❌ Failed to pull runner repo"; exit 1; }

# 4️⃣ Install dependencies
echo "📦 Installing dependencies..."
npm install --production || { echo "❌ npm install failed"; exit 1; }

# 5️⃣ Restart bot
echo "🚀 Restarting Megatron..."
if command -v pm2 >/dev/null 2>&1; then
    pm2 start megatron-locked.js --name megatron
    pm2 save
    echo "✅ [$(date '+%H:%M:%S')] Megatron updated and running under PM2."
else
    echo "⚠️ PM2 not found — starting bot in foreground."
    node megatron-locked.js
fi
