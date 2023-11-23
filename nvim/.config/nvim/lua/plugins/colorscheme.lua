return {
  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
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
