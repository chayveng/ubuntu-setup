#!/bin/bash

sudo apt install -y libfuse2
wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim.appimage

mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
