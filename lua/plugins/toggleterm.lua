return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = { size = 15 },
    config = function(_, opts)
      local toggleterm = require("toggleterm")
      toggleterm.setup(opts)
      -- Fix: is_split() checks ui.is_float(self.window), but self.window is nil
      -- for unopened terminals. win_gettype(nil) falls back to the current window,
      -- which may not be a normal window (e.g. neo-tree), causing a false negative.
      local Terminal = require("toggleterm.terminal").Terminal
      local orig = Terminal.is_split
      Terminal.is_split = function(self)
        if not self.window then
          return self.direction == "vertical" or self.direction == "horizontal"
        end
        return orig(self)
      end
    end,
    keys = {
      {
        "<leader>ft",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local t = Terminal:new({ direction = "horizontal", dir = LazyVim.root() })
          t:toggle()
        end,
        desc = "Terminal (Root Dir)",
      },
      { "<Esc><Esc>", "<C-\\><C-n>", mode = "t", desc = "Exit terminal mode" },
    },
  },
}
