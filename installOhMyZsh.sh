#!/bin/bash

echo "This script will install OhMyZsh on Your system, please provide root priveleges"

echo "-----------------------------------------------------------------"
echo "First installing zsh:"
apt-get install -y zsh
echo "-----------------------------------------------------------------"
echo "Changing default login shell:"
chsh -s $(which zsh)
echo "-----------------------------------------------------------------"
echo "Installing Git:"
apt-get install -y git
echo "-----------------------------------------------------------------"
echo "Installing OhMyZsh:"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
echo "-----------------------------------------------------------------"
echo "Installing fonts:"
apt-get install -y fonts-powerline
echo "-----------------------------------------------------------------"
echo "Changing default theme to agnoster theme:"
sed -i '1,12 s/ZSH_THEME.*/ZSH_THEME=\"agnoster\"/' ~/.zshrc
echo "-----------------------------------------------------------------"
echo "Installing text highlighting plugin:"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "-----------------------------------------------------------------"
echo "Installing autosuggestion plugin:"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "-----------------------------------------------------------------"
sed -i 's/plugins=(.*)/plugins=(zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc
source ~/.zshrc
echo "Installation complete!"

