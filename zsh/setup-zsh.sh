#!/bin/bash
export DOTFILES="$HOME/.dotfiles"
# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
mkdir -p $XDG_CACHE_HOME
mkdir -p $XDG_CONFIG_HOME
mkdir-p $XDG_DATA_HOME

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
ln -sf $DOTFILES/zsh/zshenv $HOME/.zshenv
mkdir -p $ZDOTDIR
ln -sf $DOTFILES/zsh/zprofile $ZDOTDIR/.zprofile
ln -sf $DOTFILES/zsh/zshrc $ZDOTDIR/.zshrc
ln -sf $DOTFILES/zsh/p10k.zsh $ZDOTDIR/.p10k.zsh
mkdir -p $ZDOTDIR/themes
mkdir -p $ZDOTDIR/plugins
cd $ZDOTDIR/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
cd $ZDOTDIR/themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git 
