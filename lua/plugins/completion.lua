return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      ghost_text = { enabled = false },
    },
    sources = {
      providers = {
        copilot = {
          enabled = false,
        },
      },
    },
    keymap = {
      preset = "default",
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Esc>"] = { "cancel", "fallback" },
    },
  },
}
