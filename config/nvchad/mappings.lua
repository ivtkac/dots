---@type MappingsTable

local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- format with conform
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

M.telescope = {
  plugin = true,
  n = {
    ["<leader>ls"] = { "<cmd> Telescope lsp_document_symbols <CR>", "Document LSP Symbols" },
    ["<leader>lS"] = { "<cmd> Telescope lsp_workspace_symbols <CR>", "Workspace LSP Symbols" },
    ["<leader>lr"] = { "<cmd> Telescope lsp_references <CR>", "LSP References" },
    ["<leader>li"] = { "<cmd> Telescope lsp_implementations <CR>", "LSP implementations" },
    ["<leader>lD"] = { "<cmd> Telescoep lsp_type_definitions <CR>", "LSP Type Definition" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>" },
    ["<leader>ds"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

M.trouble = {
  plugin = true,
  n = {
    ["<leader>t"] = {
      "<cmd>TroubleToggle<CR>",
      "Toggle diagnostics",
    },
    ["<leader>td"] = {
      "<cmd>TodoTrouble keywords=TODO,FIX,FIXME,BUG,TEST,NOTE<CR>",
      "Todo/Fix/Fixme",
    },
  },
}

M.swenv = {
  plugin = true,
  n = {
    ["<leader>ps"] = {
      function()
        require("swenv.api").pick_venv()
      end,
      "Choose Python venv",
    },
    ["<leader>pe"] = {
      function()
        require("swenv.api").get_current_venv()
      end,
      "Show current Python venv",
    },
  },
}

M.comment = {
  plugin = true,
  n = {
    ["<leader>_"] = {
      function()
        require("Comment.api").toggle.blockwise.current()
      end,
      "Toggle comment",
    },
  },
}

return M
