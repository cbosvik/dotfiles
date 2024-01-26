return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "jvgrootveld/telescope-zoxide",
  },
  keys = {
    { "<leader>fz", "<cmd>Telescope zoxide list<cr>", desc = "Recent Folders" },
  },
}
