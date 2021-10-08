set -g -x fish_greeting ''
set --universal nvm_default_version v14.18.0

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
set PATH $HOME/bin $PATH
rbenv rehash 

status --is-interactive; and rbenv init - fish | source

source ~/.asdf/asdf.fish
