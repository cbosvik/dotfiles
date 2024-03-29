return {
  -- { "rmehri01/onenord.nvim" },
  -- { "navarasu/onedark.nvim" },
  -- { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  -- { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
  {
    "NTBBloodbath/sweetie.nvim",
  },
  -- { "rebelot/kanagawa.nvim" },
  -- { "EdenEast/nightfox.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      terminal_colors = true,
      --   -- transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        --   -- sidebars = "transparent",
        --   -- floats = "transparent"
      },
      on_highlights = function(highlights, colors)
        highlights.LineNr = { fg = "#9ece6a" }
        highlights.CursorLineNr = { fg = "#bb9af7" }
        highlights["@text.strong"] = { link = "Bold" }
        highlights["@text.emphasis"] = { link = "Italic" }
        highlights["@text.uri"] = { link = "URL" }
        highlights.URL = { link = "Link" }
        highlights.Link = { link = "markdownLinkText" }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "tokyonight" },
  },
}
