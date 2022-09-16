#!/bin/bash

if [ `uname` = 'Linux' ]; then
    export DIST=`lsb_release -i | awk -F : '{print $2}' | sed -e 's/^[\t]*//g' | sed -e 's/[ ]*$//g'`
    echo $DIST
fi

BASE_DIR=$HOME/.dotfiles

# Python
if [ ! -d $HOME/.pip ]; then
    mkdir -p $HOME/.pip
fi
ln -sf $BASE_DIR/conf.d/python/pip.conf $HOME/.pip/pip.conf
ln -sf $BASE_DIR/conf.d/python/pydistutils.cfg $HOME/.pydistutils.cfg

#########################################
# Linux Only Section
#########################################

#########################################
# Darwin(macOS) Only Section
#########################################

