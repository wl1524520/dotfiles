#!/bin/bash

if [ `uname` = 'Linux' ]; then
    export DIST=`lsb_release -i | awk -F : '{print $2}' | sed -e 's/^[\t]*//g' | sed -e 's/[ ]*$//g'`
    echo $DIST
fi

BASE_DIR=$HOME/.dotfiles

rm -f $HOME/.bin
ln -sf $BASE_DIR/bin $HOME/.bin

# Python
if [ ! -d $HOME/.pip ]; then
    mkdir -p $HOME/.pip
fi
ln -sf $BASE_DIR/conf.d/python/pip.conf $HOME/.pip/pip.conf
ln -sf $BASE_DIR/conf.d/python/pydistutils.cfg $HOME/.pydistutils.cfg

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

