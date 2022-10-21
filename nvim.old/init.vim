lua require("environment.vim")
if(exists('g:vscode'))
  source ~/.config/nvim/plug-config/easymotion.vim
  source ~/.config/nvim/plug-config/highlightyank.vim
  source ~/.config/nvim/vscode/settings.vim
end
