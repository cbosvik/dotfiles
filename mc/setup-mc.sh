#!/bin/bash
mkdir -p $HOME/.dracula-theme
cd $HOME/.dracula-theme
git clone https://github.com/dracula/midnight-commander.git
mkdir -p $XDG_DATA_HOME/mc/skins
cd $XDG_DATA_HOME/mc/skins
ln -sf $HOME/.dracula-theme/midnight-commander/skins/dracula.ini
ln -sf $HOME/.dracula-theme/midnight-commander/skins/dracula256.ini
cd $HOME
rm $XDG_CONFIG_HOME/mc/panels.ini
rm $XDG_CONFIG_HOME/mc/ini
ln -sf $DOTFILES/mc/panels.ini $XDG_CONFIG_HOME/mc/panels.ini
ln -sf $DOTFILES/mc/ini $XDG_CONFIG_HOME/mc/ini

