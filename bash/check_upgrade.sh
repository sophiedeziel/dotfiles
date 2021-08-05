#!/bin/sh

zmodload zsh/datetime

export DOTFILES_PATH=~/.dotfiles
export LAST_UPDATE_FILE="$DOTFILES_PATH/.last_update"

function _current_epoch() {
  echo $(( $EPOCHSECONDS / 60 / 60 / 24 ))
}

function _update_last_update() {
  echo "LAST_EPOCH=$(_current_epoch)" > $LAST_UPDATE_FILE
}

epoch_target=2

if [ -f  $LAST_UPDATE_FILE ]; then
  . $LAST_UPDATE_FILE
  if [[ -z "$LAST_EPOCH" ]]; then
    _update_last_update
  fi

  epoch_diff=$(($(_current_epoch) - $LAST_EPOCH))
  if [ $epoch_diff -gt $epoch_target ]; then
    cd $DOTFILES_PATH &> /dev/null
    if git fetch origin master --quiet && [ `git rev-list HEAD...origin/master --count` != 0 ]
    then
      echo "[Dotfiles] Would you like to update? [Y/n]: \c"
      read line
      if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
        git pull --rebase --stat origin master
        rake
      else
      fi
      _update_last_update
    fi
    cd - &> /dev/null
  fi
else
  _update_last_update
fi

