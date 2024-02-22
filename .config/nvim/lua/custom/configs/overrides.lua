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
  },
}

M.treesitter_context = {
  throttle = true,
  max_lines = 0,
  patterns = {
    default = {
      "class",
      "function",
      "method",
    },
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
    "ruff-lsp",
    "debugpy",

    -- shell stuff
    "shfmt",
  },
}

M.copilot = {
  suggestion = {
    enable = true,
  },
  panel = {
    enable = true,
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

M.neogit = {
  signs = { section = { "", "" }, item = { "", "" } },
  disable_commit_confirmation = true,
  integrations = { diffview = true },
}

M.copilot = {
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<A-l>",
      accept_word = false,
      accept_line = false,
      next = "<A-]>",
      prev = "<A-[>",
      dismiss = "<C-]>",
    },
  },
}

return M
