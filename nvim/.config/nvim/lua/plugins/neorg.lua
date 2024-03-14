return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    ft = "norg", -- lazy load on filetype
    cmd = "Neorg", -- lazy load on command, allows you to autocomplete :Neorg regardless of whether it's loaded yet
    --  (you could also just remove both lazy loading things)
    -- priority = 30, -- treesitter is on default priority of 50, neorg should load after it.
    -- lazy = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    init = function()
      local wk = require("which-key")
      wk.register({

        ["<leader>n"] = {
          name = "+neorg",
          c = { "<cmd>Neorg toc split<cr>", "Open table of contents" },
          m = { "<cmd>Neorg<cr>", "Open Neorg menu" },
          n = {
            name = "+notes",
            n = { "<cmd>Neorg keybind norg core.dirman.new.note<cr>", "New note" },
            c = { "<cmd>Neorg keybind all core.looking-glass.magnify-code-block<cr>", "Edit code block" },
          },
          j = {
            name = "+journal",
            t = { "<cmd>Neorg journal today<cr>", "Open journal today" },
            m = { "<cmd>Neorg journal tomorrow<cr>", "Open journal tomorrow" },
            y = { "<cmd>Neorg journal yesterday<cr>", "Open journal yesterday" },
            c = { "<cmd>Neorg journal custom<cr>", "Open journal custom date" },
            o = { "<cmd>Neorg journal toc open<cr>", "Open journal table of contents" },
            u = { "<cmd>Neorg journal toc update<cr>", "Update journal table of contents" },
            w = {
              name = "+weather",
              s = { "i- Weather: Sunny <esc>", "Sunny" },
              c = { "i- Weather: Cloudy <esc>", "Cloudy" },
              r = { "i- Weather: Rainy <esc>", "Rainy" },
            },
          },
          t = {
            name = "+tasks",
            m = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_cycle<cr>", "Cycle task state" },
            -- n = {
            --   "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_cycle_reverse<cr>",
            --   "Reverse cycle task state",
            -- },
            n = { "i- ( ) ", "New Task" },
            d = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_done<cr>", "Mark task done" },
            u = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_undone<cr>", "Mark task undone" },
            p = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_pending<cr>", "Mark task pending" },
            c = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_cancelled<cr>", "Mark task cancelled" },
            i = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_important<cr>", "Mark task important" },
            r = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_recurring<cr>", "Mark task recurring" },
          },
          i = { "<cmd>Neorg index<cr>", "Open index" },
        },
      })
    end,
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
          ["core.integrations.nvim-cmp"] = {},
          ["core.integrations.treesitter"] = {},
          ["core.concealer"] = {
            config = {
              icon_preset = "varied",
              icons = {
                delimiter = {
                  horizontal_line = {
                    highlight = "@neorg.delimiters.horizontal_line",
                  },
                },
                code_block = {
                  content_only = true,
                  width = "fullwidth",
                  padding = {},
                  conceal = true,
                  -- nodes = { "ranged_verbatim_tag" },
                  highlight = "CursorLine",
                  -- insert_enabled = true,
                },
              },
            },
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "/Users/cb/code/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.qol.toc"] = {},
          ["core.qol.todo_items"] = {},
          ["core.export"] = {},
          ["core.export.markdown"] = { config = { extensions = "all" } },
          ["core.summary"] = {},
          -- ["core.tempus"] = {},
          ["core.ui.calendar"] = {},
          ["core.journal"] = {
            config = {
              strategy = "nested",
              workspace = "notes",
            },
          },
          ["core.esupports.metagen"] = { config = { type = "auto", update_date = true } },
          ["core.looking-glass"] = {},
        },
      })
    end,
  },
}
