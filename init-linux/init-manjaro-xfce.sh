#!/bin/bash

# init Arch/Manjaro Linux

# Install Fonts
sudo pacman -S ttf-roboto noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra awesome-terminal-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts ttf-dejavu
fc-cache --force --verbose

# Install Fcitx Input method
sudo pacman -S fcitx fcitx-configtool fcitx-gtk3 fcitx-qt4 fcitx-qt5 fcitx-googlepinyin fcitx-table-extra

# Install env
sudo pacman -S screenfetch go clang llvm llvm-libs cmake npm nodejs fakeroot

# Remove unused packages
sudo pacman -Rs xfburn hexchat pidgin thunderbird libreoffice-still steam-manjaro ms-office-online
