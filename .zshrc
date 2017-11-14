# Path to your oh-my-zsh installation.
export ZSH=/Users/sdeziel/.oh-my-zsh

ZSH_THEME="doubleend"

plugins=(git ruby)

source $ZSH/oh-my-zsh.sh

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

current_branch_name () {
  current_branch
}

current_branch_number () {
  current_branch_name | sed 's/[^0-9]*_.*//'
}

# thefuck
eval "$(thefuck --alias)"

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

source ~/.secrets
source ~/.path-stuff
source ~/.aliases
