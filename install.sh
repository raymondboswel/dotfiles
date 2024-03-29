#!/bin/bash

# Install keybase

curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt install ./keybase_amd64.deb
run_keybase

# Install rust

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo apt install libssl-dev pkg-config

cargo install cargo-edit

# TODO: Install fish shell

# Create symlinks for config files

ln -s ./.config/fish/config.fish ~/.config/fish/config.fish

# Install gnome-tweaks, then open tweaks and set emacs input -> true
sudo apt install gnome-tweaks

# If using varmilo keyboard follow first suggestion here: https://unix.stackexchange.com/questions/604791/keyboard-function-keys-always-trigger-media-shortcuts-regardless-of-whether-fn and here https://wiki.archlinux.org/title/Apple_Keyboard#Function_keys_do_not_work

# Ruby install
sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# Elixir install
## install asdf first
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
mkdir -p ~/.config/fish/completions; and ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
asdf plugin add erlang
asdf plugin add elixir
## Navigate into project directory and run 'asdf install'

#Docker install
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt install docker-ce

sudo usermod -aG docker $USER

#Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

#Node/npm/yarn/nvm
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/nvm.fish

#Emacs

## Angular LSP
npm install -g @angular/language-service@next typescript @angular/language-server

# Update paths in angular.el in prelude config accordingly

#Neovim
mkdir ~/bin
cd ~/bin
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

sudo update-alternatives --install /usr/bin/vi vi ~/bin/nvim.appimage 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim ~/bin/nvim.appimage 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor ~/bin/nvim.appimage 60
sudo update-alternatives --config editor


# Github CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Manjaro Linux tmpfs inodes issue
mount -o remount,nr_inodes=0 /tmp
