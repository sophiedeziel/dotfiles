alias clean_up_branches='git branch | grep -v "master" | xargs git branch -D'
alias express='cd ~/dev/express'

alias git=hub
alias beg="bundle exec guard"
alias rdm="git diff master --name-only --diff-filter=ACMR | grep '.rb' | ag -v 'schema' | xargs rubocop"
alias ag='ag --path-to-ignore ~/.agignore'

alias gpr="hub pull-request -i `current_branch_number`"

alias zshconfig="mvim ~/.zshrc"
alias zshreload="source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

pair_with_rachel() {
  git commit -m "$1

Co-authored-by: Rachel Carvalho <rachel.carvalho@gmail.com>"
}

pair_with_eric() {
  git commit -m "$1

Co-authored-by: Eric Marchese <ericmarchese77@gmail.com>"
}
