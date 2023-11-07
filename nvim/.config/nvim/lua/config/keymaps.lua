-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local util = require("util")

util.cowboy()
-- exit insert mode with jk
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })
-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { noremap = true, desc = "Save window" })

-- Unmap mappings used by tmux plugin
-- TODO(vintharas): There's likely a better way to do this.
-- vim.keymap.del("n", "<C-h>")
-- vim.keymap.del("n", "<C-j>")
-- vim.keymap.del("n", "<C-k>")
-- vim.keymap.del("n", "<C-l>")
-- vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
-- vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
-- vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
-- vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
--
local nav = {
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right",
}

local function navigate(dir)
  return function()
    local win = vim.api.nvim_get_current_win()
    vim.cmd.wincmd(dir)
    local pane = vim.env.WEZTERM_PANE
    if pane and win == vim.api.nvim_get_current_win() then
      local pane_dir = nav[dir]
      vim.system({ "wezterm", "cli", "activate-pane-direction", pane_dir }, { text = true }, function(p)
        if p.code ~= 0 then
          vim.notify(
            "Failed to move to pane " .. pane_dir .. "\n" .. p.stderr,
            vim.log.levels.ERROR,
            { title = "Wezterm" }
          )
        end
      end)
    end
  end
end
-- Move to window using the movement keys
for key, dir in pairs(nav) do
  -- vim.keymap.set("n", "<" .. dir .. ">", navigate(key))
  vim.keymap.set("n", "<C-" .. key .. ">", navigate(key))
end
