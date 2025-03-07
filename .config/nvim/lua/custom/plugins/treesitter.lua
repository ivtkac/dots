return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    config = function()
      require("nvim-treesitter").setup {
        ensure_install = {
          "core",
          "stable",
        },
      }
    end,
  },
}
