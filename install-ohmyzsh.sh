#!/bin/bash

# Default settings
ZSH=${ZSH:-~/.oh-my-zsh}
REPO=${REPO:-robbyrussell/oh-my-zsh}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}

# backup origin config
if [ ! -f ~/.zshrc.origin  ]; then
    cp ~/.zshrc ~/.zshrc.origin
fi

# clone oh-my-zsh to ~/.oh-my-zsh
#echo "git clone --depth=1 --branch" "$BRANCH" "$REMOTE" "$ZSH"
rm -rf ~/.oh-my-zsh
git clone --depth=1 --branch "$BRANCH" "$REMOTE" ~/.oh-my-zsh

# link .zshrc
ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc
