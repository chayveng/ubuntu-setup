# Install zsh
sudo apt install zsh -y &&\
zsh --version &&\
chsh -s $(which zsh) &&\

# Install oh my zsh plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## zsh-autosuggestions (command suggestion as you type)
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&\
## zsh-syntax-highlighting (color syntax for commands)
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
## Setup zsh plugins
sed -i 's/^plugins=.*/plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
source ~/.zshrc
