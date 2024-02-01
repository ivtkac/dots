return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                typeCheckingMode = "basic",
              },
              inlayHints = {
                variableTypes = true,
                callArgumentNames = "partial",
                functionReturnTypes = true,
                pytestParameters = true,
              },
            },
          },
        },
      },
    },
  },
}
