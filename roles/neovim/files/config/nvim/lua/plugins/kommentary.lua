vim.api.nvim_set_keymap(
    "n",
    "<C-_>",
    "<Plug>kommentary_line_default",
    {}
)
vim.api.nvim_set_keymap(
    "i",
    "<C-_>",
    "<Esc><Plug>kommentary_line_default i",
    {}
)
