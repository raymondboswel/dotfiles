set -g -x fish_greeting ''
set --universal nvm_default_version v14.17.5

set PATH $HOME/.rbenv/bin $PATH
set PATH $HOME/.rbenv/shims $PATH
rbenv rehash 

status --is-interactive; and rbenv init - fish | source
