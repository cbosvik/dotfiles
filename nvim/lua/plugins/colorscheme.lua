return {
  { "dracula/vim", name = "dracula" },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = { colorscheme = "dracula" },
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "storm",
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
      },
    },
  },
}
