# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="doubleend"

plugins=(git ruby dotenv bundler)

source $ZSH/oh-my-zsh.sh

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim -f'
fi

current_branch_name () {
  current_branch
}

current_branch_number () {
  current_branch_name | sed 's/[^0-9]*_.*//'
}

# thefuck
eval "$(thefuck --alias)"
alias sti='thefuck'

aheadof() {
  default_remote='production'

  remote=${1-$default_remote}
  branch="$(current_branch_name)"

  fetch="$(git fetch $remote)"

  ahead="$(git rev-list $remote/$branch..$branch --count)"

  echo "$ahead commits ahead of $remote/$branch"

  git log -n $ahead
}

export GPG_TTY=$(tty)

source ~/.bash/path-stuff.sh

source ~/.secrets

source ~/.bash/aliases.sh

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

add-zsh-hook precmd source_env # to load on new tab too

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/openssl/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
