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

-- <leader>l acts as <leader>c; Lazy moved to <leader>L
vim.keymap.set("n", "<leader>l", "<leader>c", { remap = true, desc = "+code" })
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
