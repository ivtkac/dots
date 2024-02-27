---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    ["<leader>co"] = {
      function()
        vim.lsp.buf.code_action {
          apply = true,
          context = {
            only = { "source.organizeImports" },
            diagnostics = {},
          },
        }
      end,
      "Organize imports",
    },
  },

  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!
M.telescope = {
  plugin = true,
  n = {
    ["gs"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Document LSP Symbols" },
    ["gS"] = { "<cmd> Telescope lsp_workspace_symbols <CR>", "Workspace LSP Symbols" },
  },
}

return M
