# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="doubleend"

plugins=(lol git ruby dotenv bundler)

source $ZSH/oh-my-zsh.sh

#Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='vim'
# fi

export GPG_TTY=$(tty)

for f in ~/.bash/*; do source $f; done

# thefuck
if type "thefuck" > /dev/null 2>&1; then
  eval "$(thefuck --alias)"
fi

if [[ -f ~/.secrets ]]; then source ~/.secrets; fi
if [[ -f ~/.local-aliases ]]; then source ~/.local-aliases; fi

if type "brew" > /dev/null 2>&1; then
  asdf_sh="$(brew --prefix asdf)/asdf.sh"
  [[ -f "$asdf_sh" ]] && . "$asdf_sh"
fi

add-zsh-hook precmd source_env # to load on new tab too

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/openssl/bin:$PATH"
