return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "html",
        "css",
        "javascript",
        "json",
        "toml",
        "markdown",
        "c",
        "bash",
        "lua",
        "tsx",
        "typescript",
      },

      autotag = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "css-lsp",
        "html-lsp",
        "deno",
        "prettier",
        "emmet-language-server",
        "json-lsp",
        "unocss-language-server",
        "shfmt",
        "shellcheck",
        "bash-language-server",
        "clangd",
        "clang-format",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = "pmizio/typescript-tools.nvim",

    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = { "Trouble", "TodoTrouble" },
    dependencies = {
      {
        "folke/todo-comments.nvim",
        opts = {},
      },
    },
    config = function()
      require("trouble").setup()
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "configs.zenmode"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      extensions_list = { "fzf", "terms", "nerdy", "media" },

      extensions = {
        media = {
          backend = "ueberzug",
        },
      },
    },

    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "2kabhishek/nerdy.nvim",
      "dharmx/telescope-media.nvim",
    },
  },

  "NvChad/nvcommunity",

  { import = "nvcommunity.editor.telescope-undo" },
}
