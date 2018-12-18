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
	-sudo apt install fonts-roboto fonts-noto fonts-noto-mono fonts-noto-cjk fonts-noto-color-emoji fonts-font-awesome fonts-powerline
	@fc-cache --force --verbose

fcitx:
	@sudo pacman -S fcitx fcitx-configtool fcitx-gtk3 fcitx-qt4 fcitx-qt5 fcitx-googlepinyin fcitx-table-extra

env:
	@sudo pacman -S screenfetch pkg-config go clang llvm llvm-libs cmake npm nodejs fakeroot
