# custom config

# setopt no_nomatch

# export VISUAL="vim"
# export TERM=xterm-color

# aliases
alias ll='ls -lF'
alias w='w -i'
alias dc=docker-compose
alias sail='bash vendor/bin/sail'

# vim or neovim , this is a question
if type nvim > /dev/null 2>&1; then
    alias vim='nvim'
    alias vi='nvim'
else
    alias vi='vim'
fi

# set PATH
export PATH=$PATH:$HOME/.bin:$HOME/bin:$HOME/.dotfiles/bin:$HOME/.composer/vendor/bin

# For macOS
#if [ $OSTYPE = "darwin"* ]; then
#    source ~/.dotfiles/bashrc.d/macos.sh
#fi

# For user
if [ -f ~/.profile_user  ]; then
    source ~/.profile_user
fi

