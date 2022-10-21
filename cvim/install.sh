#!/usr/bin/sh

CVIM=~/.config/cvim
export CVIM

rm -rf $CVIM

mkdir -p $CVIM/share
mkdir -p $CVIM/nvim

stow --restow --target=$CVIM/nvim .

alias cvim='XDG_DATA_HOME=$CVIM/share XDG_CONFIG_HOME=$CVIM nvim' 

export cvim
