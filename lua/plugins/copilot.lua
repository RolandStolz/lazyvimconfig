return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  keys = {
    {
      "<D-Bslash>",
      function()
        vim.notify("Help me bro")
        require("copilot.suggestion").next()
      end,
      mode = "i",
      desc = "Copilot trigger suggestion",
    },
  },
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = false,
      hide_during_completion = vim.g.ai_cmp,
      keymap = {
        accept = "<Tab>",
        next = "<M-]>",
        prev = "<M-[>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
