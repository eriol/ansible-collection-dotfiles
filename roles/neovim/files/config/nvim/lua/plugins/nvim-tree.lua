require("nvim-tree").setup({
	update_focused_file = {
		enable = true,
	},
	view = {
		width = 35,
	},
})

vim.g.nvim_tree_quit_on_open = 1

vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>NvimTreeToggle<cr>", {})

vim.cmd "autocmd BufWinEnter NvimTree setlocal cursorline"
