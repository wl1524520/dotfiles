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

# 安装 vim-plug 插件管理器
if [ -f $HOME/.vim/autoload/plug.vim ]; then
    echo "vim-plug already exists"
    exit 0
fi

# 优先从本地 vendor 复制（离线安装）
if [ -d $BASE_DIR/vendor/vim/vim-plug ]; then
    echo "Copy vim-plugins from vendor/vim/ ..."
    mkdir -p $HOME/.vim/autoload
    cp $BASE_DIR/vendor/vim/vim-plug/plug.vim $HOME/.vim/autoload/plug.vim
    # 复制所有插件到 plugged 目录
    rm -rf $HOME/.vim/plugged
    mkdir -p $HOME/.vim/plugged
    for dir in $BASE_DIR/vendor/vim/*/; do
        name=$(basename "$dir")
        if [ "$name" != "vim-plug" ]; then
            cp -r "$dir" "$HOME/.vim/plugged/$name"
        fi
    done
    echo "Plugins copied from vendor/vim/"
else
    echo "Start install plugin manager : junegunn/vim-plug"
    curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo ""
    echo "Please run :PlugInstall in vim to install plugins"
fi
