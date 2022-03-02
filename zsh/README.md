# Usage

## Make a backup of your existing files
```bash
mkdir -p ~/.backups/zsh
mv ~/.zshrc ~/.backups/zsh/zshrc.old
mv ~/.zprofile ~/.backups/zsh/zprofile.old
```

## Clone this repo
Clone this repo to ~/.config/zsh
```bash
mkdir -p ~/.config
cd ~/.config
git clone git@github.com:bosvik/zshrc.git zsh
mkdir -p ~/.config/zsh/themes
mkdir -p ~/.config/zsh/plugins
```
### powerlevel10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/zsh/themes/powerlevel10
```
### zsh-autosuggestions
```bash
mdir ~/zsh/plugins
cd ~/zsh/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions
```
### zsh-syntax-highlighting
```bash
cd ~/zsh/plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```
### Symlink needed files
```bash
ln -s ~/.config/zsh/p10k.zsh ~/.p10k.zsh
ln -s ~/.config/zsh/zshrc ~/.zshrc
ln -s ~/.config/zsh/zprofile ~/.zprofile
```