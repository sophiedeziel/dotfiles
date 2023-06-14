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
eval "$(thefuck --alias)"

if [[ -f ~/.secrets ]]; then source ~/.secrets; fi

if type "brew" > /dev/null; then
  . $(brew --prefix asdf)/asdf.sh
fi

add-zsh-hook precmd source_env # to load on new tab too

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/openssl/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix install

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

function spindb() {
    open "mysql://root@$(spin info fqdn):3306"
}

function spingraphiql() {
  open "https://app.$(spin info fqdn)/services/internal/shops/1/graphql"
}
