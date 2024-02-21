return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_instaleld = { "lua", "javascript", "python", "toml", "bash", "html", "vim" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
