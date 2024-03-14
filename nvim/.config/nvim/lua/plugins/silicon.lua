return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    init = function()
      local wk = require("which-key")
      wk.register({
        ["<leader>c"] = {
          S = { "<cmd>Silicon<cr>", "Snapshot Code" },
          mode = { "v" },
        },
      })
    end,
    config = function()
      require("silicon").setup({
        font = "jetbrainsmono nerd font=34",
        theme = "base16",
        background = "#492db6",
        to_clipboard = true,
        window_title = function()
          return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ":~:.")
        end,
      })
    end,
  },
}
