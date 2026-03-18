-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- window navigation from terminal and insert mode
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })

-- run pre-commit on all files from git root
vim.keymap.set("n", "<leader>gc", function()
  Snacks.terminal({ "pre-commit", "run", "--all" }, { cwd = LazyVim.root.git(), win = { position = "bottom" } })
end, { desc = "pre-commit run --all" })

-- cmake
vim.keymap.set("n", "<leader>mb", "<cmd>CMakeBuild<cr>", { desc = "CMake Build" })
vim.keymap.set("n", "<leader>mr", "<cmd>CMakeRun<cr>", { desc = "CMake Run" })
vim.keymap.set("n", "<leader>ms", "<cmd>CMakeSelectLaunchTarget<cr>", { desc = "CMake Select Launch Target" })


-- cmd+/ to toggle comments (normal + visual)
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Toggle comment" })

-- change ops go to black hole (preserve system clipboard)
vim.keymap.set({ "n", "v" }, "c", '"_c')
vim.keymap.set({ "n", "v" }, "C", '"_C')

-- move current buffer to new vertical split on the right
vim.keymap.set("n", "<leader>bL", function()
  local buf = vim.api.nvim_get_current_buf()
  local prev_buf = vim.fn.bufnr("#")
  vim.cmd("vsplit")
  vim.cmd("wincmd h")
  if prev_buf > 0 and vim.api.nvim_buf_is_valid(prev_buf) then
    vim.api.nvim_set_current_buf(prev_buf)
  end
  vim.cmd("wincmd l")
  vim.api.nvim_set_current_buf(buf)
end, { desc = "Move buffer to right split" })

-- outline / symbol picker
vim.keymap.set("n", "<leader>go", function()
  Snacks.picker.lsp_symbols()
end, { desc = "Outline symbols" })

-- <leader>l acts as <leader>c; Lazy moved to <leader>L
vim.keymap.set("n", "<leader>l", "<leader>c", { remap = true, desc = "+code" })
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
