return {
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 1,
          width = 120,
          height = 1,
          options = {
            number = false,
            relativenumber = false,
            signcolumn = "no",
            list = false,
            cursorline = false,
          },
        },
      }

      require("twilight").setup {
        contenxt = -1,
        treesitter = true,
      }
    end,
  },

  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        context = -1,
        treesitter = true,
      }
    end,
  },
}
