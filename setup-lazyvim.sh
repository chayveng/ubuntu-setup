#!/bin/bash

set -e

echo "📦 Updating system and installing dependencies..."
sudo apt update
sudo apt install -y curl git wget unzip ripgrep fd-find nodejs npm

echo "🧹 Cleaning old Neovim config (if any)..."
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.cache/nvim

echo "⬇️ Downloading Neovim 0.10+ AppImage..."
cd ~/Downloads
wget -q https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O nvim
chmod u+x nvim
sudo mv nvim /usr/local/bin/nvim

echo "🧪 Checking Neovim version..."
nvim --version | head -n 1

echo "📁 Cloning LazyVim starter config..."
git clone https://github.com/LazyVim/starter ~/.config/nvim
cd ~/.config/nvim
rm -rf .git

echo "🚀 Starting Neovim to install plugins (may take a moment)..."
nvim +Lazy sync +qa

echo "✅ Installation complete! Run 'nvim' to start LazyVim."
