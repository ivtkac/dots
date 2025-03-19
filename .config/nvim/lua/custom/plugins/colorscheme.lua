return {
  {
    lazy = false,
    priority = 1000,
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = true,
    config = function()
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  {
    "Mofiqul/adwaita.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      vim.cmd.colorscheme "adwaita"
    end,
  },
}
