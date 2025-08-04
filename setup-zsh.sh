#!/bin/bash

# ออก script ถ้าเจอ error
set -e

echo "🔧 Installing zsh..."
sudo apt update
sudo apt install zsh -y

echo "📦 Zsh version: $(zsh --version)"

echo "🔄 Changing default shell to zsh..."
chsh -s "$(which zsh)"

echo "🎉 Installing Oh My Zsh..."
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "🔌 Installing zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"

echo "🔌 Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

echo "⚙️ Updating plugins in .zshrc..."
sed -i 's/^plugins=.*/plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

echo "✅ Done. Please restart your terminal or run: exec zsh"
