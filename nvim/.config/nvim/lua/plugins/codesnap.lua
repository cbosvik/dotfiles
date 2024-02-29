local wk = require("which-key")
return {
  {
    "mistricky/codesnap.nvim",
    build = "make",
    cmd = "CodeSnapPreviewOn", -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
    wk.register({
      ["<leader>c"] = {
        S = { "<cmd>CodeSnapPreviewOn<cr>", "CodeSnap" },
      },
    }),
    config = function()
      require("codesnap").setup({
        mac_window_bar = true, -- (Optional) MacOS style title bar switch
        opacity = true, -- (Optional) The code snap has some opacity by default, set it to false for 100% opacity
        watermark = (vim.fn.getcwd():gsub(os.getenv("HOME"), "~")), -- (Optional) you can custom your own watermark, but if you don't like it, just set it to ""
        preview_title = "CodeSnap.nvim", -- (Optional) preview page title
        editor_font_family = "CaskaydiaCove Nerd Font", -- (Optional) preview code font family
        watermark_font_family = "Pacifico", -- (Optional) watermark font family
      })
    end,
  },
}
