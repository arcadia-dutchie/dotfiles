#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# General
alias cdd="cd $HOME/Development/GetDutchie"
alias arma="cdd && cd Armageddon"
alias dutch="cdd && cd Dutchie"
alias meco="cdd && cd MenuConnector"

# Git
function git-files-changed() {
  if [ "$1" != "" ]
  then
    commit="$1"
  else
    commit="HEAD"
  fi
  git diff-tree --no-commit-id --name-only $commit -r;
}

function branch() {
  git rev-parse --abbrev-ref HEAD
}

function gpl() {
  git push origin $(branch) --force-with-lease
}

function gpo() {
  git pull origin $(branch)
}

alias grd="git rebase develop"
alias gfc="git-files-changed"

# Tilt
alias cdtilt="cdd && cd tilt-up"

function bolt-tilt-up() {
  curdir=$(pwd);
  repos=("Dutchie" "Armageddon" "MenuConnector" "argocd-manifests" "manifester" "tilt-up");
  
  if [[ "$1" == "clean" ]]
  then
    echo "CLEAN TILT-UP"
    tilt="bolt tilt up --clean";
  else
    echo "TILT-UP"
    tilt="bolt tilt up";
  fi

  for repo in $repos; do
    cdd;
    cd "$repo";
    echo "\nUpdating $repo";

    gpo;
  done

  cdtilt;
  echo "\n";
  bolt up;
  eval "$tilt";
}

alias btu="bolt-tilt-up"
alias btuc="bolt-tilt-up clean"
alias btd="bolt tilt down"
alias bes="bolt ecomm setup"

# GPG config
export GPG_TTY=$(tty)

# Vim
export EDITOR=vim

# Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# Flutter
export PATH="$PATH:$HOME/Development/flutter/bin"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/arcadiarose/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(rbenv init - zsh)"
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin/:$PATH"
