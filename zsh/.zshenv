# dotfiles
export DOTFILES="$HOME/.dotfiles"
# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

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

export DOOMDIR=$HOME/.config/doom

# Zellij
# Optional layouts dir
#export ZELLIJ_RUNNER_LAYOUTS_DIR="/Users/cb/.config/zellij/layouts"
#  To show a banner, provide a path to the directory with ASCII art.
export ZELLIJ_RUNNER_BANNERS_DIR="/Users/cb/.config/zellij/banners"
# directory with the projects, relative to the HOME dir
export ZELLIJ_RUNNER_ROOT_DIR=code
# switcher already respects gitignore, but it's still useful in case there's no git
export ZELLIJ_RUNNER_IGNORE_DIRS=node_modules,target,bin,obj
# traverse dirs 3 level max from ZELLIJ_RUNNER_ROOT_DIR
export ZELLIJ_RUNNER_MAX_DIRS_DEPTH=3
