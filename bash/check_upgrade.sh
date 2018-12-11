zmodload zsh/datetime

function _current_epoch() {
  echo $(( $EPOCHSECONDS / 60 / 60 / 24 ))
}

function _update_zsh_update() {
  echo "LAST_EPOCH=$(_current_epoch)" >! .last_update
}
if [ -f .zsh-last_update ]; then
  . .last_update
  if [[ -z "$LAST_EPOCH" ]]; then
    _update_zsh_update
  fi

  epoch_diff=$(($(_current_epoch) - $LAST_EPOCH))
  if [ $epoch_diff -gt $epoch_target ]; then
    if git fetch origin master --quiet && [ `git rev-list HEAD...origin/master --count` != 0 ]
    then
      echo "[Dotfiles] Would you like to update? [Y/n]: \c"
      read line
      if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
        git pull --rebase --stat origin master
        _update_zsh_update
      else
      fi
    fi

  fi
fi
cd - &> /dev/null

