# alacritty

```
brew install --cask alacritty
mkdir -p $XDG_CONFIG_HOME/alacritty
ln -sf $DOTFILES/alacritty/alacritty.yml $XDG_CONFIG_HOME/alacritty/alacritty.yml

ln -sf $DOTFILES/alacritty/dracula.yml $XDG_CONFIG_HOME/alacritty/dracula.yml
defaults write org.alacritty AppleFontSmoothing -int 0
xattr -rd com.apple.quarantine /Applications/Alacritty.app
```