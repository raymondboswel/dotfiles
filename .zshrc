# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR="lvim"

export PATH="$PATH":"$HOME/.pub-cache/bin"

source /etc/profile.d/vte.sh

. /opt/asdf-vm/asdf.sh

gadd() {
  git add .
}

co() {
   git checkout $1 && git pull
}

br() {
  git checkout -b $1
}

cm() {
  git commit -m $1
}

acm() {
  git add .
  git commit -m $1
}

acmp() {
  git add .
  git commit -m $1
  git push
}

push() {
  git push
}

push-up() {
  BRANCH=$(git symbolic-ref --short HEAD)
  git push --set-upstream origin $BRANCH
}

work() {
  sudo ~/git/get-shit-done/get-shit-done work
}

play() {
  sudo ~/git/get-shit-done/get-shit-done play
}


pull() {
  git pull
}
