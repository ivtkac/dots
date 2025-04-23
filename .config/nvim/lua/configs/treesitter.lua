require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "bash",
          "python",
          "yaml",
          "hcl", -- HashiCorp Configuration Language (Terraform)
          "json",
          "lua",
          "vim",
          "markdown",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
})
