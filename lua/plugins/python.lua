return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = { enabled = false },
                pyflakes = { enabled = false },
              },
            },
          },
        },
      },
    },
  },
}
