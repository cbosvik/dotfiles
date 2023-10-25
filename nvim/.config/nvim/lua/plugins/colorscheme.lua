return {
  { "dracula/vim", name = "dracula", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  -- {
  --   "LazyVim/LazyVim",
  --   opts = { colorscheme = "dracula" },
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
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
