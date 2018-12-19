#!/bin/bash

# 删除不用的程序
sudo apt remove libreoffice-* dmraid pidgin* thunderbird* hexchat* tomboy transmission* brasero* gnome-orca
sudo apt autoremove
sudo apt update

# 安装必要的程序
sudo apt install zsh openssh-server make git screenfetch vim vim-youcompleteme mpv youtube-dl aria2 hollywood
sudo apt install python-pip python3-pip

# 启用 ssh 服务
sudo systemctl enable ssh

# 安装字体
sudo apt install fonts-roboto fonts-noto fonts-noto-mono fonts-noto-cjk fonts-noto-color-emoji fonts-font-awesome fonts-powerline
fc-cache --force --verbose
