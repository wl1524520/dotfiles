#!/bin/bash

if [ `uname` = 'Linux' ]; then
    export DIST=`lsb_release -i | awk -F : '{print $2}' | sed -e 's/^[\t]*//g' | sed -e 's/[ ]*$//g'`
    echo $DIST
fi

BASE_DIR=$HOME/.dotfiles

rm -f $HOME/.bin
ln -sf $BASE_DIR/bin $HOME/.bin

# zsh
ln -sf $BASE_DIR/zshrc $HOME/.zshrc

# Python
if [ ! -d $HOME/.pip ]; then
    mkdir -p $HOME/.pip
fi
ln -sf $BASE_DIR/conf.d/python/pip.conf $HOME/.pip/pip.conf
ln -sf $BASE_DIR/conf.d/python/pydistutils.cfg $HOME/.pydistutils.cfg

# git config
ln -sf $BASE_DIR/conf.d/gitconfig $HOME/.gitconfig

# youtube downloader
if [ ! -d $HOME/.config/youtube-dl ]; then
    mkdir -p $HOME/.config/youtube-dl
fi
ln -sf $BASE_DIR/conf.d/youtube-dl.config $HOME/.config/youtube-dl/config

#########################################
# Linux Only Section
#########################################

# Fcitx Input method on Linux
if [ `uname` = 'Linux' ]; then
    ln -sf $BASE_DIR/xprofile $HOME/.xprofile
fi

#########################################
# Darwin(macOS) Only Section
#########################################
if [ `uname` = 'Darwin' ]; then
    if [ ! -d $HOME/.config/mpv ]; then
        mkdir -p $HOME/.config/mpv
    fi
    ln -sf $BASE_DIR/mpv/mac.mpv.conf $HOME/.config/mpv/mpv.conf
fi

