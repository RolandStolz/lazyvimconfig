return {
  "saghen/blink.cmp",
  opts = {
    sources = {
      providers = {
        copilot = {
          score_offset = -100,
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
