setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.# If you come from bash you might have to change your $PATH.

alias kctx="kubectx"
alias kns="kubens"
alias k="kubectl"
alias kga="kubectl get all"
alias kgans="kubectl get all --all-namespaces"
alias ssh='TERM=xterm-256color ssh'
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias ls='lsd -ah'
alias els='exa --long --git --icons --color=always --group-directories-first'
alias cat="bat"
alias gP="git push"
alias gp="git pull"
alias ga="git add"
alias gc="git commit -m"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export KUBECONFIG=$HOME/.kube/config
export KUBECONFIG=$KUBECONFIG:$HOME/code/skf/k8s-cluster-configuration/kubeconfigs/k3s-admins.yaml
export KUBECONFIG=$KUBECONFIG:$HOME/code/skf/k8s-cluster-configuration/kubeconfigs/my-user.yaml
# export KUBECONFIG=$KUBECONFIG:$HOME/code/skf/k8s-cluster-configuration/kubeconfigs/k3s.yaml

# export KUBECONFIG=$HOME/.kube/config:$HOME/code/skf/k8s-cluster-configuration/kubeconfigs/k3s-admins.yaml:$HOME/code/skf/k8s-cluster-configuration/kubeconfigs/my-user.yaml kubectl config view --flatten > config.tmp && mv config.tmp ~/.kube/config
# export KUBECONFIG=$HOME/.kube/config

export STARSHIP_CONFIG=~/.config/starship/starship.toml
export ZELLIJ_AUTO_ATTACH=true
export TERM=xterm-256color
# eval $(thefuck --alias)

source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# starship
eval "$(starship init zsh)"

# atuin
eval "$(atuin init zsh)"

# KinD
export KIND_EXPERIMENTAL_PROVIDER=podman

# Zoxide
eval "$(zoxide init zsh)"

source /Users/cb/.config/broot/launcher/bash/br
