require("todo-comments").setup({})

vim.api.nvim_set_keymap("n", "<leader>xt", "<cmd>TodoTelescope<cr>", { silent = true, noremap = true })
