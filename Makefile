all: help

help:
	@echo ""
	@echo "-- Help Menu for Arch/Manjaro"
	@echo ""
	@echo "   1. make update        - Update submodule repository"
	@echo "   2. make link          - Install dotfiles link"
	@echo "   3. make fonts         - Install Fonts"
	@echo "   4. make fcitx         - Install fcitx"
	@echo "   5. make env           - Install requirements"
	@echo ""

update:
	@echo "Start to update submodule repository"
	@git submodule update --init --remote
	@echo "End to update submodule repository"
	@echo "Start to Update install script"
	@rm -rf install && cp dotbot/tools/git-submodule/install .
	@echo "End to Update install script"
	@echo ""

link:
	@echo "Start set for normal user"
	@./install

fonts:
	-sudo pacman -S ttf-roboto noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra awesome-terminal-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts ttf-dejavu
	-sudo pacman -S nerd-fonts-complete
	-sudo pacman -S nerd-fonts-terminus powerline-fonts
	@fc-cache --force --verbose

fcitx:
	@sudo pacman -S fcitx fcitx-configtool fcitx-gtk3 fcitx-qt4 fcitx-qt5 fcitx-googlepinyin fcitx-table-extra

arch-xorg:
	@sudo pacman -S xorg-server xorg-server-utils xorg-xrandr xorg-xset

env:
	@sudo pacman -S screenfetch pkg-config go clang llvm llvm-libs cmake npm nodejs fakeroot
