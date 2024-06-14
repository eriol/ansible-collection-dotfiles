return {
    "mhinz/vim-sayonara",
    config = function()
        local opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap("n", "gz", ":Sayonara!<cr>", opts)
    end,
}
