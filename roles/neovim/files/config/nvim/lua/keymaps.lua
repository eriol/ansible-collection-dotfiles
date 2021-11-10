local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- CTRL+l to clear search highlighting.
map('n', '<C-l>', ':nohlsearch<cr>', opts)

-- Open the terminal.
map('n', '<C-t>', ':Term<cr>', { noremap = true })

-- Move into splits after creation.
map('n', '<C-w>v', '<C-w>v<C-w>w', opts)
map('n', '<C-w>s', '<C-w>s<C-w>w', opts)

-- Save with <leader> and s.
map('n', '<leader>s', ':w<cr>', opts)

-- Close all and exit.
map('n', '<leader>q', ':qa!<cr>', opts)
