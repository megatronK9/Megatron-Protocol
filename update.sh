#!/bin/bash

echo "🔄 [$(date +'%H:%M:%S')] Checking for Megatron updates..."

# Stop any running instance
if command -v pm2 >/dev/null 2>&1; then
    pm2 stop megatron >/dev/null 2>&1
fi

# Pull latest code from your repo
git reset --hard
git pull origin main

# Install any new dependencies
npm install --omit=dev

# Restart bot
if command -v pm2 >/dev/null 2>&1; then
    pm2 start megatron-locked.js --name megatron
    pm2 save
    echo "✅ Megatron updated and running under PM2."
else
    echo "⚠️ PM2 not found — starting bot in foreground."
    node megatron-locked.js
fi
