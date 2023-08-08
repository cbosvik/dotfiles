-- bootstrap lazy.nvim, LazyVim and your plugins

if vim.fn.exists("g:vscode") == 1 then
  require("vscode.config")
  do
    return
  end
end
require("config.lazy")
