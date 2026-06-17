all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make ohmybash      - Install oh-my-bash repository"
	@echo "   2. make ohmyzsh       - Install oh-my-zsh repository"
	@echo "   3. make vim           - Install dotfiles link For vim/neovim"
	@echo "   4. make vim-plugins   - Download vim plugins to vendor/vim/"
	@echo ""

ohmybash:
	@echo "Start install oh-my-bash"
	@./install-ohmybash.sh
	@echo "Finish install oh-my-bash"
	@echo ""

ohmyzsh:
	@echo "Start install oh-my-zsh"
	@./install-ohmyzsh.sh
	@echo "Finish install oh-my-zsh"
	@echo ""

vim:
	@echo "Start install dotfiles for vim/neovim"
	@./install-vim.sh

vim-plugins:
	@echo "Start download vim plugins"
	@bash vendor/download-vim-plugins.sh

