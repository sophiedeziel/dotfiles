# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="doubleend"

plugins=(gitfast dotenv)

source $ZSH/oh-my-zsh.sh

export GPG_TTY=$(tty)

for f in ~/.bash/*; do source $f; done

if [[ -f ~/.secrets ]]; then source ~/.secrets; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

if [[ -f /opt/dev/dev.sh ]]; then source /opt/dev/dev.sh; fi

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/sophiedeziel/.kube/config:/Users/sophiedeziel/.kube/config.shopify.cloudplatform
fpath=(~/.zsh/functions $fpath)
autoload -Uz ~/.zsh/functions/[^_]*(@:t)

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }

# Added by tec agent
[[ -x /Users/sophiedeziel/.local/state/tec/profiles/base/current/global/init ]] && eval "$(/Users/sophiedeziel/.local/state/tec/profiles/base/current/global/init zsh)"
