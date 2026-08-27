#!/bin/bash

BASE_DIR=$HOME/.dotfiles

# link for vim
ln -sf "$BASE_DIR/vimrcs/init.vim" "$HOME/.vimrc"
echo "ln -sf $BASE_DIR/vimrcs/init.vim $HOME/.vimrc"

# link for neovim（保留用户已有的 nvim 专属配置，仅覆盖 init.vim）
mkdir -p "$HOME/.config/nvim"
ln -sf "$BASE_DIR/vimrcs/init.vim" "$HOME/.config/nvim/init.vim"
echo "ln -sf $BASE_DIR/vimrcs/init.vim $HOME/.config/nvim/init.vim"

# 优先从本地 vendor 复制（离线安装），幂等：每次执行都会把 vendor 中的插件同步到 ~/.vim/plugged
if [ -d "$BASE_DIR/vendor/vim/vim-plug" ]; then
    echo "Copy vim-plugins from vendor/vim/ ..."
    # plug.vim 双端部署：vim 用 ~/.vim/autoload，nvim 用 site/autoload（nvim 的 rtp 不含 ~/.vim）
    mkdir -p "$HOME/.vim/autoload" "$HOME/.local/share/nvim/site/autoload"
    cp "$BASE_DIR/vendor/vim/vim-plug/plug.vim" "$HOME/.vim/autoload/plug.vim"
    cp "$BASE_DIR/vendor/vim/vim-plug/plug.vim" "$HOME/.local/share/nvim/site/autoload/plug.vim"
    # 复制所有插件到 plugged 目录
    rm -rf "$HOME/.vim/plugged"
    mkdir -p "$HOME/.vim/plugged"
    for dir in "$BASE_DIR"/vendor/vim/*/; do
        name=$(basename "$dir")
        if [ "$name" != "vim-plug" ]; then
            cp -r "$dir" "$HOME/.vim/plugged/$name"
        fi
    done
    echo "Plugins copied from vendor/vim/"
elif [ -f "$HOME/.vim/autoload/plug.vim" ] && [ -f "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
    # 无 vendor 时，双端都已在线安装过 vim-plug 则跳过
    echo "vim-plug already exists"
else
    # 无 vendor 且（任一端）未安装 vim-plug，走在线安装，双端各装一份
    echo "Start install plugin manager : junegunn/vim-plug"
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo ""
    echo "Please run :PlugInstall in vim to install plugins"
fi
