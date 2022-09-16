all: help

help:
	@echo ""
	@echo "-- Help Menu"
	@echo ""
	@echo "   1. make ohmybash      - Install oh-my-bash repository"
	@echo "   2. make ohmyzsh       - Install oh-my-zsh repository"
	@echo "   3. make vim           - Install dotfiles link For vim/neovim"
	@echo "   4. make python        - Set Python Source"
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

python:
	@echo "Start Set Python Source"
	@./set-python.sh

