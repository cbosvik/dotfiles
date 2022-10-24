#!/usr/bin/sh

CVIM=~/.config/cvim
export CVIM

alias nvb='XDG_DATA_HOME=$CVIM/share XDG_CACHE_HOME=$CVIM XDG_CONFIG_HOME=$CVIM nvim'

cvim
