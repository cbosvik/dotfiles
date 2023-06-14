local util = require("util")

return {

  -- Add C# to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        util.list_insert_unique(opts.ensure_installed, "c_sharp")
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        util.list_insert_unique(opts.ensure_installed, "netcoredbg")
      end
    end,
  },
  -- Correctly setup lspconfig for C# 🚀
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     servers = {
  --       -- Ensure mason installs the server
  --       omnisharp = {
  --         organize_imports_on_format = true,
  --         enable_import_completion = true,
  --       },
  --     },
  --     -- configure omnisharp to fix the semantic tokens bug (really annoying)
  --     setup = {
  --       omnisharp = function(_, _)
  --         ---@param input string
  --         ---@return string
  --         local function toCamelCase(input)
  --           local words = {} ---@type string[]
  --           local sanitized_input = input:gsub("[^%w%s]", " ")
  --           for word in sanitized_input:gmatch("%S+") do
  --             table.insert(words, word:lower())
  --           end
  --
  --           for i = 2, #words do
  --             words[i] = words[i]:gsub("^%l", string.upper)
  --           end
  --
  --           return table.concat(words)
  --         end
  --
  --         require("lazyvim.util").on_attach(function(client, _) ---@param client lspconfig.options.omnisharp
  --           if client.name == "omnisharp" then
  --             local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers ---@type string[]
  --             for i, v in ipairs(tokenModifiers) do
  --               if v:match(" name$") then
  --                 tokenModifiers[i] = v:gsub(" name$", "")
  --               end
  --               tokenModifiers[i] = toCamelCase(tokenModifiers[i])
  --             end
  --
  --             local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes ---@type string[]
  --             for i, v in ipairs(tokenTypes) do
  --               if v:match(" name$") then
  --                 tokenTypes[i] = v:gsub(" name$", "")
  --               end
  --               tokenTypes[i] = toCamelCase(tokenTypes[i])
  --             end
  --           end
  --         end)
  --         return false
  --       end,
  --     },
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#omnisharp
        omnisharp = {
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
      },
      setup = {
        omnisharp = function()
          require("lazyvim.util").on_attach(function(client, bufnr) ---@param client lspconfig.options.omnisharp
            if client.name == "omnisharp" then
              local map = function(mode, lhs, rhs, desc)
                if desc then
                  desc = desc
                end
                vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
              end

              -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
              local function toSnakeCase(str)
                return string.gsub(str, "%s*[- ]%s*", "_")
              end

              local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
              for i, v in ipairs(tokenModifiers) do
                tokenModifiers[i] = toSnakeCase(v)
              end
              local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
              for i, v in ipairs(tokenTypes) do
                tokenTypes[i] = toSnakeCase(v)
              end

              -- C# keymappings
              -- stylua: ignore
              map("n","<leader>td","<cmd>w|lua require('neotest').run.run({vim.fn.expand('%'), strategy = require('neotest-dotnet.strategies.netcoredbg'), is_custom_dotnet_debug = true})<cr>", "Debug File")

              -- stylua: ignore
              map("n","<leader>tL","<cmd>w|lua require('neotest').run.run_last({strategy = require('neotest-dotnet.strategies.netcoredbg'), is_custom_dotnet_debug = true})<cr>", "Debug Last")

              -- stylua: ignore
              map("n","<leader>tN","<cmd>w|lua require('neotest').run.run({strategy = require('neotest-dotnet.strategies.netcoredbg'), is_custom_dotnet_debug = true})<cr>", "Debug Nearest")
            end
          end)
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    opts = {
      setup = {
        netcoredbg = function(_, _)
          local dap = require("dap")

          local function get_debugger()
            local mason_registry = require("mason-registry")
            local debugger = mason_registry.get_package("netcoredbg")
            return debugger:get_install_path() .. "/netcoredbg"
          end

          dap.configurations.cs = {
            {
              type = "coreclr",
              name = "launch - netcoredbg",
              request = "launch",
              program = function()
                return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
              end,
            },
          }
          dap.adapters.coreclr = {
            type = "executable",
            command = get_debugger(),
            args = { "--interpreter=vscode" },
          }
          dap.adapters.netcoredbg = {
            type = "executable",
            command = get_debugger(),
            args = { "--interpreter=vscode" },
          }
        end,
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "Issafalcon/neotest-dotnet",
    },
    opts = function(_, opts)
      util.list_insert_unique(opts.adapters, require("neotest-dotnet"))
    end,
  },

  require("nvim-treesitter.configs").setup({
    context_commentstring = {
      enable = true,
      config = {
        c_sharp = "// %s",
      },
    },
  }),
}
