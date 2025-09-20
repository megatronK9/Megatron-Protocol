#!/usr/bin/env bash
set -euo pipefail

clear
# === Overlord Crest ===
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║                                                                  ║"
echo "║      ████╗ ███████╗ ██████╗ ███████╗████████╗ ██████╗ ███╗   ██╗  ║"
echo "║      ██╔██╗██╔════╝██╔═══██╗██╔════╝╚══██╔══╝██╔═══██╗████╗  ██║  ║"
echo "║      ██║╚██║█████╗  ██║   ██║███████╗   ██║   ██║   ██║██╔██╗ ██║  ║"
echo "║      ██║ ╚██║██╔══╝  ██║   ██║╚════██║   ██║   ██║   ██║██║╚██╗██║  ║"
echo "║      ██║  ╚██║███████╗╚██████╔╝███████║   ██║   ╚██████╔╝██║ ╚████║  ║"
echo "║      ╚═╝   ╚═╝╚══════╝ ╚═════╝ ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═══╝  ║"
echo "║                                                                  ║"
echo "║                  Ⓜ️  MEGATRON PROTOCOL ACTIVE  Ⓜ️                 ║"
echo "║                                                                  ║"
echo "╚══════════════════════════════════════════════════════════════════╝"

# 1️⃣ Show current version
if [ -f package.json ]; then
  CURR_VER=$(node -p "require('./package.json').version" 2>/dev/null || echo "unknown")
  echo "📦 Current Protocol Version: v$CURR_VER"
else
  echo "📦 Current Protocol Version: unknown"
fi

# 2️⃣ Reset repo (delete everything except .git)
echo "🧹 Resetting Protocol repo..."
find . -mindepth 1 -maxdepth 1 ! -name ".git" -exec rm -rf {} +
echo "✅ Protocol repo cleaned."

# 3️⃣ Pull latest from GitHub
echo "📥 Pulling latest sealed build..."
git fetch origin main
git reset --hard origin/main

# 4️⃣ Install dependencies
echo "📦 Installing dependencies..."
if command -v pnpm >/dev/null; then
  pnpm i --prod
elif command -v yarn >/dev/null; then
  yarn install --production
else
  npm ci --only=production || npm i --only=production
fi

# 5️⃣ Restart bot
echo "🚀 Restarting Megatron Protocol..."
if command -v pm2 >/dev/null; then
  pm2 startOrReload ecosystem.config.js 2>/dev/null || pm2 restart megatron 2>/dev/null || pm2 start protocol-core.js --name megatron
  pm2 save
else
  echo "⚠️ PM2 not found. Starting raw node..."
  pkill -f protocol-core.js 2>/dev/null || true
  nohup node protocol-core.js >/dev/null 2>&1 &
fi

# 6️⃣ Show updated version
NEW_VER=$(node -p "require('./package.json').version" 2>/dev/null || echo "unknown")
echo ""
echo "╔══════════════════════════════════════════════════════════════════╗"
echo "║   ✅ UPDATE COMPLETE — MEGATRON PROTOCOL ONLINE                  ║"
echo "║   🔖 Updated Version: v$NEW_VER                                  ║"
echo "║   Ⓜ️  Overlord Crest: ACTIVE                                     ║"
echo "╚══════════════════════════════════════════════════════════════════╝"
echo ""
echo "🔥 Megatron Protocol is now live — sealed, viral, unstoppable."
echo -e "\a"
