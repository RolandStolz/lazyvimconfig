return {
  -- { import = "lazyvim.plugins.extras.lang.clangd" },
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    opts = {
      cmake_executor = {
        name = "quickfix",
        opts = { position = "belowright", size = 20 },
      },
      cmake_runner = {
        name = "toggleterm",
        opts = { direction = "float" },
      },
    },
  },
}
