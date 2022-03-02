#!/bin/bash
rm -rf $NVIMDIR
mkdir -p $NVIMDIR/lua
mkdir -p $NVIMDIR/vscode
mkdir -p $NVIMDIR/plug-config

ln -sfr $DOTFILES/nvim/lua/* $NVIMDIR/lua
ln -sfr $DOTFILES/nvim/vscode/* $NVIMDIR/vscode
ln -sfr $DOTFILES/nvim/plug-config/* $NVIMDIR/plug-config
ln -sf $DOTFILES/nvim/init.vim $NVIMDIR/init.vim

