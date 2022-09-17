#!/bin/bash

# Default settings
OSH=$HOME/.oh-my-bash

# backup origin config
if [ ! -f ~/.bashrc.origin  ]; then
    cp ~/.bashrc ~/.bashrc.origin
fi

# clone oh-my-bash to ~/.oh-my-bash
rm -rf $OSH
git clone --depth=1 https://github.com/ohmybash/oh-my-bash.git "$OSH"

# link .bashrc
ln -sf $HOME/.dotfiles/bashrc $HOME/.bashrc
