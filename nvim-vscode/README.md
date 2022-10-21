# NeoVim
```bash

rm -rf $NVIMDIR
mkdir -p $NVIMDIR/lua
mkdir -p $NVIMDIR/vscode
mkdir -p $NVIMDIR/plug-config

ln -sf $DOTFILES/nvim/lua/* $NVIMDIR/lua
ln -sf $DOTFILES/nvim/vscode/* $NVIMDIR/vscode
ln -sf $DOTFILES/nvim/plug-config/* $NVIMDIR/plug-config
ln -sf $DOTFILES/nvim/init.vim $NVIMDIR/init.vim

```
