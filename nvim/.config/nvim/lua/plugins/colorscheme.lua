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
      on_highlights = function(highlights, colors)
        highlights.LineNr = { fg = "#9ece6a" }
        highlights.CursorLineNr = { fg = "#bb9af7" }
      end,
    },
  },
}
