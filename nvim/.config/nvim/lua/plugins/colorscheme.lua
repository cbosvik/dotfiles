return {
  { "dracula/vim", name = "dracula" },
  { "EdenEast/nightfox.nvim" },
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
      -- transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        -- sidebars = "transparent",
        -- floats = "transparent"
      },
    },
  },
}
