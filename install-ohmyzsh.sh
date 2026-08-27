#!/bin/bash

# Default settings
BRANCH=${BRANCH:-master}

# backup origin config
if [ ! -f ~/.zshrc.origin  ]; then
    cp ~/.zshrc ~/.zshrc.origin
fi

# clone oh-my-zsh to ~/.oh-my-zsh
rm -rf ~/.oh-my-zsh
git clone --depth=1 --branch "$BRANCH" https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# link .zshrc
ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc
