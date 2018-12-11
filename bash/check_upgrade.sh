cd ~/.dotfiles
if git fetch origin master --quiet && [ `git rev-list HEAD...origin/master --count` != 0 ]
then
  echo "[Dotfiles] Would you like to update? [Y/n]: \c"
  read line
  if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
    git pull --rebase --stat origin master
  else
  fi
fi

cd -

