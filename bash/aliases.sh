alias clean_up_branches='git branch | grep -v "master" | xargs git branch -D'
alias express='cd ~/dev/express'

alias beg="bundle exec guard"
alias rdm="git diff master --name-only --diff-filter=ACMR | grep '.rb' | ag -v 'schema' | xargs rubocop"
alias ag='ag --path-to-ignore ~/.agignore'

alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
