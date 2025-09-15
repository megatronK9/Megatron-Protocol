<!-- Overlord Banner -->

<!-- Overlord Banner -->
<p align="center">
  <img src="https://media.giphy.com/media/im1xKpjEwdQuk/giphy.gif" width="300" alt="Transformers Logo">
</p>

<h1 align="center">🔥 I AM <span style="color:#FFD700;">MEGATRON</span> 🔥</h1>

<p align="center">
  <a href="https://github.com/MegatronK9/Megatron-Runner/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/MegatronK9/Megatron-Runner?style=for-the-badge&color=brightgreen" alt="License">
  </a>
  <a href="https://github.com/MegatronK9/Megatron-Runner/blob/main/package.json">
    <img src="https://img.shields.io/github/package-json/v/MegatronK9/Megatron-Runner?color=FFD700&label=VERSION&style=for-the-badge" alt="Version">
  </a>
  <a href="https://github.com/MegatronK9/Megatron-Runner/stargazers">
    <img src="https://img.shields.io/github/stars/MegatronK9/Megatron-Runner?color=ff0000&style=for-the-badge" alt="Stars">
  </a>
  <a href="https://github.com/MegatronK9/Megatron-Runner/network/members">
    <img src="https://img.shields.io/github/forks/MegatronK9/Megatron-Runner?color=ff0000&style=for-the-badge" alt="Forks">
  </a>
  <img src="https://img.shields.io/badge/Mode-SAVAGE-black?style=for-the-badge" alt="Mode">
  <img src="https://img.shields.io/github/last-commit/MegatronK9/Megatron-Runner?color=blue&style=for-the-badge" alt="Last Commit">
  <img src="https://img.shields.io/badge/Status-LIVE-brightgreen?style=for-the-badge" alt="Status">
</p>

<p align="center">
  <img src="https://media.tenor.com/your-thunderwing-id.gif" width="300" alt="Thunderwing Emblem">
</p>

![🔥](https://img.shields.io/badge/🔥-MegatronK9-red?style=for-the-badge)

![GitHub Stats](https://github-readme-stats.vercel.app/api?username=MegatronK9&show_icons=true&theme=radical)
![Top Languages](https://github-readme-stats.vercel.app/api/top-langs/?username=MegatronK9&layout=compact&theme=radical)

![Snake animation](https://github.com/MegatronK9/MegatronK9/blob/output/github-contribution-grid-snake.svg)

[![Twitter](https://img.shields.io/badge/Twitter-@MegatronK9-blue?style=flat&logo=twitter)](https://twitter.com/MegatronK9)
[![YouTube](https://img.shields.io/badge/YouTube-@MegatronK9-red?style=round&logo=youtube)](https://youtube.com/MegatronK9)

<img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/javascript/javascript-original.svg" width="40"/>

![Deploy Status](https://github.com/MegatronK9/Megatron/actions/workflows/deploy.yml/badge.svg)

---

## ⚡ MEGATRON‑RUNNER — COMMAND INDEX

> Mode: SAVAGE  
> Status: LIVE  
> Version: auto-updates from `package.json`

---

### 🧑‍🚀 Runner‑Only Commands

| Command            | Description |
|--------------------|-------------|
| `.menu` / `.help`  | Show the full public command menu |
| `.ping`            | Latency check — returns response time |
| `.owner`           | Show Overlord contact link |
| `.version`         | Bot version from package.json |

---

### 🕶️ Stealth Protocol

- `.stealth` → Randomize fingerprint before QR scan  
- `.fingerprint current` → Show active stealth profile  
- `.rotate random` → Switch identity mid-deploy  
- `.vanish` → Full stealth purge + restart + QR prompt  

---

### ⚡ How to Use

- Prefix every command with a dot `.`
- Commands are NOT case-sensitive
- Works in private chat or groups
- Example: `.ping`

---

## 🛠️ Deploy Ritual

```bash
pkg update && pkg upgrade -y
pkg install nodejs -y
git clone https://github.com/MegatronK9/Megatron-Runner.git
cd Megatron-Runner

# Install dependencies
npm install --production

# Link and awaken Megatron
node megatron-locked.js

# Scan QR code to link WhatsApp
# Keep alive with pm2 (optional)
npm install -g pm2
pm2 start megatron-locked.js --name megatron
pm2 save

# Update ritual
./update.sh
