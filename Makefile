all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make awesome       - Install dotfiles"
	@echo "   2. make ohmyzsh       - Install oh-my-zsh repository"
	@echo "   3. make link          - Install dotfiles link"
	@echo "   4. make vim           - Install dotfiles link For vim/neovim"
	@echo "   5. make update        - Update dotfiles"
	@echo ""

awesome:
	@echo "Start install oh-my-zsh"
	@./install-ohmyzsh.sh
	@echo "Finish install oh-my-zsh"
	@echo ""
	@echo "Start install dotfiles link"
	@./install-link.sh
	@echo ""
	@echo "Start install dotfiles for vim/neovim"
	@./install-vim.sh

update:
	@echo "Start update dotfiles"
	@git pull origin master
	@echo "Finish update dotfiles"
	@echo ""

ohmyzsh:
	@echo "Start install oh-my-zsh"
	@./install-ohmyzsh.sh
	@echo "Finish install oh-my-zsh"
	@echo ""

link:
	@echo "Start install dotfiles link"
	@./install-link.sh

vim:
	@echo "Start install dotfiles for vim/neovim"
	@./install-vim.sh

wps:
	@sudo cp -r conf.d/font.d/wps-symbol-fonts /usr/share/fonts
	@fc-cache --force --verbose

wsl:
	@cat bashrc.d/wsl/bashrc > ~/.bashrc
