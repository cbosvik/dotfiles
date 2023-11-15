local function header()
  return require("util.logos")["random"]
end

return {
  "nvimdev/dashboard-nvim",
  opts = {
    config = {
      header = header(),
      -- header = vim.split([["test"]], "\n"),
    },
  },
}
