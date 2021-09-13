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
