# dotfiles

Clone the repo to ~/.dotfiles

## useful utilities

```bash
brew install \
# go
  go \
# neovim version manager
  bob \
# better cat
  bat \
# command line json viewer
  jless \
# color in the terminal
  pastel \
# cat for markdown
  mdcat \
# magic shell history
  atuin \
# post-modern editor
  helix \
# better grep
  ripgrep \
# work with jsonnet
  jsonnet \
# json query
  jq \
# git diff
  git-delta  \
# better ls 
  eza \
# substitute for htop
  bottom \
# shortened man pages
  tealdeer \
# a better shell
  nushell \ 
# obviously
  nvim \
# a modern multiplexer
  zellij \
# quickly jump around between directories
  zoxide \
# symlink helper
  stow \
# starship propmt
  starship \
# terminal multiplexer
  tmux \
# azure cli
  azure-cli \
# fuzzy find
  fzf \
# git tui
  lazygit \
# quick switch between k8s contexts
  kubectx \
# k8s secrets
  kubeseal \
# helmcharts
  helm \
# for authenticating to k8s clusters
  kubelogin \
# curl replacement
  xh \
# k8s tui
  k9s \
# midnight commander file manager
  mc \
# markdown lsp
  marksman \
# needed for several languages
  llvm \
# docker
  docker \
# docker compose
  docker-compose \
# docker build engine
  docker-buildx \
# docker support for mac
  colima \
# present slides in terminal
  slides \
# node version manager
  nvm \
# rest client
  bruno \
# docker tui
  lazydocker
```

## bob

```bash
brew install bob
bob use nightly|stable|latest
```

## nvm

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
```

```bash
brew install --cask wezterm
brew install --cask phoenix
brew install --cask podman-desktop
brew install --cask maccy
```

## Docker

```bash
colima start --arch aarch64 --vm-type=vz --vz-rosetta
```
