local util = require("util")

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        util.list_insert_unique(opts.ensure_installed, {
          "markdown",
          "markdown_inline",
          "regex",
          "scss",
          "sql",
          "vim",
          "vue",
          "yaml",
        })
      end
    end,
  },
}
