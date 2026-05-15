return {
  { import = "lazyvim.plugins.extras.lang.python" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        pylsp = { enabled = false },
        pyright = { enabled = false },
        basedpyright = {
          enabled = true,
          settings = {
            basedpyright = {
              typeCheckingMode = "standard",
            },
          },
        },
      },
    },
  },
  {
    "piersolenski/telescope-import.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").load_extension("import")
    end,
    keys = {
      { "<leader>ci", "<cmd>Telescope import<cr>", desc = "Import", ft = "python" },
    },
  },
}
