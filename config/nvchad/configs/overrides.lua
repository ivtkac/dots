local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "python",
    "markdown",
    "markdown_inline",
    "yaml",
    "dockerfile",
    "toml",
    "rust",
  },
  indent = {
    enable = true,
    -- disable = {
    --    "python"
    -- }
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- python stuff
    "pyright",
    "mypy",
    "ruff",
    "debugpy",
    "python-lsp-server",
    "black",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.copilot = {
  suggestion = {
    enable = false,
  },
  panel = {
    enable = false,
  },
}

M.cmp = {
  sources = {
    { name = "nvim_lsp", group_index = 2 },
    { name = "copilot", group_index = 2 },
    { name = "luasnip", group_index = 2 },
    { name = "buffer", group_index = 2 },
    { name = "nvim_lua", group_index = 2 },
    { name = "path", group_index = 2 },
  },
}

return M
