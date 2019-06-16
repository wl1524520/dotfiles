all: help

help:
	@echo ""
	@echo "-- Help Menu for Ubuntu"
	@echo ""
	@echo "   1. make update        - Update submodule repository"
	@echo "   2. make link          - Install dotfiles link"
	@echo ""

update:
	@echo "Start to update submodule repository"
	@git submodule update --init --remote
	@echo "End to update submodule repository"
	@echo ""

link:
	@echo "Start set for normal user"
	@./install

wps:
	@sudo cp -r font.d/wps-symbol-fonts /usr/share/fonts
	@fc-cache --force --verbose

