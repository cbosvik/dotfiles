#!/bin/bash
rm -rf $XDG_CONFIG_HOME/mc
rm -rf $HOME/.dracula-theme
mkdir -p $HOME/.dracula-theme
cd $HOME/.dracula-theme
git clone https://github.com/dracula/midnight-commander.git
mkdir -p $XDG_DATA_HOME/mc/skins
mkdir -p $XDG_CONFIG_HOME/mc
cd $XDG_DATA_HOME/mc/skins
ln -sf $HOME/.dracula-theme/midnight-commander/skins/dracula.ini
ln -sf $HOME/.dracula-theme/midnight-commander/skins/dracula256.ini
cd $HOME
cp $DOTFILES/mc/panels.ini  $XDG_CONFIG_HOME/mc/
cp $DOTFILES/mc/ini $XDG_CONFIG_HOME/mc/
