local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- CTRL+l to clear search highlighting.
map('n', '<C-l>', ':nohlsearch<cr><C-l>', opts)

-- Move into splits after creation.
map('n', '<C-w>v', '<C-w>v<C-w>w', opts)
map('n', '<C-w>s', '<C-w>s<C-w>w', opts)

-- Save with <leader> and s.
map('n', '<leader>s', ':w<cr>', opts)

-- Close all and exit.
map('n', '<leader>q', ':qa!<cr>', opts)

-- Fix broken Page Up/Down.
-- https://vimrc-dissection.blogspot.com/2009/02/fixing-pageup-and-pagedown.html
map('n', '<PageUp>', '1000<C-u>', opts)
map('n', '<PageDown>', '1000<C-d>', opts)
map('i', '<PageUp>', '<C-o>1000<C-u>', opts)
map('i', '<PageDown>', '<C-o>1000<C-d>', opts)
