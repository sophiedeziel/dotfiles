#!/usr/bin/bash

if [ -f ~/.oh-my-zsh ]; then 
  echo "Installing Oh-My-Zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if ! type "fuck" > /dev/null; then
  echo "Installing The Fuck"
  if type "apt" > /dev/null; then
    sudo apt update
    sudo apt install python3-dev python3-pip python3-setuptools
    sudo pip3 install thefuck
  fi

  if type "brew" > /dev/null; then
    brew install thefuck
  fi
fi

echo "Create symlinks"
yes | rake

source ~/.zshrc

# Spin related auto-install

if [[ "$SPIN" = 1 ]]
then
  # Only run nested steps in Spin + shopify/shopify workspaces.
  if [[ "$SPIN_REPO_SOURCE_PATH" = "/src/github.com/shopify/shopify" ]]
  then
    cd "$SPIN_REPO_SOURCE_PATH"

    . /cartridges/default/setup.sh
  fi
fi