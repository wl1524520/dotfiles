#!/bin/bash

# Default settings
ZSH=${ZSH:-~/.oh-my-zsh}
REPO=${REPO:-robbyrussell/oh-my-zsh}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}

# clone oh-my-zsh to ~/.oh-my-zsh
#echo "git clone --depth=1 --branch" "$BRANCH" "$REMOTE" "$ZSH"
rm -rf ~/.oh-my-zsh
git clone --depth=1 --branch "$BRANCH" "$REMOTE" ~/.oh-my-zsh

