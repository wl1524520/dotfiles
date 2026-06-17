#!/bin/bash
# 将 vim-plug 插件预下载到 vendor/vim/ 目录，方便离线安装
set -e

VENDOR_DIR=$(cd "$(dirname "$0")" && pwd)/vim
rm -rf "$VENDOR_DIR"
mkdir -p "$VENDOR_DIR"

echo "==> 下载 vim-plugins 到 vendor/vim/ ..."

# 插件列表（与 vimrcs/init.vim 中的 Plug 保持一致）
PLUGINS=(
    "junegunn/vim-plug"
    "jiangmiao/auto-pairs"
    "chr4/nginx.vim"
    "itchyny/lightline.vim"
    "morhetz/gruvbox"
)

for plugin in "${PLUGINS[@]}"; do
    name="${plugin#*/}"
    echo "  -> $plugin"
    git clone --depth=1 --quiet "https://github.com/$plugin.git" "$VENDOR_DIR/$name"
    rm -rf "$VENDOR_DIR/$name/.git"
done

echo "==> 完成"
