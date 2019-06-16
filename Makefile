all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make update        - Update submodule repository"
	@echo "   2. make link          - Install dotfiles link"
	@echo "   3. make vim           - Install dotfiles link For vim/neovim"
	@echo ""

update:
	@echo "Start to update submodule repository"
	@git submodule update --init --remote
	@echo "End to update submodule repository"
	@echo ""

link:
	@echo "Start install dotfiles link"
	@./install.sh

vim:
	@echo "Start install dotfiles for vim/neovim"
	@./install-vim.sh

wps:
	@sudo cp -r font.d/wps-symbol-fonts /usr/share/fonts
	@fc-cache --force --verbose

