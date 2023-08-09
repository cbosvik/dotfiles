# dotfiles
export DOTFILES="$HOME/.dotfiles"
# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# editor
export EDITOR="hx"
export VISUAL="hx"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# nvim
export NVIMDIR="$XDG_CONFIG_HOME/nvim"

# code
export CODEDIR=$HOME/code
export SKF=$CODEDIR/skf

#Go
export GOPATH=$HOME/go
#export GOROOT="$(brew --prefix golang)/libexec"

#export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
#. "$HOME/.cargo/env"
