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
