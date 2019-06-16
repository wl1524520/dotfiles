#!/bin/bash

BASE_DIR=$HOME/.dotfiles

# link for vim
ln -sf $BASE_DIR/vimrcs/init.vim $HOME/.vimrc
echo "ln -sf $BASE_DIR/vimrcs/init.vim $HOME/.vimrc"

# link for neovim
rm -rf $HOME/.config/nvim
mkdir -p $HOME/.config/nvim
ln -sf $BASE_DIR/vimrcs/init.vim $HOME/.config/nvim/init.vim
echo "ln -sf $BASE_DIR/vimrcs/init.vim $HOME/.config/nvim/init.vim"

if [ ! -d $HOME"/.vim"  ]; then
    mkdir $HOME/.vim
fi

if [ ! -d $HOME"/.vim/bundle/Vundle.vim" ]; then
	echo "Start install plugin manager : VundleVim/Vundle.vim"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Plugin already exists"
fi
