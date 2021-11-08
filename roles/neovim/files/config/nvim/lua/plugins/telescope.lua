require('telescope').setup{}


vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>Telescope<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope git_files<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>Telescope live_grep<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", ";", "<cmd>Telescope buffers<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { noremap = true })
